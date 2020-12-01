Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA112C9E81
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36D16E525;
	Tue,  1 Dec 2020 10:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AB36E525
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:03:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B583DAE92;
 Tue,  1 Dec 2020 10:03:46 +0000 (UTC)
Subject: Re: [PATCH v2 22/28] video: fbdev: omapfb: Fix set but not used
 warnings in dsi
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-23-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8f39b00f-3ec7-0712-0eaa-07156c1cdc37@suse.de>
Date: Tue, 1 Dec 2020 11:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-23-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1808803990=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1808803990==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gbtftWKlf8hPTKh2UACUiG6ElqufM5tpM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gbtftWKlf8hPTKh2UACUiG6ElqufM5tpM
Content-Type: multipart/mixed; boundary="L0aI5e3MNH4UvuZs6UsyBSWhoQVbBdFxd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Alex Dewar <alex.dewar90@gmail.com>, Antonino Daplas <adaplas@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Evgeny Novikov <novikov@ispras.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Silva <gustavoars@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Jason Yan <yanaijie@huawei.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Joe Perches <joe@perches.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Peter Rosin <peda@axentia.se>, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <8f39b00f-3ec7-0712-0eaa-07156c1cdc37@suse.de>
Subject: Re: [PATCH v2 22/28] video: fbdev: omapfb: Fix set but not used
 warnings in dsi
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-23-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-23-sam@ravnborg.org>

--L0aI5e3MNH4UvuZs6UsyBSWhoQVbBdFxd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix several W=3D1 warnings.
> This removes unused code and avoids an assignment by moving
> the use inside the conditional block.
>=20
> The register read FLD_GET(r, 15, 8) could be dropped as it was done a
> few lines before too.
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Aditya Pakki <pakki001@umn.edu>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video=
/fbdev/omap2/omapfb/dss/dsi.c
> index 6f9c25fec994..72d45a02c3ac 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -1178,13 +1178,12 @@ static int dsi_regulator_init(struct platform_d=
evice *dsidev)
>  =20
>   static void _dsi_print_reset_status(struct platform_device *dsidev)
>   {
> -	u32 l;
>   	int b0, b1, b2;
>  =20
>   	/* A dummy read using the SCP interface to any DSIPHY register is
>   	 * required after DSIPHY reset to complete the reset of the DSI comp=
lex
>   	 * I/O. */
> -	l =3D dsi_read_reg(dsidev, DSI_DSIPHY_CFG5);
> +	dsi_read_reg(dsidev, DSI_DSIPHY_CFG5);
>  =20
>   	if (dss_has_feature(FEAT_DSI_REVERSE_TXCLKESC)) {
>   		b0 =3D 28;
> @@ -3627,7 +3626,7 @@ static int dsi_proto_config(struct platform_devic=
e *dsidev)
>   static void dsi_proto_timings(struct platform_device *dsidev)
>   {
>   	struct dsi_data *dsi =3D dsi_get_dsidrv_data(dsidev);
> -	unsigned tlpx, tclk_zero, tclk_prepare, tclk_trail;
> +	unsigned tlpx, tclk_zero, tclk_prepare;
>   	unsigned tclk_pre, tclk_post;
>   	unsigned ths_prepare, ths_prepare_ths_zero, ths_zero;
>   	unsigned ths_trail, ths_exit;
> @@ -3646,7 +3645,6 @@ static void dsi_proto_timings(struct platform_dev=
ice *dsidev)
>  =20
>   	r =3D dsi_read_reg(dsidev, DSI_DSIPHY_CFG1);
>   	tlpx =3D FLD_GET(r, 20, 16) * 2;
> -	tclk_trail =3D FLD_GET(r, 15, 8);
>   	tclk_zero =3D FLD_GET(r, 7, 0);
>  =20
>   	r =3D dsi_read_reg(dsidev, DSI_DSIPHY_CFG2);
> @@ -4040,7 +4038,6 @@ static int dsi_update(struct omap_dss_device *dss=
dev, int channel,
>   {
>   	struct platform_device *dsidev =3D dsi_get_dsidev_from_dssdev(dssdev=
);
>   	struct dsi_data *dsi =3D dsi_get_dsidrv_data(dsidev);
> -	u16 dw, dh;
>  =20
>   	dsi_perf_mark_setup(dsidev);
>  =20
> @@ -4049,11 +4046,8 @@ static int dsi_update(struct omap_dss_device *ds=
sdev, int channel,
>   	dsi->framedone_callback =3D callback;
>   	dsi->framedone_data =3D data;
>  =20
> -	dw =3D dsi->timings.x_res;
> -	dh =3D dsi->timings.y_res;
> -
>   #ifdef DSI_PERF_MEASURE
> -	dsi->update_bytes =3D dw * dh *
> +	dsi->update_bytes =3D dsi->timings.x_res * dsi->timings.y_res *
>   		dsi_get_pixel_size(dsi->pix_fmt) / 8;
>   #endif
>   	dsi_update_screen_dispc(dsidev);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--L0aI5e3MNH4UvuZs6UsyBSWhoQVbBdFxd--

--gbtftWKlf8hPTKh2UACUiG6ElqufM5tpM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GFP4FAwAAAAAACgkQlh/E3EQov+D5
oRAAnxSZWMgSnK1vLVAsX2otsN26JRpcBwx3J9hLRSndz6Zrhu0VLniFsxYmjxfDyeAhPJBS1V+5
JX3M9LrB1AeYf8hxdoADyNHYTkS8OBWjCg5AmV8+f1F0uwvJ1sMMHK/cjHeMOBKDpW1Qj7X/l2Iw
zkO9OhwTIQCEFWYNwp4z/XKUp5vg8E63YC7J1G02G5IIWOG2Z+2AKZYlciWPomlqQBICWO/evqkh
snCilsUxqu4fizFoZH1bZqXaRnRKFxDyYS2NtEys6Q1DavPDvIZg9vEpYUCLE6otuRwjJfohuNp0
HiSjPBOrdNYEAloFWbuA+2TmzJ293Stizcl5yK6zlMLMY+hnjkXO9f+xAs4K7yuDqg1QeHAgAyta
5jEVBwulBKOrQBcA7gWia8BJDefb4c1M4Dqrnzipn7IIpMOg2QDjcSGjevHoHbxIlR9bx0nF2zPC
nT3Fk0IQ7xd82SNedpi07zOFkFPfdLY4sI9MwQ/nQpNonyerVyrcsKTYymeWQbjcRhp+sH5Xp1PR
YVeUxUfXPXPV1VCUHV5QxMpd8lovbSKw8ayoV0deDIIdiNhvxD5CejnXpy5qVW0W/5gqblohw6eN
xYpOZSlb+kyRkwiEwfLiRJ+B7dqXdOhdUs4KsfQeJ4Ugg/sLEnTqEJP9eqerOCyq2uFeBQXc0mvj
FMQ=
=XJ0p
-----END PGP SIGNATURE-----

--gbtftWKlf8hPTKh2UACUiG6ElqufM5tpM--

--===============1808803990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1808803990==--
