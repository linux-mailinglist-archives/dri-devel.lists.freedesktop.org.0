Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D84B83D0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E2610EDD5;
	Wed, 16 Feb 2022 09:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223E10EDD5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:17:21 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 58F0A3201F7B;
 Wed, 16 Feb 2022 04:17:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 16 Feb 2022 04:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=qaKohh4aepq/GkkypQOo/a9EEI+VH37aRSfAFY
 uhYQg=; b=ZX5h4o4nlxv/RHrsEnr5n9FfrMqIRUR2ITbKm8H2+3fnem82wpS9Re
 VGAITWnqd9Guo+gKW6YR9hiB8lLO55oRRHTkd5irEl8uXUxZGbsyoGLJGl9noiwu
 uwl0tS5zBgfz9aX0Io38aQI6eyk11Z8HV7evppf/59sUrxkGyQ3D5JLyfw/bDpFi
 3896O2OmB0YZPkfC1/J09sDnq/GqbUyNeLDs5z7e63/+Xbi7l40lv/LXEp6iJi+I
 SkNZwTjkWgxHY/n1zCRct9q8vasXSyWc/VG6u2HS1nvefO0/G6030tnmpxrBodyI
 /wo6J4YEZbASwKE98EuqbtdayGrbHZ5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qaKohh4aepq/Gkkyp
 QOo/a9EEI+VH37aRSfAFYuhYQg=; b=CLw/b/QhljZWawb0avI2hiCjdJherbeFy
 pkFT/DvTO7Bar+Edd2ybcAfMacIde/TQy1ou5IOyVLUlZwSKvc68YcPwLzrsF7gq
 wu8RPmyxBYymL5DmtiZ+RUIx5y3HH1dt/haf+hBnCWOtKLEW/YW1LOotWftzZ/jD
 l5BKyFcJtE2KicIc7FbchNS2Msrbzc+r1D7TJKyKRifDo/Qi8HemFNWHzRp6Gbj/
 BiITMLf6PDO5G9oiykJQIouzIxFMEKv87vn81zJRyzbjWXgqXkLiYmMZfx3Anpdp
 u3y8BnASzpVvKFbw+7nzQTx3cJs0PlDdLrFvQU+lM/ljqHFUERrog==
X-ME-Sender: <xms:H8EMYhRtTG2XN1a3vDCKWPpk3aISshSvG7-TGC1fbsL7BY1EbfBn2Q>
 <xme:H8EMYqyF8GFtDz9QipL3R2MMZBZzA--bJvkFNEP33Zcb0ZSGWknAWXVt06b_KOdvZ
 jupA6yFatcSa2ssZ5I>
X-ME-Received: <xmr:H8EMYm3KcSUVyKZEF8vO5JniKh_DW76nm688AQhwJew-a7KJ7FRNj9gSiQyH-z4xttGSyzLMQ-6VtSI3QpefeanyjJToJDQSUH8Cwcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:H8EMYpCKsJRif3YhxasGRab3_iJ4XwAkCMa3VMnNbBiBBkTBB5p5ZA>
 <xmx:H8EMYqgjrMQNUcji8RAAmSKK0Teuw3mjb9H8bss3Ta4gmpza5BAYDw>
 <xmx:H8EMYtq6GnWCi6gkaY1volWhGf9YkzHO-RJc9A3UKTE9YRB6pJtbJw>
 <xmx:H8EMYujSdsPCU3gauFtLqedYMgfkX5BMjB7QkfDRHbP5oChGFIPBtQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 04:17:19 -0500 (EST)
Date: Wed, 16 Feb 2022 10:17:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 5/6] MAINTAINERS: Add entry for Solomon SSD130x OLED
 displays DRM driver
Message-ID: <20220216091718.4pdxt3vcot36a5cq@houat>
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133915.3278886-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wlo4mxdy4odxnt36"
Content-Disposition: inline
In-Reply-To: <20220214133915.3278886-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wlo4mxdy4odxnt36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 02:39:15PM +0100, Javier Martinez Canillas wrote:
> To make sure that tools like the get_maintainer.pl script will suggest
> to Cc me if patches are posted for this driver.
>=20
> Also include the Device Tree binding for the old ssd1307fb fbdev driver
> since the new DRM driver was made compatible with the existing binding.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--wlo4mxdy4odxnt36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgzBHgAKCRDj7w1vZxhR
xYWvAQD5EEhCAf3MCqWSR1F6Ej6gxwc55wevXgsB+mAA0KUaFQD+L5vFj9fEfEG+
i8ckfa4MIKkw5uusct2NPavMhY6WQAM=
=m2Lw
-----END PGP SIGNATURE-----

--wlo4mxdy4odxnt36--
