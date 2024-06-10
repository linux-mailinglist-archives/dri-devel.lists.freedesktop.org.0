Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181A901C0E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 09:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A87C10E31E;
	Mon, 10 Jun 2024 07:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gWr0mHQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDDD10E31E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 07:43:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42108856c33so30109035e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718005385; x=1718610185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iBWyG4Lpihd8xrLr7dOzsFysuT/rCvsYWrppTAEE9CM=;
 b=gWr0mHQThGr9JhQYPcBCmhTE/Vp0U4mAoCtg8k2gkU421+KMMGbJc8RlMKI8lvuGxM
 miYUL39+e6WN5xAmor7TTM50uuH4Ds0CtxRMnHQ/XN64oEqd91l4WTf3svEPQUHc/v9p
 WUE92ZbInecreKJHnxeyzaNlUKzmlC88+TikD9Q/aNoT0J4Ke2NErjB62d4LbuK1nufk
 Fv0z1eG8mezeYLpnI0lelTvc61p+/qEEsTmKgmcsX+3VNDnnvEYpvT7E5qykW2gzDyph
 B3cx8ZBDXZDscR+bOn4QsIDxef6cfgDowKQC7ILmCjJWTA1MeUdzaVT5niBOexuKs1KY
 ALoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718005385; x=1718610185;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iBWyG4Lpihd8xrLr7dOzsFysuT/rCvsYWrppTAEE9CM=;
 b=FFHZQFUL9ItQVVOjQ6D4rdEmWegnI8B13dnSsPJqGSgaHM2+843lzlb/2RF2FHHflt
 H2XO8i4BBUv3Ppeux//UAOYpK42EQmCP0HryzL4xfFhoHKLeYLAqn5bNxpurYRcOwwnF
 hbWfnYZ1ct1ncffe3mYdL9DiCxB8HLXRZKuMq20NIFg5ZNwojEFyRe+4psGICESTo0vx
 Jh1cByYDfFN1WInrIqkAdJLP/9yQPh0t3kRC744ztqdmNLkq9oP1TOc3xasg1Wm+ydXK
 NMtqxiS+ocAjGgqrSbxMFt5d/DAPflksEsbxaY02fPBWMuRn86aj47w29HdcK0STOee/
 RZEw==
X-Gm-Message-State: AOJu0YxSxcrW7jLf2AZUwjhM+t0TyTNS45QMkArxLlLzwQLHfDdA/5Gh
 0tA5lCs8NcK7hjgpSN3IIvnSACmBpddLvUERiJ/WA/fbSIQwGjJqD70v4G6xQZnlK3h4ISsY/8e
 zjwY=
