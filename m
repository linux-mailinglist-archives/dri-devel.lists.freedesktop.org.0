Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA08BD0CE
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 16:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502B010F0B5;
	Mon,  6 May 2024 14:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="Chey0lxV";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="gTcdxjD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E54710F0B5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 14:54:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id 4534C1C000E5;
 Mon,  6 May 2024 10:54:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 06 May 2024 10:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1715007249; x=1715093649; bh=dPtnUk1mbp
 BrzGLuCD41oZsYYZwy9oyATpzwrqgmybI=; b=Chey0lxVlxFMYXvkJ6KuLqEMXy
 ueZIv5zskxo0TQKU4ZGN2w0cxAcr++AUayltaRx7FtBqde/2Wg0xzs/O8NVinCE6
 7i7Oufv9pLGgmGSsXxgKiF3Yk6ppML5n5esN6IchpPgdZx+7oP/oHHv4+J49BicM
 MHfSwSwdyKmkAwloOt5kvsOf0N8h3JGyL4HdIbJuAjey3uxZu4qrYt8X3W7sdm9i
 MCl4BHqcLidnY7xSaL64Z3yoLPfvExHXuOfx23wDTGf6KtwEegiLn0xT/oPwmy+s
 0iXh2WxNLCA5vQs/8rA+/2fwLWrwm0bDGwfOlQpA+c1uL/VZqzJBltEaA5TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1715007249; x=1715093649; bh=dPtnUk1mbpBrzGLuCD41oZsYYZwy
 9oyATpzwrqgmybI=; b=gTcdxjD74zi1Fm/O4TOat5ZuozJOkB6VerWhwP3Zomoh
 YF/8r9kiu5rfAHiHrBh8yinAYBqCX/WLakN2Yg4oAZj8TSYqm38DCSDED1wenj3Y
 W0LyPc1bZ7X0oUhnhThRajUXH8hehFyZFh0/VXzCcw9xCaLxsE0xIB/JPJv3kk2h
 4tVmbpSymQ2fP5hnZDrtfeIxkgnXKaV5kdEwru7ZQlikY9ptMmducvmLWVuD1y4B
 Sz7HJ6sa9aCU1/TdhZdt++0MKTL+jLgCUwqG11N6nygmUPCf36jA8EW2AIm7erk2
 eCVrdxWwZ5OIY7pnUrLroV0qEXxAQCsTEDPMcBYzeQ==
X-ME-Sender: <xms:Ee84ZqegkxA7t4u7GN01BPkNT-j3FqO2yEWz04z3lxA4ivoUA_xrHQ>
 <xme:Ee84ZkONG-VZxnjpJcgzEJQyJyV8fkb8eFC7OFUCjpsu2AOtFHznbm4DUWZoz8CZJ
 rMmyduksIGeUGQADT4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepleehueefffevveejgfelveeiuedutdevtdfhtdevveelgfevuedtkeeiffei
 geffnecuffhomhgrihhnpehgohhoghhlvghsohhurhgtvgdrtghomhenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdr
 uggv
X-ME-Proxy: <xmx:Ee84ZrivyZgishPHpkhy3Wtvx7Us6Et0bh-CQqQYNdAhaZZQoyLapA>
 <xmx:Ee84Zn-NQhQ3NjDLGuxHqq1l38hlSgRxJ6YdtvTizeD3yUqAzlgyeg>
 <xmx:Ee84ZmsdzjpeJWv7J44qMTiLM8EKiyap70Q5wdPgmT76hiWc3cc-vg>
 <xmx:Ee84ZuFEu6HstedCy7D9UH3aIyis0_g7lDSyylQls0bZbLgTfbF3aw>
 <xmx:Ee84ZkD2ozUkW8eELiQNWx0BOxW8OE2EB4knJwQasg89KOHhklB-NBWC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1D772B6008F; Mon,  6 May 2024 10:54:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-437-gcad818a2a-fm-20240502.001-gcad818a2
MIME-Version: 1.0
Message-Id: <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
In-Reply-To: <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
 <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
 <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
 <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
Date: Mon, 06 May 2024 16:53:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Vetter" <daniel@ffwll.ch>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, "Helge Deller" <deller@gmx.de>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Sam Ravnborg" <sam@ravnborg.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
Content-Type: text/plain
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

