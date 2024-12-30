Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E119FEB76
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 23:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EB110E599;
	Mon, 30 Dec 2024 22:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W9+9SDds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D925C10E599
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 22:51:06 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so10532653e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735599005; x=1736203805; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ndkBccbxfCNVnrXt+e8YJo/WVVAihoLFIXSgmyxaWx4=;
 b=W9+9SDds0y0Zuv5N7cyNwsIwqbZk4TMQZMfb6QqYTYo+x7VTNWkqIOB4nYvqiW88lp
 UtWfAkP8CxPC6lUCvMNdtwZcA/xFY1P83kW29w8b36VMnHfhL//Mq/qlWlxLj4lQEKiF
 jtBjGaIBJ3oel24rKRSf3uHThyqCUdtDMC/30wdJmB075vWUCStwmLR88rilWKSqvYNs
 S05L8IDTGhioDsfVEFYx+QwdeRUJlT1JOWHR2CfzkT4NhZ9ho/ZQIPW7c5mbeFUGMTBF
 lgfzbIcJukQ6Lxl8jxArjfo7f81luo/r3dHQ0Inva3GQFnz0hgMDLtw+hzyKzyYLZ/a4
 4hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735599005; x=1736203805;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ndkBccbxfCNVnrXt+e8YJo/WVVAihoLFIXSgmyxaWx4=;
 b=Pi6CTp9WXagXA86M+tx/c6/HZVjsfJb7e/IZUA7GU9pyKcEucp90G5AH/c+jog5uLj
 SoWPS2AI1ik2nHVJAJ5vT7t4nWhlmujynVborLXdKVRoOTi5rLKraPjx0QGXPm/IXX/i
 wdoPE7eR8HmBKW6V9Q1P1KxDLbkdubEryipPan4KaEKjFb9KeUim7F9rcavlBkHvdBfY
 G5ayXJYvEpTphx/atxDY5gc3DCL1hnKff8y3bYwWyfOux2o69r31DRkx99yRUDA9b+q0
 b4g5MZVLknpC/+XgsqmZmg5syn4xrI0s4t8jf4NV5GFeQuQeLtXxeaFREl4tzdAAlx71
 86rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlCbH8qTY/t67bC1CHyF7kOJpBQiaA3s57VKOYkZUy9BVhfYnFwb3OxP0tEhNcq57mra9ukanv/7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVnudiaE+VzTzRFjCKSAmCWhpS2FH4aS5ZcpqFbShoh6HV6mNy
 SSJfpFRcxFwq5j9M4cr4njWrYpdZwN133thkOLWQmcDw0pFc272nnZVrA4UdPrihyueUvyT67cu
 f
X-Gm-Gg: ASbGncs/VnrHaqjOFcyJr9YkGTZXL53b/GH9MJ3kpcxwIQuRFEEr1EFjJ77m9BqBl/H
 q0gfFQHRGcXu27THyV+Iq8mD3i7pOuLW+TmQMyl2odpoJj30VBdXCZd8faXRAgKLueiCIjBdLo3
 137DTvM16c33dsdDr7DBK4froHk/byIU7QQohZlrgLJvQghYhd255EK9Uvndeu8v5k0B66y+O08
 pwc9TdP06RusgjFjbit8mioDBlEdJEUlvTq3shXXsWIovM11gsgaoU1K+HAJPm4YU9hGM5gFp/E
 US3aFuhd0x9Qc1SWQ2ZTWMrxdJcNa+fNBmdj
X-Google-Smtp-Source: AGHT+IFfViIHM8+f9Mn3fgEtTV0SNNWn/wuOCgLzxbbOuJXZwu8+rTphIETfjjYE6yKOOZA8LgpsvQ==
X-Received: by 2002:a05:6512:2399:b0:53e:395c:688e with SMTP id
 2adb3069b0e04-54229524737mr12156974e87.10.1735598546613; 
 Mon, 30 Dec 2024 14:42:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301adsm3257694e87.246.2024.12.30.14.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 14:42:25 -0800 (PST)
Date: Tue, 31 Dec 2024 00:42:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <lsfwik47xzx2qjp26x2klx5bgjdrogu6lt3kafchfgppbnwtnt@c56ljycxkiin>
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-2-marex@denx.de>
 <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
 <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>
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

On Mon, Dec 30, 2024 at 11:11:35PM +0100, Marek Vasut wrote:
> On 12/30/24 8:18 AM, Liu Ying wrote:
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> > > index 264e74f455547..07fb6901996ae 100644
> > > --- a/drivers/gpu/drm/mxsfb/Kconfig
> > > +++ b/drivers/gpu/drm/mxsfb/Kconfig
> > > @@ -30,6 +30,7 @@ config DRM_IMX_LCDIF
> > >   	select DRM_CLIENT_SELECTION
> > >   	select DRM_MXS
> > >   	select DRM_KMS_HELPER
> > > +	select DRM_BRIDGE_CONNECTOR
> > 
> > Select DRM_DISPLAY_HELPER.
> Without select DRM_BRIDGE_CONNECTOR, the drm_bridge_connector_init() is not
> defined .

You need both.


-- 
With best wishes
Dmitry
