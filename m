Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E2F3CF650
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6CD8982C;
	Tue, 20 Jul 2021 08:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F198982C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 08:49:07 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C2C61FDD2;
 Tue, 20 Jul 2021 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626770946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ckXDEBMr/vTwtF9tFReHFwT0g6pVt1MIhPU40Yw3dQU=;
 b=ZQYRBNi2kHrCG0FzXXhIRIAOj9CC6ucRW82ykvqLaX1ctRNiYaCdZqnbuiziEUrYBbcdKE
 Sxqbuu/hM+5N7U75q6VIC0Lyq1zKx9OFTlOQMK9Fsd1U9Yp0D1mr3/Q//Q/gVgAEqIkB/I
 8Tz/fK9HKy+Xb81mBUu69sEoYAhF0CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626770946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ckXDEBMr/vTwtF9tFReHFwT0g6pVt1MIhPU40Yw3dQU=;
 b=aUEyZ1Kr8PiNTHOC+gZT1n6J4NBv/admustoqHsJBtuCjEcKSRwRiu5k/LjJn726xxqqln
 uNzQVpA+/ss7AJBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2112913A2E;
 Tue, 20 Jul 2021 08:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id oTSRBgKO9mD9DwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jul 2021 08:49:06 +0000
Subject: Re: [PATCH v5] drm/ast: Disable fast reset after DRAM initial
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <bb505d06-bf46-237c-ed2f-15e3f23ec338@suse.de>
 <20210709080900.4056-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <70dc7c57-c952-583c-6b41-08b2c79e709c@suse.de>
Date: Tue, 20 Jul 2021 10:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709080900.4056-1-kuohsiang_chou@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MGmyhMfBhk4EGwh57ubk0ZxyEPVGvNphD"
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
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MGmyhMfBhk4EGwh57ubk0ZxyEPVGvNphD
Content-Type: multipart/mixed; boundary="zvJbmwaJx4U0C7HouFHUu7u15GihqvSLy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, airlied@redhat.com,
 arc_sung@aspeedtech.com
Message-ID: <70dc7c57-c952-583c-6b41-08b2c79e709c@suse.de>
Subject: Re: [PATCH v5] drm/ast: Disable fast reset after DRAM initial
References: <bb505d06-bf46-237c-ed2f-15e3f23ec338@suse.de>
 <20210709080900.4056-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210709080900.4056-1-kuohsiang_chou@aspeedtech.com>

--zvJbmwaJx4U0C7HouFHUu7u15GihqvSLy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.07.21 um 10:09 schrieb KuoHsiang Chou:
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
> V5:
> Since CVE_2019_6260 item3, Most of AST2500 have disabled P2A(PCIe to AM=
BA).
> However, for backward compatibility, some patches about P2A, such as it=
ems
> of v5.2 and v5.3, are considered to be upstreamed with comments.
> 1. Add define macro to improve source readability.
> ast_drv.h, ast_main.c, ast_post.c
> 2. Add comment about "Fast restet" is enabled for ARM-ICE debugger
> ast_post.c
> 3. Add comment about Reset USB port to patch USB unknown device issue
> ast_post.c
>=20
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! I'll merge your patch into drm-misc-next.

Best regards
Thomas

> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  6 +++
>   drivers/gpu/drm/ast/ast_main.c |  5 ++
>   drivers/gpu/drm/ast/ast_post.c | 91 ++++++++++++++++++++++++---------=
-
>   3 files changed, 76 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index 911f9f414..39ca338eb 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -337,6 +337,11 @@ int ast_mode_config_init(struct ast_private *ast);=

>   #define AST_DP501_LINKRATE	0xf014
>   #define AST_DP501_EDID_DATA	0xf020
>=20
> +/* Define for Soc scratched reg */
> +#define AST_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
> +//#define AST_VRAM_INIT_BY_BMC		BIT(7)
> +//#define AST_VRAM_INIT_READY		BIT(6)
> +
>   int ast_mm_init(struct ast_private *ast);
>=20
>   /* ast post */
> @@ -346,6 +351,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);
>   void ast_post_gpu(struct drm_device *dev);
>   u32 ast_mindwm(struct ast_private *ast, u32 r);
>   void ast_moutdwm(struct ast_private *ast, u32 r, u32 v);
> +void ast_patch_ahb_2500(struct ast_private *ast);
>   /* ast dp501 */
>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 2aff2e6cf..79a361867 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -97,6 +97,11 @@ static void ast_detect_config_mode(struct drm_device=
 *dev, u32 *scu_rev)
