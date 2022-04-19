Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7D507971
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 20:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CDD10F174;
	Tue, 19 Apr 2022 18:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B12B10F174
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 18:52:19 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 203so5911241pgb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NooUuNCkNMvpIoZXYh5tmIEgwsCUJNTDomQ0FyzjCCY=;
 b=e5tBOqr4lavAAuGYjg9IsQpk5mL/uk7Hdvwg9DtAAbKtZmxEWJgmAQp7FQIqkewjbk
 4YGEK7NP2wBE01hyYpf1yzb59q/zCTRm5NqBDu7ia28oqZbmNm5BSCnuDm60j0QDysmX
 NLoyNLkz+clrh32C0DkZmjHlXO4s9ujkPH9I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NooUuNCkNMvpIoZXYh5tmIEgwsCUJNTDomQ0FyzjCCY=;
 b=SLlf2Nagj/w5FAky4f7gxmUva5Lp9UZEcvxUoD0DL229baZ9qMWVjy85kUxHxOMx89
 acPLIi4ysH1LebaZtgSiOqruJegFRUjtcfyPHFoo8niHT6hYZ4b7q6KjwD7MKblqIwIs
 Jgs0NhojIdgr+7TeOk1XHcwrZtCu3xVLYTT70SO6ydzt/wSyOkyP01qG0Uum6yz5Rp+/
 oUXJChR+0f5dcJgoHJHWcEY1nBfGS/ybYg5iWqpm8x176OBhnALsiZ3VQ/+AzL1TF8pZ
 IZzoY04siKWAbW7qn0kpbGd2v6KA/Qb5DSApxtlW1yE1ViS2Od77jyuwXBlKWpZ3b4Sz
 DJ+A==
X-Gm-Message-State: AOAM532wOWws9GoPXVOsCSt9uP3nw4Cz/LeeWx/S8geGAd94fzR5RgFK
 AJ3SuwaB6YZXq9cpiHPNCQDJXzMty8R9/BMSEIc3fQ==
X-Google-Smtp-Source: ABdhPJw9leYYKP26T9hLXHvp/ankYK20nLxEHwwASoB++NOIyzORrRT1SBQhNE7UnLrUPU92v21CkG2tpm8Ax/lQl0k=
X-Received: by 2002:a63:6e04:0:b0:398:409:2928 with SMTP id
 j4-20020a636e04000000b0039804092928mr15992700pgc.250.1650394339106; Tue, 19
 Apr 2022 11:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419181444.485959-1-sashal@kernel.org>
 <20220419181444.485959-11-sashal@kernel.org>
In-Reply-To: <20220419181444.485959-11-sashal@kernel.org>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 19 Apr 2022 11:53:23 -0700
Message-ID: <CAJs_Fx7YVBn7qvaE23ThBOFzozKHBkefdSztfF+xtTw2hhgw2Q@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 11/14] drm/msm: Stop using iommu_present()
To: Sasha Levin <sashal@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You might want to drop this one, it seems to be causing some issues on
older generations.. I'll be sending another PR shortly with a revert.

https://patchwork.freedesktop.org/patch/482453

BR,
-R

On Tue, Apr 19, 2022 at 11:15 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Robin Murphy <robin.murphy@arm.com>
>
> [ Upstream commit e2a88eabb02410267519b838fb9b79f5206769be ]
>
> Even if some IOMMU has registered itself on the platform "bus", that
> doesn't necessarily mean it provides translation for the device we
> care about. Replace iommu_present() with a more appropriate check.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Patchwork: https://patchwork.freedesktop.org/patch/480707/
> Link: https://lore.kernel.org/r/5ab4f4574d7f3e042261da702d493ee40d003356.1649168268.git.robin.murphy@arm.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 407b51cf6790..7322df9cf673 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -303,7 +303,7 @@ bool msm_use_mmu(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>
>         /* a2xx comes with its own MMU */
> -       return priv->is_a2xx || iommu_present(&platform_bus_type);
> +       return priv->is_a2xx || device_iommu_mapped(dev->dev);
>  }
>
>  static int msm_init_vram(struct drm_device *dev)
> --
> 2.35.1
>
