Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF4466E0E5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 15:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E40110E548;
	Tue, 17 Jan 2023 14:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3756210E548
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 14:37:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r9so8007204wrw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 06:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g8U58V+S9Cd2Mdkpu5VF1Bqqde3yGQwmZlcrk/ih2GQ=;
 b=tvd3+zOaH2g0F7ul6jSTN9nUUW8xdit1D29E7qMgnIlGVsFhi+J5HyxJ0wuiHpEL7B
 6irgkUl5bIfAWampDApKWHZ0TgFoiwual5VhISeNZIBR/5RqnbfhkB8D4MdA5phT40Wv
 pwneDgc+IrEWQNe4g6ia7hIUPpSp7ruGCxK55irQFbmCTMKaP+tB92OqT3xekTqEXawa
 5puoq755UK9d5FKlSm4HWKteuYd7Zbz6QsTcm5G7tHoB7UTRBYN7IuNj4+iZzfB9UV4T
 xlvfmsA1XXTilRW07ZTMkxvv7LybSujFwes2c+gMJaOKuJzGnhUUP2VLZ5c8gFADl5Sd
 iSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8U58V+S9Cd2Mdkpu5VF1Bqqde3yGQwmZlcrk/ih2GQ=;
 b=JBt0fmY/rLhXIgJNmF4sELjbiZA2bXpLsjLCbcYafafl50IojmRPEe5DLtDrFTQLRg
 ERoCNPHXAJ+HGK4ZTgHQfZsy6lZm9wP8JPH9eD7+VLyYzn1Wgk+BekhjH1dCBmX7qGVO
 tV6q30ELhF5pNk9w0iFr/koPUHBp7ou7VvlO2HfRzPNx4Fafrshjs/tiLD7wTFx9CX2X
 NLh5vbivYKYNTQRNMPWwMPQdoXGSk1hq3kcVfbByas0RgEID6RPHVFBcJzyrRwEbW12Q
 y1Rr2AxNhrDWUkHvIvHMtpGfprfQcqdvGawfwFesxS+QD+DiUUWweXsbm9qNYHxaNZDm
 txQw==
X-Gm-Message-State: AFqh2kpzjUqRPzbI5Msdlg21g68BBe9jxKy7/sa+TEevmElst7O3OGo2
 ofD/rWmcA6QZ9S2WPm88zaHEEQ==
X-Google-Smtp-Source: AMrXdXu7i9LVXQ3sUQozr7I7PscaQ94+yY2qjZEyUaMnE+b0N+3NivSSuaMe9EAJKtTkRgsSZ2Dv0Q==
X-Received: by 2002:a5d:5b0e:0:b0:28e:f7a:9ff2 with SMTP id
 bx14-20020a5d5b0e000000b0028e0f7a9ff2mr3373574wrb.69.1673966229636; 
 Tue, 17 Jan 2023 06:37:09 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm17119266wru.79.2023.01.17.06.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 06:37:09 -0800 (PST)
Date: Tue, 17 Jan 2023 14:37:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v4 1/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Message-ID: <Y8ayk8kXfFsCOzxG@aspen.lan>
References: <20230117134742.23238-1-lujianhua000@gmail.com>
 <Y8aq1aJd8QJCo3RU@aspen.lan> <Y8aswmc8dkzM+RsB@Gentoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8aswmc8dkzM+RsB@Gentoo>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 10:12:18PM +0800, Jianhua Lu wrote:
