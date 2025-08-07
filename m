Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F8B1DAC4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 17:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8842D10E867;
	Thu,  7 Aug 2025 15:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A644610E867
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 15:27:23 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 16A4C1F00053
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 15:27:15 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 29ADCB012BF; Thu,  7 Aug 2025 15:27:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id E09D5B012B0;
 Thu,  7 Aug 2025 15:27:11 +0000 (UTC)
Date: Thu, 7 Aug 2025 17:27:09 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 01/22] dt-bindings: iommu: sun50i: remove resets from
 required property
Message-ID: <aJTFzQP61Kt02gOj@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-1-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NVigExWBuOabMF3V"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-1-13b52f71fb14@linumiz.com>
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


--NVigExWBuOabMF3V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Parthiban,

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> iommu in a133/a100 does not have reset control. remove it
> from required property to make it optional.
>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml |=
 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-=
iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-io=
mmu.yaml
> index a8409db4a3e3..03176f68485b 100644
> --- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> +++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> @@ -42,7 +42,6 @@ required:
>    - reg
>    - interrupts
>    - clocks
> -  - resets

Since it was previously specified that other platforms do need the reset li=
ne,
the required part should be applied conditionally based on the compatible, =
not
removed entirely.

Also your commit title and message would look better with uppercase first
letters at the start of a sentence :)

All the best,

Paul

>  additionalProperties: false

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--NVigExWBuOabMF3V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiUxc0ACgkQhP3B6o/u
lQxePg/+I0antnSk4NZw/II2a+R7vYY846KcFkqe7Hdo6lt9AuNigC7OGCb//F4L
LW4uXEl9CXkYopR2+NyD02PK1B7Pleojfy82QoqXF9MLE4/KCDSEc73YuNxMUeVc
R1gbG4msxjFjDMCTofXCuVqFUApxag6j1H6UEgwN7+3bMWtgGIjWnyT5miP9dkYs
qXTlz9D4Z6FmfYJzGHARhwAUYnbgVFCfCsrJVgvwu33pylJufcK/i3QMy9bdM/Bh
5fYLCAAu1FVcTBqjVTHjAgSI5ZbQMzISZwxTZlKU/SEb2Mu5ua2rOMDvwvkls10X
VXyn14xdaleJuWmSOVl4tgvJ28BSR/KkSrzfjx164jP8U530L3IZGKLzAOitm/Wx
Im40uRt6IF7kFV/oQhB/SEeGaIu+e7c76NmRcDtlIXSi5nv4DH/S7r5eFQ2g9JUT
r3D9gnBKLch8e/axI1I0nL+ppzFaE8dlxCP29rCpNZQaB3UyaP0EJr6xdLmf+CpH
ZKQiXypL+YoDAA/g6h+tjIxfirJod7wz6K7iOXJQ+mD4S/NhEV4zbN+Ik3H5ucxc
jC8amc1AIaO/ozQMPweLX6Uo1+wtlN5PELms4aWobzl+PIHQ//ndLq2jlQ5rRGhT
VoLcL8+6G9omA96w1h6c/I5I6MT2AikJ8vLqD3qUi+ILP9dZ8W0=
=yKpA
-----END PGP SIGNATURE-----

--NVigExWBuOabMF3V--
