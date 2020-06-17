Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3E11FC740
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938ED6EAB9;
	Wed, 17 Jun 2020 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CAD6E9CF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 02:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1592359249; bh=nfSFk/xxv2HPjCmgiQmTzC85XO7JsaYmjsZ2Hf0O8WA=;
 h=Date:From:To:Cc:Subject:References:From;
 b=RSTp/x25+vrf98bzteSPi+kPYJSJl7O5J4mEvqeDFgtzOodDhGQfnygpDh84JiXmH
 7U6a1om3H+8zqs/Y+QMNPTl24XwrWut/xPnaaHdCyotCcDDbC7Wqd3W7Oo213aSY9N
 XoVIbzOov26zePoClavc9rZy25sVMXE7VaGg/5M8=
Date: Wed, 17 Jun 2020 04:00:49 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [linux-sunxi] Re: [PATCH v3 3/5] drm: panel: Add Xingbangda
 XBD599 panel (ST7703 controller)
Message-ID: <20200617020049.iz6vujrs25kuipl6@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.io>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Samuel Holland <samuel@sholland.org>,
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Bhushan Shah <bshah@kde.org>
References: <20200513212451.1919013-1-megous@megous.com>
 <20200513212451.1919013-4-megous@megous.com>
 <CACRpkdZpiQ7E_v-Gfk6vFcUEiMazvixYaL0ksKeP=Tq3O6Fh=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZpiQ7E_v-Gfk6vFcUEiMazvixYaL0ksKeP=Tq3O6Fh=Q@mail.gmail.com>
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus,

On Tue, May 26, 2020 at 01:32:25PM +0200, Linus Walleij wrote:
> Hi Ondrej,
> 

[...]

> > +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1,
> > +                         0x82, 0x10, 0x06, 0x05, 0xA2, 0x0A, 0xA5, 0x12,
> > +                         0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
> > +                         0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00,
> > +                         0x03, 0x00, 0x00, 0x00, 0x75, 0x75, 0x31, 0x88,
> > +                         0x88, 0x88, 0x88, 0x88, 0x88, 0x13, 0x88, 0x64,
> > +                         0x64, 0x20, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> > +                         0x02, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2,
> > +                         0x02, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +                         0x00, 0x00, 0x00, 0x00, 0x02, 0x46, 0x02, 0x88,
> > +                         0x88, 0x88, 0x88, 0x88, 0x88, 0x64, 0x88, 0x13,
> > +                         0x57, 0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> > +                         0x75, 0x88, 0x23, 0x14, 0x00, 0x00, 0x02, 0x00,
> > +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0A,
> > +                         0xA5, 0x00, 0x00, 0x00, 0x00);
> > +       dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA,
> > +                         0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41, 0x35,
> > +                         0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12, 0x12,
> > +                         0x18, 0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41,
> > +                         0x35, 0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12,
> > +                         0x12, 0x18);
> > +       msleep(20);
> 
> This stuff is really hard or impossible to understand without the
> datasheet.
> 
> In my previous review I wrote:
> 
> It appears that the Himax HX8363 is using the same display controller
> if you look at the datasheet:
> http://www.datasheet-pdf.com/PDF/HX8369-A-Datasheet-Himax-729024
> There you find an explanation to some of the commands.

It is st7703, and we have a fairly complete datasheet available
publicly. I posted links in the cover letter.

> That means, try to get rid of as much of the magic bytes as you can
> and use proper #defines. I know it takes some work but the result
> is so much more useful and readable.

I've added some descriptions from the datasheet as comments next
to the values in v4.

Thank you and regards,
	o.

> Further I wrote:
> 
> You should definately insert code to read the MTP bytes:
> 0xDA manufacturer
> 0xDB driver version
> 0xDC LCD module/driver
> And print these, se e.g. my newly added NT35510 driver or
> the Sony ACX424AKP driver.
> 
> So please do that.
> 
> Yours,
> Linus Walleij
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/CACRpkdZpiQ7E_v-Gfk6vFcUEiMazvixYaL0ksKeP%3DTq3O6Fh%3DQ%40mail.gmail.com.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
