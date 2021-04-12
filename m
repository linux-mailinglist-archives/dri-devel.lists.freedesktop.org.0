Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B835BB20
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 09:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621BE6E1FB;
	Mon, 12 Apr 2021 07:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C1F6E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 07:45:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBACCAEB9;
 Mon, 12 Apr 2021 07:45:37 +0000 (UTC)
Subject: Re: [PATCH v4] drm/ast: Fixed CVE for DP501
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210408093052.59782-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <214f1451-2406-b298-e233-4939cae9e1f2@suse.de>
Date: Mon, 12 Apr 2021 09:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408093052.59782-1-kuohsiang_chou@aspeedtech.com>
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
Content-Type: multipart/mixed; boundary="===============0898604977=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0898604977==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VcnD2jwTmNdIUU9f48otbblbxpMAsl7LO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VcnD2jwTmNdIUU9f48otbblbxpMAsl7LO
Content-Type: multipart/mixed; boundary="Zx9eX0PKvZJRIWFLspJrX21tGjobRKaVy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com
Message-ID: <214f1451-2406-b298-e233-4939cae9e1f2@suse.de>
Subject: Re: [PATCH v4] drm/ast: Fixed CVE for DP501
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210408093052.59782-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210408093052.59782-1-kuohsiang_chou@aspeedtech.com>

--Zx9eX0PKvZJRIWFLspJrX21tGjobRKaVy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

this patch produces a NULL-ptr deref as shown below. The chip is=20
detected as AST 2100.

Best regards
Thomas

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[   23.641896] BUG: KASAN: null-ptr-deref in=20
ast_device_create.cold+0x137/0x210 [ast]

[   23.642257] Read of size 8 at addr 0000000000000610 by task=20
systemd-udevd/321

[   23.642539]

[   23.642696] CPU: 2 PID: 321 Comm: systemd-udevd Tainted: G=20
  E     5.12.0-rc6-1-default+ #876

[   23.643064] Hardware name: Sun Microsystems SUN FIRE X2270 M2/SUN=20
FIRE X2270 M2, BIOS 2.05    07/01/2010

[   23.643432] Call Trace:

[   23.643622]  ? ast_device_create.cold+0x137/0x210 [ast]

[   23.643898]  dump_stack+0xa5/0xdc

[   23.644119]  kasan_report.cold+0x50/0x55

[   23.644363]  ? ast_device_create.cold+0x137/0x210 [ast]

[   23.644657]  ast_device_create.cold+0x137/0x210 [ast]

[   23.644926]  ? devres_get+0xe5/0x160

[   23.645152]  ? ast_detect_chip.isra.0+0x110/0x110 [ast]

[   23.645474]  ast_pci_probe+0x4c/0x90 [ast]

[   23.645734]  ? ast_kick_out_firmware_fb+0xd0/0xd0 [ast]

[   23.646003]  local_pci_probe+0x74/0xc0

[   23.646249]  pci_call_probe+0xb7/0x1d0

[   23.646473]  ? pci_pm_suspend_noirq+0x440/0x440

[   23.646773]  pci_device_probe+0x102/0x140

[   23.646998]  ? driver_sysfs_add+0xe2/0x150

[   23.647245]  really_probe+0x185/0x6c0

[   23.647506]  driver_probe_device+0x13f/0x1d0

[   23.647762]  device_driver_attach+0x114/0x120

[   23.648010]  ? device_driver_attach+0x120/0x120

[   23.648254]  __driver_attach+0xb0/0x1a0

[   23.648497]  ? device_driver_attach+0x120/0x120

[   23.648739]  bus_for_each_dev+0xdd/0x120

[   23.648971]  ? subsys_dev_iter_exit+0x10/0x10

[   23.649256]  bus_add_driver+0x1fb/0x2e0

[   23.649514]  driver_register+0x10f/0x190

[   23.649752]  ? 0xffffffffc05fd000

[   23.649971]  do_one_initcall+0xbb/0x3a0

[   23.650206]  ? trace_event_raw_event_initcall_finish+0x120/0x120

[   23.650485]  ? mark_held_locks+0x23/0x90

[   23.650718]  ? lock_is_held_type+0xe5/0x110

