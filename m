Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC431703C0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 17:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07A36EAE0;
	Wed, 26 Feb 2020 16:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6867B6EAAC;
 Wed, 26 Feb 2020 16:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 19B20FB04;
 Wed, 26 Feb 2020 17:05:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkSU_MhDpoMl; Wed, 26 Feb 2020 17:05:09 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 584CB405CD; Wed, 26 Feb 2020 17:05:09 +0100 (CET)
Date: Wed, 26 Feb 2020 17:05:09 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Message-ID: <20200226160509.GA71919@bogon.m.sigxcpu.org>
References: <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
 <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
 <f3a0bd17-83f5-4afa-e9a6-3eac411d34ff@kontron.de>
 <ca594143751e94a2cf519e03915faa23a91c2836.camel@pengutronix.de>
 <41b4070d-8db8-112c-6c57-f50af00b1604@kontron.de>
 <47cc398f-565a-5725-eb93-66870dfbdc0c@kontron.de>
 <8234253d725e665a4ef0f231c587e32cd4261a55.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8234253d725e665a4ef0f231c587e32cd4261a55.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 04:54:35PM +0100, Lucas Stach wrote:
> On Mi, 2020-02-26 at 15:31 +0000, Schrempf Frieder wrote:
> > On 25.02.20 09:13, Frieder Schrempf wrote:
> > > Hi Lucas,
> > > 
> > > On 24.02.20 12:08, Lucas Stach wrote:
> > > > On Mo, 2020-02-24 at 10:53 +0000, Schrempf Frieder wrote:
> > > > > Hi Lucas,
> > > > > 
> > > > > On 24.02.20 11:37, Lucas Stach wrote:
> > > > > > Hi Frieder,
> > > > > > 
> > > > > > On Mo, 2020-02-24 at 10:28 +0000, Schrempf Frieder wrote:
> > > > > > > On 20.02.20 19:58, Chris Healy wrote:
> > > > > > > > For the jerkey transitions, can you determine if this is a symptom of
> > > > > > > > a low framerate or dropped frames or something else?
> > > > > > > > 
> > > > > > > > Perhaps you can start your app with
> > > > > > > > "GALLIUM_HUD=fps,cpu,draw-calls,frametime".  This may give some 
> > > > > > > > clues.
> > > > > > > 
> > > > > > > The framerate seems ok. I get something between 50 and 70 FPS.
> > > > > > > 
> > > > > > > I have a Qt demo app with a menu and an animated 'ball' that moves
> > > > > > > across the screen. When the menu is visible, the ball movement is 
> > > > > > > really
> > > > > > > jerky (ball seems to 'jump back and forth' instead of moving 
> > > > > > > linearly).
> > > > > > > 
> > > > > > > As soon as I hide the menu and show the animation fullscreen, the
> > > > > > > movements are perfectly smooth.
> > > > > > > 
> > > > > > > Running the same app with software rendering, everything looks 
> > > > > > > good, too.
> > > > > > > 
> > > > > > > No idea what that means, though. I probably need to look at the 
> > > > > > > code of
> > > > > > > the app and do some more experiments to get a better idea of what 
> > > > > > > might
> > > > > > > cause the distortion.
> > > > > > > 
> > > > > > > Unless some of the graphics experts here already have an idea of what
> > > > > > > can cause and/or how to debug such an issue!?
> > > > > > 
> > > > > > Which driver is used for the display side? It seems like the display
> > > > > > side doesn't properly handle the dma fences used to synchronize scanout
> > > > > > and rendering.
> > > > > 
> > > > > I ported/picked the drivers for the LCDIF and DSI controllers from
> > > > > development branch of the 5.4-based vendor kernel [1] to our own
> > > > > v5.4-based kernel [2]. So it is quite probable, that something could be
> > > > > wrong here.
> > > > 
> > > > Please just use DRM_MXSFB for the display side, instead of the
> > > > downstream driver.
> > > 
> > > Hm, good idea. I somehow forgot about the fact, that there is an 
> > > upstream driver for the LCDIF controller. On first try I couldn't get it 
> > > to run on the i.MX8MM, but I suspect that's due to some reset, 
> > > power-domain or clock setup, that is missing upstream. I will see if I 
> > > can get any further with this.
> > 
> > So I had a closer look and while the DRM_MXSFB looks ok on its own, I 
> > have some problem with the rest of the i.MX8MM display subsystem.
> > 
> > The vendor stack, that I'm currently using integrates into the imx-drm 
> > master/core driver [1] that binds all the components of the display 
> > subsystem, such as the LCDIF driver and the integrated SEC_DSIM DSI bridge.
> > 
> > And because of my lack of DRM skills, I have no idea how to get the 
> > DRM_MXSFB driver to bind to the imx-drm core, instead of running 
> > separately and connecting directly to some panel as it is done for 
> > i.MX23/28 and i.MX6SX/UL.
> 
> It's a separate hardware and it's a pretty major design issue of the
> downstream driver that it integrates into imx-drm. You don't want this
> with the upstream driver.
> 
> Maybe Guido (CCed) can give you some clues, as apparently he is using
> the mainline eLCDIF driver + some patches to drive the DSI display path
> on i.MX8MQ. A lot of this will probably be transferable to the i.MX8MM
> display path.

Newer mxsfb supports attaching a bridge so if you make your DSI host
controller driver a DSI bridge mxsfb can drive it:

     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mxsfb/mxsfb_drv.c#n268

this should be similar to what was done for the imx8mq here (imx8mm
users a different ip core though):

     https://source.puri.sm/guido.gunther/linux-imx8/commits/forward-upstream/next-20200217/mxsfb+nwl/v9-wip

There's also some additional mxsfb patches by Robert floating around
which aren't mainline yet which the above branch also has.

Which reminds me that i need to prepare and send out a v9.
Cheers,
 -- Guido
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
