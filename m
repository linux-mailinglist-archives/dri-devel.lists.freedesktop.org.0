Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142AB6111A2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A23010E81D;
	Fri, 28 Oct 2022 12:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2593510E81D;
 Fri, 28 Oct 2022 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7tja3LnZhdf+VqmgOUUf2d7+aTdwEAem7d1KgYKMcvg=; b=QBPpgjFSGUTArP+Tlx0ZjXrp+7
 FFW2Tnep60LvrfIkAtKxJ+xTraRBTe4Tqdq9iyk5xfS4Yrrylay9eUlu/rfYYB/OskbbSFTQj30tX
 6iqpnPyVHpwR7jUvmPJgOt/x4doNhUtQYMBY2M3R5L9iJgqw26ufijmdXilUR96ysZNHOUw6kg+09
 xbzlZnV6PQqok2NgH8tvSDXMEvmx6sePkBGx5xXCfm04d9dGFhQeOQO3vJfn2fhEN2mcLJoMSvU2x
 wac1Z8XGAndkIuA0ucMoUK7RS6PV1BKG9ZshnXpeCYTyLEy+Cox5AVcqmNGMEuydAPDi/sg0Qhvja
 Vk4Whf5Q==;
Received: from [179.228.14.96] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ooObJ-0079fd-ET; Fri, 28 Oct 2022 14:36:41 +0200
Message-ID: <24811067-45d0-5305-34ff-86eb5e7e50cc@igalia.com>
Date: Fri, 28 Oct 2022 09:36:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
To: Simon Ser <contact@emersion.fr>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com>
 <PJIfCPDOH8tzwE1mwv58g4ICBZbEgW44vwzW-JdUde6PjLDUeF_JNT0kUZ_Z8hZWqii_DTdDFfAYpRbO_T1Tu28wpjiwYlQpRdsrHJXLF58=@emersion.fr>
