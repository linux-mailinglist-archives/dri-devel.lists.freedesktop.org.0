Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A06655E1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 09:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F0F10E49F;
	Wed, 11 Jan 2023 08:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CFA10E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 08:20:55 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so185801437b3.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T3qNdxOCmeLrJegyYxG2klNVgPV60IiRFTKuG7TuNOU=;
 b=LHs3LB08WNwP/wGwIugNkF4oDIkxf7e2Gu/W7E+nMWiIepTwdy2kK395fwssxXPav9
 nddGuUg2dYN+lxatCQ6k+oevdx4sm6ZLCdRwGxaScZDnaRMY+hPKgkxG+2Ha5/SM95Ie
 FYfGBd5TqunQ9XpFZb6OVrJGAg42lmA4gt9tvhxo3OKOFmlwrjRVC0vi2sKnz527zYBV
 YHngZG/3323sUBCE6NjtmeYXffPocDPEUYIBFhKex9VZOUJoymhMEEcsQSQ3p75c6Egf
 7aU8JznnTiXmaB9vvUkTu38B+B3d4kBdzkomHMFU7gxThTZSFD0kZF42SdEF/CjBtVFe
 22Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3qNdxOCmeLrJegyYxG2klNVgPV60IiRFTKuG7TuNOU=;
 b=Azt38jU+hq/CgktgjK7BvSFE6+u6ViA0DSkqFKM8DQB1zJ+gMAZKVTNM+J2VcKxHY2
 LbqBCe1A4OaS93YRkJOW/4cwQP7Wb5Si4+LSGT058aP5YTesYx9fAURIzpTQH7j4Icju
 6vIgLoUribCJq0glN45uF793M0llnLkAs8ETuOifi2MWIq3Oh96YtnmK+iopRO+B8PMe
 MXOKVWlxhidFe7aDVgzNeyAr7xSemD8kJfmmdKVIw0BsowNvVvQqklNONNgFiNUD8YsW
 vctYocZfvL7fnHPrSZtzmYrilIk151CRtjhat2zgLK8RrY00EXDb9gaHLAPaJ7r8np0o
 80MA==
X-Gm-Message-State: AFqh2koiBTfnJ6utET+qK2VGIvIj7VIz9w0BWjq9H0dF60etKRnVlV0c
 O919yXiL8vEz3T4zvL+prsOSLXiVXoc5fwwgxF0=
X-Google-Smtp-Source: AMrXdXuP+GpsAs/PIsww2TGsrIy2kTnmm1aGcFcH2u18vHrQMzlgXTar4tiAXHzs1Qz81h8Dmq8MbEEFkkcN59ZP+bk=
X-Received: by 2002:a05:690c:299:b0:370:2d8c:8193 with SMTP id
 bf25-20020a05690c029900b003702d8c8193mr1771076ywb.221.1673425253811; Wed, 11
 Jan 2023 00:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-6-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf13Ok6vZaThnBuJeagzDHkBxdtWWW3+kqfz3RgYRQE_5_g@mail.gmail.com>
 <91b48aac-9b34-cafa-b788-d72d3fa15dd3@linux.intel.com>
