Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46F2D2541
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6006E979;
	Tue,  8 Dec 2020 08:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D298B6E97F;
 Tue,  8 Dec 2020 08:00:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5310FAE12;
 Tue,  8 Dec 2020 08:00:04 +0000 (UTC)
Subject: Re: [PATCH v2 13/20] drm/nouveau: Remove references to struct
 drm_device.pdev
To: airlied@linux.ie, daniel@ffwll.ch
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-14-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b3b30b2f-d633-b6c2-93f5-26a4989a4d91@suse.de>
Date: Tue, 8 Dec 2020 09:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201103542.2182-14-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1332082891=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1332082891==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pbnTfPZAEC7VgKVpwIh5fcgd6TIECckLk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pbnTfPZAEC7VgKVpwIh5fcgd6TIECckLk
Content-Type: multipart/mixed; boundary="hIe2AHYR2zK6YPXw6Wr6jURzdtcXh5CCB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Message-ID: <b3b30b2f-d633-b6c2-93f5-26a4989a4d91@suse.de>
Subject: Re: [PATCH v2 13/20] drm/nouveau: Remove references to struct
 drm_device.pdev
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-14-tzimmermann@suse.de>
In-Reply-To: <20201201103542.2182-14-tzimmermann@suse.de>

--hIe2AHYR2zK6YPXw6Wr6jURzdtcXh5CCB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for a review of the nouveau patch

Am 01.12.20 um 11:35 schrieb Thomas Zimmermann:
> Using struct drm_device.pdev is deprecated. Convert nouveau to struct
> drm_device.dev. No functional changes.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/dispnv04/arb.c      | 12 +++++++-----
>   drivers/gpu/drm/nouveau/dispnv04/disp.h     | 14 ++++++++------
>   drivers/gpu/drm/nouveau/dispnv04/hw.c       | 10 ++++++----
>   drivers/gpu/drm/nouveau/nouveau_abi16.c     |  7 ++++---
>   drivers/gpu/drm/nouveau/nouveau_acpi.c      |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_bios.c      | 11 ++++++++---
>   drivers/gpu/drm/nouveau/nouveau_connector.c | 10 ++++++----
>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  5 ++---
>   drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  6 ++++--
>   drivers/gpu/drm/nouveau/nouveau_vga.c       | 20 ++++++++++++--------=

