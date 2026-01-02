Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A01CEEEE3
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 16:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DC110E210;
	Fri,  2 Jan 2026 15:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HxD4fyi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A56A10E210
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 15:58:08 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b83122f9d78so944976466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 07:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767369487; x=1767974287; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=inEjkYpZZFKseUFbKo7AFRhLn8xe1tV4AKOq/ebShUM=;
 b=HxD4fyi73HDG0ScvR/DOr8jASdbiZUwxPm+KFys0OLuiA9dx7coNdtSJBpExkqnDqD
 hBtAnZPoot9w49A647XEy72i2SqKsAUGvI79aQ0fiNFUHjDWYhC6DkiMBUBlLejDKshn
 HEA38Iz2qvz4NCv2nvYQzESnygd5K6tHHiLfYy5AFnr6LTgqs2X9q2rEUIJHTvmS5uUB
 xaJ2lB4YCNhjp6fX4YodQthj14jpgSo2MemKjQIrp6lKcNLKviv4ctQ8iHLQm5ltpKE3
 F7Gs/gyPaDf3TBE6DPfpIalpH+gKyMzCnSCsiMqgIqMFrkHuPqSf5a6AFIZ+Q7/gfKIN
 v0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767369487; x=1767974287;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inEjkYpZZFKseUFbKo7AFRhLn8xe1tV4AKOq/ebShUM=;
 b=ExSz0/yBLGu9Ag+YvKm5Bxhksj1TvLoPAml7sIg49m4OUBP/vGK1dAAdyhec+vrkpI
 1DaJ3OTQUdDMIACym8fGfpi4bt9l3pG+Vzx0pvlQvWWENOaP10HHAhL9rubjXAcoFKkQ
 1dmTowMQnpKrR8zosjQrvDBy7WD8yURx7Zur362ng1TSxqxvYbVu1C10JYf0WL5i1izX
 xt360/6qeb1DybKaH4hd+/UZlWq1bqbnUe7rK9vdw0j/BoEmHoio9MU4R/freyfFJmYp
 ttYV0y+D29JGsr9pupmvH8Ic5CHp2Rb4jJVbq7YmaBS3AejsNsIV7pSV3KojAdPWUaFp
 TzYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbyq4ryZXpT3xljIg2etiQdH02j6vjEvTZ8q4PJnZ7mCKA2U9rrd6Bx9n22WbcRdYYp0IcV/wslY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySzhK/lyZ8/anJ9AVPkwcVQoX1mrPsNtwHe6UZaFUtvLacvHLX
 P0zm3D6igWNpKmuPvyNkRwTeklRW/DnfzlDjoq6/BQHz41qtu4tzTta+
X-Gm-Gg: AY/fxX49v4dvcGhfkXJrpHQtgT6cmPUOAGhaCyONWEp8TQ2sZ+4AyQKq0ncj1nFy9/z
 A6ssqy3RrrBbiQ4ux4FpBAddcXdDP9J3yUzwd19R8+2OxznHuLowjRE5X29PIvwwCcpxnyMTriQ
 l1g32oZ06jj4LNXzfDIpip5qA2lzI34Xhjr4sQNaQoIb+o2q+IawWGkjSg8wR4axrAsxNL6CZQJ
 qzrGRFghjpBE4jw8e0e1kKtxF51kGahDE+hbpoQvOLAnzf74BFmzahgeh58RwusC/7BazTme4OS
 wux6gb/S6ildIceMoYHlWPHI4uD3Ppe47Ja8anO+ibgz5EfNtkfnwSygCZ1F5Bvp5LXm5NqAUG5
 wH2NnsMbmqAMYAQ4utBffxrPplbdi6FAuWWa7MHORwr5+lMvvZkrkXNokYFiqMefzQJXVHul4df
 OWx3z6NJU1x8aM
X-Google-Smtp-Source: AGHT+IHiO3O4EGawpFCvkJsZU4HHFVkQUvnh0vx9UvoieKlX+GabYma9+cfOIH50Ic7AgiFfru4A+w==
X-Received: by 2002:a17:907:3fa5:b0:b75:7b39:90c9 with SMTP id
 a640c23a62f3a-b803718390fmr4882816666b.51.1767369486868; 
 Fri, 02 Jan 2026 07:58:06 -0800 (PST)
Received: from osama ([2a02:908:1b4:dac0:ac54:a680:a017:734f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8056ff4925sm4098474566b.31.2026.01.02.07.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:58:06 -0800 (PST)
Date: Fri, 2 Jan 2026 16:58:04 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, stable@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: synopsys: dw-dp: return when attach
 bridge fail
Message-ID: <aVfrDJojCylccwYJ@osama>
References: <20251231144115.65968-1-osama.abdelkader@gmail.com>
 <DFE1K6AD151E.23NWWMYDV2ZDI@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFE1K6AD151E.23NWWMYDV2ZDI@bootlin.com>
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

On Fri, Jan 02, 2026 at 11:46:08AM +0100, Luca Ceresoli wrote:
> Hello Osama, Andy Yan,
> 
> Andy, a question for you below.
> 
> On Wed Dec 31, 2025 at 3:41 PM CET, Osama Abdelkader wrote:
> > When drm_bridge_attach() fails, the function should return an error
> > instead of continuing execution.
> >
> > Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> > Cc: stable@vger.kernel.org
> >
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> > v2:
> > use concise error message
> > add Fixes and Cc tags
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > index 82aaf74e1bc0..bc311a596dff 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > @@ -2063,7 +2063,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> >
> >  	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >  	if (ret)
> > -		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> > +		return ERR_PTR(dev_err_probe(dev, ret, "Failed to attach bridge\n"));
> 
> Your change looks good now. However there is aanother issue, sorry for not
> having noticed before.
> 
> While reading the dw_dp_bind() code in its entirety I have noticed that on
> any error after drm_bridge_attach() (and also a drm_bridge_attach() error,
> with this patch) it returns without undoing the previous actions. This is
> fine for devm actions, but a problem for non-devm actions, which start at
> drm_dp_aux_register().
> 
> For example, if phy_init() fails, dw_dp_bind() returns without calling
> drm_dp_aux_unregister(), thus leaking the resources previously allocated by
> drm_dp_aux_register().
> 
> Andy, can you tell whether my analysis is correct?
> 
> If it is, this should be fixed before applying this patch. Osama, do you
> think you can add such a patch in your next iteration?

Thanks Luca for the review, I just sent v3.

Best regards,
Osama

> 
> Best regards,
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
