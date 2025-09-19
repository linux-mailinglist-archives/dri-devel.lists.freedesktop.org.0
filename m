Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7810CB8988F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 14:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B452810E9C2;
	Fri, 19 Sep 2025 12:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G6UrPt/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F26C10E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 12:49:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5FC6FC8F1C5;
 Fri, 19 Sep 2025 12:48:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13B39606A8;
 Fri, 19 Sep 2025 12:49:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62D5E102F177A; 
 Fri, 19 Sep 2025 14:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758286154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=CXFrW6b1BufmSMQloeBTYVqhzkotLOwRurdEc62BsBI=;
 b=G6UrPt/V1InZ7GaFaNGVlCKPjBFAoRElaETJoqUNX8afx3L8jS7+zzzbkaYSIF0uTEnKta
 gfd8ckPCa3RL6w1wwl1W5oEkGHTLOAJuDUUnhiTCCJ45HiQvGkps9Gpy1cubeeUN0c5IiA
 JgZEpxsJ0I137d3Mnyw6Ey18wBtpgrBCQvcCdbmb8uUKY+n5bTaWBQxYRDWnJW2iXA00Y0
 8TJ+NxRfVwXFrv+l9nlhEPbosj7o5W0u3edWHN1+evh5w8gpoOkYhqF2e0a2kSg02SNc+j
 85hSJuszpShrplkdmxuspKAdLNWf3XTS4MMhgbIES8xoMuin3o+j3jSsKbP7NQ==
Message-ID: <034cd9c9-807a-4c9d-a6b9-a75ed0b350d5@bootlin.com>
Date: Fri, 19 Sep 2025 14:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V11 14/47] drm/vkms: Add enumerated 1D curve colorop
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 harry.wentland@amd.com, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-15-alex.hung@amd.com>
 <87a2f6ca-c398-4222-8b23-d683c5fe6024@bootlin.com>
 <c1a1044e-dd05-4bf0-a903-9e13bfbf0de6@amd.com>
 <3fecacf2e1ea9b9e071cbb95e315a75a1cfb3b3d.camel@collabora.com>
 <73f01810-df2d-4e39-a20b-fc1cec2c5e12@amd.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <73f01810-df2d-4e39-a20b-fc1cec2c5e12@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 18/09/2025 à 02:45, Alex Hung a écrit :
