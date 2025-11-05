Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC59C349E2
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FC310E044;
	Wed,  5 Nov 2025 08:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="REKofunG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fi9iXzf4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="REKofunG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fi9iXzf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BB310E044
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 08:57:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01F1321153;
 Wed,  5 Nov 2025 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762333035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m2+JqlrBRbbkwTb6yqQdhY2PXr1Aq2H/iiE8dk6sZE0=;
 b=REKofunGAkZy4HSr+2sT2LcIC+JmOyb6KxRxfz0HAXVkfGOe80yI0nuM3c1rPya6Vc/C83
 y9ZiaIXYHBSCgMgHEcWEJbDtGkCnu3rwo3+W7pbIvoBihjzHUz1ukbdgSwnG2NYs/Fj2cK
 Mx7n/uDxuTK8sJrH4wltzv6F1Cw+/R8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762333035;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m2+JqlrBRbbkwTb6yqQdhY2PXr1Aq2H/iiE8dk6sZE0=;
 b=fi9iXzf4bfkZzM3o7qlsm3Q8NDEqg+bXSI2y7Y+R4m83PbHswrnVmgWxppewpmRa+8O8D5
 hzAShJUvnBfhspCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762333035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m2+JqlrBRbbkwTb6yqQdhY2PXr1Aq2H/iiE8dk6sZE0=;
 b=REKofunGAkZy4HSr+2sT2LcIC+JmOyb6KxRxfz0HAXVkfGOe80yI0nuM3c1rPya6Vc/C83
 y9ZiaIXYHBSCgMgHEcWEJbDtGkCnu3rwo3+W7pbIvoBihjzHUz1ukbdgSwnG2NYs/Fj2cK
 Mx7n/uDxuTK8sJrH4wltzv6F1Cw+/R8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762333035;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m2+JqlrBRbbkwTb6yqQdhY2PXr1Aq2H/iiE8dk6sZE0=;
 b=fi9iXzf4bfkZzM3o7qlsm3Q8NDEqg+bXSI2y7Y+R4m83PbHswrnVmgWxppewpmRa+8O8D5
 hzAShJUvnBfhspCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8B73132DD;
 Wed,  5 Nov 2025 08:57:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l777J2oRC2npegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Nov 2025 08:57:14 +0000
Message-ID: <38110178-0f27-44ba-9925-5bbe74a1bf9b@suse.de>
Date: Wed, 5 Nov 2025 09:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/udl: Increase get urb timeout for modeset
To: oushixiong1025@163.com, Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20251105083037.237925-1-oushixiong1025@163.com>
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
In-Reply-To: <20251105083037.237925-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[163.com,redhat.com];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[poorly.run,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[suse.com:url,suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, imap1.dmz-prg2.suse.org:helo,
 suse.com:url]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi

Am 05.11.25 um 09:30 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> [WHY]
> There is a situation where udl_handle_damage() was running successfully
> but the screen was black. it was because udl_crtc_helper_atomic_enable() failed,
> and there were no error messages.
>
> [HOW]
> The priority for mode settings needs to be higher than damage handle, requiring
> a higher success rate than ordinary operations.
> Increase get urb timeout for modeset.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/gpu/drm/udl/udl_drv.h      |  5 ++++-
>   drivers/gpu/drm/udl/udl_main.c     |  5 ++---
>   drivers/gpu/drm/udl/udl_modeset.c  | 11 +++++++----
>   drivers/gpu/drm/udl/udl_transfer.c |  2 +-
>   4 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 145bb95ccc48..38b3bdf1ae4a 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -31,6 +31,9 @@ struct drm_mode_create_dumb;
>   #define DRIVER_MINOR		0
>   #define DRIVER_PATCHLEVEL	1
>   
> +#define GET_URB_TIMEOUT	HZ
> +#define MODESET_GET_URB_TIMEOUT	(HZ*2)
> +

Just increase the regular GET_URB_TIMEOUT for all operations.

Best regards
Thomas

>   struct udl_device;
>   
>   struct urb_node {
> @@ -72,7 +75,7 @@ static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
>   int udl_modeset_init(struct udl_device *udl);
>   struct drm_connector *udl_connector_init(struct drm_device *dev);
>   
> -struct urb *udl_get_urb(struct udl_device *udl);
> +struct urb *udl_get_urb(struct udl_device *udl, long timeout);
>   
>   int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len);
>   void udl_sync_pending_urbs(struct udl_device *udl);
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index bc58991a6f14..891996f0f74b 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -285,13 +285,12 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
>   	return unode->urb;
>   }
>   
> -#define GET_URB_TIMEOUT	HZ
> -struct urb *udl_get_urb(struct udl_device *udl)
> +struct urb *udl_get_urb(struct udl_device *udl, long timeout)
>   {
>   	struct urb *urb;
>   
>   	spin_lock_irq(&udl->urbs.lock);
> -	urb = udl_get_urb_locked(udl, GET_URB_TIMEOUT);
> +	urb = udl_get_urb_locked(udl, timeout);
>   	spin_unlock_irq(&udl->urbs.lock);
>   	return urb;
>   }
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 231e829bd709..6adca5e3e471 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -21,6 +21,7 @@
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_vblank.h>
>   
> @@ -217,7 +218,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
>   		return ret;
>   	log_bpp = ret;
>   
> -	urb = udl_get_urb(udl);
> +	urb = udl_get_urb(udl, GET_URB_TIMEOUT);
>   	if (!urb)
>   		return -ENOMEM;
>   	cmd = urb->transfer_buffer;
> @@ -341,9 +342,11 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
>   	if (!drm_dev_enter(dev, &idx))
>   		return;
>   
> -	urb = udl_get_urb(udl);
> -	if (!urb)
> +	urb = udl_get_urb(udl, MODESET_GET_URB_TIMEOUT);
> +	if (!urb) {
> +		DRM_ERROR("Udl get urb failed when enabling crtc");
>   		goto out;
> +	}
>   
>   	buf = (char *)urb->transfer_buffer;
>   	buf = udl_vidreg_lock(buf);
> @@ -374,7 +377,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
>   	if (!drm_dev_enter(dev, &idx))
>   		return;
>   
> -	urb = udl_get_urb(udl);
> +	urb = udl_get_urb(udl, MODESET_GET_URB_TIMEOUT);
>   	if (!urb)
>   		goto out;
>   
> diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
> index 7d670b3a5293..858b47522d78 100644
> --- a/drivers/gpu/drm/udl/udl_transfer.c
> +++ b/drivers/gpu/drm/udl/udl_transfer.c
> @@ -202,7 +202,7 @@ int udl_render_hline(struct udl_device *udl, int log_bpp, struct urb **urb_ptr,
>   			int ret = udl_submit_urb(udl, urb, len);
>   			if (ret)
>   				return ret;
> -			urb = udl_get_urb(udl);
> +			urb = udl_get_urb(udl, GET_URB_TIMEOUT);
>   			if (!urb)
>   				return -EAGAIN;
>   			*urb_ptr = urb;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


