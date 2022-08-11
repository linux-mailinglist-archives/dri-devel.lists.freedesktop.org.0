Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DD58FDEA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 15:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C872B1552;
	Thu, 11 Aug 2022 13:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B4CB1860;
 Thu, 11 Aug 2022 13:57:32 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w196so16379969oiw.10;
 Thu, 11 Aug 2022 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=SENfi4ClghPkv/IgNYpMRiKSCIkvv9XY9MnP/ErgBM0=;
 b=dAsuJ/z4/0ZhhM337XCfCEEoLcMInhLu/vY3OWgpqFf33WlUmVzbderCIEJ8ScUq3E
 PDDf/9Ako6f/P5jlFRTypA4ENs5iv4Ype/oRxrRdV8fpb2plyV4dmJVpHaS3fZGsswxZ
 molmsR6A2LyPSkisnuthpsv9EAbPHKdipHaVJz5JoSCnaqPjsQeriUl0F7+LD+icQfq2
 iYSVBhILmXOJKDVHICba68JLFWMYJZ3vkeOnjhDoBUlwhyBKhqtyErORKvD/Wc9gQv9g
 i1nnHG+FWfaGNwWcnRwkdVq7wBuxc2LwfRiG8CDvmT+dhrjb2/7qt+KIp0YS7XDAmdtg
 9pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SENfi4ClghPkv/IgNYpMRiKSCIkvv9XY9MnP/ErgBM0=;
 b=zXxNxPbMwa8yunOwBfrqw6Je+eUJMvdljgicxZpirES82OgE99lAb37RLkRPVhLb/L
 xkyNMcuWPp4feFi9I9s1Rn5a80euAeiEfR4Gu0UoHpwWSuPT7w4TGd10PieoxU7uViRr
 fdaTpbmAjIT+vBU+AZggIUCwRVmO6dhspXHTtsZX8I77B4Aqg8MCQb2bqD8w+cYeE2nk
 YFFIgn91UizwrjBZTpb4Sj518zASXjCDOWLgAdd7S3TWRHombHRMIUTedFLWsmPDUWm4
 hv6VptOSObAAGYpcdh6zMpc+gwHhlX9wcSPPXls1flHR0dISeTtkh0lxXezp7Zj2Hjm/
 UHCg==
X-Gm-Message-State: ACgBeo34NIH6hMcbCue1L+dQHnTq/pIzJdzDSGe6TsaNjI0b09RXUpUS
 P3EpoUIDlfYZFTp3jl/hBushTOk8NmMXsAON4tok7m6RXK8=
X-Google-Smtp-Source: AA6agR5oapALHJQw9KyeGIPDKdXGywvkKFKvr7nJ9IUSEUw+Dd06QmJiHOJdoSN15zLhVLzCdnJL8fatI2Ez8l9YKpY=
X-Received: by 2002:a05:6808:19a3:b0:33e:1525:3fb4 with SMTP id
 bj35-20020a05680819a300b0033e15253fb4mr3557013oib.106.1660226252086; Thu, 11
 Aug 2022 06:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220811072012.962460-1-lizhenneng@kylinos.cn>
