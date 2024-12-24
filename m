Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5AF9FC24C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 21:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F96710E1B2;
	Tue, 24 Dec 2024 20:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v1anioXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F88210E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 20:41:16 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso61870361fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 12:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072875; x=1735677675; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
 b=v1anioXEYaDpJkSou+nZdeZFGnfAxAfUyFfR9g4cwpafM9rUr2pKI0xYS6RCZDvdO2
 iMTSrztbXfW10j9dKUwcxVaGYIRQDuigM0+lX2/y3kJmlWiHOsteZoHHUYyhgmMLqHat
 brBOQJLhLvDDQMbPg6/ElETDm3Odl4JYQ8SeYreenekxq138IZICrShnLx4Y4cZQLUt3
 qsMUvXqw/z5TN+ZnrO59Cy/P91Bd6KAe2GTgC5SjwE48SaTfGL14dGsQpqRaVv2CZz8N
 bHZqS3WIuZq99B/+7O6algqilQT+Q2J10r0swjWU3cQzlOyWcROwWDNaNpx70sEG79Ot
 14QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072875; x=1735677675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4tWENes0KylDXpgmRg5/jOA7aphz2fds2f1aAKkLl0=;
 b=RyWTHXVspW8SchXX4Pbum/3vVodFEZpL2b375YbXztqnrr3KrHq94yCvFl2Zj+LG27
 WKyNKqmWGX1aff74eUB7SUtPxzWKXNo2AMCUzfyc3bd/YP/44FPfZAYGz78ctEhXLZdd
 U5rc14C/jziUJLEtEbpbDmSNyOS6s/upQDC9N6gNEtc+vIGcV69cBS0w1Tcdby4KGnlB
 ebs/RDSBGfC1O0jcIEPDjDsaKt4udCjZCreStbjnCaPe1fmraEeaiHy4ZCDMQtSZ4XLs
 MwI7fqP4JnqgWRxOQqgnjxQN4+OgcMaDtGRg298M9kdu6RFm5bUD9fcrpHE6oPhXXqQd
 43kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP+wZeOkfhB1BXKeBSsBTDiAsXJ+7yQoteEiSBV0u3gV+jYfSw72RSWURyMDn1c5tWDz8spHE0JGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuBKa8SlhgXxk/3nm9XMKz4qD09A0BV7ruVbbzRLBSlptHwROq
 EmrAsIo1roL2oX7lbX7KzYH704qRjNA8Ufj8zfeJ7mPjCNYd39y+t2NvVnWkoSo=
X-Gm-Gg: ASbGnctfXfsQGvAncQ197/Kv87YOv2USZm4Q6qZAEIInqGJfYU9agLo7qpPq2GD+qq3
 7zNbqP+C9704NZEl4UftW191lZ4CnIaGM0V2eFwcESJW113KIESypt4GTsyUG5y5V2E+UHlexgB
 WLZFdfeqK/mQ/T2dwxbecQYneLaCN36NGXagc7PuMw727ManM5nxx9upNdtx7gNorYc//4D/Ihy
 uTtUfcMk/YmgbiJ9J9VlLUhLZLyEkn/ZokN0FCLli/V/6FuzUvQjopexUb0OB2F+hDZOObU
X-Google-Smtp-Source: AGHT+IHhxMcz5LHKf4mzblqpQkrsMBpik6mK2OqeNWh9Gv38C8o0kVzMu1K4zlNWLn6efCKGHqg6Jg==
X-Received: by 2002:a05:651c:b14:b0:302:4147:178d with SMTP id
 38308e7fff4ca-304685c1ad4mr72800031fa.28.1735072874813; 
 Tue, 24 Dec 2024 12:41:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] drm/msm/dp: perform misc cleanups
Date: Tue, 24 Dec 2024 22:41:01 +0200
Message-Id: <173507275854.561903.1008800091022451905.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
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


On Mon, 16 Dec 2024 00:44:05 +0200, Dmitry Baryshkov wrote:
> - Fix register programming in the dp_audio module
> - Rework most of the register programming functions to be local to the
>   calling module rather than accessing everything through huge
>   dp_catalog monster.
> 
> 

Applied, thanks!

[01/16] drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ba3627bf82c1
[02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
        https://gitlab.freedesktop.org/lumag/msm/-/commit/486de5eec0d8
[03/16] drm/msm/dp: drop obsolete audio headers access through catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0caebf37960
[04/16] drm/msm/dp: drop struct msm_dp_panel_in
        https://gitlab.freedesktop.org/lumag/msm/-/commit/429783c22fe9
[05/16] drm/msm/dp: stop passing panel to msm_dp_audio_get()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c9261bcc1546

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