On Mon, May 6, 2024, at 15:14, Daniel Vetter wrote:
> On Fri, May 03, 2024 at 01:22:10PM -0700, Florian Fainelli wrote:
>> On 5/3/24 12:45, Arnd Bergmann wrote:
>> > On Fri, May 3, 2024, at 21:28, Florian Fainelli wrote:
>> > > Android devices in recovery mode make use of a framebuffer device to
>> > > provide an user interface. In a GKI configuration that has CONFIG_FB=m,
>> > > but CONFIG_FB_NOTIFY=y, loading the fb.ko module will fail with:
>> > > 
>> > > fb: Unknown symbol fb_notifier_call_chain (err -2)
>> > > 
>> > > Have CONFIG_FB_NOTIFY be tristate, just like CONFIG_FB such that both
>> > > can be loaded as module with fb_notify.ko first, and fb.ko second.
>> > > 
>> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> > 
>> > I see two problems here, so I don't think this is the right
>> > approach:
>> > 
>> >   1. I don't understand your description: Since fb_notifier_call_chain()
>> >      is an exported symbol, it should work for both FB_NOTIFY=y and
>> >      FB_NOTIFY=m, unless something in Android drops the exported
>> >      symbols for some reason.
>> 
>> The symbol is still exported in the Android tree. The issue is that the GKI
>> defconfig does not enable any CONFIG_FB options at all. This is left for SoC
>> vendors to do in their own "fragment" which would add CONFIG_FB=m. That
>> implies CONFIG_FB_NOTIFY=y which was not part of the original kernel image
>> we build/run against, and so we cannot resolve the symbol.

I see.

>> This could be resolved by having the GKI kernel have CONFIG_FB_NOTIFY=y but
>> this is a bit wasteful (not by much since the code is very slim anyway) and
>> it does require making changes specifically to the Android tree which could
>> be beneficial upstream, hence my attempt at going upstream first.
>
> Making fbdev (the driver subsystem, not the uapi, we'll still happily
> merge patches for that) more useful is really not the upstream direction :-)

I'm more worried about the idea of enabling an entire subsystem
as a loadable module and expecting that to work with an existing
kernel, specifically when the drm.ko and fb.ko interact with
one another and are built with different .config files.

This is the current Android GKI config:
https://android.googlesource.com/kernel/common.git/+/refs/heads/android-mainline/arch/arm64/configs/gki_defconfig
where I can see that CONFIG_DRM is built-in, but DRM_FBDEV_EMULATION
CONFIG_VT, CONFIG_FRAMEBUFFER_CONSOLE, CONFIG_FB_DEVICE and
CONFIG_FB_CORE are all disabled.

So the console won't work at all,I think this means that there
is no way to get the console working, but building a fb.ko module
allows using /dev/fb with simplefb.ko (or any other one) happens
to almost work, but only by dumb luck rather than by design.

>> > $ git grep -w fb_register_client
>> > arch/arm/mach-pxa/am200epd.c:   fb_register_client(&am200_fb_notif);
>> > drivers/leds/trigger/ledtrig-backlight.c:       ret = fb_register_client(&n->notifier);
>> > drivers/video/backlight/backlight.c:    return fb_register_client(&bd->fb_notif);
>> > drivers/video/backlight/lcd.c:  return fb_register_client(&ld->fb_notif);
>> > 
>> > Somewhat related but not directly addressing your patch, I wonder
>> > if Android itself could migrate to using FB_CORE=m FB=n FB_NOTIFY=n
>> > instead and use simpledrm for the console in place of the legacy
>> > fbdev layer.
>> 
>> That is beyond my reach :)
>
> This one is. And it doesn't need to be simpledrm, just a drm kms driver
> with fbdev emulation. Heck even if you have an fbdev driver you should
> control the corresponding backlight explicitly, and not rely on the fb
> notifier to magical enable/disable some random backlights somewhere.
>
> So please do not encourage using this in any modern code.

I suppose making CONFIG_FB_NOTIFIER optional for FB (on by
default if any of the consumers of the notification are turned
on) would not be a bad direction to go in general and also
address Florian's link error, but that doesn't solve the
more general concern about a third-party fb.ko module on a
kernel that was explicitly built with FB disabled.

The GKI defconfig was initially done at a time where one could
not have CONFIG_FBDEV_EMULATION and CONFIG_FB_DEVICE without
pulling in the entire fbdev module, but now that is possible.
Maybe that is something that Android could now include?

Alternatively, I wonder if that recovery image could be changed
to access the screen through the /dev/dri/ interfaces? I have
no experience in using those without Xorg or Wayland, is that
a sensible thing to do?

      Arnd
