Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ED0AB9703
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216D710E9C9;
	Fri, 16 May 2025 07:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U3xEd25L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49E710E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:59:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E9BFF43AB1;
 Fri, 16 May 2025 07:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50609C4CEE4;
 Fri, 16 May 2025 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747382374;
 bh=51UiwAtTBw1xtOTx6e1Pp64GJoZ4L5WSxUxJDmEN9Kg=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=U3xEd25LCeI5ukSRK+khUpX/7FrIdv7pmsPIoVDcXd977W94/6EfEvi7labDdNvg7
 89SxW/GpepKxBL5ot2BIQ51iRgEMwULni7ZiUz3AFh3MVjC7zEUbWXuJzzjUVvxoIK
 CfsX2IzFCTgcmg74kg8SnZ64ckcp9pFGw6cKBf4SczEUSqn/Y1khXtZ2mOe1LDiXhE
 blgmYVgSOJehRAknA1OoYmdfQGvU4whBtwlBWF3TsUN8wumFBZkCt7f6AsDwatq/CY
 Fde1crnHIujZ1oW/M9gwSEx3LwfmIiqHQwp1XNkS5zgLUM//OSXAghtYvJbbeopjRV
 cniiO3aZVFuLg==
Content-Type: multipart/signed;
 boundary=d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 16 May 2025 09:59:30 +0200
Message-Id: <D9XFCQYPTRMX.3AKZYI2Z5SV2Y@kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Devarsh Thakkar" <devarsht@ti.com>, "Praneeth Bajjuri" <praneeth@ti.com>,
 "Udit Kumar" <u-kumar1@ti.com>, "Jayesh Choudhary" <j-choudhary@ti.com>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Alexander Sverdlin"
 <alexander.sverdlin@siemens.com>, "DRI Development List"
 <dri-devel@lists.freedesktop.org>, "Devicetree List"
 <devicetree@vger.kernel.org>, "Linux Kernel List"
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Aradhya Bhatia" <aradhya.bhatia@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Jyri Sarha" <jyri.sarha@iki.fi>
Subject: Re: [PATCH v7 4/4] drm/tidss: Add OLDI bridge support
X-Mailer: aerc 0.16.0
References: <20250329133943.110698-1-aradhya.bhatia@linux.dev>
 <20250329133943.110698-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250329133943.110698-5-aradhya.bhatia@linux.dev>
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

--d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Mar 29, 2025 at 2:39 PM CET, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
>
> The AM62x and AM62Px SoCs feature 2 OLDI TXes each, which makes it
> possible to connect them in dual-link or cloned single-link OLDI display
> modes. The current OLDI support in tidss_dispc.c can only support for
> a single OLDI TX, connected to a VP and doesn't really support
> configuration of OLDIs in the other modes. The current OLDI support in
> tidss_dispc.c also works on the principle that the OLDI output can only
> be served by one, and only one, DSS video-port. This isn't the case in
> the AM62Px SoC, where there are 2 DSS controllers present that share the
> OLDI TXes.
>
> Having their own devicetree and their own bridge entity will help
> support the various display modes and sharing possiblilities of the OLDI
> hardware.
>
> For all these reasons, add support for the OLDI TXes as DRM bridges.
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Tested-by: Michael Walle <mwalle@kernel.org> # on a j722s/am67a

FWIW, I have a few downstream patches to get the DSS on j722s
running.

-michael

--d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaCbwYhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hj6gF/Wusj103bkQJ0s/qoyxRDcMUItzGDi4DS
o3U2g+BCnLNbwlPXUphnJlSKimOAS8ynAX9WTLPfNmCmAVDU8f08fakCPkJUot0x
tdNCXLNt5WYI5Hj5jUV6ysIYmadhcu0rjv8=
=GNXG
-----END PGP SIGNATURE-----

--d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902--
