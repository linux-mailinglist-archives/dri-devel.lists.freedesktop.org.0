Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43988BC57BA
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1E10E10C;
	Wed,  8 Oct 2025 14:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="b5JqS97B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vcb6DCWP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b5JqS97B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vcb6DCWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E64510E83F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:52:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 435252287B;
 Wed,  8 Oct 2025 14:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759935174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5l6ewx0LD4liyPw0UK3BLhD78N8rKtYZoj3ikbPCqCQ=;
 b=b5JqS97B7PVmaPQixhSDJ8Clity8t6RIgmxnBpNw241E5ts5+l8xoY+jYSrvM09VkQCr52
 eNMYVnu5edEVS0nMAS3cb7DDdiw0ti3OUcIHqIejLLOCx1LTP2GSEMXsIt8DfVGK7fIwEb
 p4w+1WYLbUhMI5gqnAc534HEF+s/XQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759935174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5l6ewx0LD4liyPw0UK3BLhD78N8rKtYZoj3ikbPCqCQ=;
 b=vcb6DCWPJU4b5BrEvZMpqOI11698GUojFLTiw7AnTFR7SG3zmgayaJPoCpvvmYrmu0QMlo
 wRQ9ma5+oyl9kgAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759935174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5l6ewx0LD4liyPw0UK3BLhD78N8rKtYZoj3ikbPCqCQ=;
 b=b5JqS97B7PVmaPQixhSDJ8Clity8t6RIgmxnBpNw241E5ts5+l8xoY+jYSrvM09VkQCr52
 eNMYVnu5edEVS0nMAS3cb7DDdiw0ti3OUcIHqIejLLOCx1LTP2GSEMXsIt8DfVGK7fIwEb
 p4w+1WYLbUhMI5gqnAc534HEF+s/XQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759935174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5l6ewx0LD4liyPw0UK3BLhD78N8rKtYZoj3ikbPCqCQ=;
 b=vcb6DCWPJU4b5BrEvZMpqOI11698GUojFLTiw7AnTFR7SG3zmgayaJPoCpvvmYrmu0QMlo
 wRQ9ma5+oyl9kgAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D885313A96;
 Wed,  8 Oct 2025 14:52:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2mwuM8V65mjlbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Oct 2025 14:52:53 +0000
Message-ID: <b1601f73-3ce5-4f29-a20d-1920be935e0f@suse.de>
Date: Wed, 8 Oct 2025 16:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/atomic: Change state pointers to a more meaningful
 name
To: Maxime Ripard <mripard@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251008-drm-rename-state-v2-1-49b490b2676a@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20251008-drm-rename-state-v2-1-49b490b2676a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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



