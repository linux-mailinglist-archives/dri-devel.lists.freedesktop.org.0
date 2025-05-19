Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1CABC4C5
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DF410E27E;
	Mon, 19 May 2025 16:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JnEbd1Yk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5938410E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:40:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 8EE90580C6B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 15:47:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BE0C42E7E;
 Mon, 19 May 2025 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747669652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpIHfuwXpeYEx8QkXgjwWqZInjNQyntE9cjhY6vEq3c=;
 b=JnEbd1YkBHKCppq0wWtn4AXrDAPeC7XR/Bw/usI+H0c7GtFr+dPPciNz9WaQk+7mU80BAk
 SrWIf+sOD14/IS1JjgReVPaJasBvK38hcdYppIYkK9DgMrSXwQZP/xiOTiATOsbT9vixBp
 UU7pXNviayTOoDwSA8TLRw2lvltA9y3cviIXS0OEvFk03F/npjs5fDP9ZnaZIdOkdIiEOl
 pjX3HzTuhtqkqhcfqGrWwOVFSs6JD44EnBVp28XAJMZ8/pHx3a2vyhvOGS/YRZT26O+0i1
 B7t4LRwx662korGpXeSzWeh62Dz6HxjGhWkTjE4jjsen9gX5V24c5Llt8nYhGg==
Date: Mon, 19 May 2025 17:47:29 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Tony Lindgren
 <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, Jean-Jacques Hiblot
 <jjhiblot@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Saravana Kannan
 <saravanak@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v5] backlight: led-backlight: add devlink to supplier LEDs
Message-ID: <20250519174729.44fa1f7b@bootlin.com>
In-Reply-To: <20250519-led-backlight-add-devlink-to-supplier-class-device-v5-1-76d6fd4aeb2f@bootlin.com>
References: <20250519-led-backlight-add-devlink-to-supplier-class-device-v5-1-76d6fd4aeb2f@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddujeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghltheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhinhhgohhohhgrnhdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrt
 ghomhdprhgtphhtthhopehprghvvghlsehutgifrdgtiidprhgtphhtthhopehjjhhhihgslhhothesthhirdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Luca,

On Mon, 19 May 2025 17:16:39 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

...

> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index d2db157b2c290adc3a159023e9e2394fc877388c..8fe645b5b75447d009e1045dcf0c62d3bbc5425e 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -209,6 +209,19 @@ static int led_bl_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->bl_dev);
>  	}
>  
> +	for (i = 0; i < priv->nb_leds; i++) {
> +		struct device_link *link;
> +
> +		link = device_link_add(&pdev->dev, priv->leds[0]->dev->parent,

It should be priv->leds[i]->dev->parent instead of leds[0], shouldn't it?

> +				       DL_FLAG_AUTOREMOVE_CONSUMER);
> +		if (!link) {
> +			dev_err(&pdev->dev, "Failed to add devlink (consumer %s, supplier %s)\n",
> +				dev_name(&pdev->dev), dev_name(priv->leds[0]->dev->parent));

ditto

> +			backlight_device_unregister(priv->bl_dev);
> +			return -EINVAL;
> +		}
> +	}
> +
>  	for (i = 0; i < priv->nb_leds; i++) {
>  		mutex_lock(&priv->leds[i]->led_access);
>  		led_sysfs_disable(priv->leds[i]);
> 

Best regards,
Hervé
