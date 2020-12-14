Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B102D9BCB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236FA89A9F;
	Mon, 14 Dec 2020 16:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E769589A9F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:06:15 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:06:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607961975;
 bh=LtUESTgyZ/Hj4F3RuX8xDlgvoVVJOIq0cAZEPyRbmlk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=RpBk8+PQLEp3jm/K990Y7tJAzkP8GqDzxWitgdVwZ4ByGOUrNRVbA4S6IoNGivXfn
 6y9mA+qC2sqQqVFiSgcU49GtIOR9fh+EYGxRu3EOCIlY4KrDVNO8ACKKfk9YG+9x60
 Pa4PKkOzSTq3pGnzMts1armTbbHoydhl0QLZxyd25YMwjhsEukyF+EMys/sQZJpxy4
 qpNUHE1c36wvBv4Jxd3HxNIdfMOzG68AgZzAaQkwYtSmh8KYX7wonM4+IZTAWhsEft
 gY+o3Oeft+fJ1zhpovy0x5SLK59H8St1NILBQnmSFwNhkWAP6B7kHc28c6U49tLnnH
 HmdVq8soln8yQ==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 18/29] drm/panel: panel-dsi-cm: drop unneeded includes
Message-ID: <20201214160613.2a3sstfx6lzb56wk@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-19-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-19-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============1327239917=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1327239917==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aawwqsldphzhmw3o"
Content-Disposition: inline


--aawwqsldphzhmw3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:44PM +0200, Tomi Valkeinen wrote:
> Drop unneeded includes.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 3fb5b2856283..3fe73c4bef6e 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -11,9 +11,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/jiffies.h>
>  #include <linux/module.h>
> -#include <linux/sched/signal.h>
> -#include <linux/slab.h>
> -#include <linux/of_device.h>

Note, that 'of_device_get_match_data', which I suggested in
previous patch is defined in <linux/of_device.h>. Otherwise

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  #include <linux/regulator/consumer.h>
> =20
>  #include <drm/drm_connector.h>
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--aawwqsldphzhmw3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XjXUACgkQ2O7X88g7
+pqGxRAAjWk6ISQRb4isOhz/wJ61MXXRSrjre5DjrCBmOqrX1vlj86VnAPIw1ing
UWnHqHcl26VCw32u+63UXRourD71rlkLdL2ad/Ddi7JyFusqOUYOQHljSDamWlVI
6bOCh1NKh7nLBHEeah+I/hgTX7Supm8z2nRdxNvNsTwPQW7GVz/SIwkUmrz84Wx8
Uwd+vubpo7AuNcSIqtUXqom950HK0tJngdY7JHKxr/F66mrWMubNJSdjIqKSCYmO
NUU5bDMlqD5+I/sAE7NmOBpnHjpEhGFc1Sg6lRLfo/dtxxhS6rZvlffGGEnQv39s
xAJJzHJpJ17tJ2V0EAQUZMrbhrkUPQJWPhg3fre65I2ti/xXau97Fmkrhx2isjTf
JuW7G6AX6kizhHVWpiOl4xd2iUijhEP/rXOnSqe0NCXLQ0W5p/0a3oeSvyzd5FjX
7gmyx41jeG6cyEgan3qbA0fP5rWtgvQWXu3vyS8cwe+5Kjt/nb8LIA8rQ3iTq7my
JYn+skExO2hpOrr84VdPuhosOqUByv3lbc2Ugn82u7Jed2RFzCliJPtDP8SyfGLk
dpWXxGsQa6rq6TiUS2cCFDSo8THJyifVuLOBWABMFZzEkyq+pEzAUXWqTO7dHID9
qkRHOq14qsPn0Ak6BAI4yLQFdwJub1ft5S9BcQLeTp8NTnCl8H8=
=45Pk
-----END PGP SIGNATURE-----

--aawwqsldphzhmw3o--

--===============1327239917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1327239917==--
