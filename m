Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43551AB8FF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840616EAEF;
	Thu, 16 Apr 2020 06:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CE96E945
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:10:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 62196580375;
 Wed, 15 Apr 2020 06:10:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Apr 2020 06:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=tiwnh7t3J9dCc6nvhOkiy49H6Ti
 N6hjDJXDgkFXp10U=; b=Ov/r13gv/FzeqiK7EXa2MVeWNvbtGoln8v1lZeNVTDo
 d/OBMcFNmf93rYl1dCE1+t8hxGIcBvwQn1digYa/muGYf7q0QPqzHkNxIrfTvAC5
 tOh+VmGGScNRPukR67X3s70Aaxb+m3l57KrJbUGZjPSpm1PHG5zaKEypCDS6Jzbf
 zcaXRlSFpb60fySXUEgbzV1gECrM87+2LNevWftl3sL0+W9p8Fhjx6MAEda4JGxo
 2jXL2xrhs95ybDu2qfjPAvTQtYXUljlb0vtPswczOxmkqAcFgD3JwLc6TChCwIum
 37fgD3VAhGbEFg2XQa1P7XfklKkVnMWkJL3YUqsc2TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tiwnh7
 t3J9dCc6nvhOkiy49H6TiN6hjDJXDgkFXp10U=; b=XCrhzL/Xe6ze4BgUhH61Sd
 8T4PZhQ5yllJD1PxNmKHkEWWP7xApPJG12ii/tljCURwuQeB1KjLvAxx6b8wXcqW
 9Gy47bQoLliDjRVR8/t7x3NnG4zsZ/cAnTOIBxhdc7KXJYLVYeNbWtzbieH2hiyw
 uPfCPPkRVoe+KFOvDrqzuE9uWqtGmHABy6xIM6h1jKLLKVelBWk9s11yjmRJVI6Y
 OcNkemPNftLCWhOaoPV3gFTaab8hRa+0Vd+EfjQyZbjY4u4sMOfWF+eKkHljqP1c
 9lM0B58UTX/I6NxoBLvbWMCYCs4aRH8IBRUxJOC5ewLgoFDHglS80fZvTNbdRmFQ
 ==
X-ME-Sender: <xms:gt2WXnImK0S9xi3AqSCkzOFDvgdNet3Kkr6Vn01_cxH_u_hDqsKq2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeefgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gt2WXoiiH3RLarjfPLHQ89zKsXtEVIU2fDv1eDj90V1IMXnSM3kd3A>
 <xmx:gt2WXnDb4Hsh0ws82UIxfQqGZt0NnEmLFSogaEeqXcPk7GvYkVBJ2Q>
 <xmx:gt2WXq535ML7IV_YSCHAHCRK2WpKKG6MhBYv3IlvKdn-hD4R3r3gCg>
 <xmx:hd2WXrM1KZACbLXcsL4KatHHzZI3aT0OIxW_WxpKcDuk9zkIasNyaw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D579F3280066;
 Wed, 15 Apr 2020 06:10:09 -0400 (EDT)
Date: Wed, 15 Apr 2020 12:10:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Type: multipart/mixed; boundary="===============2027263944=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2027263944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="spbhycqlgpxqdc65"
Content-Disposition: inline


--spbhycqlgpxqdc65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Apr 15, 2020 at 10:35:07AM +0200, H. Nikolaus Schaller wrote:
> * rebased to v5.7-rc1
> * added DTS for for a31, a31s, a83t - by Philipp Rossak <embed3d@gmail.com>
> * added DTS for "samsung,s5pv210-sgx540-120" - by Jonathan Bakker <xc-racer2@live.ca>
> * bindings.yaml fixes:
>   - added a31, a31
>   - fixes for omap4470
>   - jz4780 contains an sgx540-130 and not -120
>   - a83t contains an sgx544-115 and not -116
>   - removed "additionalProperties: false" because some SoC may need additional properties
>
> PATCH V5 2020-03-29 19:38:32:
> * reworked YAML bindings to pass dt_binding_check and be better grouped
> * rename all nodes to "gpu: gpu@<address>"
> * removed "img,sgx5" from example - suggested by Rob Herring <robh+dt@kernel.org>
>
> PATCH V4 2019-12-17 19:02:11:
> * MIPS: DTS: jz4780: removed "img,sgx5" from bindings
> * YAML bindings: updated according to suggestions by Rob Herring
> * MIPS: DTS: jz4780: insert-sorted gpu node by register address - suggested by Paul Cercueil
>
> PATCH V3 2019-11-24 12:40:33:
> * reworked YAML format with help by Rob Herring
> * removed .txt binding document
> * change compatible "ti,am335x-sgx" to "ti,am3352-sgx" - suggested by Tony Lindgren
>
> PATCH V2 2019-11-07 12:06:17:
> * tried to convert bindings to YAML format - suggested by Rob Herring
> * added JZ4780 DTS node (proven to load the driver)
> * removed timer and img,cores properties until we know we really need them - suggested by Rob Herring
>
> PATCH V1 2019-10-18 20:46:35:
>
> This patch series defines child nodes for the SGX5xx interface inside
> different SoC so that a driver can be found and probed by the
> compatible strings and can retrieve information about the SGX revision
> that is included in a specific SoC. It also defines the interrupt number
> to be used by the SGX driver.
>
> There is currently no mainline driver for these GPUs, but a project
> [1] is ongoing with the goal to get the open-source part as provided
> by TI/IMG and others into drivers/gpu/drm/pvrsgx.

Just a heads up, DRM requires an open-source user-space, so if your
plan is to move the open-source kernel driver while using the
closed-source library (as that page seem to suggest), that might
change a few things.

> The kernel modules built from this project have successfully
> demonstrated to work with the DTS definitions from this patch set on
> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
> partially work on OMAP3530 and PandaBoard ES but that is likely a
> problem in the kernel driver or the (non-free) user-space libraries
> and binaries.
>
> Wotk for JZ4780 (CI20 board) is in progress and there is potential
> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
> and CedarView devices.

If it's not been tested on any Allwinner board yet, I'll leave it
aside until it's been properly shown to work.

Maxime

--spbhycqlgpxqdc65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpbdgAAKCRDj7w1vZxhR
xfFrAP93okt+UedPkk9I3Q8d4NjjJQupvTn5SXqE9t4DNT4cOAD/UrA0Qy0Kn9Tr
R9ol+rlZA6+bkgWLM1ddBT4uVccQmQw=
=uJBG
-----END PGP SIGNATURE-----

--spbhycqlgpxqdc65--

--===============2027263944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2027263944==--
