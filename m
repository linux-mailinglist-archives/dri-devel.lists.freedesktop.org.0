Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2141A570E32
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 01:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C7089C1C;
	Mon, 11 Jul 2022 23:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3CA91BB9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 23:22:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id va17so11443149ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2g/SRedCTGa3FW1fDb+EmyQOw6AOS/KFbwj3cy8GxXM=;
 b=fAXlbz7CXR4/Kg6TafHz6Jq1ObQFjoGNWKETyL5sK1ogIAZ7eh86yG8EZsMgg7dLi9
 i4WwRk7mJjU5ORPXarDHnJ6nA7DhMcGY5zkpAGZAjIj2sF0ZoSiyOfhWy3cqaB77JJH2
 dTkyj2oPvErEYbjlvTsVHSPFBKhF6aamfznp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2g/SRedCTGa3FW1fDb+EmyQOw6AOS/KFbwj3cy8GxXM=;
 b=RyqVdHabIGT2rNfm+8D+XwH7jAdbZ/HqWAheuKINHJMofmuug9yL4vrI0sBVpGf4BN
 V2OXwteQvIjjxFhXHjUmJM5S9oCDtpMLeptssC5naMibA4tN7HghpLY+DVRk4hhbLm62
 4hKqU7ZXxQ4+R7LJ7dH+od/1wYiME84NcXNlyQ276nq8Uq490tyEjnw7w0zr55jLwbV/
 E8EDO9mO3jDbqA/fplpPxVkvbT/2UHPdjpYK482478+hN2JwhVz7yY/Uqd/haTcj1Z81
 X2FarIOaIisaBawlkhf1+MymHBdwNXsYK/iSCV8XV+sq4zVatRswIHFcnBTFOfOpW+pZ
 0hOw==
X-Gm-Message-State: AJIora+o/c5ECRgUq1+/M1lh1K03LaLsadnXUoqGG9bA5qWcUbhY1Uyh
 5bMl1yDvMgBVLQqtso0XWC1IQd/eUTtN9UJdEnE=
X-Google-Smtp-Source: AGRyM1sTKFeOMjHcoUpRPBlejE3FcI/sBRdXM7v7sYhvMsX1mograDktwPAYaWpIN0J5LTN5mQxUsQ==
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr21290198ejc.631.1657581759204; 
 Mon, 11 Jul 2022 16:22:39 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 j17-20020a17090623f100b00726298147b1sm3109826ejg.161.2022.07.11.16.22.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 16:22:37 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id d16so8879357wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:22:37 -0700 (PDT)
X-Received: by 2002:adf:d1e9:0:b0:21b:c8f8:3c16 with SMTP id
 g9-20020adfd1e9000000b0021bc8f83c16mr18888013wrd.659.1657581756957; Mon, 11
 Jul 2022 16:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
In-Reply-To: <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 16:22:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
Message-ID: <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] drm/msm: Fix cx collapse issue during recovery
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> There are some hardware logic under CX domain. For a successful
> recovery, we should ensure cx headswitch collapses to ensure all the
> stale states are cleard out. This is especially true to for a6xx family
> where we can GMU co-processor.
>
> Currently, cx doesn't collapse due to a devlink between gpu and its
> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
> that the iommu driver removes its vote on cx gdsc.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4d50110..7ed347c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
>          */
>         gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>
> -       gpu->funcs->pm_suspend(gpu);
> -       gpu->funcs->pm_resume(gpu);
> +       /*
> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
> +        * First drop the usage count from all active submits
> +        */
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_put(&gpu->pdev->dev);
> +
> +       /* And the final one from recover worker */
> +       pm_runtime_put_sync(&gpu->pdev->dev);
> +
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_get(&gpu->pdev->dev);
> +
> +       pm_runtime_get_sync(&gpu->pdev->dev);

In response to v1, Rob suggested pm_runtime_force_suspend/resume().
Those seem like they would work to me, too. Why not use them?
