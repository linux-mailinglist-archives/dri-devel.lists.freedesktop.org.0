Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D580AE23
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5F410EB27;
	Fri,  8 Dec 2023 20:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1509 seconds by postgrey-1.36 at gabe;
 Fri, 08 Dec 2023 20:43:41 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9133810EB27
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tt/vgZair8oQaWQQmIRBw9lUyYFxaqNxtAp9NQOC8Uw=; b=RhdDRBxHC5EwMPr+QFRf6I1v/e
 PJIb4hQmsHpp11qPBM7zdAX/K34jOi12z+EhekGMi0fo7gqeYFT5yiPPGYli7RgcxAYpeqnnSolU5
 C1co4Cnm3Z0A6zhiItYFUehSsV1KtmFEqVIEERhmjUqyGGylh29O/P5BPu1IyGIq5BtrNcXg8Iyt8
 NfFPJPIx3/dTzk8IdnWTbyRX2YGeCcnurvz+bvPxMPhr230QIejxwVMdL4ysKqczujO2TRQx/u9V1
 3WcMdkvugJ2FplXjVFPEu9+lazb+szo6KP0uxran8VuKkzbS337npmtZnwAAvLnQufL/3zn+sU5uP
 w28ryrvg==;
Received: from [2a01:799:950:4300:268a:bbd3:738c:c4c6] (port=42932)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1rBhIn-002A7D-7v;
 Fri, 08 Dec 2023 21:18:25 +0100
Message-ID: <7c848801-cf7f-4293-8a29-084dd20efb8e@tronnes.org>
Date: Fri, 8 Dec 2023 21:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: State of affairs with Ilitek 9341 support
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <ZXM9pG-53V4S8E2H@smile.fi.intel.com>
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <ZXM9pG-53V4S8E2H@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Priit Laes <plaes@plaes.org>, Maxime Ripard <mripard@kernel.org>,
 noralf@tronnes.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Lechner <dlechner@baylibre.com>, Dillon Min <dillon.minfei@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/8/23 17:00, Andy Shevchenko wrote:
> Included authors and latest (non-white-space) contributors to the drivers
> in question along with relevant mailing list and respective (active in the
> area) maintainers.
> 
> I already had risen the question in times when 4th (sic!) driver for the same
> hardware was about to be pulled into upstream that we have to somehow reduce
> the code base and unify device properties.
> 
> So, the main question here "What is the plan and where are we now?"
> 
> I admit that fbtft case is special as it supports, in particular, platform
> device (parallel interface) and also well established in the embedded world.
> What about the rest?
> 
> N.B. Besides the fact that panel drivers are too OF-centric, which is bad
> practice for the new kernel code in general and has to be stopped. I.o.w.
> seeing of_property_*() or alike in the driver after ca. 2020 should be
> immediate NAK unless it's very well justified why it may not be used on
> non-OF systems.
> 

Last year drivers/gpu/drm/tiny/panel-mipi-dbi.c was added to support all
MIPI DBI compatible (ili9341) SPI displays.
It loads the initialisation commands from a firmware file. For more info
see https://github.com/notro/panel-mipi-dbi/wiki.

When I started on fbtft in 2013 I didn't know about MIPI DBI so I made
some common bus access functions and one driver per controller and that
driver had an initialisation sequence to match the panel I had. Then I
discovered that displays using the same controller could have different
init sequences so I added a Device Tree <init> property that could
override the driver init.

In 2015 fbtft was added to drivers/staging, but later that year fbdev
was closed for new drivers so it was a dead end.

I started to work on porting fbtft to DRM and almost 2 years later
support for the MI0283QT panel (ILI9341) was added.
I had now learned about MIPI DBI so a library to handle that was added.
I had asked on the Device Tree ML about the <init> property and I was
told that I couldn't have that which meant that I couldn't get away with
having just one driver for the MIPI DBI compatible display panels as I
was first hoping for.

I was aware that there was a challenge going from fbtft to DRM because
in fbtft there is support for all panel setups using the <init>
property, but in DRM every panel needed support in a driver. So I
started to look at adding Device Tree properties to describe the setup
for one controller. This would make it easy to describe a new panel in
Device Tree for a supported controller. Maxime Ripard came up with the
idea to have the controller initialisation commands in a firmware file
which meant that we could get away with having just one driver for all
MIPI DBI SPI panels (which is the vast majority of these SPI pixel
upload panels).

This meant that SPI support could be removed from all the MIPI DBI
compatible controllers in fbtft since there's now a solution for them in
DRM. The drivers themselves must stay since they also have parallel bus
support which is lacking in DRM. My plan was to wait for panel-mipi-dbi
to hit an LTS and then either prepare patches to remove MIPI DBI SPI
support from fbtft or at least send an email to staging about the new
driver. Unfortunately my health problems got worse and many plans went
out the window.


ILI9341 DRM drivers

- drivers/gpu/drm/tiny/mi0283qt.c
  This was the first driver added for the MI0283QT panel series

- drivers/gpu/drm/tiny/ili9341.c
  Later ili9341 based panels was decided to be added to a controller
  specific driver.

- drivers/gpu/drm/tiny/panel-mipi-dbi.c
  Generic MIPI DBI SPI driver that loads init commands from a firmware
  file. It uses of_property_read_string_index() and
  of_get_drm_panel_display_mode(). I don't know if it's possible to make
  device_property_*() versions of those.

- drivers/gpu/drm/panel/panel-ilitek-ili9341.c
  This driver supports the MIPI DPI (RGB) interface on the controller.
  Controller init is done over MIPI DBI SPI. The driver does also for
  some reason support the same panel as the ili9341.c driver does.
  So 2 drivers for the same panel...
  Sidenote: It is possible to make a generic panel-mipi-dpi.c driver for
  panels that use DPI for pixels and DBI for init loaded from a firmware
  file.


Noralf.
