Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F86FC311
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 11:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3006310E37D;
	Tue,  9 May 2023 09:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A77A10E37B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683625796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXL6tQCV5PqjMxKWGcexLqu1hPK1nc9dces42fjUmXc=;
 b=QVLP9NvxPUYe4WKXaP+mTNXlnCOdBTE6QTizWG0UBy5nAmCzLMwBXrME/mOC9p6wErDg1u
 KpkUKGb9bSpfBfCBekDrDgXyN0L7V/olZm8fUvjgp/O4v+XRxP0EoDATzOHx1QLju0vV9d
 4roJDK7mPtwXwEJvDCQShepklEC1C3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-7VIYpqXPPiKgRB39s37FBQ-1; Tue, 09 May 2023 05:49:55 -0400
X-MC-Unique: 7VIYpqXPPiKgRB39s37FBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so132717705e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 02:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683625794; x=1686217794;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QXL6tQCV5PqjMxKWGcexLqu1hPK1nc9dces42fjUmXc=;
 b=Q2sX0IAvl+0QJsMP0QjkxARiys2teLFr2lpsJXWTlde2msS9OWMgThtqf6jPH9mq8z
 +jnyzLJNcfUKpAeGl2TGmxvnxANHwBRCtHj9FI9ukoEpNv1ewIXoCgz8E03KRUhWoZFg
 evQYLZx0rgBSyWTQE3k64rHtZzaQixjvSYHS9WP4XvP6qG+WNGkq4RP99bdVgjly1Wj3
 lmwNdm2nEyDh6c+BbCQOEyt8+tGv1qCuiVpPNFokydxtF/z9TQosbTGsCt8QuoKcgZnf
 SXqVnWfVJjHfzTaD3OIm5BZZINJHYcdEhFRNqPLH6yigbTp6lcyyZc09jbDNoub6d2Ks
 YV1w==
X-Gm-Message-State: AC+VfDyuWo63C7+dkLz2rajqoMqBZw8Z79wy9vvjo0XBd17D3HETih61
 jotRL6HzCwqA0gemAPjPLhP/78YnekQ951/1UyZ9uRNuySeOTpISZcr6LtioC5dRxoFiK5MCs+K
 wlcao76zIwFMTEYKMlcqUbJYWs1E4yIew3zMf
X-Received: by 2002:a05:600c:540b:b0:3f1:6fb4:5645 with SMTP id
 he11-20020a05600c540b00b003f16fb45645mr10132725wmb.1.1683625794198; 
 Tue, 09 May 2023 02:49:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7r+1e1OwMkBINm2/t5azp714ZdAqFrvRcuaUH8gKW4GoPmkt4kCcGWOQuYiHwVfyauMoeuZQ==
X-Received: by 2002:a05:600c:540b:b0:3f1:6fb4:5645 with SMTP id
 he11-20020a05600c540b00b003f16fb45645mr10132706wmb.1.1683625793738; 
 Tue, 09 May 2023 02:49:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003f42314832fsm7381411wml.18.2023.05.09.02.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 02:49:53 -0700 (PDT)
Message-ID: <35dd9e6f-19b8-36cc-eeae-36399a2498f1@redhat.com>
Date: Tue, 9 May 2023 11:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the
 VRAM
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230505124337.854845-1-jfalempe@redhat.com>
 <20230505124337.854845-5-jfalempe@redhat.com>
 <380dd99b-00cd-fc75-94af-ae5074882006@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <380dd99b-00cd-fc75-94af-ae5074882006@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 10:04, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> Am 05.05.23 um 14:43 schrieb Jocelyn Falempe:
>> Even if the transfer is not faster, it brings significant
>> improvement in latencies and CPU usage.
>>
> 
> I think I shot down this patch already. I don't want to maintain the 
> extra code for DMA support.

Yes, thank you for still taking a look at it !
I will also be there to fix regressions, if any.
> 
> 
>> CPU usage drops from 100% of one core to 3% when continuously
>> refreshing the screen.
> 
> But this result is nice, so mabe I'd reconsider. Let's take this patch 
> as an RFC to discuss possible ways forward.
> 
> There seems to be some fallback still in place in this patch. I 
> definately don't want multiple codepaths for copying; so the DMA code 
> needs to work on all our hardware.

