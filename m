Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFA2FFE74
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3A36E02E;
	Fri, 22 Jan 2021 08:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D406E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 11:11:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AD3B5C00A1;
 Thu, 21 Jan 2021 06:11:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 21 Jan 2021 06:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=LPJqqS/caxcStsD9RkS+Vof1Crj
 gUDiCxmC1DhtIhZc=; b=siwr5C8iEwooh7A3MFf+jMp0w85maT+28yyP/wfQS6g
 K2C/Wpxrjihu0LVvx93M2M6z+8LrEKegAt2GSEFTiDqC5YlRO19vQfE+Sn4cvsT9
 uzg6xblKHM6+IVvWuFZWb/IIVfYVoY2nvko26G9+aBSxeR4WOE9aERr3mmsuokTj
 WSsCAu+VIwOZHnq9H5pxiw33TfMOgTKyQZ3OZUYq2wbTMAeNdenofuHo55RXqNcL
 KrXsZJTdBcB7ISHML2Q29SB9DX1Q9tQmPYcimknBqAPh6z+Vav+lnx09eMCQfnnR
 rL0WTyW/IvG+sSMtTbtEdDh1Rnu9GeyS9zTabJoFguw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LPJqqS
 /caxcStsD9RkS+Vof1CrjgUDiCxmC1DhtIhZc=; b=maOKHwrGRxZWWBatDzm9yU
 8qFuHbQJ7OCIKxrE8tPmd5+eZbYcTBNbR5dhTQrvzkr/3NUsLUpgrxkZdDocCeP4
 uooGJne2jCpRCeJ7sIsv9hIwGo5P+bsQljHSzGPEfMzrMTyQSWD0RkXWF1YzpyiE
 0ausTs8Cbe0R6Wx+OJI62Ud5f9GH+5NVi3hohXbpsNA4dnexxWICQxq/EJFTwLKT
 Nmpr4H0bZ+rB7DUfJvp67Np0rHxB5L14xLq5/Vdr/B0IE8z/OA5iosFEv458Ky07
 JWCRL4dfj1NMeCF/OZcZdGMwBUg2moS7wkTtP9RikddEwLWWWcRZBthgDhEYhspQ
 ==
X-ME-Sender: <xms:VmEJYHjMdBx9G1u4G65dWEbWnFylmkh_Zml66ZJ6gyi9AtHfUdGGzQ>
 <xme:VmEJYLfW4E3DUxVooNy8AlzpGDpVRoO2QUtgTZSEPU0M-Aejn_7hNhGCWNnNisyql
 jd-PLi9B7TMz0QqLcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VmEJYEfe1QBAYOu5jWaj160hpCc0r0rRs75jStcpNS2xXMloeDLOGw>
 <xmx:VmEJYN_xAeXraJsY6MytfSeC5qJ3xxDT8K_HFqi7-wIbgYf060Z4gQ>
 <xmx:VmEJYInRFwdKnzK4zW5gL2cth-9nyjGNoFGxLe1s9z8em3YQ-bfh_A>
 <xmx:V2EJYEWcLygoB_yQfbfPCmKlXo1Vk3pGM1FFZd8fEqLqP63n9M4bJQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E18571080057;
 Thu, 21 Jan 2021 06:11:17 -0500 (EST)
Date: Thu, 21 Jan 2021 12:11:16 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm: Introduce a drm_crtc_commit_wait helper
Message-ID: <20210121111116.4krmqci6amuksyat@gilmour>
References: <20210111084401.117152-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20210111084401.117152-1-maxime@cerno.tech>
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0074061294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0074061294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ljfgl224f6kqstgd"
Content-Disposition: inline


--ljfgl224f6kqstgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 09:44:01AM +0100, Maxime Ripard wrote:
> There's currently four users of the same logic to wait for a commit to
> be flipped: three for the CRTCs, connectors and planes in
> drm_atomic_helper_wait_for_dependencies, and one in vc4.
>=20
> Let's consolidate this a bit to avoid any code duplication.
>=20
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied,

Maxime

--ljfgl224f6kqstgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAlhVAAKCRDj7w1vZxhR
xYdkAQCnKlrFp2sctnHKSh9+8WcZjCXJ6fv3J7JnJTPzi6XDYwD9E11ly/xCI8zj
6ZaM+yJftRtmlScZ2kcKSgHDrQEd+QY=
=B2Vv
-----END PGP SIGNATURE-----

--ljfgl224f6kqstgd--

--===============0074061294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0074061294==--
