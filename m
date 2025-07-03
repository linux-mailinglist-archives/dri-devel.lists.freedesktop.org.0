Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469FAF6EF7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 11:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734E110E199;
	Thu,  3 Jul 2025 09:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g4/IS8Xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218D410E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 09:41:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2C7BD6141F;
 Thu,  3 Jul 2025 09:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BAFC4CEE3;
 Thu,  3 Jul 2025 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751535706;
 bh=riGzzi9pBWq3TiE+T6e2pPP/NHDUwf6mM2BBQKLzBnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g4/IS8XiGIPIr2y7EuL0PEaqaR/77cOWrRhsFdJFVPfP7p65CfCwsYHYD+iKOJgpJ
 7cZZMOGfln8vhhyB/oJ2bvb+DarZoKqqCxXELLC3oOh85iafDTCsHefIKM6U9RIsdy
 jLDQLJ8NePVnY7SYtd/kLIORMJ8try5yRol/fL44cIg6vTKjLcEQ55b08Fbj/VsqjW
 NSTcU4Q/IInmMFZRfCht7p+7YXw7Fy2MgwkGBoMuUG9Mas1kflbdL14pRqGeeLvtcv
 6Cbqb9ydPlZlbHI8jEd12kb9ONPhVJ8N+ZEAFNX5iKga+Wky/RUeeQLlxybzz1v979
 jHYhG0LKs/xZQ==
Date: Thu, 3 Jul 2025 11:41:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
Message-ID: <20250703-light-baboon-of-experiment-179ca3@houat>
References: <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
 <e534d496-6ce0-46c8-835d-94b3346446a7@redhat.com>
 <6e4253dd-cd73-4302-b9df-44c8c311eb22@kernel.org>
 <e2159868-f31d-4d35-b6b1-2cbd1a9d249b@suse.de>
 <f5fe3fe1-903a-48ca-9249-b77bc07dbc77@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="c6ua5moqjda34b32"
Content-Disposition: inline
In-Reply-To: <f5fe3fe1-903a-48ca-9249-b77bc07dbc77@redhat.com>
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


--c6ua5moqjda34b32
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 10:34:23AM +0200, Hans de Goede wrote:
> Hi Thomas,
>=20
> On 3-Jul-25 8:47 AM, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 02.07.25 um 22:43 schrieb Krzysztof Kozlowski:
> >> On 30/06/2025 10:40, Hans de Goede wrote:
> >>>> No one asks to drop them from the driver. I only want specific front
> >>>> compatible which will list and constrain the properties. It is not
> >>>> contradictory to your statements, U-boot support, driver support. I
> >>>> really do not see ANY argument why this cannot follow standard DT ru=
les.
> >>> So what you are saying is that you want something like:
> >>>
> >>> framebuffer0: framebuffer@1d385000 {
> >>> =A0=A0=A0=A0compatible =3D "qcom.simple-framebuffer-sm8650-mdss", "si=
mple-framebuffer";
> >>> }
> >>>
> >>> and that the binding for qcom.simple-framebuffer-sm8650-mdss
> >>> can then list interconnects ?
> >> IMO yes (after adjusting above to coding style), but as mentioned in
> >> other response you can just get an ack or opinion from Rob or Conor.
> >=20
> > But does that work with *any* device that requires interconnects? The n=
ext such simple-framebuffer device should work out of the box *without* the=
 kernel knowing anything about it. That's one of the key features of the si=
mple-framebuffer.=A0 If we have to maintainer per-device feature sets, it b=
reaks that assumption.
>=20
> The driver code for this can still be generic and since the driver
> will bind to the fallback plain "simple-framebuffer" compatible
> this should also work for new platforms.
>=20
> The e.g. "qcom.simple-framebuffer-sm8650-mdss" compatible would
> purely be something in the dt-bindings to document which simplefb
> implementations will have interconnects and which ones will not.
>=20
> The driver does not necessarily need to check these more
> precise compatibles, it can still just check for the generic
> presence of interconnects.

This ship has kind of sailed though. This binding has been used by
plenty of firmwares and bootloaders over the years, and has been
deployed on plenty of devices already.

Good luck fixing it in all of them, and then updating every device.

Maxime

--c6ua5moqjda34b32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGZQUwAKCRAnX84Zoj2+
doTXAYDVbK22x22DCT03oqgv9cGGTe21PbF5mAR7hsmYGSg2N5tHGlWLZlG67vWp
wGWbyrkBf0XcIZouuZWz3lOjzcYuoySP9CFwI+WiAS/NvYYWyJi4mRknxTI3HVss
Ck6VIzTtfg==
=q6R+
-----END PGP SIGNATURE-----

--c6ua5moqjda34b32--
