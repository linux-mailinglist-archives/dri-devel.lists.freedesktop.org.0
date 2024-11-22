Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137019D5AA5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 09:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAD310EAE6;
	Fri, 22 Nov 2024 08:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T/EABDjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9FC10EAE6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 08:06:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B4BA7A406AD;
 Fri, 22 Nov 2024 08:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31842C4CECE;
 Fri, 22 Nov 2024 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732262814;
 bh=hEvXNFAbKlLA5ycugqwHzMWIE5TPFsHSStNQ7IozSjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T/EABDjzLiFjpLj+4JnD6M1QszY1n9gOuE/Oi96V2wbiUI5SBsZguKCgTGxZlT97x
 wLZ9jI808UVyxZyafkDmnkGaBnuq0a8Nild9305CxVDvDa4blb73Zjfsc2sLPAprRL
 B8DS0f0w+J72kDw+axG5LNTQ9H1w8965eHdFlb/oo2FlCZdmlb1TmdtlacfHTCop7R
 PSUPaZMJSM1DlhoHH8Dcyt5rKk1pl1F+z8phkk2AdGVn0C6bCMoDC3Zfg4cd4gc3td
 gamSq+Ehw75+gJ9RqsoR2uH/MZLWUn9Sva3oAesE3JKvam6yhnlROhIe728ebbOJ8c
 hBJ8XteHU7hHA==
Date: Fri, 22 Nov 2024 09:06:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
Message-ID: <20241122-orthodox-mantis-of-reading-2dcdcf@houat>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="p4qucrakavsqq3j5"
Content-Disposition: inline
In-Reply-To: <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
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


--p4qucrakavsqq3j5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
MIME-Version: 1.0

On Thu, Nov 21, 2024 at 03:37:00PM +0000, Dave Stevenson wrote:
> On Wed, 23 Oct 2024 at 17:50, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > This series adds the required DRM, clock, and DT changes
> > required to support the display hardware on Pi5.
> > There are a couple of minor fixes first before the main patches.
> >
> > Many of the patches were authored by Maxime whilst working
> > for us, however there have been a number of fixes squashed
> > into his original patches as issues have been found. I also
> > reworked the way UBM allocations are done to avoid double
> > buffering of the handles as they are quite a limited resource.
> >
> > There are 2 variants of the IP. Most Pi5's released to date
> > have used the C1 step of the SoC, whilst the 2GB Pi5 released
> > in August is using the D0 step, as will other boards in future.
> >
> > Due to various reasons the register map got reworked between
> > the steps, so there is extra code to handle the differences.
> > Which step is in use is read out of the hardware, so they
> > share a compatible string.
>=20
> A gentle ping on the patches for clk-raspberrypi (patches 29-33) and
> Broadcom DT (patches 34-36).
>=20
> All the DRM and dtbinding ones are reviewed or acked (thank you!).

If the bindings and DRM patches are all merged, you can merge these at
least.

Maxime

--p4qucrakavsqq3j5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0A7lwAKCRAnX84Zoj2+
doaCAYD4iZV09q1bBU7gjietZumaTJnk/0RYajiLIHHMerpOFe3il/ObO1rzaMBm
mOT0urABgPae6EbuMjtidxyyV0XhCMisWgYstcv23glemnLPC9awB+uSoIJHPW1e
2lHvcCHC6A==
=RgkZ
-----END PGP SIGNATURE-----

--p4qucrakavsqq3j5--