>   10 files changed, 58 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/n=
ouveau/dispnv04/arb.c
> index 9d4a2d97507e..1d3542d6006b 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> @@ -200,16 +200,17 @@ nv04_update_arb(struct drm_device *dev, int VClk,=
 int bpp,
>   	int MClk =3D nouveau_hw_get_clock(dev, PLL_MEMORY);
>   	int NVClk =3D nouveau_hw_get_clock(dev, PLL_CORE);
>   	uint32_t cfg1 =3D nvif_rd32(device, NV04_PFB_CFG1);
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>  =20
>   	sim_data.pclk_khz =3D VClk;
>   	sim_data.mclk_khz =3D MClk;
>   	sim_data.nvclk_khz =3D NVClk;
>   	sim_data.bpp =3D bpp;
>   	sim_data.two_heads =3D nv_two_heads(dev);
> -	if ((dev->pdev->device & 0xffff) =3D=3D 0x01a0 /*CHIPSET_NFORCE*/ ||
> -	    (dev->pdev->device & 0xffff) =3D=3D 0x01f0 /*CHIPSET_NFORCE2*/) {=

> +	if ((pdev->device & 0xffff) =3D=3D 0x01a0 /*CHIPSET_NFORCE*/ ||
> +	    (pdev->device & 0xffff) =3D=3D 0x01f0 /*CHIPSET_NFORCE2*/) {
>   		uint32_t type;
> -		int domain =3D pci_domain_nr(dev->pdev->bus);
> +		int domain =3D pci_domain_nr(pdev->bus);
>  =20
>   		pci_read_config_dword(pci_get_domain_bus_and_slot(domain, 0, 1),
>   				      0x7c, &type);
> @@ -251,11 +252,12 @@ void
>   nouveau_calc_arb(struct drm_device *dev, int vclk, int bpp, int *burs=
t, int *lwm)
>   {
>   	struct nouveau_drm *drm =3D nouveau_drm(dev);
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>  =20
>   	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_KELVIN)
>   		nv04_update_arb(dev, vclk, bpp, burst, lwm);
> -	else if ((dev->pdev->device & 0xfff0) =3D=3D 0x0240 /*CHIPSET_C51*/ |=
|
> -		 (dev->pdev->device & 0xfff0) =3D=3D 0x03d0 /*CHIPSET_C512*/) {
> +	else if ((pdev->device & 0xfff0) =3D=3D 0x0240 /*CHIPSET_C51*/ ||
> +		 (pdev->device & 0xfff0) =3D=3D 0x03d0 /*CHIPSET_C512*/) {
>   		*burst =3D 128;
>   		*lwm =3D 0x0480;
>   	} else
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/=
nouveau/dispnv04/disp.h
> index 5ace5e906949..f0a24126641a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
> @@ -130,7 +130,7 @@ static inline bool
>   nv_two_heads(struct drm_device *dev)
>   {
>   	struct nouveau_drm *drm =3D nouveau_drm(dev);
> -	const int impl =3D dev->pdev->device & 0x0ff0;
> +	const int impl =3D to_pci_dev(dev->dev)->device & 0x0ff0;
>  =20
>   	if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V0_CELSIUS &&=
 impl !=3D 0x0100 &&
>   	    impl !=3D 0x0150 && impl !=3D 0x01a0 && impl !=3D 0x0200)
> @@ -142,14 +142,14 @@ nv_two_heads(struct drm_device *dev)
>   static inline bool
>   nv_gf4_disp_arch(struct drm_device *dev)
>   {
> -	return nv_two_heads(dev) && (dev->pdev->device & 0x0ff0) !=3D 0x0110;=

> +	return nv_two_heads(dev) && (to_pci_dev(dev->dev)->device & 0x0ff0) !=
=3D 0x0110;
>   }
>  =20
>   static inline bool
>   nv_two_reg_pll(struct drm_device *dev)
>   {
>   	struct nouveau_drm *drm =3D nouveau_drm(dev);
> -	const int impl =3D dev->pdev->device & 0x0ff0;
> +	const int impl =3D to_pci_dev(dev->dev)->device & 0x0ff0;
>  =20
>   	if (impl =3D=3D 0x0310 || impl =3D=3D 0x0340 || drm->client.device.i=
nfo.family >=3D NV_DEVICE_INFO_V0_CURIE)
>   		return true;
> @@ -160,9 +160,11 @@ static inline bool
>   nv_match_device(struct drm_device *dev, unsigned device,
>   		unsigned sub_vendor, unsigned sub_device)
>   {
> -	return dev->pdev->device =3D=3D device &&
> -		dev->pdev->subsystem_vendor =3D=3D sub_vendor &&
> -		dev->pdev->subsystem_device =3D=3D sub_device;
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> +
> +	return pdev->device =3D=3D device &&
> +		pdev->subsystem_vendor =3D=3D sub_vendor &&
> +		pdev->subsystem_device =3D=3D sub_device;
>   }
>  =20
>   #include <subdev/bios/init.h>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/no=
uveau/dispnv04/hw.c
> index b674d68ef28a..f7d35657aa64 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
> @@ -214,14 +214,15 @@ nouveau_hw_pllvals_to_clk(struct nvkm_pll_vals *p=
v)
>   int
>   nouveau_hw_get_clock(struct drm_device *dev, enum nvbios_pll_type pll=
type)
>   {
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	struct nvkm_pll_vals pllvals;
>   	int ret;
>   	int domain;
>  =20
> -	domain =3D pci_domain_nr(dev->pdev->bus);
> +	domain =3D pci_domain_nr(pdev->bus);
>  =20
>   	if (plltype =3D=3D PLL_MEMORY &&
> -	    (dev->pdev->device & 0x0ff0) =3D=3D CHIPSET_NFORCE) {
> +	    (pdev->device & 0x0ff0) =3D=3D CHIPSET_NFORCE) {
>   		uint32_t mpllP;
>   		pci_read_config_dword(pci_get_domain_bus_and_slot(domain, 0, 3),
>   				      0x6c, &mpllP);
> @@ -232,7 +233,7 @@ nouveau_hw_get_clock(struct drm_device *dev, enum n=
vbios_pll_type plltype)
>   		return 400000 / mpllP;
>   	} else
>   	if (plltype =3D=3D PLL_MEMORY &&
> -	    (dev->pdev->device & 0xff0) =3D=3D CHIPSET_NFORCE2) {
> +	    (pdev->device & 0xff0) =3D=3D CHIPSET_NFORCE2) {
>   		uint32_t clock;
>  =20
>   		pci_read_config_dword(pci_get_domain_bus_and_slot(domain, 0, 5),
> @@ -309,6 +310,7 @@ void
>   nouveau_hw_save_vga_fonts(struct drm_device *dev, bool save)
>   {
>   	struct nouveau_drm *drm =3D nouveau_drm(dev);
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	uint8_t misc, gr4, gr5, gr6, seq2, seq4;
>   	bool graphicsmode;
>   	unsigned plane;
> @@ -327,7 +329,7 @@ nouveau_hw_save_vga_fonts(struct drm_device *dev, b=
ool save)
>   	NV_INFO(drm, "%sing VGA fonts\n", save ? "Sav" : "Restor");
>  =20
>   	/* map first 64KiB of VRAM, holds VGA fonts etc */
> -	iovram =3D ioremap(pci_resource_start(dev->pdev, 1), 65536);
> +	iovram =3D ioremap(pci_resource_start(pdev, 1), 65536);
>   	if (!iovram) {
>   		NV_ERROR(drm, "Failed to map VRAM, "
>   					"cannot save/restore VGA fonts.\n");
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/=
nouveau/nouveau_abi16.c
> index 9a5be6f32424..f08b31d84d4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -181,6 +181,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>   	struct nvif_device *device =3D &drm->client.device;
>   	struct nvkm_gr *gr =3D nvxx_gr(device);
>   	struct drm_nouveau_getparam *getparam =3D data;
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>  =20
>   	switch (getparam->param) {
>   	case NOUVEAU_GETPARAM_CHIPSET_ID:
> @@ -188,13 +189,13 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>   		break;
>   	case NOUVEAU_GETPARAM_PCI_VENDOR:
>   		if (device->info.platform !=3D NV_DEVICE_INFO_V0_SOC)
> -			getparam->value =3D dev->pdev->vendor;
> +			getparam->value =3D pdev->vendor;
>   		else
>   			getparam->value =3D 0;
>   		break;
>   	case NOUVEAU_GETPARAM_PCI_DEVICE:
>   		if (device->info.platform !=3D NV_DEVICE_INFO_V0_SOC)
> -			getparam->value =3D dev->pdev->device;
> +			getparam->value =3D pdev->device;
>   		else
>   			getparam->value =3D 0;
>   		break;
> @@ -205,7 +206,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>   		case NV_DEVICE_INFO_V0_PCIE: getparam->value =3D 2; break;
>   		case NV_DEVICE_INFO_V0_SOC : getparam->value =3D 3; break;
>   		case NV_DEVICE_INFO_V0_IGP :
> -			if (!pci_is_pcie(dev->pdev))
> +			if (!pci_is_pcie(pdev))
>   				getparam->value =3D 1;
>   			else
>   				getparam->value =3D 2;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/n=
ouveau/nouveau_acpi.c
> index 69a84d0197d0..7c15f6448428 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -377,7 +377,7 @@ nouveau_acpi_edid(struct drm_device *dev, struct dr=
m_connector *connector)
>   		return NULL;
>   	}
>  =20
> -	handle =3D ACPI_HANDLE(&dev->pdev->dev);
> +	handle =3D ACPI_HANDLE(dev->dev);
>   	if (!handle)
>   		return NULL;
>  =20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/n=
ouveau/nouveau_bios.c
> index d204ea8a5618..7cc683b8dc7a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -110,6 +110,9 @@ static int call_lvds_manufacturer_script(struct drm=
_device *dev, struct dcb_outp
>   	struct nvbios *bios =3D &drm->vbios;
>   	uint8_t sub =3D bios->data[bios->fp.xlated_entry + script] + (bios->=
fp.link_c_increment && dcbent->or & DCB_OUTPUT_C ? 1 : 0);
>   	uint16_t scriptofs =3D ROM16(bios->data[bios->init_script_tbls_ptr +=
 sub * 2]);
> +#ifdef __powerpc__
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> +#endif
>  =20
>   	if (!bios->fp.xlated_entry || !sub || !scriptofs)
>   		return -EINVAL;
> @@ -123,8 +126,8 @@ static int call_lvds_manufacturer_script(struct drm=
_device *dev, struct dcb_outp
>   #ifdef __powerpc__
>   	/* Powerbook specific quirks */
>   	if (script =3D=3D LVDS_RESET &&
> -	    (dev->pdev->device =3D=3D 0x0179 || dev->pdev->device =3D=3D 0x01=
89 ||
> -	     dev->pdev->device =3D=3D 0x0329))
> +	    (pdev->device =3D=3D 0x0179 || pdev->device =3D=3D 0x0189 ||
> +	     pdev->device =3D=3D 0x0329))
>   		nv_write_tmds(dev, dcbent->or, 0, 0x02, 0x72);
>   #endif
>  =20
> @@ -2080,11 +2083,13 @@ nouveau_bios_init(struct drm_device *dev)
>   {
>   	struct nouveau_drm *drm =3D nouveau_drm(dev);
>   	struct nvbios *bios =3D &drm->vbios;
> +	struct pci_dev *pdev;
>   	int ret;
>  =20
>   	/* only relevant for PCI devices */
> -	if (!dev->pdev)
> +	if (!dev_is_pci(dev->dev))
>   		return 0;
> +	pdev =3D to_pci_dev(dev->dev);
>  =20
>   	if (!NVInitVBIOS(dev))
>   		return -ENODEV;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/=
drm/nouveau/nouveau_connector.c
> index 8b4b3688c7ae..14c29e68db8f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -411,6 +411,7 @@ static struct nouveau_encoder *
>   nouveau_connector_ddc_detect(struct drm_connector *connector)
>   {
>   	struct drm_device *dev =3D connector->dev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	struct nouveau_encoder *nv_encoder =3D NULL, *found =3D NULL;
>   	struct drm_encoder *encoder;
>   	int ret;
> @@ -438,11 +439,11 @@ nouveau_connector_ddc_detect(struct drm_connector=
 *connector)
>   				break;
>  =20
>   			if (switcheroo_ddc)
> -				vga_switcheroo_lock_ddc(dev->pdev);
> +				vga_switcheroo_lock_ddc(pdev);
>   			if (nvkm_probe_i2c(nv_encoder->i2c, 0x50))
>   				found =3D nv_encoder;
>   			if (switcheroo_ddc)
> -				vga_switcheroo_unlock_ddc(dev->pdev);
> +				vga_switcheroo_unlock_ddc(pdev);
>  =20
>   			break;
>   		}
> @@ -490,6 +491,7 @@ nouveau_connector_set_encoder(struct drm_connector =
*connector,
>   	struct nouveau_connector *nv_connector =3D nouveau_connector(connect=
or);
>   	struct nouveau_drm *drm =3D nouveau_drm(connector->dev);
>   	struct drm_device *dev =3D connector->dev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>  =20
>   	if (nv_connector->detected_encoder =3D=3D nv_encoder)
>   		return;
> @@ -511,8 +513,8 @@ nouveau_connector_set_encoder(struct drm_connector =
*connector,
>   		connector->doublescan_allowed =3D true;
>   		if (drm->client.device.info.family =3D=3D NV_DEVICE_INFO_V0_KELVIN =
||
>   		    (drm->client.device.info.family =3D=3D NV_DEVICE_INFO_V0_CELSIU=
S &&
> -		     (dev->pdev->device & 0x0ff0) !=3D 0x0100 &&
> -		     (dev->pdev->device & 0x0ff0) !=3D 0x0150))
> +		     (pdev->device & 0x0ff0) !=3D 0x0100 &&
> +		     (pdev->device & 0x0ff0) !=3D 0x0150))
>   			/* HW is broken */
>   			connector->interlace_allowed =3D false;
>   		else
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/no=
uveau/nouveau_drm.c
> index d141a5f004af..1b2169e9c295 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -115,8 +115,8 @@ nouveau_platform_name(struct platform_device *platf=
ormdev)
>   static u64
>   nouveau_name(struct drm_device *dev)
>   {
> -	if (dev->pdev)
> -		return nouveau_pci_name(dev->pdev);
> +	if (dev_is_pci(dev->dev))
> +		return nouveau_pci_name(to_pci_dev(dev->dev));
>   	else
>   		return nouveau_platform_name(to_platform_device(dev->dev));
>   }
> @@ -760,7 +760,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>   	if (ret)
>   		goto fail_drm;
>  =20
> -	drm_dev->pdev =3D pdev;
>   	pci_set_drvdata(pdev, drm_dev);
>  =20
>   	ret =3D nouveau_drm_device_init(drm_dev);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/=
nouveau/nouveau_fbcon.c
> index 24ec5339efb4..4fc0fa696461 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -396,7 +396,9 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
>   	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
>   		fb->width, fb->height, nvbo->offset, nvbo);
>  =20
> -	vga_switcheroo_client_fb_set(dev->pdev, info);
> +	if (dev_is_pci(dev->dev))
> +		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), info);
> +
>   	return 0;
>  =20
>   out_unlock:
> @@ -548,7 +550,7 @@ nouveau_fbcon_init(struct drm_device *dev)
>   	int ret;
>  =20
>   	if (!dev->mode_config.num_crtc ||
> -	    (dev->pdev->class >> 8) !=3D PCI_CLASS_DISPLAY_VGA)
> +	    (to_pci_dev(dev->dev)->class >> 8) !=3D PCI_CLASS_DISPLAY_VGA)
>   		return 0;
>  =20
>   	fbcon =3D kzalloc(sizeof(struct nouveau_fbdev), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/no=
uveau/nouveau_vga.c
> index c85dd8afa3c3..7c4b374b3eca 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -87,18 +87,20 @@ nouveau_vga_init(struct nouveau_drm *drm)
>   {
>   	struct drm_device *dev =3D drm->dev;
>   	bool runtime =3D nouveau_pmops_runtime();
> +	struct pci_dev *pdev;
>  =20
>   	/* only relevant for PCI devices */
> -	if (!dev->pdev)
> +	if (!dev_is_pci(dev->dev))
>   		return;
> +	pdev =3D to_pci_dev(dev->dev);
>  =20
> -	vga_client_register(dev->pdev, dev, NULL, nouveau_vga_set_decode);
> +	vga_client_register(pdev, dev, NULL, nouveau_vga_set_decode);
>  =20
>   	/* don't register Thunderbolt eGPU with vga_switcheroo */
> -	if (pci_is_thunderbolt_attached(dev->pdev))
> +	if (pci_is_thunderbolt_attached(pdev))
>   		return;
>  =20
> -	vga_switcheroo_register_client(dev->pdev, &nouveau_switcheroo_ops, ru=
ntime);
> +	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime=
);
>  =20
>   	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>   		vga_switcheroo_init_domain_pm_ops(drm->dev->dev, &drm->vga_pm_domai=
n);
> @@ -109,17 +111,19 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>   {
>   	struct drm_device *dev =3D drm->dev;
>   	bool runtime =3D nouveau_pmops_runtime();
> +	struct pci_dev *pdev;
>  =20
>   	/* only relevant for PCI devices */
> -	if (!dev->pdev)
> +	if (!dev_is_pci(dev->dev))
>   		return;
> +	pdev =3D to_pci_dev(dev->dev);
>  =20
> -	vga_client_register(dev->pdev, NULL, NULL, NULL);
> +	vga_client_register(pdev, NULL, NULL, NULL);
>  =20
> -	if (pci_is_thunderbolt_attached(dev->pdev))
> +	if (pci_is_thunderbolt_attached(pdev))
>   		return;
>  =20
> -	vga_switcheroo_unregister_client(dev->pdev);
> +	vga_switcheroo_unregister_client(pdev);
>   	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>   		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hIe2AHYR2zK6YPXw6Wr6jURzdtcXh5CCB--

--pbnTfPZAEC7VgKVpwIh5fcgd6TIECckLk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/PMoMFAwAAAAAACgkQlh/E3EQov+AH
Bw//SvWeEKGh+x8iIhsOXEWO6ExEg+6BmGV3spn6msMYU1pGOpKMgaBNEKh2b0d+UT1WLN8gDULg
wd6PrbLt+28d9/fY5sdtvvgL2PWbQNLRY1jLxH2YvqfZX0VVFGiEhKS5osW7WnbdX8WntxIAa8oj
L0d/es2YaKr20z4umjfztxkir/cCGWgigkod6E9GzsfZC4HaXJe+rYbR87IfiADdWwYlSQhJMLcg
4MSEwvJ3PU+2U2eA5fwcNpT3a5vf+gKbOTja5E5PM7t0vMrwss8l/jVMuKXXq+6Demr6uoegHihX
JjQ+8Uk/vpQ1WC8D+agcgHnEjeP/Lfbn05AJGN2mjnDdf4YwZ5aaOqWmh3pV9DxKjcAQxgwkjv3q
6YLJaw/YrHUt4XmEalubxgr2wZin1klJzMKmYecyo3ZfzYaksdRqqpcmwshwaSULshVeAKi3wu2u
gL5fVXDU66KTq6LJVONZ2QeSWcYUqQHeelGKqVaVxWe6jtw6ABOiXbYpIF27kgIW8PbuRIgUxdoT
M3KBooXJdn4/RhbT5Sj2EjeC6o2rFYSjQj2qSaYcalFI52xKZIhCQOgTx/rd9mG3Ex+vNUiTc9Hq
al4n0b02KcZ9NIvMV7Rml+T3pp3FNYXkE+i9LtstjaQ1EP+6AE/ApGPuNVE+3eQTK1B3bnEJq3eO
aTk=
=NT0r
-----END PGP SIGNATURE-----

--pbnTfPZAEC7VgKVpwIh5fcgd6TIECckLk--

--===============1332082891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1332082891==--