In-Reply-To: <91b48aac-9b34-cafa-b788-d72d3fa15dd3@linux.intel.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 11 Jan 2023 10:20:27 +0200
Message-ID: <CAFCwf12HpgFQMXGcEGaf7SNJE=_NyXPx14QSKL1+PjEqUS4H-Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] accel/ivpu: Implement firmware parsing and booting
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 stanislaw.gruszka@linux.intel.com, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 10:16 AM Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Hi,
>
> On 10.01.2023 16:34, Oded Gabbay wrote:
> > On Mon, Jan 9, 2023 at 2:24 PM Jacek Lawrynowicz
> > <jacek.lawrynowicz@linux.intel.com> wrote:
> >> Read, parse and boot VPU firmware image.
> >>
> >> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> >> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> >> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> >> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> >> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> >> ---
> >>  drivers/accel/ivpu/Makefile       |   1 +
> >>  drivers/accel/ivpu/ivpu_drv.c     | 131 +++++++++-
> >>  drivers/accel/ivpu/ivpu_drv.h     |  11 +
> >>  drivers/accel/ivpu/ivpu_fw.c      | 419 ++++++++++++++++++++++++++++++
> >>  drivers/accel/ivpu/ivpu_fw.h      |  38 +++
> >>  drivers/accel/ivpu/ivpu_hw_mtl.c  |  10 +
> >>  drivers/accel/ivpu/vpu_boot_api.h | 349 +++++++++++++++++++++++++
> >>  include/uapi/drm/ivpu_accel.h     |  21 ++
> >>  8 files changed, 979 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/accel/ivpu/ivpu_fw.c
> >>  create mode 100644 drivers/accel/ivpu/ivpu_fw.h
> >>  create mode 100644 drivers/accel/ivpu/vpu_boot_api.h
> >>
> >> diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
> >> index 46595f0112e3..9fa6a76e9d79 100644
> >> --- a/drivers/accel/ivpu/Makefile
> >> +++ b/drivers/accel/ivpu/Makefile
> >> @@ -3,6 +3,7 @@
> >>
> >>  intel_vpu-y := \
> >>         ivpu_drv.o \
> >> +       ivpu_fw.o \
> >>         ivpu_gem.o \
> >>         ivpu_hw_mtl.o \
> >>         ivpu_ipc.o \
> >> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> >> index 6643ae6b5a52..53e103f64832 100644
> >> --- a/drivers/accel/ivpu/ivpu_drv.c
> >> +++ b/drivers/accel/ivpu/ivpu_drv.c
> >> @@ -14,10 +14,13 @@
> >>  #include <drm/drm_ioctl.h>
> >>  #include <drm/drm_prime.h>
> >>
> >> +#include "vpu_boot_api.h"
> >>  #include "ivpu_drv.h"
> >> +#include "ivpu_fw.h"
> >>  #include "ivpu_gem.h"
> >>  #include "ivpu_hw.h"
> >>  #include "ivpu_ipc.h"
> >> +#include "ivpu_jsm_msg.h"
> >>  #include "ivpu_mmu.h"
> >>  #include "ivpu_mmu_context.h"
> >>
> >> @@ -32,6 +35,10 @@ int ivpu_dbg_mask;
> >>  module_param_named(dbg_mask, ivpu_dbg_mask, int, 0644);
> >>  MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
> >>
> >> +int ivpu_test_mode;
> >> +module_param_named_unsafe(test_mode, ivpu_test_mode, int, 0644);
> >> +MODULE_PARM_DESC(test_mode, "Test mode: 0 - normal operation, 1 - fw unit test, 2 - null hw");
> >> +
> >>  u8 ivpu_pll_min_ratio;
> >>  module_param_named(pll_min_ratio, ivpu_pll_min_ratio, byte, 0644);
> >>  MODULE_PARM_DESC(pll_min_ratio, "Minimum PLL ratio used to set VPU frequency");
> >> @@ -129,6 +136,28 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
> >>         case DRM_IVPU_PARAM_CONTEXT_ID:
> >>                 args->value = file_priv->ctx.id;
> >>                 break;
> >> +       case DRM_IVPU_PARAM_FW_API_VERSION:
> >> +               if (args->index < VPU_FW_API_VER_NUM) {
> >> +                       struct vpu_firmware_header *fw_hdr;
> >> +
> >> +                       fw_hdr = (struct vpu_firmware_header *)vdev->fw->file->data;
> >> +                       args->value = fw_hdr->api_version[args->index];
> >> +               } else {
> >> +                       ret = -EINVAL;
> >> +               }
> >> +               break;
> >> +       case DRM_IVPU_PARAM_ENGINE_HEARTBEAT:
> >> +               ret = ivpu_jsm_get_heartbeat(vdev, args->index, &args->value);
> >> +               break;
> >> +       case DRM_IVPU_PARAM_UNIQUE_INFERENCE_ID:
> >> +               args->value = (u64)atomic64_inc_return(&vdev->unique_id_counter);
> >> +               break;
> >> +       case DRM_IVPU_PARAM_TILE_CONFIG:
> >> +               args->value = vdev->hw->tile_fuse;
> >> +               break;
> >> +       case DRM_IVPU_PARAM_SKU:
> >> +               args->value = vdev->hw->sku;
> >> +               break;
> >>         default:
> >>                 ret = -EINVAL;
> >>                 break;
> >> @@ -226,11 +255,85 @@ static const struct drm_ioctl_desc ivpu_drm_ioctls[] = {
> >>         DRM_IOCTL_DEF_DRV(IVPU_BO_USERPTR, ivpu_bo_userptr_ioctl, 0),
> >>  };
> >>
> >> +static int ivpu_wait_for_ready(struct ivpu_device *vdev)
> >> +{
> >> +       struct ivpu_ipc_consumer cons;
> >> +       struct ivpu_ipc_hdr ipc_hdr;
> >> +       unsigned long timeout;
> >> +       int ret;
> >> +
> >> +       if (ivpu_test_mode == IVPU_TEST_MODE_FW_TEST)
> >> +               return 0;
> >> +
> >> +       ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG);
> >> +
> >> +       timeout = jiffies + msecs_to_jiffies(vdev->timeout.boot);
> >> +       while (1) {
> >> +               ret = ivpu_ipc_irq_handler(vdev);
> >> +               if (ret)
> >> +                       break;
> >> +               ret = ivpu_ipc_receive(vdev, &cons, &ipc_hdr, NULL, 0);
> >> +               if (ret != -ETIMEDOUT || time_after_eq(jiffies, timeout))
> >> +                       break;
> >> +
> >> +               cond_resched();
> >> +       }
> >> +
> >> +       ivpu_ipc_consumer_del(vdev, &cons);
> >> +
> >> +       if (!ret && ipc_hdr.data_addr != IVPU_IPC_BOOT_MSG_DATA_ADDR) {
> >> +               ivpu_err(vdev, "Invalid VPU ready message: 0x%x\n",
> >> +                        ipc_hdr.data_addr);
> >> +               return -EIO;
> >> +       }
> >> +
> >> +       if (!ret)
> >> +               ivpu_info(vdev, "VPU ready message received successfully\n");
> >> +       else
> >> +               ivpu_hw_diagnose_failure(vdev);
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +/**
> >> + * ivpu_boot() - Start VPU firmware
> >> + * @vdev: VPU device
> >> + *
> >> + * This function is paired with ivpu_shutdown() but it doesn't power up the
> >> + * VPU because power up has to be called very early in ivpu_probe().
> >> + */
> >> +int ivpu_boot(struct ivpu_device *vdev)
> >> +{
> >> +       int ret;
> >> +
> >> +       /* Update boot params located at first 4KB of FW memory */
> >> +       ivpu_fw_boot_params_setup(vdev, vdev->fw->mem->kvaddr);
> >> +
> >> +       ret = ivpu_hw_boot_fw(vdev);
> >> +       if (ret) {
> >> +               ivpu_err(vdev, "Failed to start the firmware: %d\n", ret);
> >> +               return ret;
> >> +       }
> >> +
> >> +       ret = ivpu_wait_for_ready(vdev);
> >> +       if (ret) {
> >> +               ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
> >> +               return ret;
> >> +       }
> >> +
> >> +       ivpu_hw_irq_clear(vdev);
> >> +       enable_irq(vdev->irq);
> >> +       ivpu_hw_irq_enable(vdev);
> >> +       ivpu_ipc_enable(vdev);
> >> +       return 0;
> >> +}
> >> +
> >>  int ivpu_shutdown(struct ivpu_device *vdev)
> >>  {
> >>         int ret;
> >>
> >>         ivpu_hw_irq_disable(vdev);
> >> +       disable_irq(vdev->irq);
> >>         ivpu_ipc_disable(vdev);
> >>         ivpu_mmu_disable(vdev);
> >>
> >> @@ -348,6 +451,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
> >>         if (!vdev->mmu)
> >>                 return -ENOMEM;
> >>
> >> +       vdev->fw = drmm_kzalloc(&vdev->drm, sizeof(*vdev->fw), GFP_KERNEL);
> >> +       if (!vdev->fw)
> >> +               return -ENOMEM;
> >> +
> >>         vdev->ipc = drmm_kzalloc(&vdev->drm, sizeof(*vdev->ipc), GFP_KERNEL);
> >>         if (!vdev->ipc)
> >>                 return -ENOMEM;
> >> @@ -356,6 +463,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
> >>         vdev->platform = IVPU_PLATFORM_INVALID;
> >>         vdev->context_xa_limit.min = IVPU_GLOBAL_CONTEXT_MMU_SSID + 1;
> >>         vdev->context_xa_limit.max = IVPU_CONTEXT_LIMIT;
> >> +       atomic64_set(&vdev->unique_id_counter, 0);
> >>         xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
> >>
> >>         ret = ivpu_pci_init(vdev);
> >> @@ -396,14 +504,34 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
> >>                 goto err_mmu_gctx_fini;
> >>         }
> >>
> >> +       ret = ivpu_fw_init(vdev);
> >> +       if (ret) {
> >> +               ivpu_err(vdev, "Failed to initialize firmware: %d\n", ret);
> >> +               goto err_mmu_gctx_fini;
> >> +       }
> >> +
> >>         ret = ivpu_ipc_init(vdev);
> >>         if (ret) {
> >>                 ivpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
> >> -               goto err_mmu_gctx_fini;
> >> +               goto err_fw_fini;
> >> +       }
> >> +
> >> +       ret = ivpu_fw_load(vdev);
> >> +       if (ret) {
> >> +               ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
> >> +               goto err_fw_fini;
> >> +       }
> >> +
> >> +       ret = ivpu_boot(vdev);
> >> +       if (ret) {
> >> +               ivpu_err(vdev, "Failed to boot: %d\n", ret);
> >> +               goto err_fw_fini;
> >>         }
> >>
> >>         return 0;
> >>
> >> +err_fw_fini:
> >> +       ivpu_fw_fini(vdev);
> >>  err_mmu_gctx_fini:
> >>         ivpu_mmu_global_context_fini(vdev);
> >>  err_power_down:
> >> @@ -417,6 +545,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
> >>  {
> >>         ivpu_shutdown(vdev);
> >>         ivpu_ipc_fini(vdev);
> >> +       ivpu_fw_fini(vdev);
> >>         ivpu_mmu_global_context_fini(vdev);
> >>
> >>         drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->context_xa));
> >> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> >> index c1e76d1fb8ba..317ae61f43bd 100644
> >> --- a/drivers/accel/ivpu/ivpu_drv.h
> >> +++ b/drivers/accel/ivpu/ivpu_drv.h
> >> @@ -74,6 +74,7 @@ struct ivpu_wa_table {
> >>
> >>  struct ivpu_hw_info;
> >>  struct ivpu_mmu_info;
> >> +struct ivpu_fw_info;
> >>  struct ivpu_ipc_info;
> >>
> >>  struct ivpu_device {
> >> @@ -86,12 +87,15 @@ struct ivpu_device {
> >>         struct ivpu_wa_table wa;
> >>         struct ivpu_hw_info *hw;
> >>         struct ivpu_mmu_info *mmu;
> >> +       struct ivpu_fw_info *fw;
> >>         struct ivpu_ipc_info *ipc;
> >>
> >>         struct ivpu_mmu_context gctx;
> >>         struct xarray context_xa;
> >>         struct xa_limit context_xa_limit;
> >>
> >> +       atomic64_t unique_id_counter;
> >> +
> >>         struct {
> >>                 int boot;
> >>                 int jsm;
> >> @@ -116,9 +120,16 @@ extern int ivpu_dbg_mask;
> >>  extern u8 ivpu_pll_min_ratio;
> >>  extern u8 ivpu_pll_max_ratio;
> >>
> >> +#define IVPU_TEST_MODE_DISABLED  0
> >> +#define IVPU_TEST_MODE_FW_TEST   1
> >> +#define IVPU_TEST_MODE_NULL_HW   2
> >> +extern int ivpu_test_mode;
> >> +
> >>  struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
> >>  struct ivpu_file_priv *ivpu_file_priv_get_by_ctx_id(struct ivpu_device *vdev, unsigned long id);
> >>  void ivpu_file_priv_put(struct ivpu_file_priv **link);
> >> +
> >> +int ivpu_boot(struct ivpu_device *vdev);
> >>  int ivpu_shutdown(struct ivpu_device *vdev);
> >>
> >>  static inline bool ivpu_is_mtl(struct ivpu_device *vdev)
> >> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> >> new file mode 100644
> >> index 000000000000..4baa0767a10d
> >> --- /dev/null
> >> +++ b/drivers/accel/ivpu/ivpu_fw.c
> >> @@ -0,0 +1,419 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (C) 2020-2023 Intel Corporation
> >> + */
> >> +
> >> +#include <linux/firmware.h>
> >> +#include <linux/highmem.h>
> >> +#include <linux/moduleparam.h>
> >> +#include <linux/pci.h>
> >> +
> >> +#include "vpu_boot_api.h"
> >> +#include "ivpu_drv.h"
> >> +#include "ivpu_fw.h"
> >> +#include "ivpu_gem.h"
> >> +#include "ivpu_hw.h"
> >> +#include "ivpu_ipc.h"
> >> +
> >> +#define FW_GLOBAL_MEM_START    (2ull * SZ_1G)
> >> +#define FW_GLOBAL_MEM_END      (3ull * SZ_1G)
> >> +#define FW_SHARED_MEM_SIZE     SZ_256M /* Must be aligned to FW_SHARED_MEM_ALIGNMENT */
> >> +#define FW_SHARED_MEM_ALIGNMENT        SZ_128K /* VPU MTRR limitation */
> >> +#define FW_RUNTIME_MAX_SIZE    SZ_512M
> >> +#define FW_SHAVE_NN_MAX_SIZE   SZ_2M
> >> +#define FW_RUNTIME_MIN_ADDR    (FW_GLOBAL_MEM_START)
> >> +#define FW_RUNTIME_MAX_ADDR    (FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
> >> +#define FW_VERSION_HEADER_SIZE SZ_4K
> >> +#define FW_FILE_IMAGE_OFFSET   (VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
> >> +
> >> +#define WATCHDOG_MSS_REDIRECT  32
> >> +#define WATCHDOG_NCE_REDIRECT  33
> >> +
> >> +#define ADDR_TO_L2_CACHE_CFG(addr) ((addr) >> 31)
> >> +
> >> +#define IVPU_FW_CHECK_API(vdev, fw_hdr, name) ivpu_fw_check_api(vdev, fw_hdr, #name, \
> >> +                                                                 VPU_##name##_API_VER_INDEX, \
> >> +                                                                 VPU_##name##_API_VER_MAJOR, \
> >> +                                                                 VPU_##name##_API_VER_MINOR)
> >> +
> >> +static char *ivpu_firmware;
> >> +module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
> >> +MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
> >> +
> >> +static int ivpu_fw_request(struct ivpu_device *vdev)
> >> +{
> >> +       static const char * const fw_names[] = {
> >> +               "mtl_vpu.bin",
> >> +               "intel/vpu/mtl_vpu_v0.0.bin"
> >> +       };
> >> +       int ret = -ENOENT;
> >> +       int i;
> >> +
> >> +       if (ivpu_firmware)
> >> +               return request_firmware(&vdev->fw->file, ivpu_firmware, vdev->drm.dev);
> >> +
> >> +       for (i = 0; i < ARRAY_SIZE(fw_names); i++) {
> >> +               ret = firmware_request_nowarn(&vdev->fw->file, fw_names[i], vdev->drm.dev);
> >> +               if (!ret)
> >> +                       return 0;
> >> +       }
> >> +
> >> +       ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
> >> +       return ret;
> >> +}
> >> +
> >> +static void
> >> +ivpu_fw_check_api(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr,
> >> +                 const char *str, int index, u16 expected_major, u16 expected_minor)
> >> +{
> >> +       u16 major = (u16)(fw_hdr->api_version[index] >> 16);
> >> +       u16 minor = (u16)(fw_hdr->api_version[index]);
> >> +
> >> +       if (major != expected_major) {
> >> +               ivpu_warn(vdev, "Incompatible FW %s API version: %d.%d (expected %d.%d)\n",
> >> +                         str, major, minor, expected_major, expected_minor);
> >> +       }
> >> +       ivpu_dbg(vdev, FW_BOOT, "FW %s API version: %d.%d (expected %d.%d)\n",
> >> +                str, major, minor, expected_major, expected_minor);
> >> +}
> >> +
> >> +static int ivpu_fw_parse(struct ivpu_device *vdev)
> >> +{
> >> +       struct ivpu_fw_info *fw = vdev->fw;
> >> +       const struct vpu_firmware_header *fw_hdr = (const void *)fw->file->data;
> >> +       u64 runtime_addr, image_load_addr, runtime_size, image_size;
> >> +
> >> +       if (fw->file->size <= FW_FILE_IMAGE_OFFSET) {
> >> +               ivpu_err(vdev, "Firmware file is too small: %zu\n", fw->file->size);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (fw_hdr->header_version != VPU_FW_HEADER_VERSION) {
> >> +               ivpu_err(vdev, "Invalid firmware header version: %u\n", fw_hdr->header_version);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       runtime_addr = fw_hdr->boot_params_load_address;
> >> +       runtime_size = fw_hdr->runtime_size;
> >> +       image_load_addr = fw_hdr->image_load_address;
> >> +       image_size = fw_hdr->image_size;
> >> +
> >> +       if (runtime_addr < FW_RUNTIME_MIN_ADDR || runtime_addr > FW_RUNTIME_MAX_ADDR) {
> >> +               ivpu_err(vdev, "Invalid firmware runtime address: 0x%llx\n", runtime_addr);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (runtime_size < fw->file->size || runtime_size > FW_RUNTIME_MAX_SIZE) {
> >> +               ivpu_err(vdev, "Invalid firmware runtime size: %llu\n", runtime_size);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (FW_FILE_IMAGE_OFFSET + image_size > fw->file->size) {
> >> +               ivpu_err(vdev, "Invalid image size: %llu\n", image_size);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (image_load_addr < runtime_addr ||
> >> +           image_load_addr + image_size > runtime_addr + runtime_size) {
> >> +               ivpu_err(vdev, "Invalid firmware load address size: 0x%llx and size %llu\n",
> >> +                        image_load_addr, image_size);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (fw_hdr->shave_nn_fw_size > FW_SHAVE_NN_MAX_SIZE) {
> >> +               ivpu_err(vdev, "SHAVE NN firmware is too big: %u\n", fw_hdr->shave_nn_fw_size);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (fw_hdr->entry_point < image_load_addr ||
> >> +           fw_hdr->entry_point >= image_load_addr + image_size) {
> >> +               ivpu_err(vdev, "Invalid entry point: 0x%llx\n", fw_hdr->entry_point);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       fw->runtime_addr = runtime_addr;
> >> +       fw->runtime_size = runtime_size;
> >> +       fw->image_load_offset = image_load_addr - runtime_addr;
> >> +       fw->image_size = image_size;
> >> +       fw->shave_nn_size = PAGE_ALIGN(fw_hdr->shave_nn_fw_size);
> >> +
> >> +       fw->cold_boot_entry_point = fw_hdr->entry_point;
> >> +       fw->entry_point = fw->cold_boot_entry_point;
> >> +
> >> +       ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
> >> +                fw_hdr->header_version, fw_hdr->image_format);
> >> +       ivpu_dbg(vdev, FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
> >> +                fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
> >> +       ivpu_dbg(vdev, FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
> >> +                fw->runtime_addr, image_load_addr, fw->entry_point);
> >> +       ivpu_dbg(vdev, FW_BOOT, "FW version: %s\n", (char *)fw_hdr + VPU_FW_HEADER_SIZE);
> >> +
> >> +       IVPU_FW_CHECK_API(vdev, fw_hdr, BOOT);
> >> +       IVPU_FW_CHECK_API(vdev, fw_hdr, JSM);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void ivpu_fw_release(struct ivpu_device *vdev)
> >> +{
> >> +       release_firmware(vdev->fw->file);
> >> +}
> >> +
> >> +static int ivpu_fw_update_global_range(struct ivpu_device *vdev)
> >> +{
> >> +       struct ivpu_fw_info *fw = vdev->fw;
> >> +       u64 start = ALIGN(fw->runtime_addr + fw->runtime_size, FW_SHARED_MEM_ALIGNMENT);
> >> +       u64 size = FW_SHARED_MEM_SIZE;
> >> +
> >> +       if (start + size > FW_GLOBAL_MEM_END) {
> >> +               ivpu_err(vdev, "No space for shared region, start %lld, size %lld\n", start, size);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       ivpu_hw_init_range(&vdev->hw->ranges.global_low, start, size);
> >> +       return 0;
> >> +}
> >> +
> >> +static int ivpu_fw_mem_init(struct ivpu_device *vdev)
> >> +{
> >> +       struct ivpu_fw_info *fw = vdev->fw;
> >> +       int ret;
> >> +
> >> +       ret = ivpu_fw_update_global_range(vdev);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size, DRM_IVPU_BO_WC);
> >> +       if (!fw->mem) {
> >> +               ivpu_err(vdev, "Failed to allocate firmware runtime memory\n");
> >> +               return -ENOMEM;
> >> +       }
> >> +
> >> +       if (fw->shave_nn_size) {
> >> +               fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.global_high.start,
> >> +                                                         fw->shave_nn_size, DRM_IVPU_BO_UNCACHED);
> >> +               if (!fw->mem_shave_nn) {
> >> +                       ivpu_err(vdev, "Failed to allocate shavenn buffer\n");
> >> +                       ivpu_bo_free_internal(fw->mem);
> >> +                       return -ENOMEM;
> >> +               }
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void ivpu_fw_mem_fini(struct ivpu_device *vdev)
> >> +{
> >> +       struct ivpu_fw_info *fw = vdev->fw;
> >> +
> >> +       if (fw->mem_shave_nn) {
> >> +               ivpu_bo_free_internal(fw->mem_shave_nn);
> >> +               fw->mem_shave_nn = NULL;
> >> +       }
> >> +
> >> +       ivpu_bo_free_internal(fw->mem);
> >> +       fw->mem = NULL;
> >> +}
> >> +
> >> +int ivpu_fw_init(struct ivpu_device *vdev)
> >> +{
> >> +       int ret;
> >> +
> >> +       ret = ivpu_fw_request(vdev);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ret = ivpu_fw_parse(vdev);
> >> +       if (ret)
> >> +               goto err_fw_release;
> >> +
> >> +       ret = ivpu_fw_mem_init(vdev);
> >> +       if (ret)
> >> +               goto err_fw_release;
> >> +
> >> +       return 0;
> >> +
> >> +err_fw_release:
> >> +       ivpu_fw_release(vdev);
> > Why do you release the firmware only on error ?
> > Why maintain the hold on the firmware file for as long as the device lives ?
> > Can't you release the file once you loaded the firmware to the device's memory ?
>
> Yes, we keep the fw image in memory for the following reasons:
> 1. It reduces the time of reset, recovery and resume without warmboot, where we need to overwite the fw.
> 2. It prevents user space from changing the fw binary while the module is loaded.
>    If a new version of the fw was installed it will be used on the next insmod which prevents hard to detect bugs.
>
> Regards,
> Jacek
ok, sounds fair enough.
So you can add my r-b to this patch as well.
Oded
