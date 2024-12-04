Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA3F9E37A6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273EF10ECC2;
	Wed,  4 Dec 2024 10:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hPG76xYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFC810ECC2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:37:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-434a0fd9778so60811355e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 02:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733308629; x=1733913429; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L3ttYxp6rhOt03opBOFaCp7oUwpLFGdn3JPE802PBas=;
 b=hPG76xYxPFCReX7IuvrkNM8O6muzvq3ov9WlRQYzKZqMreYycfvQRn61gMXu2jSVuR
 u+qliOLxIgXBr7ATTKj0/0evOzDOOy0YTeCR+exTsvm4w/wOniBnONFMHJHVdzwXZygP
 pUi2wgEWQInkLTo3RHoeW4wTYGQlnRZSPQVjw7VDnZ7XwKc4RWFtpNHzDHKTq5vjQRfr
 7bPjT6iAI46tnqOC/P5xoeUtq72BcbHqNSY5wWlkhigsAnEJl/m6nNzDgn8ACHb5+XQY
 Rtv05RLI7EAvD4gFnWASzrKh7XyKWbh4sb8MeUVUXmoyp4ig8pdmit5CNFGMjQDsmzIB
 iqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733308629; x=1733913429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L3ttYxp6rhOt03opBOFaCp7oUwpLFGdn3JPE802PBas=;
 b=eTmcdp9Nmg7YIs84i6GrPn8nbvbasS0mSmF+2UiMBJXRD2az7rGQN9PBlwBNsZwbej
 OZmuLfJT6642vwsMFDwaSJO8BjEwmq9C85xHralM58ns67XQJIYYgs/5xAtQ8lwPnld3
 f+lJEK2AUqIX6XS5m5O3WIj2S6kEfNCUnqnRIr1eVZ6ZzN2iPP6R9/epl6yUEpccED0Y
 rSMt1IUbxN2B0rCqfX+BaRWk4WHHiGiwmrJ++d1Z+goxfqHOHcUAT5HcDFTFUoRR2/As
 Nhnzo2l7epGqblBd+ehekGHvLRjG3S2hPs9e9SY8PS4aGAxr8/LUCeLZ7LPwLGHHXMAq
 fhWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHZTIcSXJu1odjjOgXIti7HHhbIFg8PFYUdMHU3MsVr28BRsX4X/qiSoXo5UeZLUTn7DoeKTORgzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUQbzMDkcOSVoxCsvUle2QoxKaQ6Eyo0VbxdWU5PP0cI7yIGVU
 KOidWpEctGD9CVxx2HI1i4gi95aK/Sqfp+3M4lFTsZWw2YU+R+sc
X-Gm-Gg: ASbGnctlLtcaLzOrIx+k0fpTjzXiEnpVwseDIeHspgqRGHwsyK3+YxvQZ3faGYHixY9
 oVW+viG15eVLin2BI9Edd/CXaijyPn4WK7OzvxfIyEgWsOsRZjQrijuJj6OxoZhaYO53+VA/kFm
 SmrxzJvGhgENyFIQdb6lsQG90TPMxVpbTe4ZQssHjyOv/Ii2f5fFHPdedSeonNrBMYj8byt2hzu
 xmGNR0jAzX7O8Fc//oHdgje1v50l+a5xJ8cRBq2/Y5R5uJWCxFv/hksf2cBnGnQkAPqr8v01ErE
 j+bjsxlFHdxAOh2RkHO7
X-Google-Smtp-Source: AGHT+IFk6yd+S1MM72aq43fUVFUVQJ8IJuecR2VdiHKgNuoOL+p3FwaA3bVzIhygdzDfT4fCU6sesg==
X-Received: by 2002:a05:600c:1d19:b0:434:a1d3:a306 with SMTP id
 5b1f17b1804b1-434d09b2401mr51927465e9.5.1733308628639; 
 Wed, 04 Dec 2024 02:37:08 -0800 (PST)
Received: from tom-desktop (net-188-217-53-234.cust.vodafonedsl.it.
 [188.217.53.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527e287sm19861935e9.12.2024.12.04.02.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:37:08 -0800 (PST)
Date: Wed, 4 Dec 2024 11:37:05 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <Z1Aw0WafGmYDrr8K@tom-desktop>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
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

Hi Liu Ying,
Thanks for your review.

On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> On 12/04/2024, tomm.merciai@gmail.com wrote:
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > format by selecting the LVDS input format based on the LVDS data mapping
> > and thereby support both JEIDA and VESA input formats.
> 
> ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> this patch actually only adds vesa-24 support.  So, to be more
> specific, the patch subject and commit message should reflect
> this rather than claim "Support VESA input format".

Fully agree, thanks.
I will fix that in v2 specifying vesa-24 like you suggest.

> 
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Can you please send this patch with your Renesas email address
> instead of Gmail email address?
> Otherwise, add a Signed-off-by tag with your Gmail email address.

Thanks, for the point.
What about adding Acked-by: from my renesas email address?

> 
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> > index cbabd4e20d3e..83d1db29157a 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6263.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -48,6 +48,7 @@
> >  #define  REG_COL_DEP			GENMASK(1, 0)
> >  #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
> >  #define  OUT_MAP			BIT(4)
> > +#define  VESA				BIT(4)
> >  #define  JEIDA				0
> >  #define  REG_DESSC_ENB			BIT(6)
> >  #define  DMODE				BIT(7)
> > @@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
> >  	fsleep(10000);
> >  }
> >  
> > +static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)
> 
> 1) Inline this small function.
> 2) Change the argument input_fmt type from u32 to int to
>    match the type of it->lvds_data_mapping.

Will fix that in v2, thanks :)

> 
> static inline bool it6263_is_input_bus_fmt_valid(int input_fmt)
> 
> > +{
> > +	switch (input_fmt) {
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +		return true;
> > +	}
> > +	return false;
> > +}
> > +
> >  static inline void it6263_lvds_set_interface(struct it6263 *it)
> >  {
> > +	u8 fmt;
> > +
> >  	/* color depth */
> >  	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
> > +
> > +	if (it->lvds_data_mapping == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG)
> > +		fmt = VESA;
> > +	else
> > +		fmt = JEIDA;
> > +
> >  	/* output mapping */
> > -	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, fmt);
> >  
> >  	if (it->lvds_dual_link) {
> >  		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
> > @@ -714,14 +733,14 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >  
> >  	*num_input_fmts = 0;
> >  
> > -	if (it->lvds_data_mapping != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
> > +	if (!it6263_is_input_bus_fmt_valid(it->lvds_data_mapping))
> >  		return NULL;
> >  
> >  	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> >  	if (!input_fmts)
> >  		return NULL;
> >  
> > -	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> > +	input_fmts[0] = it->lvds_data_mapping;
> >  	*num_input_fmts = 1;
> >  
> >  	return input_fmts;
> 
> -- 
> Regards,
> Liu Ying

Thanks & Regards,
Tommaso


> 
