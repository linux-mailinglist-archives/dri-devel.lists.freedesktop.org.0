Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A42C9EA7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1F66E5A5;
	Tue,  1 Dec 2020 10:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A576E563
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:07:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A1ADAE92;
 Tue,  1 Dec 2020 10:07:32 +0000 (UTC)
Subject: Re: [PATCH v2 24/28] video: fbdev: s3c-fb: Fix kernel-doc and set but
 not used warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-25-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5b458394-941f-6eac-c93e-76a1d1104acc@suse.de>
Date: Tue, 1 Dec 2020 11:07:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-25-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============0634494913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0634494913==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2b343QpF7KyWmUh47zzQru9m7w2Q4YX4B"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2b343QpF7KyWmUh47zzQru9m7w2Q4YX4B
Content-Type: multipart/mixed; boundary="VbDxIgoYD1S4Jx1DvhWtWyNFkb3adOprj";
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
Message-ID: <5b458394-941f-6eac-c93e-76a1d1104acc@suse.de>
Subject: Re: [PATCH v2 24/28] video: fbdev: s3c-fb: Fix kernel-doc and set but
 not used warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-25-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-25-sam@ravnborg.org>

--VbDxIgoYD1S4Jx1DvhWtWyNFkb3adOprj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix several W=3D1 warnings
> - Updated kernel-doc as needed
> - Deleted unused local variable, it was assigned but never used
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/s3c-fb.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.=
c
> index ba316bd56efd..3b134e1bbc38 100644
> --- a/drivers/video/fbdev/s3c-fb.c
> +++ b/drivers/video/fbdev/s3c-fb.c
> @@ -75,6 +75,7 @@ struct s3c_fb;
>    * @buf_size: Offset of buffer size registers.
>    * @buf_end: Offset of buffer end registers.
>    * @osd: The base for the OSD registers.
> + * @osd_stride: stride of osd
>    * @palette: Address of palette memory, or 0 if none.
>    * @has_prtcon: Set if has PRTCON register.
>    * @has_shadowcon: Set if has SHADOWCON register.
> @@ -155,7 +156,7 @@ struct s3c_fb_palette {
>    * @windata: The platform data supplied for the window configuration.=

>    * @parent: The hardware that this window is part of.
>    * @fbinfo: Pointer pack to the framebuffer info for this window.
> - * @varint: The variant information for this window.
> + * @variant: The variant information for this window.
>    * @palette_buffer: Buffer/cache to hold palette entries.
>    * @pseudo_palette: For use in TRUECOLOUR modes for entries 0..15/
>    * @index: The window number of this window.
> @@ -336,7 +337,7 @@ static int s3c_fb_check_var(struct fb_var_screeninf=
o *var,
>   /**
>    * s3c_fb_calc_pixclk() - calculate the divider to create the pixel c=
lock.
>    * @sfb: The hardware state.
> - * @pixclock: The pixel clock wanted, in picoseconds.
> + * @pixclk: The pixel clock wanted, in picoseconds.
>    *
>    * Given the specified pixel clock, work out the necessary divider to=
 get
>    * close to the output frequency.
> @@ -733,7 +734,7 @@ static inline unsigned int chan_to_field(unsigned i=
nt chan,
>    * @red: The red field for the palette data.
>    * @green: The green field for the palette data.
>    * @blue: The blue field for the palette data.
> - * @trans: The transparency (alpha) field for the palette data.
> + * @transp: The transparency (alpha) field for the palette data.
>    * @info: The framebuffer being changed.
>    */
>   static int s3c_fb_setcolreg(unsigned regno,
> @@ -1133,6 +1134,7 @@ static void s3c_fb_free_memory(struct s3c_fb *sfb=
, struct s3c_fb_win *win)
>  =20
>   /**
>    * s3c_fb_release_win() - release resources for a framebuffer window.=

> + * @sfb: The base resources for the hardware.
>    * @win: The window to cleanup the resources for.
>    *
>    * Release the resources that where claimed for the hardware window,
> @@ -1160,6 +1162,7 @@ static void s3c_fb_release_win(struct s3c_fb *sfb=
, struct s3c_fb_win *win)
>   /**
>    * s3c_fb_probe_win() - register an hardware window
>    * @sfb: The base resources for the hardware
> + * @win_no: The window number
>    * @variant: The variant information for this window.
>    * @res: Pointer to where to place the resultant window.
>    *
> @@ -1170,7 +1173,6 @@ static int s3c_fb_probe_win(struct s3c_fb *sfb, u=
nsigned int win_no,
>   			    struct s3c_fb_win_variant *variant,
>   			    struct s3c_fb_win **res)
>   {
> -	struct fb_var_screeninfo *var;
>   	struct fb_videomode initmode;
>   	struct s3c_fb_pd_win *windata;
>   	struct s3c_fb_win *win;
> @@ -1198,7 +1200,6 @@ static int s3c_fb_probe_win(struct s3c_fb *sfb, u=
nsigned int win_no,
>  =20
>   	win =3D fbinfo->par;
>   	*res =3D win;
> -	var =3D &fbinfo->var;
>   	win->variant =3D *variant;
>   	win->fbinfo =3D fbinfo;
>   	win->parent =3D sfb;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VbDxIgoYD1S4Jx1DvhWtWyNFkb3adOprj--

--2b343QpF7KyWmUh47zzQru9m7w2Q4YX4B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GFeAFAwAAAAAACgkQlh/E3EQov+Aq
ig/+KJl6GpqHRxAtU2RJirxoHPD3N7+vgiCqdgYliR2fZfeTm3qnkZS4hKPhpcsyqb5YcOiqvIj+
DV84v+ruQ9t3MKl7ie7h/dzraQD7mBBdjwsINCq4yrzsE+Ai6m1u5lkQ4wp4/tttIMjJ6GKhTPJB
Olx6V9Vh3pM/76+v8ieD59ePRl6uVREMLmzw/UV8Dca/WW3nr02k/s87GkFpi/MROSCKUYk1tWwe
oQ19GW0NcRGxFhX9syl6z7ZUZDPRaWzKIo7KE0IS1Vqz91ORs3pOQiMY0wUIZY6nT9mUGerulNn8
iM/aSN2xQ/S2RL+PDkS9R8V2q1VEtF8TKCutCjukFPTn958Wb/YlY4ac59EbMZXQrNRXszIYr+So
E4OpzCXA5JpdnLCVcTMMCRuLxO9jzM5AJ/apInruGI7iPtBWGpNFgrvwhVG+YUj/PNEYGAtu7wRH
GyKvBYuj4L3mxqu5VF0I1kAJ0pfBZLqsK6LeiAC+7RkYWG8ox14exQrVMZqb4LCLHfj99Nv7dFtZ
ItH+e1dLVv7oIEiq5qTVppfFcvNtM6Hvpr7C4uYjHBWUF3T0k0kdyhsAl3Z5FdWFx2rM4+31HDan
wHcdkcX41laTpUbEk8czKhdANbI5oMLheODBT4kUPxDm+nEk5J2xPyf75aUsT4JOLdrN7ObaKPsI
pcA=
=zr66
-----END PGP SIGNATURE-----

--2b343QpF7KyWmUh47zzQru9m7w2Q4YX4B--

--===============0634494913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0634494913==--
