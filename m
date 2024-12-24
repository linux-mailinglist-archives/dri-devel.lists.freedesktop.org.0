Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9649FC24A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 21:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737C510E296;
	Tue, 24 Dec 2024 20:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bgpm2SXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67710E296
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 20:41:14 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30039432861so58970001fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 12:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072872; x=1735677672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxdP0DwV1vvdjxVFkfCt8h2E2fTP29N8mLt/rhTucSs=;
 b=Bgpm2SXPvzSXAYNhiYdrnEo6HTaSadiLEdE3x/3wgc7CPJo7HY2svZLtfWLYVjJGZ3
 QU5JnDw/UpAlaClzWVfL3LU0mt92TEPth1D+Wk9VJ3DYkaCDzZXexzrog4qlP+P65c2V
 S/Kp+BQHlee0oHmHlUBfNaZI+llp9vCzGuV4tHNK0k0Z9t+6BG+L1F/ZMRU7JjhBonuQ
 Y+eE9xO7i0yPOs0517jbD61Sm7qSmKNnWjLCIKzQwb/GIgeHylg92SnLA1GG5qBLDVIa
 6fV4fACHfgpKvyL4DDQyljRTpUx2ibcpsvI07YknPZhfJ57Ykg7uEpsAVhNlt1GNp6lf
 aKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072872; x=1735677672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxdP0DwV1vvdjxVFkfCt8h2E2fTP29N8mLt/rhTucSs=;
 b=Ct6+Aeo9c8tBpXfK4+tZlRMeYY7sF4Fchriefvxxwi4hku01v0ytrWwpTKchqppWVI
 5ZVW6viTBeojYmv1ljF9Fvsw7yt+S+u7NIdu3PO+9a9AazV8vXVBcBZ7mVYAQrjc6LWK
 OvsVINvJzhbQa2fXtX+H+Nl49c4mDPnnamVxLAhxIyksqCUZj1amKrl3DnspLEFfts4s
 4J3u+yJU7QYclcXoWzNlRdhrMKxXq9QDHudO26xituhFwEQYgB3VPP1SYfkDlbyIL1fp
 9Mpxtv30Wbg/r5ua98R9+AwzsAb+wy3kbtXHNsedyT+loM7BoKKRwvXW3AeZ5AWa2j8L
 IoEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxc5OXPji1XHrrGhKpJLDCSUC+thekWubB+wIF1k+8xDFLsIa/+QMWXRuHohVLkuX7149BpS36vTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfUj/h9TqtNl9dsUb4SQgc3HzELikOFKfl85hfWlyWUiyF3ZNR
 Fpy/QwHVM4NdXEI+7jWQwBXk51IlPRqSZA72smap9gcOZ3PMXb8V9d44LH/0jsA=
X-Gm-Gg: ASbGncu9rN5X8LKDBoDkTJoIow1/lMaikmPw3Gd1b/9W9FlotdmAl2ouIn4G7HAWn/C
 Fi+3jplF+noElJ368KFXhEhq/n/c5d5xi0W9qowwN1gNb/v4fItRUHzlDVoBn5E4Kn01Q9LujyJ
 FXMOlsat+yjyZhRdyy+3Ezp2yUCa8opZF4gAovUoMIOtHqBsxBVUUQDPsedyq0QZwg9Up9HTbmE
 Ke+qsrNoRBfetEurvU/A8u6MsFdS9wsDmRP8p888Lc/Qm2eLtWjptlwwb90N4LmnX/kNiSN
X-Google-Smtp-Source: AGHT+IHbSFzE8H93kHj+1AlvSfiTODvTKnC9+woz5LfzDEW2hwU6oeqa+kX5d4R5Hd/NRNkq+vXYZA==
X-Received: by 2002:a05:651c:2115:b0:302:2598:de91 with SMTP id
 38308e7fff4ca-304685484a2mr59824641fa.16.1735072872465; 
 Tue, 24 Dec 2024 12:41:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 0/8] drm/msm/dpu: catalog corrections
Date: Tue, 24 Dec 2024 22:41:00 +0200
Message-Id: <173507275853.561903.15400337552406278875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 20 Dec 2024 03:28:28 +0200, Dmitry Baryshkov wrote:
> After checking the DSPP units in the catalog vs the vendor devicetrees,
> link several DSPP units to the corresponding LM units. Each correction
> is submitted separately in order to be able to track and apply / skip
> them separately based on the feedback from Qualcomm. I think at this
> point only CrOS compositor actually uses CTM, so these changes do not
> need to be backported (none of the CrOS-enabled devices are touched by
> these patches).
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: provide DSPP and correct LM config for SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9a20f33495bf
[2/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ac440a31e523
[3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0986163245df
[4/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8252028092f8
[5/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/42323d3c9e04
[6/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e21f9d85b053
[7/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d3ca0915aa3
[8/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3a7a4bebe0db

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
