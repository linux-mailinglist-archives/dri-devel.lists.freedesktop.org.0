Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E032D0B94
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AA76E584;
	Mon,  7 Dec 2020 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7726C89E7C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:17:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2BCEAD71;
 Mon,  7 Dec 2020 08:17:38 +0000 (UTC)
Subject: Re: [PATCH v3 03/13] video: fbdev: omapfb: Fix set but not used
 warnings in hdmi*_core
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-4-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f48fa582-03a7-0b00-1ff9-29a4f42bb829@suse.de>
Date: Mon, 7 Dec 2020 09:17:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-4-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1289748604=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1289748604==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="E3lrt3AO1UboYAcLRO95c4R22Ins7taIx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E3lrt3AO1UboYAcLRO95c4R22Ins7taIx
Content-Type: multipart/mixed; boundary="OUWhZbPPdmE84pqiaWXJaw69CHLHuUKK9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Alexander Klimov <grandmaster@al2klimov.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Gustavo A R Silva <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@kernel.org>, Peter Jones <pjones@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Qilong Zhang
 <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rich Felker <dalias@libc.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Tony Prisk <linux@prisktech.co.nz>
Message-ID: <f48fa582-03a7-0b00-1ff9-29a4f42bb829@suse.de>
Subject: Re: [PATCH v3 03/13] video: fbdev: omapfb: Fix set but not used
 warnings in hdmi*_core
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-4-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-4-sam@ravnborg.org>

--OUWhZbPPdmE84pqiaWXJaw69CHLHuUKK9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

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


--OUWhZbPPdmE84pqiaWXJaw69CHLHuUKK9--

--E3lrt3AO1UboYAcLRO95c4R22Ins7taIx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N5SAFAwAAAAAACgkQlh/E3EQov+Bw
rg/+LR5m0fPa5U9oIwT4rwsKunaIejtxjKhv4yTaKVPunhtVb87Jqt+IqwsZ52d5O2enBQb43e3V
fZQT55Mrk6m0m7mLG/lhk27hLemh4wSRgVJ0ZEg3YmQzTZZWQdupqbTJE7bcUJdwx8zIUcmzI1po
5trUyBPf46eRTNliM5Vc244dtzFgPgfuLBXZu/dCq8Zzn9Qxh757mW4HjMYMspJoaWNbgD8LvEsN
LCU2Nk+1Ew7qY27KDzGOrfZllPIUnDgWqni8Ej5zCTuCMzvZXGV5wcbX9KzzjxV2KRkxByE/rivI
3/bGCRDkU8zda578ct2LHXr+8Fg/aoRxs6j1mxHylRDNHaMYG8ZHuQRY84PdOf/fcboIw3yr2ptH
Sirs1DQo+tLuG86Z45W5uZkQQdWWkPmtv7LJDeHIUkMRKpN3OFM7YRVt/SdsB0lcIq306nd/mqk4
F/BfLqrs/KmDFnlpJOXYE0XXziSbK23CG2r/MZ/nUu+wMqa0gl6Ey9ZudSBYRAwZteFJ/nfelbvk
vbx/2Mq8qN1WBRF6Rz4/YdTNSTrVg/tK45CFfBZzCiwGxoszbKzeg9/W8l229XJDx2q7B7+vsbqK
uJDg97WCP4M4YssswkEdMf4GkaLsdva9ah2EiMkVB6fsOWMzQ7WlTuJ2Qow5yNgaG2ZyvldkV+H0
/to=
=vrgS
-----END PGP SIGNATURE-----

--E3lrt3AO1UboYAcLRO95c4R22Ins7taIx--

--===============1289748604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1289748604==--
