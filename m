Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AA3BC7A4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E86189BAC;
	Tue,  6 Jul 2021 08:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805B689BAC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:09:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 29F155C0166;
 Tue,  6 Jul 2021 04:09:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 06 Jul 2021 04:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0eF3aO0rWXJxqOIRQ7c6N70jgEl
 9mZdTDN3IAaEzJ3I=; b=KA1EFVptEbXLuH50/scJXDMVVF1bt9j5h+C/5fBB7HN
 AkfqbpDMUxeBmqAYF0s/VpMg9lLTnP/5rp4kyy2lj41EztqABwCFnP+pjsqtYiFX
 X1hTfM3wPvcd06SyliAeVyc1V2atgu3cAZ69bppJ/zTg1F9TM+YMVYyIuXTdeLMg
 B5Ej3+OYDqsS729NMKOWkTHJkPdDULMWTkuiaufD9aH32p/C3dBmKxWZtyTwkNZx
 8WFefJ6bugQ/wEgTeZLKRrLNy8Jqfs7hcu0H4IZ4o85l4SvmNfUxlZ84332V0Fhs
 aFUh1BtNtpekyL4Izhk+SFzcL3QwNTWJ6rI53WHcseQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0eF3aO
 0rWXJxqOIRQ7c6N70jgEl9mZdTDN3IAaEzJ3I=; b=KVlXh/OcGdWqa72GjGXfqa
 1Fpm9/e9pPOZAIHF8PR4T4nU3IpwrP7bHRX8ZPKEYL8gVKRDVVOPjKmRtQ6BMgvc
 rL35h4K8J3g59Xo2GYzRyxw8FbjYZYwFmhNhVbj5GmkqBifxIm1SZrpcOI2ddqFP
 bGgkJsAlXX4J/ao9aTn52E8bpOPsd3yz4zk/j/Nh4fXCNcBQF7gYd2Fflfa6IKF4
 sgW3Q79q9qZxleglAr6cCARTkrGR/Ub5uKaFTOgR5y139J7rESlNFwjeTh+AB3Tm
 SWfFRGVWDP/7NGBRFnqAy5FhyM1L3gmdfRsblMwtazc+6uAG8c3yT/tIjFxRgmcw
 ==
X-ME-Sender: <xms:rw_kYPEyeTUNyeL0y3b3PHQt9XGgUJX5uo4GlIPKFb7pxCUeMUksJw>
 <xme:rw_kYMVSgeSFrEC4w2JCy3Qg2XNjRFtMbGWJtk5wwq8f88vFyblFWP7yCINT40Sat
 8cUa4OLw7DgKLSUCKg>
X-ME-Received: <xmr:rw_kYBKUaZZ-id7KMmosLXbqL6BKFiUtFSwT9VH9X2-hFsOJDj1UU32KMLfIobFsDhk7xN8xLWYYRO2rMAlvowijiPVsUN1k9uKJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejhedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rw_kYNGjd0eYt9DKyRbCPq4-Ik5MdzDypqljitPJCwhGO89yjm3h8w>
 <xmx:rw_kYFVKDmr_f_1nC32pV5OPjU4DXlbTSkWZddzOc_ZRSYjYrZe_0g>
 <xmx:rw_kYIOgILzC5CDVbS4lcqx23BdNnUkuRBOycCtaEjPVnraIZFLbaw>
 <xmx:sQ_kYBqlzRPpae82KTawqBCMeazv1-g-14xE-dqPhbwCVSn5BKRVgw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 04:09:18 -0400 (EDT)
Date: Tue, 6 Jul 2021 10:09:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/hisilicon/hibmc: Convert to Linux IRQ interfaces
Message-ID: <20210706080917.t4g5yxxflgbqnd3d@gilmour>
References: <20210706075425.9257-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xql2w4uhie57d2rg"
Content-Disposition: inline
In-Reply-To: <20210706075425.9257-1-tzimmermann@suse.de>
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
Cc: xinliang.liu@linaro.org, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 kong.kongxinwei@hisilicon.com, tiantao6@hisilicon.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xql2w4uhie57d2rg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 09:54:25AM +0200, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--xql2w4uhie57d2rg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOQPrQAKCRDj7w1vZxhR
xTx7AQCwS64N6yBwKFF7TMKlvLQlmuNowxjNrPmXQNfdqfYu4wEAgU+KF/b4cp87
PGiNvNSO9mLx0F0o6/5vdPlA04GtFQE=
=OKpw
-----END PGP SIGNATURE-----

--xql2w4uhie57d2rg--
