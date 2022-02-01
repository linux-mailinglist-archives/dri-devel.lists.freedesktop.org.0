Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71684A6626
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 21:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF5C10E121;
	Tue,  1 Feb 2022 20:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F95310E143
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 20:40:17 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4b8b6b7d-839f-11ec-b20b-0050568c148b;
 Tue, 01 Feb 2022 20:41:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id AFE1A194B9E;
 Tue,  1 Feb 2022 21:40:13 +0100 (CET)
Date: Tue, 1 Feb 2022 21:40:09 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <YfmaqUBqCrgp0QdO@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <YfhM97cVH3+lJKg0@ravnborg.org>
 <Yfj/XGRRDNABsLPm@smile.fi.intel.com>
 <f8d71acb-5c8b-ac4e-0c32-38eb66af04c3@redhat.com>
 <CAMuHMdVP6ER119r2KAegjZes1a=KWZ47z6j=kgQ0oNx1oeUJ+w@mail.gmail.com>
 <51f54519-bb8b-f108-1c1e-4fed101ca5ef@redhat.com>
 <CAMuHMdVwUfv7pXhPazsgG6t=X=aVtDQkFUk_=mUuFH8Fscx8wg@mail.gmail.com>
 <abf63995-a529-1e80-18c3-df473a3e7a9c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abf63995-a529-1e80-18c3-df473a3e7a9c@redhat.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Feb 01, 2022 at 04:03:30PM +0100, Javier Martinez Canillas wrote:
> Hello Geert,
> 
> On 2/1/22 15:14, Geert Uytterhoeven wrote:
> > Hi Javier,
> > 
> > On Tue, Feb 1, 2022 at 2:09 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> On 2/1/22 12:38, Geert Uytterhoeven wrote:
> >>>> Since the current binding has a compatible "ssd1305fb-i2c", we could make the
> >>>> new one "ssd1305drm-i2c" or better, just "ssd1305-i2c".
> >>>
> >>> DT describes hardware, not software policy.
> >>> If the hardware is the same, the DT bindings should stay the same.
Only if the bindings describe the HW in a correct way that is.

> >>>
> >>
> >> Yes I know that but the thing is that the current binding don't describe
> >> the hardware correctly. For instance, don't use a backlight DT node as a
> >> property of the panel and have this "fb" suffix in the compatible strings.
> >>
> >> Having said that, my opinion is that we should just keep with the existing
> >> bindings and make compatible to that even if isn't completely correct.
> >>
> >> Since that will ease adoption of the new DRM driver and allow users to use
> >> it without the need to update their DTBs.
> > 
> > To me it looks like the pwms property is not related to the backlight
> > at all, and only needed for some variants?
> >
> 
> I was reading the datasheets of the ssd1305, ssd1306 and ssd1307. Only the
> first one mentions anything about a PWM and says:
> 
>   In phase 3, the OLED driver switches to use current source to drive the
>   OLED pixels and this is the current drive stage. SSD1305 employs PWM
>   (Pulse Width Modulation) method to control the brightness of area color
>   A, B, C, D color individually. The longer the waveform in current drive
>   stage is, the brighter is the pixel and vice versa.
> 
>   After finishing phase 3, the driver IC will go back to phase 1 to display
>   the next row image data. This threestep cycle is run continuously to refresh
>   image display on OLED panel. 
> 
> The way I understand this is that the PWM isn't used for the backlight
> but instead to power the IC and allow to display the actual pixels ?
> 
> And this matches what Maxime mentioned in this patch:
> 
> https://linux-arm-kernel.infradead.narkive.com/5i44FnQ8/patch-1-2-video-ssd1307fb-add-support-for-ssd1306-oled-controller
> 
>   The Solomon SSD1306 OLED controller is very similar to the SSD1307,
>   except for the fact that the power is given through an external PWM for
>   the 1307, and while the 1306 can generate its own power without any PWM.

I took a look at the datasheets - and all ssd1305, ssd1306 and ssd1307
are the same. They have timing constrains on the Vcc.
The random schematic I found on the net showed me that a PWM was used to
control the Vcc voltage - which again is used to control the brightness.

All the above has nothing to do with backlight - I had this mixed up in
my head.

So my current understanding:
- solomon,ssd1307fb.yaml should NOT include a backlight node - because
  the backlight is something included in the ssd130x device and not
  something separate.
- 1305, 1306, and 1307 (I did not check 1309) all requires a Vcc
  supply that shall be turned on/off according to the datasheet.
  This implies that we need a regulaator for Vcc - and the regulator
  could be a pwm based regulator or something else - the HW do not care.
- But I can see that several design connect Vcc to a fixed voltage,
  so I am not too sure about this part.

I think the correct binding would have

    ssd1307 => regulator => pwm

So the ssd1307 binding references a regulator, and the regulator
may use an pwm or may use something else.

The current binding references a vbat supply - but the datasheet do not
mention any vbat. It is most likely modelling the Vdd supply.

Right now my take is to go the simple route:
- Keep the binding as is and just use the pwm as already implemented
- Likewise keep the backlight as is

Last I recommend to drop the fbdev variant - if the drm driver has any
regressions we can fix them. And I do not see any other way to move
users over. Unless their setup breaks then they do not change.

> 
> > And the actual backlight code seems to be about internal contrast
> > adjustment?
> > 
> > So if the pwms usage is OK, what other reasons are there to break
> > DT compatibility? IMHO just the "fb" suffix is not a good reason.
> >
> 
> Absolutely agreed with you on this. It seems we should just use the existing
> binding and make the driver compatible with that. The only value is that the
> drm_panel infrastructure could be used, but making it backward compatible is
> more worthy IMO.
Using drm_panel here would IMO just complicate things - it is not that
we will see many different panels (I think).

	Sam
