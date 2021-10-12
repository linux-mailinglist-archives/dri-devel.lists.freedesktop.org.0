Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3842A046
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 10:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3395089E63;
	Tue, 12 Oct 2021 08:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4A589E63
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 08:47:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m22so64674099wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zbX6hKlpjnEluaYu/lsbeCfslnUmI3YRbwFY1Jibvtg=;
 b=EuVHU0mSbR9/OGy5y8viyb3XVqJXl37DhVIe8dX07Z5jQ8Nje2QoKiiFdY6e9PbxLQ
 dRQDFVnVH0XM1VGpFIuApB4RIfhxIjTIis/Lfggji80pHzTtdvkQCeQ74wIRtZs8Sxg3
 bili+uILmV15CCNlbBtPiOPCXeWFK2Q+6ou5yhXQNOhZTdV2qFbZe5UT9eqVi3KHP01k
 nu1KE0bA5TKLN63b4gle52C/ZYOAjbAQZkdln/9/24Ebg244702t1wIAZBDCxPsG41mT
 j6+hSRq6XjdOQZuvWkiycFol+sI0GPDzH9KTu+Wi4V0PxqRQlNXCY2oAo5o5UnHDNgZS
 BpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zbX6hKlpjnEluaYu/lsbeCfslnUmI3YRbwFY1Jibvtg=;
 b=34zBOV8iRVUWD345ZYjcWjQ7Pr8vZ83c7ijvTNvR6I4Anip7algaafPuA7q/Ft912+
 kTvUnmm/glpjClXJkix9KFTfHmtS+FE1w79z8HyWxdTFm/XYQj/JcOxUE3099SUgwV1p
 T3rJSpZ1/GpurOe4SZqPuDbREeHycqJBLEIhAhQUVAjM4uG8Qxm0W0q1ylgVYRxDfEgz
 TAVKKIHCHBzrUcX+CPG9ya9XuvGmtLXvMn3eXsRwbuyhxvPHRkp2eXHvAOMPjX7JSyBZ
 yo5NmzTHlQG491trzM9bQmzKpFPpgwv/7+FUPvt6SMizCvNbcPpAq9I7kdcaYuWYB/F+
 DGSw==
X-Gm-Message-State: AOAM533IGkI3wJY9ZM/Tg8qlaYI8rxXHF7bs0TrgmLvWjIcc2xDwl10c
 eeBbKWraoCnXsu0nXygy6CL33AcqDak8gw==
X-Google-Smtp-Source: ABdhPJxOmIo0WWMlshzCTeHU91KlphCPToG02sGDwYhflW9nkfXLZ9f4EUlHyMMolREVzQaYIiFgbQ==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr30137331wrz.26.1634028470054; 
 Tue, 12 Oct 2021 01:47:50 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c?
 ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
 by smtp.gmail.com with ESMTPSA id p25sm1815128wma.2.2021.10.12.01.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 01:47:49 -0700 (PDT)
Subject: Re: [PATCH v5 3/8] drm/omap: introduce omap_hw_overlay
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-4-narmstrong@baylibre.com>
 <6e5980a6-218e-b585-3ad7-3e55350929b6@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <654cae73-fe44-022a-ec81-e04979be6f76@baylibre.com>
