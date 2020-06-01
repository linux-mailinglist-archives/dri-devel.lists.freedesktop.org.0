Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750911EA3D0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 14:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD476E25B;
	Mon,  1 Jun 2020 12:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8006E25B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 12:27:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 051CR0K4029209;
 Mon, 1 Jun 2020 07:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591014421;
 bh=fnRSqzP9pGzMUFokqiGLP0liVqECd6XBGgxZlqCodso=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=waA3i6o3Ub0anbCZq9x3lP2hQuGwqEUuGmKCMfjKTdqFsb29Rcp2zgJcSK2l4o3L6
 OIUuycYz4N77jXfkD7RCHGQWKxx+yyJAJnjaStNOIb0rDajf1k2rovY2BcodrOvcEw
 rDV3q2dMBdvJS7jnurdFSiEM7wBwYx4Nw43AW8c8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 051CR0gC019260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jun 2020 07:27:00 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Jun
 2020 07:26:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Jun 2020 07:26:59 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 051CQsJR001831;
 Mon, 1 Jun 2020 07:26:55 -0500
Subject: Re: [PATCH v3 02/13] backlight: add backlight_is_blank()
To: Sam Ravnborg <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>, Jingoo
 Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
References: <20200601065207.492614-1-sam@ravnborg.org>
 <20200601065207.492614-3-sam@ravnborg.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <36c42682-c17c-b5d9-8401-89eadd325bf4@ti.com>
