Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A23DA036
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38266ECFE;
	Thu, 29 Jul 2021 09:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717916ECFE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:28:42 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 694FD320096B;
 Thu, 29 Jul 2021 05:28:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Jul 2021 05:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6kT7D2tp7+xWRdoEPyijvc1AhXq
 Qnvpdlx34kv2E5q8=; b=altO4aliiW0T600Ok4UsnMACmaSjB8unVukHAEgteEl
 IRaTdlwiTM6Q7R5uCpXPYivALu6PXfBRZTzoVcyUgzZNaZ5ECqHWEFindNGvkHbQ
 F4gBdZV4Q3aTq12kG12AZUcMJc1moTJEKcJUuktMS6BkXcKcpXrk2k3QXNjOX9qU
 Dqc2jxahVTDbT9CIzaU5bmNgT3n+9AB0XFhSnMBBRMnVM34u5kSWhd6aq4he494V
 45/lB8NQnCjloQJ2nKiUrdFcBE18PwzxfmacCqdRCxr6npzTZ/zb/3jpMbCXJFTn
 pWXqfj9qJ4AOHiiegWJkH1exW6pnZ1NcX4nRokgrGPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6kT7D2
 tp7+xWRdoEPyijvc1AhXqQnvpdlx34kv2E5q8=; b=LSu043wcRomacVhK1mbC4H
 jycz3aOSF7HfmK2VV4HNs6BaZA+g24iIwIqvno6e9CG2rVHqRxZvEefAc6ta0eOT
 wyo1/aAEM297faFhARfI7a62h9KZ5uzd9JLRmAQfEwYMY1LX7vq/mkfwm/WEUsSU
 ZxZqBjQrr0muMXe3Y4KG96SjeZis13iETUUJ9WDWjEadqw6J8spqu3xIT2lQHOjS
 VqAUja4sOwNgzQBbyorA0FOvRAzrQU9UrI914fq4rgb94dHpodNPod5TVxWMkSkV
 6/dBn5DZWMJzO5bcH9wi7H2tbMmLfVW+K+9xjfmnzR+YxU0JV37mqdHHFl5xbzSQ
 ==
X-ME-Sender: <xms:xXQCYZm9iEpe61KPJoqSjWeSQvAB18K5wLuf6gVA4rDKBUxgHBSX6w>
 <xme:xXQCYU1MklXM-GX6FGg3lr6s5ttdUzencW2nG5_hor6ZAdRaaC8bzycsv8eybKZbf
 yOzwdl35xNaeB_yjzk>
X-ME-Received: <xmr:xXQCYfoCNPT3qeuPLEn5s5jrU47FJTa8Une6sqRtNwa3_SHscv_ieMhMxk-8LO_O6cI3pGB80_UMlowBWDuZSirQ9ESCiMSlILoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedugddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejkeekffdtfffhhfevvddutefgtdeljeevffevvddvteegledtgfeghfehvdei
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xXQCYZlMLYRChIZtd7GDG5uTeOvxYVJrP_QIksUPgnDKRKeiepw7xQ>
 <xmx:xXQCYX3XaoGGo0q8H6pofuWgn85QU39BjI0iQykWA-1Nx8Su2jvwQw>
 <xmx:xXQCYYuqOqZqcPccWxbuFqVuK6uPIobXx0A67GuRre4qTR_wiRP0NQ>
 <xmx:x3QCYcmDC0SMT8ACJk0HCus3hJsBbvIR3qnG3ucVIMq-s7xG-Fk2vQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 05:28:37 -0400 (EDT)
Date: Thu, 29 Jul 2021 11:28:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [Regression] No framebuffer console on Rpi since 5.14-rc1
Message-ID: <20210729092835.ujtouocxgbf4vntz@gilmour>
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
 <2191b755-a888-f87d-637a-d4568da2438f@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3t4miiwtjprystya"
