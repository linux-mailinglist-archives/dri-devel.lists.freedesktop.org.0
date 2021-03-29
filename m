Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D446A34CCD8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 11:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE40389811;
	Mon, 29 Mar 2021 09:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAB689811
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 09:17:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 860C4B3C6;
 Mon, 29 Mar 2021 09:17:28 +0000 (UTC)
Subject: Re: [PATCH V3] drm/ast: Disable fast reset after DRAM initial
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <HK2PR06MB330087DBCD724A93EBACC17C8CA10@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <20210319092340.140267-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b0e960ee-b987-69f7-13fd-0270c347ad5e@suse.de>
Date: Mon, 29 Mar 2021 11:17:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319092340.140267-1-kuohsiang_chou@aspeedtech.com>
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
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0505584215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0505584215==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yk9xlNx6TU4Iu7vesAK8wsRioi6pXzEAq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yk9xlNx6TU4Iu7vesAK8wsRioi6pXzEAq
Content-Type: multipart/mixed; boundary="msd3iyUwJkOq6UTHwOp6BWT39SVHcClwd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Message-ID: <b0e960ee-b987-69f7-13fd-0270c347ad5e@suse.de>
Subject: Re: [PATCH V3] drm/ast: Disable fast reset after DRAM initial
References: <HK2PR06MB330087DBCD724A93EBACC17C8CA10@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <20210319092340.140267-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210319092340.140267-1-kuohsiang_chou@aspeedtech.com>

--msd3iyUwJkOq6UTHwOp6BWT39SVHcClwd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I cannot apply this patch. The error is shown below. Which tree do you=20
use? Can you please move to drm-misc-next?

Applying: drm/ast: Disable fast reset after DRAM initial
error: sha1 information is lacking or useless=20
(drivers/gpu/drm/ast/ast_drv.h).
error: could not build fake ancestor
Patch failed at 0001 drm/ast: Disable fast reset after DRAM initial
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
dim: ERROR: git apply-mbox failed

Best regards
Thomas


Am 19.03.21 um 10:23 schrieb KuoHsiang Chou:
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
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c |  5 +++
>   drivers/gpu/drm/ast/ast_post.c | 68 +++++++++++++++++++++------------=
-
>   3 files changed, 48 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index da6dfb677540..a2cf5fef2399 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -320,6 +320,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);
>   void ast_post_gpu(struct drm_device *dev);
>   u32 ast_mindwm(struct ast_private *ast, u32 r);
>   void ast_moutdwm(struct ast_private *ast, u32 r, u32 v);
> +void ast_patch_ahb_2500(struct ast_private *ast);
>   /* ast dp501 */
>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 3775fe26f792..0e4dfcc25623 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -69,6 +69,7 @@ static void ast_detect_config_mode(struct drm_device =
*dev, u32 *scu_rev)
>   {
>   	struct device_node *np =3D dev->pdev->dev.of_node;
>   	struct ast_private *ast =3D to_ast_private(dev);
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	uint32_t data, jregd0, jregd1;
>=20
>   	/* Defaults */
> @@ -96,6 +97,10 @@ static void ast_detect_config_mode(struct drm_device=
 *dev, u32 *scu_rev)
>   	jregd0 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff)=
;
>   	jregd1 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff)=
;
>   	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> +		/* Patch AST2500 */
> +		if (((pdev->revision & 0xF0) =3D=3D 0x40) && ((jregd0 & 0xC0) =3D=3D=
 0))
> +			ast_patch_ahb_2500(ast);
> +
>   		/* Double check it's actually working */
>   		data =3D ast_read32(ast, 0xf004);
>   		if (data !=3D 0xFFFFFFFF) {
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_p=
ost.c
> index 8902c2f84bf9..4f194c5fd2c2 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2026,6 +2026,30 @@ static bool ast_dram_init_2500(struct ast_privat=
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
> +
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
> @@ -2033,39 +2057,31 @@ void ast_post_chip_2500(struct drm_device *dev)=

>   	u8 reg;
>=20
>   	reg =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
> -	if ((reg & 0x80) =3D=3D 0) {/* vga only */
> +	if ((reg & 0xC0) =3D=3D 0) {/* vga only */
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
> +		/* Reset USB port */
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--msd3iyUwJkOq6UTHwOp6BWT39SVHcClwd--

--yk9xlNx6TU4Iu7vesAK8wsRioi6pXzEAq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBhmycFAwAAAAAACgkQlh/E3EQov+Ap
Uw/+Ku+I5ZMkf134wcXjzEfhhRPZFnF/t0syp/H2xkjFh/7h1cv54OuvcZCKwBPNd9Aq15fCxnrt
guVDXe/8LUjFL4AGcUdtPIKisAcZE1no7Jrx9Q3BKRR6xmis2hnrtrInpRpUbHp8bVXds6z3zZQY
BlC+pRp10VMzB23ONztINU67/50fwcSAqozoVsY1kKOV314IM+N00qgVCvK/lEKjd/2CQo4+pVKx
DXqgxhjXIxonTUpFMnKhUzu9waEFy+pzA8SeJDhyJ2HdkL9vC5c2czuitCF/MI03Ug0BYwbY9YwE
MtdSc6lrHbc6P0DL/S1FMBv+exMc4HMAtXJwPCS5TeMZGhYCX4fFK0Ex8g9rDeF7Dk8ypCSR8B9d
DR5N7IlMdUMIsuFEGP/WpJUykLyc0fmpTbPv5Z8EdlKIeg1dKQbxKBOgkDC4UNdQ8wB0Tl/p0fH4
puaYRXm6G7W2MMsJ4f4oFOMfoO8dXozUO8aHbK6DIOGZoeqK/KklfolpGD0TE7oYE2dSKlFXijAh
PwyAOWOLXHBFf2/ZaMCzmNPLhBH/5ofcuKq1HAVdkeaf+c4jLRNpvxmwp8ekTlt30x9Ss9nZb6cJ
G+c9RGWAbTPaTbJMmQmDcFOPgt3hwRX0GTbUYKV+3hZC8GJ2CY6jMASiqxt2AzQ6z432h3ojLWpc
pIw=
=u8gq
-----END PGP SIGNATURE-----

--yk9xlNx6TU4Iu7vesAK8wsRioi6pXzEAq--

--===============0505584215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0505584215==--
