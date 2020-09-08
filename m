Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEFC2627C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2CF6E9C7;
	Wed,  9 Sep 2020 07:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474E6E062
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 19:10:22 +0000 (UTC)
Received: from kevin (unknown [IPv6:2607:fea8:55f:a950::68f4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 93A0B295E47;
 Tue,  8 Sep 2020 20:10:18 +0100 (BST)
Date: Tue, 8 Sep 2020 15:10:10 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/5] drm/panfrost: add amlogic reset quirk callback
Message-ID: <20200908191010.GB10568@kevin>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-5-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-5-narmstrong@baylibre.com>
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: tomeu.vizoso@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0495179900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0495179900==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Since the documentation of the GPU cores are not public, we do not know what does these
> values, but they permit having a fully functional GPU running with Panfrost.

Since this is Amlogic magic, not specifically GPU, I'd rephrase this as
"Since the Amlogic's integration of the GPU cores with the SoC is not
publicly documented..."

> +	/*
> +	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
> +	 * these undocumented bits to be set in order to operate
> +	 * correctly.
> +	 * These GPU_PWR registers contains:
> +	 * "device-specific power control value"
> +	 */

PWR_OVERRIDE1 is the Amlogic specific value.

Per the name, for PWR_KEY, I'd do add "#define GPU_PWR_KEY_UNLOCK
0x2968A819" in panfrost-gpu.h so it's clear which value is which.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9X1woACgkQ/v5QWgr1
WA0XAg//c9nGGJntvueFe8c6qd2IaRIMN3EM6NDls15z8sc2USz064lxnb0x5o15
futnTLgG+9RPsMRDl3GmLwHyffyRWWIupoVPgMEu/RdWUai8d4yKyF76xVDpUOAD
RnPBzvstwXzN3Wggj47fB6ajEZFFOI2erWqEgAY8UZARPkw3jP+lUbHpagmKdMVF
SYrAuYXOZmOjdlHXeTM4jxAW1I76imu2iEnvm+/2bpgRUumypy3/K33/wICFL9W3
RVC1/2Gw6zRrhT9Je9eVBLID7xoeJk5jFHAFss9xd+OtshquOBlapVXwJVcfEm+p
gDFNrxG/pXgrJvkI6a8anp0cqyaixvIONfMt2fJwfTbqP5+K0QigQFVclGa6eXM3
iLkfjlbgrCn8iiywRBx7BunsMqMWgHEt5K78PGczw2JmU+Ahp1O1vq9Az0s2yYIt
X5nlp/iwUHRtPEnoNwqPFfasUnO3UAkObmax9oZVG3iBede/wMMWDOvm/J0Q8pEq
jI/liFrKDPa7Qnkwara3B1hxAeMedig7Qi+RAFuRTUFlNCoBuD4TfCcvBGqH1cDX
aupOBHrxmstHtZH5lnCcy7cXepJuCOmati2khQRvoOJolnRYI1HFyt2poZT3HQ+w
K8zkmWUzKZZk/QwJn31i7zX7emvAvma0aO3dGzdT4+F3OMeJRf0=
=eeWO
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============0495179900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0495179900==--
