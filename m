Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAFA2A6EE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 12:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B0910E81B;
	Thu,  6 Feb 2025 11:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Oaoa2Qg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9DA10E81B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738840175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfMgTRg1Wc9WHtz5P8mj3g+grMwMYX6N1F/GiRx1ByE=;
 b=Oaoa2Qg8OUezjF8Xo4eqI8HXg/kEZl8Wuux/Cm12xWSxM2X71xYImXA4mDUePWD6DqtAzU
 dSdm5NKF4DlcNZyf/bxZdMVAsr3fuiYDyfpX+tPnkQS46Tw0VBK5M2g8vojjRELXxTzCtb
 UT8MBH5pJPEcm0rJCKFkXG/+Mr9UU6M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-l3kVOVJ5NjG6INOHJLJEng-1; Thu, 06 Feb 2025 06:09:34 -0500
X-MC-Unique: l3kVOVJ5NjG6INOHJLJEng-1
X-Mimecast-MFC-AGG-ID: l3kVOVJ5NjG6INOHJLJEng
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361ecebc5bso4265785e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 03:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738840173; x=1739444973;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfMgTRg1Wc9WHtz5P8mj3g+grMwMYX6N1F/GiRx1ByE=;
 b=CXeSjkFU5Q8BdZXsocjxw1maEeUkV0IJtD1vwLi0/w1o4B6x4xUwhnGKsU1ebOkQYE
 izOOOVBS8vcgLGDHJK7QfyNGKfl6BfZbuA4GsBMh4yl330FtkhP3I09MPmpD8kVi8U5U
 Ig8jjcvyFTLNjIctEVvIiPW4fSGwuKlGoqt+AAcxICQt6WHNJHiS/40U5yEDqiYwXiss
 268nmDcOL5wUOG6ocjxKJhkz40y5NpfphGlhJwLdpud5/TDI48eD8tcg0eXG02tXwbVu
 aWxToNnjrYLUOv6v05OdyHjhCYsmH6zsPiRqaZAcewTL9S3GouiMdVH6MDBiRYR6D6OO
 QEOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/uEtZoj5TY+knQi6zI5bs/hNsEQ0U6CQQ/1qpJPqG80LvMiasiQK5TVhbNqP1uqiFuViKdVD5PYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJNhS2l4bCWBE8NC2UXj5uz4y7BPn/rOELcXOisGoNevVay0qN
 51EIHOSN1fKYtaDyuyV09ZysJqUK3GAKQwuDQpmhMqNKAIolDyIyXnBxAEZhV9Tvpiwn4o64+Pd
 1kpBdHV3ZbOatlQ6QUOPDoZ9RahHRgtGQNA/BvTfaco6X33+/3gV8636buo9X6tiNtw==
X-Gm-Gg: ASbGncutul/CoFxVlFoVXS5EziwCnCfI5UBIVmXLvHUDdMfmGpTlo4VLg/jw13V5zdt
 wtv/5/EanQgw8ot6QxrIjXTyWY4TId8HEVUUFCKTNiod+RiVvHxcdjpVR07SYUMMElZfLqx1CeW
 SM8CdBborwSLHQWyLK5Ua81jWVAvxZ6RZYO7K22vuZXmGMjxcznR8JPyNHcsZ8ZFEt1tGF/NgJF
 WJHadms1dP/2jtGW5Yxr0kwLYH4SrG1n0kMKAImdQ4/t02fdefNELeLFJ2PM/Suw0+xFBLuuhLM
 7mQ7FMQuoIcDpaEYcYq7BEMSbMwHoBzZ2inE99hbmknF
X-Received: by 2002:a05:600c:1f8f:b0:436:488f:50a with SMTP id
 5b1f17b1804b1-4390d43f16cmr48918525e9.17.1738840173050; 
 Thu, 06 Feb 2025 03:09:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGunR/KekI/1dih4z71pcgMTvSxo3bFqVMi448h2fuXoJYCNEcHgyKBPgWUe1fMO1SZRFyE1Q==
X-Received: by 2002:a05:600c:1f8f:b0:436:488f:50a with SMTP id
 5b1f17b1804b1-4390d43f16cmr48918255e9.17.1738840172631; 
 Thu, 06 Feb 2025 03:09:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d93369fsm52371415e9.3.2025.02.06.03.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 03:09:31 -0800 (PST)
Message-ID: <cd58f577-70d8-40a9-888a-6e459298034b@redhat.com>
Date: Thu, 6 Feb 2025 12:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Added support for the new device G200eH5
To: Gwenael Georgeault <ggeorgea@matrox.com>, Dave Airlie
 <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <alpine.LFD.2.00.2502051724170.31360@pluton.matrox.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <alpine.LFD.2.00.2502051724170.31360@pluton.matrox.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f63CyQS75d0ZyhJ5P-C6tt_4BjA0aMsHwuNOvISV9Ks_1738840173
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

