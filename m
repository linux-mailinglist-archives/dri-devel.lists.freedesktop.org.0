Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1CCF7075
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 08:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0726F10E477;
	Tue,  6 Jan 2026 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oE6SUWZF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="735YvuS6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DK7pTUYA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VB2wZ5VD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A849910E420
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 07:24:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CFF1338AC;
 Tue,  6 Jan 2026 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767684296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Gejg6SFCMYekzdpmtlGa8VBnXLE4f7CBwrYtpFUZckk=;
 b=oE6SUWZFTQnfi0ZurnSpi4LIUvc8KS4dT/w1CxjDQKu2/neNwaUOSGKZYUrTevGIZNxQQv
 5Cemwt1Gdf8FSM5dIXY/LrLMrsfHBrHv/0zC5XgZsdZyjErh7tyZR7LWKPqaHyz24oE4Eo
 lZKgKh6Cw+w0azKj5OaAeNM0kOGNj8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767684296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Gejg6SFCMYekzdpmtlGa8VBnXLE4f7CBwrYtpFUZckk=;
 b=735YvuS67pAVrJjSAOjxtqaeBO78FHJf8aZ4xkLOPQKjvxxUUWChUcxYGow17OMua+tf9Y
 F9T3ZV3Q/KkTERCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DK7pTUYA;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VB2wZ5VD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767684295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Gejg6SFCMYekzdpmtlGa8VBnXLE4f7CBwrYtpFUZckk=;
 b=DK7pTUYAPBbT8tD/LUcSvCk2VkH89JBp4/am3Xl0K5Ucnq1qg6JMHdivYtZnocs4rC4BGz
 FADZKxQLdxY48xLup26j9Aar8VyHroNiqroPhR/jC6apm4wa3ci1oFpQs/6Emd+P6CcVGe
 eXxIKZaR03ajcTw73slSUJWc9xUUww4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767684295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Gejg6SFCMYekzdpmtlGa8VBnXLE4f7CBwrYtpFUZckk=;
 b=VB2wZ5VD94OGrxiIOsS4bITjz3MH/x1qk7SAu0w6kNTmv8NWkAxSPFyfbMOPWidy2eXHOM
 PSMY5qH3GaY0EgAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3D353EA63;
 Tue,  6 Jan 2026 07:24:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ek9gLsa4XGkufAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jan 2026 07:24:54 +0000
Message-ID: <f13b0ddd-747f-432d-bab2-5b63bb830f89@suse.de>
Date: Tue, 6 Jan 2026 08:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/atomic: add max_size check to
 drm_property_replace_blob_from_id()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
 <20260106-drm-fix-lut-checks-v3-2-f7f979eb73c8@oss.qualcomm.com>
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
In-Reply-To: <20260106-drm-fix-lut-checks-v3-2-f7f979eb73c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 2CFF1338AC
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com,igalia.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,suse.de:dkim,suse.de:email,qualcomm.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 
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