>   	jregd0 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff)=
;
>   	jregd1 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff)=
;
>   	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> +		/* Patch AST2500 */
> +		if (((pdev->revision & 0xF0) =3D=3D 0x40)
> +			&& ((jregd0 & AST_VRAM_INIT_STATUS_MASK) =3D=3D 0))
> +			ast_patch_ahb_2500(ast);
> +
>   		/* Double check it's actually working */
>   		data =3D ast_read32(ast, 0xf004);
>   		if ((data !=3D 0xFFFFFFFF) && (data !=3D 0x00)) {
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_p=
ost.c
> index 0607658dd..b5d92f652 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2028,6 +2028,40 @@ static bool ast_dram_init_2500(struct ast_privat=
e *ast)
>   	return true;
>   }
>=20
> +void ast_patch_ahb_2500(struct ast_private *ast)
> +{
> +	u32	data;
> +
> +	/* Clear bus lock condition */
> +	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
> +	ast_moutdwm(ast, 0x1e600084, 0x00010000);
> +	ast_moutdwm(ast, 0x1e600088, 0x00000000);
> +	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> +	data =3D ast_mindwm(ast, 0x1e6e2070);
> +	if (data & 0x08000000) {					/* check fast reset */
> +		/*
> +		 * If "Fast restet" is enabled for ARM-ICE debugger,
> +		 * then WDT needs to enable, that
> +		 * WDT04 is WDT#1 Reload reg.
> +		 * WDT08 is WDT#1 counter restart reg to avoid system deadlock
> +		 * WDT0C is WDT#1 control reg
> +		 *	[6:5]:=3D 01:Full chip
> +		 *	[4]:=3D 1:1MHz clock source
> +		 *	[1]:=3D 1:WDT will be cleeared and disabled after timeout occurs
> +		 *	[0]:=3D 1:WDT enable
> +		 */
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
> @@ -2035,39 +2069,44 @@ void ast_post_chip_2500(struct drm_device *dev)=

>   	u8 reg;
>=20
>   	reg =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
> -	if ((reg & 0x80) =3D=3D 0) {/* vga only */
> +	if ((reg & AST_VRAM_INIT_STATUS_MASK) =3D=3D 0) {/* vga only */
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
> +
> +		/* Disable watchdog */
> +		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
> +		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
> +
> +		/*
> +		 * Reset USB port to patch USB unknown device issue
> +		 * SCU90 is Multi-function Pin Control #5
> +		 *	[29]:=3D 1:Enable USB2.0 Host port#1 (that the mutually shared US=
B2.0 Hub
> +		 *				port).
> +		 * SCU94 is Multi-function Pin Control #6
> +		 *	[14:13]:=3D 1x:USB2.0 Host2 controller
> +		 * SCU70 is Hardware Strap reg
> +		 *	[23]:=3D 1:CLKIN is 25MHz and USBCK1 =3D 24/48 MHz (determined by=

> +		 *				[18]: 0(24)/1(48) MHz)
> +		 * SCU7C is Write clear reg to SCU70
> +		 *	[23]:=3D write 1 and then SCU70[23] will be clear as 0b.
> +		 */
> +		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);
> +		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);
> +		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);
> +			mdelay(100);
> +			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);
> +		}
> +		/* Modify eSPI reset pin */
> +		temp =3D ast_mindwm(ast, 0x1E6E2070);
> +		if (temp & 0x02000000)
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);
>=20
>   		/* Slow down CPU/AHB CLK in VGA only mode */
>   		temp =3D ast_read32(ast, 0x12008);
>   		temp |=3D 0x73;
>   		ast_write32(ast, 0x12008, temp);
>=20
> -		/* Reset USB port to patch USB unknown device issue */
> -		ast_moutdwm(ast, 0x1e6e2090, 0x20000000);
> -		temp  =3D ast_mindwm(ast, 0x1e6e2094);
> -		temp |=3D 0x00004000;
> -		ast_moutdwm(ast, 0x1e6e2094, temp);
> -		temp  =3D ast_mindwm(ast, 0x1e6e2070);
> -		if (temp & 0x00800000) {
> -			ast_moutdwm(ast, 0x1e6e207c, 0x00800000);
> -			mdelay(100);
> -			ast_moutdwm(ast, 0x1e6e2070, 0x00800000);
> -		}
> -
>   		if (!ast_dram_init_2500(ast))
>   			drm_err(dev, "DRAM init failed !\n");
>=20
> --
> 2.18.4
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zvJbmwaJx4U0C7HouFHUu7u15GihqvSLy--

--MGmyhMfBhk4EGwh57ubk0ZxyEPVGvNphD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD2jgEFAwAAAAAACgkQlh/E3EQov+Ar
tA//SJ6qnoD57F+8ESIvLXtMfORLRBQOmi7xDstcH/zW2ZFzkj7c6zqayJ6MDWa074hsSmsoX5wH
70QylKIiCGbFGyTMVoiClyBFIv8G0hYajashBuGh+LOzRis1+SUcoFW0PW6kJTM70YXmor2H+MJy
xqBy7cxinlVuczLa0lak+Gw4Nz0XGng5RP/vjxKkAb7fLSttPrKbjPLlBCsKOrS8gVrKnbmKtz2a
8Pfq4yZsg/TxfVOnBW0xNe0+0r3em0amgV6QfDIpLYWb+2ar3gHOvpHwUj+/fAMEdl4R5Wv7vTgh
mjDNGmkjqz4FY8WdoHURPGJE05//wDVisKgHuS5RC1jmfxycyxOiJUMEQwusSlZkk92YKGRok41J
QhzovpeMOLDzVW/rL1WGrkQkl9ZdTIgbF5gOUWFfAofVSYXPV0ViM6T3RcQHrxy3P0sl23sdRlnz
ykFGxDYk6B8PXAwnO08UebcYwJf7bWGllBnaLKAmqilLctCq/iaI0fCmqnJMGdiWP2DamfnMuReZ
EkVfzw+p6hJ7TZobI2gFzMFBOXLruSnrOYmuikT63jmBVcocOGIWP38r359fQkZ580jjvmX6zrmv
PG72CkkQ5tYttw11b4NBM0VUcjQUgogHMifRNYjlw+TNKt4Pn8GXJPSzM+z7Nrswdz5XUBwt8wuo
0No=
=+dDF
-----END PGP SIGNATURE-----

--MGmyhMfBhk4EGwh57ubk0ZxyEPVGvNphD--
