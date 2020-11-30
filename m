Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28272C83F1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E3589BF5;
	Mon, 30 Nov 2020 12:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E963789BF5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:14:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B2F2AEA2;
 Mon, 30 Nov 2020 12:14:55 +0000 (UTC)
Subject: Re: [PATCH v2 13/28] video: fbdev: riva: Fix kernel-doc and set but
 not used warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-14-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <53f3e91e-d8da-bce6-878c-7842250a7a7c@suse.de>
Date: Mon, 30 Nov 2020 13:14:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-14-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1865405098=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1865405098==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="S2pNcfcZ3GGrQ5cKIHJm8IqQeYYaccSsi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S2pNcfcZ3GGrQ5cKIHJm8IqQeYYaccSsi
Content-Type: multipart/mixed; boundary="ftXxSfXXKggPABuUVP3ifS9B34Be2m2kr";
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
Message-ID: <53f3e91e-d8da-bce6-878c-7842250a7a7c@suse.de>
Subject: Re: [PATCH v2 13/28] video: fbdev: riva: Fix kernel-doc and set but
 not used warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-14-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-14-sam@ravnborg.org>

--ftXxSfXXKggPABuUVP3ifS9B34Be2m2kr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Fix W=3D1 warnings:
> - Fix kernel-doc
> - Drop unused variables/code
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Antonino Daplas <adaplas@gmail.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/video/fbdev/riva/fbdev.c   |  9 ++++-----
>   drivers/video/fbdev/riva/riva_hw.c | 28 ++++++++--------------------
>   2 files changed, 12 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riv=
a/fbdev.c
> index ce55b9d2e862..55554b0433cb 100644
> --- a/drivers/video/fbdev/riva/fbdev.c
> +++ b/drivers/video/fbdev/riva/fbdev.c
> @@ -464,7 +464,7 @@ static inline void reverse_order(u32 *l)
>  =20
>   /**
>    * rivafb_load_cursor_image - load cursor image to hardware
> - * @data: address to monochrome bitmap (1 =3D foreground color, 0 =3D =
background)
> + * @data8: address to monochrome bitmap (1 =3D foreground color, 0 =3D=
 background)
>    * @par:  pointer to private data
>    * @w:    width of cursor image in pixels
>    * @h:    height of cursor image in scanlines
> @@ -843,9 +843,9 @@ static void riva_update_var(struct fb_var_screeninf=
o *var,
>   /**
>    * rivafb_do_maximize -
>    * @info: pointer to fb_info object containing info for current riva =
board
> - * @var:
> - * @nom:
> - * @den:
> + * @var: standard kernel fb changeable data
> + * @nom: nom
> + * @den: den

Well, it fixes the warning ;)

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>    *
>    * DESCRIPTION:
>    * .
> @@ -1214,7 +1214,6 @@ static int rivafb_set_par(struct fb_info *info)
>   /**
>    * rivafb_pan_display
>    * @var: standard kernel fb changeable data
> - * @con: TODO
>    * @info: pointer to fb_info object containing info for current riva =
board
>    *
>    * DESCRIPTION:
> diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/r=
iva/riva_hw.c
> index bcf9c4b4de31..8b829b720064 100644
> --- a/drivers/video/fbdev/riva/riva_hw.c
> +++ b/drivers/video/fbdev/riva/riva_hw.c
> @@ -836,17 +836,17 @@ static void nv10CalcArbitration
>       nv10_sim_state *arb
>   )
>   {
> -    int data, pagemiss, cas,width, video_enable, bpp;
> -    int nvclks, mclks, pclks, vpagemiss, crtpagemiss, vbs;
> -    int nvclk_fill, us_extra;
> +    int data, pagemiss, width, video_enable, bpp;
> +    int nvclks, mclks, pclks, vpagemiss, crtpagemiss;
> +    int nvclk_fill;
>       int found, mclk_extra, mclk_loop, cbs, m1;
>       int mclk_freq, pclk_freq, nvclk_freq, mp_enable;
> -    int us_m, us_m_min, us_n, us_p, video_drain_rate, crtc_drain_rate;=

> -    int vus_m, vus_n, vus_p;
> -    int vpm_us, us_video, vlwm, cpm_us, us_crt,clwm;
> +    int us_m, us_m_min, us_n, us_p, crtc_drain_rate;
> +    int vus_m;
> +    int vpm_us, us_video, cpm_us, us_crt,clwm;
>       int clwm_rnd_down;
> -    int craw, m2us, us_pipe, us_pipe_min, vus_pipe, p1clk, p2;
> -    int pclks_2_top_fifo, min_mclk_extra;
> +    int m2us, us_pipe_min, p1clk, p2;
> +    int min_mclk_extra;
>       int us_min_mclk_extra;
>  =20
>       fifo->valid =3D 1;
> @@ -854,16 +854,13 @@ static void nv10CalcArbitration
>       mclk_freq =3D arb->mclk_khz;
>       nvclk_freq =3D arb->nvclk_khz;
>       pagemiss =3D arb->mem_page_miss;
> -    cas =3D arb->mem_latency;
>       width =3D arb->memory_width/64;
>       video_enable =3D arb->enable_video;
>       bpp =3D arb->pix_bpp;
>       mp_enable =3D arb->enable_mp;
>       clwm =3D 0;
> -    vlwm =3D 1024;
>  =20
>       cbs =3D 512;
> -    vbs =3D 512;
>  =20
>       pclks =3D 4; /* lwm detect. */
>  =20
> @@ -924,17 +921,11 @@ static void nv10CalcArbitration
>         us_min_mclk_extra =3D min_mclk_extra *1000*1000 / mclk_freq;
>         us_n =3D nvclks*1000*1000 / nvclk_freq;/* nvclk latency in us *=
/
>         us_p =3D pclks*1000*1000 / pclk_freq;/* nvclk latency in us */
> -      us_pipe =3D us_m + us_n + us_p;
>         us_pipe_min =3D us_m_min + us_n + us_p;
> -      us_extra =3D 0;
>  =20
>         vus_m =3D mclk_loop *1000*1000 / mclk_freq; /* Mclk latency in =
us */
> -      vus_n =3D (4)*1000*1000 / nvclk_freq;/* nvclk latency in us */
> -      vus_p =3D 0*1000*1000 / pclk_freq;/* pclk latency in us */
> -      vus_pipe =3D vus_m + vus_n + vus_p;
>  =20
>         if(video_enable) {
> -        video_drain_rate =3D pclk_freq * 4; /* MB/s */
>           crtc_drain_rate =3D pclk_freq * bpp/8; /* MB/s */
>  =20
>           vpagemiss =3D 1; /* self generating page miss */
> @@ -993,7 +984,6 @@ static void nv10CalcArbitration
>                 else if(crtc_drain_rate * 100  >=3D nvclk_fill * 98) {
>                     clwm =3D 1024;
>                     cbs =3D 512;
> -                  us_extra =3D (cbs * 1000 * 1000)/ (8*width)/mclk_fre=
q ;
>                 }
>             }
>         }
> @@ -1010,7 +1000,6 @@ static void nv10CalcArbitration
>  =20
>         m1 =3D clwm + cbs -  1024; /* Amount of overfill */
>         m2us =3D us_pipe_min + us_min_mclk_extra;
> -      pclks_2_top_fifo =3D (1024-clwm)/(8*width);
>  =20
>         /* pclk cycles to drain */
>         p1clk =3D m2us * pclk_freq/(1000*1000);
> @@ -1038,7 +1027,6 @@ static void nv10CalcArbitration
>                 min_mclk_extra--;
>           }
>         }
> -      craw =3D clwm;
>  =20
>         if(clwm < (1024-cbs+8)) clwm =3D 1024-cbs+8;
>         data =3D (int)(clwm);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ftXxSfXXKggPABuUVP3ifS9B34Be2m2kr--

