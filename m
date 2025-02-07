Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB9A2CCF9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 20:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF9110E28A;
	Fri,  7 Feb 2025 19:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rsYw0T9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD0E10E28A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 19:43:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso2766973e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 11:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738957410; x=1739562210; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sfeUloH1D5YQJ4zSbv3mA6ITAlWmazeuNMbmPCyKglE=;
 b=rsYw0T9DpaVf2taQkjYSRShPb1AM/3HBdtvDLYyzDPAb6UO3sPJs32CnVYrXm2qiMc
 kOChy36LMsYwGOFvJ5Lry51kWdBF/exrKxDed4PxHGX0R/BNKdg6dPolYMdNtK75gWi5
 L0a3fzFAYwCSafwmibiXt0M1DM4yeMowPAJabBLI86SHzSQBlhtJZDwc8uiaNLVXy5iB
 YmqtyEry5H+EZHfWVCNoqJxPOfSRMrPf2iMW73J3d8Xxu5JWfF3AEY7Qqzac7Lsaiojk
 QzN32lcCAJ1DQrzuEdXDU46T21KUcKIrwaOHXi3cXFpDxa8qY5SiTIaUkCdbYP/m2LJl
 Jz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738957410; x=1739562210;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfeUloH1D5YQJ4zSbv3mA6ITAlWmazeuNMbmPCyKglE=;
 b=TxpA7xjkkLjajUTz5vuaOzSI4ZwIEH8QK0mz7EfEuaRDqSlwWEk7p1CupXvU4Lncxr
 r+FjpSsAnoJA2bFC6/FaHZ8E1gVbCV0n9QhR8QnJkkGe35r3n/oHHk9kguL8658lMLr6
 0BM4q0zL88AxISAnUG67VSIPdRKjHxN7wYVy6z4mErcSakP46C/yjxjDD2j89rM/B6tB
 uzI3pBigTW7BMPuCKCCV01l1tpIuwNFwhVlQ9V3xnn4IeLCnjDQ8jDV5IDarf1JBdKYA
 0uvFBjeucFjO6AXOhojxVFB0UoWGaFfli+BfjGFs2HmNRzFbSv19qNNlb2aiVvMlWjus
 OESA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs0PRTPt2Esmr7jX00YrblHEqu9Xd8J8dVSLphEksGaSfEm+WyTc6ohjwcY6z1MqNIgWW7X9NiS/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8187kN3DLV7ohxgfCK/RlC0k22bLFr1IDzns5aU89NBoCavoY
 5kbYWHOFm1jsro2sG8j6v/xcJxKKIPstzOcWn/nKB0oJbW6ceGm+eGcNc396tcY=
X-Gm-Gg: ASbGnct6BZCaD1/7Qw+RPxGsX8dLmNgjuWJDBiPYgO4Pdpz2DzTGfxODsZBLT/V1urJ
 Ph3oBE8vV+65tWkksv4yXG0QaxwBq7rLp3KqHnBN5hGTulFWaUPyiZ8qn8/9zUiBDsnhQU/MwTm
 uRjppjykN+ICuSdQwEjstMxyI9vCVSJ2PhDPzniTSwujYUA+QBhmrvtT3UPR44XkzgEkU2wHClD
 t9EefaGEqwTbUJWSJ6jTSxsF7kyaim3+bBBopdLRt+ZKI3ZTnawqJ2mC97T+P0eC6BZDuIUez1F
 Z7jTQRIY138+6RsliTcVIQMs3Afmz0ju3LLddHruCQYzd9GfMuBSYLm4aeU36S1lQ+os3Ac=
X-Google-Smtp-Source: AGHT+IGPtAJCB3CGqF85jrgae3kZNpGKdBiQF5zyaTqCla9QfN39wSgkGoIzsR5MIcuzbaZGPE0Bzg==
X-Received: by 2002:a05:6512:2316:b0:543:9a61:a2e5 with SMTP id
 2adb3069b0e04-54414aa87c8mr1684308e87.23.1738957409927; 
 Fri, 07 Feb 2025 11:43:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54410604225sm542577e87.237.2025.02.07.11.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 11:43:28 -0800 (PST)
Date: Fri, 7 Feb 2025 21:43:26 +0200
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
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <aoy4vtqfffq3chbfdqdcrtqmex3pqijlusem7pp37wwsg34lgl@mnaqbp6fijnc>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
 <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
 <20250207095428.244f0f91@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207095428.244f0f91@booty>
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

On Fri, Feb 07, 2025 at 09:54:28AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 04:49:21 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > > Adding a panel does currently not add a panel_bridge wrapping it. Usually
> > > the panel_bridge creation happens when some other driver (e.g. the previous
> > > bridge or the encoder) calls *_of_get_bridge() and the following element in
> > > the pipeline is a panel.
> > > 
> > > This has some drawbacks:
> > > 
> > >  * the panel_bridge is not created in the context of the driver of the
> > >    underlying physical device (the panel driver), but of some other driver
> > >  * that "other driver" is not aware of whether the returned drm_bridge
> > >    pointer is a panel_bridge created on the fly, a pre-existing
> > >    panel_bridge or a non-panel bridge
> > >  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
> > >    but the "other driver" doesn't know whether this is needed because it
> > >    doesn't know whether it has created a panel_bridge or not
> > > 
> > > So far this approach has been working because devm and drmm ensure the
> > > panel bridge would be dealloacted at some later point. However with the
> > > upcoming implementation of dynamic bridge lifetime this will get more
> > > complicated.
> > > 
> > > Correct removal of a panel_bridge might possibly be obtained by adding more
> > > devm/drmm technology to have it freed correctly at all times. However this
> > > would add more complexity and not help making lifetime more understandable.
> > > 
> > > Use a different approach instead: always create a panel_bridge with a
> > > drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> > > wrapping it. This makes lifetime much more straightforward to understand
> > > and to further develop on.
> > > 
> > > With the panel_bridge always created, the functions to get a bridge
> > > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> > > the bridge they are looking for exists already (if it can exist at all). In
> > > turn, this is implemented based on a variant of
> > > drm_of_find_panel_or_bridge() that only looks for panels:
> > > of_drm_find_bridge_by_endpoint(). In the future
> > > drm_of_find_panel_or_bridge() can be progressively removed because there
> > > will never be a panel not exposing a bridge.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
> > >  include/drm/drm_panel.h        |  8 +++++
> > >  2 files changed, 66 insertions(+), 16 deletions(-)
> > >   
> > 
> > LGTM, minor issue below.
> > 
> > > @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
> > >  {
> > >  	struct drm_bridge **ptr, *bridge;
> > >  
> > > +	if (panel->bridge) {
> > > +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> > > +		return panel->bridge;
> > > +	}  
> > 
> > Shouldn't the rest of the function also be removed as you do in other
> > cases?
> 
> Indeed it should.
> 
> And even more, I now realize drm_panel_bridge_add_typed() should also
> become a simple 'return panel->bridge', like its devm and drmm
> variants, and its code, implementing the actual creation of a panel
> bridge, move to an internal function. Otherwise this patch is a bug:
> existing drivers which do call drm_panel_bridge_add_typed() would end
> up in having two panel_bridges for the same panel.
> 
> I must say the process of developing this patch together with the
> hotplug work was "convoluted" to say the least, which probably explains
> why this got unnoticed so far.

That's why I suggested to post this series separately - it saves you
from rebasing hotplug work on top.

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
