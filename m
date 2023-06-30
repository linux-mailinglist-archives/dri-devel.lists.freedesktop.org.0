Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B57437D2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 11:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68C610E225;
	Fri, 30 Jun 2023 09:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D11E10E225
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:01:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E7AA65C077C;
 Fri, 30 Jun 2023 05:01:50 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 30 Jun 2023 05:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1688115710; x=1688202110; bh=s5
 e30PYxznm5bjH94t6OSnq1UQxAXEBynjfZFskfTro=; b=Fk2mfj2pHEgQtYfuCn
 w47ClgV8qhWugDTEOUGSH786h9rQ2x/jUj/LwvKWOqH90KgO19JOG95TDIET818o
 Wzp/SKtl3L9Nm4ayuKJV1PRjKHbaXVrI/gA85gSmLXiH3ySxUO/GM1EeTsz3Bdwx
 I2Eu4JhEwF4uEDuqvPIKQVj6hwzvmqe1eIlL9OtPeXpimKr42mkTxTnfUwFlu65W
 cyQoT5RkSKhNegTyQhvnOdNBRQSNlH6hsOp1tqKhYLCmvdgLmGpzaSs3XpWK+nJK
 8wVxwIuUuqqYvgAwz7TOQm6S6+FC/k3pjYmG6ds5k5BsRdmhvrYYAtMFLu5Vvfsu
 v6xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688115710; x=1688202110; bh=s5e30PYxznm5b
 jH94t6OSnq1UQxAXEBynjfZFskfTro=; b=dYeRIX6lOKWnLkaZZ2MKUm5z0ISjy
 cdOYKBWHmqviM14FTL/UACwzYmajEmcmj1E3Qo/gQ1fQ/NBQDyt6QZ2GteGOlsBk
 3FPFHB8XO6svZ4ZMcwY4fdFBw/i4fH25B6CBquWlJkvL55f416khIJWFaIfkWPXl
 I0s3/q1hpkc3+1cR/UqeL9UVI93zY0hjB8k0VdfuQNVHoe6hx5hZzMjRv0oVFbOl
 f0qML2SIGDs0YcYV6Ewv97y/05coRF3kvY8g32EhFEvnJ12uUomVDzxO+QMdytHY
 9X17D/7KGC4mlAE0lw+eYbEki1+PTUjUfwwLqP3klWQtVoWTBsjUJsqyw==
X-ME-Sender: <xms:-5meZD20VPfMckdHCgqUo96PrE7aAKg5cpfFr8n9nIPbHG3gPcvFGw>
 <xme:-5meZCGoMb9-OmXmQjuUmcu33LD0yTQ6L6eWWp6_2cnpQNATQNM__WourHNgUA2tF
 cbc-XBVAvtcjxZjpn8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:_JmeZD6U_piJmM8svyuqu2M2OMIWxG-UqxEayVD4NhxZ61W8BsIRLg>
 <xmx:_JmeZI0-oI8SfzRysS6a47fzHBEpWkSc-C0cCxsqPXRuZ2YnOhEo6Q>
 <xmx:_JmeZGEUrUsIsV1WKovHr6etgK17kY8izd85URWL8w-651rxUE_f1g>
 <xmx:_pmeZEGfbas44gfWicUAyNJWee57qwJM-Wq-yz9AfeB8Q6rhS2CVmA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CD041B6008D; Fri, 30 Jun 2023 05:01:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <723a3c51-7997-46d0-9262-68f33384a9e7@app.fastmail.com>
In-Reply-To: <20230629225113.297512-2-javierm@redhat.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <20230629225113.297512-2-javierm@redhat.com>
Date: Fri, 30 Jun 2023 11:01:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] fbdev: Split frame buffer support in FB and FB_CORE
 symbols
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023, at 00:51, Javier Martinez Canillas wrote:
> Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
> drivers are needed (e.g: only to have support for framebuffer consoles).
>
> The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
> and so it can only be enabled if that dependency is enabled as well.
>
> That means fbdev drivers have to be explicitly disabled if users want to
> enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.
>
> This patch introduces a CONFIG_FB_CORE option that could be enabled just
> to have the core support needed for CONFIG_DRM_FBDEV_EMULATION, allowing
> CONFIG_FB to be disabled (and automatically disabling all fbdev drivers).
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

This looks really nice!

I tried to do something like this a few years ago, but failed as
I did too much at once by attempting to cut out msot of the fb core
support that is not actually used by DRM at the same time.

Doing just the Kconfig bits as you do here is probably better
anyway, cutting out unneeded bits into separate modules or #ifdef
sections can come later.

> @@ -59,7 +71,7 @@ config FIRMWARE_EDID
> 
>  config FB_DEVICE
>  	bool "Provide legacy /dev/fb* device"
> -	depends on FB
> +	depends on FB_CORE
>  	default y
>  	help
>  	  Say Y here if you want the legacy /dev/fb* device file and

I don't see this symbol in linux-next yet, what tree are you using
as a base?

> @@ -69,13 +81,13 @@ config FB_DEVICE
> 
>  config FB_DDC
>  	tristate
> -	depends on FB
> +	depends on FB_CORE
>  	select I2C_ALGOBIT
>  	select I2C

This seems to only be used by actual fbdev drivers, so maybe
don't change the dependency here.

> @@ -162,22 +174,22 @@ endchoice
> 
>  config FB_SYS_FOPS
>  	tristate
> -	depends on FB
> +	depends on FB_CORE

Same for this one

>  config FB_HECUBA
>  	tristate
> -	depends on FB
> +	depends on FB_CORE
>  	depends on FB_DEFERRED_IO
> 
>  config FB_SVGALIB
>  	tristate
> -	depends on FB
> +	depends on FB_CORE
>  	help
>  	  Common utility functions useful to fbdev drivers of VGA-based
>  	  cards.
>  config FB_MACMODES
>  	tristate
> -	depends on FB
> +	depends on FB_CORE
> 

These three seem to actually be part of fbdev drivers rather
than the core, and it may be best to move them into
drviers/video/fbdev/ as standalone modules. That would be a
separate patch of course.
 
>  config FB_BACKLIGHT
>  	tristate
> -	depends on FB
> +	depends on FB_CORE
>  	select BACKLIGHT_CLASS_DEVICE

Separating this one from FB_CORE would help avoid circular dependencies,
this one keeps causing issues.

> @@ -1,22 +1,22 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
> -obj-$(CONFIG_FB)                  += fb.o
> -fb-y                              := fb_backlight.o \
> +obj-$(CONFIG_FB_CORE)             += fb_core.o
> +fb_core-y                         := fb_backlight.o \
>                                       fb_info.o \
>                                       fbmem.o fbmon.o fbcmap.o \
>                                       modedb.o fbcvt.o fb_cmdline.o 

I would not bother renaming the module itself here, that
might cause problems if anything relies on loading the
module by name or a named module parameter.

      Arnd