As it is new code, and I can't test on every hardware, I let a fallback 
in case it breaks on some configuration. But I agree, it can be DMA 
only, as all G200 should work with this code.

> 
>>
>> The primary DMA is used to send commands (register write), and
>> the secondary DMA to send the pixel data.
>> It uses the ILOAD command (chapter 4.5.7 in G200 specification),
>> which allows to load an image, or a part of an image from system
>> memory to VRAM.
>> The last command sent, is a softrap command, which triggers an IRQ
>> when the DMA transfer is complete.
>> For 16bits and 24bits pixel width, each line is padded to make sure,
>> the DMA transfer is a multiple of 32bits. The padded bytes won't be
>> drawn on the screen, so they don't need to be initialized.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/Makefile       |   3 +-
>>   drivers/gpu/drm/mgag200/mgag200_dma.c  | 114 +++++++++++++++++++++
>>   drivers/gpu/drm/mgag200/mgag200_drv.c  |   2 +
>>   drivers/gpu/drm/mgag200/mgag200_drv.h  |  25 +++++
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 131 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/mgag200/mgag200_reg.h  |  25 +++++
>>   6 files changed, 295 insertions(+), 5 deletions(-)
>>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_dma.c
>>
>> diff --git a/drivers/gpu/drm/mgag200/Makefile 
>> b/drivers/gpu/drm/mgag200/Makefile
>> index 182e224c460d..96e23dc5572c 100644
>> --- a/drivers/gpu/drm/mgag200/Makefile
>> +++ b/drivers/gpu/drm/mgag200/Makefile
>> @@ -11,6 +11,7 @@ mgag200-y := \
>>       mgag200_g200se.o \
>>       mgag200_g200wb.o \
>>       mgag200_i2c.o \
>> -    mgag200_mode.o
>> +    mgag200_mode.o \
>> +    mgag200_dma.o
>>   obj-$(CONFIG_DRM_MGAG200) += mgag200.o
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_dma.c 
>> b/drivers/gpu/drm/mgag200/mgag200_dma.c
>> new file mode 100644
>> index 000000000000..fe063fa2b5f1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mgag200/mgag200_dma.c
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright 2023 Red Hat
>> + *
>> + * Authors: Jocelyn Falempe
>> + *
>> + */
>> +
>> +#include <linux/wait.h>
>> +#include <linux/dma-mapping.h>
>> +
>> +#include "mgag200_drv.h"
>> +#include "mgag200_reg.h"
>> +
>> +/* Maximum number of command block for one DMA transfert
>> + * iload should only use 4 blocks
>> + */
>> +#define MGA_MAX_CMD        50
>> +
>> +#define MGA_DMA_SIZE        (4 * 1024 * 1024)
>> +#define MGA_MIN_DMA_SIZE    (64 * 1024)
>> +
>> +/*
>> + * Allocate coherent buffers for DMA transfert.
>> + * We need two buffers, one for the commands, and one for the data.
>> + * If allocation fails, mdev->dma_buf will be NULL, and the driver will
>> + * fallback to memcpy().
>> + */
>> +void mgag200_dma_allocate(struct mga_device *mdev)
>> +{
>> +    struct drm_device *dev = &mdev->base;
>> +    int size;
>> +    /* Allocate the command buffer */
>> +    mdev->cmd = dmam_alloc_coherent(dev->dev, MGA_MAX_CMD * 
>> sizeof(*mdev->cmd),
>> +                    &mdev->cmd_handle, GFP_KERNEL);
>> +
>> +    if (!mdev->cmd) {
>> +        drm_warn(dev, "DMA command buffer allocation failed, fallback 
>> to cpu copy\n");
>> +        return;
>> +    }
>> +
>> +    for (size = MGA_DMA_SIZE; size >= MGA_MIN_DMA_SIZE; size = size 
>> >> 1) {
>> +        mdev->dma_buf = dmam_alloc_coherent(dev->dev, size, 
>> &mdev->dma_handle, GFP_KERNEL);
>> +        if (mdev->dma_buf)
>> +            break;
>> +    }
>> +    if (!mdev->dma_buf) {
>> +        drm_warn(dev, "DMA data buffer allocation failed, fallback to 
>> cpu copy\n");
>> +        return;
>> +    }
>> +    mdev->dma_size = size;
>> +    drm_info(dev, "Using DMA with a %dk data buffer\n", size / 1024);
>> +}
>> +
>> +/*
>> + * Matrox uses commands block to program the hardware through DMA.
>> + * Each command is a register write, and each block contains 4 commands
>> + * packed in 5 words(u32).
>> + * First word is the 4 register index (8bit) to write for the 4 
>> commands,
>> + * followed by the four values to be written.
>> + */
>> +void mgag200_dma_add_block(struct mga_device *mdev,
>> +               u32 reg0, u32 val0,
>> +               u32 reg1, u32 val1,
>> +               u32 reg2, u32 val2,
>> +               u32 reg3, u32 val3)
>> +{
>> +    if (mdev->cmd_idx >= MGA_MAX_CMD) {
>> +        pr_err("mgag200: exceeding the DMA command buffer size\n");
>> +        return;
>> +    }
>> +
>> +    mdev->cmd[mdev->cmd_idx] = (struct mga_cmd_block) {
>> +        .cmd = DMAREG(reg0) | DMAREG(reg1) << 8 | DMAREG(reg2) << 16 
>> | DMAREG(reg3) << 24,
>> +        .v0 = val0,
>> +        .v1 = val1,
>> +        .v2 = val2,
>> +        .v3 = val3};
>> +    mdev->cmd_idx++;
>> +}
>> +
>> +void mgag200_dma_run_cmd(struct mga_device *mdev)
>> +{
>> +    struct drm_device *dev = &mdev->base;
>> +    u32 primend;
>> +    int ret;
>> +
>> +    /* Add a last block to trigger the softrap interrupt */
>> +    mgag200_dma_add_block(mdev,
>> +            MGAREG_DMAPAD, 0,
>> +            MGAREG_DMAPAD, 0,
>> +            MGAREG_DMAPAD, 0,
>> +            MGAREG_SOFTRAP, 0);
>> +
>> +    primend = mdev->cmd_handle + mdev->cmd_idx * sizeof(struct 
>> mga_cmd_block);
>> +
>> +    // Use primary DMA to send the commands
>> +    WREG32(MGAREG_PRIMADDR, (u32) mdev->cmd_handle);
>> +    WREG32(MGAREG_PRIMEND, primend);
>> +    mdev->dma_in_use = 1;
>> +
>> +    ret = wait_event_timeout(mdev->waitq, mdev->dma_in_use == 0, HZ);
>> +
>> +    if (mdev->dma_in_use) {
>> +        drm_err(dev, "DMA transfert timed out\n");
>> +        /* something goes wrong, reset the DMA engine */
>> +        WREG8(MGAREG_OPMODE, MGAOPM_DMA_BLIT);
>> +        mdev->dma_in_use = 0;
>> +    }
>> +
>> +    /* reset command index to start a new sequence */
>> +    mdev->cmd_idx = 0;
>> +}
> 
> Can the DMA code be build around Linux' struct drm_device?

I just took a look at which field of the struct drm_device I can use 
there. "struct drm_device_dma * dma" is defined in drm_legacy.h, does 
that mean I shouldn't use it for a new work ?

> 
>> +
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index 3566fcdfe1e4..c863487526e7 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -184,6 +184,8 @@ int mgag200_device_preinit(struct mga_device *mdev)
>>       if (!mdev->vram)
>>           return -ENOMEM;
>> +    mgag200_dma_allocate(mdev);
>> +
>>       mgag200_init_irq(mdev);
>>       ret = devm_request_irq(dev->dev, pdev->irq, 
>> mgag200_driver_irq_handler,
>>                      IRQF_SHARED, "mgag200_irq", mdev);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> index 02175bfaf5a8..f5060fdc16f9 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -277,6 +277,14 @@ struct mgag200_device_funcs {
>>       void (*pixpllc_atomic_update)(struct drm_crtc *crtc, struct 
>> drm_atomic_state *old_state);
>>   };
>> +struct mga_cmd_block {
>> +    u32 cmd;
>> +    u32 v0;
>> +    u32 v1;
>> +    u32 v2;
>> +    u32 v3;
>> +} __packed;
>> +
>>   struct mga_device {
>>       struct drm_device base;
>> @@ -291,6 +299,14 @@ struct mga_device {
>>       void __iomem            *vram;
>>       resource_size_t            vram_available;
>> +    void *dma_buf;
>> +    size_t dma_size;
>> +    dma_addr_t dma_handle;
>> +
>> +    struct mga_cmd_block *cmd;
>> +    int cmd_idx;
>> +    dma_addr_t cmd_handle;
>> +
>>       wait_queue_head_t waitq;
>>       int dma_in_use;
>> @@ -446,4 +462,13 @@ void mgag200_bmc_enable_vidrst(struct mga_device 
>> *mdev);
>>                   /* mgag200_i2c.c */
>>   int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan 
>> *i2c);
>> +/* mgag200_dma.c */
>> +void mgag200_dma_allocate(struct mga_device *mdev);
>> +void mgag200_dma_add_block(struct mga_device *mdev,
>> +               u32 reg0, u32 val0,
>> +               u32 reg1, u32 val1,
>> +               u32 reg2, u32 val2,
>> +               u32 reg3, u32 val3);
>> +void mgag200_dma_run_cmd(struct mga_device *mdev);
>> +
>>   #endif                /* __MGAG200_DRV_H__ */
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index 7d8c65372ac4..7825ec4323d2 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -398,13 +398,132 @@ static void mgag200_disable_display(struct 
>> mga_device *mdev)
>>       WREG_ECRT(0x01, crtcext1);
>>   }
>> +static void mgag200_dwg_setup(struct mga_device *mdev, struct 
>> drm_framebuffer *fb)
>> +{
>> +    u32 maccess;
>> +
>> +    drm_dbg(&mdev->base, "Setup DWG with %dx%d %p4cc\n",
>> +        fb->width, fb->height, &fb->format->format);
>> +
>> +    switch (fb->format->format) {
>> +    case DRM_FORMAT_RGB565:
>> +        maccess = MGAMAC_PW16;
>> +        break;
>> +    case DRM_FORMAT_RGB888:
>> +        maccess = MGAMAC_PW24;
>> +        break;
>> +    case DRM_FORMAT_XRGB8888:
>> +        maccess = MGAMAC_PW32;
>> +        break;
>> +    }
>> +    WREG32(MGAREG_MACCESS, maccess);
>> +
>> +    /* Framebuffer width in pixel */
>> +    WREG32(MGAREG_PITCH, fb->width);
>> +
>> +    /* Sane default value for the drawing engine registers */
>> +    WREG32(MGAREG_DSTORG, 0);
>> +    WREG32(MGAREG_YDSTORG, 0);
>> +    WREG32(MGAREG_SRCORG, 0);
>> +    WREG32(MGAREG_CXBNDRY, 0x0FFF0000);
>> +    WREG32(MGAREG_YTOP, 0);
>> +    WREG32(MGAREG_YBOT, 0x00FFFFFF);
>> +
>> +    /* Activate blit mode DMA, only write the low part of the 
>> register */
>> +    WREG8(MGAREG_OPMODE, MGAOPM_DMA_BLIT);
>> +}
>> +
>> +/*
>> + * ILOAD allows to load an image from system memory to the VRAM, and 
>> with FXBNDRY, YDST and YDSTLEN,
>> + * you can transfert a rectangle, so it's perfect when used with a 
>> damage clip.
>> + */
>> +static void mgag200_iload_cmd(struct mga_device *mdev, int x, int y, 
>> int width, int height,
>> +                  int width_padded, int cpp)
>> +{
>> +    int size = width_padded * height;
>> +    u32 iload;
>> +
>> +    iload = MGADWG_ILOAD | MGADWG_SGNZERO | MGADWG_SHIFTZERO | 
>> MGADWG_REPLACE | MGADWG_CLIPDIS
>> +        | MGADWG_BFCOL;
>> +
>> +    mgag200_dma_add_block(mdev,
>> +        MGAREG_DWGCTL, iload,
>> +        MGAREG_FXBNDRY, (((x + width - 1) << 16) | x),
>> +        MGAREG_AR0, (width_padded / cpp) - 1,
>> +        MGAREG_AR3, 0);
>> +
>> +    mgag200_dma_add_block(mdev,
>> +        MGAREG_AR5, 0,
>> +        MGAREG_YDST, y,
>> +        MGAREG_DMAPAD, 0,
>> +        MGAREG_DMAPAD, 0);
>> +
>> +    mgag200_dma_add_block(mdev,
>> +        MGAREG_DMAPAD, 0,
>> +        MGAREG_LEN | MGAREG_EXEC, height,
>> +        MGAREG_SECADDR, mdev->dma_handle | 1,
>> +        /* Writing SECEND should always be the last command of a 
>> block */
>> +        MGAREG_SECEND, mdev->dma_handle + size);
>> +}
>> +
>> +static void mgag200_dma_copy(struct mga_device *mdev, const void 
>> *src, u32 pitch,
>> +                struct drm_rect *clip, int cpp)
>> +{
>> +    int i;
>> +    int width = drm_rect_width(clip);
>> +    int height = drm_rect_height(clip);
>> +
>> +    /* pad each line to 32bits boundaries see section 4.5.7 of G200 
>> Specification */
>> +    int width_padded = round_up(width * cpp, 4);
>> +
>> +    for (i = 0; i < height; i++)
>> +        memcpy(mdev->dma_buf + width_padded * i,
>> +               src + (((clip->y1 + i) * pitch) + clip->x1 * cpp),
>> +               width * cpp);
> 
> This memcpy() should probably go away.  Instead of SHMEM, mgag200 should 
> allocate with GEM DMA helpers. We have a number of drivers that use DMA 
> helpers with DRM format helpers, so the conversion should be 
> strait-forward and can be done independently from the other patches.

This is something I tried to do.
It will also make the driver a bit more complex, because when the damage 
rectangle is not the full screen, I will need to do one ILOAD per line, 
instead of one for the whole rectangle, but that's still manageable.
Do you know which driver I can take as an example ?

> 
> Afterward, it should be possible to DMA-copy directly from the GEM 
> buffer object.
> 
>> +
>> +    mgag200_iload_cmd(mdev, clip->x1, clip->y1, width, height, 
>> width_padded, cpp);
>> +    mgag200_dma_run_cmd(mdev);
>> +}
>> +
>> +/*
>> + * If the DMA coherent buffer is smaller than damage rectangle, we 
>> need to
>> + * split it into multiple DMA transfert.
>> + */
>> +static void mgag200_dma_damage(struct mga_device *mdev, const struct 
>> iosys_map *vmap,
>> +                   struct drm_framebuffer *fb, struct drm_rect *clip)
>> +{
>> +    u32 pitch = fb->pitches[0];
>> +    const void *src = vmap[0].vaddr;
>> +    struct drm_rect subclip;
>> +    int y1;
>> +    int lines;
>> +    int cpp = fb->format->cpp[0];
>> +
>> +    /* Number of lines that fits in one DMA buffer */
>> +    lines = min(drm_rect_height(clip), (int) mdev->dma_size / 
>> (drm_rect_width(clip) * cpp));
>> +
>> +    subclip.x1 = clip->x1;
>> +    subclip.x2 = clip->x2;
>> +
>> +    for (y1 = clip->y1; y1 < clip->y2; y1 += lines) {
>> +        subclip.y1 = y1;
>> +        subclip.y2 = min(clip->y2, y1 + lines);
>> +        mgag200_dma_copy(mdev, src, pitch, &subclip, cpp);
>> +    }
>> +}
>> +
>>   static void mgag200_handle_damage(struct mga_device *mdev, const 
>> struct iosys_map *vmap,
>>                     struct drm_framebuffer *fb, struct drm_rect *clip)
>>   {
>> -    struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
>> -
>> -    iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], 
>> fb->format, clip));
>> -    drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
>> +    if (mdev->dma_buf) {
>> +        /* Fast path, use DMA */
>> +        mgag200_dma_damage(mdev, vmap, fb, clip);
>> +    } else {
>> +        struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
>> +
>> +        iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], 
>> fb->format, clip));
>> +        drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
>> +    }
> 
> This branching needs to go. As I said, DMA is either the standard, or 
> not there at all. I doubt that the !mdev->dmabuf case can easily happen 
> in practice. AFAICT it's all in the 32-bit address range and we're on 
> systems with enough physical memory.

