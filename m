Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7FA2CD09
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 20:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C2810E290;
	Fri,  7 Feb 2025 19:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ukTA/0mF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404AA10E290
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 19:47:08 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5441db195a8so982484e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 11:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738957626; x=1739562426; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Nnc+VLoNy3XrMrlSAm4S+smEOzp9c+gb/eHhOZ1VIc=;
 b=ukTA/0mF3m1UY2TNyFUb5YGXLkLi1Hr9+HcgO85QNGyQOLewLkeWeQZ3rd37OiyimA
 dh0cSOHBR0D8fsfyO7Xd3aEP0t2ttJf1vCAfE8mubZY1LmX43Uhp+qYs89Q4d6BZRwwF
 7/cFxoOdvUhC9Wb9KvFEZUbCEsAVlh17tgPQxxoE+KvribWcNj2bWr0pk/CxIPhBQldz
 mB75wMaBDPobSFDAqccfXy2clrFWSMEJQYJrxGqinKfadvbAG1ijUy46/H84X72UNVgZ
 Mg93JXRI9P+c7MVJLXq00pLvEpz8N2CpPqGaesfpg07Kj9vcNLffZcQZwsE9Q/gU2uhr
 wOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738957626; x=1739562426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Nnc+VLoNy3XrMrlSAm4S+smEOzp9c+gb/eHhOZ1VIc=;
 b=WGo+pLkKtgEtc4OCpimJRb3Vs2XP5wpXq63fGwI83Eu00+wY2I3JWTvtmBJMS6ELCC
 fQWb0rFyqDdrTwRY8BTBivpxud9PczmHyQxoJLuzRQKcpajwplPw9Zk29ihxzgI5NQ5L
 Ci7LvLqD1A1SZh4rrxCyeOS5Jskp9F7NEG34FXt38XEHddeKyIKdwIwzQ0CQZY7Axaz0
 nCkdE4/kw5m5zn85TE3wI1iA6X7PbyHWg/SFNyu8mmHIbYZ6vBy39BLKCGBBlZTrERGA
 jObidMG0kda0MdeOK+Md18XoKxZhZfj1JFsJDuX4q6iXWkNkzelKjVXHlYQcY21brZbo
 UyQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzQclgYMl3F8/tW2Ri00IwQ0o4A7fePe+j4V/w1az8EqGSr3wBbU1CSU1KTze1W41kL7Zfy3mi9lM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyquwik62c4kqUmzaY4+iWChe1KBdzB0LirwRXrEyyVvaU8XomS
 p4rlAL7ZPCsyQMeiX9YP9/UUSW1dDoLtPFMfyK9TvQcUIfvbGEJJPVEPxV98TXU=
X-Gm-Gg: ASbGncvpUKjKh/pehoSZixCmFeq3wHY/Ne87aOX2Y4cffwoQca+/dPkPGGygu6dQwam
 gaB3tweRC3XtAAzF9Z3M2ATpJALtDOsxgRZJEeTH8+yYIE5gRZs/DM/6C8ay5u2tPb7vv1sEoqX
 fj12k88ZuSugfiau1gCTWb2F3Xsce4CsRY9Sfzd1v42+ZFDo6oMJ8KxKGxDa8+j7rH5KDbRavyx
 YupFncPLZlX+g69mPAN9ORkhrqb/6eph16H62/D86fqTCW97JsugOpJwk0jlJwVQIPW9HX/2err
 uwJ3xHO5ykhIyedyp5X5EWDJwzCoDzD8w7kHOkmJ78Sq21JVDcitFLm//ywGpxd6nfqAYaQ=
X-Google-Smtp-Source: AGHT+IEX/wE6vKWAFwICx9CtlReQSMFmjn6yOfdCDmiizKZeJHyRie3LA+6lJskicwM/rhyEQV3BlQ==
X-Received: by 2002:a05:6512:34c2:b0:542:91ac:3f78 with SMTP id
 2adb3069b0e04-54414ab8364mr1217019e87.17.1738957626455; 
 Fri, 07 Feb 2025 11:47:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105bfd35sm545378e87.115.2025.02.07.11.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 11:47:05 -0800 (PST)
Date: Fri, 7 Feb 2025 21:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <7tul5avfkrw7potqif4xbv57o2wp5suuiiqna2gzcd2z4wwyxg@c2qu7bigul67>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
 <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
 <20250207095421.07ca853f@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207095421.07ca853f@booty>
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

On Fri, Feb 07, 2025 at 09:54:21AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 04:52:20 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> > > devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> > > do with struct drm_panel anymore, they just manage bridges. So move them
> > > from bridge/panel.c to drm_bridge.c.
> > > 
> > > Move also of_drm_find_bridge_by_endpoint() which is used only by
> > > devm_drm_of_get_bridge() and drmm_of_get_bridge().
> > > 
> > > No code changes, only move functions to a different file within the same
> > > module and add an #include as needed.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
> > >  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 100 insertions(+), 102 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> > >  
> > > -/**
> > > - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> > > - * @np: device tree node containing encoder output ports
> > > - * @port: port in the device tree node
> > > - * @endpoint: endpoint in the device tree node
> > > - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> > > - *
> > > - * Given a DT node's port and endpoint number, find the connected node and
> > > - * return the associated struct drm_bridge.
> > > - *
> > > - * Returns zero if successful, or one of the standard error codes if it fails.
> > > - */
> > > -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> > > -					  int port, int endpoint,
> > > -					  struct drm_bridge **bridge)  
> > 
> > I'd say make this function the main API instead (and name it drm_of
> > rather than of_drm, this can happen in the previous patch).
> 
> I agree there should be a small number of APIs for the foreseeable
> future (and any number of, hopefully decreasing-at-some-point,
> deprecated ones).
> 
> And I agree this one ^ and the devm_drm_of_get_bridge() below are
> equivalent, despite having different signatures, and so one should
> disappear.
> 
> So, time to think about what APIs we want. Some thoughts of mine:
> 
>  * I prefer "get" over "find", looks more intuitive as these functions
>    will drm_bridge_get()
>  * Is there a logic between of_drm_ and drm_of_? Just "the former is
>    old and deprecated"?

I don't know, it might be historical. Nevertheless, I think, having just
drm_ prefix for all DRM-related symbols is a good idea.

>  * Since getting bridges via the endpoint is the preferred way, I'd
>    like this function to have a shorter name than its variants
>  * Returning a struct drm_bridge err_ptr looks better to me than
>    returning an error and the bridge via a ptr-to-ptr, especially as we
>    don't have anymore the case of returning a panel or a bridge from
>    the same function
> 
> So, bottom line, we'd have:
> 
>  - struct drm_bridge *drm_of_get_bridge(np, port, endpoint)
>  - struct drm_bridge *drm_of_get_bridge_by_node(bridge_np)

I think these two are fine, please go with them

>  - devm_ and drmm_ variants of the above

These two are only necessary for the refcounted bridges. I'd say, skip
them as a part of the panel / bridge patchset. Please don't
overcomplicate it too much.

> 
> or a subset of these, in case some is not needed.
> 
> What are your opinions?
> 
> > > -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> > > -					  struct device_node *np,
> > > -					  u32 port, u32 endpoint)
> 
> ^ kept for reference
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
