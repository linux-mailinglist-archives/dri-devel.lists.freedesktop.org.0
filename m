Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D047435C60
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378746E40B;
	Thu, 21 Oct 2021 07:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7B56E40B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:48:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E42633201DA2;
 Thu, 21 Oct 2021 03:48:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 21 Oct 2021 03:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zpBgTDJCQVdqL58x14xvNNekncl
 kMEd69doup9a78KM=; b=Gidl1YtodZ/Dve/psxfyN2T9t59bVvNu3rlMNuAEmf1
 f81xLsBZr+0Lj2jRfHuxPbKNt49Tke1UHbRUdvE/r90aKH2iTJKs6qXENdejFrh1
 VVw6FzCR0yJcXTUBYiUjFs3GG8Uut6OEIRucCit17MFgvL4HtlRvl9yDQqIPG/EG
 ltwPS/umhLo+17Ds2V6UoS6JvkTpkVtUJRPZ14UjL8ktH/Jym1O592oZP7pMh0DF
 PPuoYLT0KC3MRIlsMGhe+/tmDRKmHQ5u7DeajYVOAQf2vux4fuCen4Hg6JlFxV1X
 6XCXPn5tY05DySKL8ojSoaNVEcNhrJhWiC95vW/Uy3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zpBgTD
 JCQVdqL58x14xvNNeknclkMEd69doup9a78KM=; b=l5Gv2vhxUxcpie0ZBWE2ZY
 yxRq4DN+Hx4dmrKxJqNJFlDFoA+vsNoXDW2UA4HBnMLeYTffMffk/K/Gx125zBmv
 AaED3IlZjo7H4EO6MUOLqobd2R2XywwNK3YZ8gVQGvzPmPyYDEZQIYtlV77hfS1p
 EeI0NrOMdgkRQBP/LErNrVj92lOXeqMqkWSli2bk9tqumQVdp05vIv7gaArFSLak
 gDVPAWgQkcXiAwvT8KMyolEL+k65VnWy1adsFiICjjH1F/g22Wqq5YGGc1QQYCP3
 e5iVrxCladhobV1ESOuCTDb0FaUetDhrNrVLkb61uVhOVItZdrX3LDrWACSKEooA
 ==
X-ME-Sender: <xms:XBtxYTkIOP0EdS3lD1lUyUHly7UHI2qGUT-j-tUY40Iqhcdb5ZtQcg>
 <xme:XBtxYW3SwHLQ3N0jvrH5f3qki2Zsow_T3O8_iDO2QCguuBRMnGcwH5QZiSqQLJAt4
 566DMXrmffla_GXD_0>
X-ME-Received: <xmr:XBtxYZreA5NIRKdzo5I8DH0tVWmv-ADe95sC1LAzNsXc46C8VVP4-HObDjmw8iG7Z7wDRRE-bgeJd0L2ppnmRLuD25uF_ignpq9VZRXB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
 gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:XBtxYbmPfxnMqrQciqerpDXaGXdeYMojybVpynUBQg6qhUWmJqWOlw>
 <xmx:XBtxYR0sQJ9wyRaEyhaAgIBMF5fpn01tA8aCVblWJ4FiFaPEeNQtag>
 <xmx:XBtxYatyl8c1Q9jBOVYBBpj8GOrj4GbC8FKu2tLAVyuM-KmKFMSq-w>
 <xmx:XRtxYenRZ9A_lo0Xi9bsyZL00Gu12KgVdzIUawgZLkahtR22htpR4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:48:44 -0400 (EDT)
Date: Thu, 21 Oct 2021 09:48:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] of: Make of_graph_get_port_by_id take a const
 device_node
Message-ID: <20211021074843.yxbzoasfyxmzmukf@gilmour>
References: <20210929084234.1271915-1-maxime@cerno.tech>
 <20210929084234.1271915-2-maxime@cerno.tech>
 <YW6zxW3KdlpLQe/m@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6k3npby2vi45d2bk"
Content-Disposition: inline
In-Reply-To: <YW6zxW3KdlpLQe/m@pendragon.ideasonboard.com>
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


--6k3npby2vi45d2bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 03:02:13PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Wed, Sep 29, 2021 at 10:42:28AM +0200, Maxime Ripard wrote:
> > of_graph_get_port_by_id doesn't modify the device_node pointer it takes
> > as argument, so we can make it const.
>=20
> From a C point of view that's right, but conceptually speaking, is it
> right to return a non-const child port node of a const device_node ?

I mean, I guess not, but you're the one that asked for it:
https://lore.kernel.org/dri-devel/YBAiztjg0Jji9voK@pendragon.ideasonboard.c=
om/

I can change it if you want, but certainly not if the only comment I get
on this series for the next year is going to be over whether or not
arguments of functions unrelated to the main intent should be constified
or not.

Maxime

--6k3npby2vi45d2bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXEbWwAKCRDj7w1vZxhR
xYuIAQCsT1eiZE8sI/F1oIChdN6Tj7DUDYqTKCvhw45uE3T9cwEAzva2Wts3yJg3
K0Z5aOXN6iEBhfFm65/kEMkuZ+c8PA8=
=ZlBe
-----END PGP SIGNATURE-----

--6k3npby2vi45d2bk--
