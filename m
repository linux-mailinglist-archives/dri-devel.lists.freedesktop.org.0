Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA73B155A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321C26E834;
	Wed, 23 Jun 2021 08:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1CF6E834
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:03:00 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56F4E1FD36;
 Wed, 23 Jun 2021 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624435379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZoLo96NVn68t1HfWFgLxX9DAUowVpJaq/Y9F+uTYw4=;
 b=LLjSoBpCalHQifNpbFXjt/5QRx39qegVwdm5OKWus5dn64Wnvu0GkuRaIQqeoHalm9WX+j
 4f3IdBEoy9Ap2QC/ENhI0QM6kBwEXMxaqB0xhCnMsKMz7eu1AZx1iov8sxq5WMiL9mvC6E
 HRl0NhmZm6QqEYIXL47QYthcOLmbecI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624435379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZoLo96NVn68t1HfWFgLxX9DAUowVpJaq/Y9F+uTYw4=;
 b=5g8pwWUndxKwE3uPBmJx116JuqN9soSHA826J17wt+y7//WsdGTsOwkmeD+595UfAUWHEV
 EDrmvC0KLeIJccDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2680611A97;
 Wed, 23 Jun 2021 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624435379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZoLo96NVn68t1HfWFgLxX9DAUowVpJaq/Y9F+uTYw4=;
 b=LLjSoBpCalHQifNpbFXjt/5QRx39qegVwdm5OKWus5dn64Wnvu0GkuRaIQqeoHalm9WX+j
 4f3IdBEoy9Ap2QC/ENhI0QM6kBwEXMxaqB0xhCnMsKMz7eu1AZx1iov8sxq5WMiL9mvC6E
 HRl0NhmZm6QqEYIXL47QYthcOLmbecI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624435379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZoLo96NVn68t1HfWFgLxX9DAUowVpJaq/Y9F+uTYw4=;
 b=5g8pwWUndxKwE3uPBmJx116JuqN9soSHA826J17wt+y7//WsdGTsOwkmeD+595UfAUWHEV
 EDrmvC0KLeIJccDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Vu0oCLPq0mCUDwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Jun 2021 08:02:59 +0000
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
Message-ID: <bb505d06-bf46-237c-ed2f-15e3f23ec338@suse.de>
Date: Wed, 23 Jun 2021 10:02:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XoCxvESSzGROz96aYRgLc4sMrIB5s8baV"
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
Cc: airlied@linux.ie, airlied@redhat.com, jenmin_yuan@aspeedtech.com,
 arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XoCxvESSzGROz96aYRgLc4sMrIB5s8baV
Content-Type: multipart/mixed; boundary="dK607Pj6UoSX1Io7cPHv2ETyMyVM3gZqY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com
Message-ID: <bb505d06-bf46-237c-ed2f-15e3f23ec338@suse.de>
Subject: Re: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>

--dK607Pj6UoSX1Io7cPHv2ETyMyVM3gZqY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

here's the review that you've been waiting for. Sorry for taking so long.=


Am 07.05.21 um 11:27 schrieb KuoHsiang Chou:
> [Bug][AST2500]
>=20
> V1:
> When AST2500 acts as stand-alone VGA so that DRAM and DVO initializatio=
n
> have to be achieved by VGA driver with P2A (PCI to AHB) enabling.
> However, HW suggests disable Fast reset mode after DRAM initializaton,
> because fast reset mode is mainly designed for ARM ICE debugger.
> Once Fast reset is checked as enabling, WDT (Watch Dog Timer) should be=

> first enabled to avoid system deadlock before disable fast reset mode.
>=20
> V2:
> Use to_pci_dev() to get revision of PCI configuration.
>=20
> V3:
> If SCU00 is not unlocked, just enter its password again.
> It is unnecessary to clear AHB lock condition and restore WDT default
> setting again, before Fast-reset clearing.
>=20
> V4:
> repatch after "error : could not build fake ancestor" resolved.
>=20
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c |  4 ++
>   drivers/gpu/drm/ast/ast_post.c | 68 +++++++++++++++++++++------------=
-
>   3 files changed, 47 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index 911f9f414..5ebb5905d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -346,6 +346,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);
>   void ast_post_gpu(struct drm_device *dev);
>   u32 ast_mindwm(struct ast_private *ast, u32 r);
>   void ast_moutdwm(struct ast_private *ast, u32 r, u32 v);
> +void ast_patch_ahb_2500(struct ast_private *ast);
>   /* ast dp501 */
>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 2aff2e6cf..cfb56ea3a 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -97,6 +97,10 @@ static void ast_detect_config_mode(struct drm_device=
 *dev, u32 *scu_rev)
>   	jregd0 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff)=
;
>   	jregd1 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff)=
;
>   	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> +		/* Patch AST2500 */
> +		if (((pdev->revision & 0xF0) =3D=3D 0x40) && ((jregd0 & 0xC0) =3D=3D=
 0))

These magic numbers are hard to read. Is there any way of make it more=20
clear what we're testing for? Constants? Helper functions?