Date: Tue, 12 Oct 2021 10:47:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6e5980a6-218e-b585-3ad7-3e55350929b6@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 12/10/2021 09:59, Tomi Valkeinen wrote:
> On 23/09/2021 10:06, Neil Armstrong wrote:
>> From: Benoit Parrot <bparrot@ti.com>
>>
>> Split out the hardware overlay specifics from omap_plane.
>> To start, the hw overlays are statically assigned to planes.
>>
>> The goal is to eventually assign hw overlays dynamically to planes
>> during plane->atomic_check() based on requested caps (scaling, YUV,
>> etc). And then perform hw overlay re-assignment if required.
>>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/omapdrm/Makefile       |  1 +
>>   drivers/gpu/drm/omapdrm/omap_drv.c     |  9 ++-
>>   drivers/gpu/drm/omapdrm/omap_drv.h     |  4 ++
>>   drivers/gpu/drm/omapdrm/omap_overlay.c | 87 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/omapdrm/omap_overlay.h | 31 +++++++++
>>   drivers/gpu/drm/omapdrm/omap_plane.c   | 42 ++++++-------
>>   6 files changed, 151 insertions(+), 23 deletions(-)
>>   create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
>>   create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h
>>
>> diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
>> index 21e8277ff88f..710b4e0abcf0 100644
>> --- a/drivers/gpu/drm/omapdrm/Makefile
>> +++ b/drivers/gpu/drm/omapdrm/Makefile
>> @@ -9,6 +9,7 @@ omapdrm-y := omap_drv.o \
>>       omap_debugfs.o \
>>       omap_crtc.o \
>>       omap_plane.o \
>> +    omap_overlay.o \
>>       omap_encoder.o \
>>       omap_fb.o \
>>       omap_gem.o \
>> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
>> index f86e20578143..b994014b22e8 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
>> @@ -583,10 +583,14 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>>         omap_gem_init(ddev);
>>   +    ret = omap_hwoverlays_init(priv);
>> +    if (ret)
>> +        goto err_gem_deinit;
>> +
>>       ret = omap_modeset_init(ddev);
>>       if (ret) {
>>           dev_err(priv->dev, "omap_modeset_init failed: ret=%d\n", ret);
>> -        goto err_gem_deinit;
>> +        goto err_free_overlays;
>>       }
>>         /* Initialize vblank handling, start with all CRTCs disabled. */
>> @@ -618,6 +622,8 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>>       omap_fbdev_fini(ddev);
>>   err_cleanup_modeset:
>>       omap_modeset_fini(ddev);
>> +err_free_overlays:
>> +    omap_hwoverlays_destroy(priv);
>>   err_gem_deinit:
>>       omap_gem_deinit(ddev);
>>       destroy_workqueue(priv->wq);
>> @@ -642,6 +648,7 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
>>       drm_atomic_helper_shutdown(ddev);
>>         omap_modeset_fini(ddev);
>> +    omap_hwoverlays_destroy(priv);
>>       omap_gem_deinit(ddev);
>>         destroy_workqueue(priv->wq);
>> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
>> index 591d4c273f02..b4d9c2062723 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
>> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
>> @@ -24,6 +24,7 @@
>>   #include "omap_gem.h"
>>   #include "omap_irq.h"
>>   #include "omap_plane.h"
>> +#include "omap_overlay.h"
>>     #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__) /* verbose debug */
>> @@ -57,6 +58,9 @@ struct omap_drm_private {
>>       unsigned int num_planes;
>>       struct drm_plane *planes[8];
>>   +    unsigned int num_ovls;
>> +    struct omap_hw_overlay *overlays[8];
>> +
>>       struct drm_fb_helper *fbdev;
>>         struct workqueue_struct *wq;
>> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
>> new file mode 100644
>> index 000000000000..2b1416d2aad2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
>> @@ -0,0 +1,87 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
>> + * Author: Benoit Parrot, <bparrot@ti.com>
> 
> Extra comma there, and similar case below.

Fixed

> 
>> + */
>> +
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_plane_helper.h>
>> +
>> +#include "omap_dmm_tiler.h"
>> +#include "omap_drv.h"
>> +
>> +/*
>> + * overlay funcs
>> + */
>> +static const char * const overlay_id_to_name[] = {
>> +    [OMAP_DSS_GFX] = "gfx",
>> +    [OMAP_DSS_VIDEO1] = "vid1",
>> +    [OMAP_DSS_VIDEO2] = "vid2",
>> +    [OMAP_DSS_VIDEO3] = "vid3",
>> +};
> 
> I was expecting to see the name array to be removed from omap_plane.c as it's moved here, but that's not the case. Why is that? Especially as after this series these names make no sense with the planes.

You're right, I'll remove the one from omap_plane.c and where it's used.

> 
>> +static void omap_overlay_destroy(struct omap_hw_overlay *overlay)
>> +{
>> +    kfree(overlay);
>> +}
>> +
>> +static struct omap_hw_overlay *omap_overlay_init(enum omap_plane_id overlay_id,
>> +                         enum omap_overlay_caps caps)
>> +{
>> +    struct omap_hw_overlay *overlay;
>> +
>> +    overlay = kzalloc(sizeof(*overlay), GFP_KERNEL);
>> +    if (!overlay)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    overlay->name = overlay_id_to_name[overlay_id];
>> +    overlay->overlay_id = overlay_id;
>> +    overlay->caps = caps;
>> +    /*
>> +     * When this is called priv->num_crtcs is not known yet.
>> +     * Use a safe mask value to start with, it will get updated to the
>> +     * proper value after the first use.
>> +     */
>> +    overlay->possible_crtcs = 0xff;
> 
> This sounds like a hack. Why do we need possible_crtcs anyway? If I'm not mistaken, on all DSS versions any overlay can be used on any ctrtc. On the DRM plane level we need the possible_crtc as the DRM framework needs that (i.e. we just always set all crtcs available for all planes), but why is it needed here?

Indeed, in omap_drv.c we have:
plane_crtc_mask = (1 << priv->num_pipes) - 1;

for all planes, so I'll rework this.

> 
>> +    return overlay;
>> +}
>> +
>> +int omap_hwoverlays_init(struct omap_drm_private *priv)
>> +{
>> +    static const enum omap_plane_id hw_plane_ids[] = {
>> +            OMAP_DSS_GFX, OMAP_DSS_VIDEO1,
>> +            OMAP_DSS_VIDEO2, OMAP_DSS_VIDEO3,
>> +    };
>> +    u32 num_overlays = dispc_get_num_ovls(priv->dispc);
>> +    enum omap_overlay_caps caps;
>> +    int i, ret;
>> +
>> +    for (i = 0; i < num_overlays; i++) {
>> +        struct omap_hw_overlay *overlay;
>> +
>> +        caps = dispc_ovl_get_caps(priv->dispc, hw_plane_ids[i]);
>> +        overlay = omap_overlay_init(hw_plane_ids[i], caps);
>> +        if (IS_ERR(overlay)) {
>> +            ret = PTR_ERR(overlay);
>> +            dev_err(priv->dev, "failed to construct overlay for %s (%d)\n",
>> +                overlay_id_to_name[i], ret);
>> +            return ret;
>> +        }
> 
> I think this leaks memory if omap_overlay_init() fails.

Fixed

> 
>> +        overlay->idx = priv->num_ovls;
>> +        priv->overlays[priv->num_ovls++] = overlay;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +void omap_hwoverlays_destroy(struct omap_drm_private *priv)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < priv->num_ovls; i++) {
>> +        omap_overlay_destroy(priv->overlays[i]);
>> +        priv->overlays[i] = NULL;
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
>> new file mode 100644
>> index 000000000000..892fecb67adb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
>> + * Author: Benoit Parrot, <bparrot@ti.com>
>> + */
>> +
>> +#ifndef __OMAPDRM_OVERLAY_H__
>> +#define __OMAPDRM_OVERLAY_H__
>> +
>> +#include <linux/types.h>
>> +
>> +enum drm_plane_type;
>> +
>> +struct drm_device;
>> +struct drm_mode_object;
>> +struct drm_plane;
>> +
>> +/* Used to associate a HW overlay/plane to a plane */
>> +struct omap_hw_overlay {
>> +    int idx;
> 
> unsigned int.
> 
>> +
>> +    const char *name;
>> +    enum omap_plane_id overlay_id;
> 
> Perhaps just "id" is fine. You don't have "overlay_name" there either, but just "name".

Ack

> 
>  Tomi

Thanks,
Neil