Date: Mon, 1 Jun 2020 15:27:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200601065207.492614-3-sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="------------1E3414A7F514C84FE965C9A3"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 patches@opensource.cirrus.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------1E3414A7F514C84FE965C9A3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On 01/06/2020 9.51, Sam Ravnborg wrote:
> The backlight support has two properties that express the state:
> - power
> - state
>=20
> It is un-documented and easy to get wrong.
> Add backlight_is_blank() helper to make it simpler
> for drivers to get the check of the state correct.
>=20
> A lot of drivers also includes checks for fb_blank.
> This check is redundant when the state is checked
> and thus not needed in this helper function.
> But added anyway to avoid introducing subtle bugs
> due to the creative use of fb_blank in some drivers.
> Introducing this helper will for some drivers results in
> added support for fb_blank. This will be a change in
> functionality, which will improve the backlight driver.
>=20
> Rolling out this helper to all relevant backlight drivers
> will eliminate almost all accesses to fb_blank.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>=20
> v3:
>   - Clarified that the fb_blank support in
>     backlight_is_blank() may result in functionality
>     changes for the users (Emil)
>=20
> v2:
>   - Added fb_blank condition (Daniel)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index c7d6b2e8c3b5..a0a083b35c47 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -175,6 +175,25 @@ static inline void backlight_put(struct backlight_=
device *bd)
>  		put_device(&bd->dev);
>  }
> =20
> +/**
> + * backlight_is_blank - Return true if display is expected to be blank=

> + * @bd: the backlight device
> + *
> + * Display is expected to be blank if any of these is true::
> + *
> + *   1) if power in not UNBLANK
> + *   2) if fb_blank is not UNBLANK
> + *   3) if state indicate BLANK or SUSPENDED
> + *
> + * Returns true if display is expected to be blank, false otherwise.
> + */
> +static inline bool backlight_is_blank(struct backlight_device *bd)
> +{
> +	return bd->props.power !=3D FB_BLANK_UNBLANK ||
> +	       bd->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> +	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
> +}
> +
>  extern struct backlight_device *backlight_device_register(const char *=
name,
>  	struct device *dev, void *devdata, const struct backlight_ops *ops,
>  	const struct backlight_properties *props);
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------1E3414A7F514C84FE965C9A3
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFki4nsBCAD3BM+Ogt951JlaDloruEjoZk/Z+/37CjP0fY2mqLhBOzkpx95u
X1Fquf0KfVk+ZzCd25XGOZEtpZNlXfbxRr2iRWPS5RW2FeLYGvg2TTJCpSr+ugKu
OOec6KECCUotGbGhpYwBrbarJNEwDcAzPK7UJYa1rhWOmkpZJ1hXF1hUghB84q35
8DmN4sGLcsIbVdRFZ1tWFh4vGBFV9LsoDZIrnnANb6/XMX78s+tr3RG3GZBaFPl8
jO5IIv0UIGNUKaYlNVFYthjGCzOqtstHchWuK9eQkR7m1+Vc+ezh1qK0VJydIcjn
OtoMZZL7RAz13LB9vmcJjbQPnI7dJojz/M7zABEBAAG0JlBldGVyIFVqZmFsdXNp
IDxwZXRlci51amZhbHVzaUB0aS5jb20+iQFOBBMBCAA4FiEE+dBcpRFvJjZw+uta
LCayis85LN4FAlki4nsCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQLCay
is85LN4QjggAzxxxXqiWpA3vuj9yrlGLft3BeGKWqF8+RzdeRvshtNdpGeIFf+r5
AJVR71R1w89Qeb4DGXus7qsKiafdFGG7yxbuhw8a5wUm+ZncBXA+ETn3OyVtl8g8
r/ZcPX420jClBNTVuL0sSnyqDFDrt5f+uAFOIwsnHdpns174Zu9QhgYxdvdZ+jMh
Psb745O9EVeNvdfUIRdrVjb4IhJKNIzkb0Tulsz5xeCJReUYpxZU1jzEq3YZqIou
+fi+oS4wlJuSoxKKTmIXtSeEy/weStF1XHMo6vLYqzaK4FyIuclqeuYUYSVy2425
7TMXugaI+O85AEI6KW8MCcu1NucSfAWUabkBDQRZIuJ7AQgAypKq8iIugpHxWA2c
Ck6MQdPBT6cOEVK0tjeHaHAVOUPiw9Pq+ssMifdIkDdqXNZ3RLH/X2svYvd8c81C
egqshfB8nkJ5EKmQc9d7s0EwnYT8OwsoVb3c2WXnsdcKEyu2nHgyeJEUpPpMPyLc
+PWhoREifttab4sOPktepdnUbvrDK/gkjHmiG6+L2owSn637N+Apo3/eQuDajfEu
kybxK19ReRcp6dbqWSBGSeNB32c/zv1ka37bTMNVUY39Rl+/8lA/utLfrMeACHRO
FGO1BexMASKUdmlB0v9n4BaJFGrAJYAFJBNHLCDemqkU7gjaiimuHSjwuP0Wk7Ct
KQJfVQARAQABiQE2BBgBCAAgFiEE+dBcpRFvJjZw+utaLCayis85LN4FAlki4nsC
GwwACgkQLCayis85LN7kCwgAoy9r3ZQfJNOXO1q/YQfpEELHn0p8LpwliSDUS1xL
sswyxtZS8LlW8PjlTXuBLu38Vfr0vGav7oyV7TkhnKT3oBOLXanyZqwgyZSKNEGB
PB4v3Fo7YTzpfSofiwuz03uyfjTxiMGjonxSb+YxM7HBHfzjrOKKlg02fK+lWNZo
m5lXugeWD7U6JJguNdYfr+U4zYIblelUImcIE+wnR0oLzUEVDIWSpVrl/OqS3Rzo
mw8wBsHksTHrbgUnKL0SCzYc90BTeKbyjEBnVDr+dlfbxRxkB8h9RMPMdjodvXzS
Gfsa9V/k4XAsh7iX9EUVBbnmjA61ySxU/w98h96jMuteTg=3D=3D
=3DeQmw
-----END PGP PUBLIC KEY BLOCK-----

--------------1E3414A7F514C84FE965C9A3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------1E3414A7F514C84FE965C9A3--
