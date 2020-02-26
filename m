Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B765170334
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DD66EAAF;
	Wed, 26 Feb 2020 15:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6011B6E356
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:54:39 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j6z1A-00019b-7U; Wed, 26 Feb 2020 16:54:36 +0100
Message-ID: <8234253d725e665a4ef0f231c587e32cd4261a55.camel@pengutronix.de>
Subject: Re: Etnaviv issues on i.MX8M-Mini
From: Lucas Stach <l.stach@pengutronix.de>
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Guido
 =?ISO-8859-1?Q?G=FCnther?=
 <agx@sigxcpu.org>, Chris Healy <cphealy@gmail.com>, 
 "etnaviv@lists.freedesktop.org"
 <etnaviv@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Wed, 26 Feb 2020 16:54:35 +0100
In-Reply-To: <47cc398f-565a-5725-eb93-66870dfbdc0c@kontron.de>
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
 <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
 <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
 <f3a0bd17-83f5-4afa-e9a6-3eac411d34ff@kontron.de>
 <ca594143751e94a2cf519e03915faa23a91c2836.camel@pengutronix.de>
 <41b4070d-8db8-112c-6c57-f50af00b1604@kontron.de>
 <47cc398f-565a-5725-eb93-66870dfbdc0c@kontron.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mi, 2020-02-26 at 15:31 +0000, Schrempf Frieder wrote:
> On 25.02.20 09:13, Frieder Schrempf wrote:
> > Hi Lucas,
> > 
> > On 24.02.20 12:08, Lucas Stach wrote:
> > > On Mo, 2020-02-24 at 10:53 +0000, Schrempf Frieder wrote:
> > > > Hi Lucas,
> > > > 
> > > > On 24.02.20 11:37, Lucas Stach wrote:
> > > > > Hi Frieder,
> > > > > 
> > > > > On Mo, 2020-02-24 at 10:28 +0000, Schrempf Frieder wrote:
> > > > > > On 20.02.20 19:58, Chris Healy wrote:
> > > > > > > For the jerkey transitions, can you determine if this is a symptom of
> > > > > > > a low framerate or dropped frames or something else?
> > > > > > > 
> > > > > > > Perhaps you can start your app with
> > > > > > > "GALLIUM_HUD=fps,cpu,draw-calls,frametime".  This may give some 
> > > > > > > clues.
> > > > > > 
> > > > > > The framerate seems ok. I get something between 50 and 70 FPS.
> > > > > > 
> > > > > > I have a Qt demo app with a menu and an animated 'ball' that moves
> > > > > > across the screen. When the menu is visible, the ball movement is 
> > > > > > really
> > > > > > jerky (ball seems to 'jump back and forth' instead of moving 
> > > > > > linearly).
> > > > > > 
> > > > > > As soon as I hide the menu and show the animation fullscreen, the
> > > > > > movements are perfectly smooth.
> > > > > > 
> > > > > > Running the same app with software rendering, everything looks 
> > > > > > good, too.
> > > > > > 
> > > > > > No idea what that means, though. I probably need to look at the 
> > > > > > code of
> > > > > > the app and do some more experiments to get a better idea of what 
> > > > > > might
> > > > > > cause the distortion.
> > > > > > 
> > > > > > Unless some of the graphics experts here already have an idea of what
> > > > > > can cause and/or how to debug such an issue!?
> > > > > 
> > > > > Which driver is used for the display side? It seems like the display
> > > > > side doesn't properly handle the dma fences used to synchronize scanout
> > > > > and rendering.
> > > > 
> > > > I ported/picked the drivers for the LCDIF and DSI controllers from
> > > > development branch of the 5.4-based vendor kernel [1] to our own
> > > > v5.4-based kernel [2]. So it is quite probable, that something could be
> > > > wrong here.
> > > 
> > > Please just use DRM_MXSFB for the display side, instead of the
> > > downstream driver.
> > 
> > Hm, good idea. I somehow forgot about the fact, that there is an 
> > upstream driver for the LCDIF controller. On first try I couldn't get it 
> > to run on the i.MX8MM, but I suspect that's due to some reset, 
> > power-domain or clock setup, that is missing upstream. I will see if I 
> > can get any further with this.
> 
> So I had a closer look and while the DRM_MXSFB looks ok on its own, I 
> have some problem with the rest of the i.MX8MM display subsystem.
> 
> The vendor stack, that I'm currently using integrates into the imx-drm 
> master/core driver [1] that binds all the components of the display 
> subsystem, such as the LCDIF driver and the integrated SEC_DSIM DSI bridge.
> 
> And because of my lack of DRM skills, I have no idea how to get the 
> DRM_MXSFB driver to bind to the imx-drm core, instead of running 
> separately and connecting directly to some panel as it is done for 
> i.MX23/28 and i.MX6SX/UL.

It's a separate hardware and it's a pretty major design issue of the
downstream driver that it integrates into imx-drm. You don't want this
with the upstream driver.

Maybe Guido (CCed) can give you some clues, as apparently he is using
the mainline eLCDIF driver + some patches to drive the DSI display path
on i.MX8MQ. A lot of this will probably be transferable to the i.MX8MM
display path.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
