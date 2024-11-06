Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9579BF3C7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E0510E736;
	Wed,  6 Nov 2024 16:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3yxVTiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5E10E738
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 16:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C80895C4A0F;
 Wed,  6 Nov 2024 16:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9119CC4CEC6;
 Wed,  6 Nov 2024 16:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730912267;
 bh=kFDRCa0XKMHFYOR3uG48ep5LCFtGy7INevzQqLdyhe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3yxVTiBm47hSjot2DdT1qMfPqitnfZ1ftMpEVbNszJEhXknaWzfPwufHIOB9g9hK
 m7hMugw2ooCnuVEOFYWW3nMazspNkD/Q2GhHm+uDCZTPb0wQd7L7R3G1q6S3z8mdye
 8UJvWwrSxOqCq1P3bSBFad2iRMkbwXzjG/ySfkt8wMpm99V3euPdc4YDNncU3sB8gM
 pNRerVg25YNkCWuBJ25s99UHUBADlbgvA0nJFF1yGP+WfYECnFNiWxcqanNqk5J5Kv
 t4+2g/l2/U4pgnlbF1L8mmkY6hi8+J73TSwopd+NvcaT2yC8ccxHT14CfNS5heyo6P
 UWQEjZHCE5b2A==
Date: Wed, 6 Nov 2024 16:57:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
Message-ID: <20241106-flagstone-mandarin-8caf9da78f19@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com>
 <20241105-matron-gangway-64e78576ec47@spud>
 <d70a01d3-24d5-4e31-92ab-7f6626452852@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tUKQCQPIgKD2Ml6c"
Content-Disposition: inline
In-Reply-To: <d70a01d3-24d5-4e31-92ab-7f6626452852@imgtec.com>
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


--tUKQCQPIgKD2Ml6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:17:47AM +0000, Matt Coster wrote:
> On 05/11/2024 18:13, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 03:58:07PM +0000, Matt Coster wrote:
> >> The current compatible strings are not specific enough to constrain the
> >> hardware in devicetree. For example, the current "img,img-axe" string
> >> refers to the entire family of Series AXE GPUs. The more specific
> >> "img,img-axe-1-16m" string refers to the AXE-1-16M GPU which, unlike t=
he
> >> rest of its family, only uses a single power domain.
> >=20
> > That's not true, you could apply the rules using the ti,am62-gpu
> > compatible, no?
>=20
> The intent here is to draw a line between properties inherent to the IP
> core and choices made by the silicon vendor at integration time. The
> number of power domains is a property of the IP core, whereas the
> decision to use one or three clocks (next patch) is a vendor choice.

That's a different argument than the one in your commit message, but I
will accept it.

> >> Work is currently underway to add support for volcanic-based Imaginati=
on
> >> GPUs; also add a generic top-level "img,img-rogue" compatible string to
> >> allow for simpler differentiation in devicetrees.
> >=20
> > This makes no sense, how does adding another fallback compatible make
> > it simpler? I have to assume that this means there will be geothermally
> > powered axes in the future and you want to tell the difference between
> > them and those pesky rogue axes that chop the heads off of naughty
> > children?
>=20
> The intent is to add Volcanic bindings in img,powervr-volcanic.yaml, but
> the split between Rogue and Volcanic is... a bit weird. The BXS-4-64
> we're adding support for here is Rogue but, for example, the BXS-32-1024
> is Volcanic. I figured it would be nice to be able to grok from the
> devicetree which architecture a core is using without having to refer
> back to the bindings.

So not geothermally powered axes, but it was the rationale.

> The primary differentiator from a dt perspective is power topology. In
> Rogue, there are few (poorly named) power domains. Volcanic has (a)
> better domain names and (b) typically more granularity in domains,
> leading to actual dependency trees we need to care about besides the
> trivial A->B->... in Rogue.

Please add that detail to the commit message. Not all of it, but the
bits in the first paragraph.

Cheers,
Conor.

--tUKQCQPIgKD2Ml6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyugBQAKCRB4tDGHoIJi
0o5WAP9qdPoidxf7Wb9XEMajnxOl7aWPCFarHIxFdXJMcNDRsAD/SjbnAVWJB8zS
+/+GsnqRLs/GRLCfNIKRr1NjFUN4uw4=
=QMO4
-----END PGP SIGNATURE-----

--tUKQCQPIgKD2Ml6c--
