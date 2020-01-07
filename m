Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55219132806
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A9E6E07D;
	Tue,  7 Jan 2020 13:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FFB6E07D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:45:44 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B41E61C2453; Tue,  7 Jan 2020 14:45:40 +0100 (CET)
Date: Tue, 7 Jan 2020 14:45:40 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v10 6/6] backlight: add led-backlight driver
Message-ID: <20200107134540.x5tngzoslssesb2y@ucw.cz>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-7-jjhiblot@ti.com>
 <20191121181350.GN43123@atomide.com> <20200107102800.GG14821@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107102800.GG14821@dell>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Tony Lindgren <tony@atomide.com>, tomi.valkeinen@ti.com, sre@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

> > * Jean-Jacques Hiblot <jjhiblot@ti.com> [700101 00:00]:
> > > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > 
> > > This patch adds a led-backlight driver (led_bl), which is similar to
> > > pwm_bl except the driver uses a LED class driver to adjust the
> > > brightness in the HW. Multiple LEDs can be used for a single backlight.
> > ...
> > 
> > > +	ret = of_property_read_u32(node, "default-brightness", &value);
> > > +	if (!ret && value <= priv->max_brightness)
> > > +		priv->default_brightness = value;
> > > +	else if (!ret  && value > priv->max_brightness)
> > > +		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
> > 
> > Hmm so just wondering.. Are we using "default-brightness" instead of the
> > usual "default-brightness-level" here?
> 
> Did this get answered?
> 
> > Please Cc me on the next patchset too :)
> 
> I've been waiting for v11.

I guess I could just remove it from a merge for now if there's no other
fix.

Best regards,
								Pavel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
