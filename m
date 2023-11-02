Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E756B7DED58
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 08:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5EE10E81B;
	Thu,  2 Nov 2023 07:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E6210E81B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 07:31:12 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c50d1b9f22so8331591fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1698910270; x=1699515070; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zeFycR0Rr0GUmHVxqIhdxYVIQiMjHLDufapTQmILkYo=;
 b=YwW4U93sehCC2m22yTBCjiou9lkff+HMyA6JG+jXrp+YnA0sIIh46EfLMnbW/79AD1
 z4hVuOyClMPJbG9M2vTgXCcXmJWuZO3cRGHyoNHFSdmtddN1lbeI/ab2p8c9YWWJTHnv
 efmf/sKcTgBfNcDyrUg6xPeUt4KJCIt3JNtNt6tCWNkM1fcj3c1jGQTL6ZrFnPbjHqHw
 aktuKXtAvUqhp+khG5HGsLEiZ2aOPLVXnmyybJPiMmIxIlEcQ5LJYofPBdUWBxA1xUku
 BobcGeDmjhOq9wk0m2abQu8HIybiYVt0fHiR2hYD8cCoXCGYQr5SnmqRai00xyO/Jan5
 mpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698910270; x=1699515070;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zeFycR0Rr0GUmHVxqIhdxYVIQiMjHLDufapTQmILkYo=;
 b=KL/iKwJgSTomVUElEmNbG3um2bZk3F8lTLEHBBoqdI49NzdMX/qHSVSJfcSj4zvN+U
 AWgfewpTuReqgY/CXSzXHqjB+CV5+6w6zspJZTls6AMPU4fwTua1BffIsHD2ObU8mWb3
 KkGcHcNJAV7fOqmRcQxo60Fe9KhlB0Kui5PQaVqjJZj57n4jrSPvCtOATSxlgu5Zt1y3
 RjDSwa++52fdW4Ag8OR58eVUJ3b4MgWMvqixgDUF/RW6sOT6AD6MOD6EI+YAK38OWvy9
 b2VfqqElZ9xir8KoRBGff/yViTRruuMRGaXtoU5jQghP3l+SuuwbWW5cis9hLfMjEbp1
 A9ug==
X-Gm-Message-State: AOJu0Yz0Aqi1y2HfDu/LvCZWttxh24VRwDVCzSKzPok5kJlhPCPN3Kgh
 H19ZEr6QY/2SMqfciDG1ghlLow==
X-Google-Smtp-Source: AGHT+IHPZu+62qcnva1kKFS2tHhEJ4jXW24foTL77nc5LO4M6E7dC8hjXxsGCshbgirgSbnGoLl8oA==
X-Received: by 2002:a05:651c:2109:b0:2c2:c1f6:3097 with SMTP id
 a9-20020a05651c210900b002c2c1f63097mr17870850ljq.22.1698910269855; 
 Thu, 02 Nov 2023 00:31:09 -0700 (PDT)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d480b000000b0032cc35c2ef7sm1644645wrq.29.2023.11.02.00.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 00:31:08 -0700 (PDT)
Message-ID: <8a5bd15e-82d1-47ea-9db4-592887d7b3e7@froggi.es>
Date: Thu, 2 Nov 2023 07:31:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/32] drm/amd/display: add plane 3D LUT
 driver-specific properties
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-10-mwen@igalia.com>
 <16b3f90b-5295-46ce-8a5c-a71a7abe83a4@froggi.es>
In-Reply-To: <16b3f90b-5295-46ce-8a5c-a71a7abe83a4@froggi.es>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also, Melissa, you cannot do:

	if (!plane_state->color_mgmt_changed)
		return 0;

in amdgpu_dm_plane_set_color_properties.

