Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBD2C804F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1DE6E43C;
	Mon, 30 Nov 2020 08:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE56E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:53:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77609AD89;
 Mon, 30 Nov 2020 08:53:58 +0000 (UTC)
Subject: Re: [PATCH v2 05/28] video: fbdev: aty: Fix set but not used warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-6-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1dfb3ff0-3a78-32ab-185a-9fa153fef509@suse.de>
Date: Mon, 30 Nov 2020 09:53:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-6-sam@ravnborg.org>
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
 Alex Dewar <alex.dewar90@gmail.com>, kernel test robot <lkp@intel.com>,
 Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0296297640=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0296297640==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Fc6bhJP3OHLBzHkoOdKAuBMQpG9hcfr0l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Fc6bhJP3OHLBzHkoOdKAuBMQpG9hcfr0l
Content-Type: multipart/mixed; boundary="wtG298FvjFZRgnu8HzOqcXQuPOKirkm31";
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
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan
 <tanxiaofei@huawei.com>, kernel test robot <lkp@intel.com>
Message-ID: <1dfb3ff0-3a78-32ab-185a-9fa153fef509@suse.de>
Subject: Re: [PATCH v2 05/28] video: fbdev: aty: Fix set but not used warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-6-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-6-sam@ravnborg.org>

--wtG298FvjFZRgnu8HzOqcXQuPOKirkm31
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Fix W=3D1 warnings about variables assigned but never used.
>=20
> - Drop variables that was set but never used

s/that was/that were

> - Make variable definition conditional om ATARI

s/om/on

>=20
> v2:
>    - Fix m68k build error (kernel test robot)
>    - Improve subject (Lee Jones)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reported-by: kernel test robot <lkp@intel.com> # m68k build fix
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Joe Perches <joe@perches.com>
> Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Cc: Jason Yan <yanaijie@huawei.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jani Nikula <jani.nikula@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/aty/atyfb_base.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev=
/aty/atyfb_base.c
> index c8feff0ee8da..83c8e809955a 100644
> --- a/drivers/video/fbdev/aty/atyfb_base.c
> +++ b/drivers/video/fbdev/aty/atyfb_base.c
> @@ -2353,6 +2353,9 @@ static int aty_init(struct fb_info *info)
>   	int gtb_memsize, has_var =3D 0;
>   	struct fb_var_screeninfo var;
>   	int ret;
> +#ifdef CONFIG_ATARI
> +	u8 dac_type;
> +#endif
>  =20
>   	init_waitqueue_head(&par->vblank.wait);
>   	spin_lock_init(&par->int_lock);
> @@ -2360,13 +2363,12 @@ static int aty_init(struct fb_info *info)
>   #ifdef CONFIG_FB_ATY_GX
>   	if (!M64_HAS(INTEGRATED)) {
>   		u32 stat0;
> -		u8 dac_type, dac_subtype, clk_type;
> +		u8 dac_subtype, clk_type;
>   		stat0 =3D aty_ld_le32(CNFG_STAT0, par);
>   		par->bus_type =3D (stat0 >> 0) & 0x07;
>   		par->ram_type =3D (stat0 >> 3) & 0x07;
>   		ramname =3D aty_gx_ram[par->ram_type];
>   		/* FIXME: clockchip/RAMDAC probing? */
> -		dac_type =3D (aty_ld_le32(DAC_CNTL, par) >> 16) & 0x07;
>   #ifdef CONFIG_ATARI
>   		clk_type =3D CLK_ATI18818_1;
>   		dac_type =3D (stat0 >> 9) & 0x07;
> @@ -2375,7 +2377,6 @@ static int aty_init(struct fb_info *info)
>   		else
>   			dac_subtype =3D (aty_ld_8(SCRATCH_REG1 + 1, par) & 0xF0) | dac_typ=
e;
>   #else
> -		dac_type =3D DAC_IBMRGB514;
>   		dac_subtype =3D DAC_IBMRGB514;
>   		clk_type =3D CLK_IBMRGB514;
>   #endif
> @@ -3062,7 +3063,6 @@ static int atyfb_setup_sparc(struct pci_dev *pdev=
, struct fb_info *info,
>   	if (dp =3D=3D of_console_device) {
>   		struct fb_var_screeninfo *var =3D &default_var;
>   		unsigned int N, P, Q, M, T, R;
> -		u32 v_total, h_total;
>   		struct crtc crtc;
>   		u8 pll_regs[16];
>   		u8 clock_cntl;
> @@ -3078,9 +3078,6 @@ static int atyfb_setup_sparc(struct pci_dev *pdev=
, struct fb_info *info,
>   		crtc.gen_cntl =3D aty_ld_le32(CRTC_GEN_CNTL, par);
>   		aty_crtc_to_var(&crtc, var);
>  =20
> -		h_total =3D var->xres + var->right_margin + var->hsync_len + var->le=
ft_margin;
> -		v_total =3D var->yres + var->lower_margin + var->vsync_len + var->up=
per_margin;
> -
>   		/*
>   		 * Read the PLL to figure actual Refresh Rate.
>   		 */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--wtG298FvjFZRgnu8HzOqcXQuPOKirkm31--

--Fc6bhJP3OHLBzHkoOdKAuBMQpG9hcfr0l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/EsyMFAwAAAAAACgkQlh/E3EQov+Bm
MBAAkkT7OShMpStu3R/a5IsU2f/FhH0jPewXG+mIf6WoBzYYJbazVKC6bgsPNRpK8j+e5in747SS
UP2q/xiR8gD/mFnXmFVpQjO36o4kk9UAMjiTWPOR6cBR+RttIHMG407vcWYi5AZxHgxH+wDbh9Gp
KwG1av0uk5bwH6n/2ErH/T1Ua8asM1yaN5rDKbpO3CK1QTw1OP/6sQEBWou4j3oJ31tpffuCQHuw
zM/PpWIWKVdpNWr5w7SDkYYzmUROftIyH9QrpbzeDIToMiCcOFC/TcdoNw9ZKnFlPzOhQBF2FJ3i
axIPzyrrmQsIDMwjTETtTCa3fIVoJ9tQGrn4nRiBrWe6VLLVlV9aorAwGXeg/FcJoTMKAB8Fd4tT
UPdPQvo+/jeB2E4ZDziIms+s360ytncp847tPTEnMRmSSA5+RD3XH1rxmSEIPjoxU9J48sUD9qCw
W/cWF07f6IfpYI4ArzKVUJavv8EU5AgkTfC+D5e1tULTDLbzmChKUxcvrX8wWwgV20ODubXSi5Er
ztHb8AZ/Lkk9Cjyu+EspQyhv7ciMIZLaA3HJiphttXFrNMJaYqNkIoU3DwPsT/q4+4mMO8wvL63E
UasanLTF51jLGuInzkdfCaWIPVIEpZ2jHaH8WjEKzOKUqTLYrcsW71keE2TvFgwpol4mmMu2/bs9
dd4=
=WF05
-----END PGP SIGNATURE-----

--Fc6bhJP3OHLBzHkoOdKAuBMQpG9hcfr0l--

--===============0296297640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0296297640==--
