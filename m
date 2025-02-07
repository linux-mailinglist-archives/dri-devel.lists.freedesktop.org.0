Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2AA2CD42
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 20:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7DA10E291;
	Fri,  7 Feb 2025 19:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W8xlAnCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7627010E291
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 19:54:12 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso2517287e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738958051; x=1739562851; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ru1wvh36CbOfubIqIyD+5sQyMz21Y8aZYTgm/d3+5o=;
 b=W8xlAnCc6+lnZe7vUgvuPD1uI1SYoQjYRjx7XLA2X5TAHcuejslIuw/fOg2SCv6LOc
 /tVQtscCV9XjGdg8c+09EsciRYrZ8+GzjGusDCi7Jog+uTHk+XQ9AhqYfT/thJWHnkNn
 OzHnZMhBLjBts2FKJVygmhN/THwatRuDn0ElTYoJcahg/cX7GE5pxJwHfd8gkcOQ75C4
 vRIZ0LvZwVkPlajm7nVs9+rowOxsicq/maTW/k7EhTBVq/ctJH38QnxToXrlnZn8wCCj
 4WBXBlaTeBW82VzxMZQyUSDRW8+s8YzrsWtE7sen3pitAMn7tgr6DiPI1QVcfZfIaJMJ
 al7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738958051; x=1739562851;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ru1wvh36CbOfubIqIyD+5sQyMz21Y8aZYTgm/d3+5o=;
 b=vqOv8v//g7sQjTyW6j3cX9WLv5hPn4FmXOa12GFpyr01e0aQxEPzfIqEIAIcguj0cF
 geZg+0ih8GU6CLQQmV4b3kDNJefszCPA5kYO/dlYeaUgFuZ6XhzviXO5LjlFfdBav9t/
 y+2uMMEmyX91Oq29zTxJpu5CtFbfwNNyzlu+4WohsvemR+Lg88s4akN/ZGI1DhiKWBwW
 RT1U0PdvBqw4qKpzz3xNFl8S8xBEB53gipL7xnFCz93CxzK2xRx1967wWwJyQHdNAtV1
 uleRnrKX+bhr1BX2S6LzaiSLFUhhdhj665NhxvHzleZaSx8LpPwlv1u2aWqaR2TW5EVp
 JlPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDFlPMmZ2WAMDVdlpYkLIljcf+N0zmdsgseoxtLfZWWQt7wzM+NHDTo3QW9Pdc9dcbVybOk9BTCwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiL3n+zFv4/xLzRyFUwOI+sjrsvA19gzj1kgXC1nUmnfJ6s9QA
 QFdabs5KffDFg99xrgsxqGvtZO+L6a9B0IjJHDd9XYj0miMQS4ZnCu10FnW6h+M=
X-Gm-Gg: ASbGncsNyC+D9mtNQ0X/GwOK6WxUGZxpaqromruz2KTLJG/aMldiUqgi8sFGJOSI3ij
 P8g1rR7nyabOLV8FFMguJt2kivoCsTtiu+1PJkfrJOYyK0vS7Z7hnAZfa0zdQMhGDyxWNiAlW/z
 q6F6tnfFnIZ3Uo+evQ61FYv8GEAqYmvDBHeZxcl9rNU/O7/54e7/9FBLR5j7GM2qH08TM1QeDNq
 sThXCgNUcDfx1ZLbykxqXMZyXF9/zy/087MWyLLo2L2n1w9B+idvjDLe/XR0/IkW1gyBuXbvF4k
 lQiVSm7punH++rH+4PSRkV1qhTLolYm4AYHGCgho0f2HbmIw83SJNL/MZGBaynZRTWgV8yo=
X-Google-Smtp-Source: AGHT+IFAea/MRPW5NqZuydSkxXmqLttpsbttAcYS0zhETRXM+wh1dfpRWMrPcOicMETtA2XEcZqpWg==
X-Received: by 2002:a05:6512:108d:b0:540:2a92:7da9 with SMTP id
 2adb3069b0e04-54414ab5605mr1626033e87.21.1738958050673; 
 Fri, 07 Feb 2025 11:54:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54502a4efa2sm58959e87.195.2025.02.07.11.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 11:54:09 -0800 (PST)
