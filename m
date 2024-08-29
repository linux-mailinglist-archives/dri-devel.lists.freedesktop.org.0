Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF596440B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 14:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E94210E0A0;
	Thu, 29 Aug 2024 12:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NdYrpFs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBC310E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 12:14:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso5227185e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 05:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724933654; x=1725538454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3h6CKyriRbsuj6my1VFJWmyuvMsxQKUSsqaAlLv4E+8=;
 b=NdYrpFs7fpQ756kdL/nerk724RfgRytFaq6L3d8xvCRehDhPS6QVpxw8+UjXuLi+1/
 eNkAkq7iTrQ4jlcJ/3YfZE2okclacVkswQUs0aRvA4yvU/RpCJrZ0qL1WH2EH9puWW5T
 fnIJ9HIcrvIONC8KLA5GiRvt9yN4ReyzD4JJkre28UGZM7yNCgZXxi/86mo6eQndIApw
 drOH0cRNIswMj3+iNPIw/OxhNdzJtAFHpHDV0G4SeysTj5g6F2mdldMDDrfeBcCww0vc
 +fUDf3rr666/u5/lPtinxHmBWk2lWWx6FuP5V56EIoqFapilN+PqCOoJoEXY2fWfFXbw
 Nexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724933654; x=1725538454;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3h6CKyriRbsuj6my1VFJWmyuvMsxQKUSsqaAlLv4E+8=;
 b=Bkl9cucyYIlvBISSp5fNM3AXmw05jGFXgqFEk0zCFcnosfCL3+7ZVXDzS1axrDnqvV
 WIg7acnFw8U+3Hw6xumbD+8rAcbQk/OsHR6lCmCq3P4chKvBtCgnyxObvHAjkt9OBGGC
 vjbTc8qlQr5Eu4kkG3HKq6kPKCS2rIsID3Ju6CO2g8/khJ1mPpEiemXlv8mM5X8ofO4K
 TYnYIbMg+3zmniVaFxwf23ZhRinKG+cbRjd3WS7Sj0t7c5MIG+ymkv5BPxX0+FiF+za2
 3hnkpD2jWowC7H1GC/YOzG+Wi0+OT/14658QqN5U8lpmJV667azimfhii+aiVzbADMxV
 79YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcYQyA0oLOa58Vu7U4I7FAllkGZnos6OX/etCYLstRmaQ91wJZrJibwsDp0VZGG43t+b4me/UJZQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZKyJQh0xpo4ph0j+ZPiQjzYHg5Le4td074LKMlNkG7conAlUy
 IhB2VF49Fq/6ojXPywJMPftWjOvMjZeNnI66RjL3feMVOFUvyK7rP9w8Zqyu/9U=
X-Google-Smtp-Source: AGHT+IH2yloTkQqRV7RgsPzg+gJUquKbn7Ns/cguYJrVQ9YAGeeJ4xJa1PXoQgc1IZvhEbWks41n1A==
X-Received: by 2002:a5d:590a:0:b0:371:869e:d24f with SMTP id
 ffacd0b85a97d-3749b5865damr1883252f8f.61.1724933653173; 
 Thu, 29 Aug 2024 05:14:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915?
 ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425811sm49757335e9.40.2024.08.29.05.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 05:14:12 -0700 (PDT)
Message-ID: <64ef8b1d-40ab-4c10-b217-58a3e4cbf652@linaro.org>
Date: Thu, 29 Aug 2024 14:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: switch to a managed drm device
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240828110421.14956-1-abelova@astralinux.ru>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240828110421.14956-1-abelova@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 28/08/2024 13:04, Anastasia Belova wrote:
> Switch to a managed drm device to cleanup some error handling
> and make future work easier.
> 
> Fix dereference of NULL in meson_drv_bind_master by removing
> drm_dev_put(drm) before meson_encoder_*_remove where drm
> dereferenced.

Please send the fix separately with a Fixes tag.

Thanks,
Neil