In-Reply-To: <20220811072012.962460-1-lizhenneng@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Aug 2022 09:57:20 -0400
Message-ID: <CADnq5_PDGGK553wdS+Cxr=r4Rbsup6+dbMnD79UBQ9qo6f=7kg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use native mode for dp aux transfer
To: Zhenneng Li <lizhenneng@kylinos.cn>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 7:32 AM Zhenneng Li <lizhenneng@kylinos.cn> wrote:
>
> When using amdgpu for e8860, the monitor sometimes haven't any signal,
> and the kernel reports some errors:
> [   17.317302][ 2] [ T1045] [drm:amdgpu_atombios_dp_link_train [amdgpu]] *ERROR* channel eq failed: 5 tries
> [   17.326963][ 2] [ T1045] [drm:amdgpu_atombios_dp_link_train [amdgpu]] *ERROR* channel eq failed
> But if I use radeon for e8860, everything are always normal, the reason is
> that radeon use native mode and amdgpu use atombios mode
> when init dp aux, so when I use native mode for amdgpu, everything
> are always normal.
>
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> Change-Id: Ia9a2be3ab03e56b1c8337fdbf713461196fbc58f
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile          |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h          |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c | 273 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      |   4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h     |   2 +
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c     |   5 +-
>  7 files changed, 290 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 3e0e2eb7e235..2913cf46f848 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -58,7 +58,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
>         amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
>         amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>         amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> -       amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o
> +       amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o amdgpu_dp_auxch.o
>
>  amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 30ce6bb6fa77..15e0288b1997 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -238,6 +238,8 @@ extern int amdgpu_num_kcq;
>  #define AMDGPU_VCNFW_LOG_SIZE (32 * 1024)
>  extern int amdgpu_vcnfw_log;
>
> +extern int amdgpu_auxch;
> +
>  #define AMDGPU_VM_MAX_NUM_CTX                  4096
>  #define AMDGPU_SG_THRESHOLD                    (256*1024*1024)
>  #define AMDGPU_DEFAULT_GTT_SIZE_MB             3072ULL /* 3GB by default */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> index 9ba4817a9148..68c8d79e2937 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> @@ -49,7 +49,10 @@ static struct amdgpu_i2c_bus_rec amdgpu_atombios_get_bus_rec_for_i2c_gpio(ATOM_G
>
>         memset(&i2c, 0, sizeof(struct amdgpu_i2c_bus_rec));
>
> -       i2c.mask_clk_reg = le16_to_cpu(gpio->usClkMaskRegisterIndex);
> +       if (amdgpu_auxch)
> +               i2c.mask_clk_reg = le16_to_cpu(gpio->usClkMaskRegisterIndex) * 4;
> +       else
> +               i2c.mask_clk_reg = le16_to_cpu(gpio->usClkMaskRegisterIndex);

You can drop this change if you convert your aux code to use dword
aligned register addresses.

>         i2c.mask_data_reg = le16_to_cpu(gpio->usDataMaskRegisterIndex);
>         i2c.en_clk_reg = le16_to_cpu(gpio->usClkEnRegisterIndex);
>         i2c.en_data_reg = le16_to_cpu(gpio->usDataEnRegisterIndex);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c
> new file mode 100644
> index 000000000000..22078f1ca936
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c
> @@ -0,0 +1,273 @@
> +/*
> + * Copyright 2015 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Dave Airlie
> + */
> +
> +#include "amdgpu.h"
> +
> +#define        AUX_SW_RX_OVERFLOW                      (1 << 8)
> +#define        AUX_SW_RX_HPD_DISCON                    (1 << 9)
> +#define        AUX_SW_RX_PARTIAL_BYTE                  (1 << 10)
> +#define        AUX_SW_NON_AUX_MODE                     (1 << 11)
> +#define        AUX_SW_RX_SYNC_INVALID_L                (1 << 17)
> +#define        AUX_SW_RX_SYNC_INVALID_H                (1 << 18)
> +#define        AUX_SW_RX_INVALID_START                 (1 << 19)
> +#define        AUX_SW_RX_RECV_NO_DET                   (1 << 20)
> +#define        AUX_SW_RX_RECV_INVALID_H                (1 << 22)
> +#define        AUX_SW_RX_RECV_INVALID_V                (1 << 23)
> +#define                AUX_CONTROL                             0x6200
> +#define        AUX_HPD_SEL(x)                          (((x) & 0x7) << 20)
> +#define        AUX_EN                                  (1 << 0)
> +#define        AUX_LS_READ_EN                          (1 << 8)
> +#define                AUX_SW_CONTROL                          0x6204
> +#define        AUX_SW_WR_BYTES(x)                      (((x) & 0x1f) << 16)
> +#define AUX_SW_DATA                                    0x6218
> +#define AUX_SW_DATA_RW                                 (1 << 0)
> +#define AUX_SW_AUTOINCREMENT_DISABLE                   (1 << 31)
> +#define AUX_SW_INTERRUPT_CONTROL                       0x620c
> +#define        AUX_SW_DONE_ACK                         (1 << 1)
> +#define        AUX_SW_GO                               (1 << 0)
> +#define AUX_SW_STATUS                                  0x6210
> +#define        AUX_SW_DONE                             (1 << 0)
> +#define        AUX_SW_RX_TIMEOUT                       (1 << 7)
> +#define AUX_SW_DATA_RW                                 (1 << 0)
> +#define AUX_SW_DATA_MASK(x)                            (((x) & 0xff) << 8)
> +
> +#define AUX_RX_ERROR_FLAGS (AUX_SW_RX_OVERFLOW |            \
> +                           AUX_SW_RX_HPD_DISCON |           \
> +                           AUX_SW_RX_PARTIAL_BYTE |         \
> +                           AUX_SW_NON_AUX_MODE |            \
> +                           AUX_SW_RX_SYNC_INVALID_L |       \
> +                           AUX_SW_RX_SYNC_INVALID_H |       \
> +                           AUX_SW_RX_INVALID_START |        \
> +                           AUX_SW_RX_RECV_NO_DET |          \
> +                           AUX_SW_RX_RECV_INVALID_H |       \
> +                           AUX_SW_RX_RECV_INVALID_V)
> +
> +#define AUX_SW_REPLY_GET_BYTE_COUNT(x) (((x) >> 24) & 0x1f)
> +
> +#define BARE_ADDRESS_SIZE 3

