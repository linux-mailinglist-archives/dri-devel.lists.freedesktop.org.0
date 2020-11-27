Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691F2C6721
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 14:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C02F6EDC5;
	Fri, 27 Nov 2020 13:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394F66ED29;
 Fri, 27 Nov 2020 13:46:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8989DABD7;
 Fri, 27 Nov 2020 13:46:22 +0000 (UTC)
Subject: Re: [PATCH 07/15] drm/i915: Remove references to struct
 drm_device.pdev
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, airlied@linux.ie,
 daniel@ffwll.ch
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-8-tzimmermann@suse.de>
 <160648322408.10416.6891470923981405939@jlahtine-mobl.ger.corp.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d9121289-f495-463c-c65c-70b9d814f1e0@suse.de>
Date: Fri, 27 Nov 2020 14:46:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <160648322408.10416.6891470923981405939@jlahtine-mobl.ger.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0983337197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0983337197==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="L5el6bBk9BpaKRCA7s2mD1EbCarpZ8o1d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--L5el6bBk9BpaKRCA7s2mD1EbCarpZ8o1d
Content-Type: multipart/mixed; boundary="ogEgZAafNAZUdcjc5p144gOH5FDvqw46w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, airlied@linux.ie,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <d9121289-f495-463c-c65c-70b9d814f1e0@suse.de>
Subject: Re: [PATCH 07/15] drm/i915: Remove references to struct
 drm_device.pdev
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-8-tzimmermann@suse.de>
 <160648322408.10416.6891470923981405939@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <160648322408.10416.6891470923981405939@jlahtine-mobl.ger.corp.intel.com>

--ogEgZAafNAZUdcjc5p144gOH5FDvqw46w
Content-Type: multipart/mixed;
 boundary="------------281C790030B195B844F0B064"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------281C790030B195B844F0B064
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.11.20 um 14:20 schrieb Joonas Lahtinen:
> Quoting Thomas Zimmermann (2020-11-24 13:38:16)
>> Using struct drm_device.pdev is deprecated. Convert i915 to struct
>> drm_device.dev. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> Any chance of sharing used a cocci script(s)? think this will
> hit many in-flight series, so life would made easier :)

There's no script, sorry. I did this by hand.

>=20
> Or is this done manually? I notice a few places hoist the pdev
> variable and others repeat the call. Regardless, using the cocci
> script as baseline would make review bit more comforting.
>=20
> The gvt changes would go in through the gvt tree, and we also
> probably need to split between drm-intel-next/drm-intel-gt-next,
> too.

My hope is that patches can be merged through driver trees and do not=20
create too many conflicts there. After the dust has settled, the final=20
patch would go through drm-misc. If any uses of pdev were added=20
meanwhile, I'd fix them through drm-misc as well.

Best regards
Thomas

