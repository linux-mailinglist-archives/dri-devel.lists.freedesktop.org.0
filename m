Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B1A5C2DC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123E10E13B;
	Tue, 11 Mar 2025 13:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NQmvbkQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A6910E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:40:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC4E2A4505F;
 Tue, 11 Mar 2025 13:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A681C4CEE9;
 Tue, 11 Mar 2025 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741700454;
 bh=Gf0R7gditoYzuwPdbW2qqyMvm9Ccy9LeE68JuPxBAD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQmvbkQ+bgaQDX3OpuW57y4xyHeLysL04t7l+qbl2gQwaq+6lFkGniI2kgXzNfDGr
 6XxC+R1it1TlfnrxXjxdC3JsN8NLxU+BoOf9Wz/tJfUV6QQjZzwYER2KUAhzP08sK6
 rFGmsQB2TJl3RO7eR6hNfNWh+gl5rNJDJMPUM1Jsa2nwZ05Cjw954c7Aqazl8WxhA1
 aQGqZNl5BuXlrrJV/g5rOZCux0HvpgX4hPYkDIhaLA04KJqNqevslxdzSqmeW4WUuk
 dFAQlMyXvPMhIl4a0DPXGAyw/oeP2lZcAWoP4ckSogqhn3YxKQdudaTiavuPj8Dj1q
 fh5X6tdu43v+A==
Date: Tue, 11 Mar 2025 13:40:48 +0000
From: Lee Jones <lee@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mfd: lm3533: convert to use OF
Message-ID: <20250311134048.GI8350@google.com>
References: <20250224114815.146053-1-clamor95@gmail.com>
 <20250224114815.146053-3-clamor95@gmail.com>
 <20250228085927.GM824852@google.com>
 <CAPVz0n0jaR=UM7WbBs3zM-cZzuaPVWBjf4Q7i82hvxtXg2oCzQ@mail.gmail.com>
 <20250305134455.2843f603@jic23-huawei>
 <CAPVz0n3Qt00my1ejoyEgxTRi-mQszHybwhPq70eO=94oxMfECQ@mail.gmail.com>
 <20250308171932.2a5f0a9b@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250308171932.2a5f0a9b@jic23-huawei>
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

On Sat, 08 Mar 2025, Jonathan Cameron wrote:

