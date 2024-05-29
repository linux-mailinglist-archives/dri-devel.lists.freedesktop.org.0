Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA318D3967
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E77910E57E;
	Wed, 29 May 2024 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="APf2MVNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D771810E992
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:34:49 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52b0d25b54eso1121007e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716993288; x=1717598088; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8JbUSA/b9Yufp8s/14Kjq4lmABtbQeUkHaO5aqXlw+o=;
 b=APf2MVNaJjUWt+2TRiRDj/IFrAuD8PFX3hBPlxSjXwDvVwDLeZaWNhVA53PSH8HXz1
 J3nh/3sCl2P/vF0XrKhzUN6XFJ4+aHvCUTM9fQaj3G7M3loVzxcBDR4S3tRwoOt49e8C
 N4b5GVOUTkH4wepvri8W0C0T1AwMRWcxooZrZLmp1OMkw+c4HAQOoWeJJ51Ivdt6ZhOk
 GXYWy5PSOfPgv5AEvNDU2yfk6ekOzsk9ZMDGedxvwx3yJdZgUlHj1EJsvm2SXo5/jOlH
 2CrD3x/LoS+qQ7cNP5XzKh0qoUvJFPUwrkLYT+rfX7jV3861EczrKiGCXfqLM7GvqXoD
 Yxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716993288; x=1717598088;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JbUSA/b9Yufp8s/14Kjq4lmABtbQeUkHaO5aqXlw+o=;
 b=lKtQ5pdSmhKpms4ky7k2HsnGZMvLzwHblpXLOktpchvOz3dbzcSCBrRoTkMjNpMTd+
 jjvqU/LCPhQn6cYTQBnUoQK3oPsZfj+aj0mOSMAUr3+UteFC+HO4VtFFd/uoqxuTt52+
 q7s4u1GGFOFg6jg0cEiH2U4w5WYCPFFQy/2y3jfYWH9nnaaQseR6CNJmXRe6D0r+W+Gw
 GtrUnRg3IUa7nCVDLRZ8my2lLlO6kFQp8v93uwYvfusHPuifVx6xyg4CdssZu5ofrbVx
 qiz0l1eEUP8KE/N+B9iipe8iIIMIuxp/rPSfLpCoznvN2+Upu+xqHN6jkiDkz0ZzuvnU
 DeGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZafKNybJS79N5apcIppdkqEDAiMsQB0oZhqW8Mhu/vBwCobbkOyvRm72cFZmvItSbXI1ibVbc3EYZTxGbKx+H3vDIN15WILpJbeJERqP6
X-Gm-Message-State: AOJu0YzfwfTRrYMYhsWo2Iq7hvmQ/I0304M+RT/uPrYD0bvxNUIiFt/p
 KNeH/uGM286HMI0C3iuUAh2KiX+d25XqN9V8dNA/zjldscimyspcORZBBHPWaZE=
X-Google-Smtp-Source: AGHT+IG3K+ljsCGYaD/stGYSzU8eiALGsrunqkKd/2A+qzz3MjkiDrfMI9pSxgVRd/o4UWSEa9q4pQ==
X-Received: by 2002:a05:6512:527:b0:529:b691:e37e with SMTP id
 2adb3069b0e04-529b691e9d2mr5105087e87.40.1716993287614; 
 Wed, 29 May 2024 07:34:47 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a64a03e574dsm74882966b.14.2024.05.29.07.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:34:46 -0700 (PDT)
Date: Wed, 29 May 2024 17:34:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
Message-ID: <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529004047.GB1436@pendragon.ideasonboard.com>
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

On Wed, May 29, 2024 at 03:40:47AM +0300, Laurent Pinchart wrote:
> > @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> >  	}
> >  
> >  	/* Iterate through each output port to discover topology */
> > -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> > +	for_each_endpoint_of_node(parent, ep) {
> >  		/*
> >  		 * Legacy binding mixes input/output ports under the
> >  		 * same parent. So, skip the input ports if we are dealing
> 
> I think there's a bug below. The loop contains
> 
> 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> 		if (ret)
> 			return ret;
> 
> which leaks the reference to ep. This is not introduced by this patch,

Someone should create for_each_endpoint_of_node_scoped().

#define for_each_endpoint_of_node_scoped(parent, child) \
        for (struct device_node *child __free(device_node) =           \
             of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
             child = of_graph_get_next_endpoint(parent, child))

regards,
dan carpenter

