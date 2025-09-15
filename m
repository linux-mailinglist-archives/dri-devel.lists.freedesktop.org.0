Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334BB5766D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDD910E3F4;
	Mon, 15 Sep 2025 10:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lIlQptSF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QGX+aFGC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lIlQptSF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QGX+aFGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A4B10E415
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:33:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 481CF33722;
 Mon, 15 Sep 2025 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757932398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KBAuNS0TTvxvtzR+Tz8ifqkXTWv7/rtPAWRDBL4D7c4=;
 b=lIlQptSFuR/rJDS3hKyu2w41wwiwgNJ22smYoCFZ0B8huApYv0mO7km1SSvMYT4p40mulk
 fnq1r/mViDDDZi0S+74Agv1o5OaU2Pj6u/Gia/dXx3H6oqTGfahIcsZDpWZ17idVCmc4IR
 6Li8gzHivz2zseuCbg2DSBafNuxynzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757932398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KBAuNS0TTvxvtzR+Tz8ifqkXTWv7/rtPAWRDBL4D7c4=;
 b=QGX+aFGCdAL1ZCDP5rtIrbCaA0NqJJYzwqucSfxCVuvBOfj1ZXW0dMC7+skuXg4/YTaMDC
 VxUPIGXFE3O9w0DQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lIlQptSF;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QGX+aFGC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757932398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KBAuNS0TTvxvtzR+Tz8ifqkXTWv7/rtPAWRDBL4D7c4=;
 b=lIlQptSFuR/rJDS3hKyu2w41wwiwgNJ22smYoCFZ0B8huApYv0mO7km1SSvMYT4p40mulk
 fnq1r/mViDDDZi0S+74Agv1o5OaU2Pj6u/Gia/dXx3H6oqTGfahIcsZDpWZ17idVCmc4IR
 6Li8gzHivz2zseuCbg2DSBafNuxynzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757932398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KBAuNS0TTvxvtzR+Tz8ifqkXTWv7/rtPAWRDBL4D7c4=;
 b=QGX+aFGCdAL1ZCDP5rtIrbCaA0NqJJYzwqucSfxCVuvBOfj1ZXW0dMC7+skuXg4/YTaMDC
 VxUPIGXFE3O9w0DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 044CA1368D;
 Mon, 15 Sep 2025 10:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ULY0O23rx2i6EgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Sep 2025 10:33:17 +0000
Message-ID: <38570a2a-c01a-4cd3-a72d-8fa909b33348@suse.de>
Date: Mon, 15 Sep 2025 12:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
To: Athul Raj Kollareth <krathul3152@gmail.com>, michal.wajdeczko@intel.com
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 simona@ffwll.ch, mripard@kernel.org
References: <aLczDHV_yGnnRKbr@Terra>
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
In-Reply-To: <aLczDHV_yGnnRKbr@Terra>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,intel.com];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 481CF33722
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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



Am 02.09.25 um 20:10 schrieb Athul Raj Kollareth:
> Replace the DRM_* logging macros used in gem helper files with the
> appropriate ones specified in /include/drm/drm_print.h.
>
> Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> Changes in v5:
>      - Minor style fix.
>
> Changes in v4:
>      - Some codestyle corrections.
>      - Remove OOM error logging in drm_gem_init().
>
> Changes in v3:
>      - Revert all changes to drm_gem_objects_lookup().
>      - Use drm_device from minor.
>
> Changes in v2:
>      - Change drm_gem_objects_lookup() to take a drm_device* argument.
>      - Make appropriate changes to all calls of drm_gem_objects_lookup().
> ---
>   drivers/gpu/drm/drm_gem.c            | 16 ++++++++--------
>   drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 4a89b6acb6af..fb12cc2051d8 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -101,10 +101,8 @@ drm_gem_init(struct drm_device *dev)
>   
>   	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
>   					  GFP_KERNEL);
> -	if (!vma_offset_manager) {
> -		DRM_ERROR("out of memory\n");
> +	if (!vma_offset_manager)
>   		return -ENOMEM;
> -	}
>   
>   	dev->vma_offset_manager = vma_offset_manager;
>   	drm_vma_offset_manager_init(vma_offset_manager,
> @@ -783,9 +781,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>   int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>   			   int count, struct drm_gem_object ***objs_out)
>   {
> -	int ret;
> -	u32 *handles;
> +	struct drm_device *dev = filp->minor->dev;
>   	struct drm_gem_object **objs;
> +	u32 *handles;
> +	int ret;
>   
>   	if (!count)
>   		return 0;
> @@ -805,7 +804,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>   
>   	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
>   		ret = -EFAULT;
> -		DRM_DEBUG("Failed to copy in GEM handles\n");
> +		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
>   		goto out;
>   	}
>   
> @@ -853,12 +852,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
>   long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>   				    bool wait_all, unsigned long timeout)
>   {
> -	long ret;
> +	struct drm_device *dev = filep->minor->dev;
>   	struct drm_gem_object *obj;
> +	long ret;
>   
>   	obj = drm_gem_object_lookup(filep, handle);
>   	if (!obj) {
> -		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
>   		return -EINVAL;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 4f0320df858f..a507cf517015 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
>   
>   	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
>   	if (ret) {
> -		DRM_ERROR("Failed to vmap PRIME buffer\n");
> +		drm_err(dev, "Failed to vmap PRIME buffer\n");
>   		return ERR_PTR(ret);
>   	}
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


