Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544C1C0EA0
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB7B6EA7B;
	Fri,  1 May 2020 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ECF6E221
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 15:06:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AEF9C3D7;
 Thu, 30 Apr 2020 11:06:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Apr 2020 11:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=3HOldL8M8SMhSFP04OdXihjEBtT
 HltI1ljKcZAb+nkU=; b=c9Jlcl1rGAZQZsRZokJHWuF0zB9rfxpkoH4HQ0LusyR
 4nzRuVu05bhdqG6EeL0AK4+0TJFJr/EeRET0GCJ77nt+u1LPbsJWaTu5FzgvhI46
 E2rCO2tfd2R7S8/kKw4YWvEhX42I+hzTTv397UEOwilQmjqqOyRWELvAbV0x8CLy
 mSIEHlu9c5rCKsZng3/oUZsomDllS4UlRujAQtmZdb8UPqPyGw/042FzVNphKdya
 5/90seI+WvLVSrr8fAKaFh2yyYCvY2Svq0LIZQaElMZcL7l4bgvx9ynqiOgwEP4w
 G2rHw+hLBDwurMLmtmHOVOB2QChDH88nKBGS7nelrBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3HOldL
 8M8SMhSFP04OdXihjEBtTHltI1ljKcZAb+nkU=; b=rZ2vf5bZBWVwnMklpPl8Bd
 vO4YGW/TMVENltc1XyknpsxocwyldTOFsWluFkN561NHL9YUCn70oZY/alr6SrtN
 pFdiKHWfGtUxViftRrtmq1cYItYknbwWxhZSJFdi7eQFua0SoiXrqqojOGdGZC8t
 M1n5892MNX0XyVW8kSMh3R377sPxR5AKTw4w8rtkKcVQTdRpM+TSLJwPr6+nL8W3
 PXqmOuZCM7L8fJE23iupC5S9ABIxjvf7dTWts4ysvfeDgmzwYjB44iL+utgFkvwa
 lQYFim8If+13p8gU8JFuktA725TBysPhZkLeBgtdaKuOapyYs2TrP4+d55kbKKFQ
 ==
X-ME-Sender: <xms:jemqXkhoKUgqmlZFMxeK0cDa90kpmrp0xhAsS7J2naiy7HyM4OgTTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieehgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jemqXkpnDXrjC4V69PI-XyVp3mJnYjhF-ntNPpfbLCqrGOu7a4mCKw>
 <xmx:jemqXjeFFLdSCxpHmpzKYVvqadSK37vzz52J1EUYSByc8KglZIAsow>
 <xmx:jemqXvwPR3RTFuBwdbZCpRNQfFY508PK6h6eWtbbnsUtt_lUSdCq0Q>
 <xmx:jumqXgB-mzVQpjHwawS_NrFP-SQU-PYGNf_1_-qDDRQoXNpWTFuyrBItnEo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A3D23280069;
 Thu, 30 Apr 2020 11:06:53 -0400 (EDT)
Date: Thu, 30 Apr 2020 17:06:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Emmanuel Vadot <manu@freebsd.org>
Subject: Re: [RESEND 1/2] drm/client: Dual licence the header in GPL-2 and MIT
Message-ID: <20200430150652.7rhh7zn2lqhzy4bs@gilmour.lan>
References: <20200430145439.31257-1-manu@FreeBSD.org>
MIME-Version: 1.0
In-Reply-To: <20200430145439.31257-1-manu@FreeBSD.org>
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tglx@linutronix.de
Content-Type: multipart/mixed; boundary="===============1266347960=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1266347960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjombykybepmtpey"
Content-Disposition: inline


--tjombykybepmtpey
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 04:54:38PM +0200, Emmanuel Vadot wrote:
> Source file was dual licenced but the header was omitted, fix that.
> Contributors for this file are:
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Matt Roper <matthew.d.roper@intel.com>
> Maxime Ripard <mripard@kernel.org>
> Noralf Tr=F8nnes <noralf@tronnes.org>
> Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Acked-by: Matt Roper <matthew.d.roper@intel.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--tjombykybepmtpey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqrpjAAKCRDj7w1vZxhR
xXGwAP9Ki8H1vsg5ATj+ZH/wRTiLKXRb3PQC/kGD5BF/AvIVIgD/XC7nOwVt3iuT
6ZFDx1vpZM6X92tW1fMSxk5/v/OIQQU=
=yUcS
-----END PGP SIGNATURE-----

--tjombykybepmtpey--

--===============1266347960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1266347960==--
