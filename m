Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB529BF53B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 19:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9C9897E0;
	Wed,  6 Nov 2024 18:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k6AvlHU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F422C10E164
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 18:28:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E20DDA418B4;
 Wed,  6 Nov 2024 18:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31605C4CEC6;
 Wed,  6 Nov 2024 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730917737;
 bh=rnISvQGTFbwR9aak+S3ATcpy7QlMOi9c5mamzVrM4jk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k6AvlHU8Jr/uvOmEKqWezuwCz3WFyXNWnlCUFv5qC1UE6+mJ9eJG81Tom3ryiMhXa
 PDP//ewUgQSg7cQem7x+DdjGyBBZgtmEh26ML74eL8F/hInN2PSdLVNYWTb1xXNNsR
 FwKpwU/cSYcxiw90GVHn+sC658Eeie3iu4fdOhKjnHXrzjU8DLlUkJvh2/0A1LjiNR
 HB5CqKsE8oxQuxnI4W8nnkXcjsjO/FS7AQaCAzGT4QBgiRFERaJsp0i85upjREt/Oh
 frox1EK+O2AP8KnGqR7S2zSFNUARu2I98ILWugMqLb4pl4X0g1d0L4kxbTl76VClHm
 gyN/GTXYbFiTQ==
Date: Wed, 6 Nov 2024 18:28:51 +0000
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
Subject: Re: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
Message-ID: <20241106-embassy-busload-2093b80d012a@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
 <20241105-disarm-baggie-e2563299a24f@spud>
 <20241105-endearing-huddling-30728a002321@spud>
 <ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XVGm5v5rYcHdZP+b"
Content-Disposition: inline
In-Reply-To: <ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com>
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


--XVGm5v5rYcHdZP+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:18:01AM +0000, Matt Coster wrote:
> On 05/11/2024 18:13, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 06:05:54PM +0000, Conor Dooley wrote:
> >> On Tue, Nov 05, 2024 at 03:58:09PM +0000, Matt Coster wrote:
> >>> The single existing GPU (AXE-1-16M) only requires a single power doma=
in.
> >>> Subsequent patches will add support for BXS-4-64 MC1, which has two p=
ower
> >>> domains. Add infrastructure now to allow for this.
> >>>
> >>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> >>> ---
> >>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 ++++++++++++=
+++++++++-
> >>>  1 file changed, 28 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.=
yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >>> index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e8=
1f24c4b93857f3e12fe 100644
> >>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >>> @@ -49,7 +49,16 @@ properties:
> >>>      maxItems: 1
> >>> =20
> >>>    power-domains:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  power-domain-names:
> >>> +    oneOf:
> >>> +      - items:
> >>> +          - const: a
> >>> +      - items:
> >>> +          - const: a
> >>> +          - const: b
> >=20
> > Additionally, a & b? Are those actually the names for the power domains?
>=20
> Sadly yes, Rogue has power domains that are literally just A, B, etc. I
> wouldn't believe me either; the attached image is taken directly from
> the documentation for BXS-4-64.

heh, nice... Also - if you have the oneOf stuff here for the same reason
as the locks, the same logic with min/maxItems applies here.

>=20
> >>> =20
> >>>  required:
> >>>    - compatible
> >>> @@ -57,10 +66,27 @@ required:
> >>>    - clocks
> >>>    - clock-names
> >>>    - interrupts
> >>> +  - power-domains
> >>> +  - power-domain-names
> >>
> >> A new required property is an ABI break. Please explain why this is
> >> acceptable in your commit message.
>=20
> Strictly it's only necessary for multi-domain GPUs, or perhaps in
> instances where the SoC power controller already enforces the
> dependencies between power domains. In reality, I think it was simply an
> oversight not to enfore this requirement in the first place. We have
> very, very few cores that require <2 power domains so names are always
> required if domains are enumerated in dt.
>=20
> Would you prefer we drop the requirement for "power-domains" and gate
> the requirement for "power-domain-names" behind >2 domains, or just
> explain the change properly and make the ABI break now while only one
> core is supported?

I dunno, depends really on whether or not it is possible to have power
domain "a" and domain "c" in a rogue gpu. If "a" and "b" is all it will
ever be, the order is fixed by the binding and you can do
genpd_dev_pm_attach_by_id() instead of genpd_dev_pm_attach_by_name().

--XVGm5v5rYcHdZP+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyu1YwAKCRB4tDGHoIJi
0rU1AP9SIaKB4ki5Bfa4HQ/kdGBer+AJ//0v2m1Gst9PRFBsbQEApyGAsUh+3/nX
giX0gYSSUx43R/EwLhcy4CoJrg7evQI=
=tGw0
-----END PGP SIGNATURE-----

--XVGm5v5rYcHdZP+b--