> On Tue, Jan 17, 2023 at 02:04:05PM +0000, Daniel Thompson wrote:
> > On Tue, Jan 17, 2023 at 09:47:41PM +0800, Jianhua Lu wrote:
> > > Add support for Kinetic KTZ8866 backlight, which is used in
> > > Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> > > downstream implementation [1].
> > > [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
> > >
> > > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > > ---
> > > Changes in v2:
> > >   - Add missing staitc modifier to ktz8866_write function.
> > >
> > > Changes in v3:
> > >   - Add 2022 to Copyright line.
> > >   - Sort headers.
> > >   - Remove meaningless comment.
> > >   - Use definitions instead of hardcoding.
> > >   - Add missing maintainer info.
> > >
> > > Changes in v4:
> > >   - Change 2022 to 2023.
> > >   - Remove useless macro and enum.
> > >   - Describe settings by devicetree.
> > >   - Move header file to C file.
> > >
> > >  MAINTAINERS                       |   6 +
> > >  drivers/video/backlight/Kconfig   |   8 ++
> > >  drivers/video/backlight/Makefile  |   1 +
> > >  drivers/video/backlight/ktz8866.c | 195 ++++++++++++++++++++++++++++++
> > >  4 files changed, 210 insertions(+)
> > >  create mode 100644 drivers/video/backlight/ktz8866.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 42fc47c6edfd..2084e74e1b58 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -11674,6 +11674,12 @@ M:	John Hawley <warthog9@eaglescrag.net>
> > >  S:	Maintained
> > >  F:	tools/testing/ktest
> > >
> > > +KTZ8866 BACKLIGHT DRIVER
> > > +M:	Jianhua Lu <lujianhua000@gmail.com>
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > > +F:	drivers/video/backlight/ktz8866.c
> > > +
> > >  L3MDEV
> > >  M:	David Ahern <dsahern@kernel.org>
> > >  L:	netdev@vger.kernel.org
> > > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> > > index 936ba1e4d35e..2845fd7e33ad 100644
> > > --- a/drivers/video/backlight/Kconfig
> > > +++ b/drivers/video/backlight/Kconfig
> > > @@ -190,6 +190,14 @@ config BACKLIGHT_KTD253
> > >  	  which is a 1-wire GPIO-controlled backlight found in some mobile
> > >  	  phones.
> > >
> > > +config BACKLIGHT_KTZ8866
> > > +	tristate "Backlight Driver for Kinetic KTZ8866"
> > > +	depends on I2C
> > > +	select REGMAP_I2C
> > > +	help
> > > +		Say Y to enabled the backlight driver for the Kinetic KTZ8866
> > > +		found in Xiaomi Mi Pad 5 series.
> > > +
> > >  config BACKLIGHT_LM3533
> > >  	tristate "Backlight Driver for LM3533"
> > >  	depends on MFD_LM3533
> > > diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> > > index e815f3f1deff..f70a819c304c 100644
> > > --- a/drivers/video/backlight/Makefile
> > > +++ b/drivers/video/backlight/Makefile
> > > @@ -36,6 +36,7 @@ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
> > >  obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
> > >  obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
> > >  obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
> > > +obj-$(CONFIG_BACKLIGHT_KTZ8866)		+= ktz8866.o
> > >  obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
> > >  obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
> > >  obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
> > > diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> > > new file mode 100644
> > > index 000000000000..98916f92d069
> > > --- /dev/null
> > > +++ b/drivers/video/backlight/ktz8866.c
> > > @@ -0,0 +1,195 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Backlight driver for the Kinetic KTZ8866
> > > + *
> > > + * Copyright (C) 2023 Jianhua Lu <lujianhua000@gmail.com>
> >
> > Shouldn't this be:
> > Copyright (C) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
> >
> > > +static int ktz8866_probe(struct i2c_client *client,
> > > +			 const struct i2c_device_id *id)
> > > +{
> > > +	struct backlight_device *backlight_dev;
> > > +	struct backlight_properties props;
> > > +	struct ktz8866 *ktz;
> > > +
> > > +	ktz = devm_kzalloc(&client->dev, sizeof(*ktz), GFP_KERNEL);
> > > +	if (!ktz)
> > > +		return -ENOMEM;
> > > +
> > > +	ktz->client = client;
> > > +	ktz->regmap = devm_regmap_init_i2c(client, &ktz8866_regmap_config);
> > > +
> > > +	if (IS_ERR(ktz->regmap)) {
> > > +		dev_err(&client->dev, "failed to init regmap\n");
> > > +		return PTR_ERR(ktz->regmap);
> > > +	}
> > > +
> > > +	memset(&props, 0, sizeof(props));
> > > +	props.type = BACKLIGHT_RAW;
> > > +	props.max_brightness = MAX_BRIGHTNESS;
> > > +	props.brightness = DEFAULT_BRIGHTNESS;
> >
> > There is still pending feedback from v3.
> >
> > | Please set the scale property correctly. "Unknown" is never correct for
> > | new drivers.
> Do you means backlight_properties.backlight_scale?

props.scale = BACKLIGHT_SCALE_<whatever_is_correct_for_this_hardware>;

(the memset means you are currently setting the scale to
BACKLIGHT_SCALE_UNKNOWN )


Daniel.
