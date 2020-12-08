Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7D2D2537
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66296E94C;
	Tue,  8 Dec 2020 07:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A10C6E94C;
 Tue,  8 Dec 2020 07:59:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB397AB63;
 Tue,  8 Dec 2020 07:59:29 +0000 (UTC)
Subject: Re: [PATCH v2 09/20] drm/i915: Remove references to struct
 drm_device.pdev
To: airlied@linux.ie, daniel@ffwll.ch
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-10-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7c9b3127-0e79-fd22-0bba-b3e8430d876a@suse.de>
Date: Tue, 8 Dec 2020 08:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201103542.2182-10-tzimmermann@suse.de>
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
 amd-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0183256167=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0183256167==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CM0jC5U8MuBO69a3GrjT2ZgcVJ90gf3wi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CM0jC5U8MuBO69a3GrjT2ZgcVJ90gf3wi
Content-Type: multipart/mixed; boundary="zZIBcsgSWxAfruIe7oXEKwMFVLs0lHvaJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Jani Nikula
 <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <7c9b3127-0e79-fd22-0bba-b3e8430d876a@suse.de>
Subject: Re: [PATCH v2 09/20] drm/i915: Remove references to struct
 drm_device.pdev
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-10-tzimmermann@suse.de>
In-Reply-To: <20201201103542.2182-10-tzimmermann@suse.de>

--zZIBcsgSWxAfruIe7oXEKwMFVLs0lHvaJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for a review of the i915 patches

