Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381782DBD1E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962F06E0A1;
	Wed, 16 Dec 2020 08:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4B589DC1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 07:20:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 39FF85C0132;
 Wed, 16 Dec 2020 02:20:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 16 Dec 2020 02:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dbdNQcp/KtCww/16+g6yyPKM+/G
 Rl1bIAzULvU4sRNM=; b=P8SwBiddNeYIgAkfe5XQ42+ntpJCz5hiJI8nMcxt6UH
 9Qh4ny0AioqryzUHKPYjruuZhGbTyFeuoUrJNbfNCQxz2zbjRALUEf/U4YdDAXW+
 eZcfrXb5Kd+b8NdOF3OXjT04I0stMMA7mE8zpslw4zqd4MaCzrPH+HpO20dDLzFg
 cFSELxly6GhLHIOhBp3dkOzE8Y9VutrAJITX9p9R4sP8sJqJ0q65Syhfn6E4CTAr
 Wxzx+Is4Lh1mDpi4ldrUrXnKgaUvDXprFknw7qoEAlitIRabm9rY1uftzezB1t3K
 vQZ5UOh5uKzI/bo8qFFQj3An1i5arp95vRbSs0Fq2iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dbdNQc
 p/KtCww/16+g6yyPKM+/GRl1bIAzULvU4sRNM=; b=INBsiCCa2itijrpVvRCmjQ
 ItNle+YaKXljLAFjAR+T6jtDUOJWfh1jq0Jv3Z6zbDQ+D02Tq1MQnzhPPczzyD3w
 a20yVHeucB1mKcOh3Vo9awW8PsA9cstRT+vv5ds2mZUzmXgEdgOAvjjWHjDXzO+e
 lAJ1lytxc1roWwSCTDicv7A8nedLN0UeETt3AsZOryHxevZTSLeIjglXTbNDFyZ4
 PQTRbrUL7ISFOOFM0Zoe12hZpLLjPn1rw9Qgm4nNjO1b3fxRIcEUKEWGlI0zjPdo
 s1Nr14hg2YQZDAUleQhsSs8zM04wBg6kAcWx/mtAOG305KNYUHZgEKmYIxVK1UEg
 ==
X-ME-Sender: <xms:T7XZX6riZBMTergSJgQyKqqI_CKXQwkadJzfLA2oAukNR48FyRD_sA>
 <xme:T7XZX4paR46vIS39MO1-vbpvsaOZHEBgDbToBazTgi1_KVnyFRXOIuBcJjVgJb2kX
 0F58Wy4viu9JVWsCbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeluddguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T7XZX_PgUcoHvMN43l1I8dR0fiumECX9ZZY7aI9mzzVNYGKPK0CR9w>
 <xmx:T7XZX56F3hOLa9amGEpYVpSmoHDpTMlZz6L9OL4DAuQ_APRhO3E6YQ>
 <xmx:T7XZX56cts9NZEXNNEWiSftWgA3t_Yj39F7_RDCSITYdAlkSE7ByoA>
 <xmx:ULXZX2gJsYeqyDIgGYchpX5w4RcO9E5a14gKWTd6lQFe8CjkVfzl-A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 485AE1080059;
 Wed, 16 Dec 2020 02:20:47 -0500 (EST)
Date: Wed, 16 Dec 2020 08:20:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] drm: vc4: Remove unnecessary drm_plane_cleanup()
 wrapper
Message-ID: <20201216072045.idgt264fv3xugbcp@gilmour>
References: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201215193755.26160-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20201215193755.26160-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0390065742=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0390065742==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bstgyhsaav3po4im"
Content-Disposition: inline


--bstgyhsaav3po4im
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 09:37:54PM +0200, Laurent Pinchart wrote:
> Use the drm_plane_cleanup() function directly as the drm_plane_funcs
> .destroy() handler without creating an unnecessary wrapper around it.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--bstgyhsaav3po4im
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9m1TQAKCRDj7w1vZxhR
xcHXAQD/WJXLGD8UX6krinIzrAV2N3kQfHOKecRdfSvuQmDJ3gEAkagWZ9hB3H4u
3wvHf0PcqAD6P/ZaIN8zrTAYC0B2CAs=
=kB+y
-----END PGP SIGNATURE-----

--bstgyhsaav3po4im--

--===============0390065742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0390065742==--
