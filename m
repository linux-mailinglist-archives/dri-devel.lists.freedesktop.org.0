Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A728F734107
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 14:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE13310E03C;
	Sat, 17 Jun 2023 12:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9E510E010
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 12:48:54 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-54fcef0204aso1312429a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687006134; x=1689598134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVvknmDY/Io41vqogwfVCT+KhXGdPj2LfX4XgJbZhws=;
 b=Wfchvqb9+2/QU8SjD9G8DPrT10r3x9YE74eHzkMuaWu5ksP1adMhu5mcMJOQEMjRw+
 CD+wTQRr9OgF03g4o1SapezXMxwpiS99cI2ldTc6Dd2OV6n4LQEJTNCa46hJqgNsBk8g
 zcjfiteDmej7O/r95nLpEqqFg04rfbw4MxzOuC8zkzmDRI+oVOMZQyCPk0P6zigMngZR
 ARiNXezsDbIJfeif7qW4HjuBI6kJo/GzUDPAMeD3r5fQoQ78v0jSvGcxqv5Zy/+hlrbx
 Rh70FDrlqmcYYm6wjCQ1UN100bfZ+XyORCVPztftYJ45sY0LtCtDRH9g7XmazWgIBXAi
 09lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687006134; x=1689598134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVvknmDY/Io41vqogwfVCT+KhXGdPj2LfX4XgJbZhws=;
 b=X7qn7rxqDsGaYEeOt/2CK3Wp5HnRORWzmEIvd5KMMSrzD9d0II0ZWq/KFzmU5DOv8U
 /gVSlcM8T7BSzHLq8qg5b4GmOsSv8H7FMOK+adtqS8ziF6vPGWrn+20YKQg4cFKaAPYV
 FrKTP0bwc2cheFuCmTeYeefHh6Tb/+HXhte3po/jMujBMY1fU33k+BJy5oOw48Knmlx5
 RXc/AvEzN7asQGJyMU/MoozowL6wwDeyURmJbZwVOMmFo+MIDE/4BuIqTtP48c5WsvgE
 2mMwQ2VgrszKv1mbJ3O5BHuZnTGY27WDyii+JKk3xZrUqSk9fPOxvRFlSGHPVmmua/mM
 h+sQ==
X-Gm-Message-State: AC+VfDxRqUHnVxp6l0BaKwrKQRBZsb33rVK7K5oQORxu19kMk4/RbJ1e
 IBKzqEzj6tSm33iQ02fURObqNBPm/6YG81VYAyE=
X-Google-Smtp-Source: ACHHUZ6LW7ncJNaBo2X4Lm/VvQOI5ygrqg5N5G1Y5Yhn2K6kTRCrySHCgH63P4LOnNKFYGNIbBYhxe+0QjvmEBR0JwE=
X-Received: by 2002:a17:902:c949:b0:1b5:f35:afec with SMTP id
 i9-20020a170902c94900b001b50f35afecmr5971493pla.58.1687006132839; Sat, 17 Jun
 2023 05:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-8-sarah.walker@imgtec.com>
In-Reply-To: <20230613144800.52657-8-sarah.walker@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 17 Jun 2023 07:48:41 -0500
Message-ID: <CAHCN7xK9rDyeTCFz3nonvEnKWyFeqsPpvzHcoPA6SCXSbTYGkw@mail.gmail.com>
Subject: Re: [PATCH v3 07/17] drm/imagination: Add GPU ID parsing and firmware
 loading
To: Sarah Walker <sarah.walker@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 10:20=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.=
com> wrote:
>
> Read the GPU ID register at probe time and select the correct
> features/quirks/enhancements. Use the GPU ID to form the firmware
> file name and load the firmware.

I have a Rogue 6250 variant, but the BVNC is returning a slightly
different revision than the firmware that's currently available, and
the older firmware for the vendor driver doesn't work with this new
code.

Linux responds with Unsupported BVNC: 4.45.2.58.  From what I can
tell, the closest available firmware is 4.40.2.51.

Will there be more firmware variants in the future or will there be
some options to build the firmware somehow?

adam




