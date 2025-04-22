Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC63A95F39
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CB910E50E;
	Tue, 22 Apr 2025 07:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Qhr9alVo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p/K+BZiH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qhr9alVo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p/K+BZiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0510E50D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:24:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F4EC211BA;
 Tue, 22 Apr 2025 07:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1745306653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OMo2VbQ2Qe+I4d8hPvijc2UJmmN0itSMU39itky7avc=;
 b=Qhr9alVocG4DKX9nPlYRes2fiOz5O92QRLT3LiQXU1+Rf3G05gtU4OG5FoVCVMfbwrOIoJ
 JRdTHaWwwyuDDX9KY69Rr2qRRM1xlr1+YGa1WNTo++M4i6aNQt0hWF6zkIT1sXOnIX9x/J
 1IpN1esiG1Tqqbn8BRld6TEscGD1jQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1745306653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OMo2VbQ2Qe+I4d8hPvijc2UJmmN0itSMU39itky7avc=;
 b=p/K+BZiHgX4/5NqTyTNBuo1x+0Ij8G3oM0SSUvFoXZ5vn52x80v0DP/9amnhl/Tr+BlN6p
 8N6yB4G4k6GmouAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Qhr9alVo;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="p/K+BZiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1745306653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OMo2VbQ2Qe+I4d8hPvijc2UJmmN0itSMU39itky7avc=;
 b=Qhr9alVocG4DKX9nPlYRes2fiOz5O92QRLT3LiQXU1+Rf3G05gtU4OG5FoVCVMfbwrOIoJ
 JRdTHaWwwyuDDX9KY69Rr2qRRM1xlr1+YGa1WNTo++M4i6aNQt0hWF6zkIT1sXOnIX9x/J
 1IpN1esiG1Tqqbn8BRld6TEscGD1jQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1745306653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OMo2VbQ2Qe+I4d8hPvijc2UJmmN0itSMU39itky7avc=;
 b=p/K+BZiHgX4/5NqTyTNBuo1x+0Ij8G3oM0SSUvFoXZ5vn52x80v0DP/9amnhl/Tr+BlN6p
 8N6yB4G4k6GmouAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7BFF139D5;
 Tue, 22 Apr 2025 07:24:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L+g5NxxEB2jEOAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Apr 2025 07:24:12 +0000
Message-ID: <a974def2-ee85-4caf-83bc-fa59116fc292@suse.de>
Date: Tue, 22 Apr 2025 09:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/hyperv: Replace simple-KMS with regular
 atomic helpers
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250420121945.573915-1-ryasuoka@redhat.com>
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
In-Reply-To: <20250420121945.573915-1-ryasuoka@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3F4EC211BA
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

Hi

Am 20.04.25 um 14:19 schrieb Ryosuke Yasuoka:
> Drop simple-KMS in favor of regular atomic helpers to make the code more
> modular. The simple-KMS helper mix up plane and CRTC state, so it is
> obsolete and should go away [1]. Since it just split the simple-pipe
> funtions into per-plane and per-CRTC, no functional changes is expected.
>
> [1] https://lore.kernel.org/lkml/dae5089d-e214-4518-b927-5c4149babad8@suse.de/
>
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>

I cannot test, but thanks for doing this. Comments below.

> ---
>   drivers/gpu/drm/hyperv/hyperv_drm.h         |   4 +-
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 168 ++++++++++++++++----
>   2 files changed, 139 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
> index d2d8582b36df..9e776112c03e 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm.h
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
> @@ -11,7 +11,9 @@
>   struct hyperv_drm_device {
>   	/* drm */
>   	struct drm_device dev;
> -	struct drm_simple_display_pipe pipe;
> +	struct drm_plane plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
>   	struct drm_connector connector;
>   
>   	/* mode */
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index 6c6b57298797..c273c093b491 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/hyperv.h>
>   
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_edid.h>
> @@ -15,7 +16,7 @@
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_plane.h>
>   
>   #include "hyperv_drm.h"
>   
> @@ -98,12 +99,47 @@ static int hyperv_check_size(struct hyperv_drm_device *hv, int w, int h,
>   	return 0;
>   }
>   
> -static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
> -			       struct drm_crtc_state *crtc_state,
> -			       struct drm_plane_state *plane_state)
> +static const uint32_t hyperv_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint64_t hyperv_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +

> +static enum drm_mode_status
> +hyperv_crtc_helper_mode_valid(struct drm_crtc *crtc,
> +			      const struct drm_display_mode *mode)
> +{
> +	return MODE_OK;
> +}

This helper should not be necessary.

> +
> +static int hyperv_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					   struct drm_atomic_state *state)
>   {
> -	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	int ret;
> +
> +	if (!crtc_state->enable)
> +		goto out;
> +
> +	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> +	if (ret)
> +		return ret;
> +
> +out:

> +	return drm_atomic_add_affected_planes(state, crtc);

IIRC this function call was only required to work around an issue in the 
simple-kms helpers. It's not necessary if you use the regular interface 
and should be removed.

> +}
> +
> +static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					     struct drm_atomic_state *state)
> +{
> +	struct hyperv_drm_device *hv = to_hv(crtc->dev);
> +	struct drm_plane *plane = &hv->plane;
> +	struct drm_plane_state *plane_state = plane->state;
>   	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_crtc_state *crtc_state = crtc->state;
>   
>   	hyperv_hide_hw_ptr(hv->hdev);

>   	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,

This looks more like something to do in the plane's atomic_enable, but 
it's OK for now.

> @@ -113,12 +149,48 @@ static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
>   	hyperv_blit_to_vram_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);

