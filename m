Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101054B270E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B445510EC1F;
	Fri, 11 Feb 2022 13:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E82C10EC1F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:28:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7CEF03201FEA;
 Fri, 11 Feb 2022 08:28:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 11 Feb 2022 08:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=PzaTN7mlEKSxMvKGHYiMk2tpJE/2C3uzL3iB4/
 KuUtk=; b=VBM0F/IipLdJphRO3uoN1KHR2yYCXB97SaBWxf7/sPLkzmGkWhghGs
 nz2HFKrsO2+xRfoCeXuvswL6kDmjgEHBRH/prnteIpio08TxAhl3G37r4Rb1c1Uj
 9pKEL+vRPtB0XBskYDnywPeHaB2TMLoUQVdQDJYU2n8+QmLOFUPPwKl1p4ZXlC9d
 h6vOuXBodPnsWYIh8keCg1aWuyMoDd/L0Kaa4H0skc+5zEaF/BF1jqu1JFCVW8u3
 VLgB6ZudUNSzO8TL73ghfK5w8OI+NUBhyxzHBhToIoPCadj8Fr8m/UKaCaoA6ncf
 dfBXo5cPFotChcJxd00h3AnEPtR1Soqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PzaTN7mlEKSxMvKGH
 YiMk2tpJE/2C3uzL3iB4/KuUtk=; b=d8adZPQiCHrtimjrj0uzDm9Z/UEuhTFk9
 KUDC2gWCe59pv2GiYvWNqjfPeeKrEayIuFfX3/06CBrdbANIstStRS4gsZb4McPU
 FmnRa2uB2ueDezEKl4lAPE3LShnu7bgfOKZI4HkGpNPHE2UP7l98Lf+BXT94xNnp
 mPdMcxIN7s8DztVf28EpjLL9+9cGnIGW8Ov2ICrz0JYw+W2ztihXSnAuEoBo216t
 8MuWecSrymKDcypzPcUcFOV3fINQqpIx9rU0h9AS7bUJnnTzjdv3emtexI/tJ1m3
 HxFUsHf40ATk+BoUWNFupTJBzfngU4I9xeoPcrGzbLZ6RC58V0ehA==
X-ME-Sender: <xms:bWQGYgjW4E0Ija81r84ZW_Ld9GNyACFVgIMu2eUpnU1KVMDzozIbbw>
 <xme:bWQGYpBtXLBqzBocWB5ISEhtKP0D6U4x2pTA-gwNfMrP4Vdl58aW3SZZC6GdK6Wgw
 6vsWhNX3Y8mD44Bx1A>
X-ME-Received: <xmr:bWQGYoFe6vlc34QoY-_yOAaE3V-7G6VPI-GaXum187DjC3niEdqhG8BC1uijzcZDtzjRL0lWlAWrG1MCVTkr_uFog6Nh4PIIA7JQD7I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bWQGYhSPgTvOO3ANAsBnE7FdJU2rpsFuLPipaQXx9d24jdNbn-qWLw>
 <xmx:bWQGYtynaTe5B88LCvFMYDuqoZdFQRoq5gX2cTzzyDRRenDHOBnXow>
 <xmx:bWQGYv68goypCXU3pH1jb55q7c1J2EPWjL9C4vN7Pyaq5a1JKIwJ5w>
 <xmx:bmQGYknNzy5_918OmvkR3h_YwYDZdhCHJDLvZ-mzzkqbofJ0yUcyog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 08:28:12 -0500 (EST)
Date: Fri, 11 Feb 2022 14:28:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 2/3] drm/mipi-dbi: Add driver_private member to struct
 mipi_dbi_dev
Message-ID: <20220211132811.nx6sdsixbilejjbm@houat>
References: <20220211130434.20732-1-noralf@tronnes.org>
 <20220211130434.20732-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xkdrobkukfhjqffv"
Content-Disposition: inline
In-Reply-To: <20220211130434.20732-3-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xkdrobkukfhjqffv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 02:04:33PM +0100, Noralf Tr=F8nnes wrote:
> devm_drm_dev_alloc() can't allocate structures that embed a structure
> which then again embeds drm_device. Workaround this by adding a
> driver_private pointer to struct mipi_dbi_dev which the driver can use for
> its additional state.
>=20
> v3:
> - Add documentation
>=20
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--xkdrobkukfhjqffv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgZkawAKCRDj7w1vZxhR
xZngAQCv16+b1+ZuKquRTQGqbB6QpVPUH7zQb8+TtWccxNvVbQD+KG0DEiIU+8fd
3gVk9PRMsNSGInpFlF3OzjgpuZt+3gk=
=/K/q
-----END PGP SIGNATURE-----

--xkdrobkukfhjqffv--