Am 08.10.25 um 15:11 schrieb Maxime Ripard:
> The state pointer found in the struct drm_atomic_state internals for
> most object is a bit ambiguous, and confusing when those internals also
> have old state and new state.
>
> After the recent cleanups, the state pointer only use is to point to the
> state we need to free when destroying the atomic state.
>
> We can thus rename it something less ambiguous, and hopefully more
> meaningful.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> Changes in v2:
> - Switch from freeable_state to state_to_destroy
> - Link to v1: https://lore.kernel.org/r/20251006-drm-rename-state-v1-1-5b7c4154772b@kernel.org
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++--
>   drivers/gpu/drm/drm_atomic.c                      | 24 +++++++++++------------
>   drivers/gpu/drm/drm_atomic_helper.c               |  8 ++++----
>   include/drm/drm_atomic.h                          | 16 +++++++--------
>   4 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 62defeccbb5ca09c89523fc4112d2085bbdbb0a9..275e237c1058b76640c8dd36443b034c6c71f84f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -12335,22 +12335,22 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>   
>   			if (obj->funcs == adev->dm.atomic_obj.funcs) {
>   				int j = state->num_private_objs-1;
>   
>   				dm_atomic_destroy_state(obj,
> -						state->private_objs[i].state);
> +						state->private_objs[i].state_to_destroy);
>   
>   				/* If i is not at the end of the array then the
>   				 * last element needs to be moved to where i was
>   				 * before the array can safely be truncated.
>   				 */
>   				if (i != j)
>   					state->private_objs[i] =
>   						state->private_objs[j];
>   
>   				state->private_objs[j].ptr = NULL;
> -				state->private_objs[j].state = NULL;
> +				state->private_objs[j].state_to_destroy = NULL;
>   				state->private_objs[j].old_state = NULL;
>   				state->private_objs[j].new_state = NULL;
>   
>   				state->num_private_objs = j;
>   				break;
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 0fda567c390057b10bce691d9ddc11308088d92e..be2cb6e43cb07fbe553d1ab875911253be628d1a 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -205,13 +205,13 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   
>   		if (!connector)
>   			continue;
>   
>   		connector->funcs->atomic_destroy_state(connector,
> -						       state->connectors[i].state);
> +						       state->connectors[i].state_to_destroy);
>   		state->connectors[i].ptr = NULL;
> -		state->connectors[i].state = NULL;
> +		state->connectors[i].state_to_destroy = NULL;
>   		state->connectors[i].old_state = NULL;
>   		state->connectors[i].new_state = NULL;
>   		drm_connector_put(connector);
>   	}
>   
> @@ -220,14 +220,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   
>   		if (!crtc)
>   			continue;
>   
>   		crtc->funcs->atomic_destroy_state(crtc,
> -						  state->crtcs[i].state);
> +						  state->crtcs[i].state_to_destroy);
>   
>   		state->crtcs[i].ptr = NULL;
> -		state->crtcs[i].state = NULL;
> +		state->crtcs[i].state_to_destroy = NULL;
>   		state->crtcs[i].old_state = NULL;
>   		state->crtcs[i].new_state = NULL;
>   
>   		if (state->crtcs[i].commit) {
>   			drm_crtc_commit_put(state->crtcs[i].commit);
> @@ -240,24 +240,24 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   
>   		if (!plane)
>   			continue;
>   
>   		plane->funcs->atomic_destroy_state(plane,
> -						   state->planes[i].state);
> +						   state->planes[i].state_to_destroy);
>   		state->planes[i].ptr = NULL;
> -		state->planes[i].state = NULL;
> +		state->planes[i].state_to_destroy = NULL;
>   		state->planes[i].old_state = NULL;
>   		state->planes[i].new_state = NULL;
>   	}
>   
>   	for (i = 0; i < state->num_private_objs; i++) {
>   		struct drm_private_obj *obj = state->private_objs[i].ptr;
>   
>   		obj->funcs->atomic_destroy_state(obj,
> -						 state->private_objs[i].state);
> +						 state->private_objs[i].state_to_destroy);
>   		state->private_objs[i].ptr = NULL;
> -		state->private_objs[i].state = NULL;
> +		state->private_objs[i].state_to_destroy = NULL;
>   		state->private_objs[i].old_state = NULL;
>   		state->private_objs[i].new_state = NULL;
>   	}
>   	state->num_private_objs = 0;
>   
> @@ -359,11 +359,11 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
>   
>   	crtc_state = crtc->funcs->atomic_duplicate_state(crtc);
>   	if (!crtc_state)
>   		return ERR_PTR(-ENOMEM);
>   
> -	state->crtcs[index].state = crtc_state;
> +	state->crtcs[index].state_to_destroy = crtc_state;
>   	state->crtcs[index].old_state = crtc->state;
>   	state->crtcs[index].new_state = crtc_state;
>   	state->crtcs[index].ptr = crtc;
>   	crtc_state->state = state;
>   
> @@ -544,11 +544,11 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>   
>   	plane_state = plane->funcs->atomic_duplicate_state(plane);
>   	if (!plane_state)
>   		return ERR_PTR(-ENOMEM);
>   
> -	state->planes[index].state = plane_state;
> +	state->planes[index].state_to_destroy = plane_state;
>   	state->planes[index].ptr = plane;
>   	state->planes[index].old_state = plane->state;
>   	state->planes[index].new_state = plane_state;
>   	plane_state->state = state;
>   
> @@ -856,11 +856,11 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
>   
>   	obj_state = obj->funcs->atomic_duplicate_state(obj);
>   	if (!obj_state)
>   		return ERR_PTR(-ENOMEM);
>   
> -	state->private_objs[index].state = obj_state;
> +	state->private_objs[index].state_to_destroy = obj_state;
>   	state->private_objs[index].old_state = obj->state;
>   	state->private_objs[index].new_state = obj_state;
>   	state->private_objs[index].ptr = obj;
>   	obj_state->state = state;
>   
> @@ -1159,11 +1159,11 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>   	connector_state = connector->funcs->atomic_duplicate_state(connector);
>   	if (!connector_state)
>   		return ERR_PTR(-ENOMEM);
>   
>   	drm_connector_get(connector);
> -	state->connectors[index].state = connector_state;
> +	state->connectors[index].state_to_destroy = connector_state;
>   	state->connectors[index].old_state = connector->state;
>   	state->connectors[index].new_state = connector_state;
>   	state->connectors[index].ptr = connector;
>   	connector_state->state = state;
>   
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d5ebe6ea0acbc5a08aef7fa41ecb9ed5d8fa8e80..5a473a274ff06d7ab83039e0a6328e1372b80a00 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3234,21 +3234,21 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>   		WARN_ON(connector->state != old_conn_state);
>   
>   		old_conn_state->state = state;
>   		new_conn_state->state = NULL;
>   
> -		state->connectors[i].state = old_conn_state;
> +		state->connectors[i].state_to_destroy = old_conn_state;
>   		connector->state = new_conn_state;
>   	}
>   
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>   		WARN_ON(crtc->state != old_crtc_state);
>   
>   		old_crtc_state->state = state;
>   		new_crtc_state->state = NULL;
>   
> -		state->crtcs[i].state = old_crtc_state;
> +		state->crtcs[i].state_to_destroy = old_crtc_state;
>   		crtc->state = new_crtc_state;
>   
>   		if (new_crtc_state->commit) {
>   			spin_lock(&crtc->commit_lock);
>   			list_add(&new_crtc_state->commit->commit_entry,
> @@ -3264,22 +3264,22 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>   		WARN_ON(plane->state != old_plane_state);
>   
>   		old_plane_state->state = state;
>   		new_plane_state->state = NULL;
>   
> -		state->planes[i].state = old_plane_state;
> +		state->planes[i].state_to_destroy = old_plane_state;
>   		plane->state = new_plane_state;
>   	}
>   	drm_panic_unlock(state->dev, flags);
>   
>   	for_each_oldnew_private_obj_in_state(state, obj, old_obj_state, new_obj_state, i) {
>   		WARN_ON(obj->state != old_obj_state);
>   
>   		old_obj_state->state = state;
>   		new_obj_state->state = NULL;
>   
> -		state->private_objs[i].state = old_obj_state;
> +		state->private_objs[i].state_to_destroy = old_obj_state;
>   		obj->state = new_obj_state;
>   	}
>   
>   	return 0;
>   }
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index c8ab2163bf658cd06b12a8dabada7c088a328654..155e82f87e4d47161475b57fc28762d7ba8fd206 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -159,11 +159,11 @@ struct drm_crtc_commit {
>   
>   struct __drm_planes_state {
>   	struct drm_plane *ptr;
>   
>   	/**
> -	 * @state:
> +	 * @state_to_destroy:
>   	 *
>   	 * Used to track the @drm_plane_state we will need to free when
>   	 * tearing down the associated &drm_atomic_state in
>   	 * $drm_mode_config_funcs.atomic_state_clear or
>   	 * drm_atomic_state_default_clear().
> @@ -171,20 +171,20 @@ struct __drm_planes_state {
>   	 * Before a commit, and the call to
>   	 * drm_atomic_helper_swap_state() in particular, it points to
>   	 * the same state than @new_state. After a commit, it points to
>   	 * the same state than @old_state.
>   	 */
> -	struct drm_plane_state *state;
> +	struct drm_plane_state *state_to_destroy;
>   
>   	struct drm_plane_state *old_state, *new_state;
>   };
>   
>   struct __drm_crtcs_state {
>   	struct drm_crtc *ptr;
>   
>   	/**
> -	 * @state:
> +	 * @state_to_destroy:
>   	 *
>   	 * Used to track the @drm_crtc_state we will need to free when
>   	 * tearing down the associated &drm_atomic_state in
>   	 * $drm_mode_config_funcs.atomic_state_clear or
>   	 * drm_atomic_state_default_clear().
> @@ -192,11 +192,11 @@ struct __drm_crtcs_state {
>   	 * Before a commit, and the call to
>   	 * drm_atomic_helper_swap_state() in particular, it points to
>   	 * the same state than @new_state. After a commit, it points to
>   	 * the same state than @old_state.
>   	 */
> -	struct drm_crtc_state *state;
> +	struct drm_crtc_state *state_to_destroy;
>   
>   	struct drm_crtc_state *old_state, *new_state;
>   
>   	/**
>   	 * @commit:
> @@ -214,11 +214,11 @@ struct __drm_crtcs_state {
>   
>   struct __drm_connnectors_state {
>   	struct drm_connector *ptr;
>   
>   	/**
> -	 * @state:
> +	 * @state_to_destroy:
>   	 *
>   	 * Used to track the @drm_connector_state we will need to free
>   	 * when tearing down the associated &drm_atomic_state in
>   	 * $drm_mode_config_funcs.atomic_state_clear or
>   	 * drm_atomic_state_default_clear().
> @@ -226,11 +226,11 @@ struct __drm_connnectors_state {
>   	 * Before a commit, and the call to
>   	 * drm_atomic_helper_swap_state() in particular, it points to
>   	 * the same state than @new_state. After a commit, it points to
>   	 * the same state than @old_state.
>   	 */
> -	struct drm_connector_state *state;
> +	struct drm_connector_state *state_to_destroy;
>   
>   	struct drm_connector_state *old_state, *new_state;
>   
>   	/**
>   	 * @out_fence_ptr:
> @@ -391,11 +391,11 @@ struct drm_private_state {
>   
>   struct __drm_private_objs_state {
>   	struct drm_private_obj *ptr;
>   
>   	/**
> -	 * @state:
> +	 * @state_to_destroy:
>   	 *
>   	 * Used to track the @drm_private_state we will need to free
>   	 * when tearing down the associated &drm_atomic_state in
>   	 * $drm_mode_config_funcs.atomic_state_clear or
>   	 * drm_atomic_state_default_clear().
> @@ -403,11 +403,11 @@ struct __drm_private_objs_state {
>   	 * Before a commit, and the call to
>   	 * drm_atomic_helper_swap_state() in particular, it points to
>   	 * the same state than @new_state. After a commit, it points to
>   	 * the same state than @old_state.
>   	 */
> -	struct drm_private_state *state;
> +	struct drm_private_state *state_to_destroy;
>   
>   	struct drm_private_state *old_state, *new_state;
>   };
>   
>   /**
>
> ---
> base-commit: 7a031e8d3528ba0860d282ffd3c88fbda4bf8c4c
> change-id: 20251006-drm-rename-state-b2b0fed05f82
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


