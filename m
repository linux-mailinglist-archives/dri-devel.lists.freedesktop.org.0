Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9AA01C3B
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 23:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBE510E187;
	Sun,  5 Jan 2025 22:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D81LmjPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB1410E187
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 22:49:56 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3022c6155edso80946601fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 14:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736117335; x=1736722135; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nk9RHKcTJhi6FXZaugGxUGvrK9amKa6NeOGbKz9GmEE=;
 b=D81LmjPVP1zuoOs0/gHDdF4y1Qj+kYvcnWswsCtegZ6wmwgjTuyKNw378eSv576b7Z
 UL5kHhIM3VxU5lNtZU7Lf7FBiDTR/a9k3WWbF03YdI31BSxF+vm5rsnC3oF7wTMLvrKH
 xmOAp2xCrORNSIVbTNi5hJc0oKlyUhK6ZsPtBJhsrfLcam7iXLzISAB4SeGEddvfyOOm
 9FpjT9/T2Q6y0a6X1VB1IvMpUuaEJWIAKy5TWjbV2//jhoQk815eM+2/Xr4y8+C4l5cH
 3NijDzFxj4dETvXY3sH5kOGYFarFySFMmhSuWkgWt5Grazyafev0xna/Bmf6eK2d4cTX
 KF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736117335; x=1736722135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nk9RHKcTJhi6FXZaugGxUGvrK9amKa6NeOGbKz9GmEE=;
 b=aF6Gf2srLK89NnkN+DyX6ejOeSg4W8rHlrgVkoYNe0Z2GqsgRAOUZc5hd4wnQPB+VA
 QJIJcArBvxdK3Vv6jiChKZg6Fr8PIyqqc7LDqtdXg+GKCWPSfbB9rYBrn9YNDj7j6r5m
 1L9Qc61TBvBr0jxrfPXpBe6l8aAQrG2E+jVRPJM/T/3ic+mospJBbukE+5qNkdXysUA6
 88BqMW/z7sMGHMvVbvExrOicGWW41eXGMsKqHzy7D8YUVAhUDgjaQ0cPpZOgh5i90c2a
 zhsCwKw7ysjBxnmbsQxO3Tl9BDgehIBcvZ3nsTLy1FR/GgEG/2+4mH45bY1vNwVdiIKd
 prvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfxO7EvcG+qWjahAdF4oTOxfNqVDfgIMfKbGY6hO1j2aQfkNqpIGkD8R6YxwZu0+1V6kG1IBCVlEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxyg32Fa8Xjf9NfAxcWs/lzCv+AL/2u/4toGdB5vaPQJP6/WD7z
 c6uLziagU48mBVMY5L1vKROQ7Ags0pTHjG8MbggZ1tmavfHDnfnKyNEojaEFonk=
X-Gm-Gg: ASbGnctGMK4uJwl6Ui4A+9h0YHWWJD64/Qt1pZEDeg0Q8od+k/cSYmTYV1TnoKAFyw5
 cv3ybO2G+orFt8RJJsAlt+kg9GNY/Upt0H5RS0KM6YEYMErIjfs3Sotg4WeAr3wkORuKx7BLgEU
 ZFiUuM7GvSzt8AFgM6QnbmMMgV6ubpJKawtuoyqYTtW0AMWwATsl8Yy7+G0jtAgPVYURIlEvh/P
 XfG5ZJgMje1L7p+19yqSE9Dx/wmW3W8z2W61UrP3YMJ5nQuR99BLtVmg4cykYdJA1JHD2jPgSxD
 tcmwlPlxmOowe0eUWSBjhzOHbooFz38oMSk1
X-Google-Smtp-Source: AGHT+IFP/KIZ8UT0YX5C+v64G+IduR/vDL07tNtrnIvIBVwpTHp53A8+KP8ck8ywTfgjPw/GMVCJ8A==
X-Received: by 2002:a05:6512:1055:b0:53f:167e:390f with SMTP id
 2adb3069b0e04-5422956bd7dmr17411064e87.53.1736117335104; 
 Sun, 05 Jan 2025 14:48:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5426f7e0811sm588256e87.34.2025.01.05.14.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 14:48:54 -0800 (PST)
Date: Mon, 6 Jan 2025 00:48:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
Message-ID: <b56u5fzip6rzto6j4jhn4hbfed4i2njtuexsx6nlwxt4mrqa6k@eicvhwzmnpkb>
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
 <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
 <4e7f0951-4b83-4d5c-b4e6-8d7327614840@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e7f0951-4b83-4d5c-b4e6-8d7327614840@linaro.org>
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

On Wed, Dec 18, 2024 at 11:22:51AM +0100, Neil Armstrong wrote:
> On 15/12/2024 12:09, Dmitry Baryshkov wrote:
> > TDA998x is the HDMI bridge driver, incorporating drm_connector and
> > optional drm_encoder (created via the component bind API by the TICLDC
> > and HDLCD drivers). Thus it should be residing together with the other
> > DRM bridge drivers under drivers/gpu/drm/bridge/.
> > 
> > TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
> > and TDA19989 chips, so it is being instantiated by the TDA998x driver.
> > Move it together with the TDA998x under bridge drivers subdir.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   MAINTAINERS                                       |  2 +-
> >   drivers/gpu/drm/arm/Kconfig                       |  1 +
> >   drivers/gpu/drm/bridge/Kconfig                    |  2 ++
> >   drivers/gpu/drm/bridge/Makefile                   |  1 +
> >   drivers/gpu/drm/bridge/tda/Kconfig                | 13 +++++++++++++
> >   drivers/gpu/drm/bridge/tda/Makefile               |  4 ++++
> >   drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
> >   drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c |  0
> >   drivers/gpu/drm/i2c/Kconfig                       | 13 -------------
> >   drivers/gpu/drm/i2c/Makefile                      |  4 ----
> >   10 files changed, 22 insertions(+), 18 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9a23e80abf309cbd918a74683895f8dbe0507a6e..a4c7afd564e721e14aebaf828b75776e50760a45 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16982,7 +16982,7 @@ M:	Russell King <linux@armlinux.org.uk>
> >   S:	Maintained
> >   T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
> >   T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
> > -F:	drivers/gpu/drm/i2c/tda998x_drv.c
> > +F:	drivers/gpu/drm/bridge/tda/tda998x_drv.c
> 
> I'd rather move the entry it to drm-misc in the same move, I don't think
> we want externally maintained bridge drivers mixed in the other bridges.
> 
> Russell, so you agree ?

