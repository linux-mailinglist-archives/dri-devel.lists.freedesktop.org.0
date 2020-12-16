Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1132DCDC6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363A6E1BA;
	Thu, 17 Dec 2020 08:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8596E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 09:12:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D26C5C015A;
 Wed, 16 Dec 2020 04:12:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 16 Dec 2020 04:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=7r9Lq/ADb3QePRITOn+SE/321LH
 Cwlmtqs09ZfdMX2A=; b=sQ0zmqJVo76nljqeRTWcYERbnxynGFdykKiN6dryG/X
 pyMQ7VSVSF6ieM9i92JmEywDAvizPTwJ/2AuzT+qepacYuutvwwo4TCQo4HB8ErL
 oOsRKgsWAh/ygMWteQtP0SbZobw3KW8RG14EWQ1o+oTifVboLpuU5pWh6fLOJzOp
 sGtmfoIKy1u59jheQLfZgAHPkZ4N/OUI8fxJmAAf36CAFePh4uytCD18pNliD2Pt
 tMKjMczw0Sc6gwBwFKA3XfRZz1ZSoVNfktT35VLF2x49P4B23W45zbO/fuwp55YB
 RfDDbgcx2y27e530xrcsTWz60ZU0sQ3nOGwMzq+s36Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7r9Lq/
 ADb3QePRITOn+SE/321LHCwlmtqs09ZfdMX2A=; b=d1/H9ZUGwgNO1Ercfbht74
 rvBldosUWJNbXvSJqtAz7iz/wWSqaI3PIqnInPdEmYBvcqopBOFzmKIDUxxYvFGu
 xXwsiepb6DFO7nU66XzGhTOGobBzDEnVGmacGdqn8OY9+ThNvJCPbm2dTT4gJVBq
 RfLByUS51p+8QpgTn7RWlOexgZSsDK5fAjPGKxIHNezcbGuf3oX+AebEouu2owuy
 7zeAUQXo7bu00qqC45pQYRHuBVSRBK8FA/Z+13gN2oixt4aQPG4QBOFEZ8+Hio5J
 9tYwAl8CXeAfOSgK3QxQl5tgaz6zrSi7y6q3ExD2ZG62Udf4ZtvEbXAwPJwcS9EQ
 ==
X-ME-Sender: <xms:g8_ZXyKnv0uriBVzJKu9kCv5gEnDv5yLcmE6YyTO1LF6H3M6M566pw>
 <xme:g8_ZX6LREEgG4-TYrXIF3r2-itChkeHonL09KTX9Nk7Z4tIE2IjNZleSbK6W10-k2
 FNxH0rauZZgX4SwQpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelvddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:g8_ZXysmOYABQmWMQybdyxSFqvKYF2AtcZWXiRFxqtOhfu9hn9IYcw>
 <xmx:g8_ZX3ZOJ68_voeGLnf_h6P-DC40R67hFB6oqrcJ225kUAvwWi2y7Q>
 <xmx:g8_ZX5YwRslDwZZQZ8729Axk1OvAXzSiIREZnT88WKulfCp6vXxbVg>
 <xmx:hc_ZX14Iuh0tSNJVNkBLAH-zO7a23LQ-pJf6UJv1JX3KY_i_pqCQNA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7E3F240066;
 Wed, 16 Dec 2020 04:12:34 -0500 (EST)
Date: Wed, 16 Dec 2020 10:12:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v7 0/9] drm/vc4: hdmi: Support the 10/12 bit output
Message-ID: <20201216091233.4avewudme25svstf@gilmour>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1051908092=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1051908092==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="74q3u7y3lzhsw2ct"
Content-Disposition: inline


--74q3u7y3lzhsw2ct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 04:42:34PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> Here's some patches to enable the HDR output in the RPi4/BCM2711 HDMI
> controller.
>=20
> Let me know what you think,
> Maxime

Applied to drm-misc-next
Maxime

--74q3u7y3lzhsw2ct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9nPgAAKCRDj7w1vZxhR
xeBTAP9eRC80qTctTZhpj8q/FxCLR+D1hFLK72luWJ8vQQgLigEA8M6hnOTCzCjG
xw+3fxxLNaceVQCpeTHXJ4kyGVSq0g4=
=nYpV
-----END PGP SIGNATURE-----

--74q3u7y3lzhsw2ct--

--===============1051908092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1051908092==--
