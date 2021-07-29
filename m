Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D293DA7C1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84D66EDDA;
	Thu, 29 Jul 2021 15:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5356EDD3;
 Thu, 29 Jul 2021 15:43:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m12so2692822wru.12;
 Thu, 29 Jul 2021 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wUU+uqMK2XMkpAz+JRAI4WjTrxOmVumYKbTDtChNDWo=;
 b=YYfeUO7J0s+htMw0H3O22n/vBXHjlJQeKQWQcryPN1ybpayRJQVsIaaOEbRyDuzpKG
 5FP3L2sftm+c1akwosWgGa0am6YFfVvoUNbMQqWxyVZtJJnhLpEO4cT7XDMM4ppOnz/E
 7uYx8u9ynh9RTI7cpeDRt5ThvkKdhECzwVOx89Yn1xyXnIyR262UOYj0vTEaEcKK2ssh
 No4uIzo4xs6EcUcXNGlF1poVXzC52DmegInCEYRcnWnRWQVDIpGQBnnlIU6bExQrPR7a
 Oru8g63IUkt4ZQM5NvDMka409VALFyI04q8aLhbM97lVIsnIRZ+WZIv1F4+wSLBvyP/U
 fYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wUU+uqMK2XMkpAz+JRAI4WjTrxOmVumYKbTDtChNDWo=;
 b=VGOy/K7E51+hrn6abJAt3Usa095HnKc4k/8HfT6xjsOINzur4L3o7/OVr34ezrPAFi
 8yKMyoPfV5kZjQriUGhzqy8MlujsWKNeJmgJSlSr5wkuIr8FCbiWi2EDHQyCP0Xzp3Yv
 zyd8ub7/bBpPaMvLjxGjeqZxj/urVQVk/bO4e1vF5nCPyETqwOfLi2xaEfwnqSml19VH
 Cr2FqnnxSQWSpiLM1tiMzHA1R80Tvn9SfSCpzsNuje75NkojUst5/tUe3gGZ2+bIVK+o
 brbnm1LtTdZIj0S2yR+qx0e2kRgpgAsDmybMRS6Hrvtiv3fgNabpUNGBFKpUv3HlDo7J
 3CTw==
X-Gm-Message-State: AOAM531nuf02NhzF3dHYUAZPA6wXPWRfT4yPqwbjS3MAyvALiywn3bBw
 8z+v0WxmS+1jSomk3Sm34MBjZGgYjzb6cPe4jDA=
X-Google-Smtp-Source: ABdhPJxAJP84bulTj7l8JqyLiyhO41g1incA4XrhGVMOuwHSwF6m47BA2XAHlmhzvHLRiVNdg1NiWrZIEAYeNdzQexE=
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr5511562wrt.132.1627573379809; 
 Thu, 29 Jul 2021 08:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210729200230.v2.1.I110b87677ef16d97397fb7c81c07a16e1f5d211e@changeid>
 <20210729200230.v2.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
 <CAF6AEGtv0R=SjwpV7NEX6-4sHTF_CxbqgFXNWN+PT9hJJb7N2A@mail.gmail.com>
 <cf9effea-43dc-0ea6-6e73-29e6beff607f@codeaurora.org>
In-Reply-To: <cf9effea-43dc-0ea6-6e73-29e6beff607f@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 08:47:09 -0700
Message-ID: <CAF6AEGtypTgeCdo_yzywEVyzEUG1H_w_r_29dS9MYRpSNvit8Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/a6xx: Use rev to identify SKU
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 8:36 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 7/29/2021 8:57 PM, Rob Clark wrote:
> > On Thu, Jul 29, 2021 at 7:33 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >>
> >> Use rev instead of revn to identify the SKU. This is in
> >> preparation to the introduction of 7c3 gpu which won't have a
> >> revn.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >>
> >> (no changes since v1)
> >>
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++------
> >>   1 file changed, 5 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 183b9f9..0da1a66 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1675,11 +1675,11 @@ static u32 a618_get_speed_bin(u32 fuse)
> >>          return UINT_MAX;
> >>   }
> >>
> >> -static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
> >> +static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
> >>   {
> >>          u32 val = UINT_MAX;
> >>
> >> -       if (revn == 618)
> >> +       if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
> >
> > Looks like adreno_cmp_rev() ended up in patch 3/3 when it should have
> > been in this patch..
> >
> > But I guess we could also move this into adreno_is_a618() and use that here
> >
> > BR,
> > -R
> Ahh! I reordered the patches. This is too early in the probe sequence to
> call adreno_is_axxx(), right?

ahh, right, I guess you do still need to open code adreno_cmp_rev()
here.. but you can at least move adreno_cmp_rev() into this patch.

BR,
-R

>
> -Akhil.
> >
> >>                  val = a618_get_speed_bin(fuse);
> >>
> >>          if (val == UINT_MAX) {
> >> @@ -1692,8 +1692,7 @@ static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
> >>          return (1 << val);
> >>   }
> >>
> >> -static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> >> -               u32 revn)
> >> +static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
> >>   {
> >>          u32 supp_hw = UINT_MAX;
> >>          u16 speedbin;
> >> @@ -1714,7 +1713,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> >>          }
> >>          speedbin = le16_to_cpu(speedbin);
> >>
> >> -       supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
> >> +       supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
> >>
> >>   done:
> >>          ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> >> @@ -1785,7 +1784,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> >>
> >>          a6xx_llc_slices_init(pdev, a6xx_gpu);
> >>
> >> -       ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
> >> +       ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
> >>          if (ret) {
> >>                  a6xx_destroy(&(a6xx_gpu->base.base));
> >>                  return ERR_PTR(ret);
> >> --
> >> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> >> of Code Aurora Forum, hosted by The Linux Foundation.
> >>
>
