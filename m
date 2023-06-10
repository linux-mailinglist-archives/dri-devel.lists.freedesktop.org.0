Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A74A72A92A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 07:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919A410E0DE;
	Sat, 10 Jun 2023 05:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E078A10E0DE
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 05:34:57 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6e13940daso25384675e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1686375295; x=1688967295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IweQ0mQq1Pz+Klw070usbUNQ2BV55IRAVs5u1XXFkxE=;
 b=TpKk6XX5JP6yFWZyS2iDqqV6Zkr7GWgS5WSWQD4O8DG/BKTUeEhN6gqpgGYJpXWKCL
 7VWeGwM3vzdbmqdjiVfXf93qJGTBI8B+LH2VHJbJGLQGrmya/xuztblcAN3WnI2BrMKp
 M9QzA7soH0HT4HmcIbGGMvSVwS9YEMQt88+To0mXD5iJNVZLWFb9FUADVh1GrXQ7MXLj
 cJljieV+uhiqlZxdqQh5W1nYul+yIEXgvo1PDiLJCqjKdYToSu1BurbjWBHBQinMAAK2
 h8RiLERBpaVzC9iDDPuutHJOk3VD5lqQ+NyX0SUW/hFRw4uZxZ1PJngZmkkvHxLZ7TBA
 pVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686375295; x=1688967295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IweQ0mQq1Pz+Klw070usbUNQ2BV55IRAVs5u1XXFkxE=;
 b=FNM83mT52xcKLkdF22ND7dblwczin9+odB/t9dYZ9RL131ynHMInZes8t/SMZi+dp4
 JNqV6KLBVKxo9EkeRVjN3lJsOTt6o+uBCFhGZvp2jtNl/TkiQJlN1xKTC1t/gBOkUzJl
 cgMffMKbj5FwvmlT7/018h4p/PgkbnSPMt59smprhnPgZYTBNS/zzkvWRrDdtq9bU0Pd
 8Lp7sBIgwxkFPeAAYWowiUf0/77C7q1/GS9RWXtzSJ0nLDodtXpvssgp5ASu9J/UNJ/y
 q6ZvgPWnJZvXYpJU/89srUX8RVrY1sWMaEsPYiXk54YsHAlQO/rCI8zDkD5+GD22e12p
 5Gdw==
X-Gm-Message-State: AC+VfDwMW8vHkfKZMVPg1XrckWWcUFLvBRcrkKyP0m/PwcPP67riK5yi
 wBfyugSD5lmOZ+QmGVIB6KuyUA==
X-Google-Smtp-Source: ACHHUZ5pd6igxLumI1zRxKz8yH9HAJbQ67YkHQTZ75b3ECRiYSoj7CX83+9vNAaiDoTpQDbMNA/YvA==
X-Received: by 2002:a05:600c:255:b0:3f6:53a:6665 with SMTP id
 21-20020a05600c025500b003f6053a6665mr2902200wmj.19.1686375295420; 
 Fri, 09 Jun 2023 22:34:55 -0700 (PDT)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a5d4a01000000b003062ad45243sm6190469wrq.14.2023.06.09.22.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 22:34:54 -0700 (PDT)
Message-ID: <d1986740-a6cd-9396-bb05-1f8a3b3708e8@froggi.es>
Date: Sat, 10 Jun 2023 06:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 07/36] drm/amd/display: add plane driver-specific
 properties for degamma LUT
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-8-mwen@igalia.com>
 <717f0e53-4e38-7ffe-3ea7-84d4bb6c284e@amd.com>
 <20230606171513.6u3vhfnpri7pduqz@mail.igalia.com>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <20230606171513.6u3vhfnpri7pduqz@mail.igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Adding a plane color_mgmt_changed doesn't really work as it could be 
different plane object each time but not need a reset at the hardware level.

