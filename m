Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C573E37A96F
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9BC6E42F;
	Tue, 11 May 2021 14:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C1A6E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:34:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B36355C013B;
 Tue, 11 May 2021 10:34:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 11 May 2021 10:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=SfWYrlX87zneHuxlI+ouZd6ezpb
 r0EbxctzD5s6cNbQ=; b=vQBzjQQEExjaHLfnRfJNyYJ1tIJQMMPvUiNN+tsdBhB
 O9a/iOTpXXzLagYs9GtLR8eTFtgwlvvHySiR/2xqwe7gje765iCeu4qy025TWUV+
 MowhvLhOokjzspOVF0/T2zYjc8IUKqtXju7X7w5Y4FO0aP5X0fI86gMt3EbGJaNn
 STu4hAEdFh8jVHpn1+FS6Xdz08Wt5q6yftCLuGYY9GBaP13Ck79+PQ6iGRBC6unJ
 zvpZ8yIFxP23F/dkqO/vcTnPkdbVCY5vF7sZvgfVOVHtZ28Zv3xUUax5GNOdGAsI
 RtA1jbe+Cuwu9Ou2Vg0pT+2lkRUY2EFfts4tnEA2uVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SfWYrl
 X87zneHuxlI+ouZd6ezpbr0EbxctzD5s6cNbQ=; b=QbIIfKJX1FXF6J2XR9rlbT
 2Eh/PvdvYoV7biRr/cH5vHKVyFjYDq3RXDpNMoK3mN1WkYzcpcqLp4BXH6EzCRiK
 IyNII4SrlJgKenWjZgWBQmBhn8Buy6ba/DM5oDjwyrg6jGcegur1JYF2FvYTZhfF
 tyPsETye732uchbHa/bnhC4R2+wQ86jXQwpmTSV5pO2wN88AQzmgI3+toKHtAFB+
 c1squje7EX1kwIABcxp73OCpljsvVe812n0af1XrItWo1YOhVSf1JcxymW0wNqs6
 J6INpnGdzGxJipZ71fSwgPUNASMgcXEQRYkH9jzVt8WQXMtRMnSX79hoz7p/5MpA
 ==
X-ME-Sender: <xms:AJaaYFoNeIi6Ml_p9RaYDVzr4bkuSo7X1MPjRMLUoT5SSBuu-QJmzA>
 <xme:AJaaYHqnCpp3TWkFvHu1iX226tUrw_gygEeql6emIluiMS9GVdX8CUJ-0jqQdOMFb
 AoH20UZGBN0Yduixjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AJaaYCND2VD2kYH7fxB2IQfpBjVHxTDiNuzMGNepTb2uCSQL20YPlA>
 <xmx:AJaaYA50-iHyXIFgpM2AaqvhalNQUbChmyvFd8cihQAvcpIr_cuLOQ>
 <xmx:AJaaYE7CE9n94XdScECXVJds2yuIJGfcGdVChJ-z1Tp01KQ54kqQqw>
 <xmx:AZaaYEGLS4UUCROfTlF4rolHaN7xJOiGC7rgWXwSKu6T9qkWzeKuRw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 10:34:40 -0400 (EDT)
Date: Tue, 11 May 2021 16:34:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] drm/vc4: Remove redundant error printing in
 vc4_ioremap_regs()
Message-ID: <20210511143437.32fwbhd3zxiprte4@gilmour>
References: <20210511092923.4617-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gpoay72wqbacv5c6"
Content-Disposition: inline
In-Reply-To: <20210511092923.4617-1-thunder.leizhen@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gpoay72wqbacv5c6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 05:29:23PM +0800, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>=20
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Merged, thanks

Maxime

--gpoay72wqbacv5c6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYJqV/QAKCRDj7w1vZxhR
xW12AQC/RZ4ognm8S1m/WXesLxOLJdgEquQT4PhtsSVzdp7jNQEAoa+GoGf7DYlq
PQ9cEX5rEzvg3tzn4T3USGbn6u2d4wk=
=pbEx
-----END PGP SIGNATURE-----

--gpoay72wqbacv5c6--