Date: Fri, 7 Feb 2025 21:54:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
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
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-ingenious-daffodil-dugong-51be57@houat>
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

On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > DRM bridges are currently considered as a fixed element of a DRM card, and
> > thus their lifetime is assumed to extend for as long as the card
> > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > require DRM bridges to be added and removed to a DRM card without tearing
> > the card down. This is possible for connectors already (used by DP MST), so
> > add this possibility to DRM bridges as well.
> > 
> > Implementation is based on drm_connector_init() as far as it makes sense,
> > and differs when it doesn't. A difference is that bridges are not exposed
> > to userspace, hence struct drm_bridge does not embed a struct
> > drm_mode_object which would provide the refcount. Instead we add to struct
> > drm_bridge a refcount field (we don't need other struct drm_mode_object
> > fields here) and instead of using the drm_mode_object_*() functions we
> > reimplement from those functions the few lines that drm_bridge needs for
> > refcounting.
> > 
> > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> > bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> So, a couple of general comments:
> 
> - I've said it a couple of times already, but I really think you're
>   making it harder than necessary for you here. This (and only this!)
>   should be the very first series you should be pushing. The rest can
>   only ever work if that work goes through, and it's already hard enough
>   as it is. So, split that patch into a series of its own, get that
>   merged, and then we will be able to deal with panels conversion and
>   whatever. That's even more true with panels since there's ongoing work
>   that will make it easier for you too. So the best thing here is
>   probably to wait.

Luca and I had a quick chat on this during FOSDEM. I really think that
panel (part of the) series can go in first as it fixes a very well known
bug _and_ allows a pretty good cleanup to a whole set of drivers. With
all those panel / bridge wrappers gone we should be able to see a
clearer picture of what individual drivers are doing. In other words,
which memory and which code actually hosts and uses internal
'next_bridge' reference.

> - This patch really needs to be split into several patches, something
>   along the lines of:
> 
>   + Creating devm_drm_bridge_alloc()
>   + Adding refcounting
>   + Taking the references in all the needed places
>   + Converting a bunch of drivers

The last two parts seem troublematic to me, but, I must admit, I didn't
spend so much time reviewing all drm_bridge usage patterns.

> 
> > Changes in v6:
> >  - use drm_warn, not WARN_ON (Jani Nikula)
> >  - Add devm_drm_bridge_alloc() to replace drm_bridge_init() (similar to
> >    drmm_encoder_alloc)
> >  - Remove .destroy func: deallocation is done via the struct offset
> >    computed by the devm_drm_bridge_alloc() macro
> >  - use fixed free callback, as the same callback is used in all cases
> >    anyway (remove free_cb, add bool is_refcounted)
> >  - add drm_bridge_get/put() to drm_bridge_attach/detach() (add the bridge
> >    to a list)
> >  - make some DRM_DEBUG() strings more informative
> > 
> > This patch was added in v5.
> > ---
> >  drivers/gpu/drm/drm_bridge.c |  76 ++++++++++++++++++++++++++--
> >  include/drm/drm_bridge.h     | 117 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 189 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 1955a231378050abf1071d74a145831b425c47c5..f694b32ca59cb91c32846bc00b43360df41cc1ad 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -200,6 +200,57 @@
> >  DEFINE_MUTEX(bridge_lock);
> >  LIST_HEAD(bridge_list);
> >  
> > +/* Internal function (for refcounted bridges) */
> > +void __drm_bridge_free(struct kref *kref)
> > +{
> > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > +	void *container = ((void *)bridge) - bridge->container_offset;
> > +
> > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);
> 
> Pointers are not really useful to track here, since they are obfuscated
> most of the time. Using the bridge device name would probably be better
> (or removing the SHOUTING DEBUG entirely :))

bridge device name or bridge funcs (I opted for the latter for the
debugfs file)


-- 
With best wishes
Dmitry