The allocation for dc_plane_state could be new and zero'ed so it needs 
to be set every time. (Until AMDGPU has better dedup'ing of stuff there)

The reason it looked like it worked for you now is because the duplicate 
was broken, so color mgmt for planes was always being marked as dirty there.

Thanks

- Joshie 🐸✨

On 11/2/23 03:48, Joshua Ashton wrote:
> 
> 
> On 10/5/23 18:15, Melissa Wen wrote:
>> Add 3D LUT property for plane color transformations using a 3D lookup
>> table. 3D LUT allows for highly accurate and complex color
>> transformations and is suitable to adjust the balance between color
>> channels. It's also more complex to manage and require more
>> computational resources.
>>
>> Since a 3D LUT has a limited number of entries in each dimension we want
>> to use them in an optimal fashion. This means using the 3D LUT in a
>> colorspace that is optimized for human vision, such as sRGB, PQ, or
>> another non-linear space. Therefore, userpace may need one 1D LUT
>> (shaper) before it to delinearize content and another 1D LUT after 3D
>> LUT (blend) to linearize content again for blending. The next patches
>> add these 1D LUTs to the plane color mgmt pipeline.
>>
>> v3:
>> - improve commit message about 3D LUT
>> - describe the 3D LUT entries and size (Harry)
>>
>> v4:
>> - advertise 3D LUT max size as the size of a single-dimension
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 18 +++++++++++++++
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
>>   4 files changed, 64 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> index 62044d41da75..f7adaa52c23f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> @@ -363,6 +363,24 @@ struct amdgpu_mode_info {
>>        * @plane_hdr_mult_property:
>>        */
>>       struct drm_property *plane_hdr_mult_property;
>> +    /**
>> +     * @plane_lut3d_property: Plane property for color transformation 
>> using
>> +     * a 3D LUT (pre-blending), a three-dimensional array where each
>> +     * element is an RGB triplet. Each dimension has a size of the cubed
>> +     * root of lut3d_size. The array contains samples from the 
>> approximated
>> +     * function. On AMD, values between samples are estimated by
>> +     * tetrahedral interpolation. The array is accessed with three 
>> indices,
>> +     * one for each input dimension (color channel), blue being the
>> +     * outermost dimension, red the innermost.
>> +     */
>> +    struct drm_property *plane_lut3d_property;
>> +    /**
>> +     * @plane_degamma_lut_size_property: Plane property to define the 
>> max
>> +     * size of 3D LUT as supported by the driver (read-only). The max 
>> size
>> +     * is the max size of one dimension and, therefore, the max 
>> number of
>> +     * entries for 3D LUT array is the 3D LUT size cubed;
>> +     */
>> +    struct drm_property *plane_lut3d_size_property;
>>   };
>>   #define AMDGPU_MAX_BL_LEVEL 0xFF
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> index bb2ce843369d..7a2350c62cf1 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> @@ -784,6 +784,11 @@ struct dm_plane_state {
>>        * TF is needed for any subsequent linear-to-non-linear transforms.
>>        */
>>       __u64 hdr_mult;
>> +    /**
>> +     * @lut3d: 3D lookup table blob. The blob (if not NULL) is an 
>> array of
>> +     * &struct drm_color_lut.
>> +     */
>> +    struct drm_property_blob *lut3d;
>>   };
>>   struct dm_crtc_state {
>> @@ -869,6 +874,10 @@ void amdgpu_dm_update_freesync_caps(struct 
>> drm_connector *connector,
>>   void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>> +/* 3D LUT max size is 17x17x17 (4913 entries) */
>> +#define MAX_COLOR_3DLUT_SIZE 17
>> +#define MAX_COLOR_3DLUT_BITDEPTH 12
>> +/* 1D LUT size */
>>   #define MAX_COLOR_LUT_ENTRIES 4096
>>   /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
>>   #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index caf49a044ab4..011f2f9ec890 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -230,6 +230,20 @@ amdgpu_dm_create_color_properties(struct 
>> amdgpu_device *adev)
>>           return -ENOMEM;
>>       adev->mode_info.plane_hdr_mult_property = prop;
>> +    prop = drm_property_create(adev_to_drm(adev),
>> +                   DRM_MODE_PROP_BLOB,
>> +                   "AMD_PLANE_LUT3D", 0);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +    adev->mode_info.plane_lut3d_property = prop;
>> +
>> +    prop = drm_property_create_range(adev_to_drm(adev),
>> +                     DRM_MODE_PROP_IMMUTABLE,
>> +                     "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +    adev->mode_info.plane_lut3d_size_property = prop;
>> +
>>       return 0;
>>   }
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index ae64d4b73360..068798ffdd56 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -1359,6 +1359,8 @@ dm_drm_plane_duplicate_state(struct drm_plane 
>> *plane)
>>       if (dm_plane_state->degamma_lut)
>>           drm_property_blob_get(dm_plane_state->degamma_lut);
>> +    if (dm_plane_state->lut3d)
>> +        drm_property_blob_get(dm_plane_state->lut3d);
> 
> This is wrong, and was breaking state restoration on suspend.
> 
> dm_plane_state->lut3d is always NULL as it's the new zero-ed state, you 
> need to check the old_dm_plane_state's values and then set it on the new 
> state after _get.
> 
> It should be like this: (based on end of the patchset).
> 
>      if (old_dm_plane_state->degamma_lut) {
>          drm_property_blob_get(old_dm_plane_state->degamma_lut);
>          dm_plane_state->degamma_lut = old_dm_plane_state->degamma_lut;
>      }
>      if (old_dm_plane_state->ctm) {
>          drm_property_blob_get(old_dm_plane_state->ctm);
>          dm_plane_state->ctm = old_dm_plane_state->ctm;
>      }
>      if (old_dm_plane_state->shaper_lut) {
>          drm_property_blob_get(old_dm_plane_state->shaper_lut);
>          dm_plane_state->shaper_lut = old_dm_plane_state->shaper_lut;
>      }
>      if (old_dm_plane_state->lut3d) {
>          drm_property_blob_get(old_dm_plane_state->lut3d);
>          dm_plane_state->lut3d = old_dm_plane_state->lut3d;
>      }
>      if (old_dm_plane_state->blend_lut) {
>          drm_property_blob_get(old_dm_plane_state->blend_lut);
>          dm_plane_state->blend_lut = old_dm_plane_state->blend_lut;
>      }
> 
> because it doesn't do the memcpy like the base drm atomic stuff.
> 
> I also had to add a patch to ensure color mgmt was updated on unsuspend 
> always too, but that's not related to this patchset and also affected 
> stuff beforehand.
> 
> I'll send that patch in a bit.
> 
> Thanks!
> - Joshie 🐸✨
> 
>>       dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
>>       dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
>> @@ -1432,6 +1434,8 @@ static void dm_drm_plane_destroy_state(struct 
>> drm_plane *plane,
>>       if (dm_plane_state->degamma_lut)
>>           drm_property_blob_put(dm_plane_state->degamma_lut);
>> +    if (dm_plane_state->lut3d)
>> +        drm_property_blob_put(dm_plane_state->lut3d);
>>       if (dm_plane_state->dc_state)
>>           dc_plane_state_release(dm_plane_state->dc_state);
>> @@ -1462,6 +1466,14 @@ 
>> dm_atomic_plane_attach_color_mgmt_properties(struct 
>> amdgpu_display_manager *dm,
>>       drm_object_attach_property(&plane->base,
>>                      dm->adev->mode_info.plane_hdr_mult_property,
>>                      AMDGPU_HDR_MULT_DEFAULT);
>> +
>> +    if (dpp_color_caps.hw_3d_lut) {
>> +        drm_object_attach_property(&plane->base,
>> +                       mode_info.plane_lut3d_property, 0);
>> +        drm_object_attach_property(&plane->base,
>> +                       mode_info.plane_lut3d_size_property,
>> +                       MAX_COLOR_3DLUT_SIZE);
>> +    }
>>   }
>>   static int
>> @@ -1493,6 +1505,14 @@ dm_atomic_plane_set_property(struct drm_plane 
>> *plane,
>>               dm_plane_state->hdr_mult = val;
>>               dm_plane_state->base.color_mgmt_changed = 1;
>>           }
>> +    } else if (property == adev->mode_info.plane_lut3d_property) {
>> +        ret = drm_property_replace_blob_from_id(plane->dev,
>> +                            &dm_plane_state->lut3d,
>> +                            val, -1,
>> +                            sizeof(struct drm_color_lut),
>> +                            &replaced);
>> +        dm_plane_state->base.color_mgmt_changed |= replaced;
>> +        return ret;
>>       } else {
>>           drm_dbg_atomic(plane->dev,
>>                      "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
>> @@ -1520,6 +1540,9 @@ dm_atomic_plane_get_property(struct drm_plane 
>> *plane,
>>           *val = dm_plane_state->degamma_tf;
>>       } else if (property == adev->mode_info.plane_hdr_mult_property) {
>>           *val = dm_plane_state->hdr_mult;
>> +    } else     if (property == adev->mode_info.plane_lut3d_property) {
>> +        *val = (dm_plane_state->lut3d) ?
>> +            dm_plane_state->lut3d->base.id : 0;
>>       } else {
>>           return -EINVAL;
>>       }