> +			ast_patch_ahb_2500(ast);
> +
>   		/* Double check it's actually working */
>   		data =3D ast_read32(ast, 0xf004);
>   		if ((data !=3D 0xFFFFFFFF) && (data !=3D 0x00)) {
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_p=
ost.c
> index 0607658dd..56428798a 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2028,6 +2028,30 @@ static bool ast_dram_init_2500(struct ast_privat=
e *ast)
>   	return true;
>   }
>=20
> +void ast_patch_ahb_2500(struct ast_private *ast)
> +{
> +	u32	data;

Only a single space after the type.

> +
> +	/* Clear bus lock condition */
> +	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
> +	ast_moutdwm(ast, 0x1e600084, 0x00010000);
> +	ast_moutdwm(ast, 0x1e600088, 0x00000000);
> +	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> +	data =3D ast_mindwm(ast, 0x1e6e2070);
> +	if (data & 0x08000000) {					/* check fast reset */
> +

No empty line here.

> +		ast_moutdwm(ast, 0x1E785004, 0x00000010);
> +		ast_moutdwm(ast, 0x1E785008, 0x00004755);
> +		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
> +		udelay(1000);
> +	}
> +	do {
> +		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> +		data =3D ast_mindwm(ast, 0x1e6e2000);
> +	}	while (data !=3D 1);
> +	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
> +}
> +
>   void ast_post_chip_2500(struct drm_device *dev)
>   {
>   	struct ast_private *ast =3D to_ast_private(dev);
> @@ -2035,39 +2059,31 @@ void ast_post_chip_2500(struct drm_device *dev)=

>   	u8 reg;
>=20
>   	reg =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
> -	if ((reg & 0x80) =3D=3D 0) {/* vga only */
> +	if ((reg & 0xC0) =3D=3D 0) {/* vga only */

Why this change?

>   		/* Clear bus lock condition */
> -		ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
> -		ast_moutdwm(ast, 0x1e600084, 0x00010000);
> -		ast_moutdwm(ast, 0x1e600088, 0x00000000);
> -		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> -		ast_write32(ast, 0xf004, 0x1e6e0000);
> -		ast_write32(ast, 0xf000, 0x1);
> -		ast_write32(ast, 0x12000, 0x1688a8a8);
> -		while (ast_read32(ast, 0x12000) !=3D 0x1)
> -			;
> -
> -		ast_write32(ast, 0x10000, 0xfc600309);
> -		while (ast_read32(ast, 0x10000) !=3D 0x1)
> -			;
> +		ast_patch_ahb_2500(ast);

You're calling this function here, but it's different from the old code.

> +
> +		/* Disable watchdog */
> +		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
> +		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
> +		/* Reset USB port */

Reset USB port? In the graphics driver?


The whole gpu post/init code is undecipherable to me. It's full of magic =

numbers that are nowhere documented.


Therefore, the overall problem with this patch is that I have no idea=20
what the actual bug fix is.
  Is it possible to first refactor that code a bit and then add a=20
minimal fix?

Best regards
Thomas



--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dK607Pj6UoSX1Io7cPHv2ETyMyVM3gZqY--

--XoCxvESSzGROz96aYRgLc4sMrIB5s8baV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDS6rIFAwAAAAAACgkQlh/E3EQov+AE
jg/+IjVJSMPLxj1McO4GIUHbojvxbCbNworeTaZxTRoa595IYR8hAwetni2MOSBX1s8gOOWyOO8e
vGJGzx+VBJK6zuKaclEQz4Hsy3jOWrEtAwmRfXnVynH4BJMUjTQIkRfUo+hu6R8dtHOHBCwR99n6
ff1YtWK2Ug3YC2ZjRRHUmRBP5QPGwWyYLMKg1jWbRDT/I/ETkWO7DyVJiVHHZAjZwiYkY/xDwzSI
SVr9CbpkkXe0bDkpN/0DihqAN6P9Plqa/oyqwj9B3xJYq2YsoY6jPKpHN75rgAikcvgvCr5eB7Jk
d3K1PWHgm3tBmB1UcCUfljoC+oakJwN/DFvBxGABVEa1jntLsnCch6m3W0hHb9rcKsAjTz5PA5HE
RscN/1IBtk/0ryB2haoNWjwF2WEiDOvtOQpxoK45C3LcDCU1wHw+qtunB8gyXPwsxqOZrtoLCcef
N9EU73nbgHGorEre1sLaEpSzvVitVwWl12usmDtz5t5ZsrQNf7sEuZ3APXhlsloMir0q/GrZ0Y4w
pAl5atIYxOFyLdVOTiQOyrFmFUUrDBb8j599ksPc/c8wMU9dvnCT3gT7qkVgb+tD6Xu9T2SzGydy
P5K8jQwmyXXP+u7E4hH9U6QeDyYtDTmJuFWo+V7d7dHpXdBG4Jw9+XLgS9Tze/MVFQ+KmZEdXKZQ
Khw=
=UWZk
-----END PGP SIGNATURE-----

--XoCxvESSzGROz96aYRgLc4sMrIB5s8baV--
