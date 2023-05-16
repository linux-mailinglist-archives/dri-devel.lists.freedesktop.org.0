Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05C704660
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9E10E311;
	Tue, 16 May 2023 07:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B44D10E311
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:28:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso8980521f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684222102; x=1686814102;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ux36AotXPjABVCdBEr0dNyzcq/s65Fldpn/lfU7XXk0=;
 b=wcmCX3cVJb7BBb13jmtvUzAmM+x+GVqAjuH5wGLYiIhbKSXi846J53twRqfMHALJs5
 jHjqMzIMCvpZzvIvoPofccdvC2y7QTp0tMALBmuQu4zMROSXazoBz6LmkO3kD4EqnR5v
 Y2/CFhKgqItvkhhF3MQ0JozykLKeMWeZ7QGi2oNo3B9KtVC9fKjXX6ppqcFCRd46heKK
 BqSFyYCBmoIaXP3xa/t56xsxfmwqrXb0/tAQA7h7Rc7pD8LWuEJ1ea7TkkfiUs6XJQMl
 8bh1JNt+8Vl5HpS4bbwrLjvEFgzxdj0bPu8emS65jAe7Yrrdk+WReJ0daRKDXD8TzGoe
 Vqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684222102; x=1686814102;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ux36AotXPjABVCdBEr0dNyzcq/s65Fldpn/lfU7XXk0=;
 b=B1tOEGOKjqWHlZXwXq8fFnsoOv3U/GhrgYkatN5g/Z+bGDS9hirqr6ui9IwD6eyva1
 r/mVhRJFhZfWTJP0no9BYaFeQH2hF3sJ/KipywaqcgcgQMvdpegKZmZxFsxxhw9w5fCS
 /tLIrhu9cWpWpOeUkFx6mlyhBvlJK4PDFiDNT8Nzv6SPUhAoqZUZXqewyjXY8WO9yzDh
 uaHcomsjPmlNhknkFG9G9qDdV3zMjHM3OiJ4hMBgqcaUzm1k33tFuP9nrkFkrG7wMH5G
 spmr1o01CTgITSdvvxl5WtImbGzCd1G0cB/6hmGxBsupVXvr88sH1qOqCW0nYEb7dDnW
 SDiw==
X-Gm-Message-State: AC+VfDx1q3dWp/N/Yx5yZnoFckiKocmNb85hoBFufUmz7nCsAxMRx8xi
 92uTMN7rsLKM9VeESW0+tjJF/g==
X-Google-Smtp-Source: ACHHUZ6MtW/fwrulDZ8ekEwhTTCfNB70+YNS8JglOhUJ4Pw1CE2CQKRe4C1FFLtXGHIFStxMsWuezg==
X-Received: by 2002:adf:f191:0:b0:306:39f5:afd0 with SMTP id
 h17-20020adff191000000b0030639f5afd0mr28965020wro.21.1684222102509; 
 Tue, 16 May 2023 00:28:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a056000015200b003047d5b8817sm1523302wrx.80.2023.05.16.00.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:28:22 -0700 (PDT)
Message-ID: <954e70d0-ccc8-ad99-124e-07b6b46fc68a@linaro.org>
Date: Tue, 16 May 2023 09:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: dw-mipi-dsi: Drop panel_bridge post_disable
 call
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20230513201030.514861-1-marex@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <20230513201030.514861-1-marex@denx.de>
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/05/2023 22:10, Marek Vasut wrote:
> This panel_bridge post_disable callback is called from the bridge chain now,
> so drop the explicit call here. This fixes call imbalance, where this driver
> does not call ->pre_enable, but does call ->post_disable . In case either of
> the two callbacks implemented in one of the panel or bridge drivers contains
> any operation with refcounted object, like regulator, this would make kernel
> complain about the imbalance.
> 
> This can be triggered e.g. with ST7701 driver, which operates on regulators
> in its prepare/unprepare callbacks, which are called from pre_enable/post_disable
> callbacks respectively. The former is called once, the later twice, during
> entry to suspend.
> 
> Drop the post_disable call to fix the imbalance.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index b2efecf7d1603..63ac972547361 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -859,15 +859,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
>   	 */
>   	dw_mipi_dsi_set_mode(dsi, 0);
>   
> -	/*
> -	 * TODO Only way found to call panel-bridge post_disable &
> -	 * panel unprepare before the dsi "final" disable...
> -	 * This needs to be fixed in the drm_bridge framework and the API
> -	 * needs to be updated to manage our own call chains...
> -	 */
> -	if (dsi->panel_bridge->funcs->post_disable)
> -		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
> -
>   	if (phy_ops->power_off)
>   		phy_ops->power_off(dsi->plat_data->priv_data);
>   

Waiting a few days before applying

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
