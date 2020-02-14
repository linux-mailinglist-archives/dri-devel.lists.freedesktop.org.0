Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F52160CD4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629DF6E52E;
	Mon, 17 Feb 2020 08:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EE96E492
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 07:58:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CACA8221B2;
 Fri, 14 Feb 2020 02:58:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 02:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=moGuVi8NmeGkJl0VhkaoH+5NEac
 k7hwzfHXUP6NPNIk=; b=YkXdB8hBRIaWSlqu7kYBS4CNZ41nALPTOoqDRdgc518
 OfLUNNbZzYtrP+lT5lfKBuLxUlj63CrMK9CATLCeGIzkPFtiEe0mRY6264mrDnfz
 nKVotuHWtYDRxEQWWoVuJnl+S/0GJOYdnHyNFnDgbQ4IwqgRA/lKxuny5+gUy22A
 LTHtvnrQFRcH4UDnLH+SRezDOX0u692MjG3dsxmrcAO5AKGanJCZk5gGhshcbLcc
 oNxUuiZ7WgAf87ssHuxPVfvVjJrY9+hYGUbGzCDe+3nqvYuDcmDkA/6TdLCXhyvL
 TIlGoCCgRagle9Mrl7G/D4USz+GCPc7tVOTR5yuOSHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=moGuVi
 8NmeGkJl0VhkaoH+5NEack7hwzfHXUP6NPNIk=; b=FRaAoplH/LuDNMTOAHbeSC
 yGZU0FtHTfH0a4Kw1zg1wJCTMkGMdzcVJM0Tz1REVEVu9lXwi1NQi3tu6a8R8raw
 3wQp/VzzoH5zha8eVEDxkCEy0ksOalv8jgmbFpiE3SFkaBHIVwMhqj0CggyXe/Vb
 e3HhZO0udQzSATVkuOuA///L9V+IfE/AImKMeoXyZEBy/1ZQTQBxtc+3NWaMg5T5
 xYlFxp783l+FCEf8u9X8bXbr8XRFVW73fAoBvn4hxqeAMSzx8IYPkS4BKk5Q9uth
 z1xTc6YjFo3JBSeyhhW8takwuSZtJGRHzW+ETSvuNZlvkvAhlkt6uBL5GsDLInfg
 ==
X-ME-Sender: <xms:LVNGXi9giir1_spCbU2tMLmUpGzD87MszWtowH_cYFuxJXSKstUUIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieelgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpehophgvnhhvrghrihhordhorhhgpdigtghsohgrrhdrohhrghenucfkphepledtrdek
 ledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LVNGXnvLziJ8RXAiqv0Ro8Ye7LLaFNW_CNJCPhXVOhICOCVFH7fUOQ>
 <xmx:LVNGXo7srff5P6Q6XwuiHs5vVmbIpZzJmES7fId5gdZxOpZDcC83CQ>
 <xmx:LVNGXgOQO8OuvGqhGjSBnNEIPUNPTRSw-1T7iK18IsH_dQt9D9aPpw>
 <xmx:MVNGXvXVjdHYEmfpcmKJooOcxDR7NV3w2QpfM5CpykZJAwxgMIKjAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C025C3280062;
 Fri, 14 Feb 2020 02:58:36 -0500 (EST)
Date: Fri, 14 Feb 2020 08:58:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200214075835.xugmte6uigmsxqog@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200211072004.46tbqixn5ftilxae@gilmour.lan>
 <20200211204828.GA4361@kedthinkpad>
 <20200212125345.j6e3txfjqekuxh2s@gilmour.lan>
 <20200212224653.GA19494@kedthinkpad>
 <20200213092433.sc2rs7el63mwvf3y@gilmour.lan>
 <20200213181110.GA25367@kedthinkpad>
MIME-Version: 1.0
In-Reply-To: <20200213181110.GA25367@kedthinkpad>
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1736505205=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1736505205==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="edog77bh6ht5jn3f"
Content-Disposition: inline


--edog77bh6ht5jn3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 08:11:10PM +0200, Andrey Lebedev wrote:
> On Thu, Feb 13, 2020 at 10:24:33AM +0100, Maxime Ripard wrote:
> > > > do you have a board when you have been able to test it?
> > >
> > > Yes, I have the hardware (Cubieboard 2) at hand, but I cannot change the
> > > any physical connections on it. FWIW, it is https://openvario.org, the
> > > device we are (painfully) trying to upgrade from old kernel-3.4 with
> > > proprietary mali drivers to contemporary software.
> >
> > What painpoints do you have?
>
> So, even though proprietary mali drivers worked well for us, they seem
> to hold us back to old kernel-3.4, and it started to get harder to avoid
> various compatibility issues with newer software. Since there seemed to
> be a good progress with OSS lima driver lately, we decided to try to
> replace mali with lima. And that naturally pulled to switch to DRM/KMS.

You can use the proprietary mali drivers with mainline too, but yeah
it's in maintainance mode these days and you should go for lima if
you're (re)starting from scratch.

> The first painpoint is this LVDS support problem: after a week of trial
> and error, I discovered that support was simply not there. But it seemed
> that not that much was actually missing and after couple of evenings
> deep into debugging, here we are.
>
> Another one is the screen rotation: the device is installed into the
> glider' instrument panel, and some pilots prefer it in portrait
> orientation.  Under old mali setup, all that (seemingly) was required
> was setting "fbcon=rotate:n" boot arg, and both linux console and
> graphical app (https://xcsoar.org/) rotated "automagically". With new
> DRM/KMS setup, only console is rotated, all graphical apps seem to see
> the screen in its "natural" landscape orientation. Do you know if there
> is any way to leverage DMS/KMS infrastructure to make screen appear
> rotated for userspace apps (writing to /sys/class/graphics/fb0/rotate
> didn't work)?  There's of course a plan B to teach the app to rotate its
> output, but that leads to problem number 3.

There's a rotation property that can be set by whatever you're using
on top of KMS, DRM_MODE_ROTATE_*, but I'm not sure the driver supports
it at the moment.

> And the 3rd outstanding problem is that app doesn't really work under
> lima module and lima mesa driver. It starts, but renders a black window.
> I haven't dug deeply into this yet, but it is possible that some opengl
> API isn't supported in OSS drivers yet (even though app only renders 2d
> graphics).

I have no idea on this one though, sorry :/

Maxime

--edog77bh6ht5jn3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkZTKwAKCRDj7w1vZxhR
xZj3AP9JC4RKMD0CT/B3lVlvBaL1GDPoacAbj0oxlzcJwy7D8wEA0XpoAppMhnko
M1hj9gZAla4YbkP0IiqV+FH50S5L5QU=
=5Rfx
-----END PGP SIGNATURE-----

--edog77bh6ht5jn3f--

--===============1736505205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1736505205==--
