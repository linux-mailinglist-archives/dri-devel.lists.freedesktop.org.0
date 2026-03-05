Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCAPEUpcqWkL6AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:34:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41420FC0B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FF810E24B;
	Thu,  5 Mar 2026 10:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="owJ/S7DH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j+5gs6k9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="owJ/S7DH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j+5gs6k9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3AF10E24B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:34:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F214D3F87C;
 Thu,  5 Mar 2026 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772706883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5xe6+sNo6GBvoOA7TMIMptK+Azr1uwkp5lwcq5r2B04=;
 b=owJ/S7DH6Bj3K5mQgtu0B09wY5lLuM9hXz7D4RnZUd2YpwLJCjJHAHxrz6z68CPPlKArqF
 ISHehdjtvWbC4Vv9ZryPC76CKMegntWPLM5tO0TcdQ3nAtF0/h2jcEkS/e5aCSB6Hh0xXt
 f2Hra8lmHLorLDipe2I70Y2jjmqqZuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772706883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5xe6+sNo6GBvoOA7TMIMptK+Azr1uwkp5lwcq5r2B04=;
 b=j+5gs6k9lljQuZsn5R4ugicz2IJJug8ROS/S4xTqOn9OGXuL5dlf/lnDi92FQpEY9mkWhI
 JAzuQVs0UtI6B4Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772706883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5xe6+sNo6GBvoOA7TMIMptK+Azr1uwkp5lwcq5r2B04=;
 b=owJ/S7DH6Bj3K5mQgtu0B09wY5lLuM9hXz7D4RnZUd2YpwLJCjJHAHxrz6z68CPPlKArqF
 ISHehdjtvWbC4Vv9ZryPC76CKMegntWPLM5tO0TcdQ3nAtF0/h2jcEkS/e5aCSB6Hh0xXt
 f2Hra8lmHLorLDipe2I70Y2jjmqqZuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772706883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5xe6+sNo6GBvoOA7TMIMptK+Azr1uwkp5lwcq5r2B04=;
 b=j+5gs6k9lljQuZsn5R4ugicz2IJJug8ROS/S4xTqOn9OGXuL5dlf/lnDi92FQpEY9mkWhI
 JAzuQVs0UtI6B4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B297D3EA68;
 Thu,  5 Mar 2026 10:34:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7kjdKUJcqWlsdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Mar 2026 10:34:42 +0000
Message-ID: <09840bc3-ccd8-439b-bf44-b61abab672b4@suse.de>
Date: Thu, 5 Mar 2026 11:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v2 2/3] drm: verisilicon: subclass
 drm_plane_state
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
References: <20260305075926.3642501-1-zhengxingda@iscas.ac.cn>
 <20260305075926.3642501-3-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20260305075926.3642501-3-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
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
X-Rspamd-Queue-Id: 2A41420FC0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:dkim,suse.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,iscas.ac.cn:email]
X-Rspamd-Action: no action

Hi

Am 05.03.26 um 08:59 schrieb Icenowy Zheng:
> Create a subclass of drm_plane_state to store hardware-specific state
> information (e.g. hardware plane format settings) in the future.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v2:
> - Add the #include clause for atomic state helpers, which was wrongly
>    placed in the previous patch in v1.
> - Switch to kzalloc_obj helper for allocating the state.
>
>   drivers/gpu/drm/verisilicon/vs_plane.c        | 41 +++++++++++++++++++
>   drivers/gpu/drm/verisilicon/vs_plane.h        | 14 +++++++
>   .../gpu/drm/verisilicon/vs_primary_plane.c    |  6 +--
>   3 files changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
> index fa88ed14e41d7..2fd4fb2a9591c 100644
> --- a/drivers/gpu/drm/verisilicon/vs_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_plane.c
> @@ -6,6 +6,7 @@
>   #include <linux/errno.h>
>   #include <linux/printk.h>
>   
> +#include <drm/drm_atomic_state_helper.h>
>   #include <drm/drm_fb_dma_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_gem_dma_helper.h>
> @@ -124,3 +125,43 @@ dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
>   
>   	return dma_addr;
>   }
> +
> +struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane *plane)
> +{
> +	struct vs_plane_state *vs_state;
> +
> +	if (WARN_ON(!plane->state))

drm_WARN_ON() here. You can use plane->dev for the first argument.

> +		return NULL;
> +
> +	vs_state = kmemdup(plane->state, sizeof(*vs_state), GFP_KERNEL);

Not wrong, but I'd advise against memdup() because it doesn't understand 
copy-ing semantics of the data structures. And some fields should maybe 
not be copied.

I'd rather use kzalloc_obj() and then ...

> +	if (!vs_state)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &vs_state->base);

... assign the fields manually after this call. That makes is clear 
what's copied and sets the remaining bits to zero.

> +
> +	return &vs_state->base;
> +}
> +
> +void vs_plane_destroy_state(struct drm_plane *plane,
> +			    struct drm_plane_state *state)
> +{
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(state);
> +}
> +
> +/* Called during init to allocate the plane's atomic state. */
> +void vs_plane_reset(struct drm_plane *plane)
> +{
> +	struct vs_plane_state *vs_state;
> +
> +	if (plane->state)
> +		__drm_atomic_helper_plane_destroy_state(plane->state);
> +
> +	kfree(plane->state);

You can move this line into the conditional branch.

> +
> +	vs_state = kzalloc_obj(*vs_state, GFP_KERNEL);
> +	if (!vs_state)
> +		return;
> +
> +	__drm_atomic_helper_plane_reset(plane, &vs_state->base);
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
> index a88cc19f2202e..12848a72af576 100644
> --- a/drivers/gpu/drm/verisilicon/vs_plane.h
> +++ b/drivers/gpu/drm/verisilicon/vs_plane.h
> @@ -63,10 +63,24 @@ struct vs_format {
>   	bool uv_swizzle;
>   };
>   
> +struct vs_plane_state {
> +	struct drm_plane_state base;
> +};
> +
> +static inline struct vs_plane_state *state_to_vs_plane_state(struct drm_plane_state *state)

Maybe 'plane_state_to_vs_plane_state' oj just 'to_vs_plane_state'.

Best regards
Thomas

> +{
> +	return container_of(state, struct vs_plane_state, base);
> +}
> +
>   int drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format);
>   dma_addr_t vs_fb_get_dma_addr(struct drm_framebuffer *fb,
>   			      const struct drm_rect *src_rect);
>   
> +struct drm_plane_state *vs_plane_duplicate_state(struct drm_plane *plane);
> +void vs_plane_destroy_state(struct drm_plane *plane,
> +			    struct drm_plane_state *state);
> +void vs_plane_reset(struct drm_plane *plane);
> +
>   struct drm_plane *vs_primary_plane_init(struct drm_device *dev, struct vs_dc *dc);
>   
>   #endif /* _VS_PLANE_H_ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> index e8fcb5958615c..bad0bc5e3242d 100644
> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> @@ -145,10 +145,10 @@ static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
>   };
>   
>   static const struct drm_plane_funcs vs_primary_plane_funcs = {
> -	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> -	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= vs_plane_destroy_state,
> +	.atomic_duplicate_state	= vs_plane_duplicate_state,
>   	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.reset			= drm_atomic_helper_plane_reset,
> +	.reset			= vs_plane_reset,
>   	.update_plane		= drm_atomic_helper_update_plane,
>   };
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