Use the defines in dce_6_0_d.h and dce_6_0_sh_mask.h instead.

> +
> +#define R100_MM_INDEX                   0x0000
> +#define R100_MM_DATA                      0x0004
> +#define AMDGPU_MIN_MMIO_SIZE 0x10000
> +uint32_t venus_mm_rreg_slow(struct amdgpu_device *adev, uint32_t reg)
> +{
> +        unsigned long flags;
> +        uint32_t ret;
> +
> +        spin_lock_irqsave(&adev->mmio_idx_lock, flags);
> +        writel(reg, ((void __iomem *)adev->rmmio) + R100_MM_INDEX);
> +        ret = readl(((void __iomem *)adev->rmmio) + R100_MM_DATA);
> +        spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
> +        return ret;
> +}
> +void venus_mm_wreg_slow(struct amdgpu_device *adev, uint32_t reg, uint32_t v)
> +{
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&adev->mmio_idx_lock, flags);
> +        writel(reg, ((void __iomem *)adev->rmmio) + R100_MM_INDEX);
> +        writel(v, ((void __iomem *)adev->rmmio) + R100_MM_DATA);
> +        spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
> +}
> +static inline uint32_t venus_mm_rreg(struct amdgpu_device *adev, uint32_t reg,
> +                                    bool always_indirect)
> +{
> +        /* The mmio size is 64kb at minimum. Allows the if to be optimized out. */
> +        if ((reg < adev->rmmio_size || reg < AMDGPU_MIN_MMIO_SIZE) && !always_indirect)
> +                return readl(((void __iomem *)adev->rmmio) + reg);
> +        else
> +                return venus_mm_rreg_slow(adev, reg);
> +}
> +static inline void venus_mm_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v,
> +                                bool always_indirect)
> +{
> +        if ((reg < adev->rmmio_size || reg < AMDGPU_MIN_MMIO_SIZE) && !always_indirect)
> +                writel(v, ((void __iomem *)adev->rmmio) + reg);
> +        else
> +                venus_mm_wreg_slow(adev, reg, v);
> +}
> +
> +#define RREG32_VENUS(reg) venus_mm_rreg(adev, (reg), false)
> +#define WREG32_VENUS(reg, v) venus_mm_wreg(adev, (reg), (v), false)
> +

drop all of these functions above and just use the existing amdgpu
WREG32/RREG32 macros.

> +static const u32 aux_offset[] =
> +{
> +       0x6200 - 0x6200,
> +       0x6250 - 0x6200,
> +       0x62a0 - 0x6200,
> +       0x6300 - 0x6200,
> +       0x6350 - 0x6200,
> +       0x63a0 - 0x6200,
> +};
> +

convert these to use the macros in dce_6_0_d.h,  E.g.,
mmDP_AUX0_AUX_CONTROL - mmDP_AUX0_AUX_CONTROL,
mmDP_AUX1_AUX_CONTROL - mmDP_AUX0_AUX_CONTROL,
etc.

