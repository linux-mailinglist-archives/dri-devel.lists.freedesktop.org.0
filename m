Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918757C6E62
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 14:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1BA10E4C1;
	Thu, 12 Oct 2023 12:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1580F10E4B9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 12:41:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 66231CE284F;
 Thu, 12 Oct 2023 12:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46495C433C7;
 Thu, 12 Oct 2023 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697114462;
 bh=S+JE9f5yFI5LpkybuTpXi2ppei+deRtKMWJ4sWWwkwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AEhBi5yZTs2RCp/rbxUts8TnzXMLRcM5e48EerX+lfTZX8g+3AOCnW02A7rQwunD3
 52qmFcC2hOdCMXZmBFuzNzPjZqkBcdHx9F/B1joFycUVcG/WcMz9j9xeCVnpL3qmFR
 SSrQ/DH6F63RTp6quwYWRVzV1ZW+/ovYj49vQszbqXbBntVrsfgNSRXMGRv8/DVC9O
 6S/UJW0yA3OYQkwezMbfE8Xe/G092KsiY7K2SKuUEcuK1XXz3/FgjN8scu5ArZcWdU
 Eac+U56OUlL825tgkD4IhALAjVuO5Cva1z3YoHHU25ZIwQJJoVtTz00RpjxXZiCoWs
 9P6RUjb5B1Qiw==
Date: Thu, 12 Oct 2023 14:40:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [PATCH] drm/tidss: Power up attached PM domains on probe
Message-ID: <libnfyaftywmfr2gmkdjsv6cptzjyrrx2tkxczusifnwthyh36@olzd2e5hagtr>
References: <20231009075018.2836020-1-devarsht@ti.com>
 <c9f17f9e-b9b5-9685-30ca-6a7d041dd8aa@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dml2l2bctoq47jl4"
Content-Disposition: inline
In-Reply-To: <c9f17f9e-b9b5-9685-30ca-6a7d041dd8aa@ti.com>
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
Cc: nm@ti.com, j-choudhary@ti.com, j-luthra@ti.com, a-bhatia1@ti.com,
 praneeth@ti.com, tomi.valkeinen@ideasonboard.com, jyri.sarha@iki.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, r-ravikumar@ti.com, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dml2l2bctoq47jl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 12, 2023 at 05:10:06PM +0530, Devarsh Thakkar wrote:
> On 09/10/23 13:20, Devarsh Thakkar wrote:
> > Some SoC's such as AM62P have dedicated power domains
> > for OLDI which need to be powered on separetely along
> > with display controller.
> >=20
> > So during driver probe, power up all attached PM domains
> > enumerated in devicetree node for DSS.
> >=20
> > This also prepares base to add display support for AM62P.
> >=20
>=20
> NAK, for this patch, as discussed with team there are already plans
> to have separate OLDI bridge driver which should eventually handle
> the additional power domains.

Just for the record in case your current plan doesn't work out and we
need to revisit this patch: my point was that it's something that
deviates by a margin from what drivers are usually expected to do, so we
should document why that deviation is there.

The patch itself looks reasonable to me otherwise.

Maxime

--dml2l2bctoq47jl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSfpWAAKCRDj7w1vZxhR
xRRwAP91VGXS8cZOVzri71ykEss+wKMy4btdAbjPDACQgrhVYwD9EfdK3i474qdL
ZCVDRPfwLGIXZo5THQXx4sYZM9RT7ww=
=lW56
-----END PGP SIGNATURE-----

--dml2l2bctoq47jl4--