Am 06.01.26 um 04:09 schrieb Dmitry Baryshkov:
> The function drm_property_replace_blob_from_id() allows checking whether
> the blob size is equal to a predefined value. In case of variable-size
> properties (like the gamma / degamma LUTs) we might want to check for
> the blob size against the maximum, allowing properties of the size
> lesser than the max supported by the hardware. Extend the function in
> order to support such checks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 18 +++++++++---------
>   drivers/gpu/drm/drm_atomic_uapi.c                      | 14 ++++++--------
>   drivers/gpu/drm/drm_property.c                         | 11 +++++++++++
>   include/drm/drm_property.h                             |  1 +
>   4 files changed, 27 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 2e3ee78999d9..8c5912b59e19 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1676,8 +1676,8 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>   	if (property == adev->mode_info.plane_degamma_lut_property) {
>   		ret = drm_property_replace_blob_from_id(plane->dev,
>   							&dm_plane_state->degamma_lut,
> -							val, -1,
> -							sizeof(struct drm_color_lut),
> +							val,
> +							-1, -1, sizeof(struct drm_color_lut),
>   							&replaced);
>   		dm_plane_state->base.color_mgmt_changed |= replaced;
>   		return ret;
> @@ -1695,15 +1695,15 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>   		ret = drm_property_replace_blob_from_id(plane->dev,
>   							&dm_plane_state->ctm,
>   							val,
> -							sizeof(struct drm_color_ctm_3x4), -1,
> +							-1, sizeof(struct drm_color_ctm_3x4), -1,
>   							&replaced);
>   		dm_plane_state->base.color_mgmt_changed |= replaced;
>   		return ret;
>   	} else if (property == adev->mode_info.plane_shaper_lut_property) {
>   		ret = drm_property_replace_blob_from_id(plane->dev,
>   							&dm_plane_state->shaper_lut,
> -							val, -1,
> -							sizeof(struct drm_color_lut),
> +							val,
> +							-1, -1, sizeof(struct drm_color_lut),
>   							&replaced);
>   		dm_plane_state->base.color_mgmt_changed |= replaced;
>   		return ret;
> @@ -1715,16 +1715,16 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>   	} else if (property == adev->mode_info.plane_lut3d_property) {
>   		ret = drm_property_replace_blob_from_id(plane->dev,
>   							&dm_plane_state->lut3d,
> -							val, -1,
> -							sizeof(struct drm_color_lut),
> +							val,
> +							-1, -1, sizeof(struct drm_color_lut),
>   							&replaced);
>   		dm_plane_state->base.color_mgmt_changed |= replaced;
>   		return ret;
>   	} else if (property == adev->mode_info.plane_blend_lut_property) {
>   		ret = drm_property_replace_blob_from_id(plane->dev,
>   							&dm_plane_state->blend_lut,
> -							val, -1,
> -							sizeof(struct drm_color_lut),
> +							val,
> +							-1, -1, sizeof(struct drm_color_lut),
>   							&replaced);
>   		dm_plane_state->base.color_mgmt_changed |= replaced;
>   		return ret;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 7320db4b8489..dff1fdefcbeb 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -416,7 +416,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->degamma_lut,
>   					val,
> -					-1, sizeof(struct drm_color_lut),
> +					-1, -1, sizeof(struct drm_color_lut),
>   					&replaced);
>   		state->color_mgmt_changed |= replaced;
>   		return ret;
> @@ -424,7 +424,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->ctm,
>   					val,
> -					sizeof(struct drm_color_ctm), -1,
> +					-1, sizeof(struct drm_color_ctm), -1,
>   					&replaced);
>   		state->color_mgmt_changed |= replaced;
>   		return ret;
> @@ -432,7 +432,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->gamma_lut,
>   					val,
> -					-1, sizeof(struct drm_color_lut),
> +					-1, -1, sizeof(struct drm_color_lut),
>   					&replaced);
>   		state->color_mgmt_changed |= replaced;
>   		return ret;
> @@ -587,8 +587,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->fb_damage_clips,
>   					val,
> -					-1,
> -					sizeof(struct drm_mode_rect),
> +					-1, -1, sizeof(struct drm_mode_rect),
>   					&replaced);
>   		return ret;
>   	} else if (property == plane->scaling_filter_property) {
> @@ -717,8 +716,7 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>   	return drm_property_replace_blob_from_id(colorop->dev,
>   						 &state->data,
>   						 val,
> -						 size,
> -						 elem_size,
> +						 -1, size, elem_size,
>   						 &replaced);
>   }
>   
> @@ -876,7 +874,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>   		ret = drm_property_replace_blob_from_id(dev,
>   				&state->hdr_output_metadata,
>   				val,
> -				sizeof(struct hdr_output_metadata), -1,
> +				-1, sizeof(struct hdr_output_metadata), -1,
>   				&replaced);
>   		return ret;
>   	} else if (property == config->aspect_ratio_property) {
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index 596272149a35..955fa960843b 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -757,6 +757,7 @@ EXPORT_SYMBOL(drm_property_replace_blob);
>    * @dev: DRM device
>    * @blob: a pointer to the member blob to be replaced
>    * @blob_id: the id of the new blob to replace with
> + * @max_size: the maximum size of the blob property for variable-size blobs
>    * @expected_size: expected size of the blob property
>    * @expected_elem_size: expected size of an element in the blob property
>    * @replaced: if the blob was in fact replaced
> @@ -771,6 +772,7 @@ EXPORT_SYMBOL(drm_property_replace_blob);
>   int drm_property_replace_blob_from_id(struct drm_device *dev,
>   					 struct drm_property_blob **blob,
>   					 uint64_t blob_id,
> +					 ssize_t max_size,
>   					 ssize_t expected_size,
>   					 ssize_t expected_elem_size,
>   					 bool *replaced)
> @@ -785,6 +787,15 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
>   			return -EINVAL;
>   		}
>   
> +		if (max_size > 0 &&
> +		    new_blob->length > max_size) {
> +			drm_dbg_atomic(dev,
> +				       "[BLOB:%d] length %zu greater than max %zu\n",
> +				       new_blob->base.id, new_blob->length, max_size);
> +			drm_property_blob_put(new_blob);
> +			return -EINVAL;
> +		}
> +
>   		if (expected_size > 0 &&
>   		    new_blob->length != expected_size) {
>   			drm_dbg_atomic(dev,
> diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> index 082f29156b3e..aa49b5a42bb5 100644
> --- a/include/drm/drm_property.h
> +++ b/include/drm/drm_property.h
> @@ -284,6 +284,7 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
>   				      uint64_t blob_id,
>   				      ssize_t expected_size,
>   				      ssize_t expected_elem_size,
> +				      ssize_t max_size,
>   				      bool *replaced);
>   int drm_property_replace_global_blob(struct drm_device *dev,
>   				     struct drm_property_blob **replace,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