Thanks a lot for this rework.

When sending a new version of your patch, you can use "git send-email 
-v2" to show that it's the second version of this patch.


On 05/02/2025 23:28, Gwenael Georgeault wrote:
> - Added the new device ID
> - Added new pll algorithm
> 
> Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>

You're missing your Signed-off-by line.
You can use git commit -s --amend to add it automatically

Also there are some spurious spaces added to your patch context, which 
makes git am failed. I just replaced all occurences of "0x0A 0x20 0x20" 
with "0x0A 0x20" and that fixed it.

I still have a few comments below:

> ---
>   drivers/gpu/drm/mgag200/Makefile          |   1 +
>   drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |   3 +
>   drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 202 ++++++++++++++++++++++
>   4 files changed, 210 insertions(+)
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> 
> diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/ 
> Makefile
> index 5a02203fad12..94f063c8722a 100644
> --- a/drivers/gpu/drm/mgag200/Makefile
> +++ b/drivers/gpu/drm/mgag200/Makefile
> @@ -6,6 +6,7 @@ mgag200-y := \
>       mgag200_g200.o \
>       mgag200_g200eh.o \
>       mgag200_g200eh3.o \
> +    mgag200_g200eh5.o \
>       mgag200_g200er.o \
>       mgag200_g200ev.o \
>       mgag200_g200ew3.o \
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/ 
> mgag200/mgag200_drv.c
> index 069fdd2dc8f6..1c257f5b5136 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -214,6 +214,7 @@ static const struct pci_device_id 
> mgag200_pciidlist[] = {
>       { PCI_VENDOR_ID_MATROX, 0x534, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_ER },
>       { PCI_VENDOR_ID_MATROX, 0x536, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EW3 },
>       { PCI_VENDOR_ID_MATROX, 0x538, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH3 },
> +    { PCI_VENDOR_ID_MATROX, 0x53A, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH5 },
>       {0,}
>   };
> 
> @@ -256,6 +257,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct 
> pci_device_id *ent)
>       case G200_EH3:
>           mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
>           break;
> +    case G200_EH5:
> +        mdev = mgag200_g200eh5_device_create(pdev, &mgag200_driver);
> +        break;
>       case G200_ER:
>           mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
>           break;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/ 
> mgag200/mgag200_drv.h
> index 0608fc63e588..819a7e9381e3 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -196,6 +196,7 @@ enum mga_type {
>       G200_EV,
>       G200_EH,
>       G200_EH3,
> +    G200_EH5,
>       G200_ER,
>       G200_EW3,
>   };
> @@ -334,6 +335,8 @@ struct mga_device 
> *mgag200_g200eh_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
>                            const struct drm_driver *drv);
> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                         const struct drm_driver *drv);
>   struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/ 
> drm/mgag200/mgag200_g200eh5.c
> new file mode 100644
> index 000000000000..8cb01116ac33
> --- /dev/null
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-only

There should be an empty line between the license and the first include 
statement.