[   23.650982]  ? rcu_read_lock_sched_held+0x3f/0x80

[   23.651223]  ? kasan_unpoison+0x21/0x50

[   23.651483]  do_init_module+0xfd/0x3c0

[   23.651720]  load_module+0xcf2/0xd70

[   23.651909]  ? layout_and_allocate+0x260/0x260

[   23.652082]  ? seccomp_run_filters+0x97/0x1d0

[   23.652309]  ? kernel_read_file_from_fd+0x4b/0x90

[   23.652584]  __do_sys_finit_module+0xff/0x180

[   23.652824]  ? __ia32_sys_init_module+0x40/0x40

[   23.653198]  ? syscall_trace_enter.constprop.0+0x99/0x240

[   23.653477]  do_syscall_64+0x33/0x80

[   23.653693]  entry_SYSCALL_64_after_hwframe+0x44/0xae

[   23.653934] RIP: 0033:0x7f793ecc23dd

[   23.654147] Code: c2 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa=20
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f=20
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 63 7a 0c 00 f7 d8 64 89 01 48

[   23.654749] RSP: 002b:00007ffdc09a08c8 EFLAGS: 00000246 ORIG_RAX:=20
0000000000000139

[   23.655092] RAX: ffffffffffffffda RBX: 000055e8dd73b8d0 RCX:=20
00007f793ecc23dd

[   23.655375] RDX: 0000000000000000 RSI: 00007f793ede33a3 RDI:=20
0000000000000010

[   23.655658] RBP: 0000000000020000 R08: 0000000000000000 R09:=20
000055e8dd746750

[   23.655941] R10: 0000000000000010 R11: 0000000000000246 R12:=20
00007f793ede33a3

[   23.656224] R13: 000055e8dd743ff0 R14: 0000000000000000 R15:=20
000055e8dd746a80

[   23.656603]=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



Am 08.04.21 um 11:30 schrieb KuoHsiang Chou:
> [Bug][DP501]
> If ASPEED P2A (PCI to AHB) bridge is disabled and disallowed for
> CVE_2019_6260 item3, and then the monitor's EDID is unable read through=