X-Google-Smtp-Source: AGHT+IGmIYwIcGpYd4HUnqnyXqW0kcBkgI7+rmL5WgrY1FMRmdMIe2AhPWKJ+7MpEMye2NLhP3G97A==
X-Received: by 2002:a05:600c:4f07:b0:421:661d:89d6 with SMTP id
 5b1f17b1804b1-421661d8dacmr78976025e9.14.1718005384699; 
 Mon, 10 Jun 2024 00:43:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:40bd:6769:b4bb:b56d?
 ([2a01:e0a:982:cbb0:40bd:6769:b4bb:b56d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421cf672ea7sm20445145e9.1.2024.06.10.00.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:43:04 -0700 (PDT)
Message-ID: <e85295d9-4f0b-4a18-b9de-fd8e719eeffd@linaro.org>
Date: Mon, 10 Jun 2024 09:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [bug report] drm/meson: fix unbind path if HDMI fails to bind
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
References: <8cdd6fd7-d96a-4dfc-bb5b-11ad683583b1@moroto.mountain>
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
In-Reply-To: <8cdd6fd7-d96a-4dfc-bb5b-11ad683583b1@moroto.mountain>
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

On 08/06/2024 16:20, Dan Carpenter wrote:
> Hello Neil Armstrong,
> 
> Commit 6a044642988b ("drm/meson: fix unbind path if HDMI fails to
> bind") from May 30, 2023 (linux-next), leads to the following Smatch
> static checker warning:
> 
> 	drivers/gpu/drm/meson/meson_drv.c:377 meson_drv_bind_master()
> 	error: we previously assumed 'priv' could be null (see line 205)

Thanks, I'll look into this.

Neil

> 
> drivers/gpu/drm/meson/meson_drv.c
>      180 static int meson_drv_bind_master(struct device *dev, bool has_components)
>      181 {
>      182         struct platform_device *pdev = to_platform_device(dev);
>      183         const struct meson_drm_match_data *match;
>      184         struct meson_drm *priv;
>      185         struct drm_device *drm;
>      186         struct resource *res;
>      187         void __iomem *regs;
>      188         int ret, i;
>      189
>      190         /* Checks if an output connector is available */
>      191         if (!meson_vpu_has_available_connectors(dev)) {
>      192                 dev_err(dev, "No output connector available\n");
>      193                 return -ENODEV;
>      194         }
>      195
>      196         match = of_device_get_match_data(dev);
>      197         if (!match)
>      198                 return -ENODEV;
>      199
>      200         drm = drm_dev_alloc(&meson_driver, dev);
>      201         if (IS_ERR(drm))
>      202                 return PTR_ERR(drm);
>      203
>      204         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>      205         if (!priv) {
>      206                 ret = -ENOMEM;
>      207                 goto free_drm;
> 
> priv is NULL so the calls to meson_encoder_*_remove() will Oops.
> 
>      208         }
>      209         drm->dev_private = priv;
>      210         priv->drm = drm;
>      211         priv->dev = dev;
>      212         priv->compat = match->compat;
>      213         priv->afbcd.ops = match->afbcd_ops;
>      214
>      215         regs = devm_platform_ioremap_resource_byname(pdev, "vpu");
>      216         if (IS_ERR(regs)) {
>      217                 ret = PTR_ERR(regs);
>      218                 goto free_drm;
>      219         }
>      220
>      221         priv->io_base = regs;
>      222
>      223         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
>      224         if (!res) {
>      225                 ret = -EINVAL;
>      226                 goto free_drm;
>      227         }
>      228         /* Simply ioremap since it may be a shared register zone */
>      229         regs = devm_ioremap(dev, res->start, resource_size(res));
>      230         if (!regs) {
>      231                 ret = -EADDRNOTAVAIL;
>      232                 goto free_drm;
>      233         }
>      234
>      235         priv->hhi = devm_regmap_init_mmio(dev, regs,
>      236                                           &meson_regmap_config);
>      237         if (IS_ERR(priv->hhi)) {
>      238                 dev_err(&pdev->dev, "Couldn't create the HHI regmap\n");
>      239                 ret = PTR_ERR(priv->hhi);
>      240                 goto free_drm;
>      241         }
>      242
>      243         priv->canvas = meson_canvas_get(dev);
>      244         if (IS_ERR(priv->canvas)) {
>      245                 ret = PTR_ERR(priv->canvas);
>      246                 goto free_drm;
>      247         }
>      248
>      249         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
>      250         if (ret)
>      251                 goto free_drm;
>      252         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
>      253         if (ret) {
>      254                 meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
>      255                 goto free_drm;
>      256         }
>      257         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_1);
>      258         if (ret) {
>      259                 meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
>      260                 meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
>      261                 goto free_drm;
>      262         }
>      263         ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_2);
>      264         if (ret) {
>      265                 meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
>      266                 meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
>      267                 meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
> 
> What about this clean up?
> 
>      268                 goto free_drm;
>      269         }
>      270
>      271         priv->vsync_irq = platform_get_irq(pdev, 0);
>      272
>      273         ret = drm_vblank_init(drm, 1);
>      274         if (ret)
>      275                 goto free_drm;
> 
> Do we not need to do it here as well?
> 
>      276
>      277         /* Assign limits per soc revision/package */
>      278         for (i = 0 ; i < ARRAY_SIZE(meson_drm_soc_attrs) ; ++i) {
>      279                 if (soc_device_match(meson_drm_soc_attrs[i].attrs)) {
>      280                         priv->limits = &meson_drm_soc_attrs[i].limits;
>      281                         break;
>      282                 }
>      283         }
>      284
>      285         /*
>      286          * Remove early framebuffers (ie. simplefb). The framebuffer can be
>      287          * located anywhere in RAM
>      288          */
>      289         ret = drm_aperture_remove_framebuffers(&meson_driver);
>      290         if (ret)
>      291                 goto free_drm;
>      292
>      293         ret = drmm_mode_config_init(drm);
>      294         if (ret)
>      295                 goto free_drm;
>      296         drm->mode_config.max_width = 3840;
>      297         drm->mode_config.max_height = 2160;
>      298         drm->mode_config.funcs = &meson_mode_config_funcs;
>      299         drm->mode_config.helper_private        = &meson_mode_config_helpers;
>      300
>      301         /* Hardware Initialization */
>      302
>      303         meson_vpu_init(priv);
>      304         meson_venc_init(priv);
>      305         meson_vpp_init(priv);
>      306         meson_viu_init(priv);
>      307         if (priv->afbcd.ops) {
>      308                 ret = priv->afbcd.ops->init(priv);
>      309                 if (ret)
>      310                         goto free_drm;
>      311         }
>      312
>      313         /* Encoder Initialization */
>      314
>      315         ret = meson_encoder_cvbs_probe(priv);
>      316         if (ret)
>      317                 goto exit_afbcd;
>      318
>      319         if (has_components) {
>      320                 ret = component_bind_all(dev, drm);
>      321                 if (ret) {
>      322                         dev_err(drm->dev, "Couldn't bind all components\n");
>      323                         /* Do not try to unbind */
>      324                         has_components = false;
>      325                         goto exit_afbcd;
>      326                 }
>      327         }
>      328
>      329         ret = meson_encoder_hdmi_probe(priv);
>      330         if (ret)
>      331                 goto exit_afbcd;
>      332
>      333         if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
>      334                 ret = meson_encoder_dsi_probe(priv);
>      335                 if (ret)
>      336                         goto exit_afbcd;
>      337         }
>      338
>      339         ret = meson_plane_create(priv);
>      340         if (ret)
>      341                 goto exit_afbcd;
>      342
>      343         ret = meson_overlay_create(priv);
>      344         if (ret)
>      345                 goto exit_afbcd;
>      346
>      347         ret = meson_crtc_create(priv);
>      348         if (ret)
>      349                 goto exit_afbcd;
>      350
>      351         ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
>      352         if (ret)
>      353                 goto exit_afbcd;
>      354
>      355         drm_mode_config_reset(drm);
>      356
>      357         drm_kms_helper_poll_init(drm);
>      358
>      359         platform_set_drvdata(pdev, priv);
>      360
>      361         ret = drm_dev_register(drm, 0);
>      362         if (ret)
>      363                 goto uninstall_irq;
>      364
>      365         drm_fbdev_dma_setup(drm, 32);
>      366
>      367         return 0;
>      368
>      369 uninstall_irq:
>      370         free_irq(priv->vsync_irq, drm);
>      371 exit_afbcd:
>      372         if (priv->afbcd.ops)
>      373                 priv->afbcd.ops->exit(priv);
>      374 free_drm:
>      375         drm_dev_put(drm);
>      376
> --> 377         meson_encoder_dsi_remove(priv);
>      378         meson_encoder_hdmi_remove(priv);
>      379         meson_encoder_cvbs_remove(priv);
>      380
>      381         if (has_components)
>      382                 component_unbind_all(dev, drm);
>      383
>      384         return ret;
>      385 }
> 
> regards,
> dan carpenter

