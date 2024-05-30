Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367E38D458C
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F79C10E622;
	Thu, 30 May 2024 06:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NoP8c65P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CF710E622
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 06:40:11 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso260260a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717051209; x=1717656009; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hbYS8lpXExj7GV7sixwHtaV70JUaIYUrLKDua6V9Rwg=;
 b=NoP8c65Pcc06E7WI3abSCMRpBv6nyOQvxE91Cre7/Vwye7OCjVDw3QRyjWOoaiTVfR
 YFsNbf2jVKyUVxGCsbaM5L77pFHGh9KyC1IMTYYzI9H6tbP9V/7Tv8+IOFUkdjSH4gPe
 MsIEGGOVkKPrjmFgrQgHHlww4TCOck/CAdPRzKjXD0juDcL/8D69pl7ZUdSfsZ48cN36
 nrqj7uQgmvFzxy625bbxMhnrWBMhfwS6lVfKxTrAZyNf3hnaeazudLbbvoy93Ap9BFt5
 oiRD1jVhXLumF1Bg002xzOM0WRHfpAZ3Ci+SvbYqjBG4nSmOgsuMg7kyMEy5xxp19TJX
 UD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717051209; x=1717656009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbYS8lpXExj7GV7sixwHtaV70JUaIYUrLKDua6V9Rwg=;
 b=ZQreD68lxBDDMQFgnFpDzYp73mMrJsS36Q23nd9lo3p52R0gHwfVA6VJuDjx+y5Saf
 gN0I20DRTgO63gNFk/Jdjn0YehKA4T7YtkT45Rz2qWP1YnPCU1Emzp0cx/lSjb70KIgB
 Dj10FVYwnfkXHV3qJokv4DSPzuuxtMTJWHATRQN7JnKzOGJ+hOzjQvaiKuv3SHF5er0e
 oyA+8xuwLTElRm/FlljvJdc8rvMhR8utFh1WCGy5yFpRyHgorzdfjuw7YtRE2rKPFkWK
 9n5ZhzFqb4nIE1Sk4iOCQ5TdXUy9PSVkwFPc5rhjObzQIVku/8XKn1Ntgj5kp5mBokNT
 uSkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6fTEYW2uUo9SH1+F25jpY1+bDHnBnafRvUhmaFWFM4zyuQ0ZFtaRB0pRpuAYU94+6mujLJa9ymBtEle2wSVRxB1eaBveVRwJS2lE6SZOA
X-Gm-Message-State: AOJu0YweST8+LtK0xTcnfyN5HxmqDAifAJHqeT2PtfMm9DwG4BwllCMK
 w/bY8hYC6W2Cqso84AmWJVsFK+7538o0hDKUnNCt0OoSpvvQ1J9waPge/JQz7pE=
X-Google-Smtp-Source: AGHT+IE6/VTwKZTsEcVkjHDXiwR4jbhWUjQNX+Zpjmyoqeke5OVHzCiHycLfInR8VWcYgsER/P3wXg==
X-Received: by 2002:a50:9316:0:b0:579:c2fe:886 with SMTP id
 4fb4d7f45d1cf-57a177b15b9mr645619a12.14.1717051209214; 
 Wed, 29 May 2024 23:40:09 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579d69b49basm4770207a12.88.2024.05.29.23.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 23:40:08 -0700 (PDT)
Date: Thu, 30 May 2024 09:40:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: [PATCH v3 7/9] staging: media: atmel: use
 for_each_endpoint_of_node()
Message-ID: <f0f1b989-2166-44ad-ba70-caf56a4d93c4@moroto.mountain>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
 <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>
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

On Thu, May 30, 2024 at 02:06:22AM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../staging/media/deprecated/atmel/atmel-sama5d2-isc.c    | 8 ++------
>  .../staging/media/deprecated/atmel/atmel-sama7g5-isc.c    | 8 ++------
>  2 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index 31b2b48085c59..3b28a232418a9 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -333,20 +333,16 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
>  static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  {
>  	struct device_node *np = dev->of_node;
> -	struct device_node *epn = NULL;
> +	struct device_node *epn;
>  	struct isc_subdev_entity *subdev_entity;
>  	unsigned int flags;
>  	int ret;
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> -
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {

This introduces a Smatch warning because now "ret" is uninitialized if
the for_each_endpoint_of_node() list is empty.  Is that something which
is possible?

I've been meaning to make a list of loops which always iterate at least
one time.  for_each_cpu() etc.

regards,
dan carpenter