> +ssize_t
> +amdgpu_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
> +{
> +       struct amdgpu_i2c_chan *chan =
> +               container_of(aux, struct amdgpu_i2c_chan, aux);
> +       struct drm_device *dev = chan->dev;
> +       struct amdgpu_device *adev = dev->dev_private;
> +       int ret = 0, i;
> +       uint32_t tmp, ack = 0;
> +       int instance = chan->rec.i2c_id & 0xf;
> +       u8 byte;
> +       u8 *buf = msg->buffer;
> +       int retry_count = 0;
> +       int bytes;
> +       int msize;
> +       bool is_write = false;
> +
> +       if (WARN_ON(msg->size > 16))
> +               return -E2BIG;
> +
> +       switch (msg->request & ~DP_AUX_I2C_MOT) {
> +       case DP_AUX_NATIVE_WRITE:
> +       case DP_AUX_I2C_WRITE:
> +               is_write = true;
> +               break;
> +       case DP_AUX_NATIVE_READ:
> +       case DP_AUX_I2C_READ:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       /* work out two sizes required */
> +       msize = 0;
> +       bytes = BARE_ADDRESS_SIZE;
> +       if (msg->size) {
> +               msize = msg->size - 1;
> +               bytes++;
> +               if (is_write)
> +                       bytes += msg->size;
> +       }
> +
> +       mutex_lock(&chan->mutex);
> +
> +       /* switch the pad to aux mode */
> +       tmp = RREG32_VENUS(chan->rec.mask_clk_reg);
> +       tmp |= (1 << 16);
> +       WREG32_VENUS(chan->rec.mask_clk_reg, tmp);
> +
> +       /* setup AUX control register with correct HPD pin */
> +       tmp = RREG32_VENUS(AUX_CONTROL + aux_offset[instance]);
> +       tmp &= AUX_HPD_SEL(0x7);
> +       tmp |= AUX_HPD_SEL(chan->rec.hpd);
> +       tmp |= AUX_EN | AUX_LS_READ_EN;
> +
> +       WREG32_VENUS(AUX_CONTROL + aux_offset[instance], tmp);
> +
> +       /* atombios appears to write this twice lets copy it */
> +       WREG32_VENUS(AUX_SW_CONTROL + aux_offset[instance],
> +              AUX_SW_WR_BYTES(bytes));
> +       WREG32_VENUS(AUX_SW_CONTROL + aux_offset[instance],
> +              AUX_SW_WR_BYTES(bytes));
> +
> +       /* write the data header into the registers */
> +       /* request, address, msg size */
> +       byte = (msg->request << 4) | ((msg->address >> 16) & 0xf);
> +       WREG32_VENUS(AUX_SW_DATA + aux_offset[instance],
> +              AUX_SW_DATA_MASK(byte) | AUX_SW_AUTOINCREMENT_DISABLE);
> +
> +       byte = (msg->address >> 8) & 0xff;
> +       WREG32_VENUS(AUX_SW_DATA + aux_offset[instance],
> +              AUX_SW_DATA_MASK(byte));
> +
> +       byte = msg->address & 0xff;
> +       WREG32_VENUS(AUX_SW_DATA + aux_offset[instance],
> +              AUX_SW_DATA_MASK(byte));
> +
> +       byte = msize;
> +       WREG32_VENUS(AUX_SW_DATA + aux_offset[instance],
> +              AUX_SW_DATA_MASK(byte));
> +
> +       /* if we are writing - write the msg buffer */
> +       if (is_write) {
> +               for (i = 0; i < msg->size; i++) {
> +                       WREG32_VENUS(AUX_SW_DATA + aux_offset[instance],
> +                              AUX_SW_DATA_MASK(buf[i]));
> +               }
> +       }
> +
> +       /* clear the ACK */
> +       WREG32_VENUS(AUX_SW_INTERRUPT_CONTROL + aux_offset[instance], AUX_SW_DONE_ACK);
> +
> +       /* write the size and GO bits */
> +       WREG32_VENUS(AUX_SW_CONTROL + aux_offset[instance],
> +              AUX_SW_WR_BYTES(bytes) | AUX_SW_GO);
> +
> +       /* poll the status registers - TODO irq support */
> +       do {
> +               tmp = RREG32_VENUS(AUX_SW_STATUS + aux_offset[instance]);
> +               if (tmp & AUX_SW_DONE) {
> +                       break;
> +               }
> +               usleep_range(100, 200);
> +       } while (retry_count++ < 1000);
> +
> +       if (retry_count >= 1000) {
> +               DRM_ERROR("auxch hw never signalled completion, error %08x\n", tmp);
> +               ret = -EIO;
> +               goto done;
> +       }
> +
> +       if (tmp & AUX_SW_RX_TIMEOUT) {
> +               ret = -ETIMEDOUT;
> +               goto done;
> +       }
> +       if (tmp & AUX_RX_ERROR_FLAGS) {
> +               DRM_DEBUG_KMS_RATELIMITED("dp_aux_ch flags not zero: %08x\n",
> +                                         tmp);
> +               ret = -EIO;
> +               goto done;
> +       }
> +
> +       bytes = AUX_SW_REPLY_GET_BYTE_COUNT(tmp);
> +       if (bytes) {
> +               WREG32_VENUS(AUX_SW_DATA + aux_offset[instance],
> +                      AUX_SW_DATA_RW | AUX_SW_AUTOINCREMENT_DISABLE);
> +
> +               tmp = RREG32_VENUS(AUX_SW_DATA + aux_offset[instance]);
> +               ack = (tmp >> 8) & 0xff;
> +
> +               for (i = 0; i < bytes - 1; i++) {
> +                       tmp = RREG32_VENUS(AUX_SW_DATA + aux_offset[instance]);
> +                       if (buf)
> +                               buf[i] = (tmp >> 8) & 0xff;
> +               }
> +               if (buf)
> +                       ret = bytes - 1;
> +       }
> +
> +       WREG32_VENUS(AUX_SW_INTERRUPT_CONTROL + aux_offset[instance], AUX_SW_DONE_ACK);
> +
> +       if (is_write)
> +               ret = msg->size;
> +done:
> +       mutex_unlock(&chan->mutex);
> +
> +       if (ret >= 0)
> +               msg->reply = ack >> 4;
> +       return ret;
> +}


This can all move to dce_v6_0.c since it is specific to DCE6.

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 8890300766a5..2ac7636ddafb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -180,6 +180,7 @@ int amdgpu_num_kcq = -1;
>  int amdgpu_smartshift_bias;
>  int amdgpu_use_xgmi_p2p = 1;
>  int amdgpu_vcnfw_log;
> +int amdgpu_auxch = 0;
>
>  static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
>
> @@ -882,6 +883,9 @@ MODULE_PARM_DESC(smu_pptable_id,
>         "specify pptable id to be used (-1 = auto(default) value, 0 = use pptable from vbios, > 0 = soft pptable id)");
>  module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
>
> +MODULE_PARM_DESC(auxch, "Use native auxch experimental support (1 = enable, 0 = disable, -1 = auto)");
> +module_param_named(auxch, amdgpu_auxch, int, 0444);
> +
>  /* These devices are not supported by amdgpu.
>   * They are supported by the mach64, r128, radeon drivers
>   */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index f80b4838cea1..95fffc110c75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -619,5 +619,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
>                                 uint32_t page_flip_flags, uint32_t target,
>                                 struct drm_modeset_acquire_ctx *ctx);
>  extern const struct drm_mode_config_funcs amdgpu_mode_funcs;
> +extern ssize_t
> +amdgpu_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg);
>
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index 87c41e0e9b7c..846ecc315665 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -188,7 +188,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
>  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
>  {
>         amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
> -       amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> +       if (amdgpu_auxch)
> +               amdgpu_connector->ddc_bus->aux.transfer = amdgpu_dp_aux_transfer_native;
> +       else
> +               amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;

To make the abstraction cleaner, I would add a callback to the dce
code and then use that to determine which method to use.  E.g.,
something like:

if (amdgpu_auxch && adev->mode_info.aux_transfer_native)
    amdgpu_connector->ddc_bus->aux.transfer =
adev->mode_info.aux_transfer_native;
else
    amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;

>         amdgpu_connector->ddc_bus->aux.drm_dev = amdgpu_connector->base.dev;
>
>         drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
