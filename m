Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4912C9E9A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2875E6E4F8;
	Tue,  1 Dec 2020 10:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FEB6E525
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:06:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AD51ADAA;
 Tue,  1 Dec 2020 10:06:19 +0000 (UTC)
Subject: Re: [PATCH v2 23/28] video: fbdev: omapfb: Fix set but not used
 warnings in hdmi*_core
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-24-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e6664921-cc89-6814-8d63-33f43df63ed4@suse.de>
Date: Tue, 1 Dec 2020 11:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-24-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1346096816=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1346096816==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9Iq9PZI8r9vCcI3bZAplE2EAZEouGYt1R"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9Iq9PZI8r9vCcI3bZAplE2EAZEouGYt1R
Content-Type: multipart/mixed; boundary="LBbpu34wRRGGfp4TDcdp58GW5uCyI4FtV";
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
Message-ID: <e6664921-cc89-6814-8d63-33f43df63ed4@suse.de>
Subject: Re: [PATCH v2 23/28] video: fbdev: omapfb: Fix set but not used
 warnings in hdmi*_core
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-24-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-24-sam@ravnborg.org>

--LBbpu34wRRGGfp4TDcdp58GW5uCyI4FtV
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix a few W=3D1 warnings about unused assignments.
> Drop the unused error code.
>=20
> v2:
>    - Subject updated (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Qilong Zhang <zhangqilong3@huawei.com>
> Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c | 4 ++--
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c b/driver=
s/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> index 726c190862d4..e6363a420933 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
> @@ -679,7 +679,7 @@ int hdmi4_audio_config(struct hdmi_core_data *core,=
 struct hdmi_wp_data *wp,
>   	struct hdmi_audio_format audio_format;
>   	struct hdmi_audio_dma audio_dma;
>   	struct hdmi_core_audio_config acore;
> -	int err, n, cts, channel_count;
> +	int n, cts, channel_count;
>   	unsigned int fs_nr;
>   	bool word_length_16b =3D false;
>  =20
> @@ -741,7 +741,7 @@ int hdmi4_audio_config(struct hdmi_core_data *core,=
 struct hdmi_wp_data *wp,
>   		return -EINVAL;
>   	}
>  =20
> -	err =3D hdmi_compute_acr(pclk, fs_nr, &n, &cts);
> +	hdmi_compute_acr(pclk, fs_nr, &n, &cts);

I'd rather return the error reported by hdmi_compute_acr()

Best regards
Thomas

>  =20
>   	/* Audio clock regeneration settings */
>   	acore.n =3D n;
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/driver=
s/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> index eda29d3032e1..cb63bc0e92ca 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
> @@ -790,7 +790,7 @@ int hdmi5_audio_config(struct hdmi_core_data *core,=
 struct hdmi_wp_data *wp,
>   	struct hdmi_audio_format audio_format;
>   	struct hdmi_audio_dma audio_dma;
>   	struct hdmi_core_audio_config core_cfg;
> -	int err, n, cts, channel_count;
> +	int n, cts, channel_count;
>   	unsigned int fs_nr;
>   	bool word_length_16b =3D false;
>  =20
> @@ -833,7 +833,7 @@ int hdmi5_audio_config(struct hdmi_core_data *core,=
 struct hdmi_wp_data *wp,
>   		return -EINVAL;
>   	}
>  =20
> -	err =3D hdmi_compute_acr(pclk, fs_nr, &n, &cts);
> +	hdmi_compute_acr(pclk, fs_nr, &n, &cts);
>   	core_cfg.n =3D n;
>   	core_cfg.cts =3D cts;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LBbpu34wRRGGfp4TDcdp58GW5uCyI4FtV--

--9Iq9PZI8r9vCcI3bZAplE2EAZEouGYt1R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GFZgFAwAAAAAACgkQlh/E3EQov+CP
TxAAnqerj89VsWhx3ZO0QuFg21eiLyPsIqrAChBffFa3mjNRb7HdwiTbBFrNYYr/Z01w/mACAWQG
DHGX8XRttG0ovfRqw/EZnKQUtbXYXbZ8nh0m5fmVgSFKyqIcDkMy4hXPYLDiVP0xSln7CIgadalm
dY+ISxjTMA4l2D2RkTWZLk1r/Zq2Bq+PyE/zkeGpR/IGykLSv6V9DEr8xg3q+IeaDsSPVtrI8EV4
tLsQR9t02qZsBQ2T00D3NnHSXHMh8qEiKZnpFIRqTowwniho7Yilv6dhLf13+PwLD0rIKc7K128o
u16EgRh6VOu681FxPyghLQ2C5qy9d4Dg9Arij/pZsY1XLSDbrYglRnbThi5TDHc//GIgIOEXHmnz
Pk3wFqi484et59nMdS1s+OKguNKpphFQcHWzauLfBf5UHhg9DyYDAMYe3coEXx6j/nWfujAHsyAQ
g5ANk4QpiRVvFbssnFU/lf21cr2ILarOftHd2k8c9ZJznCw9I3u2shTOTmFo2o/9PB1I78tNP67g
0nDZgQKmHaljSH9VnJbYvXeoEbDwsqKkXeBq1Y67W1ZAkJkk3fhvLO5MuIpH+jgBpmIeNSONSPbj
iNV47/5Lp0sfoGP3Ug0u6AW3n2ES6uocXSi74rOVsFO5wnawjZkfokplMFXgLyi7MQcY3/Id2zgm
2jU=
=MIFN
-----END PGP SIGNATURE-----

--9Iq9PZI8r9vCcI3bZAplE2EAZEouGYt1R--

--===============1346096816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1346096816==--
