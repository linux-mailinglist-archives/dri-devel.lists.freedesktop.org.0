Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A7911311
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE7410E30F;
	Thu, 20 Jun 2024 20:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B/Fk4nNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7310E30F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 20:22:19 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so15624871fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718914937; x=1719519737; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lOvYMghuPF6rvmiNqyAE5UU+Cu5JdSGdpel/er+AFsg=;
 b=B/Fk4nNikjHD4dNZ/UkkLzeciORjy781oNMua7isBSbLqmGxBJmOtk/xzmQze9hLs7
 v8trNEsnBAPDpuzGckaFS95NMJAhiM3JnKkmlsvSs+36hDaIgmrvqP215i89YYaSl/PS
 Ot9I9ALtLn+gOArwrlC03kQGOCCmLYZ7pbd2ZzSFIZj/NRB9ts3eRUPySVqwR5StX0+q
 zV9z68dux07iWUJV51Ik5+QsEjFWReQWW04AvPz0aKowtbZ62RLre4pZK7NA9BI+i9is
 dZDOT1sHNmrMOBK/t0m9cooT9qbi9Aqdh1v6RnPsdckO9Pb0nMoAYNHx3JyqmUpiA5ML
 pKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718914937; x=1719519737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lOvYMghuPF6rvmiNqyAE5UU+Cu5JdSGdpel/er+AFsg=;
 b=WVFCcQJNhvMtPoOs5eSZLldbCTrBEU7EKdk0qvqC69/u3LZpte06RE9i2yok2tWEP3
 Jd5yNQxGGxGbxKTGi8hrZOqCmnA3MCdpkVDuHuo++04FvR6cUzegga47qpfEbEfnuzJH
 2cB9YMfCnVNO86SiiP1hsAlx8ovvW9WR07LRSDD6GHOOttEOsClHGIoGzaIi9lm6sXBJ
 619iCqO7lIKBHBSXm/3NQh+X7BH7rgmlbM+oiSBZ22UG1rsRaLnUhv09We4cgXDAc1ho
 rU7rfa6HQkQz40AsvXpHSuBdxU3bhLIv22UoGuZF9hKj24aKP80+i8Dc6DexWeA2A/1l
 qHRw==
X-Gm-Message-State: AOJu0YxeDXLJ5QPI8xRslouDnSqBA5ZrfpGRrmT1WnUzGZwvRAJSiBO7
 1KTIwmNN83nd5eguS1zLvHMhrhNFlZYb3OY8p9dPKgPmOF5g2jogHRspHLSuEII=
X-Google-Smtp-Source: AGHT+IGiaHRg7jR/WYQboUkDnyBsqb7OqSvEkiFZuFC3QRtuiPZzbScBg4tpeD3wwsA+RSMqYyxzFQ==
X-Received: by 2002:a2e:9bca:0:b0:2ea:e773:c58 with SMTP id
 38308e7fff4ca-2ec3cea10d1mr38061221fa.24.1718914937186; 
 Thu, 20 Jun 2024 13:22:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d76f728sm116721fa.120.2024.06.20.13.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 13:22:16 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:22:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, victor.liu@nxp.com, 
 sui.jingfeng@linux.dev, aford@beaconembedded.com, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] drm/bridge: adv7511:  Fix Intermittent EDID failures
Message-ID: <bsfvj5st6s3m5bvegkaq6sqrojq7obevsxf2wlffs5ewrz7hog@yrpq7azq7b6k>
References: <20240601132459.81123-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601132459.81123-1-aford173@gmail.com>
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

On Sat, Jun 01, 2024 at 08:24:59AM GMT, Adam Ford wrote:
> In the process of adding support for shared IRQ pins, a scenario
> was accidentally created where adv7511_irq_process returned
> prematurely causing the EDID to fail randomly.
> 
> Since the interrupt handler is broken up into two main helper functions,
> update both of them to treat the helper functions as IRQ handlers. These
> IRQ routines process their respective tasks as before, but if they
> determine that actual work was done, mark the respective IRQ status
> accordingly, and delay the check until everything has been processed.
> 
> This should guarantee the helper functions don't return prematurely
> while still returning proper values of either IRQ_HANDLED or IRQ_NONE.
> 
> Reported-by: Liu Ying <victor.liu@nxp.com>
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID retrieval w/o IRQ
> ---
> V2:  Fix uninitialized cec_status
>      Cut back a little on error handling to return either IRQ_NONE or
>      IRQ_HANDLED.
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index ea271f62b214..ec0b7f3d889c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -401,7 +401,7 @@ struct adv7511 {
>  
>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
>  #else
>  static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>  {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> index 44451a9658a3..651fb1dde780 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
>  	cec_received_msg(adv7511->cec_adap, &msg);
>  }
>  
> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>  {
>  	unsigned int offset = adv7511->info->reg_cec_offset;
>  	const u32 irq_tx_mask = ADV7511_INT1_CEC_TX_READY |
> @@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>  				ADV7511_INT1_CEC_RX_READY3;
>  	unsigned int rx_status;
>  	int rx_order[3] = { -1, -1, -1 };
> -	int i;
> +	int i, ret = 0;
> +	int irq_status = IRQ_NONE;
>  
> -	if (irq1 & irq_tx_mask)
> +	if (irq1 & irq_tx_mask) {
>  		adv_cec_tx_raw_status(adv7511, irq1);
> +		irq_status = IRQ_HANDLED;
> +	}
>  
>  	if (!(irq1 & irq_rx_mask))
> -		return;
> +		return irq_status;
>  
> -	if (regmap_read(adv7511->regmap_cec,
> -			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
> -		return;
> +	ret = regmap_read(adv7511->regmap_cec,
> +			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status);

There is no need for the ret variable, regmap_read can return either 0
or a negative error code.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +	if (ret < 0)
> +		return irq_status;
>  
>  	/*
>  	 * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of RX


-- 
With best wishes
Dmitry
