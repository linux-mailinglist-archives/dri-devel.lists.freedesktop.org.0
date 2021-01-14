Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143362F74B3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15A6E2DF;
	Fri, 15 Jan 2021 08:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1939B6E185
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:47:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6137514E6;
 Thu, 14 Jan 2021 04:47:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 14 Jan 2021 04:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=YeoC/XPMJSGadPpNUxvwKIrv3ZE
 qZF5+iat+jggahE4=; b=bTeuEf98XkwnF7DP7YlW/XAeJvTPGrlAkA1i7/L95Tj
 bNy1snOw/cJhc/07pJ2zSN5tsZw6EbTZ5/JVelckUkjvodFpVnER8nhlxm4DSbNe
 ZZoGyteSTeIW7J+/+TGAeZ3S1tV3MeRTm7se/WfExENzn+XGk5z+iPoEC07NIXZ2
 RPpbs/mHevVlBKoCdgod4TjQUzukGngjg2WY9d1Xy+RbXctkTUWcglD4umjA4O4Y
 LXbqLBdbrKE0owZ+3DL8DA/OF7XwuSQ4AXtjyfeTsNcHp+kxVuRvEWZkoOnBKrH0
 OU5GFrr4V6JemjtbokHjkYgxK2Xm5b9n12IDXsSrkGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YeoC/X
 PMJSGadPpNUxvwKIrv3ZEqZF5+iat+jggahE4=; b=Gnj5PKP6YSGx7mE4pQiYFh
 4+RvnhariRHd4gVMBGj/ibq/X/xGs/mNGtCf7IHqZAVZXqWC34SoxJSFQWEgPkLo
 GY7gN9+yA7oDjkOYgJia8nmZD2sYMFNFp3KbjKIERjsQisKFxu8TYlUsJ1h+VarW
 +FGKYuuYPoq2UAfjG/PZtj+msPZidBHY0/jXP4XNpcbX7Si4MiUtehU3XzZuNFKz
 6mniLrkseXtHbY9AW/BrsF47uQxUZLP0OdvLMmO/FOcqGn8YZvtGqmcY7aVoEXY7
 +qOG1bzgfQXGJAT3/rRnJN/mm+tIKQm4ck+EUloCbBJLaPt5qFjeMtdh9GmKb0Gg
 ==
X-ME-Sender: <xms:HBMAYBR97g_pu93KCbujpbLikaDE1BC9zo3q_ceVYM1lzHY8gBiXnw>
 <xme:HBMAYKxVUfuO2B_rtXLFxP5oIofsGUFizegoimN5WWutFDxaFRaS69ZHkykzdSMat
 1NyWGkoAn1jBfZ9ysk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdehgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HBMAYG1aii7fMAxllZKjZT31Q_IzD1ohEWZcKgbip60gopNuGBGkMA>
 <xmx:HBMAYJDahUVvoA5MDSF9uTv4fxVYFLWM6F-GIdNbA7edoXuwOyq7bg>
 <xmx:HBMAYKgzX3UrVB7P3PFVyzmLBFocLUlRIfSttunKR4BwEsI5cpNjDw>
 <xmx:HBMAYNsNbs7zNaa0wFYqb5jQCCh0ETwHB2fVGYXEL9dosaGUwzeXiw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5E6B1080068;
 Thu, 14 Jan 2021 04:47:06 -0500 (EST)
Date: Thu, 14 Jan 2021 10:46:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vc4: Initialize vc4_drm_driver with CMA helper
 defaults
Message-ID: <20210114094659.3qwtgjpnzk7j3yyq@gilmour>
References: <20210114084949.29014-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210114084949.29014-1-tzimmermann@suse.de>
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1409874021=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1409874021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tblpmw3pqdrlafk4"
Content-Disposition: inline


--tblpmw3pqdrlafk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 09:49:49AM +0100, Thomas Zimmermann wrote:
> The function vc4_prime_import_sg_table() is an otherwise empty wrapper
> around CMA's drm_gem_cma_prime_import_sg_table(). Removing it in favor
> of the latter allows to initialize vc4_drm_driver with CMA's initializer
> macro.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--tblpmw3pqdrlafk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAATEwAKCRDj7w1vZxhR
xURdAQDrfm9YEnIU3ug6QZyvhluuR8e5jrrphUN0JAnSeQPHQgEAummZl2MbBs8X
+xG0QQvMettBYRTk9FLJBttyp+9j4g8=
=FxpY
-----END PGP SIGNATURE-----

--tblpmw3pqdrlafk4--

--===============1409874021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1409874021==--
