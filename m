Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F68889FA2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F0010E1A0;
	Mon, 25 Mar 2024 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ns0XlaV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E1010E45A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:35:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56bc5a3aeb9so5561362a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711370106; x=1711974906; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bWqmr4tJSgMTZuBlY7silaTC/ghGytqv25bJf51WJeA=;
 b=Ns0XlaV7DIa1XFtIYOlJ1FsWJiqSg8jDe4vBvPvhJoFr/LejJvIxkHZq7TOnkqJ6wg
 5zXDqJ/lEwb3yc0TPfEM6qWO/+M/lhUBBLAGzpXiBkvWrQtCniYaZVMdKxZ520spzFJP
 yH6D8y+hj3IMwF8blQhpssjMZbtpvXZxGNd7Ngdxtsxr23J189xh5ghjx99cXtJCjs9E
 4AkCPGH5+iagcN8gU0zEwR6F943pa6XOGx1tbxUFjX5A65ZuLcp+UTjNB1TF71KhGgwv
 MQsGSqNqvM/3nQ/eosfPUGDeEcq2lbNFtHBhhpix0NEPMU8cbYsVy7jewhgcB1T911Fp
 ZRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711370106; x=1711974906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWqmr4tJSgMTZuBlY7silaTC/ghGytqv25bJf51WJeA=;
 b=YusiJd6VND/VB2b421mxbtgEj7wLbMi0lgPSuNVENJKRZISuaMvcL42x9c2VoFcGV0
 VtxYOXsu9dURdJULdrC7X1AYjxBa784rU2Czms+GdxFLav97b/NLbi0vAV9EjDf8lLQ9
 D5R+Ls3eKxXpfva6t2SJYSy+9sF8MbAep/K9PKqfgI5tX9mWKaTSTXztEnv0TaSRbuOV
 4H8y0sdoQzRUSahEd5XAufOSeCbmkSRntG3TtN7JhSNSVENa6SWvz6/jJVh9sOpmQi10
 47siIXyDgERXWA1/q7TSTH0YNxmuiw/5HsMJapOvGi6OGa5PFYIs9FO0Ll3SlK8QZwG0
 HTjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXthAOfJMBuIL4YHkD6n/W/4f8HFA3qk9qlZraKVTrqLrzZRm3CfmR+R4nX2BdefCR17SBAbh3I1TCA4N21X137PUDL31u9vwH7PoqkUOoR
X-Gm-Message-State: AOJu0Yzm/cXCB07l63b059D1eviz4OUp7Dd1CMVCzVMwKTYQB2bqp+/p
 9TjQHHRjweb7/X/bu52ZnTpPR1KprBFcp7B5o0xl3wa7NojKb5HJITbQBh/jB68=
X-Google-Smtp-Source: AGHT+IH8Cn89ggEfIANbpUmr3OPCf2JNAzSSROYWGxG3Th6G6cN11daoFg65mxm7kIJzyF7KMVoTFg==
X-Received: by 2002:a50:d786:0:b0:567:ff26:4bcb with SMTP id
 w6-20020a50d786000000b00567ff264bcbmr4510771edi.30.1711370105691; 
 Mon, 25 Mar 2024 05:35:05 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 s21-20020a056402037500b0056bdc4a5cd6sm2947522edw.62.2024.03.25.05.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 05:35:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 15:35:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
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
Subject: Re: [PATCH 4/8] media: platform: ti: use for_each_endpoint_of_node()
Message-ID: <02d6efba-6d1c-465f-a06d-cf7c02656e21@moroto.mountain>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
 <87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, Mar 25, 2024 at 03:05:27AM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   |  8 +++-----
>  drivers/media/platform/ti/davinci/vpif_capture.c | 11 +++++------
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 77e12457d149..4f185a0d42b3 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2306,14 +2306,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  	if (!pdata)
>  		return NULL;
>  
> -	for (i = 0; ; i++) {
> +	for_each_endpoint_of_node(dev->of_node, endpoint) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		struct device_node *rem;
>  
> -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> -		if (!endpoint)
> -			break;
> -
>  		sdinfo = &pdata->sub_devs[i];
                                          ^
"i" is uninitialized now.

Also in the initializer it has "struct device_node *endpoint = NULL;"
which is unnecessary now.  And at the end it has:

	of_node_put(endpoint);
	return pdata;

Since endpoint is NULL this was always a pointless no-op but now it's
more obvious, so lets delete that.

regards,
dan carpenter