I put that in place because on my system, I can't allocate more than 4MB 
with dmam_alloc_coherent(). (And my framebuffer is 5MB, so my first 
attempt was unsuccessful).
I'm not sure what is the reasonable amount of dma memory that we are 
almost guarantee to allocate.

> 
> Best regards
> Thomas
> 
>>   }
>>   /*
>> @@ -475,6 +594,10 @@ void 
>> mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>       if (!fb)
>>           return;
>> +    if (!old_plane_state->fb || fb->format != 
>> old_plane_state->fb->format
>> +        || fb->width != old_plane_state->fb->width)
>> +        mgag200_dwg_setup(mdev, fb);
>> +
>>       drm_atomic_helper_damage_iter_init(&iter, old_plane_state, 
>> plane_state);
>>       drm_atomic_for_each_plane_damage(&iter, &damage) {
>>           mgag200_handle_damage(mdev, shadow_plane_state->data, fb, 
>> &damage);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h 
>> b/drivers/gpu/drm/mgag200/mgag200_reg.h
>> index 748c8e18e938..256ac92dae56 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_reg.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
>> @@ -116,6 +116,9 @@
>>   #define    MGAREG_OPMODE        0x1e54
>> +#define MGAREG_PRIMADDR        0x1e58
>> +#define MGAREG_PRIMEND        0x1e5c
>> +
>>   /* Warp Registers */
>>   #define MGAREG_WIADDR           0x1dc0
>>   #define MGAREG_WIADDR2          0x1dd8
>> @@ -200,6 +203,8 @@
>>   /* See table on 4-43 for bop ALU operations */
>> +#define MGADWG_REPLACE    (0xC << 16)
>> +
>>   /* See table on 4-44 for translucidity masks */
>>   #define MGADWG_BMONOLEF        ( 0x00 << 25 )
>> @@ -218,6 +223,8 @@
>>   #define MGADWG_PATTERN        ( 0x01 << 29 )
>>   #define MGADWG_TRANSC        ( 0x01 << 30 )
>> +#define MGADWG_CLIPDIS        ( 0x01 << 31 )
>> +
>>   #define MGAREG_MISC_WRITE    0x3c2
>>   #define MGAREG_MISC_READ    0x3cc
>>   #define MGAREG_MEM_MISC_WRITE       0x1fc2
>> @@ -605,6 +612,9 @@
>>   #    define MGA_TC2_SELECT_TMU1                 (0x80000000)
>>   #define MGAREG_TEXTRANS        0x2c34
>>   #define MGAREG_TEXTRANSHIGH    0x2c38
>> +#define MGAREG_SECADDR        0x2c40
>> +#define MGAREG_SECEND        0x2c44
>> +#define MGAREG_SOFTRAP        0x2c48
>>   #define MGAREG_TEXFILTER    0x2c58
>>   #    define MGA_MIN_NRST                        (0x00000000)
>>   #    define MGA_MIN_BILIN                       (0x00000002)
>> @@ -691,4 +701,19 @@
>>   #define MGA_AGP2XPLL_ENABLE        0x1
>>   #define MGA_AGP2XPLL_DISABLE        0x0
>> +
>> +#define DWGREG0        0x1c00
>> +#define DWGREG0_END    0x1dff
>> +#define DWGREG1        0x2c00
>> +#define DWGREG1_END    0x2dff
>> +
>> +/* These macros convert register address to the 8 bit command index 
>> used with DMA
>> + * It remaps 0x1c00-0x1dff to 0x00-0x7f (REG0)
>> + * and 0x2c00-0x2dff to 0x80-0xff (REG1)
>> + */
>> +#define ISREG0(r)    (r >= DWGREG0 && r <= DWGREG0_END)
>> +#define DMAREG0(r)    ((u8)((r - DWGREG0) >> 2))
>> +#define DMAREG1(r)    ((u8)(((r - DWGREG1) >> 2) | 0x80))
>> +#define DMAREG(r)    (ISREG0((r)) ? DMAREG0((r)) : DMAREG1((r)))
>> +
>>   #endif
> 

Best regards,

-- 

Jocelyn

