Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB3A6733CA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 09:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D1310E8DD;
	Thu, 19 Jan 2023 08:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F1710E729
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 12:39:37 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so2200346pjg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wYG3PM5RJMJyyv83YwSPRPszMIsiOkHwGjTk5F+x3hI=;
 b=V/6gy0vAY6rs5ZoX2PKaS+BLtElA3Tzu8J+tJGH23+t7xTHjV/kGfVUrG+mlwDZ3wj
 kpKHpnkuWJ9W2QHRwut2HOWG+m5v8GbIRocWcioHSjpfuhiaZ0vTwYNZ1d+e9mO1wBwf
 cvwonDmy7Oys+sckyuNoft6byufISKANUQ8hBqRoGGmMNpyS/rJHIIuChrrvkWpMTvsF
 +1ejMpwEtt+QUbkQEHMckG9/nnN+3wmE2XE5zAvpGJJ0qw/zud7n71USfikNAqayYEnQ
 rat5rzPRj/qpczXRN0NVJqyql3xz8LvrJqc8s5hsU7gDIAdVqxivWpW/+delx8WSNDyN
 3qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYG3PM5RJMJyyv83YwSPRPszMIsiOkHwGjTk5F+x3hI=;
 b=CyprghXlBYtQirMwmkCg8dOXYfVxU3Uu2/a6x3wMiX7JAyShLrKkyqLqBJTEgTv40N
 dKO5hr/jJnEhYrSUNZtqvCN/oe3hZWfny0iTRQfRGV787KCtu7Uf6l/Y7YZfb2aKZ05+
 /UCzLdLGW2PLZmlj/Z2hVvRY/cb4SwYKS4xf1baQ0o51yp1ivf4fVn05JDyrYSYxLR4f
 ZIDghXT3TM7GbZhe4Q0e3Z2aHBNEuYLM/9NEX9PjW3JygNdvVJvS5ozDnJYb/llrpK4w
 fzfMZI9/H3jdpbb4eMY99owcJxTgnbzzVDT2Q2ERp5R7tINg05mtwv3ktOeVMMw7w4JW
 mg2A==
X-Gm-Message-State: AFqh2koWDbcfhWuem2oWERHC37v+Gu4zdA7LSOVwNMa3ADF6RjClLZqK
 bRz5hh+NiJ0fTJ8duApK5RM=
X-Google-Smtp-Source: AMrXdXv7LGzYFfELU1BJ9EM/sUYOtOCS3XbRpfI8EAKUyZ6nehcAbf5QyoQEurcYAEulalkYn1duRQ==
X-Received: by 2002:a17:903:449:b0:189:6ab3:9e75 with SMTP id
 iw9-20020a170903044900b001896ab39e75mr6508172plb.15.1674045577143; 
 Wed, 18 Jan 2023 04:39:37 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a170902654600b00186b69157ecsm22889182pln.202.2023.01.18.04.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:39:36 -0800 (PST)
Date: Wed, 18 Jan 2023 20:39:28 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v5 2/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Message-ID: <Y8fogDsf9vpI5F5z@Gentoo>
References: <20230117154408.1882-1-lujianhua000@gmail.com>
 <20230117154408.1882-2-lujianhua000@gmail.com>
 <Y8fhIVRbgEok29t1@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8fhIVRbgEok29t1@aspen.lan>
X-Mailman-Approved-At: Thu, 19 Jan 2023 08:35:53 +0000
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