>
> The features/quirks/enhancements arrays are currently hardcoded in
> the driver for the supported GPUs. We are looking at moving this
> information to the firmware image.
>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>  drivers/gpu/drm/imagination/Makefile          |   1 +
>  drivers/gpu/drm/imagination/pvr_device.c      | 359 ++++++++++++
>  drivers/gpu/drm/imagination/pvr_device.h      | 221 +++++++
>  drivers/gpu/drm/imagination/pvr_device_info.c | 223 +++++++
>  drivers/gpu/drm/imagination/pvr_device_info.h | 133 +++++
>  drivers/gpu/drm/imagination/pvr_drv.c         | 553 +++++++++++++++++-
>  drivers/gpu/drm/imagination/pvr_drv.h         | 108 ++++
>  drivers/gpu/drm/imagination/pvr_fw.h          |  20 +
>  8 files changed, 1617 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
>
> diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagi=
nation/Makefile
> index 186f920d615b..d713b1280776 100644
> --- a/drivers/gpu/drm/imagination/Makefile
> +++ b/drivers/gpu/drm/imagination/Makefile
> @@ -5,6 +5,7 @@ subdir-ccflags-y :=3D -I$(srctree)/$(src)
>
>  powervr-y :=3D \
>         pvr_device.o \
> +       pvr_device_info.o \
>         pvr_drv.o \
>
>  obj-$(CONFIG_DRM_POWERVR) +=3D powervr.o
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/i=
magination/pvr_device.c
> index 790c36cebec1..2e03763f2eb7 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -2,20 +2,32 @@
>  /* Copyright (c) 2022 Imagination Technologies Ltd. */
>
>  #include "pvr_device.h"
> +#include "pvr_device_info.h"
> +
> +#include "pvr_fw.h"
> +#include "pvr_rogue_cr_defs.h"
>
>  #include <drm/drm_print.h>
>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/compiler_attributes.h>
>  #include <linux/compiler_types.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> +#include <linux/firmware.h>
>  #include <linux/gfp.h>
> +#include <linux/interrupt.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/stddef.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +/* Major number for the supported version of the firmware. */
> +#define PVR_FW_VERSION_MAJOR 1
>
>  /**
>   * pvr_device_reg_init() - Initialize kernel access to a PowerVR device'=
s
> @@ -205,6 +217,246 @@ pvr_device_regulator_init(struct pvr_device *pvr_de=
v)
>         return err;
>  }
>
> +/**
> + * pvr_device_clk_core_get_freq - Get current PowerVR device core clock =
frequency
> + * @pvr_dev: Target PowerVR device.
> + * @freq_out: Pointer to location to store core clock frequency in Hz.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * -%EINVAL if frequency can not be determined.
> + */
> +int
> +pvr_device_clk_core_get_freq(struct pvr_device *pvr_dev, u32 *freq_out)
> +{
> +       u32 freq =3D clk_get_rate(pvr_dev->core_clk);
> +
> +       if (!freq)
> +               return -EINVAL;
> +
> +       *freq_out =3D freq;
> +       return 0;
> +}
> +
> +/**
> + * pvr_build_firmware_filename() - Construct a PowerVR firmware filename
> + * @pvr_dev: Target PowerVR device.
> + * @base: First part of the filename.
> + * @major: Major version number.
> + *
> + * A PowerVR firmware filename consists of three parts separated by unde=
rscores
> + * (``'_'``) along with a '.fw' file suffix. The first part is the exact=
 value
> + * of @base, the second part is the hardware version string derived from=
 @pvr_fw
> + * and the final part is the firmware version number constructed from @m=
ajor with
> + * a 'v' prefix, e.g. powervr/rogue_4.40.2.51_v1.fw.
> + *
> + * The returned string will have been slab allocated and must be freed w=
ith
> + * kfree().
> + *
> + * Return:
> + *  * The constructed filename on success, or
> + *  * Any error returned by kasprintf().
> + */
> +static char *
> +pvr_build_firmware_filename(struct pvr_device *pvr_dev, const char *base=
,
> +                           u8 major)
> +{
> +       struct pvr_gpu_id *gpu_id =3D &pvr_dev->gpu_id;
> +
> +       return kasprintf(GFP_KERNEL, "%s_%d.%d.%d.%d_v%d.fw", base, gpu_i=
d->b,
> +                        gpu_id->v, gpu_id->n, gpu_id->c, major);
> +}
> +
> +/**
> + * pvr_request_firmware() - Load firmware for a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + *
> + * See pvr_build_firmware_filename() for details on firmware file naming=
.
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error returned by pvr_build_firmware_filename(), or
> + *  * Any error returned by request_firmware().
> + */
> +static int
> +pvr_request_firmware(struct pvr_device *pvr_dev)
> +{
> +       struct drm_device *drm_dev =3D &pvr_dev->base;
> +       char *filename;
> +       const struct firmware *fw;
> +       int err;
> +
> +       filename =3D pvr_build_firmware_filename(pvr_dev, "powervr/rogue"=
,
> +                                              PVR_FW_VERSION_MAJOR);
> +       if (IS_ERR(filename))
> +               return PTR_ERR(filename);
> +
> +       /*
> +        * This function takes a copy of &filename, meaning we can free o=
ur
> +        * instance before returning.
> +        */
> +       err =3D request_firmware(&fw, filename, pvr_dev->base.dev);
> +       if (err) {
> +               drm_err(drm_dev, "failed to load firmware %s (err=3D%d)\n=
",
> +                       filename, err);
> +               goto err_free_filename;
> +       }
> +
> +       drm_info(drm_dev, "loaded firmware %s\n", filename);
> +       kfree(filename);
> +
> +       pvr_dev->fw_dev.firmware =3D fw;
> +
> +       return 0;
> +
> +err_free_filename:
> +       kfree(filename);
> +
> +       return err;
> +}
> +
> +/**
> + * pvr_load_gpu_id() - Load a PowerVR device's GPU ID (BVNC) from contro=
l registers.
> + *
> + * Sets struct pvr_dev.gpu_id.
> + *
> + * @pvr_dev: Target PowerVR device.
> + */
> +static void
> +pvr_load_gpu_id(struct pvr_device *pvr_dev)
> +{
> +       struct pvr_gpu_id *gpu_id =3D &pvr_dev->gpu_id;
> +       u64 bvnc;
> +
> +       /*
> +        * Try reading the BVNC using the newer (cleaner) method first. I=
f the
> +        * B value is zero, fall back to the older method.
> +        */
> +       bvnc =3D PVR_CR_READ64(pvr_dev, CORE_ID__PBVNC);
> +
> +       gpu_id->b =3D PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__BRANCH_ID);
> +       if (gpu_id->b !=3D 0) {
> +               gpu_id->v =3D PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__VERS=
ION_ID);
> +               gpu_id->n =3D PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__NUMB=
ER_OF_SCALABLE_UNITS);
> +               gpu_id->c =3D PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__CONF=
IG_ID);
> +       } else {
> +               u32 core_rev =3D PVR_CR_READ32(pvr_dev, CORE_REVISION);
> +               u32 core_id =3D PVR_CR_READ32(pvr_dev, CORE_ID);
> +               u16 core_id_config =3D PVR_CR_FIELD_GET(core_id, CORE_ID_=
CONFIG);
> +
> +               gpu_id->b =3D PVR_CR_FIELD_GET(core_rev, CORE_REVISION_MA=
JOR);
> +               gpu_id->v =3D PVR_CR_FIELD_GET(core_rev, CORE_REVISION_MI=
NOR);
> +               gpu_id->n =3D FIELD_GET(0xFF00, core_id_config);
> +               gpu_id->c =3D FIELD_GET(0x00FF, core_id_config);
> +       }
> +}
> +
> +/**
> + * pvr_set_dma_info() - Set PowerVR device DMA information
> + * @pvr_dev: Target PowerVR device.
> + *
> + * Sets the DMA mask and max segment size for the PowerVR device.
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error returned by PVR_FEATURE_VALUE(), or
> + *  * Any error returned by dma_set_mask().
> + */
> +
> +static int
> +pvr_set_dma_info(struct pvr_device *pvr_dev)
> +{
> +       struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> +       u16 phys_bus_width;
> +       int err;
> +
> +       err =3D PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_widt=
h);
> +       if (err) {
> +               drm_err(drm_dev, "Failed to get device physical bus width=
\n");
> +               return err;
> +       }
> +
> +       /*
> +        * See the comment on &pvr_drm_driver.prime_fd_to_handle for an
> +        * explanation of the dma_set_mask function and dma_set_max_seg_s=
ize
> +        * calls below.
> +        */
> +       err =3D dma_set_mask(drm_dev->dev, DMA_BIT_MASK(phys_bus_width));
> +       if (err) {
> +               drm_err(drm_dev, "Failed to set DMA mask (err=3D%d)\n", e=
rr);
> +               return err;
> +       }
> +
> +       dma_set_max_seg_size(drm_dev->dev, UINT_MAX);
> +
> +       return 0;
> +}
> +
> +/**
> + * pvr_device_gpu_init() - GPU-specific initialization for a PowerVR dev=
ice
> + * @pvr_dev: Target PowerVR device.
> + *
> + * The following steps are taken to ensure the device is ready:
> + *
> + *  1. Read the hardware version information from control registers,
> + *  2. Initialise the hardware feature information,
> + *  3. Setup the device DMA information,
> + *  4. Setup the device-scoped memory context, and
> + *  5. Load firmware into the device.
> + *
> + * Return:
> + *  * 0 on success,
> + *  * -%ENODEV if the GPU is not supported,
> + *  * Any error returned by pvr_set_dma_info(),
> + *  * Any error returned by pvr_memory_context_init(), or
> + *  * Any error returned by pvr_request_firmware().
> + */
> +static int
> +pvr_device_gpu_init(struct pvr_device *pvr_dev)
> +{
> +       int err;
> +
> +       pvr_load_gpu_id(pvr_dev);
> +
> +       err =3D pvr_device_info_init(pvr_dev);
> +       if (err)
> +               goto err_out;
> +
> +       if (PVR_HAS_FEATURE(pvr_dev, meta)) {
> +               pvr_dev->fw_dev.processor_type =3D PVR_FW_PROCESSOR_TYPE_=
META;
> +       } else if (PVR_HAS_FEATURE(pvr_dev, mips)) {
> +               pvr_dev->fw_dev.processor_type =3D PVR_FW_PROCESSOR_TYPE_=
MIPS;
> +       } else if (PVR_HAS_FEATURE(pvr_dev, riscv_fw_processor)) {
> +               pvr_dev->fw_dev.processor_type =3D PVR_FW_PROCESSOR_TYPE_=
RISCV;
> +       } else {
> +               err =3D -EINVAL;
> +               goto err_out;
> +       }
> +
> +       err =3D pvr_set_dma_info(pvr_dev);
> +       if (err)
> +               goto err_out;
> +
> +       err =3D pvr_request_firmware(pvr_dev);
> +       if (err)
> +               goto err_out;
> +
> +       return 0;
> +
> +err_out:
> +       return err;
> +}
> +
> +/**
> + * pvr_device_gpu_fini() - GPU-specific deinitialization for a PowerVR d=
evice
> + * @pvr_dev: Target PowerVR device.
> + */
> +static void
> +pvr_device_gpu_fini(struct pvr_device *pvr_dev)
> +{
> +       release_firmware(pvr_dev->fw_dev.firmware);
> +}
> +
>  /**
>   * pvr_device_init() - Initialize a PowerVR device
>   * @pvr_dev: Target PowerVR device.
> @@ -240,6 +492,11 @@ pvr_device_init(struct pvr_device *pvr_dev)
>
>         /* Map the control registers into memory. */
>         err =3D pvr_device_reg_init(pvr_dev);
> +       if (err)
> +               goto err_device_clk_fini;
> +
> +       /* Perform GPU-specific initialization steps. */
> +       err =3D pvr_device_gpu_init(pvr_dev);
>         if (err)
>                 goto err_device_reg_fini;
>
> @@ -266,6 +523,108 @@ pvr_device_fini(struct pvr_device *pvr_dev)
>          * Deinitialization stages are performed in reverse order compare=
d to
>          * the initialization stages in pvr_device_init().
>          */
> +       pvr_device_gpu_fini(pvr_dev);
>         pvr_device_reg_fini(pvr_dev);
>         pvr_device_clk_fini(pvr_dev);
>  }
> +
> +bool
> +pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk)
> +{
> +       switch (quirk) {
> +       case 47217:
> +               return PVR_HAS_QUIRK(pvr_dev, 47217);
> +       case 48545:
> +               return PVR_HAS_QUIRK(pvr_dev, 48545);
> +       case 49927:
> +               return PVR_HAS_QUIRK(pvr_dev, 49927);
> +       case 51764:
> +               return PVR_HAS_QUIRK(pvr_dev, 51764);
> +       case 62269:
> +               return PVR_HAS_QUIRK(pvr_dev, 62269);
> +       default:
> +               return false;
> +       };
> +}
> +
> +bool
> +pvr_device_has_uapi_enhancement(struct pvr_device *pvr_dev, u32 enhancem=
ent)
> +{
> +       switch (enhancement) {
> +       case 35421:
> +               return PVR_HAS_ENHANCEMENT(pvr_dev, 35421);
> +       case 42064:
> +               return PVR_HAS_ENHANCEMENT(pvr_dev, 42064);
> +       default:
> +               return false;
> +       };
> +}
> +
> +/**
> + * pvr_device_has_feature() - Look up device feature based on feature de=
finition
> + * @pvr_dev: Device pointer.
> + * @feature: Feature to look up. Should be one of %PVR_FEATURE_*.
> + *
> + * Returns:
> + *  * %true if feature is present on device, or
> + *  * %false if feature is not present on device.
> + */
> +bool
> +pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature)
> +{
> +       switch (feature) {
> +       case PVR_FEATURE_CLUSTER_GROUPING:
> +               return PVR_HAS_FEATURE(pvr_dev, cluster_grouping);
> +
> +       case PVR_FEATURE_COMPUTE_MORTON_CAPABLE:
> +               return PVR_HAS_FEATURE(pvr_dev, compute_morton_capable);
> +
> +       case PVR_FEATURE_FB_CDC_V4:
> +               return PVR_HAS_FEATURE(pvr_dev, fb_cdc_v4);
> +
> +       case PVR_FEATURE_GPU_MULTICORE_SUPPORT:
> +               return PVR_HAS_FEATURE(pvr_dev, gpu_multicore_support);
> +
> +       case PVR_FEATURE_ISP_ZLS_D24_S8_PACKING_OGL_MODE:
> +               return PVR_HAS_FEATURE(pvr_dev, isp_zls_d24_s8_packing_og=
l_mode);
> +
> +       case PVR_FEATURE_S7_TOP_INFRASTRUCTURE:
> +               return PVR_HAS_FEATURE(pvr_dev, s7_top_infrastructure);
> +
> +       case PVR_FEATURE_TESSELLATION:
> +               return PVR_HAS_FEATURE(pvr_dev, tessellation);
> +
> +       case PVR_FEATURE_TPU_DM_GLOBAL_REGISTERS:
> +               return PVR_HAS_FEATURE(pvr_dev, tpu_dm_global_registers);
> +
> +       case PVR_FEATURE_VDM_DRAWINDIRECT:
> +               return PVR_HAS_FEATURE(pvr_dev, vdm_drawindirect);
> +
> +       case PVR_FEATURE_VDM_OBJECT_LEVEL_LLS:
> +               return PVR_HAS_FEATURE(pvr_dev, vdm_object_level_lls);
> +
> +       case PVR_FEATURE_ZLS_SUBTILE:
> +               return PVR_HAS_FEATURE(pvr_dev, zls_subtile);
> +
> +       /* Derived features. */
> +       case PVR_FEATURE_CDM_USER_MODE_QUEUE: {
> +               u8 cdm_control_stream_format =3D 0;
> +
> +               PVR_FEATURE_VALUE(pvr_dev, cdm_control_stream_format, &cd=
m_control_stream_format);
> +               return (cdm_control_stream_format >=3D 2 && cdm_control_s=
tream_format <=3D 4);
> +       }
> +
> +       case PVR_FEATURE_REQUIRES_FB_CDC_ZLS_SETUP:
> +               if (PVR_HAS_FEATURE(pvr_dev, fbcdc_algorithm)) {
> +                       u8 fbcdc_algorithm =3D 0;
> +
> +                       PVR_FEATURE_VALUE(pvr_dev, fbcdc_algorithm, &fbcd=
c_algorithm);
> +                       return (fbcdc_algorithm < 3 || PVR_HAS_FEATURE(pv=
r_dev, fb_cdc_v4));
> +               }
> +               return false;
> +
> +       default:
> +               WARN(true, "Looking up undefined feature %u\n", feature);
> +               return false;
> +       }
> +}
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/i=
magination/pvr_device.h
> index c0dd0562844c..d9d0cf5a3820 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -4,6 +4,9 @@
>  #ifndef PVR_DEVICE_H
>  #define PVR_DEVICE_H
>
> +#include "pvr_device_info.h"
> +#include "pvr_fw.h"
> +
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_mm.h>
> @@ -31,6 +34,26 @@ struct firmware;
>  /* Forward declaration from <linux/regulator/consumer.h>. */
>  struct regulator;
>
> +/**
> + * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device
> + * @b: Branch ID.
> + * @v: Version ID.
> + * @n: Number of scalable units.
> + * @c: Config ID.
> + */
> +struct pvr_gpu_id {
> +       u16 b, v, n, c;
> +};
> +
> +/**
> + * struct pvr_fw_version - Firmware version information
> + * @major: Major version number.
> + * @minor: Minor version number.
> + */
> +struct pvr_fw_version {
> +       u16 major, minor;
> +};
> +
>  /**
>   * struct pvr_device - powervr-specific wrapper for &struct drm_device
>   */
> @@ -43,6 +66,35 @@ struct pvr_device {
>          */
>         struct drm_device base;
>
> +       /** @gpu_id: GPU ID detected at runtime. */
> +       struct pvr_gpu_id gpu_id;
> +
> +       /**
> +        * @features: Hardware feature information.
> +        *
> +        * Do not access this member directly, instead use PVR_HAS_FEATUR=
E()
> +        * or PVR_FEATURE_VALUE() macros.
> +        */
> +       struct pvr_device_features features;
> +
> +       /**
> +        * @quirks: Hardware quirk information.
> +        *
> +        * Do not access this member directly, instead use PVR_HAS_QUIRK(=
).
> +        */
> +       struct pvr_device_quirks quirks;
> +
> +       /**
> +        * @enhancements: Hardware enhancement information.
> +        *
> +        * Do not access this member directly, instead use
> +        * PVR_HAS_ENHANCEMENT().
> +        */
> +       struct pvr_device_enhancements enhancements;
> +
> +       /** @fw_version: Firmware version detected at runtime. */
> +       struct pvr_fw_version fw_version;
> +
>         /** @regs_resource: Resource representing device control register=
s. */
>         struct resource *regs_resource;
>
> @@ -65,6 +117,9 @@ struct pvr_device {
>
>         /** @regulator: Power regulator. */
>         struct regulator *regulator;
> +
> +       /** @fw_dev: Firmware related data. */
> +       struct pvr_fw_device fw_dev;
>  };
>
>  /**
> @@ -85,8 +140,79 @@ struct pvr_file {
>          *           to_pvr_device().
>          */
>         struct pvr_device *pvr_dev;
> +
>  };
>
> +/**
> + * PVR_HAS_FEATURE() - Tests whether a PowerVR device has a given featur=
e
> + * @pvr_dev: [IN] Target PowerVR device.
> + * @feature: [IN] Hardware feature name.
> + *
> + * Feature names are derived from those found in &struct pvr_device_feat=
ures by
> + * dropping the 'has_' prefix, which is applied by this macro.
> + *
> + * Return:
> + *  * true if the named feature is present in the hardware
> + *  * false if the named feature is not present in the hardware
> + */
> +#define PVR_HAS_FEATURE(pvr_dev, feature) ((pvr_dev)->features.has_##fea=
ture)
> +
> +/**
> + * PVR_FEATURE_VALUE() - Gets a PowerVR device feature value
> + * @pvr_dev: [IN] Target PowerVR device.
> + * @feature: [IN] Feature name.
> + * @value_out: [OUT] Feature value.
> + *
> + * This macro will get a feature value for those features that have valu=
es.
> + * If the feature is not present, nothing will be stored to @value_out.
> + *
> + * Feature names are derived from those found in &struct pvr_device_feat=
ures by
> + * dropping the 'has_' prefix.
> + *
> + * Return:
> + *  * 0 on success, or
> + *  * -%EINVAL if the named feature is not present in the hardware
> + */
> +#define PVR_FEATURE_VALUE(pvr_dev, feature, value_out)             \
> +       ({                                                         \
> +               struct pvr_device *_pvr_dev =3D pvr_dev;             \
> +               int _ret =3D -EINVAL;                                \
> +               if (_pvr_dev->features.has_##feature) {            \
> +                       *(value_out) =3D _pvr_dev->features.feature; \
> +                       _ret =3D 0;                                  \
> +               }                                                  \
> +               _ret;                                              \
> +       })
> +
> +/**
> + * PVR_HAS_QUIRK() - Tests whether a physical device has a given quirk
> + * @pvr_dev: [IN] Target PowerVR device.
> + * @quirk: [IN] Hardware quirk name.
> + *
> + * Quirk numbers are derived from those found in #pvr_device_quirks by
> + * dropping the 'has_brn' prefix, which is applied by this macro.
> + *
> + * Returns
> + *  * true if the quirk is present in the hardware, or
> + *  * false if the quirk is not present in the hardware.
> + */
> +#define PVR_HAS_QUIRK(pvr_dev, quirk) ((pvr_dev)->quirks.has_brn##quirk)
> +
> +/**
> + * PVR_HAS_ENHANCEMENT() - Tests whether a physical device has a given
> + *                         enhancement
> + * @pvr_dev: [IN] Target PowerVR device.
> + * @enhancement: [IN] Hardware enhancement name.
> + *
> + * Enhancement numbers are derived from those found in #pvr_device_enhan=
cements
> + * by dropping the 'has_ern' prefix, which is applied by this macro.
> + *
> + * Returns
> + *  * true if the enhancement is present in the hardware, or
> + *  * false if the enhancement is not present in the hardware.
> + */
> +#define PVR_HAS_ENHANCEMENT(pvr_dev, enhancement) ((pvr_dev)->enhancemen=
ts.has_ern##enhancement)
> +
>  static __always_inline struct drm_device *
>  from_pvr_device(struct pvr_device *pvr_dev)
>  {
> @@ -111,12 +237,80 @@ to_pvr_file(struct drm_file *file)
>         return file->driver_priv;
>  }
>
> +/**
> + * PVR_PACKED_BVNC() - Packs B, V, N and C values into a 64-bit unsigned=
 integer
> + * @b: Branch ID.
> + * @v: Version ID.
> + * @n: Number of scalable units.
> + * @c: Config ID.
> + *
> + * The packed layout is as follows:
> + *
> + *    +--------+--------+--------+-------+
> + *    | 63..48 | 47..32 | 31..16 | 15..0 |
> + *    +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+
> + *    | B      | V      | N      | C     |
> + *    +--------+--------+--------+-------+
> + *
> + * pvr_gpu_id_to_packed_bvnc() should be used instead of this macro when=
 a
> + * &struct pvr_gpu_id is available in order to ensure proper type checki=
ng.
> + *
> + * Return: Packed BVNC.
> + */
> +/* clang-format off */
> +#define PVR_PACKED_BVNC(b, v, n, c) \
> +       ((((u64)(b) & GENMASK_ULL(15, 0)) << 48) | \
> +        (((u64)(v) & GENMASK_ULL(15, 0)) << 32) | \
> +        (((u64)(n) & GENMASK_ULL(15, 0)) << 16) | \
> +        (((u64)(c) & GENMASK_ULL(15, 0)) <<  0))
> +/* clang-format on */
> +
> +/**
> + * pvr_gpu_id_to_packed_bvnc() - Packs B, V, N and C values into a 64-bi=
t
> + * unsigned integer
> + * @gpu_id: GPU ID.
> + *
> + * The packed layout is as follows:
> + *
> + *    +--------+--------+--------+-------+
> + *    | 63..48 | 47..32 | 31..16 | 15..0 |
> + *    +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+
> + *    | B      | V      | N      | C     |
> + *    +--------+--------+--------+-------+
> + *
> + * This should be used in preference to PVR_PACKED_BVNC() when a &struct
> + * pvr_gpu_id is available in order to ensure proper type checking.
> + *
> + * Return: Packed BVNC.
> + */
> +static __always_inline u64
> +pvr_gpu_id_to_packed_bvnc(struct pvr_gpu_id *gpu_id)
> +{
> +       return PVR_PACKED_BVNC(gpu_id->b, gpu_id->v, gpu_id->n, gpu_id->c=
);
> +}
> +
> +static __always_inline void
> +packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gpu_id *gpu_id)
> +{
> +       gpu_id->b =3D (bvnc & GENMASK_ULL(63, 48)) >> 48;
> +       gpu_id->v =3D (bvnc & GENMASK_ULL(47, 32)) >> 32;
> +       gpu_id->n =3D (bvnc & GENMASK_ULL(31, 16)) >> 16;
> +       gpu_id->c =3D bvnc & GENMASK_ULL(15, 0);
> +}
> +
>  int pvr_device_init(struct pvr_device *pvr_dev);
>  void pvr_device_fini(struct pvr_device *pvr_dev);
>
>  int
>  pvr_device_clk_core_get_freq(struct pvr_device *pvr_dev, u32 *freq_out);
>
> +bool
> +pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk);
> +bool
> +pvr_device_has_uapi_enhancement(struct pvr_device *pvr_dev, u32 enhancem=
ent);
> +bool
> +pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature);
> +
>  /**
>   * PVR_CR_READ32() - Read a 32-bit register from a PowerVR device
>   * @pvr_dev: Target PowerVR device.
> @@ -286,6 +480,29 @@ pvr_cr_poll_reg64(struct pvr_device *pvr_dev, u32 re=
g_addr, u64 reg_value,
>                 (value & reg_mask) =3D=3D reg_value, 0, timeout_usec);
>  }
>
> +/**
> + * pvr_round_up_to_cacheline_size() - Round up a provided size to be cac=
heline
> + *                                    aligned
> + * @pvr_dev: Target PowerVR device.
> + * @size: Initial size, in bytes.
> + *
> + * Returns:
> + *  * Size aligned to cacheline size.
> + */
> +static __always_inline size_t
> +pvr_round_up_to_cacheline_size(struct pvr_device *pvr_dev, size_t size)
> +{
> +       u16 slc_cacheline_size_in_bits =3D 0;
> +       u16 slc_cacheline_size_in_bytes;
> +
> +       WARN_ON(!PVR_HAS_FEATURE(pvr_dev, slc_cache_line_size_in_bits));
> +       PVR_FEATURE_VALUE(pvr_dev, slc_cache_line_size_in_bits,
> +                         &slc_cacheline_size_in_bits);
> +       slc_cacheline_size_in_bytes =3D slc_cacheline_size_in_bits / 8;
> +
> +       return round_up(size, slc_cacheline_size_in_bytes);
> +}
> +
>  /**
>   * DOC: IOCTL validation helpers
>   *
> @@ -380,4 +597,8 @@ pvr_ioctl_union_padding_check(void *instance, size_t =
union_offset,
>                                               __union_size, __member_size=
);  \
>         })
>
> +#define PVR_FW_PROCESSOR_TYPE_META  0
> +#define PVR_FW_PROCESSOR_TYPE_MIPS  1
> +#define PVR_FW_PROCESSOR_TYPE_RISCV 2
> +
>  #endif /* PVR_DEVICE_H */
> diff --git a/drivers/gpu/drm/imagination/pvr_device_info.c b/drivers/gpu/=
drm/imagination/pvr_device_info.c
> new file mode 100644
> index 000000000000..660324e7c3a3
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_device_info.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/* Copyright (c) 2022 Imagination Technologies Ltd. */
> +
> +#include "pvr_device.h"
> +#include "pvr_device_info.h"
> +
> +#include <drm/drm_print.h>
> +
> +#include <linux/types.h>
> +
> +static const struct pvr_device_features pvr_device_4_V_2_51 =3D {
> +       .has_cdm_control_stream_format =3D true,
> +       .has_cluster_grouping =3D true,
> +       .has_common_store_size_in_dwords =3D true,
> +       .has_compute =3D true,
> +       .has_compute_morton_capable =3D true,
> +       .has_compute_overlap =3D true,
> +       .has_fbcdc_algorithm =3D true,
> +       .has_isp_max_tiles_in_flight =3D true,
> +       .has_isp_samples_per_pixel =3D true,
> +       .has_max_partitions =3D true,
> +       .has_meta =3D true,
> +       .has_meta_coremem_size =3D true,
> +       .has_num_clusters =3D true,
> +       .has_num_isp_ipp_pipes =3D true,
> +       .has_num_raster_pipes =3D true,
> +       .has_phys_bus_width =3D true,
> +       .has_slc_cache_line_size_in_bits =3D true,
> +       .has_tile_size_x =3D true,
> +       .has_tile_size_y =3D true,
> +       .has_usc_min_output_registers_per_pix =3D true,
> +       .has_virtual_address_space_bits =3D true,
> +       .has_xt_top_infrastructure =3D true,
> +       .has_zls_subtile =3D true,
> +
> +       .cdm_control_stream_format =3D 1,
> +       .common_store_size_in_dwords =3D 1280U * 4U * 4U,
> +       .fbcdc_algorithm =3D 2,
> +       .isp_max_tiles_in_flight =3D 4,
> +       .isp_samples_per_pixel =3D 2,
> +       .max_partitions =3D 8,
> +       .meta =3D true,
> +       .meta_coremem_size =3D 32,
> +       .num_clusters =3D 2,
> +       .num_isp_ipp_pipes =3D 8,
> +       .num_raster_pipes =3D 1,
> +       .phys_bus_width =3D 40,
> +       .slc_cache_line_size_in_bits =3D 512,
> +       .tile_size_x =3D 32,
> +       .tile_size_y =3D 32,
> +       .usc_min_output_registers_per_pix =3D 2,
> +       .virtual_address_space_bits =3D 40,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_4_40_2_51 =3D {
> +       .has_brn44079 =3D true,
> +       .has_brn48492 =3D true,
> +       .has_brn48545 =3D true,
> +       .has_brn49927 =3D true,
> +       .has_brn51764 =3D true,
> +       .has_brn52354 =3D true,
> +       .has_brn62269 =3D true,
> +       .has_brn63142 =3D true,
> +       .has_brn66011 =3D true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_4_40=
_2_51 =3D {
> +       .has_ern35421 =3D true,
> +       .has_ern38020 =3D true,
> +       .has_ern38748 =3D true,
> +       .has_ern42064 =3D true,
> +};
> +
> +static const struct pvr_device_features pvr_device_33_V_11_3 =3D {
> +       .has_cdm_control_stream_format =3D true,
> +       .has_common_store_size_in_dwords =3D true,
> +       .has_compute =3D true,
> +       .has_isp_max_tiles_in_flight =3D true,
> +       .has_isp_samples_per_pixel =3D true,
> +       .has_max_partitions =3D true,
> +       .has_mips =3D true,
> +       .has_num_clusters =3D true,
> +       .has_num_isp_ipp_pipes =3D true,
> +       .has_num_raster_pipes =3D true,
> +       .has_phys_bus_width =3D true,
> +       .has_roguexe =3D true,
> +       .has_simple_internal_parameter_format =3D true,
> +       .has_slc_cache_line_size_in_bits =3D true,
> +       .has_sys_bus_secure_reset =3D true,
> +       .has_tile_size_x =3D true,
> +       .has_tile_size_y =3D true,
> +       .has_usc_min_output_registers_per_pix =3D true,
> +       .has_virtual_address_space_bits =3D true,
> +       .has_xe_memory_hierarchy =3D true,
> +
> +       .cdm_control_stream_format =3D 1,
> +       .common_store_size_in_dwords =3D 512U * 4U * 4U,
> +       .isp_max_tiles_in_flight =3D 1,
> +       .isp_samples_per_pixel =3D 1,
> +       .max_partitions =3D 4,
> +       .mips =3D true,
> +       .num_clusters =3D 1,
> +       .num_isp_ipp_pipes =3D 1,
> +       .num_raster_pipes =3D 1,
> +       .phys_bus_width =3D 36,
> +       .simple_internal_parameter_format =3D 2,
> +       .slc_cache_line_size_in_bits =3D 512,
> +       .tile_size_x =3D 16,
> +       .tile_size_y =3D 16,
> +       .usc_min_output_registers_per_pix =3D 1,
> +       .virtual_address_space_bits =3D 40,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_33_15_11_3 =3D {
> +       .has_brn63553 =3D true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_33_1=
5_11_3 =3D {
> +       .has_ern35421 =3D true,
> +       .has_ern38748 =3D true,
> +};
> +
> +static const struct pvr_device_features pvr_device_36_V_104_796 =3D {
> +       .has_cdm_control_stream_format =3D true,
> +       .has_common_store_size_in_dwords =3D true,
> +       .has_compute =3D true,
> +       .has_compute_overlap =3D true,
> +       .has_fbcdc_algorithm =3D true,
> +       .has_gpu_multicore_support =3D true,
> +       .has_isp_max_tiles_in_flight =3D true,
> +       .has_isp_samples_per_pixel =3D true,
> +       .has_max_partitions =3D true,
> +       .has_num_clusters =3D true,
> +       .has_num_isp_ipp_pipes =3D true,
> +       .has_num_raster_pipes =3D true,
> +       .has_phys_bus_width =3D true,
> +       .has_riscv_fw_processor =3D true,
> +       .has_roguexe =3D true,
> +       .has_simple_internal_parameter_format =3D true,
> +       .has_slc_cache_line_size_in_bits =3D true,
> +       .has_sys_bus_secure_reset =3D true,
> +       .has_tile_size_x =3D true,
> +       .has_tile_size_y =3D true,
> +       .has_tpu_dm_global_registers =3D true,
> +       .has_usc_min_output_registers_per_pix =3D true,
> +       .has_virtual_address_space_bits =3D true,
> +       .has_xe_memory_hierarchy =3D true,
> +       .has_xpu_max_slaves =3D true,
> +
> +       .cdm_control_stream_format =3D 1,
> +       .common_store_size_in_dwords =3D 1344U * 4U * 4U,
> +       .fbcdc_algorithm =3D 50,
> +       .isp_max_tiles_in_flight =3D 6,
> +       .isp_samples_per_pixel =3D 4,
> +       .max_partitions =3D 16,
> +       .num_clusters =3D 1,
> +       .num_isp_ipp_pipes =3D 6,
> +       .num_raster_pipes =3D 1,
> +       .phys_bus_width =3D 36,
> +       .riscv_fw_processor =3D true,
> +       .simple_internal_parameter_format =3D 2,
> +       .slc_cache_line_size_in_bits =3D 512,
> +       .tile_size_x =3D 16,
> +       .tile_size_y =3D 16,
> +       .usc_min_output_registers_per_pix =3D 2,
> +       .virtual_address_space_bits =3D 40,
> +       .xpu_max_slaves =3D 3,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_36_53_104_796 =
=3D {
> +       .has_brn44079 =3D true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_36_5=
3_104_796 =3D {
> +       .has_ern35421 =3D true,
> +       .has_ern38748 =3D true,
> +};
> +
> +/**
> + * pvr_device_info_init() - Initialize a PowerVR device's hardware featu=
res and quirks
> + * @pvr_dev: Target PowerVR device.
> + *
> + * This function relies on &pvr_dev.gpu_id having already been initializ=
ed. If
> + * PowerVR device version is supported then sets &pvr_dev.features and &=
pvr_dev.quirks.
> + *
> + * Return:
> + *  * 0 on success, or
> + *  * -%ENODEV if the device is not supported.
> + */
> +int
> +pvr_device_info_init(struct pvr_device *pvr_dev)
> +{
> +       struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> +       struct pvr_gpu_id *gpu_id =3D &pvr_dev->gpu_id;
> +       const u64 bvnc =3D pvr_gpu_id_to_packed_bvnc(gpu_id);
> +
> +       /*
> +        * This macro results in a "Macros with multiple statements shoul=
d be
> +        * enclosed in a do - while loop" checkpatch error. However, foll=
owing
> +        * this advice would make the macro look a bit odd and isn't nece=
ssary
> +        * in this particular case, as the macro has a very specific use =
and a
> +        * very limited lifetime. The error can therefore be ignored.
> +        */
> +#define CASE_PACKED_BVNC_DEVICE_INFO(b, v, n, c)                  \
> +       case PVR_PACKED_BVNC(b, v, n, c):                         \
> +               pvr_dev->features =3D pvr_device_##b##_V_##n##_##c; \
> +               pvr_dev->quirks =3D pvr_device_quirks_##b##_##v##_##n##_#=
#c; \
> +               pvr_dev->enhancements =3D pvr_device_enhancements_##b##_#=
#v##_##n##_##c; \
> +               return 0
> +
> +       switch (bvnc) {
> +               CASE_PACKED_BVNC_DEVICE_INFO(4, 40, 2, 51);
> +               CASE_PACKED_BVNC_DEVICE_INFO(33, 15, 11, 3);
> +               CASE_PACKED_BVNC_DEVICE_INFO(36, 53, 104, 796);
> +       }
> +
> +#undef CASE_PACKED_BVNC_DEVICE_INFO
> +
> +       drm_warn(drm_dev, "Unsupported BVNC: %u.%u.%u.%u\n", gpu_id->b,
> +                gpu_id->v, gpu_id->n, gpu_id->c);
> +
> +       return -ENODEV;
> +}
> diff --git a/drivers/gpu/drm/imagination/pvr_device_info.h b/drivers/gpu/=
drm/imagination/pvr_device_info.h
> new file mode 100644
> index 000000000000..36ad09dea420
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_device_info.h
> @@ -0,0 +1,133 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/* Copyright (c) 2022 Imagination Technologies Ltd. */
> +
> +#ifndef PVR_DEVICE_INFO_H
> +#define PVR_DEVICE_INFO_H
> +
> +#include <linux/types.h>
> +
> +struct pvr_device;
> +
> +/*
> + * struct pvr_device_features - Hardware feature information
> + */
> +struct pvr_device_features {
> +       bool has_cdm_control_stream_format : 1;
> +       bool has_cluster_grouping : 1;
> +       bool has_common_store_size_in_dwords : 1;
> +       bool has_compute : 1;
> +       bool has_compute_morton_capable : 1;
> +       bool has_compute_overlap : 1;
> +       bool has_fb_cdc_v4 : 1;
> +       bool has_fbcdc_algorithm : 1;
> +       bool has_gpu_multicore_support : 1;
> +       bool has_isp_max_tiles_in_flight : 1;
> +       bool has_isp_samples_per_pixel : 1;
> +       bool has_isp_zls_d24_s8_packing_ogl_mode : 1;
> +       bool has_max_partitions : 1;
> +       bool has_meta : 1;
> +       bool has_meta_coremem_size : 1;
> +       bool has_mips : 1;
> +       bool has_num_clusters : 1;
> +       bool has_num_isp_ipp_pipes : 1;
> +       bool has_num_raster_pipes : 1;
> +       bool has_phys_bus_width : 1;
> +       bool has_riscv_fw_processor : 1;
> +       bool has_roguexe : 1;
> +       bool has_s7_top_infrastructure : 1;
> +       bool has_simple_internal_parameter_format : 1;
> +       bool has_slc_cache_line_size_in_bits : 1;
> +       bool has_sys_bus_secure_reset : 1;
> +       bool has_tessellation : 1;
> +       bool has_tile_size_x : 1;
> +       bool has_tile_size_y : 1;
> +       bool has_tpu_dm_global_registers : 1;
> +       bool has_usc_min_output_registers_per_pix : 1;
> +       bool has_vdm_drawindirect : 1;
> +       bool has_vdm_object_level_lls : 1;
> +       bool has_virtual_address_space_bits : 1;
> +       bool has_xe_memory_hierarchy : 1;
> +       bool has_xpu_max_slaves : 1;
> +       bool has_xt_top_infrastructure : 1;
> +       bool has_zls_subtile : 1;
> +
> +       u8 cdm_control_stream_format;
> +       u32 common_store_size_in_dwords;
> +       u8 fbcdc_algorithm;
> +       u16 isp_max_tiles_in_flight;
> +       bool isp_samples_per_pixel;
> +       u16 max_partitions;
> +       bool meta;
> +       u32 meta_coremem_size;
> +       bool mips;
> +       u16 num_clusters;
> +       u8 num_isp_ipp_pipes;
> +       u8 num_raster_pipes;
> +       u16 phys_bus_width;
> +       bool riscv_fw_processor;
> +       u32 simple_internal_parameter_format;
> +       u16 slc_cache_line_size_in_bits;
> +       u16 tile_size_x;
> +       u16 tile_size_y;
> +       u16 usc_min_output_registers_per_pix;
> +       u16 virtual_address_space_bits;
> +       u8 xpu_max_slaves;
> +};
> +
> +/*
> + * struct pvr_device_quirks - Hardware quirk information
> + */
> +struct pvr_device_quirks {
> +       bool has_brn44079 : 1;
> +       bool has_brn47217 : 1;
> +       bool has_brn48492 : 1;
> +       bool has_brn48545 : 1;
> +       bool has_brn49927 : 1;
> +       bool has_brn51764 : 1;
> +       bool has_brn52354 : 1;
> +       bool has_brn62269 : 1;
> +       bool has_brn63142 : 1;
> +       bool has_brn63553 : 1;
> +       bool has_brn66011 : 1;
> +};
> +
> +/*
> + * struct pvr_device_enhancements - Hardware enhancement information
> + */
> +struct pvr_device_enhancements {
> +       bool has_ern35421 : 1;
> +       bool has_ern38020 : 1;
> +       bool has_ern38748 : 1;
> +       bool has_ern42064 : 1;
> +};
> +
> +int pvr_device_info_init(struct pvr_device *pvr_dev);
> +
> +/*
> + * Meta cores
> + *
> + * These are the values for the 'meta' feature when the feature is prese=
nt
> + * (as per &struct pvr_device_features)/
> + */
> +#define PVR_META_MTP218 (1)
> +#define PVR_META_MTP219 (2)
> +#define PVR_META_LTP218 (3)
> +#define PVR_META_LTP217 (4)
> +
> +enum {
> +       PVR_FEATURE_CDM_USER_MODE_QUEUE,
> +       PVR_FEATURE_CLUSTER_GROUPING,
> +       PVR_FEATURE_COMPUTE_MORTON_CAPABLE,
> +       PVR_FEATURE_FB_CDC_V4,
> +       PVR_FEATURE_GPU_MULTICORE_SUPPORT,
> +       PVR_FEATURE_ISP_ZLS_D24_S8_PACKING_OGL_MODE,
> +       PVR_FEATURE_REQUIRES_FB_CDC_ZLS_SETUP,
> +       PVR_FEATURE_S7_TOP_INFRASTRUCTURE,
> +       PVR_FEATURE_TESSELLATION,
> +       PVR_FEATURE_TPU_DM_GLOBAL_REGISTERS,
> +       PVR_FEATURE_VDM_DRAWINDIRECT,
> +       PVR_FEATURE_VDM_OBJECT_LEVEL_LLS,
> +       PVR_FEATURE_ZLS_SUBTILE,
> +};
> +
> +#endif /* PVR_DEVICE_INFO_H */
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
> index 48a870715426..5ebdea49c3be 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -3,6 +3,9 @@
>
>  #include "pvr_device.h"
>  #include "pvr_drv.h"
> +#include "pvr_rogue_defs.h"
> +#include "pvr_rogue_fwif_client.h"
> +#include "pvr_rogue_fwif_shared.h"
>
>  #include <uapi/drm/pvr_drm.h>
>
> @@ -88,6 +91,422 @@ pvr_ioctl_get_bo_mmap_offset(__always_unused struct d=
rm_device *drm_dev,
>         return -ENOTTY;
>  }
>
> +static __always_inline u64
> +pvr_fw_version_packed(u32 major, u32 minor)
> +{
> +       return ((u64)major << 32) | minor;
> +}
> +
> +static u32
> +rogue_get_common_store_partition_space_size(struct pvr_device *pvr_dev)
> +{
> +       u32 max_partitions =3D 0;
> +       u32 tile_size_x =3D 0;
> +       u32 tile_size_y =3D 0;
> +
> +       PVR_FEATURE_VALUE(pvr_dev, tile_size_x, &tile_size_x);
> +       PVR_FEATURE_VALUE(pvr_dev, tile_size_y, &tile_size_y);
> +       PVR_FEATURE_VALUE(pvr_dev, max_partitions, &max_partitions);
> +
> +       if (tile_size_x =3D=3D 16 && tile_size_y =3D=3D 16) {
> +               u32 usc_min_output_registers_per_pix =3D 0;
> +
> +               PVR_FEATURE_VALUE(pvr_dev, usc_min_output_registers_per_p=
ix,
> +                                 &usc_min_output_registers_per_pix);
> +
> +               return tile_size_x * tile_size_y * max_partitions *
> +                      usc_min_output_registers_per_pix;
> +       }
> +
> +       return max_partitions * 1024;
> +}
> +
> +static u32
> +rogue_get_common_store_alloc_region_size(struct pvr_device *pvr_dev)
> +{
> +       u32 common_store_size_in_dwords =3D 512 * 4 * 4;
> +       u32 alloc_region_size;
> +
> +       PVR_FEATURE_VALUE(pvr_dev, common_store_size_in_dwords, &common_s=
tore_size_in_dwords);
> +
> +       alloc_region_size =3D common_store_size_in_dwords - (256U * 4U) -
> +                           rogue_get_common_store_partition_space_size(p=
vr_dev);
> +
> +       if (PVR_HAS_QUIRK(pvr_dev, 44079)) {
> +               u32 common_store_split_point =3D (768U * 4U * 4U);
> +
> +               return min(common_store_split_point - (256U * 4U), alloc_=
region_size);
> +       }
> +
> +       return alloc_region_size;
> +}
> +
> +static inline u32
> +rogue_get_num_phantoms(struct pvr_device *pvr_dev)
> +{
> +       u32 num_clusters =3D 1;
> +
> +       PVR_FEATURE_VALUE(pvr_dev, num_clusters, &num_clusters);
> +
> +       return ROGUE_REQ_NUM_PHANTOMS(num_clusters);
> +}
> +
> +static inline u32
> +rogue_get_max_coeffs(struct pvr_device *pvr_dev)
> +{
> +       u32 max_coeff_additional_portion =3D ROGUE_MAX_VERTEX_SHARED_REGI=
STERS;
> +       u32 pending_allocation_shared_regs =3D 2U * 1024U;
> +       u32 pending_allocation_coeff_regs =3D 0U;
> +       u32 num_phantoms =3D rogue_get_num_phantoms(pvr_dev);
> +       u32 tiles_in_flight =3D 0;
> +       u32 max_coeff_pixel_portion;
> +
> +       PVR_FEATURE_VALUE(pvr_dev, isp_max_tiles_in_flight, &tiles_in_fli=
ght);
> +       max_coeff_pixel_portion =3D DIV_ROUND_UP(tiles_in_flight, num_pha=
ntoms);
> +       max_coeff_pixel_portion *=3D ROGUE_MAX_PIXEL_SHARED_REGISTERS;
> +
> +       /*
> +        * Compute tasks on cores with BRN48492 and without compute overl=
ap may lock
> +        * up without two additional lines of coeffs.
> +        */
> +       if (PVR_HAS_QUIRK(pvr_dev, 48492) && !PVR_HAS_FEATURE(pvr_dev, co=
mpute_overlap))
> +               pending_allocation_coeff_regs =3D 2U * 1024U;
> +
> +       if (PVR_HAS_ENHANCEMENT(pvr_dev, 38748))
> +               pending_allocation_shared_regs =3D 0;
> +
> +       if (PVR_HAS_ENHANCEMENT(pvr_dev, 38020))
> +               max_coeff_additional_portion +=3D ROGUE_MAX_COMPUTE_SHARE=
D_REGISTERS;
> +
> +       return rogue_get_common_store_alloc_region_size(pvr_dev) + pendin=
g_allocation_coeff_regs -
> +               (max_coeff_pixel_portion + max_coeff_additional_portion +
> +                pending_allocation_shared_regs);
> +}
> +
> +static inline u32
> +rogue_get_cdm_max_local_mem_size_regs(struct pvr_device *pvr_dev)
> +{
> +       u32 available_coeffs_in_dwords =3D rogue_get_max_coeffs(pvr_dev);
> +
> +       if (PVR_HAS_QUIRK(pvr_dev, 48492) && PVR_HAS_FEATURE(pvr_dev, rog=
uexe) &&
> +           !PVR_HAS_FEATURE(pvr_dev, compute_overlap)) {
> +               /* Driver must not use the 2 reserved lines. */
> +               available_coeffs_in_dwords -=3D ROGUE_CSRM_LINE_SIZE_IN_D=
WORDS * 2;
> +       }
> +
> +       /*
> +        * The maximum amount of local memory available to a kernel is th=
e minimum
> +        * of the total number of coefficient registers available and the=
 max common
> +        * store allocation size which can be made by the CDM.
> +        *
> +        * If any coeff lines are reserved for tessellation or pixel then=
 we need to
> +        * subtract those too.
> +        */
> +       return min(available_coeffs_in_dwords, (u32)ROGUE_MAX_PER_KERNEL_=
LOCAL_MEM_SIZE_REGS);
> +}
> +
> +/**
> + * pvr_dev_query_gpu_info_get()
> + * @pvr_dev: Device pointer.
> + * @args: [IN] Device query arguments containing a pointer to a userspac=
e
> + *        struct drm_pvr_dev_query_gpu_info.
> + *
> + * If the query object pointer is NULL, the size field is updated with t=
he
> + * expected size of the query object.
> + *
> + * Returns:
> + *  * 0 on success, or if size is requested using a NULL pointer, or
> + *  * -%E2BIG if the indicated length of the allocation is less than is
> + *    required to contain the copied data, or
> + *  * -%EFAULT if local memory could not be copied to userspace.
> + */
> +static int
> +pvr_dev_query_gpu_info_get(struct pvr_device *pvr_dev,
> +                          struct drm_pvr_ioctl_dev_query_args *args)
> +{
> +       struct drm_pvr_dev_query_gpu_info gpu_info =3D {0};
> +       int err;
> +
> +       if (!args->pointer) {
> +               args->size =3D sizeof(struct drm_pvr_dev_query_gpu_info);
> +               return 0;
> +       }
> +
> +       gpu_info.gpu_id =3D
> +               pvr_gpu_id_to_packed_bvnc(&pvr_dev->gpu_id);
> +       gpu_info.num_phantoms =3D rogue_get_num_phantoms(pvr_dev);
> +
> +       err =3D PVR_UOBJ_SET(args->pointer, args->size, gpu_info);
> +       if (err < 0)
> +               return err;
> +
> +       if (args->size > sizeof(gpu_info))
> +               args->size =3D sizeof(gpu_info);
> +       return 0;
> +}
> +
> +/**
> + * pvr_dev_query_runtime_info_get()
> + * @pvr_dev: Device pointer.
> + * @args: [IN] Device query arguments containing a pointer to a userspac=
e
> + *        struct drm_pvr_dev_query_runtime_info.
> + *
> + * If the query object pointer is NULL, the size field is updated with t=
he
> + * expected size of the query object.
> + *
> + * Returns:
> + *  * 0 on success, or if size is requested using a NULL pointer, or
> + *  * -%E2BIG if the indicated length of the allocation is less than is
> + *    required to contain the copied data, or
> + *  * -%EFAULT if local memory could not be copied to userspace.
> + */
> +static int
> +pvr_dev_query_runtime_info_get(struct pvr_device *pvr_dev,
> +                              struct drm_pvr_ioctl_dev_query_args *args)
> +{
> +       struct drm_pvr_dev_query_runtime_info runtime_info =3D {0};
> +       int err;
> +
> +       if (!args->pointer) {
> +               args->size =3D sizeof(struct drm_pvr_dev_query_runtime_in=
fo);
> +               return 0;
> +       }
> +
> +       runtime_info.free_list_min_pages =3D 0; /* FIXME */
> +       runtime_info.free_list_max_pages =3D
> +               ROGUE_PM_MAX_FREELIST_SIZE / ROGUE_PM_PAGE_SIZE;
> +       runtime_info.common_store_alloc_region_size =3D
> +               rogue_get_common_store_alloc_region_size(pvr_dev);
> +       runtime_info.common_store_partition_space_size =3D
> +               rogue_get_common_store_partition_space_size(pvr_dev);
> +       runtime_info.max_coeffs =3D rogue_get_max_coeffs(pvr_dev);
> +       runtime_info.cdm_max_local_mem_size_regs =3D
> +               rogue_get_cdm_max_local_mem_size_regs(pvr_dev);
> +
> +       err =3D PVR_UOBJ_SET(args->pointer, args->size, runtime_info);
> +       if (err < 0)
> +               return err;
> +
> +       if (args->size > sizeof(runtime_info))
> +               args->size =3D sizeof(runtime_info);
> +       return 0;
> +}
> +
> +/**
> + * pvr_dev_query_hwrt_info_get()
> + * @pvr_dev: Device pointer.
> + * @args: [IN] Device query arguments containing a pointer to a userspac=
e
> + *        struct drm_pvr_dev_query_hwrt_info.
> + *
> + * If the query object pointer is NULL, the size field is updated with t=
he
> + * expected size of the query object.
> + *
> + * Returns:
> + *  * 0 on success, or if size is requested using a NULL pointer, or
> + *  * -%E2BIG if the indicated length of the allocation is less than is
> + *    required to contain the copied data, or
> + *  * -%EFAULT if local memory could not be copied to userspace.
> + */
> +static int
> +pvr_dev_query_hwrt_info_get(struct pvr_device *pvr_dev,
> +                           struct drm_pvr_ioctl_dev_query_args *args)
> +{
> +       struct drm_pvr_dev_query_hwrt_info hwrt_info =3D {0};
> +       int err;
> +
> +       if (!args->pointer) {
> +               args->size =3D sizeof(struct drm_pvr_dev_query_hwrt_info)=
;
> +               return 0;
> +       }
> +
> +       hwrt_info.num_geomdatas =3D ROGUE_FWIF_NUM_GEOMDATAS;
> +       hwrt_info.num_rtdatas =3D ROGUE_FWIF_NUM_RTDATAS;
> +       hwrt_info.num_freelists =3D ROGUE_FWIF_NUM_RTDATA_FREELISTS;
> +
> +       err =3D PVR_UOBJ_SET(args->pointer, args->size, hwrt_info);
> +       if (err < 0)
> +               return err;
> +
> +       if (args->size > sizeof(hwrt_info))
> +               args->size =3D sizeof(hwrt_info);
> +       return 0;
> +}
> +
> +/**
> + * pvr_dev_query_quirks_get() - Unpack array of quirks at the address gi=
ven
> + * in a struct drm_pvr_dev_query_quirks, or gets the amount of space req=
uired
> + * for it.
> + * @pvr_dev: Device pointer.
> + * @args: [IN] Device query arguments containing a pointer to a userspac=
e
> + *        struct drm_pvr_dev_query_query_quirks.
> + *
> + * If the query object pointer is NULL, the size field is updated with t=
he
> + * expected size of the query object.
> + * If the userspace pointer in the query object is NULL, or the count is
> + * short, no data is copied.
> + * The count field will be updated to that copied, or if either pointer =
is
> + * NULL, that which would have been copied.
> + * The size field in the query object will be updated to the size copied=
.
> + *
> + * Returns:
> + *  * 0 on success, or if size/count is requested using a NULL pointer, =
or
> + *  * -%EINVAL if args contained non-zero reserved fields, or
> + *  * -%E2BIG if the indicated length of the allocation is less than is
> + *    required to contain the copied data, or
> + *  * -%EFAULT if local memory could not be copied to userspace.
> + */
> +static int
> +pvr_dev_query_quirks_get(struct pvr_device *pvr_dev,
> +                        struct drm_pvr_ioctl_dev_query_args *args)
> +{
> +       /*
> +        * @FIXME - hardcoding of numbers here is intended as an
> +        * intermediate step so the UAPI can be fixed, but requires a
> +        * a refactor in the future to store them in a more appropriate
> +        * location
> +        */
> +       static const u32 umd_quirks_musthave[] =3D {
> +               47217,
> +               49927,
> +               62269,
> +       };
> +       static const u32 umd_quirks[] =3D {
> +               48545,
> +               51764,
> +       };
> +       struct drm_pvr_dev_query_quirks query;
> +       u32 out[ARRAY_SIZE(umd_quirks_musthave) + ARRAY_SIZE(umd_quirks)]=
;
> +       size_t out_musthave_count =3D 0;
> +       size_t out_count =3D 0;
> +       int err;
> +
> +       if (!args->pointer) {
> +               args->size =3D sizeof(struct drm_pvr_dev_query_quirks);
> +               return 0;
> +       }
> +
> +       err =3D PVR_UOBJ_GET(query, args->size, args->pointer);
> +
> +       if (err < 0)
> +               return err;
> +       if (query._padding_c)
> +               return -EINVAL;
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(umd_quirks_musthave); i++) {
> +               if (pvr_device_has_uapi_quirk(pvr_dev, umd_quirks_musthav=
e[i])) {
> +                       out[out_count++] =3D umd_quirks_musthave[i];
> +                       out_musthave_count++;
> +               }
> +       }
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(umd_quirks); i++) {
> +               if (pvr_device_has_uapi_quirk(pvr_dev, umd_quirks[i]))
> +                       out[out_count++] =3D umd_quirks[i];
> +       }
> +
> +       if (!query.quirks)
> +               goto copy_out;
> +       if (query.count < out_count)
> +               return -E2BIG;
> +
> +       if (copy_to_user(u64_to_user_ptr(query.quirks), out,
> +                        out_count * sizeof(u32))) {
> +               return -EFAULT;
> +       }
> +
> +       query.musthave_count =3D out_musthave_count;
> +
> +copy_out:
> +       query.count =3D out_count;
> +       err =3D PVR_UOBJ_SET(args->pointer, args->size, query);
> +       if (err < 0)
> +               return err;
> +
> +       args->size =3D sizeof(query);
> +       return 0;
> +}
> +
> +/**
> + * pvr_dev_query_enhancements_get() - Unpack array of enhancements at th=
e
> + * address given in a struct drm_pvr_dev_query_enhancements, or gets the=
 amount
> + * of space required for it.
> + * @pvr_dev: Device pointer.
> + * @args: [IN] Device query arguments containing a pointer to a userspac=
e
> + *        struct drm_pvr_dev_query_enhancements.
> + *
> + * If the query object pointer is NULL, the size field is updated with t=
he
> + * expected size of the query object.
> + * If the userspace pointer in the query object is NULL, or the count is
> + * short, no data is copied.
> + * The count field will be updated to that copied, or if either pointer =
is
> + * NULL, that which would have been copied.
> + * The size field in the query object will be updated to the size copied=
.
> + *
> + * Returns:
> + *  * 0 on success, or if size/count is requested using a NULL pointer, =
or
> + *  * -%EINVAL if args contained non-zero reserved fields, or
> + *  * -%E2BIG if the indicated length of the allocation is less than is
> + *    required to contain the copied data, or
> + *  * -%EFAULT if local memory could not be copied to userspace.
> + */
> +static int
> +pvr_dev_query_enhancements_get(struct pvr_device *pvr_dev,
> +                              struct drm_pvr_ioctl_dev_query_args *args)
> +{
> +       /*
> +        * @FIXME - hardcoding of numbers here is intended as an
> +        * intermediate step so the UAPI can be fixed, but requires a
> +        * a refactor in the future to store them in a more appropriate
> +        * location
> +        */
> +       const u32 umd_enhancements[] =3D {
> +               35421,
> +               42064,
> +       };
> +       struct drm_pvr_dev_query_enhancements query;
> +       u32 out[ARRAY_SIZE(umd_enhancements)];
> +       size_t out_idx =3D 0;
> +       int err;
> +
> +       if (!args->pointer) {
> +               args->size =3D sizeof(struct drm_pvr_dev_query_enhancemen=
ts);
> +               return 0;
> +       }
> +
> +       err =3D PVR_UOBJ_GET(query, args->size, args->pointer);
> +
> +       if (err < 0)
> +               return err;
> +       if (query._padding_a)
> +               return -EINVAL;
> +       if (query._padding_c)
> +               return -EINVAL;
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(umd_enhancements); i++) {
> +               if (pvr_device_has_uapi_enhancement(pvr_dev, umd_enhancem=
ents[i]))
> +                       out[out_idx++] =3D umd_enhancements[i];
> +       }
> +
> +       if (!query.enhancements)
> +               goto copy_out;
> +       if (query.count < out_idx)
> +               return -E2BIG;
> +
> +       if (copy_to_user(u64_to_user_ptr(query.enhancements), out,
> +                        out_idx * sizeof(u32))) {
> +               return -EFAULT;
> +       }
> +
> +copy_out:
> +       query.count =3D out_idx;
> +       err =3D PVR_UOBJ_SET(args->pointer, args->size, query);
> +       if (err < 0)
> +               return err;
> +
> +       args->size =3D sizeof(query);
> +       return 0;
> +}
> +
>  /**
>   * pvr_ioctl_dev_query() - IOCTL to copy information about a device
>   * @drm_dev: [IN] DRM device.
> @@ -112,7 +531,33 @@ static int
>  pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
>                     struct drm_file *file)
>  {
> -       return -ENOTTY;
> +       struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
> +       struct drm_pvr_ioctl_dev_query_args *args =3D raw_args;
> +
> +       switch ((enum drm_pvr_dev_query)args->type) {
> +       case DRM_PVR_DEV_QUERY_GPU_INFO_GET:
> +               return pvr_dev_query_gpu_info_get(pvr_dev, args);
> +
> +       case DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET:
> +               return pvr_dev_query_runtime_info_get(pvr_dev, args);
> +
> +       case DRM_PVR_DEV_QUERY_HWRT_INFO_GET:
> +               return pvr_dev_query_hwrt_info_get(pvr_dev, args);
> +
> +       case DRM_PVR_DEV_QUERY_QUIRKS_GET:
> +               return pvr_dev_query_quirks_get(pvr_dev, args);
> +
> +       case DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET:
> +               return pvr_dev_query_enhancements_get(pvr_dev, args);
> +
> +       case DRM_PVR_DEV_QUERY_HEAP_INFO_GET:
> +               return -EINVAL;
> +
> +       case DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET:
> +               return -EINVAL;
> +       }
> +
> +       return -EINVAL;
>  }
>
>  /**
> @@ -350,6 +795,112 @@ pvr_ioctl_submit_jobs(struct drm_device *drm_dev, v=
oid *raw_args,
>         return -ENOTTY;
>  }
>
> +int
> +pvr_get_uobj(u64 usr_ptr, u32 usr_stride, u32 min_stride, u32 obj_size, =
void *out)
> +{
> +       if (usr_stride < min_stride)
> +               return -EINVAL;
> +
> +       return copy_struct_from_user(out, obj_size, u64_to_user_ptr(usr_p=
tr), usr_stride);
> +}
> +
> +int
> +pvr_set_uobj(u64 usr_ptr, u32 usr_stride, u32 min_stride, u32 obj_size, =
const void *in)
> +{
> +       if (usr_stride < min_stride)
> +               return -EINVAL;
> +
> +       if (copy_to_user(u64_to_user_ptr(usr_ptr), in, min_t(u32, usr_str=
ide, obj_size)))
> +               return -EFAULT;
> +
> +       if (usr_stride > obj_size &&
> +           clear_user(u64_to_user_ptr(usr_ptr + obj_size), usr_stride - =
obj_size)) {
> +               return -EFAULT;
> +       }
> +
> +       return 0;
> +}
> +
> +int
> +pvr_get_uobj_array(const struct drm_pvr_obj_array *in, u32 min_stride, u=
32 obj_size, void **out)
> +{
> +       int ret =3D 0;
> +       void *out_alloc;
> +
> +       if (in->stride < min_stride)
> +               return -EINVAL;
> +
> +       if (!in->count)
> +               return 0;
> +
> +       out_alloc =3D kvmalloc_array(in->count, obj_size, GFP_KERNEL);
> +       if (!out_alloc)
> +               return -ENOMEM;
> +
> +       if (obj_size =3D=3D in->stride) {
> +               if (copy_from_user(out_alloc, u64_to_user_ptr(in->array),
> +                                  (unsigned long)obj_size * in->count))
> +                       ret =3D -EFAULT;
> +       } else {
> +               void __user *in_ptr =3D u64_to_user_ptr(in->array);
> +               void *out_ptr =3D out_alloc;
> +
> +               for (u32 i =3D 0; i < in->count; i++) {
> +                       ret =3D copy_struct_from_user(out_ptr, obj_size, =
in_ptr, in->stride);
> +                       if (ret)
> +                               break;
> +
> +                       out_ptr +=3D obj_size;
> +                       in_ptr +=3D in->stride;
> +               }
> +       }
> +
> +       if (ret) {
> +               kvfree(out_alloc);
> +               return ret;
> +       }
> +
> +       *out =3D out_alloc;
> +       return 0;
> +}
> +
> +int
> +pvr_set_uobj_array(const struct drm_pvr_obj_array *out, u32 min_stride, =
u32 obj_size,
> +                  const void *in)
> +{
> +       if (out->stride < min_stride)
> +               return -EINVAL;
> +
> +       if (!out->count)
> +               return 0;
> +
> +       if (obj_size =3D=3D out->stride) {
> +               if (copy_to_user(u64_to_user_ptr(out->array), in,
> +                                (unsigned long)obj_size * out->count))
> +                       return -EFAULT;
> +       } else {
> +               u32 cpy_elem_size =3D min_t(u32, out->stride, obj_size);
> +               void __user *out_ptr =3D u64_to_user_ptr(out->array);
> +               const void *in_ptr =3D in;
> +
> +               for (u32 i =3D 0; i < out->count; i++) {
> +                       if (copy_to_user(out_ptr, in_ptr, cpy_elem_size))
> +                               return -EFAULT;
> +
> +                       out_ptr +=3D obj_size;
> +                       in_ptr +=3D out->stride;
> +               }
> +
> +               if (out->stride > obj_size &&
> +                   clear_user(u64_to_user_ptr(out->array + obj_size),
> +                              out->stride - obj_size)) {
> +                       return -EFAULT;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  #define DRM_PVR_IOCTL(_name, _func, _flags) \
>         DRM_IOCTL_DEF_DRV(PVR_##_name, pvr_ioctl_##_func, _flags)
>
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imag=
ination/pvr_drv.h
> index 8e6f4a4dde3f..febdf1f09571 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.h
> +++ b/drivers/gpu/drm/imagination/pvr_drv.h
> @@ -19,4 +19,112 @@
>  #define PVR_DRIVER_MINOR 0
>  #define PVR_DRIVER_PATCHLEVEL 0
>
> +int pvr_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 obj_size, =
void *out);
> +int pvr_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 obj_size, =
const void *in);
> +int pvr_get_uobj_array(const struct drm_pvr_obj_array *in, u32 min_strid=
e, u32 obj_size,
> +                      void **out);
> +int pvr_set_uobj_array(const struct drm_pvr_obj_array *out, u32 min_stri=
de, u32 obj_size,
> +                      const void *in);
> +
> +#define PVR_UOBJ_MIN_SIZE_INTERNAL(_typename, _last_mandatory_field) \
> +       (offsetof(_typename, _last_mandatory_field) + \
> +        sizeof(((_typename *)NULL)->_last_mandatory_field))
> +
> +/* NOLINTBEGIN(bugprone-macro-parentheses) */
> +#define PVR_UOBJ_DECL(_typename, _last_mandatory_field) \
> +       , _typename : PVR_UOBJ_MIN_SIZE_INTERNAL(_typename, _last_mandato=
ry_field)
> +/* NOLINTEND(bugprone-macro-parentheses) */
> +
> +/**
> + * DOC: PVR user objects.
> + *
> + * Macros used to aid copying structured and array data to and from
> + * userspace. Objects can differ in size, provided the minimum size
> + * allowed is specified (using the last mandatory field in the struct).
> + * All types used with PVR_UOBJ_GET/SET macros must be listed here under
> + * PVR_UOBJ_MIN_SIZE, with the last mandatory struct field specified.
> + */
> +
> +/**
> + * PVR_UOBJ_MIN_SIZE() - Fetch the minimum copy size of a compatible typ=
e object.
> + * @_obj_name: The name of the object. Cannot be a typename - this is de=
duced.
> + *
> + * This cannot fail. Using the macro with an incompatible type will resu=
lt in a
> + * compiler error.
> + *
> + * To add compatibility for a type, list it within the macro in an order=
ly
> + * fashion. The second argument is the name of the last mandatory field =
of the
> + * struct type, which is used to calculate the size. See also PVR_UOBJ_D=
ECL().
> + *
> + * Return: The minimum copy size.
> + */
> +#define PVR_UOBJ_MIN_SIZE(_obj_name) _Generic(_obj_name \
> +       PVR_UOBJ_DECL(struct drm_pvr_job, hwrt) \
> +       PVR_UOBJ_DECL(struct drm_pvr_sync_op, value) \
> +       PVR_UOBJ_DECL(struct drm_pvr_dev_query_gpu_info, num_phantoms) \
> +       PVR_UOBJ_DECL(struct drm_pvr_dev_query_runtime_info, cdm_max_loca=
l_mem_size_regs) \
> +       PVR_UOBJ_DECL(struct drm_pvr_dev_query_hwrt_info, _padding_4) \
> +       PVR_UOBJ_DECL(struct drm_pvr_dev_query_quirks, _padding_c) \
> +       PVR_UOBJ_DECL(struct drm_pvr_dev_query_enhancements, _padding_c) =
\
> +       PVR_UOBJ_DECL(struct drm_pvr_heap, page_size_log2) \
> +       PVR_UOBJ_DECL(struct drm_pvr_dev_query_heap_info, heaps) \
> +       PVR_UOBJ_DECL(struct drm_pvr_static_data_area, offset) \
> +       PVR_UOBJ_DECL(struct drm_pvr_dev_query_static_data_areas, static_=
data_areas) \
> +       )
> +
> +/**
> + * PVR_UOBJ_GET() - Copies from _src_usr_ptr to &_dest_obj.
> + * @_dest_obj: The destination container object in kernel space.
> + * @_usr_size: The size of the source container in user space.
> + * @_src_usr_ptr: __u64 raw pointer to the source container in user spac=
e.
> + *
> + * Return: Error code. See pvr_get_uobj().
> + */
> +#define PVR_UOBJ_GET(_dest_obj, _usr_size, _src_usr_ptr) \
> +       pvr_get_uobj(_src_usr_ptr, _usr_size, \
> +                    PVR_UOBJ_MIN_SIZE(_dest_obj), \
> +                    sizeof(_dest_obj), &(_dest_obj))
> +
> +/**
> + * PVR_UOBJ_SET() - Copies from &_src_obj to _dest_usr_ptr.
> + * @_dest_usr_ptr: __u64 raw pointer to the destination container in use=
r space.
> + * @_usr_size: The size of the destination container in user space.
> + * @_src_obj: The source container object in kernel space.
> + *
> + * Return: Error code. See pvr_set_uobj().
> + */
> +#define PVR_UOBJ_SET(_dest_usr_ptr, _usr_size, _src_obj) \
> +       pvr_set_uobj(_dest_usr_ptr, _usr_size, \
> +                    PVR_UOBJ_MIN_SIZE(_src_obj), \
> +                    sizeof(_src_obj), &(_src_obj))
> +
> +/**
> + * PVR_UOBJ_GET_ARRAY() - Copies from @_src_drm_pvr_obj_array.array to
> + * alloced memory and returns a pointer in _dest_array.
> + * @_dest_array: The destination C array object in kernel space.
> + * @_src_drm_pvr_obj_array: The &struct drm_pvr_obj_array containing a _=
_u64 raw
> + * pointer to the source C array in user space and the size of each arra=
y
> + * element in user space (the 'stride').
> + *
> + * Return: Error code. See pvr_get_uobj_array().
> + */
> +#define PVR_UOBJ_GET_ARRAY(_dest_array, _src_drm_pvr_obj_array) \
> +       pvr_get_uobj_array(_src_drm_pvr_obj_array, \
> +                          PVR_UOBJ_MIN_SIZE((_dest_array)[0]), \
> +                          sizeof((_dest_array)[0]), (void **)&(_dest_arr=
ay))
> +
> +/**
> + * PVR_UOBJ_SET_ARRAY() - Copies from _src_array to @_dest_drm_pvr_obj_a=
rray.array.
> + * @_dest_drm_pvr_obj_array: The &struct drm_pvr_obj_array containing a =
__u64 raw
> + * pointer to the destination C array in user space and the size of each=
 array
> + * element in user space (the 'stride').
> + * @_src_array: The source C array object in kernel space.
> + *
> + * Return: Error code. See pvr_set_uobj_array().
> + */
> +#define PVR_UOBJ_SET_ARRAY(_dest_drm_pvr_obj_array, _src_array) \
> +       pvr_set_uobj_array(_dest_drm_pvr_obj_array, \
> +                          PVR_UOBJ_MIN_SIZE((_src_array)[0]), \
> +                          sizeof((_src_array)[0]), _src_array)
> +
>  #endif /* PVR_DRV_H */
> diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagi=
nation/pvr_fw.h
> new file mode 100644
> index 000000000000..ba3bfd41867f
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_fw.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/* Copyright (c) 2022 Imagination Technologies Ltd. */
> +
> +#ifndef PVR_FW_H
> +#define PVR_FW_H
> +
> +#include <linux/firmware.h>
> +
> +struct pvr_fw_device {
> +       /** @firmware: Handle to the firmware loaded into the device. */
> +       const struct firmware *firmware;
> +
> +       /*
> +        * @processor_type: FW processor type for this device. Must be on=
e of
> +        *                  %PVR_FW_PROCESSOR_TYPE_*.
> +        */
> +       u16 processor_type;
> +};
> +
> +#endif /* PVR_FW_H */
> --
> 2.40.1
>