> 
> Co-developed by Linux Verification Center (linuxtesting.org).
> 
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>   drivers/gpu/drm/meson/meson_crtc.c         | 10 +--
>   drivers/gpu/drm/meson/meson_drv.c          | 71 ++++++++++------------
>   drivers/gpu/drm/meson/meson_drv.h          |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c |  8 +--
>   drivers/gpu/drm/meson/meson_overlay.c      |  8 +--
>   drivers/gpu/drm/meson/meson_plane.c        | 10 +--
>   6 files changed, 51 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> index d70616da8ce2..e1c0bf3baeea 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -662,13 +662,13 @@ void meson_crtc_irq(struct meson_drm *priv)
>   
>   	drm_crtc_handle_vblank(priv->crtc);
>   
> -	spin_lock_irqsave(&priv->drm->event_lock, flags);
> +	spin_lock_irqsave(&priv->drm.event_lock, flags);
>   	if (meson_crtc->event) {
>   		drm_crtc_send_vblank_event(priv->crtc, meson_crtc->event);
>   		drm_crtc_vblank_put(priv->crtc);
>   		meson_crtc->event = NULL;
>   	}
> -	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
> +	spin_unlock_irqrestore(&priv->drm.event_lock, flags);
>   }
>   
>   int meson_crtc_create(struct meson_drm *priv)
> @@ -677,18 +677,18 @@ int meson_crtc_create(struct meson_drm *priv)
>   	struct drm_crtc *crtc;
>   	int ret;
>   
> -	meson_crtc = devm_kzalloc(priv->drm->dev, sizeof(*meson_crtc),
> +	meson_crtc = devm_kzalloc(priv->drm.dev, sizeof(*meson_crtc),
>   				  GFP_KERNEL);
>   	if (!meson_crtc)
>   		return -ENOMEM;
>   
>   	meson_crtc->priv = priv;
>   	crtc = &meson_crtc->base;
> -	ret = drm_crtc_init_with_planes(priv->drm, crtc,
> +	ret = drm_crtc_init_with_planes(&priv->drm, crtc,
>   					priv->primary_plane, NULL,
>   					&meson_crtc_funcs, "meson_crtc");
>   	if (ret) {
> -		dev_err(priv->drm->dev, "Failed to init CRTC\n");
> +		dev_err(priv->drm.dev, "Failed to init CRTC\n");
>   		return ret;
>   	}
>   
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 4bd0baa2a4f5..2e7c2e7c7b82 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -182,7 +182,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	struct platform_device *pdev = to_platform_device(dev);
>   	const struct meson_drm_match_data *match;
>   	struct meson_drm *priv;
> -	struct drm_device *drm;
>   	struct resource *res;
>   	void __iomem *regs;
>   	int ret, i;
> @@ -197,17 +196,13 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (!match)
>   		return -ENODEV;
>   
> -	drm = drm_dev_alloc(&meson_driver, dev);
> -	if (IS_ERR(drm))
> -		return PTR_ERR(drm);
> +	priv = devm_drm_dev_alloc(dev, &meson_driver,
> +				 struct meson_drm, drm);
>   
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto free_drm;
> -	}
> -	drm->dev_private = priv;
> -	priv->drm = drm;
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
> +
> +	priv->drm.dev_private = priv;
>   	priv->dev = dev;
>   	priv->compat = match->compat;
>   	priv->afbcd.ops = match->afbcd_ops;
> @@ -215,7 +210,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	regs = devm_platform_ioremap_resource_byname(pdev, "vpu");
>   	if (IS_ERR(regs)) {
>   		ret = PTR_ERR(regs);
> -		goto free_drm;
> +		goto remove_encoders;
>   	}
>   
>   	priv->io_base = regs;
> @@ -223,13 +218,13 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
>   	if (!res) {
>   		ret = -EINVAL;
> -		goto free_drm;
> +		goto remove_encoders;
>   	}
>   	/* Simply ioremap since it may be a shared register zone */
>   	regs = devm_ioremap(dev, res->start, resource_size(res));
>   	if (!regs) {
>   		ret = -EADDRNOTAVAIL;
> -		goto free_drm;
> +		goto remove_encoders;
>   	}
>   
>   	priv->hhi = devm_regmap_init_mmio(dev, regs,
> @@ -237,18 +232,18 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (IS_ERR(priv->hhi)) {
>   		dev_err(&pdev->dev, "Couldn't create the HHI regmap\n");
>   		ret = PTR_ERR(priv->hhi);
> -		goto free_drm;
> +		goto remove_encoders;
>   	}
>   
>   	priv->canvas = meson_canvas_get(dev);
>   	if (IS_ERR(priv->canvas)) {
>   		ret = PTR_ERR(priv->canvas);
> -		goto free_drm;
> +		goto remove_encoders;
>   	}
>   
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
>   	if (ret)
> -		goto free_drm;
> +		goto remove_encoders;
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
>   	if (ret)
>   		goto free_canvas_osd1;
> @@ -261,7 +256,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   
>   	priv->vsync_irq = platform_get_irq(pdev, 0);
>   
> -	ret = drm_vblank_init(drm, 1);
> +	ret = drm_vblank_init(&priv->drm, 1);
>   	if (ret)
>   		goto free_canvas_vd1_2;
>   
> @@ -284,10 +279,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	ret = drmm_mode_config_init(drm);
>   	if (ret)
>   		goto free_canvas_vd1_2;
> -	drm->mode_config.max_width = 3840;
> -	drm->mode_config.max_height = 2160;
> -	drm->mode_config.funcs = &meson_mode_config_funcs;
> -	drm->mode_config.helper_private	= &meson_mode_config_helpers;
> +	priv->drm.mode_config.max_width = 3840;
> +	priv->drm.mode_config.max_height = 2160;
> +	priv->drm.mode_config.funcs = &meson_mode_config_funcs;
> +	priv->drm.mode_config.helper_private = &meson_mode_config_helpers;
>   
>   	/* Hardware Initialization */
>   
> @@ -308,9 +303,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   		goto exit_afbcd;
>   
>   	if (has_components) {
> -		ret = component_bind_all(dev, drm);
> +		ret = component_bind_all(dev, &priv->drm);
>   		if (ret) {
> -			dev_err(drm->dev, "Couldn't bind all components\n");
> +			dev_err(priv->drm.dev, "Couldn't bind all components\n");
>   			/* Do not try to unbind */
>   			has_components = false;
>   			goto exit_afbcd;
> @@ -339,26 +334,26 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (ret)
>   		goto exit_afbcd;
>   
> -	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
> +	ret = request_irq(priv->vsync_irq, meson_irq, 0, priv->drm.driver->name, &priv->drm);
>   	if (ret)
>   		goto exit_afbcd;
>   
> -	drm_mode_config_reset(drm);
> +	drm_mode_config_reset(&priv->drm);
>   
> -	drm_kms_helper_poll_init(drm);
> +	drm_kms_helper_poll_init(&priv->drm);
>   
>   	platform_set_drvdata(pdev, priv);
>   
> -	ret = drm_dev_register(drm, 0);
> +	ret = drm_dev_register(&priv->drm, 0);
>   	if (ret)
>   		goto uninstall_irq;
>   
> -	drm_fbdev_dma_setup(drm, 32);
> +	drm_fbdev_dma_setup(&priv->drm, 32);
>   
>   	return 0;
>   
>   uninstall_irq:
> -	free_irq(priv->vsync_irq, drm);
> +	free_irq(priv->vsync_irq, &priv->drm);
>   exit_afbcd:
>   	if (priv->afbcd.ops)
>   		priv->afbcd.ops->exit(priv);
> @@ -370,15 +365,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
>   free_canvas_osd1:
>   	meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -free_drm:
> -	drm_dev_put(drm);
> +remove_encoders:
>   
>   	meson_encoder_dsi_remove(priv);
>   	meson_encoder_hdmi_remove(priv);
>   	meson_encoder_cvbs_remove(priv);
>   
>   	if (has_components)
> -		component_unbind_all(dev, drm);
> +		component_unbind_all(dev, &priv->drm);
>   
>   	return ret;
>   }
> @@ -391,7 +385,7 @@ static int meson_drv_bind(struct device *dev)
>   static void meson_drv_unbind(struct device *dev)
>   {
>   	struct meson_drm *priv = dev_get_drvdata(dev);
> -	struct drm_device *drm = priv->drm;
> +	struct drm_device *drm = &priv->drm;
>   
>   	if (priv->canvas) {
>   		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> @@ -404,7 +398,6 @@ static void meson_drv_unbind(struct device *dev)
>   	drm_kms_helper_poll_fini(drm);
>   	drm_atomic_helper_shutdown(drm);
>   	free_irq(priv->vsync_irq, drm);
> -	drm_dev_put(drm);
>   
>   	meson_encoder_dsi_remove(priv);
>   	meson_encoder_hdmi_remove(priv);
> @@ -428,7 +421,7 @@ static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
>   	if (!priv)
>   		return 0;
>   
> -	return drm_mode_config_helper_suspend(priv->drm);
> +	return drm_mode_config_helper_suspend(&priv->drm);
>   }
>   
>   static int __maybe_unused meson_drv_pm_resume(struct device *dev)
> @@ -445,7 +438,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
>   	if (priv->afbcd.ops)
>   		priv->afbcd.ops->init(priv);
>   
> -	return drm_mode_config_helper_resume(priv->drm);
> +	return drm_mode_config_helper_resume(&priv->drm);
>   }
>   
>   static void meson_drv_shutdown(struct platform_device *pdev)
> @@ -455,8 +448,8 @@ static void meson_drv_shutdown(struct platform_device *pdev)
>   	if (!priv)
>   		return;
>   
> -	drm_kms_helper_poll_fini(priv->drm);
> -	drm_atomic_helper_shutdown(priv->drm);
> +	drm_kms_helper_poll_fini(&priv->drm);
> +	drm_atomic_helper_shutdown(&priv->drm);
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index 3f9345c14f31..c4c6c810cb20 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -53,7 +53,7 @@ struct meson_drm {
>   	u8 canvas_id_vd1_1;
>   	u8 canvas_id_vd1_2;
>   
> -	struct drm_device *drm;
> +	struct drm_device drm;
>   	struct drm_crtc *crtc;
>   	struct drm_plane *primary_plane;
>   	struct drm_plane *overlay_plane;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index d1191de855d9..ddca22c8c1ff 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -104,7 +104,7 @@ static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
>   	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
>   		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
>   
> -		mode = drm_mode_duplicate(priv->drm, &meson_mode->mode);
> +		mode = drm_mode_duplicate(&priv->drm, &meson_mode->mode);
>   		if (!mode) {
>   			dev_err(priv->dev, "Failed to create a new display mode\n");
>   			return 0;
> @@ -221,7 +221,7 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
>   
>   int meson_encoder_cvbs_probe(struct meson_drm *priv)
>   {
> -	struct drm_device *drm = priv->drm;
> +	struct drm_device *drm = &priv->drm;
>   	struct meson_encoder_cvbs *meson_encoder_cvbs;
>   	struct drm_connector *connector;
>   	struct device_node *remote;
> @@ -256,7 +256,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>   	meson_encoder_cvbs->priv = priv;
>   
>   	/* Encoder */
> -	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
> +	ret = drm_simple_encoder_init(&priv->drm, &meson_encoder_cvbs->encoder,
>   				      DRM_MODE_ENCODER_TVDAC);
>   	if (ret)
>   		return dev_err_probe(priv->dev, ret,
> @@ -273,7 +273,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>   	}
>   
>   	/* Initialize & attach Bridge Connector */
> -	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
> +	connector = drm_bridge_connector_init(&priv->drm, &meson_encoder_cvbs->encoder);
>   	if (IS_ERR(connector))
>   		return dev_err_probe(priv->dev, PTR_ERR(connector),
>   				     "Unable to create CVBS bridge connector\n");
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index 7f98de38842b..60ee7f758723 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -484,7 +484,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
>   
>   	interlace_mode = new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE;
>   
> -	spin_lock_irqsave(&priv->drm->event_lock, flags);
> +	spin_lock_irqsave(&priv->drm.event_lock, flags);
>   
>   	if ((fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) ==
>   			    DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) {
> @@ -717,7 +717,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
>   
>   	priv->viu.vd1_enabled = true;
>   
> -	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
> +	spin_unlock_irqrestore(&priv->drm.event_lock, flags);
>   
>   	DRM_DEBUG_DRIVER("\n");
>   }
> @@ -838,7 +838,7 @@ int meson_overlay_create(struct meson_drm *priv)
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	meson_overlay = devm_kzalloc(priv->drm->dev, sizeof(*meson_overlay),
> +	meson_overlay = devm_kzalloc(priv->drm.dev, sizeof(*meson_overlay),
>   				   GFP_KERNEL);
>   	if (!meson_overlay)
>   		return -ENOMEM;
> @@ -846,7 +846,7 @@ int meson_overlay_create(struct meson_drm *priv)
>   	meson_overlay->priv = priv;
>   	plane = &meson_overlay->base;
>   
> -	drm_universal_plane_init(priv->drm, plane, 0xFF,
> +	drm_universal_plane_init(&priv->drm, plane, 0xFF,
>   				 &meson_overlay_funcs,
>   				 supported_drm_formats,
>   				 ARRAY_SIZE(supported_drm_formats),
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index b43ac61201f3..13be94309bf4 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -157,7 +157,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>   	 * Update Buffer
>   	 * Enable Plane
>   	 */
> -	spin_lock_irqsave(&priv->drm->event_lock, flags);
> +	spin_lock_irqsave(&priv->drm.event_lock, flags);
>   
>   	/* Check if AFBC decoder is required for this buffer */
>   	if ((meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
> @@ -393,7 +393,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>   
>   	priv->viu.osd1_enabled = true;
>   
> -	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
> +	spin_unlock_irqrestore(&priv->drm.event_lock, flags);
>   }
>   
>   static void meson_plane_atomic_disable(struct drm_plane *plane,
> @@ -536,7 +536,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	const uint64_t *format_modifiers = format_modifiers_default;
>   	int ret;
>   
> -	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
> +	meson_plane = devm_kzalloc(priv->drm.dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
>   	if (!meson_plane)
>   		return -ENOMEM;
> @@ -549,14 +549,14 @@ int meson_plane_create(struct meson_drm *priv)
>   	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
>   		format_modifiers = format_modifiers_afbc_g12a;
>   
> -	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
> +	ret = drm_universal_plane_init(&priv->drm, plane, 0xFF,
>   					&meson_plane_funcs,
>   					supported_drm_formats,
>   					ARRAY_SIZE(supported_drm_formats),
>   					format_modifiers,
>   					DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
>   	if (ret) {
> -		devm_kfree(priv->drm->dev, meson_plane);
> +		devm_kfree(priv->drm.dev, meson_plane);
>   		return ret;
>   	}
>   

