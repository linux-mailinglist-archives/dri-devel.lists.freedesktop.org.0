Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C772C00E44
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3A010E3DE;
	Thu, 23 Oct 2025 11:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CsFvQadF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D87A10E3DE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:50:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C7B41403D1;
 Thu, 23 Oct 2025 11:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325FFC4CEFB;
 Thu, 23 Oct 2025 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761220221;
 bh=4QS5iM0LRDlFM74eG6NN1CfVEUJA9bYBWMujnXscU4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CsFvQadFgRc+y+ccpP+BSF+AXqT/OePHCPNEy8UwD+Cm4tdyldIy+j4giqN1DG+v9
 DiugizyDCKHbr2qvW4a9f7ESCiofVjk1PXiAHjvQ8Kmx/deRg8l9aSl8lNaZvYoaAp
 pXkPCNIyMZo9cmdIAE76mt6aia8a9HwllpMZW1ZApy1HRUUFMJKtZPctSraC9kS0h4
 u5WdHvH+/X8nrNqkY9wHba7cxgwKzUtfSrcP63QxZn0Ks2VH35zOhmX/VScs9dXRvQ
 UlKN0E1/s+gOe51hZ/MKHLKx7QSXOMn6A4YJXBv237vlAVhqA5/dWyUuWr/BRzXc9+
 4ARijgLHCmwMA==
Date: Thu, 23 Oct 2025 13:50:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/tidss: Add some support for splash-screen
Message-ID: <pe7wirzduogz45gtmycy4sfuklnj2c6fim4memnv7ukrpz3x66@65emaoco2cjw>
References: <20250908-tidss-splash-v2-1-e388b0581dfa@ideasonboard.com>
 <348086ac-b5bc-4ca9-9e5b-82106d319eeb@ti.com>
 <qljdrluxqi3abg7opwvp24ki7255jxrpowf47rpumzlcbnlnon@pccj5wm2kbxt>
 <0d1affe1-1e3c-452a-9052-104acaabef62@suse.de>
 <7ebf501a-68f5-4644-9419-49e391caacd8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ydue23uyzpfo4z27"
Content-Disposition: inline
In-Reply-To: <7ebf501a-68f5-4644-9419-49e391caacd8@ideasonboard.com>
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


--ydue23uyzpfo4z27
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/tidss: Add some support for splash-screen
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 07:37:27PM +0300, Tomi Valkeinen wrote:
> Hi,
>=20
> On 22/10/2025 17:59, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 22.10.25 um 16:06 schrieb Maxime Ripard:
> >> Hi,
> >>
> >> On Wed, Oct 22, 2025 at 07:25:10PM +0530, Devarsh Thakkar wrote:
> >>> On 08/09/25 14:43, Tomi Valkeinen wrote:
> >>>> Currently when the driver's probe is called, we do a full DSS reset.=
 If
> >>>> the bootloader has set up a splash-screen, the reset will disable the
> >>>> video output, and after that it may still take time until the
> >>>> display is
> >>>> usable (all the kernel modules have been loaded) and even more time
> >>>> until the userspace is able to use the display.
> >>>>
> >>>> If fbdev is enabled, in a perfect case tidss would take over the fb
> >>>> memory set up by the bootloader, and use that memory for tidss's fbd=
ev,
> >>>> thus retaining the splash-screen. However, we're not there yet.
> >>>>
> >>>> As a partial solution, this patch changes the driver so that the dri=
ver
> >>>> will not reset (or change) the DSS registers until tidss_runtime_get=
()
> >>>> is called when the display is being set up (because of fbdev
> >>>> modesetting
> >>>> or modesetting from the userspace).
> >>>>
> >>>> This is achieved in two parts:
> >>>>
> >>>> 1. Probe
> >>>>
> >>>> At probe time, in dispc_init_hw(), we check if the DSS is idle
> >>>> (videoports disabled). If yes, do a reset and continue as before. If
> >>>> not, we know that there's a splash-screen, and we set the
> >>>> 'tidss->boot_enabled_vp_mask' field to reflect the enabled VPs.
> >>>>
> >>>> We then enable the corresponding VP clocks (to ensure they stay on),
> >>>> set
> >>>> the IRQENABLE to 0 to make sure we won't get any interrupts, and then
> >>>> exit leaving the fclk and VP clocks enabled, and the runtime PM stat=
us
> >>>> active.
> >>>>
> >>>> 2. Runtime get
> >>>>
> >>>> Later, when the tidss_runtime_get() is called the first time, we che=
ck
> >>>> the 'boot_enabled_vp_mask'. If set, we know that we have the
> >>>> splash-screen showing on the screen, and thus the clocks are enabled
> >>>> and
> >>>> runtime PM status is active. This indicates that
> >>>> pm_runtime_resume_and_get() call just before in tidss_runtime_get() =
did
> >>>> not cause a runtime_resume callback to get called, so we need to do
> >>>> that
> >>>> manually.
> >>>>
> >>>> We call dispc_splash_fini() which essentially returns the DSS into t=
he
> >>>> state where it would be in a non-splash-screen case:
> >>>> dispc_splash_fini()
> >>>> will do a DSS reset, manually call the runtime_resume callback, and
> >>>> then
> >>>> call clk_disable_unprepare() and pm_runtime_put_noidle() to counter =
the
> >>>> actions at probe time.
> >>>>
> >>>> Finally 'boot_enabled_vp_mask' is set to zero to mark that we're no
> >>>> longer in the "splash-screen mode".
> >>>>
> >>>> A note about fbdev emulation:
> >>>>
> >>>> If fbdev emulation is enabled in the DRM, tidss will set up an fbdev.
> >>>> This will cause a modeset, and the blank framebuffer from tidss's fb=
dev
> >>>> will be shown instead of the splash-screen.
> >>>>
> >>>> I see two improvements to this: either we should memcpy the pixel da=
ta
> >>>> from the bootloader's splash-screen to the new fbdev buffer, or the
> >>>> fbdev could use the splash-screen directly as its buffer. I have done
> >>>> some hacks for the former, but I'm not sure how to implement either =
of
> >>>> these properly.
> >> I still think it's not the kind of driver-specific driver behaviour we
> >> want to have.
> >>
> >> Even more so when we have a generic solution to this problem in the
> >> works.
> >=20
> > I agree with that sentiment. We want atomic-state readout plus a
> > bootsplash DRM client. This would give us flicker-free booting with
> > smooth transitions across drivers and user space.
>=20
> I like the sound of it. What does a bootsplash DRM client do?

As far as I'm concerned, put a BMP on the screen, and that's it.

> Would this give us the ability for the userspace to do some small
> modifications to the fb (e.g. progress bar), and would it work with a
> built-in dummy driver (simpledrm), and the main DRM driver as a
> module?

Plymouth does all that already.

The only thing (once the state readout lands) we would lack is some way
for plymouth to access the firmware splash screen.

It works on UEFI platforms because it's exposed through UEFI (and then
sysfs) as a bmp, but we could implement something similar when the
simple-framebuffer node is there where we just allocate and copy the
buffer (and maybe convert the format?) for userspace to read it.

Maxime

--ydue23uyzpfo4z27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaPoWdQAKCRAnX84Zoj2+
dtmiAYC7JLsasbWlSVUr0OgK7yMBkBw2xSrRYNUEwNVSmMsH2v3yEFnuiny93moJ
MOecu9UBf3zrfaVribYJNnwvery2wyR7jHPRiKiLwxrr4JprsOhv9wZVk5Yit1gL
Rirw9+7qTw==
=Wu5m
-----END PGP SIGNATURE-----

--ydue23uyzpfo4z27--