Content-Disposition: inline
In-Reply-To: <2191b755-a888-f87d-637a-d4568da2438f@i2se.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kees Cook <keescook@google.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3t4miiwtjprystya
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Wed, Jul 28, 2021 at 05:14:38PM +0200, Stefan Wahren wrote:
> Hi,
>=20
> Am 15.07.21 um 18:35 schrieb Stefan Wahren:
> > Hi guys,
> >
> > starting with Linux 5.14-rc1 the framebuffer console on Raspberry Pi 3/4
> > (no U-Boot, multi_v7_defconfig) isn't available anymore. The display
> > shows the rainbow screen from the bootloader and than the HDMI screen
> > goes black instead of kernel messages.
> >
> > I bisected the issue:
> >
> > 62fb9874f5da54fdb243003b386128037319b219 good
> > e73f0f0ee7541171d89f2e2491130c7771ba58d3 bad
> > e058a84bfddc42ba356a2316f2cf1141974625c9 bad
> > a6eaf3850cb171c328a8b0db6d3c79286a1eba9d good
> > 007b312c6f294770de01fbc0643610145012d244 good
> > 18703923a66aecf6f7ded0e16d22eb412ddae72f good
> > 334200bf52f0637a5ab8331c557dfcecbb9c30fa bad
> > c707b73f0cfb1acc94a20389aecde65e6385349b bad
> > caa18dd6dd9305d52943a6b59f410cbc960ad0a0 good
> > 691cf8cd7a531dbfcc29d09a23c509a86fd9b24f bad
> > 2fdcb55dfc86835e4845e3f422180b5596d23cb4 bad
> > 6c3f953381e526a1623d4575660afae8b19ffa20 bad
> > 5ea4dba68305d9648b9dba30036cc36d4e877bca bad
> > 4a888ba03fd97d1cb0253581973533965bf348c4 good
> > c5ef15ae09637fb51ae43e1d1d98329d67dd4fd6 good
> > f611b1e7624ccdbd495c19e9805629e22265aa16 bad
> > ff323d6d72e1e4971c8ba9e2f3cf8afc48f22383 good
> >
> > f611b1e7624ccdbd495c19e9805629e22265aa16 is the first bad commit
> > commit f611b1e7624ccdbd495c19e9805629e22265aa16
> > Author: Kees Cook <keescook@chromium.org>
> > Date:=A0=A0 Wed Jun 2 14:52:50 2021 -0700
> >
> > =A0=A0=A0 drm: Avoid circular dependencies for CONFIG_FB
> > =A0=A0=A0
> > =A0=A0=A0 When cleaning up other drm config dependencies, it is too eas=
y to create
> > =A0=A0=A0 larger problems. Instead, mark CONFIG_FB as a "depends":
> > =A0=A0=A0
> > =A0=A0=A0 drivers/gpu/drm/Kconfig:74:error: recursive dependency detect=
ed!
> >
> > I compared the changes to the config (based on multi_v7_defconfig) with
> > and without this patch and it shows a lot of changes. Is this intended?
>=20
> just one question: does the VC4 drm driver functionally depend on
> CONFIG_FB / FRAMEBUFFER_CONSOLE ?

No, just the fbdev emulation but it can work perfectly fine without it.

> Or with other words should we re-enable CONFIG_FB like this [1] but for
> Raspberry Pi related configs?
>=20
> [1] -
> https://lore.kernel.org/linux-samsung-soc/20210611100204.6240-1-m.szyprow=
ski@samsung.com/

It should work indeed

Maxime

--3t4miiwtjprystya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYQJ0wwAKCRDj7w1vZxhR
xXMJAQCrN8rKAZcnL/T6b7SRlMaradEBBCiQLeLJYtS05y40agD/buUaIk7TQl6t
tq/bv3ctK16F4h7DzjZRVEN0CyxIOQU=
=dlV5
-----END PGP SIGNATURE-----

--3t4miiwtjprystya--
