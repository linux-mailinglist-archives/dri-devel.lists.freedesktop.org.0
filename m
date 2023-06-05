Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E63723132
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 22:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2024910E07B;
	Mon,  5 Jun 2023 20:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1111510E07B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0rP9lW70v0x0iAyjZ8eGEFTz23i8tjg2WhkGDwg84CM=;
 b=pf6XrMwUsZvTHmwUtpACAPjSvDU9fxXr8pUaFTJyPWQke9OwaCVk8f4jKzLYOOTTM1UypKIMCY3ok
 CHtGVkJSBM255frbHSJlsA5Ym8YtL/nCH9lbqjEjwske0i0EvLOKjDXFKlCArYyt+yCgKSgTBH8A/w
 yuLYYeS5AFX0mywAA4px3xN8/0gW0gZaHtK36fcppyaWhqVb5WBapA8VdsO9yCXsMO9u6z5rDeSCb2
 dkLu8tK7I5+QRe3tBdb6EQ8yZEiW5vvnscAGSzNHlbMby6wY3QJdbYFcQynmFBMYrU78RS+UdJLtM2
 wPx3PglED4vx0iGHAgsazwlJdS66NGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0rP9lW70v0x0iAyjZ8eGEFTz23i8tjg2WhkGDwg84CM=;
 b=H6HLfhIx9eZVBqFxNaSEk4VDVgqlXBMz76k7JenCUo0lDDIvfrLUtnEGwuHgFwgtRSqfcRJKlzuoC
 4cSK0E6BQ==
X-HalOne-ID: c826bbbd-03de-11ee-a08d-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id c826bbbd-03de-11ee-a08d-99461c6a3fe8;
 Mon, 05 Jun 2023 20:23:08 +0000 (UTC)
Date: Mon, 5 Jun 2023 22:23:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Message-ID: <20230605202307.GA452402@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 Rich Felker <dalias@libc.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael.

> >
> >Fixes a bug in the backlight driver and prepares fbdev for making
> >struct fb_info.dev optional.
> 
> I only see a rename from fbdev  to dev...
> 
> Is there missing code?
> 
> Would  a fixes: be useful?
> 
> M
> 
> >@@ -35,7 +35,7 @@ static int gpio_backlight_check_fb(struct
> >backlight_device *bl,
> > {
> > 	struct gpio_backlight *gbl = bl_get_data(bl);
> >
> >-	return gbl->fbdev == NULL || gbl->fbdev == info->dev;
> >+	return !gbl->dev || gbl->dev == info->device;
> > }

The real change is here where info->dev is replaced by info->device.

	Sam
