Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09946A003E8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 07:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3CE10E264;
	Fri,  3 Jan 2025 06:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YPW3uDp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE06910E264
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 06:01:25 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401be44b58so12859571e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 22:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735884024; x=1736488824; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OqK1XsqQcMf7JAQsvOfW8bTjaqo69FlQkujpR6CdauY=;
 b=YPW3uDp/zTtlfxGNeFggMKGS0dCkRfB4Z4egSyJLVdft5BnMGOiexPwEeFK41OTJj6
 SzDnXjFF8UrSYDtMLgTPT7ujNXg2GK8F2oDamjVC8kHsyQubbed5A3o+bNfsK8Z6Madf
 z9at3DLAh0fBaMnmLcfrhkbsQdjjzEh0rCl0LGwaf4qgVBs96/vJc+u+rCx/httfzDES
 jad0JmvuP7+r/ORVdh3jezKD/Itb4E7Jj+58Z5tQ9tXaImq6W3RdqJU8Bykg2cIX6A1/
 4vWwtws6u1YO7+HAPIDPkQ7XycI4B04ry9jmJYr5a+oo2nQiycQnEukF5v7LSNZOgixN
 jNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735884024; x=1736488824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqK1XsqQcMf7JAQsvOfW8bTjaqo69FlQkujpR6CdauY=;
 b=hChsGN8p/D+T5V4IHG9J5uog5rRLr/6izB0vKHHymrpBz8Vm3T1tlMGruEUIs9cmrN
 b90MJLuq0nZG65lAPomwjIYjsNHdB9+F5M7D+K27lEzzGw9jzjM982zP7XuW7Iv4rg8O
 oh8Yve86jlE4t9XFHI+jHyUYglsK9JjaCTB1MxQ1GdoggBEoauvJoSAlWTJWpMSEvVi8
 DFTsBX2AkKKFoIfJ8laZoqqQE/qXjJ3UNM6YxX7BxGb8Qxatf8xV/W4c70b6EwLtlTNH
 vLHA8RQnu+sTmCf0OXN9iZ99j0zKQgr9P3uwtFp9doD26rYWE+kXLQ+gjNimCw37LDth
 cvXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBKdUeuO6tQagV4NvclvHGh63y3o9C8rMWAKVspEgwDfjoAz4iYDKjucDhBsAKVdP5Jr2LMbTgiUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7sdZly4Ct2zmGVn7l74bN5eKhDb0XGR93Fvv8N7OD8/BU4frU
 XDprbbrHebGmxht1mS4lYd94KbfCnmMwI0SvejczpDohNGnRlP9E+10XlzufVU0=
X-Gm-Gg: ASbGncvJoSrmPc5Whr7NtiOzfNf5i27YEdJq6Z/GCHqlWhEHMm6YZo+KoNnMAKBoTZL
 xEit67JEzMo1ntFAwcoGR7FB4PRBZZXVVjApK/2SzTitvO3hk8whyxt6WhAzhILptwv7EFXU2x1
 7ZknZZfgBrAlBUGHbZGqOwmgXVHwaHT/05sZHml4oYHLmX03qUHOearun/fU28anrfyr1M3+KCM
 0qXoi9Ik2XVBu3bEMHmH04/6if3PaqA+S2OtTpqS3DTINtwJS+wH0d5wGbtB8iaYwilfnr324Hk
 49E1i+8V/LyIHAaIU8Dq2yrqe9S/qtRIgIfX
X-Google-Smtp-Source: AGHT+IH3zYz7xZW+csvvf2W9sWK96IbaBnbltSVrtk8mtykDTw+7RfmJJMifDYxJfyLUrNG0Fzxe5Q==
X-Received: by 2002:a05:6512:239b:b0:540:19d8:148f with SMTP id
 2adb3069b0e04-5422954340emr16038660e87.32.1735884024223; 
 Thu, 02 Jan 2025 22:00:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223821665sm4038439e87.177.2025.01.02.22.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 22:00:22 -0800 (PST)
Date: Fri, 3 Jan 2025 08:00:20 +0200
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
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <bfi7nfq5cy3wwc7i4oqqcqmd23g3ukfsqcky24axfumby357on@i2xnhpihyss4>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102130149.5784c09b@booty>
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

On Thu, Jan 02, 2025 at 01:01:49PM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Tue, 31 Dec 2024 16:57:38 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Tue, Dec 31, 2024 at 11:40:02AM +0100, Luca Ceresoli wrote:
> > > Instead of using dsi->out_bridge during the bridge search process, use a
> > > temporary variable and assign dsi->out_bridge only on successful
> > > completion.
> > > 
> > > The main goal is to be able to drm_bridge_get() the out_bridge before
> > > setting it in dsi->out_bridge, which is done in a later commit. Setting
> > > dsi->out_bridge as in current code would leave a use-after-free window in
> > > case the bridge is deallocated by some other thread between
> > > 'dsi->out_bridge = devm_drm_panel_bridge_add()' and drm_bridge_get().  
> > 
> > I don't think that's how refcounting should work. Any of the functions
> > that give you the bridge should also increase refcount, requiring manual
> > _put() call afterwards. We might need a separate API for that.
> 
> You're perfectly right.
> 
> > > This change additionally avoids leaving an ERR_PTR value in dsi->out_bridge
> > > on failure. This is not necessarily a problem but it is not clean.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v5.
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
> > >  1 file changed, 9 insertions(+), 6 deletions(-)
> > > 

[...]

> > > @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > >  
> > >  	panel = of_drm_find_panel(remote);
> > >  	if (!IS_ERR(panel)) {
> > > -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > +		out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > >  	} else {
> > > -		dsi->out_bridge = of_drm_find_bridge(remote);
> > > -		if (!dsi->out_bridge)
> > > -			dsi->out_bridge = ERR_PTR(-EINVAL);
> > > +		out_bridge = of_drm_find_bridge(remote);
> > > +		if (!out_bridge)
> > > +			out_bridge = ERR_PTR(-EINVAL);
> > >  	}  
> > 
> > While looking at this patch, I think we should migrate the driver to
> > drm_of_find_panel_or_bridge().
> 
> Indeed, the code here is duplicating drm_of_find_panel_or_bridge(). I'm
> going to convert it.
> 
> > Then your patch might add a function
> > close to devm_drm_of_get_bridge() or drmm_of_get_bridge().
> 
> ...which would return a bridge pointer, with refcount already
> incremented. Sure, except I think it should _not_ be a drmm, as
> the bridge might itself disappear while the card keeps existing.

Feel free to add new one.

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