--S2pNcfcZ3GGrQ5cKIHJm8IqQeYYaccSsi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/E4jwFAwAAAAAACgkQlh/E3EQov+AU
jRAAt7DQe7XZIqnIEGkcuBFgImgL5YawQc37rF7y2SrFfqDzMLFrevXxE1AZQ5emzXCj25dcfLJf
N8TZaIySTys0ZEHOl8Vqc5HtBP1VeNwB7iNqYqv6GHhpNK/dsE0TM1F0Uo6TbDWe2tOPo8o22dKS
mawABsk+8tT4t+ID5qatw+CBa7iuPoxdBRSOLjvB6ARJKszxBi8ij30YWgF2vxzE2/4qcGy9C38j
39TSBRuzAekg7qTENyo2htLIQtz5f24UjcZe67JwaM12z+2z+mj8C1EB9izV0hWvE4Mg6FTbyHSu
qZ6WRwaVUEp5XGo2y2oYcJB0Eq1/TICdTty3mU+6TjZePzNXCMaP7yxcfsr6dNAkY/tEcAY7ndJC
xQEfENV6w3ZPytFoyie5WOWKt5MR/foEcpeTsUv95lj396HjjIR6/n0jm/4iWpw1czGF+z53MylP
CAww4HDA5dFKC4zS1NzunSKzNLWo6Qm40/IAUel5p2JW1FsDHlDwuyhdeOXxkm1dIXf61Ka08pss
7UrGoPz1Uv3UyNlvF2zQvMc4gf8Y+Pzr+cwRmhdKPggCoPXkXOF7BgckUH5U3qhXvdg0c43VMOrc
YMTDiwnrTdkmAVSo95dDUG6Q3YNtjKR2k+pfDLdhI4W45r6+CTdFfPFO0i6cuwZPyYBRnunwJRdm
mcY=
=QPe1
-----END PGP SIGNATURE-----

--S2pNcfcZ3GGrQ5cKIHJm8IqQeYYaccSsi--

--===============1865405098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1865405098==--
