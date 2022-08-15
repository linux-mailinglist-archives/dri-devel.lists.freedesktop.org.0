Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E4592AFD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 10:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B1AE996;
	Mon, 15 Aug 2022 08:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8D092A75
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 08:30:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1B9C65805B4;
 Mon, 15 Aug 2022 04:30:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 15 Aug 2022 04:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660552208; x=1660559408; bh=RA5kw03+WB
 AXnGH4vH/n/ZMFMILVebJisUqvkOeE43M=; b=DVbua1mRF33kH9w/O355c52UXa
 R37aIM29S8U5nFIswhVh3S1KzVMaRHFkrJumjiSzfEe73pmgrGHP/XOjRVW66/VG
 N3QH0I79a0TpfsaafoT+GBGAsdAMd709ZCpWajcuJcua0fdBc3Fh4CKPbxxxlx7Q
 bGJx3hBtpz6GbTxeYzMMBryViTChP6YkrFqUBYWh9q1GR7GfIQE00sCk7/6+dDtd
 uo+rLaPyhbNm3xCH7fMU5m1+kDzjr8KwAPtDFe82uzEB5ll7gz0Cox5zEsJJ86DX
 SQo9O2h+yeN75pP7cjUtxqiK5ysUpoB7ggRUyEme9XxK0bL0OgZsGU7CgbMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660552208; x=1660559408; bh=RA5kw03+WBAXnGH4vH/n/ZMFMILV
 ebJisUqvkOeE43M=; b=HbD9vCTkb+dEYIAuIpXto4lTqguTRzigb2zedkkpl+jb
 PpCVKrmzgqmuM+1QY8AAC/TQpZ95qCcPjzE4UUmWv2IGC3NDUZ3BthaQ7IZ0XqUg
 CBNMUFaHlxu6n9rBf9niKZZmge8ufbeIy5vIwQQWvmNeKHqyiGeWeccr+1ztKJ2P
 iWFC75XpK7dJtgUEVnvz6wUY6NIlM5Nr1B8ksLnfjAqHyG8L3f1bYQQID5WN0tA7
 2/ubEhQPaF9cBUKrOdmDnG/6mItBQZMoXBDXvpH7GjxpMXeP2qHWSuOu3GsrJuAI
 pBbfqno1ILKYUVnMvx1e1ef665zwVkXul3gzG/EuIg==
X-ME-Sender: <xms:DwT6YmlaqgoGj3rd9g0xA6dBUendmwC8SSq4tGWYLy74f5EF7GyU6g>
 <xme:DwT6Yt3whEYBF1OOu3egQKQH0A9bfd8aa6efrO2z1coh4wN8UmwTmeoOFU2GxJ3h7
 kMbi_EnY24KgQpC3Jw>
X-ME-Received: <xmr:DwT6Ykp0HSBN6R43g7b18UEAaCRQm9PdNPw8U0zdlzlnleGsshrNQUUad559>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DwT6YqlrIMgmSHXbJ3aObSDrjee1DNKa14wvckdoAdtxiYR1NCKWMQ>
 <xmx:DwT6Yk1xl2CqThy3NwvDQqGh4iN1oq31OiTqxQb3eIb4BUqZSp_tZA>
 <xmx:DwT6YhsIKerepeTFgj4K20JDC3LnTnF8pdUimfYelf5idBY9Lm3Kwg>
 <xmx:EAT6YindEcgZw6YGtsCD2CIZmh4o-alqMqIAtZEQAlNjcMnlu8sSDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 04:30:06 -0400 (EDT)
Date: Mon, 15 Aug 2022 10:30:04 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v1 14/35] drm/atomic-helper: Add an analog TV
 atomic_check implementation
Message-ID: <20220815083004.4zei3raab7uqehqf@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech>
 <10a2f71c-d943-4965-1f15-d84145769ccf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3blbnbsxxj3gnoe3"
Content-Disposition: inline
In-Reply-To: <10a2f71c-d943-4965-1f15-d84145769ccf@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3blbnbsxxj3gnoe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jul 29, 2022 at 07:16:31PM +0200, Mateusz Kwiatkowski wrote:
> I'm pretty sure that PAL-60 and SECAM-60 should be tied to the 480i mode.
> Those are non-standard "norms" that use 60 Hz sync (which is largely
> synonymous with 480i in the analog TV world) with PAL/SECAM color encoding.

Understood, I've changed it.

Maxime

--3blbnbsxxj3gnoe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvoEDAAKCRDj7w1vZxhR
xSaoAP917KRrvUvrHF4D7EakrA32d9JtkzDYQ4YvSsQNyQebUwEA4QYkvJjSsUY2
HL6BrTQmByiQ2K+kmlv7ynXMH5TMxwM=
=29xc
-----END PGP SIGNATURE-----

--3blbnbsxxj3gnoe3--