On Wed, Jan 18, 2023 at 12:08:01PM +0000, Daniel Thompson wrote:
> On Tue, Jan 17, 2023 at 11:44:08PM +0800, Jianhua Lu wrote:
> > Add support for Kinetic KTZ8866 backlight, which is used in
> > Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> > downstream implementation [1].
> > [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
> >
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> > Changes in v2:
> >   - Add missing staitc modifier to ktz8866_write function.
> >
> > Changes in v3:
> >   - Add 2022 to Copyright line.
> >   - Sort headers.
> >   - Remove meaningless comment.
> >   - Use definitions instead of hardcoding.
> >   - Add missing maintainer info.
> >
> > Changes in v4:
> >   - Change 2022 to 2023.
> >   - Remove useless macro and enum.
> >   - Describe settings by devicetree.
> >   - Move header file to C file.
> > Changes in v5:
> >   - Change "2023" to "2022, 2023" in Copyright line.
> >   - Set scale property for backlight.
> >
> >  MAINTAINERS                       |   6 +
> >  drivers/video/backlight/Kconfig   |   8 ++
> >  drivers/video/backlight/Makefile  |   1 +
> >  drivers/video/backlight/ktz8866.c | 201 ++++++++++++++++++++++++++++++
> >  4 files changed, 216 insertions(+)
> >  create mode 100644 drivers/video/backlight/ktz8866.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 42fc47c6edfd..2084e74e1b58 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11674,6 +11674,12 @@ M:	John Hawley <warthog9@eaglescrag.net>
> >  S:	Maintained
> >  F:	tools/testing/ktest
> >
> > +KTZ8866 BACKLIGHT DRIVER
> > +M:	Jianhua Lu <lujianhua000@gmail.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > +F:	drivers/video/backlight/ktz8866.c
> > +
> >  L3MDEV
> >  M:	David Ahern <dsahern@kernel.org>
> >  L:	netdev@vger.kernel.org
> > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> > index 936ba1e4d35e..2845fd7e33ad 100644
> > --- a/drivers/video/backlight/Kconfig
> > +++ b/drivers/video/backlight/Kconfig
> > @@ -190,6 +190,14 @@ config BACKLIGHT_KTD253
> >  	  which is a 1-wire GPIO-controlled backlight found in some mobile
> >  	  phones.
> >
> > +config BACKLIGHT_KTZ8866
> > +	tristate "Backlight Driver for Kinetic KTZ8866"
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	help
> > +		Say Y to enabled the backlight driver for the Kinetic KTZ8866
> > +		found in Xiaomi Mi Pad 5 series.
> 
> s/enabled/enable/ (and sorry for spotting this one so late)
Get it.
> 
> 
> > +++ b/drivers/video/backlight/ktz8866.c
> > @@ -0,0 +1,201 @@
> > [...]
> > +static void ktz8866_init(struct ktz8866 *ktz)
> > +{
> > +	unsigned int val;
> > +
> > +	if(of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
> > +		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
> > +	else
> > +		/* Enable all 6 current sinks if the number of current sinks isn't specifed. */
> > +		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
> > +
> > +	if(of_property_read_u32(ktz->client->dev.of_node, "current-ramping-time-us", &val)) {
> > +		if(val <= 128) {
> > +			ktz8866_write(ktz, BL_CFG2, BIT(7) | (ilog2(val) << 3) | PWM_HYST);
> > +		} else {
> > +			ktz8866_write(ktz, BL_CFG2, BIT(7) | ((5 + val / 64) << 3) | PWM_HYST);
> > +		}
> 
> This code is interpreting current-ramping-time-us as milliseconds rather
> than microseconds!
> 
> I know I used microseconds in the example I proposed in the feedback for
> v4 DT bindings but "something like" means I am merely providing an
> example (mostly I was intending to show that the units should be
> included both in the property name *and* description).
> 
> It is up to you whether you fix the mismatch by changing the DT bindings
> document to current-ramping-time-ms or change this code to accept
> values in microseconds.
This is my mistake, sorry.
> 
> 
> > +	}
> > +
> > +	if(of_property_read_u32(ktz->client->dev.of_node, "led-ramping-time-us", &val)) {
> > +		unsigned int ramp_off_time = ilog2(val) + 1;
> > +		unsigned int ramp_on_time = ramp_off_time << 4;
> > +		ktz8866_write(ktz, BL_DIMMING, ramp_on_time | ramp_off_time);
> > +	}
> 
> Similarly, this code has not adopted the units specified in the
> bindings documentation.
> 
> In this case 0 would map to 512us so if you decided to use milliseconds
> you will need to add comment in the description saying that 0 will map
> to 512us because the hardware cannot ramp faster than this!
Get it, thank you very much.
> 
> 
> Daniel.
