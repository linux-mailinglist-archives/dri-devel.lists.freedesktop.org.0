Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65D9284743
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3626E424;
	Tue,  6 Oct 2020 07:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8507089A59
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 08:40:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2058358028D;
 Mon,  5 Oct 2020 04:40:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 04:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=TP+YDmeLPT4LYJGRAaDqcHNdlZQ
 KtqTvNfpsMAMS4CQ=; b=Z+rHeB220VuirrOyCQDgK/LoVlcZ6b95vwcwoYsdp/2
 grsDkChi+u+3WZqTppRq3GQLgtOgo/7xPOiiUCWK+HJb9RlnG2mTjmew1ARLnUuU
 HwcMhDeZJO3bgbIij5rX2sIMZ+pbE87CfQTj/QxhLZtCj3vRld+n6VpMTlIPJbOK
 7o2EWq4v0eFMC8elqU2JYuqTmhuxWb0Z67Zg5tv+4Op647ZYsDxJx6PgeDoyvl2q
 /yS3L+5mR2GooasnddVzG/D3QgoGWeFZ3yxDMkojXfh2lEmU83MnWJ1hIciU2tQV
 x1KqI73W3dEdEQ/a27W9tAq0WSB42POklTR27jkN1Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TP+YDm
 eLPT4LYJGRAaDqcHNdlZQKtqTvNfpsMAMS4CQ=; b=M82nzWEoEQvxdYfOdMqZlu
 xN4lvZ70N1UcF6yoUwvXwG1wG0x5Km0axhYV/mwCI7mGaH03no4TysgIh+U03P+1
 +tDM38gu4uRHk0vLo83e9GRYruY6P/havXGZkCsrY37DeLq//oJoFtp5bVpwFlrO
 ZUAgwf2yWRprng0sz76wF28QuWtf4egD+tbYjIiilWGFpgzQyW1/b5osJT1Pv2zz
 kXk4WXgCmo9+IUfCQVbQ6ox8ae2h4A6dQN8YqAG0dn37uSbE2fz9CnjDO1T+OyW/
 hScpsXpACmQEnn6XjJ4oUBMZ+l/+exeeVCZGlYuYelaOdfa4/WZ8RxflwQW+DWgw
 ==
X-ME-Sender: <xms:79t6X1SxatzoAeg6XUQsD3w1TUkBPphOEZfPWD2YJqglK55nKlVhEw>
 <xme:79t6X-wUJU6yCtdwA5tas6Gnjwk96COOpIg2NYAJ0-3hUE4qW3-UZls_ZrHbx8ao7
 51wRiWi2-wSTTT75Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:79t6X61Ihn82ejYMDMF1UMoaYXDSuOc-joH5PVN1NPastwT9JegY5g>
 <xmx:79t6X9DL1ztmD654-sNP8SMt-HOvECPQK0_TSPDyfvzKiJHd5qSbNQ>
 <xmx:79t6X-hrAtyRRvymEaTkS23wZ-4iv9s3cVQrD0rDCTqwWUu45eIkpg>
 <xmx:8dt6X-74fpOHJB-sg4Wcl5A56NWIAR4QD7s0bmWZ9SCDRUn100cd9g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7472F3280063;
 Mon,  5 Oct 2020 04:40:15 -0400 (EDT)
Date: Mon, 5 Oct 2020 10:40:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add dsi-controller.yaml in DSI
 controller schemas
Message-ID: <20201005084013.loixl65nnvf4jl6f@gilmour.lan>
References: <20201002225924.3513700-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201002225924.3513700-1-robh@kernel.org>
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philippe Cornu <philippe.cornu@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1478876077=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1478876077==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i7kn4kgfo2uw7qjo"
Content-Disposition: inline


--i7kn4kgfo2uw7qjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 05:59:24PM -0500, Rob Herring wrote:
> Some DSI controllers are missing a reference to the recently added
> dsi-controller.yaml schema. Add it and we can drop the duplicate parts.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--i7kn4kgfo2uw7qjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3rb7QAKCRDj7w1vZxhR
xTXCAP4vKIeUVcYrqfw55zeSps3KKtkhsNvW+sK9F9gjf7jBxQD/UMFRpPlAiasU
MZTKaNAUJFV3UdU3iJE6ZjtiyfEQxgQ=
=+3oG
-----END PGP SIGNATURE-----

--i7kn4kgfo2uw7qjo--

--===============1478876077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1478876077==--