I think this can be removed. Blit'ing is for planes and the plane 
already does it it's atomic_update. Doing this here as well is another 
artifact of the simple-kms helpers.

>   }
>   
> -static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
> -			     struct drm_plane_state *plane_state,
> -			     struct drm_crtc_state *crtc_state)
> +static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					      struct drm_atomic_state *state)
> +{ }
> +
> +static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
> +	.mode_valid = hyperv_crtc_helper_mode_valid,
> +	.atomic_check = hyperv_crtc_helper_atomic_check,
> +	.atomic_enable = hyperv_crtc_helper_atomic_enable,
> +	.atomic_disable = hyperv_crtc_helper_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs hyperv_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static int hyperv_plane_atomic_check(struct drm_plane *plane,
> +				     struct drm_atomic_state *state)
>   {
> -	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
>   	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_crtc *crtc = plane_state->crtc;
> +	struct drm_crtc_state *crtc_state = NULL;
> +	int ret;
> +
> +	if (crtc)
> +		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);
> +	if (ret)
> +		return ret;
> +
> +	if (!plane_state->visible)
> +		return 0;
>   

>   	if (fb->format->format != DRM_FORMAT_XRGB8888)
>   		return -EINVAL;

Our DRM core should have done this test already.

> @@ -132,51 +204,83 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
>   	return 0;
>   }
>   
> -static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
> -			       struct drm_plane_state *old_state)
> +static void hyperv_plane_atomic_update(struct drm_plane *plane,
> +						      struct drm_atomic_state *old_state)
>   {
> -	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
> -	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(old_state, plane);
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
> +	struct drm_plane_state *state = plane->state;
>   	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
>   	struct drm_rect rect;
>   
> -	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
> +	if (drm_atomic_helper_damage_merged(old_pstate, state, &rect)) {
>   		hyperv_blit_to_vram_rect(state->fb, &shadow_plane_state->data[0], &rect);
>   		hyperv_update_dirt(hv->hdev, &rect);
>   	}
>   }
>   
> -static const struct drm_simple_display_pipe_funcs hyperv_pipe_funcs = {
> -	.enable	= hyperv_pipe_enable,
> -	.check = hyperv_pipe_check,
> -	.update	= hyperv_pipe_update,
> -	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,

> +static bool hyperv_format_mod_supported(struct drm_plane *plane,
> +					uint32_t format, uint64_t modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}

This helper is probably not necessary either.

> +
> +static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = hyperv_plane_atomic_check,
> +	.atomic_update = hyperv_plane_atomic_update,
>   };
>   
> -static const uint32_t hyperv_formats[] = {
> -	DRM_FORMAT_XRGB8888,
> +static const struct drm_plane_funcs hyperv_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= drm_plane_cleanup,
> +	.format_mod_supported   = hyperv_format_mod_supported,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
>   };
>   
> -static const uint64_t hyperv_modifiers[] = {
> -	DRM_FORMAT_MOD_LINEAR,
> -	DRM_FORMAT_MOD_INVALID
> +static const struct drm_encoder_funcs hyperv_drm_simple_encoder_funcs_cleanup = {
> +	.destroy = drm_encoder_cleanup,
>   };
>   
>   static inline int hyperv_pipe_init(struct hyperv_drm_device *hv)
>   {
> +	struct drm_device *dev = &hv->dev;
> +	struct drm_encoder *encoder = &hv->encoder;
> +	struct drm_plane *plane = &hv->plane;
> +	struct drm_crtc *crtc = &hv->crtc;
> +	struct drm_connector *connector = &hv->connector;
>   	int ret;
>   
> -	ret = drm_simple_display_pipe_init(&hv->dev,
> -					   &hv->pipe,
> -					   &hyperv_pipe_funcs,
> -					   hyperv_formats,
> -					   ARRAY_SIZE(hyperv_formats),
> -					   hyperv_modifiers,
> -					   &hv->connector);
> +	drm_plane_helper_add(plane, &hyperv_plane_helper_funcs);

Rather call drm_universal_plane_init() first and then add the helper funcs.

> +	ret = drm_universal_plane_init(dev, plane, 0,
> +				       &hyperv_plane_funcs,
> +				       hyperv_formats, ARRAY_SIZE(hyperv_formats),
> +				       hyperv_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &hyperv_crtc_helper_funcs);
> +	ret = drm_crtc_init_with_planes(dev, crtc, plane, NULL,
> +					&hyperv_crtc_funcs, NULL);

Same ordering nit as with the plane.

> +	if (ret)
> +		return ret;
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	ret = drm_encoder_init(dev, encoder,
> +			       &hyperv_drm_simple_encoder_funcs_cleanup,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +
> +	if (ret || !connector)
> +		return ret;

Connector init happens elsewhere, but you can inline hyperv_conn_init() 
right here.

> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +
>   	if (ret)
>   		return ret;
>   
> -	drm_plane_enable_fb_damage_clips(&hv->pipe.plane);
> +	drm_plane_enable_fb_damage_clips(&hv->plane);

This is a plane function you can move it close to the plane init.

Best regards
Thomas

>   
>   	return 0;
>   }
>
> base-commit: b60301774a8fe6c30b14a95104ec099290a2e904

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

