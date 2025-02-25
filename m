Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E380EA43AA5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955A010E5F0;
	Tue, 25 Feb 2025 10:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e8+ooGRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CB810E5EA;
 Tue, 25 Feb 2025 10:05:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1C0241C15;
 Tue, 25 Feb 2025 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740477916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQoS9tgg0kdbJUF3ZP6hQuuP6W03DMmzzgqRLNTkEFI=;
 b=e8+ooGRdg6XQCsiuMWHvoFTXx7uMUH72gSIdGNBqueDVA17O5AC15bht4SNPusbNVNtla8
 TcHx2S38J0Ii0JmeUzyUNRS4z6NrLkKWHQCTA+r4wse1lzfA8wp1xfLHNlpLVgQDNEWlhZ
 Mfzuv0pqkz0DjFp6YzthDDj3GFrJFnyXxzW6saMtR9d0sEyywz0otIMr7f9qQSaJcndPP6
 oA1mM7YBuSXDtLRekuIG2N+sXIUSpyoYu3y2htFl0UO60SoY1XQn340fFrveZp4NA+6Pvt
 WBOk5IJVmNj/P7mLR6pC2JjcXMDTgTateBJBDMAia8NQIVbqndycbVe8lNgEXg==
Message-ID: <88e05040-b3c8-40b2-a703-74ccf65d8df0@bootlin.com>
Date: Tue, 25 Feb 2025 11:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 05/45] drm/colorop: Introduce new drm_colorop mode object
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-6-alex.hung@amd.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20241220043410.416867-6-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghlvgigrdhhuhhnghesrghmugdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopeifrgihlhgrnhguqdguvghvvghlsehlihhst
 hhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohephhgrrhhrhidrfigvnhhtlhgrnhgusegrmhgurdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 20/12/2024 à 05:33, Alex Hung a écrit :
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This patches introduces a new drm_colorop mode object. This
> object represents color transformations and can be used to
> define color pipelines.
> 
> We also introduce the drm_colorop_state here, as well as
> various helpers and state tracking bits.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v7:
>   - Fix checkpatch warnings and errors
>    - Add a tab to for_each_oldnew_colorop_in_state definition
>    - Change unsigned index to unsigned int index
>    - Fix a checkpatch warning - a new line after variable declaration
> 
> v6:
>   - Comment that properties validity depends on type (Louis Chauvet)
> 
> v5:
>   - Add comment to drm_atomic_state.colorops
>   - Replace a misplaced 'plane' with 'colorop' in comment
>   - Fix colorop_list kernel doc
>   - Add kernel doc for color_pipeline
>   - drop unused drm_colorop_destroy_state
>   - drop drm_colorop_init, to be introduced in later patch
>     when used
>   - Add kernel docs
>   - Drop TODOs
> 
> v4:
>   - Drop IOCTL definitions (Pekka)
>   - add missing declaration (Chaitanya Kumar Borah)
> 
> v3:
>   - Drop TODO for lock (it's handled in drm_modeset_drop_locks)
>     (Melissa)
>   - Don't get plane state when getting colorop state
>   - Make some functions static (kernel test robot)
> 
>   drivers/gpu/drm/Makefile            |   1 +
>   drivers/gpu/drm/drm_atomic.c        |  70 ++++++++++++
>   drivers/gpu/drm/drm_atomic_helper.c |  12 ++
>   drivers/gpu/drm/drm_atomic_uapi.c   |  48 ++++++++
>   drivers/gpu/drm/drm_colorop.c       | 104 +++++++++++++++++
>   drivers/gpu/drm/drm_mode_config.c   |   7 ++
>   include/drm/drm_atomic.h            |  89 +++++++++++++++
>   include/drm/drm_atomic_uapi.h       |   1 +
>   include/drm/drm_colorop.h           | 166 ++++++++++++++++++++++++++++
>   include/drm/drm_mode_config.h       |  18 +++
>   include/drm/drm_plane.h             |   8 ++
>   include/uapi/drm/drm_mode.h         |   1 +
>   12 files changed, 525 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_colorop.c
>   create mode 100644 include/drm/drm_colorop.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 784229d4504d..055f3e535d15 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -44,6 +44,7 @@ drm-y := \
>   	drm_client.o \
>   	drm_client_modeset.o \
>   	drm_color_mgmt.o \
> +	drm_colorop.o \
>   	drm_connector.o \
>   	drm_crtc.o \
>   	drm_displayid.o \
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 0fc99da93afe..327d906c48c5 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -42,6 +42,7 @@
>   #include <drm/drm_mode.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_writeback.h>
> +#include <drm/drm_colorop.h>
>   
>   #include "drm_crtc_internal.h"
>   #include "drm_internal.h"
> @@ -107,6 +108,7 @@ void drm_atomic_state_default_release(struct drm_atomic_state *state)
>   	kfree(state->connectors);
>   	kfree(state->crtcs);
>   	kfree(state->planes);
> +	kfree(state->colorops);
>   	kfree(state->private_objs);
>   }
>   EXPORT_SYMBOL(drm_atomic_state_default_release);
> @@ -138,6 +140,10 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
>   				sizeof(*state->planes), GFP_KERNEL);
>   	if (!state->planes)
>   		goto fail;
> +	state->colorops = kcalloc(dev->mode_config.num_colorop,
> +				  sizeof(*state->colorops), GFP_KERNEL);
> +	if (!state->colorops)
> +		goto fail;
>   
>   	/*
>   	 * Because drm_atomic_state can be committed asynchronously we need our
> @@ -249,6 +255,20 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   		state->planes[i].new_state = NULL;
>   	}
>   
> +	for (i = 0; i < config->num_colorop; i++) {
> +		struct drm_colorop *colorop = state->colorops[i].ptr;
> +
> +		if (!colorop)
> +			continue;
> +
> +		drm_colorop_atomic_destroy_state(colorop,
> +						 state->colorops[i].state);
> +		state->colorops[i].ptr = NULL;
> +		state->colorops[i].state = NULL;

There is no risk of use-after-free between the 
drm_colorop_atomic_destroy_state and the state->colorops[i].state?

> +		state->colorops[i].old_state = NULL;
> +		state->colorops[i].new_state = NULL;
> +	}
> +
>   	for (i = 0; i < state->num_private_objs; i++) {
>   		struct drm_private_obj *obj = state->private_objs[i].ptr;
>   
> @@ -568,6 +588,56 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>   }
>   EXPORT_SYMBOL(drm_atomic_get_plane_state);
>   
> +
> +/**
> + * drm_atomic_get_colorop_state - get colorop state
> + * @state: global atomic state object
> + * @colorop: colorop to get state object for
> + *
> + * This function returns the colorop state for the given colorop, allocating it
> + * if needed. It will also grab the relevant plane lock to make sure that the
> + * state is consistent.
> + *
> + * Returns:
> + *
> + * Either the allocated state or the error code encoded into the pointer. When
> + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> + * entire atomic sequence must be restarted. All other errors are fatal.
> + */
> +struct drm_colorop_state *
> +drm_atomic_get_colorop_state(struct drm_atomic_state *state,
> +			     struct drm_colorop *colorop)
> +{
> +	int ret, index = drm_colorop_index(colorop);
> +	struct drm_colorop_state *colorop_state;
> +
> +	WARN_ON(!state->acquire_ctx);
> +
> +	colorop_state = drm_atomic_get_existing_colorop_state(state, colorop);

You mark drm_atomic_get_existing_colorop_state in its definition, so I 
think we should avoid introducing new users of it.

> +	if (colorop_state)
> +		return colorop_state;
> +
> +	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
> +	if (!colorop_state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	state->colorops[index].state = colorop_state;
> +	state->colorops[index].ptr = colorop;
> +	state->colorops[index].old_state = colorop->state;
> +	state->colorops[index].new_state = colorop_state;
> +	colorop_state->state = state;
> +
> +	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
> +		       colorop->base.id, colorop_state, state);
> +
> +	return colorop_state;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_colorop_state);
> +
>   static bool
>   plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>   		     const struct drm_plane_state *new_plane_state)
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 43cdf39019a4..70ed524bb3c1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3022,6 +3022,8 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>   	struct drm_plane *plane;
>   	struct drm_plane_state *old_plane_state, *new_plane_state;
> +	struct drm_colorop *colorop;
> +	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
>   	struct drm_crtc_commit *commit;
>   	struct drm_private_obj *obj;
>   	struct drm_private_state *old_obj_state, *new_obj_state;
> @@ -3099,6 +3101,16 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>   		}
>   	}
>   
> +	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
> +		WARN_ON(colorop->state != old_colorop_state);
> +
> +		old_colorop_state->state = state;
> +		new_colorop_state->state = NULL;
> +
> +		state->colorops[i].state = old_colorop_state;
> +		colorop->state = new_colorop_state;
> +	}
> +
>   	drm_panic_lock(state->dev, flags);
>   	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>   		WARN_ON(plane->state != old_plane_state);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 7936c2023955..cfc1485b592e 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -34,6 +34,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_writeback.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_colorop.h>
>   
>   #include <linux/dma-fence.h>
>   #include <linux/uaccess.h>
> @@ -642,6 +643,26 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>   	return 0;
>   }
>   
> +
> +static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
> +		struct drm_colorop_state *state, struct drm_file *file_priv,
> +		struct drm_property *property, uint64_t val)
> +{
> +	drm_dbg_atomic(colorop->dev,
> +			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
> +			colorop->base.id,
> +			property->base.id, property->name);
> +	return -EINVAL;
> +}
> +
> +static int
> +drm_atomic_colorop_get_property(struct drm_colorop *colorop,
> +		const struct drm_colorop_state *state,
> +		struct drm_property *property, uint64_t *val)
> +{
> +	return -EINVAL;
> +}
> +
>   static int drm_atomic_set_writeback_fb_for_connector(
>   		struct drm_connector_state *conn_state,
>   		struct drm_framebuffer *fb)
> @@ -908,6 +929,16 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>   				plane->state, property, val);
>   		break;
>   	}
> +	case DRM_MODE_OBJECT_COLOROP: {
> +		struct drm_colorop *colorop = obj_to_colorop(obj);
> +
> +		if (colorop->plane)
> +			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
> +
> +		ret = drm_atomic_colorop_get_property(colorop,
> +				colorop->state, property, val);
> +		break;
> +	}
>   	default:
>   		drm_dbg_atomic(dev, "[OBJECT:%d] has no properties\n", obj->id);
>   		ret = -EINVAL;
> @@ -1084,6 +1115,23 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		ret = drm_atomic_plane_set_property(plane,
>   				plane_state, file_priv,
>   				prop, prop_value);
> +
> +		break;
> +	}
> +	case DRM_MODE_OBJECT_COLOROP: {
> +		struct drm_colorop *colorop = obj_to_colorop(obj);
> +		struct drm_colorop_state *colorop_state;
> +
> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +		if (IS_ERR(colorop_state)) {
> +			ret = PTR_ERR(colorop_state);
> +			break;
> +		}
> +
> +		ret = drm_atomic_colorop_set_property(colorop,
> +				colorop_state, file_priv,
> +				prop, prop_value);
> +
>   		break;
>   	}
>   	default:
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> new file mode 100644
> index 000000000000..d215e22c9d20
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
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
> + * Authors: AMD
> + *
> + */
> +
> +#include <drm/drm_colorop.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_plane.h>
> +
> +#include "drm_crtc_internal.h"
> +
> +static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
> +							struct drm_colorop_state *state)
> +{
> +	memcpy(state, colorop->state, sizeof(*state));
> +}
> +
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop)
> +{
> +	struct drm_colorop_state *state;
> +
> +	if (WARN_ON(!colorop->state))
> +		return NULL;
> +
> +	state = kmalloc(sizeof(*state), GFP_KERNEL);
> +	if (state)
> +		__drm_atomic_helper_colorop_duplicate_state(colorop, state);
> +
> +	return state;
> +}
> +
> +
> +void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
> +				      struct drm_colorop_state *state)
> +{
> +	kfree(state);
> +}
> +
> +/**
> + * __drm_colorop_state_reset - resets colorop state to default values
> + * @colorop_state: atomic colorop state, must not be NULL
> + * @colorop: colorop object, must not be NULL
> + *
> + * Initializes the newly allocated @colorop_state with default
> + * values. This is useful for drivers that subclass the CRTC state.
> + */
> +static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
> +				      struct drm_colorop *colorop)
> +{
> +	colorop_state->colorop = colorop;
> +}
> +
> +/**
> + * __drm_colorop_reset - reset state on colorop
> + * @colorop: drm colorop
> + * @colorop_state: colorop state to assign
> + *
> + * Initializes the newly allocated @colorop_state and assigns it to
> + * the &drm_crtc->state pointer of @colorop, usually required when
> + * initializing the drivers or when called from the &drm_colorop_funcs.reset
> + * hook.
> + *
> + * This is useful for drivers that subclass the colorop state.
> + */
> +static void __drm_colorop_reset(struct drm_colorop *colorop,
> +				struct drm_colorop_state *colorop_state)
> +{
> +	if (colorop_state)
> +		__drm_colorop_state_reset(colorop_state, colorop);
> +
> +	colorop->state = colorop_state;
> +}
> +
> +void drm_colorop_reset(struct drm_colorop *colorop)
> +{
> +	kfree(colorop->state);
> +	colorop->state = kzalloc(sizeof(*colorop->state), GFP_KERNEL);
> +
> +	if (colorop->state)
> +		__drm_colorop_reset(colorop, colorop->state);
> +}
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 37d2e0a4ef4b..f238a2f049b0 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -29,6 +29,7 @@
>   #include <drm/drm_managed.h>
>   #include <drm/drm_mode_config.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_colorop.h>
>   #include <linux/dma-resv.h>
>   
>   #include "drm_crtc_internal.h"
> @@ -182,11 +183,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>   void drm_mode_config_reset(struct drm_device *dev)
>   {
>   	struct drm_crtc *crtc;
> +	struct drm_colorop *colorop;
>   	struct drm_plane *plane;
>   	struct drm_encoder *encoder;
>   	struct drm_connector *connector;
>   	struct drm_connector_list_iter conn_iter;
>   
> +	drm_for_each_colorop(colorop, dev)
> +		drm_colorop_reset(colorop);
> +
>   	drm_for_each_plane(plane, dev)
>   		if (plane->funcs->reset)
>   			plane->funcs->reset(plane);
> @@ -420,6 +425,7 @@ int drmm_mode_config_init(struct drm_device *dev)
>   	INIT_LIST_HEAD(&dev->mode_config.property_list);
>   	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
>   	INIT_LIST_HEAD(&dev->mode_config.plane_list);
> +	INIT_LIST_HEAD(&dev->mode_config.colorop_list);
>   	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
>   	idr_init_base(&dev->mode_config.object_idr, 1);
>   	idr_init_base(&dev->mode_config.tile_idr, 1);
> @@ -441,6 +447,7 @@ int drmm_mode_config_init(struct drm_device *dev)
>   	dev->mode_config.num_crtc = 0;
>   	dev->mode_config.num_encoder = 0;
>   	dev->mode_config.num_total_plane = 0;
> +	dev->mode_config.num_colorop = 0;
>   
>   	if (IS_ENABLED(CONFIG_LOCKDEP)) {
>   		struct drm_modeset_acquire_ctx modeset_ctx;
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 31ca88deb10d..effd9302c979 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -30,6 +30,7 @@
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_util.h>
> +#include <drm/drm_colorop.h>
>   
>   /**
>    * struct drm_crtc_commit - track modeset commits on a CRTC
> @@ -157,6 +158,11 @@ struct drm_crtc_commit {
>   	bool abort_completion;
>   };
>   
> +struct __drm_colorops_state {
> +	struct drm_colorop *ptr;
> +	struct drm_colorop_state *state, *old_state, *new_state;
> +};
> +
>   struct __drm_planes_state {
>   	struct drm_plane *ptr;
>   	struct drm_plane_state *state, *old_state, *new_state;
> @@ -408,6 +414,14 @@ struct drm_atomic_state {
>   	 */
>   	bool duplicated : 1;
>   
> +	/**
> +	 * @colorops:
> +	 *
> +	 * Pointer to array of @drm_colorop and @drm_colorop_state part of this
> +	 * update.
> +	 */
> +	struct __drm_colorops_state *colorops;
> +
>   	/**
>   	 * @planes:
>   	 *
> @@ -549,6 +563,9 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
>   struct drm_plane_state * __must_check
>   drm_atomic_get_plane_state(struct drm_atomic_state *state,
>   			   struct drm_plane *plane);
> +struct drm_colorop_state *
> +drm_atomic_get_colorop_state(struct drm_atomic_state *state,
> +			     struct drm_colorop *colorop);
>   struct drm_connector_state * __must_check
>   drm_atomic_get_connector_state(struct drm_atomic_state *state,
>   			       struct drm_connector *connector);
> @@ -678,6 +695,55 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
>   	return state->planes[drm_plane_index(plane)].new_state;
>   }
>   
> +
> +/**
> + * drm_atomic_get_existing_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the colorop state for the given colorop, or NULL
> + * if the colorop is not part of the global atomic state.
> + *
> + * This function is deprecated, @drm_atomic_get_old_colorop_state or
> + * @drm_atomic_get_new_colorop_state should be used instead.

Why do you introduce a deprecated function? The whole thing is new, 
maybe we can avoid already-deprecated functions?

Thanks,
Louis Chauvet

[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