What needs to be done is to add the properties to should_reset_plane 
directly in the old_other_state stuff like so:

		/* HDR/Transfer Function changes. */
		if (old_other_state->degamma_tf != new_other_state->degamma_tf ||
			old_other_state->degamma_lut != new_other_state->degamma_lut ||
			old_other_state->hdr_mult != new_other_state->hdr_mult)
			old_other_state->hdr_mult != new_other_state->hdr_mult ||
			old_other_state->shaper_lut != new_other_state->shaper_lut ||
			old_other_state->shaper_tf != new_other_state->shaper_tf ||
			old_other_state->lut3d != new_other_state->lut3d)
			return true;

This is the same for all of the plane properties fwiw.

Thanks!
   - Joshie 🐸✨

On 6/6/23 18:15, Melissa Wen wrote:
> On 06/01, Harry Wentland wrote:
>>
>>
>> On 5/23/23 18:14, Melissa Wen wrote:
>>> Create and attach driver-private properties for plane color management.
>>> First add plane degamma LUT properties that means user-blob and its
>>> size. We will add more plane color properties in the next commits. In
>>> addition, we keep these driver-private plane properties limited by
>>> defining AMD_PRIVATE_COLOR.
>>>
>>> Co-developed-by: Joshua Ashton <joshua@froggi.es>
>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 ++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 ++
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 77 +++++++++++++++++++
>>>   4 files changed, 108 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> index 88af075e6c18..fa67c84f5994 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>> @@ -1275,6 +1275,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>>>   		return -ENOMEM;
>>>   	adev->mode_info.regamma_tf_property = prop;
>>>   
>>> +	prop = drm_property_create(adev_to_drm(adev),
>>> +				   DRM_MODE_PROP_BLOB,
>>> +				   "AMD_PLANE_DEGAMMA_LUT", 0);
>>> +	if (!prop)
>>> +		return -ENOMEM;
>>> +	adev->mode_info.plane_degamma_lut_property = prop;
>>> +
>>> +	prop = drm_property_create_range(adev_to_drm(adev),
>>> +					 DRM_MODE_PROP_IMMUTABLE,
>>> +					 "AMD_PLANE_DEGAMMA_LUT_SIZE", 0, UINT_MAX);
>>> +	if (!prop)
>>> +		return -ENOMEM;
>>> +	adev->mode_info.plane_degamma_lut_size_property = prop;
>>> +
>>
>> Same as with previous patch and the following ones... Would be
>> great to have this sit in amdgpu_dm_color.c.
> 
> Ack
> 
>>
>> Harry
>>
>>>   	return 0;
>>>   }
>>>   #endif
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> index 881446c51b36..6c165ad9bdf0 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> @@ -352,6 +352,14 @@ struct amdgpu_mode_info {
>>>   	 * drm_transfer_function`.
>>>   	 */
>>>   	struct drm_property *regamma_tf_property;
>>> +	/* @plane_degamma_lut_property: Plane property to set a degamma LUT to
>>> +	 * convert color space before blending.
>>> +	 */
>>> +	struct drm_property *plane_degamma_lut_property;
>>> +	/* @plane_degamma_lut_size_property: Plane property to define the max
>>> +	 * size of degamma LUT as supported by the driver (read-only).
>>> +	 */
>>> +	struct drm_property *plane_degamma_lut_size_property;
>>>   };
>>>   
>>>   #define AMDGPU_MAX_BL_LEVEL 0xFF
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index ad5ee28b83dc..22e126654767 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -716,6 +716,15 @@ enum drm_transfer_function {
>>>   struct dm_plane_state {
>>>   	struct drm_plane_state base;
>>>   	struct dc_plane_state *dc_state;
>>> +
>>> +	/* Plane color mgmt */
>>> +	/**
>>> +	 * @degamma_lut:
>>> +	 *
>>> +	 * LUT for converting plane pixel data before going into plane merger.
>>> +	 * The blob (if not NULL) is an array of &struct drm_color_lut.
>>> +	 */
>>> +	struct drm_property_blob *degamma_lut;
>>>   };
>>>   
>>>   struct dm_crtc_state {
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> index 322668973747..e9cedc4068f1 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> @@ -1338,6 +1338,9 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>>>   		dc_plane_state_retain(dm_plane_state->dc_state);
>>>   	}
>>>   
>>> +	if (dm_plane_state->degamma_lut)
>>> +		drm_property_blob_get(dm_plane_state->degamma_lut);
>>> +
>>>   	return &dm_plane_state->base;
>>>   }
>>>   
>>> @@ -1405,12 +1408,79 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>>>   {
>>>   	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
>>>   
>>> +	if (dm_plane_state->degamma_lut)
>>> +		drm_property_blob_put(dm_plane_state->degamma_lut);
>>> +
>>>   	if (dm_plane_state->dc_state)
>>>   		dc_plane_state_release(dm_plane_state->dc_state);
>>>   
>>>   	drm_atomic_helper_plane_destroy_state(plane, state);
>>>   }
>>>   
>>> +#ifdef AMD_PRIVATE_COLOR
>>> +static void
>>> +dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>>> +					     struct drm_plane *plane)
>>> +{
>>> +	if (dm->dc->caps.color.dpp.dgam_ram || dm->dc->caps.color.dpp.gamma_corr ) {
>>> +		drm_object_attach_property(&plane->base,
>>> +					   dm->adev->mode_info.plane_degamma_lut_property, 0);
>>> +		drm_object_attach_property(&plane->base,
>>> +					   dm->adev->mode_info.plane_degamma_lut_size_property,
>>> +					   MAX_COLOR_LUT_ENTRIES);
>>> +	}
>>> +}
>>> +
>>> +static int
>>> +dm_atomic_plane_set_property(struct drm_plane *plane,
>>> +			     struct drm_plane_state *state,
>>> +			     struct drm_property *property,
>>> +			     uint64_t val)
>>> +{
>>> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
>>> +	struct amdgpu_device *adev = drm_to_adev(plane->dev);
>>> +	bool replaced = false;
>>> +	int ret;
>>> +
>>> +	if (property == adev->mode_info.plane_degamma_lut_property) {
>>> +		ret = drm_property_replace_blob_from_id(plane->dev,
>>> +							&dm_plane_state->degamma_lut,
>>> +							val,
>>> +							-1, sizeof(struct drm_color_lut),
>>> +							&replaced);
>>> +		dm_plane_state->base.color_mgmt_changed |= replaced;
>>> +		return ret;
>>> +	} else {
>>> +		drm_dbg_atomic(plane->dev,
>>> +			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
>>> +			       plane->base.id, plane->name,
>>> +			       property->base.id, property->name);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int
>>> +dm_atomic_plane_get_property(struct drm_plane *plane,
>>> +			     const struct drm_plane_state *state,
>>> +			     struct drm_property *property,
>>> +			     uint64_t *val)
>>> +{
>>> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
>>> +	struct amdgpu_device *adev = drm_to_adev(plane->dev);
>>> +
>>> +	if (property == adev->mode_info.plane_degamma_lut_property) {
>>> +		*val = (dm_plane_state->degamma_lut) ?
>>> +			dm_plane_state->degamma_lut->base.id : 0;
>>> +	} else {
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +#endif
>>> +
>>>   static const struct drm_plane_funcs dm_plane_funcs = {
>>>   	.update_plane	= drm_atomic_helper_update_plane,
>>>   	.disable_plane	= drm_atomic_helper_disable_plane,
>>> @@ -1419,6 +1489,10 @@ static const struct drm_plane_funcs dm_plane_funcs = {
>>>   	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
>>>   	.atomic_destroy_state = dm_drm_plane_destroy_state,
>>>   	.format_mod_supported = dm_plane_format_mod_supported,
>>> +#ifdef AMD_PRIVATE_COLOR
>>> +	.atomic_set_property = dm_atomic_plane_set_property,
>>> +	.atomic_get_property = dm_atomic_plane_get_property,
>>> +#endif
>>>   };
>>>   
>>>   int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>>> @@ -1489,6 +1563,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>>>   
>>>   	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
>>>   
>>> +#ifdef AMD_PRIVATE_COLOR
>>> +	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
>>> +#endif
>>>   	/* Create (reset) the plane state */
>>>   	if (plane->funcs->reset)
>>>   		plane->funcs->reset(plane);
>>


