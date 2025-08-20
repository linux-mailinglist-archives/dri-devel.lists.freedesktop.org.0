Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788CB2D70F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 10:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413BB10E353;
	Wed, 20 Aug 2025 08:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ctTznfW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qdikTdS2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ctTznfW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qdikTdS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7F110E353
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 08:50:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2AC8C21289;
 Wed, 20 Aug 2025 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755679841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nYhjc45f5ekwVpi167JCCWKfG7o4RDwmB8EPBVcu7O0=;
 b=ctTznfW0+oItBzeVYif0pQD2+m6xXG/fh987W7OyIj2MvxFPYcbA68YdNY+7Mf2GpfFAey
 lKNrJiaYz5o5l+hikxcyX4rrCNGN9VBlmThoQzt35QprfBw8mMwgZ+gLIMPWTmSn4RfS5S
 QSBCMhhm9lYMDdiAqbgQwc2vZdBJTZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755679841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nYhjc45f5ekwVpi167JCCWKfG7o4RDwmB8EPBVcu7O0=;
 b=qdikTdS2qg3bB+u6LzNsnP9ILsrVy2+gnmyZY2wV+73+AxIgRKIw51vy61uiGtY5+JkTee
 FvhX2HOaAfXCwkCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ctTznfW0;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qdikTdS2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755679841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nYhjc45f5ekwVpi167JCCWKfG7o4RDwmB8EPBVcu7O0=;
 b=ctTznfW0+oItBzeVYif0pQD2+m6xXG/fh987W7OyIj2MvxFPYcbA68YdNY+7Mf2GpfFAey
 lKNrJiaYz5o5l+hikxcyX4rrCNGN9VBlmThoQzt35QprfBw8mMwgZ+gLIMPWTmSn4RfS5S
 QSBCMhhm9lYMDdiAqbgQwc2vZdBJTZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755679841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nYhjc45f5ekwVpi167JCCWKfG7o4RDwmB8EPBVcu7O0=;
 b=qdikTdS2qg3bB+u6LzNsnP9ILsrVy2+gnmyZY2wV+73+AxIgRKIw51vy61uiGtY5+JkTee
 FvhX2HOaAfXCwkCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D49C11368B;
 Wed, 20 Aug 2025 08:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xm23MmCMpWgDcgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Aug 2025 08:50:40 +0000
Message-ID: <c731315f-0862-4605-b443-bc1943d697d6@suse.de>
Date: Wed, 20 Aug 2025 10:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
To: Athul Raj Kollareth <krathul3152@gmail.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
 <20250818192247.58322-1-krathul3152@gmail.com>
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
In-Reply-To: <20250818192247.58322-1-krathul3152@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2AC8C21289
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,linuxfoundation.org];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

Hi

Am 18.08.25 um 21:20 schrieb Athul Raj Kollareth:
> Replace the DRM_* logging macros used in gem helper files with the appropriate
> ones specified in /include/drm/drm_print.h.
>
> Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> ---
> Changes in v2:
>      - Change drm_gem_objects_lookup() to take a drm_device* argument.
>      - Make appropriate changes to all calls of drm_gem_objects_lookup().

Please see Michal's reply about using filp->minor->dev for the device. 
Saves from any changes to the interface. You might want to be defensive 
about it and test for filp->minor for NULL.

Best regards
Thomas

> ---
>   drivers/accel/rocket/rocket_job.c       |  4 ++--
>   drivers/gpu/drm/drm_gem.c               | 12 +++++++-----
>   drivers/gpu/drm/drm_gem_dma_helper.c    |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>   drivers/gpu/drm/v3d/v3d_submit.c        |  2 +-
>   drivers/gpu/drm/vc4/vc4_gem.c           |  2 +-
>   include/drm/drm_gem.h                   |  5 +++--
>   7 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index 5d4afd692306..db7c50c9ab90 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -560,14 +560,14 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
>   	if (ret)
>   		goto out_cleanup_job;
>   
> -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
> +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->in_bo_handles),
>   				     job->in_bo_handle_count, &rjob->in_bos);
>   	if (ret)
>   		goto out_cleanup_job;
>   
>   	rjob->in_bo_count = job->in_bo_handle_count;
>   
> -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
> +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->out_bo_handles),
>   				     job->out_bo_handle_count, &rjob->out_bos);
>   	if (ret)
>   		goto out_cleanup_job;
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 4a89b6acb6af..ee1e5ded6dd6 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
>   	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
>   					  GFP_KERNEL);
>   	if (!vma_offset_manager) {
> -		DRM_ERROR("out of memory\n");
> +		drm_err(dev, "out of memory\n");
>   		return -ENOMEM;
>   	}
>   
> @@ -764,6 +764,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>   
>   /**
>    * drm_gem_objects_lookup - look up GEM objects from an array of handles
> + * @dev: corresponding drm_device
>    * @filp: DRM file private date
>    * @bo_handles: user pointer to array of userspace handle
>    * @count: size of handle array
> @@ -780,8 +781,9 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>    * failure. 0 is returned on success.
>    *
>    */
> -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> -			   int count, struct drm_gem_object ***objs_out)
> +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> +			   void __user *bo_handles, int count,
> +			   struct drm_gem_object ***objs_out)
>   {
>   	int ret;
>   	u32 *handles;
> @@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>   
>   	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
>   		ret = -EFAULT;
> -		DRM_DEBUG("Failed to copy in GEM handles\n");
> +		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
>   		goto out;
>   	}
>   
> @@ -858,7 +860,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>   
>   	obj = drm_gem_object_lookup(filep, handle);
>   	if (!obj) {
> -		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +		drm_dbg_core(NULL, "Failed to look up GEM BO %d\n", handle);
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
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ea6c509a5d5..3ffd9d5a9056 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -188,7 +188,7 @@ panfrost_lookup_bos(struct drm_device *dev,
>   	if (!job->bo_count)
>   		return 0;
>   
> -	ret = drm_gem_objects_lookup(file_priv,
> +	ret = drm_gem_objects_lookup(dev, file_priv,
>   				     (void __user *)(uintptr_t)args->bo_handles,
>   				     job->bo_count, &job->bos);
>   	if (ret)
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 5171ffe9012d..a3ac8e6a4a72 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -79,7 +79,7 @@ v3d_lookup_bos(struct drm_device *dev,
>   		return -EINVAL;
>   	}
>   
> -	return drm_gem_objects_lookup(file_priv,
> +	return drm_gem_objects_lookup(dev, file_priv,
>   				      (void __user *)(uintptr_t)bo_handles,
>   				      job->bo_count, &job->bo);
>   }
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 255e5817618e..6ce65611231b 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -692,7 +692,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,
>   		return -EINVAL;
>   	}
>   
> -	ret = drm_gem_objects_lookup(file_priv, u64_to_user_ptr(args->bo_handles),
> +	ret = drm_gem_objects_lookup(dev, file_priv, u64_to_user_ptr(args->bo_handles),
>   				     exec->bo_count, &exec->bo);
>   
>   	if (ret)
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index d3a7b43e2c63..03cb03f46524 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -544,8 +544,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
>   int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>   void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>   
> -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> -			   int count, struct drm_gem_object ***objs_out);
> +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> +			   void __user *bo_handles, int count,
> +			   struct drm_gem_object ***objs_out);
>   struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
>   long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>   				    bool wait_all, unsigned long timeout);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


