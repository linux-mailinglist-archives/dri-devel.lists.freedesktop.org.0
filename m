Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E8628B24
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 22:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319F810E323;
	Mon, 14 Nov 2022 21:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC7010E31B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 21:11:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n20so10846041ejh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 13:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nYM63RRvqlC+PbmanyesAjjHnH9NOqGbj+n/5jkMu0U=;
 b=f6dGIMl/KDjY03GU6eHJICav9uByHOVeuMW5WTXsr/PPVzAO2OVCrNu3ZCYaiWIXQC
 xddtEHYtvDDIjNVmfmQu7E8l8/gRZfKcaEjXgcRTZTgugEbXu+NbNtCF5jDwvbV1zA4B
 R8ogtQrLOKDOxW3o/ArmlL52u2IMNNZtB0amA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nYM63RRvqlC+PbmanyesAjjHnH9NOqGbj+n/5jkMu0U=;
 b=eepzYTjrobiA/YJefhbPgUxbdmhPzk9ey31y9l7eWk6frRF0m1T0Y/ELWNbdtM66u4
 mwDkxY5/ut09VmHI2hs5MsaJj+tkEfZB9HBzzyjgIi2LxFfHz7d1GY1HXYUPB+QABPHi
 5LVQ7pbf+P/ZIpuKqZSnq44ZfWC/GJpM7ydn4Hg6Ji36hd3036ddryiT/+qNR6SW8wds
 2KFaLzbnA+E72rML1fNdJNlv+KHSEtskBodEUf+DCAblA7BBqQ6fwzOQMB8YdFHsvmPp
 Y6Yh1OwQodnGRMRaug2pgzgNM/6KMI6bm1mv8tPddkCZH9vuQTv3k9gRdfgqSAoyqdOE
 2RsQ==
X-Gm-Message-State: ANoB5pl44Mq7fgLRSA6ZU/3/NaRgSiRL9K73cf2GLqGQINzhAJUJONv1
 8bXnr8BkBwelCX1Nq66f/sFTOIhrz8rucRus
X-Google-Smtp-Source: AA0mqf4+sClmXJBIqQhB6g7JIFqzcg9QJq0nC7MPH90PbKhzRFKVhK9+x9evRwc3d2rJRl9Pt2/dtA==
X-Received: by 2002:a17:906:e0d2:b0:7ad:9f03:aa1f with SMTP id
 gl18-20020a170906e0d200b007ad9f03aa1fmr11689832ejb.632.1668460306436; 
 Mon, 14 Nov 2022 13:11:46 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 vu6-20020a170907a64600b007ae10525550sm4568035ejc.47.2022.11.14.13.11.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 13:11:44 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id d9so15968563wrm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 13:11:44 -0800 (PST)
X-Received: by 2002:a05:6000:1376:b0:236:7741:fa7b with SMTP id
 q22-20020a056000137600b002367741fa7bmr8968202wrz.138.1668460304144; Mon, 14
 Nov 2022 13:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20221114205055.1547497-1-robdclark@gmail.com>
In-Reply-To: <20221114205055.1547497-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Nov 2022 13:11:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbYYxP4kFBeGP3AGOwvbc8qNn746qpcZ8zVPc8re0o5Q@mail.gmail.com>
Message-ID: <CAD=FV=XbYYxP4kFBeGP3AGOwvbc8qNn746qpcZ8zVPc8re0o5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 14, 2022 at 12:50 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If we get an error (other than -ENOENT) we need to propagate that up the
> stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up
> end up claiming that we support all the OPPs which is not likely to be
> true (and on some generations impossible to be true, ie. if there are
> conflicting OPPs).
>
> v2: Update commit msg, gc unused label, etc
>
> Fixed: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 7fe60c65a1eb..6ae77e88060f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1941,7 +1941,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>
>  static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>  {
> -       u32 supp_hw = UINT_MAX;
> +       u32 supp_hw;
>         u32 speedbin;
>         int ret;
>
> @@ -1953,15 +1953,13 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>         if (ret == -ENOENT) {
>                 return 0;
>         } else if (ret) {
> -               DRM_DEV_ERROR(dev,
> -                             "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
> -                             ret);
> -               goto done;
> +               dev_err_probe(dev, ret,
> +                             "failed to read speed-bin. Some OPPs may not be supported by hardware");
> +               return ret;

Both before and after this change, I think you're missing a "\n" at
the end of your error string?

If you want to get even fancier, dev_err_probe is designed to run
"braceless" and returns "ret" as its return value. This you could do:

if (ret == -ENOENT)
  return ret;
else if (ret)
  return dev_err_probe(dev, ret, ...)

After adding the "\n" then either with the extra fanciness or as you have it:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