> 
> 
> On 9/17/25 08:47, Nícolas F. R. A. Prado wrote:
>> On Tue, 2025-09-16 at 19:54 -0600, Alex Hung wrote:
>>>
>>>
>>> On 9/5/25 11:12, Louis Chauvet wrote:
>>>>
>>>>
>>>> Le 15/08/2025 à 05:50, Alex Hung a écrit :
>>>>> From: Harry Wentland <harry.wentland@amd.com>
>>>>>
>>>>> This patch introduces a VKMS color pipeline that includes two
>>>>> drm_colorops for named transfer functions. For now the only ones
>>>>> supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
>>>>> We will expand this in the future but I don't want to do so
>>>>> without accompanying IGT tests.
>>>>>
>>>>> We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
>>>>> sRGB Inverse EOTF, and a linear EOTF LUT. These have been
>>>>> generated with 256 entries each as IGT is currently testing
>>>>> only 8 bpc surfaces. We will likely need higher precision
>>>>> but I'm reluctant to make that change without clear indication
>>>>> that we need it. We'll revisit and, if necessary, regenerate
>>>>> the LUTs when we have IGT tests for higher precision buffers.
>>>>>
>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>>>> ---
>>>>> v11:
>>>>>     - Update drm_colorop_pipeline_destroy from plane to dev
>>>>> (Nícolas Prado)
>>>>>     - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test
>>>>> robot)
>>>>>
>>>>> v9:
>>>>>     - Replace cleanup code by drm_colorop_pipeline_destroy (Simon
>>>>> Ser)
>>>>>     - Update function names by _plane_ (Chaitanya Kumar Borah)
>>>>>
>>>>> v8:
>>>>>     - Replace DRM_ERROR by drm_err (Louis Chauvet)
>>>>>     - Replace DRM_WARN_ONCE by drm_WARN_ONCE (Louis Chauvet)
>>>>>     - Fix conflicts with upstream VKMS (Louis Chauvet)
>>>>>     - Add comments for drm_color_lut linear_array (Louis Chauvet)
>>>>>
>>>>> v7:
>>>>>     - Fix checkpatch warnings (Louis Chauvet)
>>>>>      - Change kzalloc(sizeof(struct drm_colorop) ...) to
>>>>> kzalloc(sizeof(*ops[i]) ...)
>>>>>      - Remove if (ops[i]) before kfree(ops[i])
>>>>>      - Fix styles by adding and removing spaces (new lines, tabs
>>>>> and so on)
>>>>>
>>>>> v6:
>>>>>     - drop 'len' var (Louis Chauvet)
>>>>>     - cleanup if colorop alloc or init fails (Louis Chauvet)
>>>>>     - switch loop in pre_blend_transform (Louis Chauvet)
>>>>>     - drop extraneous if (colorop) inside while (colorop) (Louis
>>>>> Chauvet)
>>>>>
>>>>> v5:
>>>>>     - Squash with "Pull apply_colorop out of
>>>>> pre_blend_color_transform"
>>>>>       (Sebastian)
>>>>>     - Fix warnings
>>>>>     - Fix include
>>>>>     - Drop TODOs
>>>>>
>>>>> v4:
>>>>>     - Drop _tf_ from color_pipeline init function
>>>>>     - Pass supported TFs into colorop init
>>>>>     - Create bypass pipeline in DRM helper (Pekka)
>>>>>
>>>>> v2:
>>>>>     - Add commit description
>>>>>     - Fix sRGB EOTF LUT definition
>>>>>     - Add linear and sRGB inverse EOTF LUTs
>>>>>
>>>>>     drivers/gpu/drm/vkms/Makefile        |   4 +-
>>>>>     drivers/gpu/drm/vkms/vkms_colorop.c  |  81 +++
>>>>>     drivers/gpu/drm/vkms/vkms_composer.c |  51 +-
>>>>>     drivers/gpu/drm/vkms/vkms_drv.h      |   3 +
>>>>>     drivers/gpu/drm/vkms/vkms_luts.c     | 811
>>>>> +++++++++++++++++++++++++++
>>>>>     drivers/gpu/drm/vkms/vkms_luts.h     |  12 +
>>>>>     drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>>>>>     7 files changed, 962 insertions(+), 2 deletions(-)
>>>>>     create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>>>>     create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>>>>     create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/vkms/Makefile
>>>>> b/drivers/gpu/drm/vkms/
>>>>> Makefile
>>>>> index d657865e573f..0b8936674f69 100644
>>>>> --- a/drivers/gpu/drm/vkms/Makefile
>>>>> +++ b/drivers/gpu/drm/vkms/Makefile
>>>>> @@ -8,7 +8,9 @@ vkms-y := \
>>>>>         vkms_composer.o \
>>>>>         vkms_writeback.o \
>>>>>         vkms_connector.o \
>>>>> -    vkms_config.o
>>>>> +    vkms_config.o \
>>>>> +    vkms_colorop.o \
>>>>> +    vkms_luts.o
>>>>>     obj-$(CONFIG_DRM_VKMS) += vkms.o
>>>>>     obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
>>>>> b/drivers/gpu/drm/
>>>>> vkms/vkms_colorop.c
>>>>> new file mode 100644
>>>>> index 000000000000..f955ffb0ac84
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>>>>> @@ -0,0 +1,81 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>>> +
>>>>> +#include <linux/slab.h>
>>>>> +#include <drm/drm_colorop.h>
>>>>> +#include <drm/drm_print.h>
>>>>> +#include <drm/drm_property.h>
>>>>> +#include <drm/drm_plane.h>
>>>>> +
>>>>> +#include "vkms_drv.h"
>>>>> +
>>>>> +static const u64 supported_tfs =
>>>>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>>>>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>>>>> +
>>>>> +#define MAX_COLOR_PIPELINE_OPS 2
>>>>> +
>>>>> +static int vkms_initialize_color_pipeline(struct drm_plane
>>>>> *plane,
>>>>> struct drm_prop_enum_list *list)
>>>>> +{
>>>>> +    struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>>>>> +    struct drm_device *dev = plane->dev;
>>>>> +    int ret;
>>>>> +    int i = 0;
>>>>> +
>>>>> +    memset(ops, 0, sizeof(ops));
>>>>> +
>>>>> +    /* 1st op: 1d curve */
>>>>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>>>>> +    if (!ops[i]) {
>>>>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>>>>> +        ret = -ENOMEM;
>>>>> +        goto cleanup;
>>>>> +    }
>>>>> +
>>>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>>>> supported_tfs);
>>>>> +    if (ret)
>>>>> +        goto cleanup;
>>>>> +
>>>>> +    list->type = ops[i]->base.id;
>>>>> +    list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d",
>>>>> ops[i]-
>>>>>> base.id);
>>>>> +
>>>>> +    i++;
>>>>> +
>>>>> +    /* 2nd op: 1d curve */
>>>>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>>>>> +    if (!ops[i]) {
>>>>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>>>>> +        ret = -ENOMEM;
>>>>> +        goto cleanup;
>>>>> +    }
>>>>> +
>>>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>>>> supported_tfs);
>>>>> +    if (ret)
>>>>> +        goto cleanup;
>>>>> +
>>>>> +    drm_colorop_set_next_property(ops[i - 1], ops[i]);
>>>>> +
>>>>> +    return 0;
>>>>> +
>>>>> +cleanup:
>>>>> +    drm_colorop_pipeline_destroy(dev);
>>>>
>>>> If it take a device, it means that it deletes everything, which is
>>>> not
>>>> what I would expect here: you are curently allocating a specific
>>>> plane
>>>> pipeline, and deleting all colorop for other planes because of one
>>>> failure is counterintuitive.
>>>> In this situation I would expect either:
>>>> - error propagation to vkms_create or vkms_output_init (it is
>>>> already
>>>> the case) and "device-wide" cleanup in
>>>> vkms_create/vkms_output_init;
>>>> - "local" cleanup (i.e only this specific pipeline)
> 
> the colorop are now in dev->mode_config->colorop_list, so we can use
> "drm_colorop_cleanup" (assuming it is changed to be available here) for
> cleanup if removing entire colorop_list by
> drm_colorop_pipeline_destroy(dev) is not desireable in vkms. Does the
> following code make sense?
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
> b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 0191ac44dec0..d263e3593ad5 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -19,7 +19,7 @@ static int vkms_initialize_color_pipeline(struct
> drm_plane *plane, struct drm_pr
>    	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>    	struct drm_device *dev = plane->dev;
>    	int ret;
> -	int i = 0;
> +	int i = 0, j = 0;
> 
>    	memset(ops, 0, sizeof(ops));
> 
> @@ -91,7 +91,10 @@ static int vkms_initialize_color_pipeline(struct
> drm_plane *plane, struct drm_pr
>    	return 0;
> 
>    cleanup:
> -	drm_colorop_pipeline_destroy(dev);
> +	for (j = 0; j < i; j++) {
> +		if (ops[j])
> +			drm_colorop_cleanup(ops[j]);
> +	}
> 
>    	return ret;
>    }

Yes, that could work!

I think you need to add a kfree for ops[j], but this code is better: it 
only destroy what was allocated in this function, no more.

BTW, while reviewing this series + post_blend, I noticed that the 
pipeline is never freed on device destruction. Did I miss something in 
the colorop core? If no, I think it should be added in vkms_destroy or 
using automagic drmm_add_action_or_reset in vkms_output_init.

>>>
>>> Hi Louis,
>>>
>>> Does it make sense to make drm_colorop_pipeline_destroy(drm_plane),
>>> i.e.
>>> in PATCH 13 as in previously V10?
>>>
>>> and then drm_colorop_pipeline_destroy should limit to the pipeline in
>>> a
>>> drm_plane and should do something like
>>>
>>>      drm_colorop_cleanup(colorop);
>>>      free(colorop)
>>>      drm_plane->colorop = NULL;
>>>
> 
> This doesn't seem right after digging into it.
> 
>>> We can have same behaviours accross device drivers like amdgpu too.
>>>
>>> Hi Simon and Nicolas,
>>>
>>> Do you have comments on above proposal?
>>
>> Hi,
>>
>> indeed that would make more sense to me.
>>
> 

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