Russell, as you are listed as a maintainer, any feedback for the patches
and for the Neil's proposal?

> 
> Apart that:
> 
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Neil
> 
> >   F:	include/dt-bindings/display/tda998x.h
> >   K:	"nxp,tda998x"
> > diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> > index c901ac00c0c3a8f356bd53d97305c6b39b3e6662..ed3ed617c6884876368c8bd072c53f1b710df443 100644
> > --- a/drivers/gpu/drm/arm/Kconfig
> > +++ b/drivers/gpu/drm/arm/Kconfig
> > @@ -9,6 +9,7 @@ config DRM_HDLCD
> >   	select DRM_CLIENT_SELECTION
> >   	select DRM_KMS_HELPER
> >   	select DRM_GEM_DMA_HELPER
> > +	select DRM_BRIDGE # for TDA998x
> >   	help
> >   	  Choose this option if you have an ARM High Definition Colour LCD
> >   	  controller.
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 6b4664d91faa80f096ac6a0548ed342e802ae68b..1ef16dcc2ae53eb172604de2d6899004c080a979 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -438,4 +438,6 @@ source "drivers/gpu/drm/bridge/imx/Kconfig"
> >   source "drivers/gpu/drm/bridge/synopsys/Kconfig"
> > +source "drivers/gpu/drm/bridge/tda/Kconfig"
> > +
> >   endmenu
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 97304b429a530c108dcbff906965cda091b0a7a2..52e6c9b3094bba0fd6aaf28af1b58f4bd8bf26d0 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -43,3 +43,4 @@ obj-y += analogix/
> >   obj-y += cadence/
> >   obj-y += imx/
> >   obj-y += synopsys/
> > +obj-y += tda/
> > diff --git a/drivers/gpu/drm/bridge/tda/Kconfig b/drivers/gpu/drm/bridge/tda/Kconfig
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..5f13e4ffc24eeaa8dd0015c7e84d0dbac93e170c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/tda/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config DRM_I2C_NXP_TDA998X
> > +	tristate "NXP Semiconductors TDA998X HDMI encoder"
> > +	default m if DRM_TILCDC
> > +	select CEC_CORE if CEC_NOTIFIER
> > +	select SND_SOC_HDMI_CODEC if SND_SOC
> > +	help
> > +	  Support for NXP Semiconductors TDA998X HDMI encoders.
> > +
> > +config DRM_I2C_NXP_TDA9950
> > +	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
> > +	select CEC_NOTIFIER
> > +	select CEC_CORE
> > diff --git a/drivers/gpu/drm/bridge/tda/Makefile b/drivers/gpu/drm/bridge/tda/Makefile
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..31fd35527d99d7eb23851d290175a3ff0c756772
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/tda/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +tda998x-y := tda998x_drv.o
> > +obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> > +obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
> > diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/bridge/tda/tda9950.c
> > similarity index 100%
> > rename from drivers/gpu/drm/i2c/tda9950.c
> > rename to drivers/gpu/drm/bridge/tda/tda9950.c
> > diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/bridge/tda/tda998x_drv.c
> > similarity index 100%
> > rename from drivers/gpu/drm/i2c/tda998x_drv.c
> > rename to drivers/gpu/drm/bridge/tda/tda998x_drv.c
> > diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
> > index 6f19e1c35e30b0e595c1a60628a6b8cf313fcabc..3205cdb827b95209a4bba9fb126ad2df27ddbdfb 100644
> > --- a/drivers/gpu/drm/i2c/Kconfig
> > +++ b/drivers/gpu/drm/i2c/Kconfig
> > @@ -20,17 +20,4 @@ config DRM_I2C_SIL164
> >   	  when used in pairs) TMDS transmitters, used in some nVidia
> >   	  video cards.
> > -config DRM_I2C_NXP_TDA998X
> > -	tristate "NXP Semiconductors TDA998X HDMI encoder"
> > -	default m if DRM_TILCDC
> > -	select CEC_CORE if CEC_NOTIFIER
> > -	select SND_SOC_HDMI_CODEC if SND_SOC
> > -	help
> > -	  Support for NXP Semiconductors TDA998X HDMI encoders.
> > -
> > -config DRM_I2C_NXP_TDA9950
> > -	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
> > -	select CEC_NOTIFIER
> > -	select CEC_CORE
> > -
> >   endmenu
> > diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
> > index a962f6f085686674ed33010345730db776815ebe..1df3869491e277ca210368c4e48efe6d11af62b6 100644
> > --- a/drivers/gpu/drm/i2c/Makefile
> > +++ b/drivers/gpu/drm/i2c/Makefile
> > @@ -4,7 +4,3 @@ obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
> >   sil164-y := sil164_drv.o
> >   obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
> > -
> > -tda998x-y := tda998x_drv.o
> > -obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> > -obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
> > 
> 

-- 
With best wishes
Dmitry
