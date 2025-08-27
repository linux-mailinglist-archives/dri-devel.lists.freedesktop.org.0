Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7AB381F7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 14:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608010E7AD;
	Wed, 27 Aug 2025 12:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="k3+SE3fU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uSfffBxr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k3+SE3fU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uSfffBxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C8010E7AD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:08:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E68D225CE;
 Wed, 27 Aug 2025 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756296487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YUG4IsVK51ED8GJtEs2Zz00KOUySwi98i6qMp6XiJ0s=;
 b=k3+SE3fUdGYsqYQhMhz7D8Aae0oNMLn5yTLfTwGJzCB3vZbIWnsmu1oNHdQuFp5nbftxNC
 AbV1X4cCDJMXjdl4BCgb4mXG/qS4topITE6rst3OPcE9VVVCc7LT9788StMnookbjMxKA7
 b9D9nlDXk++aYY+O32QmOvjrp4bxO6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756296487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YUG4IsVK51ED8GJtEs2Zz00KOUySwi98i6qMp6XiJ0s=;
 b=uSfffBxr7x5b32WunNdrywxNg+aKBYB6ngWps8Biq9uSZUlSYiRUj6S5xqjSWC7d/hKwPI
 +tEDF9e9IVwUnECA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756296487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YUG4IsVK51ED8GJtEs2Zz00KOUySwi98i6qMp6XiJ0s=;
 b=k3+SE3fUdGYsqYQhMhz7D8Aae0oNMLn5yTLfTwGJzCB3vZbIWnsmu1oNHdQuFp5nbftxNC
 AbV1X4cCDJMXjdl4BCgb4mXG/qS4topITE6rst3OPcE9VVVCc7LT9788StMnookbjMxKA7
 b9D9nlDXk++aYY+O32QmOvjrp4bxO6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756296487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YUG4IsVK51ED8GJtEs2Zz00KOUySwi98i6qMp6XiJ0s=;
 b=uSfffBxr7x5b32WunNdrywxNg+aKBYB6ngWps8Biq9uSZUlSYiRUj6S5xqjSWC7d/hKwPI
 +tEDF9e9IVwUnECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 594BF13310;
 Wed, 27 Aug 2025 12:08:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FCVFEyf1rmhHTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Aug 2025 12:08:07 +0000
Message-ID: <035b6b7a-fcaa-4d2d-a80f-6523d53ddff6@suse.de>
Date: Wed, 27 Aug 2025 14:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sysfb: Do not deref unexisting CRTC state in
 atomic_disable
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250826145044.954396-1-tzimmermann@suse.de>
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
In-Reply-To: <20250826145044.954396-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:helo,
 suse.de:mid, suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
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



Am 26.08.25 um 16:50 schrieb Thomas Zimmermann:
> Do not access CRTC state in drm_sysfb_plane_helper_atomic_disable().
> Use format from sysfb device for clearing scanout buffer. This is
> the behavior from before commit 061963cd9e5b ("drm/sysfb: Blit to
> CRTC destination format").
>
> When being disabled, the plane has no associated CRTC. Trying to deref
> the format pointer results in a segmentation fault. An example stack
> track is shown below.
>
> [   58.948915] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000023: 0000 [#1] SMP KASAN PTI
> [   58.959971] KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
> [...]
> [   58.979308] RIP: 0010:drm_sysfb_plane_helper_atomic_disable+0x1af/0x520
> [...]
> [   59.084227] Call Trace:
> [   59.086682]  <TASK>
> [   59.088793]  ? __pfx_drm_sysfb_plane_helper_atomic_disable+0x10/0x10
> [   59.095155]  ? crtc_disable+0xf2/0x5a0
> [   59.098920]  drm_atomic_helper_commit_planes+0x848/0x1030
> [   59.104336]  drm_atomic_helper_commit_tail+0x41/0xb0
> [   59.109316]  commit_tail+0x204/0x330
> [   59.112903]  drm_atomic_helper_commit+0x242/0x2e0
> [   59.117618]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
> [   59.122851]  drm_atomic_commit+0x1e1/0x290
> [   59.126957]  ? drm_atomic_add_affected_connectors+0x266/0x330
> [   59.132714]  ? __pfx_drm_atomic_commit+0x10/0x10
> [   59.137343]  ? __pfx___drm_printfn_info+0x10/0x10
> [   59.142058]  ? drm_atomic_set_crtc_for_connector+0x436/0x630
> [   59.147729]  atomic_remove_fb+0x631/0x920
> [   59.151751]  ? save_trace+0xcf/0x180
> [   59.155343]  ? __pfx_atomic_remove_fb+0x10/0x10
> [   59.159890]  ? __pfx___drm_dev_dbg+0x10/0x10
> [   59.164173]  drm_framebuffer_remove+0x19a/0x710
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 061963cd9e5b ("drm/sysfb: Blit to CRTC destination format")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

via IRC: 
https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&highlight_names=&date=2025-08-27

> ---
>   drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> index 0e05345cdeee..963c380fea64 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> @@ -281,10 +281,7 @@ void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
>   	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>   	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
>   	unsigned int dst_pitch = sysfb->fb_pitch;
> -	struct drm_crtc_state *crtc_state = crtc_state =
> -		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
> -	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
> -	const struct drm_format_info *dst_format = sysfb_crtc_state->format;
> +	const struct drm_format_info *dst_format = sysfb->fb_format;
>   	struct drm_rect dst_clip;
>   	unsigned long lines, linepixels, i;
>   	int idx;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


