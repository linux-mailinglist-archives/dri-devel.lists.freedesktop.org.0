Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628619F2413
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 14:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D4710E387;
	Sun, 15 Dec 2024 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tWxFFh8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01810E386
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:49 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30039432861so37071611fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268247; x=1734873047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8Lufl0ILgKZ9FP7Gdlued8m2MWHGsVjFWpSoKBOb0E=;
 b=tWxFFh8Cu2Wd9dRdZfyu8TX+VRg/yXXn1IOoG4HEIRN1iLDvPfWg9qUQVbTr8KVwW3
 Ln+S6j/InEm5jUirtdkpyPEqsAvgcVg66xPtLJVJFvXmwsfSx2odGGKwft3S7/opWfHR
 RBhjN+dzaujtx/cRe0moOAZ7OpnZc2MMDh9NGFjDHJxCfauXTvn70TRhV4/gw1Y6v7Y6
 +00g4TUOTV3YEU3uUHaPP04IcB3uLl88dElAD1Pms9kiQP7lVjKT//mGsiH9879lDHA5
 VnVekLLXxVgcShWLvDuLTc8NvMhqedFlKGYFCbHjSwWKF/UCUeyrqxmUIvk9+lxJMpp9
 zYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268247; x=1734873047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8Lufl0ILgKZ9FP7Gdlued8m2MWHGsVjFWpSoKBOb0E=;
 b=N9q0if5CxdU/UoaOSYwrHyI/emhYz6qAPFzMRbU4jlkPjPkGFBrd1ylBu2iJRaF1iZ
 fWXxiJ5Yam1EgYdRtlm71F6mpy+2k3cU0fxRZCu3F+LwIUuQVUURMEknYYdSzcRQzUq1
 jQEt7eZRqSstSDh6rD5ap0lbk9CGGBQOhwd8qDD2rCz2e93wlDs/H755lr86kUbypozO
 0p/vRfXnEE33mqPkMNs+0t/oFXBb+3O02chmS6/1C0h73fYCO/0jHyeI6mB6bESQUaMA
 adkM9a0ozEAkldCPC8yc4y4ES+y69MQ4eRUdEVfjehKn5iT+/6t4saj5R8t+FRXP8vvH
 +Njg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJdncKaAvk8C4ugJkPCbS0y8ucDctZtNPolILp5S7r92MYsQ4Gb18Yfa3d9fN4GJ6YvQVuz/Htfls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYPBV5+IrO1uX9uLMLQKxY5Nbo5I5cFpHoLIE6ALQ2WbnUJBNl
 2HzEGIQrvsVqeFD/qmSizx1p4KpxqKfDsOthSgegJsMXYINZEkYLbVPVpulNu8k=
X-Gm-Gg: ASbGncujVED884OzJRMGddiDRNpKjpEjaczzpvXW5w7drcCEosQYmMm5AtG6/2gbGKX
 iVf3Cm3r4kIcprvb2R1XxvJjGn88nEDpiBAXKlCtJ+FatE2nxPAMrLu1hFSNyKpBRK1jc+TaBC5
 Iy9Ijqc78c46KrZdC5I0ruhffgida7t7F+K+QxYt2apIMT41txSgz+pKsTCCM8a1ObRTHOmre2G
 JAJZRrf2Vh4d0pbhz1LolahRG17nVig6txX2R09SmCCYGUlXMWCGLStnRv1Dbh3pcopnipV
X-Google-Smtp-Source: AGHT+IGqHIES4nMAi89BEi/1nE8BdUE7Xhkvgu1X5vkOxL6g5oVRbKfjkZ5/mlLOzrD9vjkEYsggXw==
X-Received: by 2002:a05:6512:e98:b0:540:2122:fae9 with SMTP id
 2adb3069b0e04-540915e2c9emr3090946e87.46.1734268247484; 
 Sun, 15 Dec 2024 05:10:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/3] drm/msm/dpu: support virtual wide planes
Date: Sun, 15 Dec 2024 15:10:40 +0200
Message-Id: <173426667305.2196979.4925128538148948458.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
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


On Sun, 15 Dec 2024 14:40:15 +0200, Dmitry Baryshkov wrote:
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
> 
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
> 
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: add support for virtual planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/774bcfb73176
[2/3] drm/msm/dpu: allow using two SSPP blocks for a single plane
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8c62a31607f6
[3/3] drm/msm/dpu: include SSPP allocation state into the dumped state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d82c9281189d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
