Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB9506CB0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7171110E2A2;
	Tue, 19 Apr 2022 12:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF5A10E2A2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:44:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 621125C01E6;
 Tue, 19 Apr 2022 08:44:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 08:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650372249; x=1650458649; bh=Qq/UOm8yAY
 qIo9R+oNyskcDN1bISCRnifsESqPXRXqM=; b=p201mqdZqtHqRbdRbaJon0PCjT
 k613N+9JcNU/LhVygOZYbe9uIAU/pWoy+Df0P0Dvo/ji4gOdH9yV0GmAzgG5lbFF
 PIPPFNZlQWr8wUFZpE8IlxVnT8ki7pLitSaewxBY2h4mzccKEI/GjzViXSd8A87w
 jK/HB63MA75DZvaNZRxdsqGq//p7PFYZEXBSg9L/9rwdmA+wiNLjw4I5PbJkPzUz
 QpDEcBIxcsiqVMjotwfaw66uzbZe0uVgxrFzoe07beC8cbffvysix9S9wj6Q7EB5
 zu7fSd2qc//onBm+0DCz9y7M4PvY8U7edMoYnadT8Dxd4sywx8uaFnrnol/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650372249; x=
 1650458649; bh=Qq/UOm8yAYqIo9R+oNyskcDN1bISCRnifsESqPXRXqM=; b=n
 MnCkWXihgtITSTFysFLOA/Ux9ur3YAH8S8JC1BPrZv0Y4vzRIwEZkPMpTbPj60mD
 vHtHOuX4Rc36Ht8UlqEmE1COTknqJosV2B2b4CFzgaFgXpIHimqVpq1UDIiRWvqr
 YLW1nSBH0k3E7EwBVk7Tm6NuM6fDVDwBHbXlpLwxVZUbjeivsp2bMaoRqMSN+H3I
 mTy8T2NTbITbynyj5pmzl4NidsO0Se19dDjo6nooyg1E2awWuZBVgyx/nFtugkHP
 pJrXsiCSpqGuZaJYsKvVWpP8VAy1DznsZQs7jmFbt23Pl0ZzDkUL82P2Dl/CXhti
 1Mn7avsNW8gL+SHHeRxaQ==
X-ME-Sender: <xms:ma5eYuBZy-kbm24E2L5IYoMA4bzvzR0D_CJ1GEa8AcNUjz7chOMSOQ>
 <xme:ma5eYoigyqC1RLcSnfvfcXi9ieSDhgkxd7EpLQ5o0Pe4FXmW-DdiEc8964y_5Za1j
 AP2v1qcMMWLEU3GNIw>
X-ME-Received: <xmr:ma5eYhniQGdlSDqdeXmlHv84otLLEISPeeZXA23eW1QbXvfYEtO8_Sud473U8WblnibJ70yvW-ya1jBIlRkjnq70ij7l70lm7bhdKrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ma5eYswmsqMerwBfeqoxyNzAoX-GE28LukokYsP8VAwR-Qh59YgTLg>
 <xmx:ma5eYjSRCapQpog9ZJhJhUh5q48xI1JaRJL17AdNi-C8lPArJCfegQ>
 <xmx:ma5eYnYnXnOVYcAhios0YM2lhCnGzqerDHmReWdh1n_RTL-MSfHheA>
 <xmx:ma5eYkKe1iqeSbGxt4zlNZx2b0jt3K3TJTsDwL5K-D7h8uXRiaEAWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:44:08 -0400 (EDT)
Date: Tue, 19 Apr 2022 14:44:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] drm/vc4: Fix pm_runtime_get_sync() error checking
Message-ID: <20220419124407.ugzl7hknsytbhrmr@houat>
References: <20220412070458.21819-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uztsba55upz7amoc"
Content-Disposition: inline
In-Reply-To: <20220412070458.21819-1-linmq006@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uztsba55upz7amoc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 12, 2022 at 07:04:57AM +0000, Miaoqian Lin wrote:
> If the device is already in a runtime PM enabled state
> pm_runtime_get_sync() will return 1, so a test for negative
> value should be used to check for errors.
>=20
> Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 752f921735c6..26aa7d1fa421 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -847,7 +847,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder=
 *encoder)
>  	int ret;
> =20
>  	ret =3D pm_runtime_get_sync(dev);
> -	if (ret) {
> +	if (ret < 0) {
>  		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->variant->port=
);
>  		return;
>  	}

We also don't put back our reference after an error. I think a better
fix would be to switch to pm_runtime_resume_and_get.

Maxime

--uztsba55upz7amoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYl6ulwAKCRDj7w1vZxhR
xWMdAP0VKWdkPdp6eRfSc4/lPac9MGFErgPN7HCtHcYKnTtV6AEA7oCtUCIDSMHJ
mfz5mdgSRKw8zc3op1i2em3Vr8h6kgQ=
=Lm9X
-----END PGP SIGNATURE-----

--uztsba55upz7amoc--