> On Wed, 5 Mar 2025 16:18:38 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> 
> > ср, 5 бер. 2025 р. о 15:45 Jonathan Cameron <jic23@kernel.org> пише:
> > >
> > > On Fri, 28 Feb 2025 11:30:51 +0200
> > > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > >  
> > > > пт, 28 лют. 2025 р. о 10:59 Lee Jones <lee@kernel.org> пише:  
> > > > >
> > > > > On Mon, 24 Feb 2025, Svyatoslav Ryhel wrote:
> > > > >  
> > > > > > Remove platform data and fully relay on OF and device tree
> > > > > > parsing and binding devices.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/iio/light/lm3533-als.c      |  40 ++++---
> > > > > >  drivers/leds/leds-lm3533.c          |  46 +++++---
> > > > > >  drivers/mfd/lm3533-core.c           | 159 ++++++++--------------------
> > > > > >  drivers/video/backlight/lm3533_bl.c |  71 ++++++++++---
> > > > > >  include/linux/mfd/lm3533.h          |  35 +-----
> > > > > >  5 files changed, 164 insertions(+), 187 deletions(-)
> > > > > >  
> > ...
> > > > > >       /* ALS input is always high impedance in PWM-mode. */
> > > > > > -     if (!pdata->pwm_mode) {
> > > > > > -             ret = lm3533_als_set_resistor(als, pdata->r_select);
> > > > > > +     if (!als->pwm_mode) {
> > > > > > +             ret = lm3533_als_set_resistor(als, als->r_select);  
> > > > >
> > > > > You're already passing 'als'.
> > > > >
> > > > > Just teach lm3533_als_set_resistor that 'r_select' is now contained.
> > > > >  
> > > >
> > > > This is not scope of this patchset. I was already accused in too much
> > > > changes which make it unreadable. This patchset is dedicated to
> > > > swapping platform data to use of the device tree. NOT improving
> > > > functions, NOT rewriting arbitrary mechanics. If you feed a need for
> > > > this change, then propose a followup. I need from this driver only one
> > > > thing, that it could work with device tree. But it seems that it is
> > > > better that it just rots in the garbage bin until removed cause no one
> > > > cared.  
> > >
> > > This is not an unreasonable request as you added r_select to als.
> > > Perhaps it belongs in a separate follow up patch.  
> > 
> > I have just moved values used in pdata to private structs of each
> > driver. Without changing names or purpose.
> > 
> > > However
> > > it is worth remembering the motivation here is that you want get
> > > this code upstream, the maintainers don't have that motivation.  
> > 
> > This driver is already upstream and it is useless and incompatible
> > with majority of supported devices. Maintainers should encourage those
> > who try to help and instead we have what? A total discouragement. Well
> > defined path into nowhere.
> 
> That is not how I read the situation. A simple request was made to
> result in more maintainable code as a direct result of that
> improvement being enabled by code changes you were making.
> I'm sorry to hear that discouraged you.
> 
> > 
> > >
> > > Greg KH has given various talks on the different motivations in the
> > > past. It maybe worth a watch.
> > >
> > >  
> > > >  
> > > > > >               if (ret)
> > > > > >                       return ret;
> > > > > >       }
> > > > > > @@ -828,22 +833,16 @@ static const struct iio_info lm3533_als_info = {
> > > > > >
> > > > > >  static int lm3533_als_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > > -     const struct lm3533_als_platform_data *pdata;
> > > > > >       struct lm3533 *lm3533;
> > > > > >       struct lm3533_als *als;
> > > > > >       struct iio_dev *indio_dev;
> > > > > > +     u32 val;  
> > > > >
> > > > > Value of what, potatoes?
> > > > >  
> > > >
> > > > Oranges.  
> > >
> > > A well named variable would avoid need for any discussion of
> > > what it is the value of.
> > >  
> > 
> > This is temporary placeholder used to get values from the tree and
> > then pass it driver struct.
> 
> Better if it is a temporary placeholder with a meaningful name.
> 
> > 
> > > >  
> > > > > >       int ret;
> > > > > >
> > > > > >       lm3533 = dev_get_drvdata(pdev->dev.parent);
> > > > > >       if (!lm3533)
> > > > > >               return -EINVAL;
> > > > > >
> > > > > > -     pdata = dev_get_platdata(&pdev->dev);
> > > > > > -     if (!pdata) {
> > > > > > -             dev_err(&pdev->dev, "no platform data\n");
> > > > > > -             return -EINVAL;
> > > > > > -     }
> > > > > > -
> > > > > >       indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*als));
> > > > > >       if (!indio_dev)
> > > > > >               return -ENOMEM;
> > > > > > @@ -864,13 +863,21 @@ static int lm3533_als_probe(struct platform_device *pdev)
> > > > > >
> > > > > >       platform_set_drvdata(pdev, indio_dev);
> > > > > >
> > > > > > +     val = 200 * KILO; /* 200kOhm */  
> > > > >
> > > > > Better to #define magic numbers; DEFAULT_{DESCRIPTION}_OHMS
> > > > >  
> > > >
> > > > Why? that is not needed.  
> > > If this variable had a more useful name there would be no need for
> > > the comment either.
> > >
> > >         val_resitor_ohms = 200 * KILLO;
> > >
> > > or similar.
> > >  
> > 
> > So I have to add a "reasonably" named variable for each property I
> > want to get from device tree? Why? It seems to be a bit of overkill,
> > no? Maybe I am not aware, have variables stopped being reusable?
> 
> Lets go with yes if you want a definitive answer. In reality it's
> a question of how many are needed.  If 10-100s sure reuse is fine,
> if just a few sensible naming can remove the need for comments
> and improve readability.
> 
> Jonathan

You clearly have more patience for this than I do!  =;-)

-- 
Lee Jones [李琼斯]
