Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4079BB3E3BA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB56510E44D;
	Mon,  1 Sep 2025 12:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lpDNO4k7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54F310E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:53:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C45B43C1F;
 Mon,  1 Sep 2025 12:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20466C4CEF4;
 Mon,  1 Sep 2025 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756731195;
 bh=Y0Tx+amHtPH2WjZWA3oqwdIBstwnb99fhTPjWGHbmMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lpDNO4k7wfGNL6CBrLLd6AK1u4rCmrLqFZc1GNLw4qqNz3RfytWmrVqYdTXZlfPD3
 A7ziTjYC80V6/9FR9GxPX8ilunB5gmnJi7kvnY/Eirep0RE/LDYWdR2GH9C01tItmu
 g1zdk87Upw1UfADbhyaQgyK3KrJynSpN0W98ZV5bixjYTGAzM2D3GAXE9sL3WJAQb4
 a6j7dSsuqHig2XqTppW82zSO+GgQwQHRfaiSIK7TY7B/rzhs9rEPKrY8q4YXUxzjeV
 5VMn55iYOrd9maPnAEelkMrAbhaxjis+9kmgN/CZtL201/wu5JERBSaVOv4d8rqi91
 o1vo0rk5SR+FA==
Date: Mon, 1 Sep 2025 14:53:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
Message-ID: <20250901-industrious-rooster-from-mars-85e3cc@houat>
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
 <20250806-st7920-v1-3-64ab5a34f9a0@gmail.com>
 <24a5ac33-945b-4861-ac0b-94eaa647e893@kernel.org>
 <CABdCQ=Mysc3a5JNe7te0nRAOzB2n9vQcEz+hZmE3B3vmDYNt2A@mail.gmail.com>
 <083588db-10a5-48ff-80da-55c5b79e843b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4gs3gotqim3qagfw"
Content-Disposition: inline
In-Reply-To: <083588db-10a5-48ff-80da-55c5b79e843b@kernel.org>
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


--4gs3gotqim3qagfw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0

On Wed, Aug 20, 2025 at 03:10:16PM +0200, Krzysztof Kozlowski wrote:
> On 20/08/2025 14:23, Iker Pedrosa wrote:
> >>>
> >>> +DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS
> >>> +M:   Iker Pedrosa <ikerpedrosam@gmail.com>
> >>> +S:   Maintained
> >>> +T:   git https://gitlab.freedesktop.org/drm/misc/kernel.git
> >>
> >>
> >> Drop, unless you have commit rights there. Parent entry already covers
> >> this, doesn't it?
> >>
> >=20
> > I don't have them, but I'm working with Javier and I think he does have
> > permissions. Let me ask him when he gets back.
>=20
> Javier is not mentioned here. You are adding redundant and useless
> information. T: is for subsystem maintainers, not for individual drivers.

Kinda. I mean, you're absolutely right for pretty that it's implicit in
most places in the kernel.

However, it's not here. The drm-misc tree is meant to collect the
patches for all those small drivers, and we don't have a folder to put
these drivers under.

It was pretty confusing to differentiate a driver maintained through its
own tree, and one maintained through drm-misc, so at least explicitly
having the git tree set to drm-misc is how we show that's where the
patches are going to land.

Maxime

--4gs3gotqim3qagfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLWXOAAKCRAnX84Zoj2+
dqXXAYDnY4grqHpYddnisKY0oTfOh4lsJVxKw0d9i5lR+t42rLc8G+t3FPuDwTnu
m1krkWIBf3igFXowkxErMW6p1PT59x/YwatAScUQ3Zv6r8Ylb7edi4nYUnpZsu5+
ZTAAt/ddpQ==
=cCRY
-----END PGP SIGNATURE-----

--4gs3gotqim3qagfw--