> Parade DP501.
> The reason is the DP501's FW is mapped to BMC addressing space rather
> than Host addressing space.
> The resolution is that using "pci_iomap_range()" maps to DP501's FW tha=
t
> stored on the end of FB (Frame Buffer).
> In this case, FrameBuffer reserves the last 2MB used for the image of
> DP501.
>=20
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 139 +++++++++++++++++++++++--------=
-
>   drivers/gpu/drm/ast/ast_drv.h   |  12 +++
>   drivers/gpu/drm/ast/ast_main.c  |   8 ++
>   3 files changed, 123 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_=
dp501.c
> index 88121c0e0..cd93c44f2 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -189,6 +189,9 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr=
, u32 size)
>   	u32 i, data;
>   	u32 boot_address;
>=20
> +	if (ast->config_mode !=3D ast_use_p2a)
> +		return false;
> +
>   	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>   	if (data) {
>   		boot_address =3D get_fw_base(ast);
> @@ -207,6 +210,9 @@ static bool ast_launch_m68k(struct drm_device *dev)=

>   	u8 *fw_addr =3D NULL;
>   	u8 jreg;
>=20
> +	if (ast->config_mode !=3D ast_use_p2a)
> +		return false;
> +
>   	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>   	if (!data) {
>=20
> @@ -271,25 +277,55 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
>   	struct ast_private *ast =3D to_ast_private(dev);
>   	u32 boot_address, offset, data;
>   	u8 linkcap[4], linkrate, linklanes, maxclk =3D 0xff;
> +	u32 *plinkcap;
>=20
> -	boot_address =3D get_fw_base(ast);
> -
> -	/* validate FW version */
> -	offset =3D 0xf000;
> -	data =3D ast_mindwm(ast, boot_address + offset);
> -	if ((data & 0xf0) !=3D 0x10) /* version: 1x */
> -		return maxclk;
> -
> -	/* Read Link Capability */
> -	offset  =3D 0xf014;
> -	*(u32 *)linkcap =3D ast_mindwm(ast, boot_address + offset);
> -	if (linkcap[2] =3D=3D 0) {
> -		linkrate =3D linkcap[0];
> -		linklanes =3D linkcap[1];
> -		data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklanes=
);
> -		if (data > 0xff)
> -			data =3D 0xff;
> -		maxclk =3D (u8)data;
> +	if (ast->config_mode =3D=3D ast_use_p2a) {
> +		boot_address =3D get_fw_base(ast);
> +
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1) =
/* version: 1x */
> +			return maxclk;
> +
> +		/* Read Link Capability */
> +		offset  =3D AST_DP501_LINKRATE;
> +		plinkcap =3D (u32 *)linkcap;
> +		*plinkcap  =3D ast_mindwm(ast, boot_address + offset);
> +		if (linkcap[2] =3D=3D 0) {
> +			linkrate =3D linkcap[0];
> +			linklanes =3D linkcap[1];
> +			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklane=
s);
> +			if (data > 0xff)
> +				data =3D 0xff;
> +			maxclk =3D (u8)data;
> +		}
> +	} else {
> +		if (!ast->dp501_fw_buf)
> +			return AST_DP501_DEFAULT_DCLK;	/* 1024x768 as default */
> +
> +		/* dummy read */
> +		offset =3D 0x0000;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1) =
/* version: 1x */
> +			return maxclk;
> +
> +		/* Read Link Capability */
> +		offset =3D AST_DP501_LINKRATE;
> +		plinkcap =3D (u32 *)linkcap;
> +		*plinkcap =3D readl(ast->dp501_fw_buf + offset);
> +		if (linkcap[2] =3D=3D 0) {
> +			linkrate =3D linkcap[0];
> +			linklanes =3D linkcap[1];
> +			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklane=
s);
> +			if (data > 0xff)
> +				data =3D 0xff;
> +			maxclk =3D (u8)data;
> +		}
>   	}
>   	return maxclk;
>   }
> @@ -298,26 +334,57 @@ bool ast_dp501_read_edid(struct drm_device *dev, =
u8 *ediddata)
>   {
>   	struct ast_private *ast =3D to_ast_private(dev);
>   	u32 i, boot_address, offset, data;
> +	u32 *pEDIDidx;
>=20
> -	boot_address =3D get_fw_base(ast);
> -
> -	/* validate FW version */
> -	offset =3D 0xf000;
> -	data =3D ast_mindwm(ast, boot_address + offset);
> -	if ((data & 0xf0) !=3D 0x10)
> -		return false;
> -
> -	/* validate PnP Monitor */
> -	offset =3D 0xf010;
> -	data =3D ast_mindwm(ast, boot_address + offset);
> -	if (!(data & 0x01))
> -		return false;
> +	if (ast->config_mode =3D=3D ast_use_p2a) {
> +		boot_address =3D get_fw_base(ast);
>=20
> -	/* Read EDID */
> -	offset =3D 0xf020;
> -	for (i =3D 0; i < 128; i +=3D 4) {
> -		data =3D ast_mindwm(ast, boot_address + offset + i);
> -		*(u32 *)(ediddata + i) =3D data;
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)
> +			return false;
> +
> +		/* validate PnP Monitor */
> +		offset =3D AST_DP501_PNPMONITOR;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if (!(data & AST_DP501_PNP_CONNECTED))
> +			return false;
> +
> +		/* Read EDID */
> +		offset =3D AST_DP501_EDID_DATA;
> +		for (i =3D 0; i < 128; i +=3D 4) {
> +			data =3D ast_mindwm(ast, boot_address + offset + i);
> +			pEDIDidx =3D (u32 *)(ediddata + i);
> +			*pEDIDidx =3D data;
> +		}
> +	} else {
> +		if (!ast->dp501_fw_buf)
> +			return false;
> +
> +		/* dummy read */
> +		offset =3D 0x0000;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)
> +			return false;
> +
> +		/* validate PnP Monitor */
> +		offset =3D AST_DP501_PNPMONITOR;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +		if (!(data & AST_DP501_PNP_CONNECTED))
> +			return false;
> +
> +		/* Read EDID */
> +		offset =3D AST_DP501_EDID_DATA;
> +		for (i =3D 0; i < 128; i +=3D 4) {
> +			data =3D readl(ast->dp501_fw_buf + offset + i);
> +			pEDIDidx =3D (u32 *)(ediddata + i);
> +			*pEDIDidx =3D data;
> +		}
>   	}
>=20
>   	return true;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index e82ab8628..911f9f414 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -150,6 +150,7 @@ struct ast_private {
>=20
>   	void __iomem *regs;
>   	void __iomem *ioregs;
> +	void __iomem *dp501_fw_buf;
>=20
>   	enum ast_chip chip;
>   	bool vga2_clone;
> @@ -325,6 +326,17 @@ int ast_mode_config_init(struct ast_private *ast);=

>   #define AST_MM_ALIGN_SHIFT 4
>   #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
>=20
> +#define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
> +#define AST_DP501_FW_VERSION_1		BIT(4)
> +#define AST_DP501_PNP_CONNECTED		BIT(1)
> +
> +#define AST_DP501_DEFAULT_DCLK	65
> +
> +#define AST_DP501_GBL_VERSION	0xf000
> +#define AST_DP501_PNPMONITOR	0xf010
> +#define AST_DP501_LINKRATE	0xf014
> +#define AST_DP501_EDID_DATA	0xf020
> +
>   int ast_mm_init(struct ast_private *ast);
>=20
>   /* ast post */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 0ac3c2039..dbf5224ab 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -450,6 +450,14 @@ struct ast_private *ast_device_create(const struct=20
drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>=20
> +	/* map reserved buffer */
> +	ast->dp501_fw_buf =3D NULL;
> +	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
> +		ast->dp501_fw_buf =3D pci_iomap_range(dev->pdev, 0, dev->vram_mm->vr=
am_size, 0);
> +		if (!ast->dp501_fw_buf)
> +			drm_info(dev, "failed to map reserved buffer!\n");
> +	}
> +
>   	ret =3D ast_mode_config_init(ast);
>   	if (ret)
>   		return ERR_PTR(ret);
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


--Zx9eX0PKvZJRIWFLspJrX21tGjobRKaVy--

--VcnD2jwTmNdIUU9f48otbblbxpMAsl7LO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBz+qAFAwAAAAAACgkQlh/E3EQov+Cp
CA/3WpfOyy5hn4kAUyVPxODLYdiP/ePAhnQqhWXRWztJJsixqO4ffy55D9KfybZDIBdNTXdBqfRe
S3MLfKPR27Qt5eMo+R+HqVrt1ia8o8TpbmwzmGCzOsaxkoHLQ7B8gQZ7BLUHdnrcAp6RobbTq+ox
j8Fku+nF8+/OXB398VPVVhwhBIt7EZf3mU84+qX0gDW+oHkVmakGYtgyvp7rr/qGDTYhE27fKsJP
7JfSJw5GOIe51OAcF4kVfH7AOIT8L6Irzh6sQO7OJwEuPnaVlV0w82obnryOvUgY7rIMsIyF/BNX
m2Sdum51JcccP3n8EnQWeXWHXyKK3pPN/bx11faSkjreqzHq5oHt5r2RWV1VvI8aj9C8KRz12YuB
3YVDsHyzSL8aGlKpJnd8RmUumEhGEPbufXLH/uyOCtXnewfHdx4X+t9CtTW4PqbSB1VITJzE/x/h
0XChq7/CU1VkaapcGoRkAbU/QXg2kDMCYc1GaWcAtuiIp46R2W5fPSKrfEIVjxzz2uyMl+nFME82
dGBRxUaCVO8OPC+1uHxkNYnV35C/B3swHr2q3Xoi593yh7QKoDrXDqeppUMv0zqJhmKUjz/NN//E
khBe+c+G14XPFDcBMmUZglMIzrxoU7oTSgCWunGKFzLZUGgPcfecqSskD0sIjV6pXlFmFn9k8qlT
4w==
=+qyz
-----END PGP SIGNATURE-----

--VcnD2jwTmNdIUU9f48otbblbxpMAsl7LO--

--===============0898604977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0898604977==--
