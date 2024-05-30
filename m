Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987158D4582
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462511B514;
	Thu, 30 May 2024 06:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wUHbJc2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5581E11B4FF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 06:37:41 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63947so170882a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717051059; x=1717655859; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kPh8VLFqGiI+tH1uAPQnmuZ7TXsqcVMc+OlD3shtzK0=;
 b=wUHbJc2sYrXscbuiK+0B1TD3pKE8K3rPFcoKI4rlQ6qeufp8C4yFY5dpw4yZYrQrRm
 Rq+n+Zr0ts31vnsgAzk7VXLuxz0ELDc0G5eHdpVuFcnj9k5FjUzcISAPKgAGLhGUhZbJ
 4jeBioM6+sGaoRS77J3Q+8GAGQ25hlxIfa/H5rP1XPPvnmSR1Z5JsmRGtmjUWio9fvhb
 Z+BULA3HMi0WTZ0xYTy3ut/M00Gt8Iv99ctqm3xdN1EPeND64rsg2vhrfFF1Em6mNAkY
 lk0leiGlhmniY5JQk8DIz9BwxdYxCemBop1eFvkJRY+n14ieoqzW1ghk5QHax72nUcoM
 jslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717051059; x=1717655859;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPh8VLFqGiI+tH1uAPQnmuZ7TXsqcVMc+OlD3shtzK0=;
 b=lkAZc3qEkzpcAGaQdExRYYBe52QhD2tUuzSAOUXWXPl59IQ3K9jhtKjgLrFLztGlWs
 ZdzFd2M6Hz6lnLcCX5iAnbrfTPvd622Y0UyflVlu720r7H6hR7xICedre4o29DlDDIqB
 2nhV3j8iI7b9RSd1P5CMHdSrNQtH9Ono00jvE16lEMP8zoH56F6qNXNJVKY4lt0a0Y0R
 kpXYdH1PVpyFSDtq9qb3z8TE2eNznz/6FhrNb5pY5HoQkhKByd6MYWqr70RPNhZXYWg6
 /MjW6JTavyO5wmLfdFyB2CbkePz+djmhsEcGAX4hbWos+FMpYWT1rLqCEFF2+nSmyh9x
 Fy1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi6Z4i7DOLCbUvHI6lqQUzYhydunWWWCU3ndrjWfl4v9Aa31LUlPVx6GaDh3OBjRKoQGLx83C8l8UtaoLp2N+KegxKJdf7/07dD/F6N//9
X-Gm-Message-State: AOJu0YxijxmXSTP2rxGIrnP90bQhFCUf5pzcV+hYPg1DmsTqSX+4IoUE
 yXuikUiYgzl9HLuwUSu9a2xMKiWrPw7OTEqcIgSbynjT6dYaCokPHfiehI6BPI0=
X-Google-Smtp-Source: AGHT+IG58ojdsX4BmxtP/Bpc7KHEVVJgxF4twZVOBR7WGhJA36YAA2YN/IutMaNtxo384yPdBxYKtw==
X-Received: by 2002:a17:906:6a1b:b0:a65:ab25:24da with SMTP id
 a640c23a62f3a-a65e8e4c925mr88419866b.22.1717051058980; 
 Wed, 29 May 2024 23:37:38 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc5150fsm785325266b.102.2024.05.29.23.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 23:37:38 -0700 (PDT)
Date: Thu, 30 May 2024 09:37:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 4/9] media: platform: microchip: use
 for_each_endpoint_of_node()
Message-ID: <330e0f46-567a-460c-ad88-1f6acb2c2fe4@moroto.mountain>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
 <87fru0oxyq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fru0oxyq.wl-kuninori.morimoto.gx@renesas.com>
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

On Thu, May 30, 2024 at 02:06:05AM +0000, Kuninori Morimoto wrote:
> diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> index 5ac149cf3647f..60b6d922d764e 100644
> --- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> @@ -353,33 +353,29 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
>  static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  {
>  	struct device_node *np = dev->of_node;
> -	struct device_node *epn = NULL;
> +	struct device_node *epn;
>  	struct isc_subdev_entity *subdev_entity;
>  	unsigned int flags;
> -	int ret;
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
> -
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> +		int ret;
>  
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {
> -			ret = -EINVAL;
> +			of_node_put(epn);
>  			dev_err(dev, "Could not parse the endpoint\n");
> -			break;
> +			return -EINVAL;
>  		}
>  
>  		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
>  					     GFP_KERNEL);
>  		if (!subdev_entity) {
> -			ret = -ENOMEM;
> -			break;
> +			of_node_put(epn);
> +			return -ENOMEM;
>  		}
>  		subdev_entity->epn = epn;

This code is an example of what Laurent was talking about.  We're taking
storing "subdev_entity->epn = epn" but then not incrementing the
refcount.  Perhaps it's not necessary?

The difference between this and _scoped() would be if we stored epn and
then returned.  I feel like that's less common.  We could detect that
sort of thing using static analysis if it turned out to be an issue.

regards,
dan carpenter

