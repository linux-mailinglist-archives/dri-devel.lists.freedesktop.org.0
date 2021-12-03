Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A69034674C6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4A673CF4;
	Fri,  3 Dec 2021 10:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B32773CF4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:27:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 60B0658016F;
 Fri,  3 Dec 2021 05:27:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Dec 2021 05:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=OnV8vEzoZxaVl0qHkwAThSYaRta
 UEam94WrwlUucJLE=; b=Ne0RikK4OK4w9RY64dqWgdXxNykq8qhu0IP8+vK5/OD
 Ns5t9xXVi2YLqj4mBhlFqwAAOtU74vFicEjgapkppAOO14AAlKr+1oso54XEmALJ
 QZU68mj739ZIIub5PP6A+gGciJz9CogyV4raxo8ZDPxV1si0CBubjFWBkfvBkGcj
 66z2xz/XbFH8rnSsDRAuy9Pegg6iH0IDalqG4+Z4IaB4P8hfFcuXQDWUO4HINc2K
 MGQNJWrzMVeWEEM5qxEeyJ72I3rdUBXHqw0AexPYDGsEK5e6M6fhETvRsUGxDKyQ
 RZv0ZnfAL1pQRtwAxJ45Pm2oJgXSFiz4NnPiFr39mZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OnV8vE
 zoZxaVl0qHkwAThSYaRtaUEam94WrwlUucJLE=; b=dXzo9QTCZ9wWbiIaoImVwe
 QgbZwwrII0q+GnG5jdNbJh7bIwVI0s1U0FQU7W5jof580he2MkhXEgZaZ3dZ9jti
 XDvtpoELUvLYaxF77tVqLrGFPgu58cMwrJoXlxGqEkYSGSQ0fmpXO/HplZ9tydK0
 rMbOgusu9rii4dHiJ/aEvhsmVCZVkbKRJMXkVX2irqWHd6nWxs7ahdUsYT6N8UpT
 f0dMR5p3yrH0VjQRYaw95YHDzDTPVyR/c3NY8Iy/w1vxAZG++xzB8pBpp9nAOkzO
 MFjMeo9AT6vGgOw63mhoMEEnFTXHtDvPZbgovPrsFUAkpFrSW/xTr+1V94RQnc9Q
 ==
X-ME-Sender: <xms:H_GpYXRYG8EQxSo3KjZ_Zpsg4ZDO_98YJYV4t2_IaBRL8_54ARO8Xg>
 <xme:H_GpYYz9AjVtWHBslGt3qGgkV21cu7N1nlD8DRnV_Z5clkxobb4ZEGEtiazmpLa4Y
 QF8uSZAp8QFVyzqc2I>
X-ME-Received: <xmr:H_GpYc0Ugl6j-_374RODhNdkubqettEq1pI6_MzvFDNTSk8B1P9wD6L0i2lwqB41Y2T6CS5BDDh9ioRR0nuLXXcvzWiIH3QrRfsVYtsrAV1v-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:H_GpYXB18lMe4cpBzAOMCI88ksL6pSr8s7wpohB661vc5rfAPeA-1w>
 <xmx:H_GpYQhlQjP2yBlUIvvLJB0YwPO1pYysWIbgtQ2k96AoD7HzGAyFIg>
 <xmx:H_GpYbrQUA78W_o570mrQ9q0UmnoeO5tuviXjSH-anRU4eTjMGpciA>
 <xmx:IPGpYfqFBNdu7-cayPetXO7Q06w53rKpHvOnoUv4CEUDNxYi9PWzOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:27:43 -0500 (EST)
Date: Fri, 3 Dec 2021 11:27:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v7 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Message-ID: <20211203102741.danmbjpkb5q3huk4@houat>
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
 <20211025093418.20545-5-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oqpur3x2efcto2bk"
Content-Disposition: inline
In-Reply-To: <20211025093418.20545-5-kevin3.tang@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 pony1.wu@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, zhang.lyra@gmail.com,
 orsonzhai@gmail.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oqpur3x2efcto2bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 05:34:16PM +0800, Kevin Tang wrote:
> Adds DPU(Display Processor Unit) support for the Unisoc's display
> subsystem.
> It's support multi planes, scaler, rotation, PQ(Picture Quality) and more.
>=20
> v2:
>   - Use drm_xxx to replace all DRM_XXX.
>   - Use kzalloc to replace devm_kzalloc for sprd_dpu structure init.
>=20
> v3:
>   - Remove dpu_layer stuff layer and commit layers by aotmic_update
>=20
> v4:
>   - Use drmm_helpers to allocate crtc and planes.
>   - Move rotation enum definitions to crtc layer reg bitfields.
>   - Move allocate crtc and planes to bind function.
>=20
> v5:
>   - Fix the checkpatch warnings.
>   - Use mode_set_nofb instead of mode_valid callback.
>   - Follow the OF-Graph bindings, use of_graph_get_port_by_id
>     instead of of_parse_phandle.
>   - Use zpos to represent the layer position.
>   - Rebase to last drm misc branch.
>=20
> v6:
>   - Disable and clear interrupts before register dpu IRQ
>   - Init dpi config used by crtc_state->adjusted_mode on mode_set_nofb
>   - Remove enable_irq and disable_irq function call.
>   - Remove drm_format_info function call.
>=20
> v7:
>   - Remove iommu error interrupt handling function.
>=20
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--oqpur3x2efcto2bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYanxHQAKCRDj7w1vZxhR
xVOrAP9uqqQLkzJRnj6udGJqT0o56/g+74z/9ri4LMlPaPPeVQD9HRLEUu7ieC5f
SKuHIPP1fIcYtZxho4aq8vn0I24Nvg0=
=KMxW
-----END PGP SIGNATURE-----

--oqpur3x2efcto2bk--