Am 01.12.20 um 11:35 schrieb Thomas Zimmermann:
> Using struct drm_device.pdev is deprecated. Convert i915 to struct
> drm_device.dev. No functional changes.
>=20
> v2:
> 	* move gt/ and gvt/ changes into separate patches
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
>   drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 ++++++-------
>   drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
>   drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
>   drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
>   .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +++--
>   drivers/gpu/drm/i915/display/intel_opregion.c |  6 +++---
>   drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
>   drivers/gpu/drm/i915/display/intel_panel.c    |  4 ++--
>   drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
>   drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
>   drivers/gpu/drm/i915/display/intel_vga.c      |  8 ++++----
>   drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +++---
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
>   drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
>   drivers/gpu/drm/i915/i915_drv.c               | 20 +++++++++---------=
-
>   drivers/gpu/drm/i915/i915_drv.h               |  2 +-
>   drivers/gpu/drm/i915/i915_gem_gtt.c           |  4 ++--
>   drivers/gpu/drm/i915/i915_getparam.c          |  5 +++--
>   drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
>   drivers/gpu/drm/i915/i915_irq.c               |  6 +++---
>   drivers/gpu/drm/i915/i915_pmu.c               |  5 +++--
>   drivers/gpu/drm/i915/i915_suspend.c           |  4 ++--
>   drivers/gpu/drm/i915/i915_switcheroo.c        |  4 ++--
>   drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
>   drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
>   drivers/gpu/drm/i915/intel_region_lmem.c      |  8 ++++----
>   drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
>   drivers/gpu/drm/i915/intel_uncore.c           |  4 ++--
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
>   32 files changed, 68 insertions(+), 68 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/dr=
m/i915/display/intel_bios.c
> index 4cc949b228f2..8879676372a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -2088,7 +2088,7 @@ bool intel_bios_is_valid_vbt(const void *buf, siz=
e_t size)
>  =20
>   static struct vbt_header *oprom_get_vbt(struct drm_i915_private *dev_=
priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	void __iomem *p =3D NULL, *oprom;
>   	struct vbt_header *vbt;
>   	u16 vbt_size;
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/d=
rm/i915/display/intel_cdclk.c
> index c449d28d0560..a6e13208dc50 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -96,7 +96,7 @@ static void fixed_450mhz_get_cdclk(struct drm_i915_pr=
ivate *dev_priv,
>   static void i85x_get_cdclk(struct drm_i915_private *dev_priv,
>   			   struct intel_cdclk_config *cdclk_config)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u16 hpllcc =3D 0;
>  =20
>   	/*
> @@ -138,7 +138,7 @@ static void i85x_get_cdclk(struct drm_i915_private =
*dev_priv,
>   static void i915gm_get_cdclk(struct drm_i915_private *dev_priv,
>   			     struct intel_cdclk_config *cdclk_config)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u16 gcfgc =3D 0;
>  =20
>   	pci_read_config_word(pdev, GCFGC, &gcfgc);
> @@ -162,7 +162,7 @@ static void i915gm_get_cdclk(struct drm_i915_privat=
e *dev_priv,
>   static void i945gm_get_cdclk(struct drm_i915_private *dev_priv,
>   			     struct intel_cdclk_config *cdclk_config)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u16 gcfgc =3D 0;
>  =20
>   	pci_read_config_word(pdev, GCFGC, &gcfgc);
> @@ -256,7 +256,7 @@ static unsigned int intel_hpll_vco(struct drm_i915_=
private *dev_priv)
>   static void g33_get_cdclk(struct drm_i915_private *dev_priv,
>   			  struct intel_cdclk_config *cdclk_config)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	static const u8 div_3200[] =3D { 12, 10,  8,  7, 5, 16 };
>   	static const u8 div_4000[] =3D { 14, 12, 10,  8, 6, 20 };
>   	static const u8 div_4800[] =3D { 20, 14, 12, 10, 8, 24 };
> @@ -305,7 +305,7 @@ static void g33_get_cdclk(struct drm_i915_private *=
dev_priv,
>   static void pnv_get_cdclk(struct drm_i915_private *dev_priv,
>   			  struct intel_cdclk_config *cdclk_config)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u16 gcfgc =3D 0;
>  =20
>   	pci_read_config_word(pdev, GCFGC, &gcfgc);
> @@ -339,7 +339,7 @@ static void pnv_get_cdclk(struct drm_i915_private *=
dev_priv,
>   static void i965gm_get_cdclk(struct drm_i915_private *dev_priv,
>   			     struct intel_cdclk_config *cdclk_config)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	static const u8 div_3200[] =3D { 16, 10,  8 };
>   	static const u8 div_4000[] =3D { 20, 12, 10 };
>   	static const u8 div_5333[] =3D { 24, 16, 14 };
> @@ -384,7 +384,7 @@ static void i965gm_get_cdclk(struct drm_i915_privat=
e *dev_priv,
>   static void gm45_get_cdclk(struct drm_i915_private *dev_priv,
>   			   struct intel_cdclk_config *cdclk_config)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	unsigned int cdclk_sel;
>   	u16 tmp =3D 0;
>  =20
> diff --git a/drivers/gpu/drm/i915/display/intel_csr.c b/drivers/gpu/drm=
/i915/display/intel_csr.c
> index 67dc64df78a5..19cbcab69689 100644
> --- a/drivers/gpu/drm/i915/display/intel_csr.c
> +++ b/drivers/gpu/drm/i915/display/intel_csr.c
> @@ -640,7 +640,7 @@ static void csr_load_work_fn(struct work_struct *wo=
rk)
>   	dev_priv =3D container_of(work, typeof(*dev_priv), csr.work);
>   	csr =3D &dev_priv->csr;
>  =20
> -	request_firmware(&fw, dev_priv->csr.fw_path, &dev_priv->drm.pdev->dev=
);
> +	request_firmware(&fw, dev_priv->csr.fw_path, dev_priv->drm.dev);
>   	parse_csr_fw(dev_priv, fw);
>  =20
>   	if (dev_priv->csr.dmc_payload) {
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu=
/drm/i915/display/intel_dsi_vbt.c
> index eed037ec0b29..e349caef1926 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -425,7 +425,7 @@ static void i2c_acpi_find_adapter(struct intel_dsi =
*intel_dsi,
>   				  const u16 slave_addr)
>   {
>   	struct drm_device *drm_dev =3D intel_dsi->base.base.dev;
> -	struct device *dev =3D &drm_dev->pdev->dev;
> +	struct device *dev =3D drm_dev->dev;
>   	struct acpi_device *acpi_dev;
>   	struct list_head resource_list;
>   	struct i2c_adapter_lookup lookup;
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/d=
rm/i915/display/intel_fbdev.c
> index 842c04e63214..4ccb462bd497 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -167,7 +167,7 @@ static int intelfb_create(struct drm_fb_helper *hel=
per,
>   	struct intel_framebuffer *intel_fb =3D ifbdev->fb;
>   	struct drm_device *dev =3D helper->dev;
>   	struct drm_i915_private *dev_priv =3D to_i915(dev);
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	struct i915_ggtt *ggtt =3D &dev_priv->ggtt;
>   	const struct i915_ggtt_view view =3D {
>   		.type =3D I915_GGTT_VIEW_NORMAL,
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/d=
rm/i915/display/intel_gmbus.c
> index b0d71bbbf2ad..0c952e1d720e 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -840,7 +840,7 @@ static const struct i2c_lock_operations gmbus_lock_=
ops =3D {
>    */
>   int intel_gmbus_setup(struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	struct intel_gmbus *bus;
>   	unsigned int pin;
>   	int ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/g=
pu/drm/i915/display/intel_lpe_audio.c
> index ad5cc13037ae..98eb52a938d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> @@ -80,6 +80,7 @@ static struct platform_device *
>   lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
>   {
>   	struct drm_device *dev =3D &dev_priv->drm;
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	struct platform_device_info pinfo =3D {};
>   	struct resource *rsc;
>   	struct platform_device *platdev;
> @@ -99,9 +100,9 @@ lpe_audio_platdev_create(struct drm_i915_private *de=
v_priv)
>   	rsc[0].flags    =3D IORESOURCE_IRQ;
>   	rsc[0].name     =3D "hdmi-lpe-audio-irq";
>  =20
> -	rsc[1].start    =3D pci_resource_start(dev->pdev, 0) +
> +	rsc[1].start    =3D pci_resource_start(pdev, 0) +
>   		I915_HDMI_LPE_AUDIO_BASE;
> -	rsc[1].end      =3D pci_resource_start(dev->pdev, 0) +
> +	rsc[1].end      =3D pci_resource_start(pdev, 0) +
>   		I915_HDMI_LPE_AUDIO_BASE + I915_HDMI_LPE_AUDIO_SIZE - 1;
>   	rsc[1].flags    =3D IORESOURCE_MEM;
>   	rsc[1].name     =3D "hdmi-lpe-audio-mmio";
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gp=
u/drm/i915/display/intel_opregion.c
> index 4f77cf849171..dfd724e506b5 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
> @@ -247,7 +247,7 @@ static int swsci(struct drm_i915_private *dev_priv,=

>   		 u32 function, u32 parm, u32 *parm_out)
>   {
>   	struct opregion_swsci *swsci =3D dev_priv->opregion.swsci;
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u32 main_function, sub_function, scic;
>   	u16 swsci_val;
>   	u32 dslp;
> @@ -807,7 +807,7 @@ static int intel_load_vbt_firmware(struct drm_i915_=
private *dev_priv)
>   	if (!name || !*name)
>   		return -ENOENT;
>  =20
> -	ret =3D request_firmware(&fw, name, &dev_priv->drm.pdev->dev);
> +	ret =3D request_firmware(&fw, name, dev_priv->drm.dev);
>   	if (ret) {
>   		drm_err(&dev_priv->drm,
>   			"Requesting VBT firmware \"%s\" failed (%d)\n",
> @@ -840,7 +840,7 @@ static int intel_load_vbt_firmware(struct drm_i915_=
private *dev_priv)
>   int intel_opregion_setup(struct drm_i915_private *dev_priv)
>   {
>   	struct intel_opregion *opregion =3D &dev_priv->opregion;
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u32 asls, mboxes;
>   	char buf[sizeof(OPREGION_SIGNATURE)];
>   	int err =3D 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu=
/drm/i915/display/intel_overlay.c
> index 52b4f6193b4c..ea6a630cf6ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -201,7 +201,7 @@ struct intel_overlay {
>   static void i830_overlay_clock_gating(struct drm_i915_private *dev_pr=
iv,
>   				      bool enable)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u8 val;
>  =20
>   	/* WA_OVERLAY_CLKGATE:alm */
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/d=
rm/i915/display/intel_panel.c
> index 9f23bac0d792..1b643ed71f66 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -557,7 +557,7 @@ static u32 i9xx_get_backlight(struct intel_connecto=
r *connector)
>   	if (panel->backlight.combination_mode) {
>   		u8 lbpc;
>  =20
> -		pci_read_config_byte(dev_priv->drm.pdev, LBPC, &lbpc);
> +		pci_read_config_byte(to_pci_dev(dev_priv->drm.dev), LBPC, &lbpc);
>   		val *=3D lbpc;
>   	}
>  =20
> @@ -631,7 +631,7 @@ static void i9xx_set_backlight(const struct drm_con=
nector_state *conn_state, u32
>  =20
>   		lbpc =3D level * 0xfe / panel->backlight.max + 1;
>   		level /=3D lbpc;
> -		pci_write_config_byte(dev_priv->drm.pdev, LBPC, lbpc);
> +		pci_write_config_byte(to_pci_dev(dev_priv->drm.dev), LBPC, lbpc);
>   	}
>  =20
>   	if (IS_GEN(dev_priv, 4)) {
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/=
drm/i915/display/intel_quirks.c
> index 46beb155d835..98dd787b00e3 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -160,7 +160,7 @@ static struct intel_quirk intel_quirks[] =3D {
>  =20
>   void intel_init_quirks(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *d =3D i915->drm.pdev;
> +	struct pci_dev *d =3D to_pci_dev(i915->drm.dev);
>   	int i;
>  =20
>   	for (i =3D 0; i < ARRAY_SIZE(intel_quirks); i++) {
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/dr=
m/i915/display/intel_sdvo.c
> index 4eaa4aa86ecd..3fac60899d8e 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -3281,7 +3281,7 @@ static bool
>   intel_sdvo_init_ddc_proxy(struct intel_sdvo *sdvo,
>   			  struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>  =20
>   	sdvo->ddc.owner =3D THIS_MODULE;
>   	sdvo->ddc.class =3D I2C_CLASS_DDC;
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm=
/i915/display/intel_vga.c
> index be333699c515..5f8e4f53649d 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -25,7 +25,7 @@ static i915_reg_t intel_vga_cntrl_reg(struct drm_i915=
_private *i915)
>   /* Disable the VGA plane that we never use */
>   void intel_vga_disable(struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	i915_reg_t vga_reg =3D intel_vga_cntrl_reg(dev_priv);
>   	u8 sr1;
>  =20
> @@ -76,7 +76,7 @@ void intel_vga_redisable(struct drm_i915_private *i91=
5)
>  =20
>   void intel_vga_reset_io_mem(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  =20
>   	/*
>   	 * After we re-enable the power well, if we touch VGA register 0x3d5=

> @@ -136,7 +136,7 @@ intel_vga_set_decode(void *cookie, bool enable_deco=
de)
>  =20
>   int intel_vga_register(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>   	int ret;
>  =20
>   	/*
> @@ -156,7 +156,7 @@ int intel_vga_register(struct drm_i915_private *i91=
5)
>  =20
>   void intel_vga_unregister(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  =20
>   	vga_client_register(pdev, NULL, NULL, NULL);
>   }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm=
/i915/gem/i915_gem_phys.c
> index 3a4dfe2ef1da..f47dafdda539 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -35,7 +35,7 @@ static int i915_gem_object_get_pages_phys(struct drm_=
i915_gem_object *obj)
>   	 * to handle all possible callers, and given typical object sizes,
>   	 * the alignment of the buddy allocation will naturally match.
>   	 */
> -	vaddr =3D dma_alloc_coherent(&obj->base.dev->pdev->dev,
> +	vaddr =3D dma_alloc_coherent(obj->base.dev->dev,
>   				   roundup_pow_of_two(obj->base.size),
>   				   &dma, GFP_KERNEL);
>   	if (!vaddr)
> @@ -83,7 +83,7 @@ static int i915_gem_object_get_pages_phys(struct drm_=
i915_gem_object *obj)
>   err_st:
>   	kfree(st);
>   err_pci:
> -	dma_free_coherent(&obj->base.dev->pdev->dev,
> +	dma_free_coherent(obj->base.dev->dev,
>   			  roundup_pow_of_two(obj->base.size),
>   			  vaddr, dma);
>   	return -ENOMEM;
> @@ -129,7 +129,7 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_=
object *obj,
>   	sg_free_table(pages);
>   	kfree(pages);
>  =20
> -	dma_free_coherent(&obj->base.dev->pdev->dev,
> +	dma_free_coherent(obj->base.dev->dev,
>   			  roundup_pow_of_two(obj->base.size),
>   			  vaddr, dma);
>   }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_shmem.c
> index 75e8b71c18b9..08c9c25f1109 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -172,7 +172,7 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
>   			max_segment =3D PAGE_SIZE;
>   			goto rebuild_st;
>   		} else {
> -			dev_warn(&i915->drm.pdev->dev,
> +			dev_warn(i915->drm.dev,
>   				 "Failed to DMA remap %lu pages\n",
>   				 page_count);
>   			goto err_pages;
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915=
/i915_debugfs.c
> index 263074c2c097..b4d38f68a246 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -1275,7 +1275,7 @@ static int i915_llc(struct seq_file *m, void *dat=
a)
>   static int i915_runtime_pm_status(struct seq_file *m, void *unused)
>   {
>   	struct drm_i915_private *dev_priv =3D node_to_i915(m->private);
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>  =20
>   	if (!HAS_RUNTIME_PM(dev_priv))
>   		seq_puts(m, "Runtime power management not supported\n");
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i91=
5_drv.c
> index 320856b665a1..397483f5f0bd 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -91,7 +91,7 @@ static const struct drm_driver driver;
>  =20
>   static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
>   {
> -	int domain =3D pci_domain_nr(dev_priv->drm.pdev->bus);
> +	int domain =3D pci_domain_nr(to_pci_dev(dev_priv->drm.dev)->bus);
>  =20
>   	dev_priv->bridge_dev =3D
>   		pci_get_domain_bus_and_slot(domain, 0, PCI_DEVFN(0, 0));
> @@ -458,7 +458,6 @@ static void intel_sanitize_options(struct drm_i915_=
private *dev_priv)
>    */
>   static int i915_set_dma_info(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
>   	unsigned int mask_size =3D INTEL_INFO(i915)->dma_mask_size;
>   	int ret;
>  =20
> @@ -468,9 +467,9 @@ static int i915_set_dma_info(struct drm_i915_privat=
e *i915)
>   	 * We don't have a max segment size, so set it to the max so sg's
>   	 * debugging layer doesn't complain
>   	 */
> -	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	dma_set_max_seg_size(i915->drm.dev, UINT_MAX);
>  =20
> -	ret =3D dma_set_mask(&pdev->dev, DMA_BIT_MASK(mask_size));
> +	ret =3D dma_set_mask(i915->drm.dev, DMA_BIT_MASK(mask_size));
>   	if (ret)
>   		goto mask_err;
>  =20
> @@ -490,7 +489,7 @@ static int i915_set_dma_info(struct drm_i915_privat=
e *i915)
>   	if (IS_I965G(i915) || IS_I965GM(i915))
>   		mask_size =3D 32;
>  =20
> -	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(mask_size));
> +	ret =3D dma_set_coherent_mask(i915->drm.dev, DMA_BIT_MASK(mask_size))=
;
>   	if (ret)
>   		goto mask_err;
>  =20
> @@ -510,7 +509,7 @@ static int i915_set_dma_info(struct drm_i915_privat=
e *i915)
>    */
>   static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	int ret;
>  =20
>   	if (i915_inject_probe_failure(dev_priv))
> @@ -642,7 +641,7 @@ static int i915_driver_hw_probe(struct drm_i915_pri=
vate *dev_priv)
>    */
>   static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>  =20
>   	i915_perf_fini(dev_priv);
>  =20
> @@ -792,7 +791,6 @@ i915_driver_create(struct pci_dev *pdev, const stru=
ct pci_device_id *ent)
>   	if (IS_ERR(i915))
>   		return i915;
>  =20
> -	i915->drm.pdev =3D pdev;
>   	pci_set_drvdata(pdev, i915);
>  =20
>   	/* Device parameters start as a copy of module parameters. */
> @@ -1094,7 +1092,7 @@ static int i915_drm_prepare(struct drm_device *de=
v)
>   static int i915_drm_suspend(struct drm_device *dev)
>   {
>   	struct drm_i915_private *dev_priv =3D to_i915(dev);
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	pci_power_t opregion_target_state;
>  =20
>   	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> @@ -1151,7 +1149,7 @@ get_suspend_mode(struct drm_i915_private *dev_pri=
v, bool hibernate)
>   static int i915_drm_suspend_late(struct drm_device *dev, bool hiberna=
tion)
>   {
>   	struct drm_i915_private *dev_priv =3D to_i915(dev);
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	struct intel_runtime_pm *rpm =3D &dev_priv->runtime_pm;
>   	int ret;
>  =20
> @@ -1281,7 +1279,7 @@ static int i915_drm_resume(struct drm_device *dev=
)
>   static int i915_drm_resume_early(struct drm_device *dev)
>   {
>   	struct drm_i915_private *dev_priv =3D to_i915(dev);
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	int ret;
>  =20
>   	/*
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
> index 15be8debae54..b5a33430f3b7 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1295,7 +1295,7 @@ static inline struct drm_i915_private *pdev_to_i9=
15(struct pci_dev *pdev)
>   #define INTEL_DEVID(dev_priv)	(RUNTIME_INFO(dev_priv)->device_id)
>  =20
>   #define REVID_FOREVER		0xff
> -#define INTEL_REVID(dev_priv)	((dev_priv)->drm.pdev->revision)
> +#define INTEL_REVID(dev_priv)	(to_pci_dev((dev_priv)->drm.dev)->revisi=
on)
>  =20
>   #define INTEL_GEN_MASK(s, e) ( \
>   	BUILD_BUG_ON_ZERO(!__builtin_constant_p(s)) + \
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915=
/i915_gem_gtt.c
> index c5ee1567f3d1..55eb42e1c994 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -28,7 +28,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_ob=
ject *obj,
>   			       struct sg_table *pages)
>   {
>   	do {
> -		if (dma_map_sg_attrs(&obj->base.dev->pdev->dev,
> +		if (dma_map_sg_attrs(obj->base.dev->dev,
>   				     pages->sgl, pages->nents,
>   				     PCI_DMA_BIDIRECTIONAL,
>   				     DMA_ATTR_SKIP_CPU_SYNC |
> @@ -56,7 +56,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_ob=
ject *obj,
>   			       struct sg_table *pages)
>   {
>   	struct drm_i915_private *dev_priv =3D to_i915(obj->base.dev);
> -	struct device *kdev =3D &dev_priv->drm.pdev->dev;
> +	struct device *kdev =3D dev_priv->drm.dev;
>   	struct i915_ggtt *ggtt =3D &dev_priv->ggtt;
>  =20
>   	if (unlikely(ggtt->do_idle_maps)) {
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i91=
5/i915_getparam.c
> index f96032c60a12..8d37f4987cfa 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -12,6 +12,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void =
*data,
>   			struct drm_file *file_priv)
>   {
>   	struct drm_i915_private *i915 =3D to_i915(dev);
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	const struct sseu_dev_info *sseu =3D &i915->gt.info.sseu;
>   	drm_i915_getparam_t *param =3D data;
>   	int value;
> @@ -24,10 +25,10 @@ int i915_getparam_ioctl(struct drm_device *dev, voi=
d *data,
>   		/* Reject all old ums/dri params. */
>   		return -ENODEV;
>   	case I915_PARAM_CHIPSET_ID:
> -		value =3D i915->drm.pdev->device;
> +		value =3D pdev->device;
>   		break;
>   	case I915_PARAM_REVISION:
> -		value =3D i915->drm.pdev->revision;
> +		value =3D pdev->revision;
>   		break;
>   	case I915_PARAM_NUM_FENCES_AVAIL:
>   		value =3D i915->ggtt.num_fences;
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i9=
15/i915_gpu_error.c
> index d8cac4c5881f..97aa2c0f27aa 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -644,7 +644,7 @@ static void err_print_params(struct drm_i915_error_=
state_buf *m,
>   static void err_print_pciid(struct drm_i915_error_state_buf *m,
>   			    struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  =20
>   	err_printf(m, "PCI ID: 0x%04x\n", pdev->device);
>   	err_printf(m, "PCI Revision: 0x%02x\n", pdev->revision);
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i91=
5_irq.c
> index c80eeac53952..ee3c90c90761 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -4357,7 +4357,7 @@ static void intel_irq_postinstall(struct drm_i915=
_private *dev_priv)
>    */
>   int intel_irq_install(struct drm_i915_private *dev_priv)
>   {
> -	int irq =3D dev_priv->drm.pdev->irq;
> +	int irq =3D to_pci_dev(dev_priv->drm.dev)->irq;
>   	int ret;
>  =20
>   	/*
> @@ -4392,7 +4392,7 @@ int intel_irq_install(struct drm_i915_private *de=
v_priv)
>    */
>   void intel_irq_uninstall(struct drm_i915_private *dev_priv)
>   {
> -	int irq =3D dev_priv->drm.pdev->irq;
> +	int irq =3D to_pci_dev(dev_priv->drm.dev)->irq;
>  =20
>   	/*
>   	 * FIXME we can get called twice during driver probe
> @@ -4452,5 +4452,5 @@ bool intel_irqs_enabled(struct drm_i915_private *=
dev_priv)
>  =20
>   void intel_synchronize_irq(struct drm_i915_private *i915)
>   {
> -	synchronize_irq(i915->drm.pdev->irq);
> +	synchronize_irq(to_pci_dev(i915->drm.dev)->irq);
>   }
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i91=
5_pmu.c
> index cd786ad12be7..58aa1aaaeb85 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -427,7 +427,8 @@ static enum hrtimer_restart i915_sample(struct hrti=
mer *hrtimer)
>   static u64 count_interrupts(struct drm_i915_private *i915)
>   {
>   	/* open-coded kstat_irqs() */
> -	struct irq_desc *desc =3D irq_to_desc(i915->drm.pdev->irq);
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> +	struct irq_desc *desc =3D irq_to_desc(pdev->irq);
>   	u64 sum =3D 0;
>   	int cpu;
>  =20
> @@ -1117,7 +1118,7 @@ static void i915_pmu_unregister_cpuhp_state(struc=
t i915_pmu *pmu)
>  =20
>   static bool is_igp(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  =20
>   	/* IGP is 0000:00:02.0 */
>   	return pci_domain_nr(pdev->bus) =3D=3D 0 &&
> diff --git a/drivers/gpu/drm/i915/i915_suspend.c b/drivers/gpu/drm/i915=
/i915_suspend.c
> index db2111fc809e..2ec76acf778d 100644
> --- a/drivers/gpu/drm/i915/i915_suspend.c
> +++ b/drivers/gpu/drm/i915/i915_suspend.c
> @@ -84,7 +84,7 @@ static void intel_restore_swf(struct drm_i915_private=
 *dev_priv)
>  =20
>   void i915_save_display(struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>  =20
>   	/* Display arbitration control */
>   	if (INTEL_GEN(dev_priv) <=3D 4)
> @@ -99,7 +99,7 @@ void i915_save_display(struct drm_i915_private *dev_p=
riv)
>  =20
>   void i915_restore_display(struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>  =20
>   	intel_restore_swf(dev_priv);
>  =20
> diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i=
915/i915_switcheroo.c
> index b3a24eac21f1..de0e224b56ce 100644
> --- a/drivers/gpu/drm/i915/i915_switcheroo.c
> +++ b/drivers/gpu/drm/i915/i915_switcheroo.c
> @@ -54,14 +54,14 @@ static const struct vga_switcheroo_client_ops i915_=
switcheroo_ops =3D {
>  =20
>   int i915_switcheroo_register(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  =20
>   	return vga_switcheroo_register_client(pdev, &i915_switcheroo_ops, fa=
lse);
>   }
>  =20
>   void i915_switcheroo_unregister(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  =20
>   	vga_switcheroo_unregister_client(pdev);
>   }
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i9=
15_vgpu.c
> index 70fca72f5162..172799277dd5 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -61,7 +61,7 @@
>    */
>   void intel_vgpu_detect(struct drm_i915_private *dev_priv)
>   {
> -	struct pci_dev *pdev =3D dev_priv->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>   	u64 magic;
>   	u16 version_major;
>   	void __iomem *shared_area;
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm=
/i915/intel_device_info.c
> index ef767f04c37c..5cda41e3b660 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -348,7 +348,7 @@ void intel_device_info_subplatform_init(struct drm_=
i915_private *i915)
>   	}
>  =20
>   	if (IS_TIGERLAKE(i915)) {
> -		struct pci_dev *root, *pdev =3D i915->drm.pdev;
> +		struct pci_dev *root, *pdev =3D to_pci_dev(i915->drm.dev);
>  =20
>   		root =3D list_first_entry(&pdev->bus->devices, typeof(*root), bus_l=
ist);
>  =20
> diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm=
/i915/intel_region_lmem.c
> index 40d8f1a95df6..0fe49b3adade 100644
> --- a/drivers/gpu/drm/i915/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/intel_region_lmem.c
> @@ -26,12 +26,12 @@ static int init_fake_lmem_bar(struct intel_memory_r=
egion *mem)
>   	if (ret)
>   		return ret;
>  =20
> -	mem->remap_addr =3D dma_map_resource(&i915->drm.pdev->dev,
> +	mem->remap_addr =3D dma_map_resource(i915->drm.dev,
>   					   mem->region.start,
>   					   mem->fake_mappable.size,
>   					   PCI_DMA_BIDIRECTIONAL,
>   					   DMA_ATTR_FORCE_CONTIGUOUS);
> -	if (dma_mapping_error(&i915->drm.pdev->dev, mem->remap_addr)) {
> +	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
>   		drm_mm_remove_node(&mem->fake_mappable);
>   		return -EINVAL;
>   	}
> @@ -56,7 +56,7 @@ static void release_fake_lmem_bar(struct intel_memory=
_region *mem)
>  =20
>   	drm_mm_remove_node(&mem->fake_mappable);
>  =20
> -	dma_unmap_resource(&mem->i915->drm.pdev->dev,
> +	dma_unmap_resource(mem->i915->drm.dev,
>   			   mem->remap_addr,
>   			   mem->fake_mappable.size,
>   			   PCI_DMA_BIDIRECTIONAL,
> @@ -104,7 +104,7 @@ const struct intel_memory_region_ops intel_region_l=
mem_ops =3D {
>   struct intel_memory_region *
>   intel_setup_fake_lmem(struct drm_i915_private *i915)
>   {
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>   	struct intel_memory_region *mem;
>   	resource_size_t mappable_end;
>   	resource_size_t io_start;
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/=
i915/intel_runtime_pm.c
> index 153ca9e65382..4970ef0843dc 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -625,7 +625,7 @@ void intel_runtime_pm_init_early(struct intel_runti=
me_pm *rpm)
>   {
>   	struct drm_i915_private *i915 =3D
>   			container_of(rpm, struct drm_i915_private, runtime_pm);
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>   	struct device *kdev =3D &pdev->dev;
>  =20
>   	rpm->kdev =3D kdev;
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915=
/intel_uncore.c
> index 1c14a07eba7d..4caee4d5c120 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1780,7 +1780,7 @@ static int i915_pmic_bus_access_notifier(struct n=
otifier_block *nb,
>   static int uncore_mmio_setup(struct intel_uncore *uncore)
>   {
>   	struct drm_i915_private *i915 =3D uncore->i915;
> -	struct pci_dev *pdev =3D i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>   	int mmio_bar;
>   	int mmio_size;
>  =20
> @@ -1812,7 +1812,7 @@ static int uncore_mmio_setup(struct intel_uncore =
*uncore)
>  =20
>   static void uncore_mmio_cleanup(struct intel_uncore *uncore)
>   {
> -	struct pci_dev *pdev =3D uncore->i915->drm.pdev;
> +	struct pci_dev *pdev =3D to_pci_dev(uncore->i915->drm.dev);
>  =20
>   	pci_iounmap(pdev, uncore->regs);
>   }
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers=
/gpu/drm/i915/selftests/mock_gem_device.c
> index e946bd2087d8..52513d5b7d03 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -148,7 +148,6 @@ struct drm_i915_private *mock_gem_device(void)
>   	}
>  =20
>   	pci_set_drvdata(pdev, i915);
> -	i915->drm.pdev =3D pdev;
>  =20
>   	dev_pm_domain_set(&pdev->dev, &pm_domain);
>   	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/dr=
m/i915/selftests/mock_gtt.c
> index 7270fc8ca801..5c7ae40bba63 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> @@ -74,7 +74,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private=
 *i915, const char *name)
>   	ppgtt->vm.i915 =3D i915;
>   	ppgtt->vm.total =3D round_down(U64_MAX, PAGE_SIZE);
>   	ppgtt->vm.file =3D ERR_PTR(-ENODEV);
> -	ppgtt->vm.dma =3D &i915->drm.pdev->dev;
> +	ppgtt->vm.dma =3D i915->drm.dev;
>  =20
>   	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zZIBcsgSWxAfruIe7oXEKwMFVLs0lHvaJ--

--CM0jC5U8MuBO69a3GrjT2ZgcVJ90gf3wi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/PMmAFAwAAAAAACgkQlh/E3EQov+BM
8A//ddcCfAT/t79a/IKrEQezxxzTFCnxlxwMyYpNHCApk80/9z3JiVyF92PFS/i99IgznSyXMN18
ATqDCVcJqO7G4CMfrvcDlUl2KWBXKZ/gGyo+2XMkhaV4EmR1q/OLHnUDEgqYCVBq7BfJ8/BQ1CXd
G8UNdHGl2gzHXW6aQsIXAwfKQPn3dEJFpXfdxJPS7QoFU58++g33+8KA1W73rT8N+3aw7rEN+Tpx
zFWTLLqCMcfomErS8O0TdApkdO9wXImpnYzwqKQAgMP0IBLqm6W2ci8GsKgthYCEDkpN+pfZAWGq
RTxnAAaMsyV3Lpu71iIWfUWgYCUvtyjRxyHby7/JRt6gqS5h4Plp2zQyCn1eEKvKh03qW6i+7J1F
eqKDgxob1WYPzVP5qTYOrbPHnr4Gq1tHeK0WJLy1Vf+l5F3LMn+J9Dh628aGd0/kC7qHY84LpVY2
8HQL727ROm54PlrwFQpW52n9x6hDHPOlS6KpxjOe9xlpER2hjduD+xgKWS1Stz+fEP1aApdWWgQT
NVVYqPVz2kvyJYnYbTfsfKVrbdmMb0zT3cdVheJjKPSCFJ1USN5NQXX+/QTSHrbr8Y5KhKONlgt1
+3MOcXJEkNuSdacuFmQvSEVRyr+I5KMINRuUTEax5kON97CXssvyGcsg+uM0EUKvd0FRLr2Wk6YW
URU=
=ykaq
-----END PGP SIGNATURE-----

--CM0jC5U8MuBO69a3GrjT2ZgcVJ90gf3wi--

--===============0183256167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0183256167==--
