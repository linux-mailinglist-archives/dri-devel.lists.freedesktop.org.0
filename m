Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FCFB08598
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217E110E2F0;
	Thu, 17 Jul 2025 06:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LGPR5+GT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A5E10E2F0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A374AA57735;
 Thu, 17 Jul 2025 06:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB41BC4CEE3;
 Thu, 17 Jul 2025 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752735424;
 bh=7UNIxyfgxpuJvviww/9S/FSs6awv1lrEbpiKGrlQfIo=;
 h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
 b=LGPR5+GTb/BQ6QwL6rq/umhI9EbasKfBVpAbuqgSa36ENcO3R2YGSTF07mI1KUTPW
 puvKRTk/9ApIeaBeabcbSR34Tfc088hplI1iseH+UlCujENqKajzeY784YeyXtVfRS
 FCh1ru2LAnQ4RVO51IxZSPSbYaSOI+JSdl8eJ+lMB8CDmLjlUW62eKIZyKIxtRGgR+
 2nqNQ7cu2g8tCHQZmxJv3h60D/y2bbkm9qz3DqXpy7IFqVqTnaQI7lIeCDASfy25U6
 BJm1n/WYGeS1aIgb6KJamwa5Dc0PW88eXb7sViBtdRQJolYLg+PVQ24Ysq5G0NbpXZ
 lw+XTDM4ayzYw==
Content-Type: multipart/signed;
 boundary=b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 17 Jul 2025 08:56:59 +0200
Message-Id: <DBE4UO2RGAYX.17V1DAF8MQYJM@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andrew Davis" <afd@ti.com>, "Frank Binns" <frank.binns@imgtec.com>,
 "Matt Coster" <matt.coster@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20250716134717.4085567-1-mwalle@kernel.org>
 <20250716134717.4085567-2-mwalle@kernel.org>
 <d76c0299-a19d-4524-b026-79874fee10ee@ti.com>
In-Reply-To: <d76c0299-a19d-4524-b026-79874fee10ee@ti.com>
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

--b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

On Wed Jul 16, 2025 at 6:17 PM CEST, Andrew Davis wrote:
> On 7/16/25 8:47 AM, Michael Walle wrote:
> > The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add =
a
> > new SoC specific compatible.
> >=20
>
> If the GPU is the same, and the integration is the same, do you really ne=
ed
> a new compatible?

AFAIK it's good practise to have one to have a base for future SoC
specific quirks. For example, there are differences how that IP was
integrated, i.e. the am62p doesn't have DMA coherency (for this
peripheral), the clock is dedicated and there might be more.

>
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> >   Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 4450e2e73b3c..bad3e412a168 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -23,6 +23,7 @@ properties:
> >             - const: img,img-rogue
> >         - items:
> >             - enum:
> > +              - ti,am62p-gpu
>
> There is a check below based on SoC compat:
>
> >  - if:
> >      properties:
> >        compatible:
> >          contains:
> >            enum:
> >              - ti,am62-gpu
> >              - ti,j721s2-gpu
> >    then:
> >      properties:
> >        clocks:
> >          maxItems: 1
>
> If you do add a new SoC specific compatible does this check need updating=
?

Thanks! Yes probably.

-michael

--b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHievBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i5owGAm2rEvW9RmbxVokhD0dJUoLHn70z6itL9
b5tCySRPREmz+X0GKE03SJhXp9kaOms3AYDO/Zxy0UXbuWjjBW92jHZ9S/6Wo2dM
tpjaLZDW7YArWfJEju57j2GH/KEnPp9KQ3E=
=VcfS
-----END PGP SIGNATURE-----

--b95479761a3121fe8ae2e0878dabae26aaef421d356b40d4b638e9ad269c--