>=20
> Jani or Rodrigo, any thoughts?
>=20
> Regards, Joonas
>=20
>> ---
>>   drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
>>   drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 ++++++-------
>>   drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
>>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
>>   drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
>>   .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +++--
>>   drivers/gpu/drm/i915/display/intel_opregion.c |  6 +++---
>>   drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
>>   drivers/gpu/drm/i915/display/intel_panel.c    |  4 ++--
>>   drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
>>   drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
>>   drivers/gpu/drm/i915/display/intel_vga.c      |  8 ++++----
>>   drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +++---
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +++++-----
>>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 ++--
>>   drivers/gpu/drm/i915/gt/intel_reset.c         |  6 +++---
>>   drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 +++--
>>   drivers/gpu/drm/i915/gvt/firmware.c           | 10 +++++-----
>>   drivers/gpu/drm/i915/gvt/gtt.c                | 12 +++++------
>>   drivers/gpu/drm/i915/gvt/gvt.c                |  6 +++---
>>   drivers/gpu/drm/i915/gvt/kvmgt.c              |  4 ++--
>>   drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
>>   drivers/gpu/drm/i915/i915_drv.c               | 20 +++++++++--------=
--
>>   drivers/gpu/drm/i915/i915_drv.h               |  2 +-
>>   drivers/gpu/drm/i915/i915_gem_gtt.c           |  4 ++--
>>   drivers/gpu/drm/i915/i915_getparam.c          |  5 +++--
>>   drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
>>   drivers/gpu/drm/i915/i915_irq.c               |  6 +++---
>>   drivers/gpu/drm/i915/i915_pmu.c               |  5 +++--
>>   drivers/gpu/drm/i915/i915_suspend.c           |  4 ++--
>>   drivers/gpu/drm/i915/i915_switcheroo.c        |  4 ++--
>>   drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
>>   drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
>>   drivers/gpu/drm/i915/intel_region_lmem.c      |  8 ++++----
>>   drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
>>   drivers/gpu/drm/i915/intel_uncore.c           |  4 ++--
>>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
>>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
>>   42 files changed, 99 insertions(+), 98 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/d=
rm/i915/display/intel_bios.c
>> index 4cc949b228f2..8879676372a3 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -2088,7 +2088,7 @@ bool intel_bios_is_valid_vbt(const void *buf, si=
ze_t size)
>>  =20
>>   static struct vbt_header *oprom_get_vbt(struct drm_i915_private *dev=
_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          void __iomem *p =3D NULL, *oprom;
>>          struct vbt_header *vbt;
>>          u16 vbt_size;
>> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/=
drm/i915/display/intel_cdclk.c
>> index c449d28d0560..a6e13208dc50 100644
>> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
>> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
>> @@ -96,7 +96,7 @@ static void fixed_450mhz_get_cdclk(struct drm_i915_p=
rivate *dev_priv,
>>   static void i85x_get_cdclk(struct drm_i915_private *dev_priv,
>>                             struct intel_cdclk_config *cdclk_config)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u16 hpllcc =3D 0;
>>  =20
>>          /*
>> @@ -138,7 +138,7 @@ static void i85x_get_cdclk(struct drm_i915_private=
 *dev_priv,
>>   static void i915gm_get_cdclk(struct drm_i915_private *dev_priv,
>>                               struct intel_cdclk_config *cdclk_config)=

>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u16 gcfgc =3D 0;
>>  =20
>>          pci_read_config_word(pdev, GCFGC, &gcfgc);
>> @@ -162,7 +162,7 @@ static void i915gm_get_cdclk(struct drm_i915_priva=
te *dev_priv,
>>   static void i945gm_get_cdclk(struct drm_i915_private *dev_priv,
>>                               struct intel_cdclk_config *cdclk_config)=

>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u16 gcfgc =3D 0;
>>  =20
>>          pci_read_config_word(pdev, GCFGC, &gcfgc);
>> @@ -256,7 +256,7 @@ static unsigned int intel_hpll_vco(struct drm_i915=
_private *dev_priv)
>>   static void g33_get_cdclk(struct drm_i915_private *dev_priv,
>>                            struct intel_cdclk_config *cdclk_config)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          static const u8 div_3200[] =3D { 12, 10,  8,  7, 5, 16 };
>>          static const u8 div_4000[] =3D { 14, 12, 10,  8, 6, 20 };
>>          static const u8 div_4800[] =3D { 20, 14, 12, 10, 8, 24 };
>> @@ -305,7 +305,7 @@ static void g33_get_cdclk(struct drm_i915_private =
*dev_priv,
>>   static void pnv_get_cdclk(struct drm_i915_private *dev_priv,
>>                            struct intel_cdclk_config *cdclk_config)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u16 gcfgc =3D 0;
>>  =20
>>          pci_read_config_word(pdev, GCFGC, &gcfgc);
>> @@ -339,7 +339,7 @@ static void pnv_get_cdclk(struct drm_i915_private =
*dev_priv,
>>   static void i965gm_get_cdclk(struct drm_i915_private *dev_priv,
>>                               struct intel_cdclk_config *cdclk_config)=

>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          static const u8 div_3200[] =3D { 16, 10,  8 };
>>          static const u8 div_4000[] =3D { 20, 12, 10 };
>>          static const u8 div_5333[] =3D { 24, 16, 14 };
>> @@ -384,7 +384,7 @@ static void i965gm_get_cdclk(struct drm_i915_priva=
te *dev_priv,
>>   static void gm45_get_cdclk(struct drm_i915_private *dev_priv,
>>                             struct intel_cdclk_config *cdclk_config)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          unsigned int cdclk_sel;
>>          u16 tmp =3D 0;
>>  =20
>> diff --git a/drivers/gpu/drm/i915/display/intel_csr.c b/drivers/gpu/dr=
m/i915/display/intel_csr.c
>> index 67dc64df78a5..19cbcab69689 100644
>> --- a/drivers/gpu/drm/i915/display/intel_csr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_csr.c
>> @@ -640,7 +640,7 @@ static void csr_load_work_fn(struct work_struct *w=
ork)
>>          dev_priv =3D container_of(work, typeof(*dev_priv), csr.work);=

>>          csr =3D &dev_priv->csr;
>>  =20
>> -       request_firmware(&fw, dev_priv->csr.fw_path, &dev_priv->drm.pd=
ev->dev);
>> +       request_firmware(&fw, dev_priv->csr.fw_path, dev_priv->drm.dev=
);
>>          parse_csr_fw(dev_priv, fw);
>>  =20
>>          if (dev_priv->csr.dmc_payload) {
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gp=
u/drm/i915/display/intel_dsi_vbt.c
>> index eed037ec0b29..e349caef1926 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> @@ -425,7 +425,7 @@ static void i2c_acpi_find_adapter(struct intel_dsi=
 *intel_dsi,
>>                                    const u16 slave_addr)
>>   {
>>          struct drm_device *drm_dev =3D intel_dsi->base.base.dev;
>> -       struct device *dev =3D &drm_dev->pdev->dev;
>> +       struct device *dev =3D drm_dev->dev;
>>          struct acpi_device *acpi_dev;
>>          struct list_head resource_list;
>>          struct i2c_adapter_lookup lookup;
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/=
drm/i915/display/intel_fbdev.c
>> index 842c04e63214..4ccb462bd497 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -167,7 +167,7 @@ static int intelfb_create(struct drm_fb_helper *he=
lper,
>>          struct intel_framebuffer *intel_fb =3D ifbdev->fb;
>>          struct drm_device *dev =3D helper->dev;
>>          struct drm_i915_private *dev_priv =3D to_i915(dev);
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          struct i915_ggtt *ggtt =3D &dev_priv->ggtt;
>>          const struct i915_ggtt_view view =3D {
>>                  .type =3D I915_GGTT_VIEW_NORMAL,
>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/=
drm/i915/display/intel_gmbus.c
>> index b0d71bbbf2ad..0c952e1d720e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> @@ -840,7 +840,7 @@ static const struct i2c_lock_operations gmbus_lock=
_ops =3D {
>>    */
>>   int intel_gmbus_setup(struct drm_i915_private *dev_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          struct intel_gmbus *bus;
>>          unsigned int pin;
>>          int ret;
>> diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/=
gpu/drm/i915/display/intel_lpe_audio.c
>> index ad5cc13037ae..98eb52a938d0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
>> +++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
>> @@ -80,6 +80,7 @@ static struct platform_device *
>>   lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
>>   {
>>          struct drm_device *dev =3D &dev_priv->drm;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>>          struct platform_device_info pinfo =3D {};
>>          struct resource *rsc;
>>          struct platform_device *platdev;
>> @@ -99,9 +100,9 @@ lpe_audio_platdev_create(struct drm_i915_private *d=
ev_priv)
>>          rsc[0].flags    =3D IORESOURCE_IRQ;
>>          rsc[0].name     =3D "hdmi-lpe-audio-irq";
>>  =20
>> -       rsc[1].start    =3D pci_resource_start(dev->pdev, 0) +
>> +       rsc[1].start    =3D pci_resource_start(pdev, 0) +
>>                  I915_HDMI_LPE_AUDIO_BASE;
>> -       rsc[1].end      =3D pci_resource_start(dev->pdev, 0) +
>> +       rsc[1].end      =3D pci_resource_start(pdev, 0) +
>>                  I915_HDMI_LPE_AUDIO_BASE + I915_HDMI_LPE_AUDIO_SIZE -=
 1;
>>          rsc[1].flags    =3D IORESOURCE_MEM;
>>          rsc[1].name     =3D "hdmi-lpe-audio-mmio";
>> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/g=
pu/drm/i915/display/intel_opregion.c
>> index 4f77cf849171..dfd724e506b5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_opregion.c
>> +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
>> @@ -247,7 +247,7 @@ static int swsci(struct drm_i915_private *dev_priv=
,
>>                   u32 function, u32 parm, u32 *parm_out)
>>   {
>>          struct opregion_swsci *swsci =3D dev_priv->opregion.swsci;
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u32 main_function, sub_function, scic;
>>          u16 swsci_val;
>>          u32 dslp;
>> @@ -807,7 +807,7 @@ static int intel_load_vbt_firmware(struct drm_i915=
_private *dev_priv)
>>          if (!name || !*name)
>>                  return -ENOENT;
>>  =20
>> -       ret =3D request_firmware(&fw, name, &dev_priv->drm.pdev->dev);=

>> +       ret =3D request_firmware(&fw, name, dev_priv->drm.dev);
>>          if (ret) {
>>                  drm_err(&dev_priv->drm,
>>                          "Requesting VBT firmware \"%s\" failed (%d)\n=
",
>> @@ -840,7 +840,7 @@ static int intel_load_vbt_firmware(struct drm_i915=
_private *dev_priv)
>>   int intel_opregion_setup(struct drm_i915_private *dev_priv)
>>   {
>>          struct intel_opregion *opregion =3D &dev_priv->opregion;
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u32 asls, mboxes;
>>          char buf[sizeof(OPREGION_SIGNATURE)];
>>          int err =3D 0;
>> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gp=
u/drm/i915/display/intel_overlay.c
>> index 52b4f6193b4c..ea6a630cf6ef 100644
>> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
>> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
>> @@ -201,7 +201,7 @@ struct intel_overlay {
>>   static void i830_overlay_clock_gating(struct drm_i915_private *dev_p=
riv,
>>                                        bool enable)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u8 val;
>>  =20
>>          /* WA_OVERLAY_CLKGATE:alm */
>> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/=
drm/i915/display/intel_panel.c
>> index 9f23bac0d792..1b643ed71f66 100644
>> --- a/drivers/gpu/drm/i915/display/intel_panel.c
>> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
>> @@ -557,7 +557,7 @@ static u32 i9xx_get_backlight(struct intel_connect=
or *connector)
>>          if (panel->backlight.combination_mode) {
>>                  u8 lbpc;
>>  =20
>> -               pci_read_config_byte(dev_priv->drm.pdev, LBPC, &lbpc);=

>> +               pci_read_config_byte(to_pci_dev(dev_priv->drm.dev), LB=
PC, &lbpc);
>>                  val *=3D lbpc;
>>          }
>>  =20
>> @@ -631,7 +631,7 @@ static void i9xx_set_backlight(const struct drm_co=
nnector_state *conn_state, u32
>>  =20
>>                  lbpc =3D level * 0xfe / panel->backlight.max + 1;
>>                  level /=3D lbpc;
>> -               pci_write_config_byte(dev_priv->drm.pdev, LBPC, lbpc);=

>> +               pci_write_config_byte(to_pci_dev(dev_priv->drm.dev), L=
BPC, lbpc);
>>          }
>>  =20
>>          if (IS_GEN(dev_priv, 4)) {
>> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu=
/drm/i915/display/intel_quirks.c
>> index 46beb155d835..98dd787b00e3 100644
>> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
>> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
>> @@ -160,7 +160,7 @@ static struct intel_quirk intel_quirks[] =3D {
>>  =20
>>   void intel_init_quirks(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *d =3D i915->drm.pdev;
>> +       struct pci_dev *d =3D to_pci_dev(i915->drm.dev);
>>          int i;
>>  =20
>>          for (i =3D 0; i < ARRAY_SIZE(intel_quirks); i++) {
>> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/d=
rm/i915/display/intel_sdvo.c
>> index 4eaa4aa86ecd..3fac60899d8e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
>> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
>> @@ -3281,7 +3281,7 @@ static bool
>>   intel_sdvo_init_ddc_proxy(struct intel_sdvo *sdvo,
>>                            struct drm_i915_private *dev_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>  =20
>>          sdvo->ddc.owner =3D THIS_MODULE;
>>          sdvo->ddc.class =3D I2C_CLASS_DDC;
>> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/dr=
m/i915/display/intel_vga.c
>> index be333699c515..5f8e4f53649d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vga.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
>> @@ -25,7 +25,7 @@ static i915_reg_t intel_vga_cntrl_reg(struct drm_i91=
5_private *i915)
>>   /* Disable the VGA plane that we never use */
>>   void intel_vga_disable(struct drm_i915_private *dev_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          i915_reg_t vga_reg =3D intel_vga_cntrl_reg(dev_priv);
>>          u8 sr1;
>>  =20
>> @@ -76,7 +76,7 @@ void intel_vga_redisable(struct drm_i915_private *i9=
15)
>>  =20
>>   void intel_vga_reset_io_mem(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>  =20
>>          /*
>>           * After we re-enable the power well, if we touch VGA registe=
r 0x3d5
>> @@ -136,7 +136,7 @@ intel_vga_set_decode(void *cookie, bool enable_dec=
ode)
>>  =20
>>   int intel_vga_register(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>          int ret;
>>  =20
>>          /*
>> @@ -156,7 +156,7 @@ int intel_vga_register(struct drm_i915_private *i9=
15)
>>  =20
>>   void intel_vga_unregister(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>  =20
>>          vga_client_register(pdev, NULL, NULL, NULL);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_phys.c
>> index 3a4dfe2ef1da..f47dafdda539 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>> @@ -35,7 +35,7 @@ static int i915_gem_object_get_pages_phys(struct drm=
_i915_gem_object *obj)
>>           * to handle all possible callers, and given typical object s=
izes,
>>           * the alignment of the buddy allocation will naturally match=
=2E
>>           */
>> -       vaddr =3D dma_alloc_coherent(&obj->base.dev->pdev->dev,
>> +       vaddr =3D dma_alloc_coherent(obj->base.dev->dev,
>>                                     roundup_pow_of_two(obj->base.size)=
,
>>                                     &dma, GFP_KERNEL);
>>          if (!vaddr)
>> @@ -83,7 +83,7 @@ static int i915_gem_object_get_pages_phys(struct drm=
_i915_gem_object *obj)
>>   err_st:
>>          kfree(st);
>>   err_pci:
>> -       dma_free_coherent(&obj->base.dev->pdev->dev,
>> +       dma_free_coherent(obj->base.dev->dev,
>>                            roundup_pow_of_two(obj->base.size),
>>                            vaddr, dma);
>>          return -ENOMEM;
>> @@ -129,7 +129,7 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem=
_object *obj,
>>          sg_free_table(pages);
>>          kfree(pages);
>>  =20
>> -       dma_free_coherent(&obj->base.dev->pdev->dev,
>> +       dma_free_coherent(obj->base.dev->dev,
>>                            roundup_pow_of_two(obj->base.size),
>>                            vaddr, dma);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_shmem.c
>> index 75e8b71c18b9..08c9c25f1109 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -172,7 +172,7 @@ static int shmem_get_pages(struct drm_i915_gem_obj=
ect *obj)
>>                          max_segment =3D PAGE_SIZE;
>>                          goto rebuild_st;
>>                  } else {
>> -                       dev_warn(&i915->drm.pdev->dev,
>> +                       dev_warn(i915->drm.dev,
>>                                   "Failed to DMA remap %lu pages\n",
>>                                   page_count);
>>                          goto err_pages;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/d=
rm/i915/gt/intel_engine_cs.c
>> index d4e988b2816a..71bd2e22e7c6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -1228,7 +1228,7 @@ bool intel_engine_is_idle(struct intel_engine_cs=
 *engine)
>>  =20
>>          /* Waiting to drain ELSP? */
>>          if (execlists_active(&engine->execlists)) {
>> -               synchronize_hardirq(engine->i915->drm.pdev->irq);
>> +               synchronize_hardirq(to_pci_dev(engine->i915->drm.dev)-=
>irq);
>>  =20
>>                  intel_engine_flush_submission(engine);
>>  =20
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i9=
15/gt/intel_ggtt.c
>> index cf94525be2c1..591c6a2a0a8f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -760,7 +760,7 @@ static unsigned int chv_get_total_gtt_size(u16 gmc=
h_ctrl)
>>   static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
>>   {
>>          struct drm_i915_private *i915 =3D ggtt->vm.i915;
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>          phys_addr_t phys_addr;
>>          int ret;
>>  =20
>> @@ -830,7 +830,7 @@ static struct resource pci_resource(struct pci_dev=
 *pdev, int bar)
>>   static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>   {
>>          struct drm_i915_private *i915 =3D ggtt->vm.i915;
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>          unsigned int size;
>>          u16 snb_gmch_ctl;
>>  =20
>> @@ -974,7 +974,7 @@ static u64 iris_pte_encode(dma_addr_t addr,
>>   static int gen6_gmch_probe(struct i915_ggtt *ggtt)
>>   {
>>          struct drm_i915_private *i915 =3D ggtt->vm.i915;
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>          unsigned int size;
>>          u16 snb_gmch_ctl;
>>  =20
>> @@ -1037,7 +1037,7 @@ static int i915_gmch_probe(struct i915_ggtt *ggt=
t)
>>          phys_addr_t gmadr_base;
>>          int ret;
>>  =20
>> -       ret =3D intel_gmch_probe(i915->bridge_dev, i915->drm.pdev, NUL=
L);
>> +       ret =3D intel_gmch_probe(i915->bridge_dev, to_pci_dev(i915->dr=
m.dev), NULL);
>>          if (!ret) {
>>                  drm_err(&i915->drm, "failed to set up gmch\n");
>>                  return -EIO;
>> @@ -1077,7 +1077,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt,=
 struct intel_gt *gt)
>>  =20
>>          ggtt->vm.gt =3D gt;
>>          ggtt->vm.i915 =3D i915;
>> -       ggtt->vm.dma =3D &i915->drm.pdev->dev;
>> +       ggtt->vm.dma =3D i915->drm.dev;
>>  =20
>>          if (INTEL_GEN(i915) <=3D 5)
>>                  ret =3D i915_gmch_probe(ggtt);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i=
915/gt/intel_ppgtt.c
>> index 46d9aceda64c..01b7d08532f2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>> @@ -301,7 +301,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct i=
ntel_gt *gt)
>>  =20
>>          ppgtt->vm.gt =3D gt;
>>          ppgtt->vm.i915 =3D i915;
>> -       ppgtt->vm.dma =3D &i915->drm.pdev->dev;
>> +       ppgtt->vm.dma =3D i915->drm.dev;
>>          ppgtt->vm.total =3D BIT_ULL(INTEL_INFO(i915)->ppgtt_size);
>>  =20
>>          i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i91=
5/gt/intel_rc6.c
>> index d7b8e4457fc2..cce53fb9589c 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
>> @@ -485,14 +485,14 @@ static bool rc6_supported(struct intel_rc6 *rc6)=

>>   static void rpm_get(struct intel_rc6 *rc6)
>>   {
>>          GEM_BUG_ON(rc6->wakeref);
>> -       pm_runtime_get_sync(&rc6_to_i915(rc6)->drm.pdev->dev);
>> +       pm_runtime_get_sync(rc6_to_i915(rc6)->drm.dev);
>>          rc6->wakeref =3D true;
>>   }
>>  =20
>>   static void rpm_put(struct intel_rc6 *rc6)
>>   {
>>          GEM_BUG_ON(!rc6->wakeref);
>> -       pm_runtime_put(&rc6_to_i915(rc6)->drm.pdev->dev);
>> +       pm_runtime_put(rc6_to_i915(rc6)->drm.dev);
>>          rc6->wakeref =3D false;
>>   }
>>  =20
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i=
915/gt/intel_reset.c
>> index 3654c955e6be..a49faf4ec139 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -180,7 +180,7 @@ static int i915_do_reset(struct intel_gt *gt,
>>                           intel_engine_mask_t engine_mask,
>>                           unsigned int retry)
>>   {
>> -       struct pci_dev *pdev =3D gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gt->i915->drm.dev);
>>          int err;
>>  =20
>>          /* Assert reset for at least 20 usec, and wait for acknowledg=
ement. */
>> @@ -209,7 +209,7 @@ static int g33_do_reset(struct intel_gt *gt,
>>                          intel_engine_mask_t engine_mask,
>>                          unsigned int retry)
>>   {
>> -       struct pci_dev *pdev =3D gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gt->i915->drm.dev);
>>  =20
>>          pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
>>          return wait_for_atomic(g4x_reset_complete(pdev), 50);
>> @@ -219,7 +219,7 @@ static int g4x_do_reset(struct intel_gt *gt,
>>                          intel_engine_mask_t engine_mask,
>>                          unsigned int retry)
>>   {
>> -       struct pci_dev *pdev =3D gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gt->i915->drm.dev);
>>          struct intel_uncore *uncore =3D gt->uncore;
>>          int ret;
>>  =20
>> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i9=
15/gvt/cfg_space.c
>> index ad86c5eb5bba..b490e3db2e38 100644
>> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
>> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
>> @@ -374,6 +374,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *=
vgpu,
>>                                 bool primary)
>>   {
>>          struct intel_gvt *gvt =3D vgpu->gvt;
>> +       struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
>>          const struct intel_gvt_device_info *info =3D &gvt->device_inf=
o;
>>          u16 *gmch_ctl;
>>          u8 next;
>> @@ -407,9 +408,9 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *=
vgpu,
>>          memset(vgpu_cfg_space(vgpu) + INTEL_GVT_PCI_OPREGION, 0, 4);
>>  =20
>>          vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].size =3D
>> -               pci_resource_len(gvt->gt->i915->drm.pdev, 0);
>> +               pci_resource_len(pdev, 0);
>>          vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].size =3D
>> -               pci_resource_len(gvt->gt->i915->drm.pdev, 2);
>> +               pci_resource_len(pdev, 2);
>>  =20
>>          memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
>>  =20
>> diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i91=
5/gvt/firmware.c
>> index 990a181094e3..1a8274a3f4b1 100644
>> --- a/drivers/gpu/drm/i915/gvt/firmware.c
>> +++ b/drivers/gpu/drm/i915/gvt/firmware.c
>> @@ -76,7 +76,7 @@ static int mmio_snapshot_handler(struct intel_gvt *g=
vt, u32 offset, void *data)
>>   static int expose_firmware_sysfs(struct intel_gvt *gvt)
>>   {
>>          struct intel_gvt_device_info *info =3D &gvt->device_info;
>> -       struct pci_dev *pdev =3D gvt->gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
>>          struct gvt_firmware_header *h;
>>          void *firmware;
>>          void *p;
>> @@ -127,7 +127,7 @@ static int expose_firmware_sysfs(struct intel_gvt =
*gvt)
>>  =20
>>   static void clean_firmware_sysfs(struct intel_gvt *gvt)
>>   {
>> -       struct pci_dev *pdev =3D gvt->gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
>>  =20
>>          device_remove_bin_file(&pdev->dev, &firmware_attr);
>>          vfree(firmware_attr.private);
>> @@ -151,7 +151,7 @@ static int verify_firmware(struct intel_gvt *gvt,
>>                             const struct firmware *fw)
>>   {
>>          struct intel_gvt_device_info *info =3D &gvt->device_info;
>> -       struct pci_dev *pdev =3D gvt->gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
>>          struct gvt_firmware_header *h;
>>          unsigned long id, crc32_start;
>>          const void *mem;
>> @@ -205,7 +205,7 @@ static int verify_firmware(struct intel_gvt *gvt,
>>   int intel_gvt_load_firmware(struct intel_gvt *gvt)
>>   {
>>          struct intel_gvt_device_info *info =3D &gvt->device_info;
>> -       struct pci_dev *pdev =3D gvt->gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
>>          struct intel_gvt_firmware *firmware =3D &gvt->firmware;
>>          struct gvt_firmware_header *h;
>>          const struct firmware *fw;
>> @@ -240,7 +240,7 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt)=

>>  =20
>>          gvt_dbg_core("request hw state firmware %s...\n", path);
>>  =20
>> -       ret =3D request_firmware(&fw, path, &gvt->gt->i915->drm.pdev->=
dev);
>> +       ret =3D request_firmware(&fw, path, gvt->gt->i915->drm.dev);
>>          kfree(path);
>>  =20
>>          if (ret)
>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt=
/gtt.c
>> index a3a4305eda01..c9eb4c7ac608 100644
>> --- a/drivers/gpu/drm/i915/gvt/gtt.c
>> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
>> @@ -737,7 +737,7 @@ static int detach_oos_page(struct intel_vgpu *vgpu=
,
>>  =20
>>   static void ppgtt_free_spt(struct intel_vgpu_ppgtt_spt *spt)
>>   {
>> -       struct device *kdev =3D &spt->vgpu->gvt->gt->i915->drm.pdev->d=
ev;
>> +       struct device *kdev =3D spt->vgpu->gvt->gt->i915->drm.dev;
>>  =20
>>          trace_spt_free(spt->vgpu->id, spt, spt->guest_page.type);
>>  =20
>> @@ -822,7 +822,7 @@ static int reclaim_one_ppgtt_mm(struct intel_gvt *=
gvt);
>>   static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
>>                  struct intel_vgpu *vgpu, enum intel_gvt_gtt_type type=
)
>>   {
>> -       struct device *kdev =3D &vgpu->gvt->gt->i915->drm.pdev->dev;
>> +       struct device *kdev =3D vgpu->gvt->gt->i915->drm.dev;
>>          struct intel_vgpu_ppgtt_spt *spt =3D NULL;
>>          dma_addr_t daddr;
>>          int ret;
>> @@ -2376,7 +2376,7 @@ static int alloc_scratch_pages(struct intel_vgpu=
 *vgpu,
>>                                  vgpu->gvt->device_info.gtt_entry_size=
_shift;
>>          void *scratch_pt;
>>          int i;
>> -       struct device *dev =3D &vgpu->gvt->gt->i915->drm.pdev->dev;
>> +       struct device *dev =3D vgpu->gvt->gt->i915->drm.dev;
>>          dma_addr_t daddr;
>>  =20
>>          if (drm_WARN_ON(&i915->drm,
>> @@ -2434,7 +2434,7 @@ static int alloc_scratch_pages(struct intel_vgpu=
 *vgpu,
>>   static int release_scratch_page_tree(struct intel_vgpu *vgpu)
>>   {
>>          int i;
>> -       struct device *dev =3D &vgpu->gvt->gt->i915->drm.pdev->dev;
>> +       struct device *dev =3D vgpu->gvt->gt->i915->drm.dev;
>>          dma_addr_t daddr;
>>  =20
>>          for (i =3D GTT_TYPE_PPGTT_PTE_PT; i < GTT_TYPE_MAX; i++) {
>> @@ -2706,7 +2706,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
>>   {
>>          int ret;
>>          void *page;
>> -       struct device *dev =3D &gvt->gt->i915->drm.pdev->dev;
>> +       struct device *dev =3D gvt->gt->i915->drm.dev;
>>          dma_addr_t daddr;
>>  =20
>>          gvt_dbg_core("init gtt\n");
>> @@ -2755,7 +2755,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
>>    */
>>   void intel_gvt_clean_gtt(struct intel_gvt *gvt)
>>   {
>> -       struct device *dev =3D &gvt->gt->i915->drm.pdev->dev;
>> +       struct device *dev =3D gvt->gt->i915->drm.dev;
>>          dma_addr_t daddr =3D (dma_addr_t)(gvt->gtt.scratch_mfn <<
>>                                          I915_GTT_PAGE_SHIFT);
>>  =20
>> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt=
/gvt.c
>> index c7c561237883..65b1fb256e0c 100644
>> --- a/drivers/gpu/drm/i915/gvt/gvt.c
>> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
>> @@ -50,7 +50,7 @@ static struct intel_vgpu_type *intel_gvt_find_vgpu_t=
ype(struct intel_gvt *gvt,
>>                  const char *name)
>>   {
>>          const char *driver_name =3D
>> -               dev_driver_string(&gvt->gt->i915->drm.pdev->dev);
>> +               dev_driver_string(gvt->gt->i915->drm.dev);
>>          int i;
>>  =20
>>          name +=3D strlen(driver_name) + 1;
>> @@ -189,7 +189,7 @@ static const struct intel_gvt_ops intel_gvt_ops =3D=
 {
>>   static void init_device_info(struct intel_gvt *gvt)
>>   {
>>          struct intel_gvt_device_info *info =3D &gvt->device_info;
>> -       struct pci_dev *pdev =3D gvt->gt->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(gvt->gt->i915->drm.dev);
>>  =20
>>          info->max_support_vgpus =3D 8;
>>          info->cfg_space_size =3D PCI_CFG_SPACE_EXP_SIZE;
>> @@ -376,7 +376,7 @@ int intel_gvt_init_device(struct drm_i915_private =
*i915)
>>          intel_gvt_debugfs_init(gvt);
>>  =20
>>          gvt_dbg_core("gvt device initialization is done\n");
>> -       intel_gvt_host.dev =3D &i915->drm.pdev->dev;
>> +       intel_gvt_host.dev =3D i915->drm.dev;
>>          intel_gvt_host.initialized =3D true;
>>          return 0;
>>  =20
>> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/g=
vt/kvmgt.c
>> index 778eb8cab610..7ffb90aa4402 100644
>> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
>> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
>> @@ -221,7 +221,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *v=
gpu, unsigned long gfn,
>>   static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long g=
fn,
>>                  dma_addr_t *dma_addr, unsigned long size)
>>   {
>> -       struct device *dev =3D &vgpu->gvt->gt->i915->drm.pdev->dev;
>> +       struct device *dev =3D vgpu->gvt->gt->i915->drm.dev;
>>          struct page *page =3D NULL;
>>          int ret;
>>  =20
>> @@ -244,7 +244,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgp=
u, unsigned long gfn,
>>   static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned lon=
g gfn,
>>                  dma_addr_t dma_addr, unsigned long size)
>>   {
>> -       struct device *dev =3D &vgpu->gvt->gt->i915->drm.pdev->dev;
>> +       struct device *dev =3D vgpu->gvt->gt->i915->drm.dev;
>>  =20
>>          dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
>>          gvt_unpin_guest_page(vgpu, gfn, size);
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i91=
5/i915_debugfs.c
>> index 263074c2c097..b4d38f68a246 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -1275,7 +1275,7 @@ static int i915_llc(struct seq_file *m, void *da=
ta)
>>   static int i915_runtime_pm_status(struct seq_file *m, void *unused)
>>   {
>>          struct drm_i915_private *dev_priv =3D node_to_i915(m->private=
);
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>  =20
>>          if (!HAS_RUNTIME_PM(dev_priv))
>>                  seq_puts(m, "Runtime power management not supported\n=
");
>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i9=
15_drv.c
>> index f2389ba49c69..22cbd45f20f2 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.c
>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>> @@ -91,7 +91,7 @@ static const struct drm_driver driver;
>>  =20
>>   static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
>>   {
>> -       int domain =3D pci_domain_nr(dev_priv->drm.pdev->bus);
>> +       int domain =3D pci_domain_nr(to_pci_dev(dev_priv->drm.dev)->bu=
s);
>>  =20
>>          dev_priv->bridge_dev =3D
>>                  pci_get_domain_bus_and_slot(domain, 0, PCI_DEVFN(0, 0=
));
>> @@ -458,7 +458,6 @@ static void intel_sanitize_options(struct drm_i915=
_private *dev_priv)
>>    */
>>   static int i915_set_dma_info(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>>          unsigned int mask_size =3D INTEL_INFO(i915)->dma_mask_size;
>>          int ret;
>>  =20
>> @@ -468,9 +467,9 @@ static int i915_set_dma_info(struct drm_i915_priva=
te *i915)
>>           * We don't have a max segment size, so set it to the max so =
sg's
>>           * debugging layer doesn't complain
>>           */
>> -       dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>> +       dma_set_max_seg_size(i915->drm.dev, UINT_MAX);
>>  =20
>> -       ret =3D dma_set_mask(&pdev->dev, DMA_BIT_MASK(mask_size));
>> +       ret =3D dma_set_mask(i915->drm.dev, DMA_BIT_MASK(mask_size));
>>          if (ret)
>>                  goto mask_err;
>>  =20
>> @@ -490,7 +489,7 @@ static int i915_set_dma_info(struct drm_i915_priva=
te *i915)
>>          if (IS_I965G(i915) || IS_I965GM(i915))
>>                  mask_size =3D 32;
>>  =20
>> -       ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(mask_si=
ze));
>> +       ret =3D dma_set_coherent_mask(i915->drm.dev, DMA_BIT_MASK(mask=
_size));
>>          if (ret)
>>                  goto mask_err;
>>  =20
>> @@ -510,7 +509,7 @@ static int i915_set_dma_info(struct drm_i915_priva=
te *i915)
>>    */
>>   static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          int ret;
>>  =20
>>          if (i915_inject_probe_failure(dev_priv))
>> @@ -642,7 +641,7 @@ static int i915_driver_hw_probe(struct drm_i915_pr=
ivate *dev_priv)
>>    */
>>   static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)=

>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>  =20
>>          i915_perf_fini(dev_priv);
>>  =20
>> @@ -792,7 +791,6 @@ i915_driver_create(struct pci_dev *pdev, const str=
uct pci_device_id *ent)
>>          if (IS_ERR(i915))
>>                  return i915;
>>  =20
>> -       i915->drm.pdev =3D pdev;
>>          pci_set_drvdata(pdev, i915);
>>  =20
>>          /* Device parameters start as a copy of module parameters. */=

>> @@ -1094,7 +1092,7 @@ static int i915_drm_prepare(struct drm_device *d=
ev)
>>   static int i915_drm_suspend(struct drm_device *dev)
>>   {
>>          struct drm_i915_private *dev_priv =3D to_i915(dev);
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          pci_power_t opregion_target_state;
>>  =20
>>          disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>> @@ -1151,7 +1149,7 @@ get_suspend_mode(struct drm_i915_private *dev_pr=
iv, bool hibernate)
>>   static int i915_drm_suspend_late(struct drm_device *dev, bool hibern=
ation)
>>   {
>>          struct drm_i915_private *dev_priv =3D to_i915(dev);
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          struct intel_runtime_pm *rpm =3D &dev_priv->runtime_pm;
>>          int ret;
>>  =20
>> @@ -1279,7 +1277,7 @@ static int i915_drm_resume(struct drm_device *de=
v)
>>   static int i915_drm_resume_early(struct drm_device *dev)
>>   {
>>          struct drm_i915_private *dev_priv =3D to_i915(dev);
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          int ret;
>>  =20
>>          /*
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i9=
15_drv.h
>> index 15be8debae54..b5a33430f3b7 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -1295,7 +1295,7 @@ static inline struct drm_i915_private *pdev_to_i=
915(struct pci_dev *pdev)
>>   #define INTEL_DEVID(dev_priv)  (RUNTIME_INFO(dev_priv)->device_id)
>>  =20
>>   #define REVID_FOREVER          0xff
>> -#define INTEL_REVID(dev_priv)  ((dev_priv)->drm.pdev->revision)
>> +#define INTEL_REVID(dev_priv)  (to_pci_dev((dev_priv)->drm.dev)->revi=
sion)
>>  =20
>>   #define INTEL_GEN_MASK(s, e) ( \
>>          BUILD_BUG_ON_ZERO(!__builtin_constant_p(s)) + \
>> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i91=
5/i915_gem_gtt.c
>> index c5ee1567f3d1..55eb42e1c994 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
>> @@ -28,7 +28,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_o=
bject *obj,
>>                                 struct sg_table *pages)
>>   {
>>          do {
>> -               if (dma_map_sg_attrs(&obj->base.dev->pdev->dev,
>> +               if (dma_map_sg_attrs(obj->base.dev->dev,
>>                                       pages->sgl, pages->nents,
>>                                       PCI_DMA_BIDIRECTIONAL,
>>                                       DMA_ATTR_SKIP_CPU_SYNC |
>> @@ -56,7 +56,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_o=
bject *obj,
>>                                 struct sg_table *pages)
>>   {
>>          struct drm_i915_private *dev_priv =3D to_i915(obj->base.dev);=

>> -       struct device *kdev =3D &dev_priv->drm.pdev->dev;
>> +       struct device *kdev =3D dev_priv->drm.dev;
>>          struct i915_ggtt *ggtt =3D &dev_priv->ggtt;
>>  =20
>>          if (unlikely(ggtt->do_idle_maps)) {
>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i9=
15/i915_getparam.c
>> index f96032c60a12..8d37f4987cfa 100644
>> --- a/drivers/gpu/drm/i915/i915_getparam.c
>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
>> @@ -12,6 +12,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void=
 *data,
>>                          struct drm_file *file_priv)
>>   {
>>          struct drm_i915_private *i915 =3D to_i915(dev);
>> +       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>>          const struct sseu_dev_info *sseu =3D &i915->gt.info.sseu;
>>          drm_i915_getparam_t *param =3D data;
>>          int value;
>> @@ -24,10 +25,10 @@ int i915_getparam_ioctl(struct drm_device *dev, vo=
id *data,
>>                  /* Reject all old ums/dri params. */
>>                  return -ENODEV;
>>          case I915_PARAM_CHIPSET_ID:
>> -               value =3D i915->drm.pdev->device;
>> +               value =3D pdev->device;
>>                  break;
>>          case I915_PARAM_REVISION:
>> -               value =3D i915->drm.pdev->revision;
>> +               value =3D pdev->revision;
>>                  break;
>>          case I915_PARAM_NUM_FENCES_AVAIL:
>>                  value =3D i915->ggtt.num_fences;
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i=
915/i915_gpu_error.c
>> index d8cac4c5881f..97aa2c0f27aa 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -644,7 +644,7 @@ static void err_print_params(struct drm_i915_error=
_state_buf *m,
>>   static void err_print_pciid(struct drm_i915_error_state_buf *m,
>>                              struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>  =20
>>          err_printf(m, "PCI ID: 0x%04x\n", pdev->device);
>>          err_printf(m, "PCI Revision: 0x%02x\n", pdev->revision);
>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i9=
15_irq.c
>> index dc6febc63f1c..f8fade6af492 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.c
>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>> @@ -4354,7 +4354,7 @@ static void intel_irq_postinstall(struct drm_i91=
5_private *dev_priv)
>>    */
>>   int intel_irq_install(struct drm_i915_private *dev_priv)
>>   {
>> -       int irq =3D dev_priv->drm.pdev->irq;
>> +       int irq =3D to_pci_dev(dev_priv->drm.dev)->irq;
>>          int ret;
>>  =20
>>          /*
>> @@ -4389,7 +4389,7 @@ int intel_irq_install(struct drm_i915_private *d=
ev_priv)
>>    */
>>   void intel_irq_uninstall(struct drm_i915_private *dev_priv)
>>   {
>> -       int irq =3D dev_priv->drm.pdev->irq;
>> +       int irq =3D to_pci_dev(dev_priv->drm.dev)->irq;
>>  =20
>>          /*
>>           * FIXME we can get called twice during driver probe
>> @@ -4449,5 +4449,5 @@ bool intel_irqs_enabled(struct drm_i915_private =
*dev_priv)
>>  =20
>>   void intel_synchronize_irq(struct drm_i915_private *i915)
>>   {
>> -       synchronize_irq(i915->drm.pdev->irq);
>> +       synchronize_irq(to_pci_dev(i915->drm.dev)->irq);
>>   }
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i9=
15_pmu.c
>> index cd786ad12be7..58aa1aaaeb85 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -427,7 +427,8 @@ static enum hrtimer_restart i915_sample(struct hrt=
imer *hrtimer)
>>   static u64 count_interrupts(struct drm_i915_private *i915)
>>   {
>>          /* open-coded kstat_irqs() */
>> -       struct irq_desc *desc =3D irq_to_desc(i915->drm.pdev->irq);
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>> +       struct irq_desc *desc =3D irq_to_desc(pdev->irq);
>>          u64 sum =3D 0;
>>          int cpu;
>>  =20
>> @@ -1117,7 +1118,7 @@ static void i915_pmu_unregister_cpuhp_state(stru=
ct i915_pmu *pmu)
>>  =20
>>   static bool is_igp(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>  =20
>>          /* IGP is 0000:00:02.0 */
>>          return pci_domain_nr(pdev->bus) =3D=3D 0 &&
>> diff --git a/drivers/gpu/drm/i915/i915_suspend.c b/drivers/gpu/drm/i91=
5/i915_suspend.c
>> index db2111fc809e..2ec76acf778d 100644
>> --- a/drivers/gpu/drm/i915/i915_suspend.c
>> +++ b/drivers/gpu/drm/i915/i915_suspend.c
>> @@ -84,7 +84,7 @@ static void intel_restore_swf(struct drm_i915_privat=
e *dev_priv)
>>  =20
>>   void i915_save_display(struct drm_i915_private *dev_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>  =20
>>          /* Display arbitration control */
>>          if (INTEL_GEN(dev_priv) <=3D 4)
>> @@ -99,7 +99,7 @@ void i915_save_display(struct drm_i915_private *dev_=
priv)
>>  =20
>>   void i915_restore_display(struct drm_i915_private *dev_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>  =20
>>          intel_restore_swf(dev_priv);
>>  =20
>> diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/=
i915/i915_switcheroo.c
>> index b3a24eac21f1..de0e224b56ce 100644
>> --- a/drivers/gpu/drm/i915/i915_switcheroo.c
>> +++ b/drivers/gpu/drm/i915/i915_switcheroo.c
>> @@ -54,14 +54,14 @@ static const struct vga_switcheroo_client_ops i915=
_switcheroo_ops =3D {
>>  =20
>>   int i915_switcheroo_register(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>  =20
>>          return vga_switcheroo_register_client(pdev, &i915_switcheroo_=
ops, false);
>>   }
>>  =20
>>   void i915_switcheroo_unregister(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>  =20
>>          vga_switcheroo_unregister_client(pdev);
>>   }
>> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i=
915_vgpu.c
>> index 70fca72f5162..172799277dd5 100644
>> --- a/drivers/gpu/drm/i915/i915_vgpu.c
>> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
>> @@ -61,7 +61,7 @@
>>    */
>>   void intel_vgpu_detect(struct drm_i915_private *dev_priv)
>>   {
>> -       struct pci_dev *pdev =3D dev_priv->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
>>          u64 magic;
>>          u16 version_major;
>>          void __iomem *shared_area;
>> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/dr=
m/i915/intel_device_info.c
>> index e67cec8fa2aa..fab8b8770ca3 100644
>> --- a/drivers/gpu/drm/i915/intel_device_info.c
>> +++ b/drivers/gpu/drm/i915/intel_device_info.c
>> @@ -348,7 +348,7 @@ void intel_device_info_subplatform_init(struct drm=
_i915_private *i915)
>>          }
>>  =20
>>          if (IS_TIGERLAKE(i915)) {
>> -               struct pci_dev *root, *pdev =3D i915->drm.pdev;
>> +               struct pci_dev *root, *pdev =3D to_pci_dev(i915->drm.d=
ev);
>>  =20
>>                  root =3D list_first_entry(&pdev->bus->devices, typeof=
(*root), bus_list);
>>  =20
>> diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/dr=
m/i915/intel_region_lmem.c
>> index 40d8f1a95df6..0fe49b3adade 100644
>> --- a/drivers/gpu/drm/i915/intel_region_lmem.c
>> +++ b/drivers/gpu/drm/i915/intel_region_lmem.c
>> @@ -26,12 +26,12 @@ static int init_fake_lmem_bar(struct intel_memory_=
region *mem)
>>          if (ret)
>>                  return ret;
>>  =20
>> -       mem->remap_addr =3D dma_map_resource(&i915->drm.pdev->dev,
>> +       mem->remap_addr =3D dma_map_resource(i915->drm.dev,
>>                                             mem->region.start,
>>                                             mem->fake_mappable.size,
>>                                             PCI_DMA_BIDIRECTIONAL,
>>                                             DMA_ATTR_FORCE_CONTIGUOUS)=
;
>> -       if (dma_mapping_error(&i915->drm.pdev->dev, mem->remap_addr)) =
{
>> +       if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
>>                  drm_mm_remove_node(&mem->fake_mappable);
>>                  return -EINVAL;
>>          }
>> @@ -56,7 +56,7 @@ static void release_fake_lmem_bar(struct intel_memor=
y_region *mem)
>>  =20
>>          drm_mm_remove_node(&mem->fake_mappable);
>>  =20
>> -       dma_unmap_resource(&mem->i915->drm.pdev->dev,
>> +       dma_unmap_resource(mem->i915->drm.dev,
>>                             mem->remap_addr,
>>                             mem->fake_mappable.size,
>>                             PCI_DMA_BIDIRECTIONAL,
>> @@ -104,7 +104,7 @@ const struct intel_memory_region_ops intel_region_=
lmem_ops =3D {
>>   struct intel_memory_region *
>>   intel_setup_fake_lmem(struct drm_i915_private *i915)
>>   {
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>          struct intel_memory_region *mem;
>>          resource_size_t mappable_end;
>>          resource_size_t io_start;
>> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm=
/i915/intel_runtime_pm.c
>> index 153ca9e65382..4970ef0843dc 100644
>> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
>> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
>> @@ -625,7 +625,7 @@ void intel_runtime_pm_init_early(struct intel_runt=
ime_pm *rpm)
>>   {
>>          struct drm_i915_private *i915 =3D
>>                          container_of(rpm, struct drm_i915_private, ru=
ntime_pm);
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>          struct device *kdev =3D &pdev->dev;
>>  =20
>>          rpm->kdev =3D kdev;
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i91=
5/intel_uncore.c
>> index 1c14a07eba7d..4caee4d5c120 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> @@ -1780,7 +1780,7 @@ static int i915_pmic_bus_access_notifier(struct =
notifier_block *nb,
>>   static int uncore_mmio_setup(struct intel_uncore *uncore)
>>   {
>>          struct drm_i915_private *i915 =3D uncore->i915;
>> -       struct pci_dev *pdev =3D i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>>          int mmio_bar;
>>          int mmio_size;
>>  =20
>> @@ -1812,7 +1812,7 @@ static int uncore_mmio_setup(struct intel_uncore=
 *uncore)
>>  =20
>>   static void uncore_mmio_cleanup(struct intel_uncore *uncore)
>>   {
>> -       struct pci_dev *pdev =3D uncore->i915->drm.pdev;
>> +       struct pci_dev *pdev =3D to_pci_dev(uncore->i915->drm.dev);
>>  =20
>>          pci_iounmap(pdev, uncore->regs);
>>   }
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/driver=
s/gpu/drm/i915/selftests/mock_gem_device.c
>> index e946bd2087d8..52513d5b7d03 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> @@ -148,7 +148,6 @@ struct drm_i915_private *mock_gem_device(void)
>>          }
>>  =20
>>          pci_set_drvdata(pdev, i915);
>> -       i915->drm.pdev =3D pdev;
>>  =20
>>          dev_pm_domain_set(&pdev->dev, &pm_domain);
>>          pm_runtime_enable(&pdev->dev);
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/d=
rm/i915/selftests/mock_gtt.c
>> index 7270fc8ca801..5c7ae40bba63 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> @@ -74,7 +74,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_privat=
e *i915, const char *name)
>>          ppgtt->vm.i915 =3D i915;
>>          ppgtt->vm.total =3D round_down(U64_MAX, PAGE_SIZE);
>>          ppgtt->vm.file =3D ERR_PTR(-ENODEV);
>> -       ppgtt->vm.dma =3D &i915->drm.pdev->dev;
>> +       ppgtt->vm.dma =3D i915->drm.dev;
>>  =20
>>          i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
>>  =20
>> --=20
>> 2.29.2
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------281C790030B195B844F0B064
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
8LA
lAQTAQgAPhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKC=
QgL
AgQWAgMBAh4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLC=
dg6
2AmRirxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6=
PXo
clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7m=
neM
C5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6iKupZs=
tMx
stPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8osBv6pnSn7e=
ArO
wE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYbT6XMr=
yR9
hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU63Y0xnQN29=
UGD
bYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWGKdDegUR5BkDf=
Dg5
O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXodNFMAgTLJlLuD=
YOG
LK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAfAQYAQgAJhYhB=
HIX
+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojpfcIAInwP5Olc=
EKo
kTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1C=
paD
o4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4A=
M4G
ZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suS=
KHA
MtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8Ct=
irP
dPWu/VXNRYAl/lat7lSI3H26qrHCwHYEGAEIACACGwwWIQRyF/usjOnPY0ShaOVoDcEdUwt6I=
wUC
X7Th+gAKCRBoDcEdUwt6I1UpCAC6QD5CCT0KFET29VVo4d+JdB5YJZmB72bMyVk12MGrx0fPp=
OgW
muh+7n1zULU4UciMSa0C1uq1eZZu044X3xIcVQp9+/nINM2d4+8yLEktK8f2jMIulYRSQOYX5=
909
E7a4oyj+AEgEDvcQ9WZPf+tSVpPDsrLiIezF5JdH8W0SlhPd13kAYSCR0H53PmAS6a3Z8UeOO=
kof
Fp/9g2GvHGr7ln9s6wenGbq7NOPMXtFG0luQDkqOFfTNI82COJ2ak5j8WMl25t9Cr5s9K2FUW=
orW
CeJMmGDIblC76yQzI2Ub2jXudrZCgLzHr3Bnbd/B+CklVwMpaskDluc7z3OP7KvXzsFNBF+04=
RMB
EADSYkyG/50PjD4CAbEnwQYZl61RVMBb3jug1j2dDPmOcQSYbw7pKLLLUoHCwnZXeEhRdiZ5w=
qMo
fW6DNo9irHecDc0815aN5RMxUQIqX7W6L4lI2qdKsaEcMtYQVdxbdf1cjcMGGO6oxlQE0FO3C=
E/8
y4G/kndDT0APK9jb6SatTJyPJxXwNmR+HYrkbWr4RAVM6et0pQmMZ8sak+QEM0kBlKbI0sodQ=
OXs
7Y9acMYJ5F+xfWU9JVAaOs2TOmQavDZMr6MeOpe/UKFjAZvcvv5yF8v7l3U+kWrpj4wc1bbRp=
pDp
5k5RlCckAJ3QBNW6Im/YlgieJCK9ns0So1yVxrmjNZu4Un3UGFnndI+dvp1vahkjTZNRo2FzP=
GUl
k2oF+juZn26c0YAQSv16BPTVkTQGuFfrVF+P76qg5dJvjuBdhmLOhLu1i63nUYMIw7jBf1Qir=
0H6
98oyLfdGYtdHB0MN5IXSVpkgymIHp6b7H36OMeem4onzoeiMUv8IX+fwQMeJ8fBsl+yTtA1J1=
Lon
gjXxBkbvEG2AUjpDv73ZuMcu0WcHc5ajfM4wixTght+OgZ7Md5LtpTbV+qmaGo5nw+KDujdF3=
bNq
RMI7nwnyVvbAi3QZqiw+Tr7EZY8r+77ecNvF0hdbcoUGsSLPvLBSbcHwpYnbn36uehXBaxFws=
bC0
KwARAQABwsKsBBgBCAAgFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+04RMCGwICQAkQaA3BH=
VML
eiPBdCAEGQEIAB0WIQTGd2b9+m4xR3BgUWiWH8TcRCi/4AUCX7ThEwAKCRCWH8TcRCi/4JMoE=
AC0
B6V5uOWXzAg8e7v3e60R/0exHxFeTgKEvfNSJM204K2/c+mGH4UKh/kdiJoKF/y6Lu80o8ndt=
vyG
mQJ0yhypFyBSDNbgdeOHagIt7VvwXovwknYg+w2NavdhG5envhqX902XQE0mNNH1XizDRZ422=
8wl
V/fixCmAETZu5GKIFSTHOQrlZlwZ/RRRd3IqEb6bmpbPJZbBXOFolASXw3zs41xMar9zjLSY9=
LKp
SrF3Zy5F27QJhLxWsalLjtWcEwkxn5a5/4OAvAoNIn5NMGRoBmEYp3ZCRNbzkGT2gyOxrTcSf=
g7M
eHy//LX+1rpN02erf6HyoY6vLFFQlYZ5cnf97o67g7vz4cMGAbB4zZ/j5h3ggkSbjlsCmqXX4=
x/Z
7bB1078lwQdg9x+zo+0vxzk10TU1FoWsSAiravlw0riSjr+wjXr5IzBeMm0A7K1MZ2lne+mKj=
T72
bz2KE6isyrpIn4xlzLMQuh1OCthrHKb6GiJO4JWg/jWIt3yBov4EdFDXOnJl7Tq2CkpwrDTsH=
Dgi
Sw4xK+mHW3QFztsMQi6p7qaPCUSYAPIY4xzOTqExhMj/3Pgyg6hTvdGIpV9VzfMXIR68Pmw79=
BGZ
tEWaVXS+1ja+6kBOFIQ37sqOBorOGfp6c6Di+IN8mkEHyt9s2Q/YqpPdedm+58tinuaBSBeUk=
mhM
B/9rSzQXr84M1rhAehbaqDE+UYw8sfsQXiJkZYZz9BHp0YfhD9J5iwgGhYj+LU6dW1+eEsgcq=
fMH
Dexdvr9koHXeuMNaXa40++GX9cY9DU8RHbeYxGj35eVY793F4gfAAsD5DCF5pCcd7mhicp5eD=
rIq
258874hM7w1aSwMS+0K+oppSlIfdogKM/l8RA6oDGZySTkwxXQ8RAYb/ddVc5Ua2gzXccODBz=
JuT
a+aY+BxmIdz4oMzaNCiK3gedGKoRjnrGguEO+YL/Ji3NhHOXRKu/QVTFDmgpmA0oQTfY+iaLz=
bFk
keWD97V4vo2flZ8ii37fcKNX4daGGnRRFUh4BrBG
=3DskgE
-----END PGP PUBLIC KEY BLOCK-----

--------------281C790030B195B844F0B064--

--ogEgZAafNAZUdcjc5p144gOH5FDvqw46w--

--L5el6bBk9BpaKRCA7s2mD1EbCarpZ8o1d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/BAywFAwAAAAAACgkQlh/E3EQov+Dn
qw/+J+AwUvGWxJR8y0C11d3Pslk84VraU/wg28+7pdabyesJrIjp8iAR5650+jxcqEoWeLA86tZK
Z9RovCA9K7+mQwfEYTpcB1vptmt51zY6HLD8VgV35yOwfeAuWTdF9cY0rHBhWyaaRgWA8uqDfHwF
GNeiHUUwQqodI9hP8Plru5GHqH8TFl+EkDfcUxmpInBuVV0YNJgWlnIJSXdWhNRfW3KHNPEpNZXG
ISiKjj4C9t/g2O8f6AjcsAi0dxL19ckkKNRxNf9oqG9uEN3M+3GsaKLuZpyO5PVE2DIh/A9PzGhv
eN7DNvQLwt0KfDTueZMiRMvet53Y7fH8L25KzEOOaBVjN00oKyfTZ8QbShl5DRqZ9icvfATavPtR
yUt2hlGFfSWziHJ3gPTNK7VecbZbhj4QtgJd80mPWup8cRWNWRi7dVwGvaZ9CGjZ0o7ByT5u5VcD
yijVH/rXRZnIq/YyJLctdPu9RMVF0+IBqPVJkD81an5USExA2rmXZD4xTJLdOBNqBDr1mMXt/LZI
1ulvjQlq+XDl+YXItfoVsNgWTbk7xFowmsn5g9KFVjryJ8n4yd8kORkY+bgGe6dBpkE8xK2o/KKn
5V4x8+7MbfqA7GYwOwtuxoXTtZyFpdIZRTS0r3k4eT6iemaelK6hOroaYl6CAx9FB7e7ifmKvjVG
RCM=
=v+Mt
-----END PGP SIGNATURE-----

--L5el6bBk9BpaKRCA7s2mD1EbCarpZ8o1d--

--===============0983337197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0983337197==--
