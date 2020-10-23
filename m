Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77F297D94
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED7E6E8EE;
	Sat, 24 Oct 2020 17:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBEB6F89C;
 Fri, 23 Oct 2020 15:11:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BD495C00FE;
 Fri, 23 Oct 2020 11:11:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 23 Oct 2020 11:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=UuizT5hmHGc9y3CmbevnCnbCm+p
 bIJkyjBGPhVMj9r4=; b=Z7DUDhGIcwM6uCVAmv3av076cR9Kq8/tTbLaCyiCiE7
 r9GWSXdHOxffwbCs83QQvOy0gTNjobG0vdZ3n4il4668QLkIS6nBeDlMfFanp/m8
 Y7FYkdz5wR7XjCWG5h50hHD8lqvGF5Zf3/N2Xp4nXxoHcIs7gzxXXNj1qtYymDQc
 eUiET5ECwglw8+FP0k5sATgvJm4jlbEvEBYpaNJUrr8lLe72y36bsSgblv2nl8RJ
 TknvRlaZZ6oys5iJDnHWTePTdQVhiYl2Yq2TzDMR7E16nN5FbtxbtuFQVwy80JDr
 3skcR0RXGq4zFdMGONbC8ZWw6dqrjDbbpjkP10bgmEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UuizT5
 hmHGc9y3CmbevnCnbCm+pbIJkyjBGPhVMj9r4=; b=eHfbSHx7M+Z22uYiqjlBW/
 keAQ+BjhUV3k45Wixin/kYqyNkpoZfm/XIM4MWCaAono+hlbC8MDRmqKOE+ffunx
 vQz0psKHqKvhJ8gGxJU3YlUWesivGpV7PomtFo1R4ZQldcs2gMYXjKdhMa1s4yBI
 pLhK4pwv+VKz75gkjSFQzKBZwbZkYu/B+awg3oaWJyK9vvOW2KKj7EW69JNx2pq6
 nlDcoh47uiXn5v1lL8yrj8bDQqLC8EcOt+eEhI8WEJlO8WbRaILEsTNzAE43/+pG
 8CtE+ZFjqEyfD26AzbG7/v/Nz6pmM+U26+hzyzKdZGCU1X6pUvdsOGQixcEMb1Yg
 ==
X-ME-Sender: <xms:sPKSX4on-pqPgyBNYlNxHtPjJue0piichoqE5dBv5wS-ljWVvTXt_g>
 <xme:sPKSX-rtNiNts_WKZZvCMNmqUilO2A9U0BvIZT4tADDA5wmq9MmwW3C_SQGbYwX1R
 NBgEgWslryOh4oBiLU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkedtgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sPKSX9PgO48fEpLztoTCD0zpCFiA8f9WutSmT3HDI7UCZq7voMJ-MA>
 <xmx:sPKSX_6340mM6SChy8HrNsYGYfIlCKkYbxdd_Pqa-yPRUyjVqZK7TQ>
 <xmx:sPKSX35Prys5IFrEj5UuWosYb9WlQeSprb2UDCWaPdM6L0vo3d9ZhA>
 <xmx:sfKSX9QIPPO6WFHvm3LcBOKf_PKdX61o0WbOq9D0NnwIryKtzVeB3Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 163FE3064674;
 Fri, 23 Oct 2020 11:11:44 -0400 (EDT)
Date: Fri, 23 Oct 2020 17:11:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/5] drm: Allow const struct drm_driver
Message-ID: <20201023151142.o3z2s5m6gi7vd2mk@gilmour.lan>
References: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
 <20201023122811.2374118-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20201023122811.2374118-4-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1432303043=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1432303043==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ry7qhldkevciwzy7"
Content-Disposition: inline


--ry7qhldkevciwzy7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 02:28:10PM +0200, Daniel Vetter wrote:
> It's nice if a big function/ioctl table like this is const. Only
> downside here is that we need a few more #ifdef to paper over the
> differences when CONFIG_DRM_LEGACY is enabled. Maybe provides more
> motivation to sunset that horror show :-)
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ry7qhldkevciwzy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5LyrgAKCRDj7w1vZxhR
xckZAQC28JGpaatousW5UCVjLaRYwWMCiowegOcs5O4zEe0NbgEArcQHhKkOolXL
xekZsGOvdt6k5J5upf9UySL/7iZA1QU=
=/P8s
-----END PGP SIGNATURE-----

--ry7qhldkevciwzy7--

--===============1432303043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1432303043==--