> +#include <linux/pci.h>
> +#include <linux/units.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "mgag200_drv.h"
> +
> +/*
> + * PIXPLLC
> + */
> +
> +static int mgag200_g200eh5_pixpllc_atomic_check(struct drm_crtc *crtc,
> +                        struct drm_atomic_state *new_state)
> +{
> +    const unsigned long long VCO_MAX = 10 * GIGA; // Hz
> +    const unsigned long long VCO_MIN = 2500 * MEGA; // Hz
> +    const unsigned long long PLL_FREQ_REF = 25 * MEGA; // Hz
> +
> +    struct drm_crtc_state *new_crtc_state = 
> drm_atomic_get_new_crtc_state(new_state, crtc);
> +    struct mgag200_crtc_state *new_mgag200_crtc_state = 
> to_mgag200_crtc_state(new_crtc_state);
> +    long clock = new_crtc_state->mode.clock;
> +    struct mgag200_pll_values *pixpllc = &new_mgag200_crtc_state->pixpllc;
> +
> +    unsigned long long fdelta = 0xFFFFFFFFFFFFFFFFULL;

You can use ULLONG_MAX here instead.
> +
> +    u16 mult_max = (u16)(VCO_MAX / PLL_FREQ_REF); // 400 (0x190)
> +    u16 mult_min = (u16)(VCO_MIN / PLL_FREQ_REF); // 100 (0x64)
> +
> +    u64 ftmp_delta;
> +    u64 computed_fo;
> +
> +    u16 test_m;
> +    u8 test_div_a;
> +    u8 test_div_b;
> +    u64 fo_hz;
> +
> +    u8 uc_m = 0;
> +    u8 uc_n = 0;
> +    u8 uc_p = 0;
> +
> +    fo_hz = (u64)clock * HZ_PER_KHZ;
> +
> +    for (test_m = mult_min; test_m <= mult_max; test_m++) { // This 
> gives 100 <= M <= 400
> +        for (test_div_a = 8; test_div_a > 0; test_div_a--) { // This 
> gives 1 <= A <= 8
> +            for (test_div_b = 1; test_div_b <= test_div_a; test_div_b++) {
> +                // This gives 1 <= B <= A
> +                computed_fo = (PLL_FREQ_REF * test_m) /
> +                    (4 * test_div_a * test_div_b);
> +
> +                if (computed_fo > fo_hz)
> +                    ftmp_delta = computed_fo - fo_hz;
> +                else
> +                    ftmp_delta = fo_hz - computed_fo;
> +
> +                if (ftmp_delta < fdelta) {
> +                    fdelta = ftmp_delta;
> +                    uc_m = (u8)(0xFF & test_m);
> +                    uc_n = (u8)((0x7 & (test_div_a - 1))
> +                        | (0x70 & (0x7 & (test_div_b - 1)) << 4));
> +                    uc_p = (u8)(1 & (test_m >> 8));
> +                }
> +                if (fdelta == 0)
> +                    break;
> +            }
> +            if (fdelta == 0)
> +                break;
> +        }
> +        if (fdelta == 0)
> +            break;
> +    }
> +
> +    pixpllc->m = uc_m + 1;
> +    pixpllc->n = uc_n + 1;
> +    pixpllc->p = uc_p + 1;
> +    pixpllc->s = 0;
> +
> +    return 0;
> +    }
> +
> +/*
> + * Mode-setting pipeline
> + */
> +
> +static const struct drm_plane_helper_funcs 
> mgag200_g200eh5_primary_plane_helper_funcs = {
> +    MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
> +};
> +
> +static const struct drm_plane_funcs mgag200_g200eh5_primary_plane_funcs 
> = {
> +    MGAG200_PRIMARY_PLANE_FUNCS,
> +};
> +
> +static const struct drm_crtc_helper_funcs 
> mgag200_g200eh5_crtc_helper_funcs = {
> +    MGAG200_CRTC_HELPER_FUNCS,
> +};
> +
> +static const struct drm_crtc_funcs mgag200_g200eh5_crtc_funcs = {
> +    MGAG200_CRTC_FUNCS,
> +};
> +
> +static int mgag200_g200eh5_pipeline_init(struct mga_device *mdev)
> +{
> +    struct drm_device *dev = &mdev->base;
> +    struct drm_plane *primary_plane = &mdev->primary_plane;
> +    struct drm_crtc *crtc = &mdev->crtc;
> +    int ret;
> +
> +    ret = drm_universal_plane_init(dev, primary_plane, 0,
> +                       &mgag200_g200eh5_primary_plane_funcs,
> +                       mgag200_primary_plane_formats,
> +                       mgag200_primary_plane_formats_size,
> +                       mgag200_primary_plane_fmtmods,
> +                       DRM_PLANE_TYPE_PRIMARY, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
> +        return ret;
> +    }
> +    drm_plane_helper_add(primary_plane, 
> &mgag200_g200eh5_primary_plane_helper_funcs);
> +    drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +    ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +                    &mgag200_g200eh5_crtc_funcs, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
> +        return ret;
> +    }
> +
> +    drm_crtc_helper_add(crtc, &mgag200_g200eh5_crtc_helper_funcs);
> +
> +    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
> without */
> +    drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
> +    drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
> +    ret = mgag200_vga_bmc_output_init(mdev);
> +
> +    if (ret)
> +        return ret;
> +
> +    return 0;
> +}
> +
> +/*
> + * DRM device
> + */
> +
> +static const struct mgag200_device_info mgag200_g200eh5_device_info =
> +    MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
> +
> +static const struct mgag200_device_funcs mgag200_g200eh5_device_funcs = {
> +    .pixpllc_atomic_check = mgag200_g200eh5_pixpllc_atomic_check,
> +    .pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update, // 
> same as G200EH
> +};
> +
> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                         const struct drm_driver *drv)
> +{
> +    struct mga_device *mdev;
> +    struct drm_device *dev;
> +    resource_size_t vram_available;
> +    int ret;
> +
> +    mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
> +
> +    if (IS_ERR(mdev))
> +        return mdev;
> +    dev = &mdev->base;
> +
> +    pci_set_drvdata(pdev, dev);
> +
> +    ret = mgag200_init_pci_options(pdev, 0x00000120, 0x0000b000);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_preinit(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_init(mdev, &mgag200_g200eh5_device_info,
> +                  &mgag200_g200eh5_device_funcs);
> +
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    mgag200_g200eh_init_registers(mdev); // same as G200EH
> +    vram_available = mgag200_device_probe_vram(mdev);
> +
> +    ret = mgag200_mode_config_init(mdev, vram_available);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_g200eh5_pipeline_init(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    drm_mode_config_reset(dev);
> +    drm_kms_helper_poll_init(dev);
> +
> +    return mdev;
> +}