Content-Language: en-US
In-Reply-To: <PJIfCPDOH8tzwE1mwv58g4ICBZbEgW44vwzW-JdUde6PjLDUeF_JNT0kUZ_Z8hZWqii_DTdDFfAYpRbO_T1Tu28wpjiwYlQpRdsrHJXLF58=@emersion.fr>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, joshua@froggi.es, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/22 13:02, Simon Ser wrote:
>>>> So no tests that actually verify that the kernel properly rejects
>>>> stuff stuff like modesets, gamma LUT updates, plane movement,
>>>> etc.?
>>>
>>> Pondering this a bit more, it just occurred to me the current driver
>>> level checks might easily lead to confusing behaviour. Eg. is
>>> the ioctl going to succeed if you ask for an async change of some
>>> random property while the crtc disabled, but fails if you ask for
>>> the same async property change when the crtc is active?
>>>
>>> So another reason why rejecting most properties already at
>>> the uapi level might be a good idea.
>>
>> And just to be clear this is pretty much what I suggest:
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 79730fa1dd8e..471a2c703847 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1392,6 +1392,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   				goto out;
>>   			}
>>
>> +			if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC &&
>> +			    prop != dev->mode_config.prop_fb_id) {
>> +				drm_mode_object_put(obj);
>> +				ret = -EINVAL;
>> +				goto out;
>> +			}
>> +
>>   			if (copy_from_user(&prop_value,
>>   					   prop_values_ptr + copied_props,
>>   					   sizeof(prop_value))) {
>>
>>
>> That would actively discourage people from even attempting the
>> "just dump all the state into the ioctl" approach with async flips
>> since even the props whose value isn't even changing would be rejected.
> 
> How does this sound?
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 945761968428..ffd16bdc7b83 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -972,14 +972,26 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   			    struct drm_file *file_priv,
>   			    struct drm_mode_object *obj,
>   			    struct drm_property *prop,
> -			    uint64_t prop_value)
> +			    uint64_t prop_value,
> +			    bool async_flip)
>   {
>   	struct drm_mode_object *ref;
>   	int ret;
> +	uint64_t old_val;
>   
>   	if (!drm_property_change_valid_get(prop, prop_value, &ref))
>   		return -EINVAL;
>   
> +	if (async_flip && prop != prop->dev->mode_config.prop_fb_id) {
> +		ret = drm_atomic_get_property(obj, prop, &old_val);
> +		if (ret != 0 || old_val != prop_value) {
> +			drm_dbg_atomic(prop->dev,
> +				       "[PROP:%d:%s] cannot be changed during async flip\n",
> +				       prop->base.id, prop->name);
> +			return -EINVAL;
> +		}
> +	}
> +
>   	switch (obj->type) {
>   	case DRM_MODE_OBJECT_CONNECTOR: {
>   		struct drm_connector *connector = obj_to_connector(obj);


drm_atomic_get_property() needs the object lock to be used, so we need 
to check the property inside the switch-case like this:

-- >8 --

 From f3ee5a1163bfe5a88109d7084208940fe5566967 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Date: Thu, 27 Oct 2022 17:23:09 -0300
Subject: [PATCH] drm: Check for prop changes in atomic async flip
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No prop changes are allowed during an async flip via atomic DRM API, so
make sure to reject them.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
  drivers/gpu/drm/drm_atomic_uapi.c   | 47 +++++++++++++++++++++++++++--
  drivers/gpu/drm/drm_crtc_internal.h |  2 +-
  drivers/gpu/drm/drm_mode_object.c   |  2 +-
  3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
b/drivers/gpu/drm/drm_atomic_uapi.c
index ee24ed7e2edb..f63f23305621 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -964,13 +964,28 @@ int drm_atomic_connector_commit_dpms(struct 
drm_atomic_state *state,
  	return ret;
  }

+static bool drm_atomic_check_prop_changes(int ret, uint64_t old_val, 
uint64_t prop_value,
+				  struct drm_property *prop)
+{
+	if (ret != 0 || old_val != prop_value) {
+		drm_dbg_atomic(prop->dev,
+			       "[PROP:%d:%s] No prop can be changed during async flip\n",
+			       prop->base.id, prop->name);
+		return true;
+	}
+
+	return false;
+}
+
  int drm_atomic_set_property(struct drm_atomic_state *state,
  			    struct drm_file *file_priv,
  			    struct drm_mode_object *obj,
  			    struct drm_property *prop,
-			    uint64_t prop_value)
+			    uint64_t prop_value,
+			    bool async_flip)
  {
  	struct drm_mode_object *ref;
+	uint64_t old_val;
  	int ret;

  	if (!drm_property_change_valid_get(prop, prop_value, &ref))
@@ -987,6 +1002,15 @@ int drm_atomic_set_property(struct 
drm_atomic_state *state,
  			break;
  		}

+		if (async_flip) {
+			ret = drm_atomic_connector_get_property(connector, connector_state,
+					prop, &old_val);
+			if (drm_atomic_check_prop_changes(ret, old_val, prop_value, prop)) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+
  		ret = drm_atomic_connector_set_property(connector,
  				connector_state, file_priv,
  				prop, prop_value);
@@ -1002,6 +1026,14 @@ int drm_atomic_set_property(struct 
drm_atomic_state *state,
  			break;
  		}

+		if (async_flip) {
+			ret = drm_atomic_crtc_get_property(crtc, crtc_state, prop, &old_val);
+			if (drm_atomic_check_prop_changes(ret, old_val, prop_value, prop)) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+
  		ret = drm_atomic_crtc_set_property(crtc,
  				crtc_state, prop, prop_value);
  		break;
@@ -1016,6 +1048,14 @@ int drm_atomic_set_property(struct 
drm_atomic_state *state,
  			break;
  		}

+		if (async_flip && prop != prop->dev->mode_config.prop_fb_id) {
+			ret = drm_atomic_plane_get_property(plane, plane_state, prop, &old_val);
+			if (drm_atomic_check_prop_changes(ret, old_val, prop_value, prop)) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+
  		ret = drm_atomic_plane_set_property(plane,
  				plane_state, file_priv,
  				prop, prop_value);
@@ -1304,6 +1344,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
  	struct drm_out_fence_state *fence_state;
  	int ret = 0;
  	unsigned int i, j, num_fences;
+	bool async = false;

  	/* disallow for drivers not supporting atomic: */
  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1340,6 +1381,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
  				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported with 
atomic\n");
  			return -EINVAL;
  		}
+
+		async = true;
  	}

  	/* can't test and expect an event at the same time. */
@@ -1420,7 +1463,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
  			}

  			ret = drm_atomic_set_property(state, file_priv,
-						      obj, prop, prop_value);
+						      obj, prop, prop_value, async);
  			if (ret) {
  				drm_mode_object_put(obj);
  				goto out;
diff --git a/drivers/gpu/drm/drm_crtc_internal.h 
b/drivers/gpu/drm/drm_crtc_internal.h
index 56041b604881..42ff11706fd4 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -250,7 +250,7 @@ int drm_atomic_set_property(struct drm_atomic_state 
*state,
  			    struct drm_file *file_priv,
  			    struct drm_mode_object *obj,
  			    struct drm_property *prop,
-			    uint64_t prop_value);
+			    uint64_t prop_value, bool async_flip);
  int drm_atomic_get_property(struct drm_mode_object *obj,
  			    struct drm_property *property, uint64_t *val);

diff --git a/drivers/gpu/drm/drm_mode_object.c 
b/drivers/gpu/drm/drm_mode_object.c
index ba1608effc0f..64f519254895 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -536,7 +536,7 @@ static int set_property_atomic(struct 
drm_mode_object *obj,
  						       obj_to_connector(obj),
  						       prop_value);
  	} else {
-		ret = drm_atomic_set_property(state, file_priv, obj, prop, prop_value);
+		ret = drm_atomic_set_property(state, file_priv, obj, prop, 
prop_value, false);
  		if (ret)
  			goto out;
  		ret = drm_atomic_commit(state);
-- 
2.37.3



