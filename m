Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4C6922FF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 17:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4DD10E0FF;
	Fri, 10 Feb 2023 16:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6066710E0FF;
 Fri, 10 Feb 2023 16:10:24 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-16aca2628c6so5024635fac.7; 
 Fri, 10 Feb 2023 08:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x8csjOo0ay/WiZRvu3Dg2jwRg3X/GeXQG6HE9v0Ckhg=;
 b=iL6M2cJ6J58klTFq2krCzR2yrvpnQewDDsJ+HQ0E3KbpVvn309aAywYr5JpSGaWTM4
 yUlZqdv0umrcR5h4jMZ51C7vUM3dcUakiLDZFYy+KmTF8yhKpysnP/2F087gI8NuJnsa
 GVFvk0p4Rx+v5t7sqsKsGZ9Wb8T/EkWgcCvuqtpmH9Xf+Qewdjqk9cdhva/Zd1+oY3zA
 Zfd2t9OlHVRskWSOgJREsc6XwUYWxrJuc5IBlfNVhwcLo1LDqIY3OxfjRB3m3N5vLbpF
 Bi26ItCvOBj89eq9Jl+zsbkzLAGPQcBgryKDKYjDkl607O7AibBaS9Ki7/5LLrObTm4T
 5+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x8csjOo0ay/WiZRvu3Dg2jwRg3X/GeXQG6HE9v0Ckhg=;
 b=OFTGZ777hvWnXfb77cJkyitI0c/fBJy7BXsmg4Rfdh+8dE+e60l86o9rNPonhaGdrT
 ZHsHNURBBxDMGAlzjtAhuBrJULUPZQ+cVGb2aH5M9+dPnHOsG4sYBjurskcKmFpqXu2d
 6EnbfhKGZUjD+zLBOYXXDIE/38wz03beYcMi7aabARArMDJI4hulnhkmm5uw1RHxPluQ
 JxOBO4chPFJh7KIA2IBS6QgQgmzqh2Rx0+LOF2r/PKXIgKg+uraVbG+D7PiwbyXIpO/1
 F18228a7S0CO9EBBbwzqyEYvAL/5k3CcO4kTkbG3MTBltOtigdkbqehUGyFv0Zhdfeol
 DGzg==
X-Gm-Message-State: AO0yUKXgPggvEnutR0dKEFkQUlNGSMg8liefhkg9dER5M277aBhvOtW+
 BZY4WkX5Rl0hOfnP/ttFeTe5FFKFXy78PhypK0Q=
X-Google-Smtp-Source: AK7set/39G98hk5WRkbcUBbh2iCORLhHvcPbRo2Cwz0upBoFgp3MMSFVlKeQlhBknHB12xh0IrMQhYuSCVeKoO/swac=
X-Received: by 2002:a05:6870:1199:b0:163:999e:6460 with SMTP id
 25-20020a056870119900b00163999e6460mr857358oau.38.1676045423519; Fri, 10 Feb
 2023 08:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20230203181245.3523937-1-quic_bjorande@quicinc.com>
In-Reply-To: <20230203181245.3523937-1-quic_bjorande@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 Feb 2023 08:10:00 -0800
Message-ID: <CAF6AEGuJtiSrLqdZdEf=bz-R0jTg=ayR6OwutBgu5d1dBQUD_Q@mail.gmail.com>
Subject: Re: [RFC] drm/msm/adreno: Balance pm_runtime enable
To: Bjorn Andersson <quic_bjorande@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 3, 2023 at 10:12 AM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> When any of the components in the mdss hierarchy fails to bind,
> previously bound components are being unbound again.
>
> One such case happens when the DP controller fails to find its bridge or
> panel, where adreno_unbind() will be invoked without adreno_load_gpu()
> being called to invoke pm_runtime_enable().
>
> The result is that once everything is bound the pm_runtime_get_sync()
> call find the power-domain to have a positive disable_depth, fails
> with -EACCESS and prevents the GPU device to be powered up.
>
> Move the pm_runtime_enable() to adreno_bind(), in order to balance it
> with any calls to adreno_unbind().

I think instead we want to move where the pm_runtime_disable() is..
since pm_runtime_enable() was moved because we can't actually enable
runpm until we have GMU firmware

BR,
-R

> Fixes: 4b18299b3365 ("drm/msm/adreno: Defer enabling runpm until hw_init()")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 36f062c7582f..ca38b837dedb 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -432,15 +432,6 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>         if (ret)
>                 return NULL;
>
> -       /*
> -        * Now that we have firmware loaded, and are ready to begin
> -        * booting the gpu, go ahead and enable runpm:
> -        */
> -       pm_runtime_enable(&pdev->dev);
> -
> -       /* Make sure pm runtime is active and reset any previous errors */
> -       pm_runtime_set_active(&pdev->dev);
> -
>         ret = pm_runtime_get_sync(&pdev->dev);
>         if (ret < 0) {
>                 pm_runtime_put_sync(&pdev->dev);
> @@ -548,6 +539,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>                 return PTR_ERR(gpu);
>         }
>
> +       pm_runtime_enable(dev);
> +
>         return 0;
>  }
>
> --
> 2.25.1
>
