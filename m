Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A237AA91A8
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A7F10E0F8;
	Mon,  5 May 2025 11:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="je42+OU8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a/l6WizN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="je42+OU8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a/l6WizN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE5210E0F8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 11:12:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FB611F453;
 Mon,  5 May 2025 11:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746443532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yjfAhdvAL/bWFAcgK1lxIMz6VfIkLilDu95pB5RJ/gA=;
 b=je42+OU8yCQvcI4b+kIVLxnQlDw3g2BQnc+3E0c/1Ex6s+S8EV3pP50uaQLIwIvKCgTcM8
 B3XLRrsj71yjhbFfXdFq5D2NU2hzRWuNs1ggVg61UBNDv3BMSYul+P1kRyJdwpMwH7M8Yo
 vc4861XMNv6SQntMj3R8H4KF1q5DwIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746443532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yjfAhdvAL/bWFAcgK1lxIMz6VfIkLilDu95pB5RJ/gA=;
 b=a/l6WizNd7mNbpQarfisFgwBu74VelCPXlaHxubohCWCQVCLI1fOA6bgltTwRAsK0XzgXe
 AtqpbLdIRYqYKACg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=je42+OU8;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="a/l6WizN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746443532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yjfAhdvAL/bWFAcgK1lxIMz6VfIkLilDu95pB5RJ/gA=;
 b=je42+OU8yCQvcI4b+kIVLxnQlDw3g2BQnc+3E0c/1Ex6s+S8EV3pP50uaQLIwIvKCgTcM8
 B3XLRrsj71yjhbFfXdFq5D2NU2hzRWuNs1ggVg61UBNDv3BMSYul+P1kRyJdwpMwH7M8Yo
 vc4861XMNv6SQntMj3R8H4KF1q5DwIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746443532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yjfAhdvAL/bWFAcgK1lxIMz6VfIkLilDu95pB5RJ/gA=;
 b=a/l6WizNd7mNbpQarfisFgwBu74VelCPXlaHxubohCWCQVCLI1fOA6bgltTwRAsK0XzgXe
 AtqpbLdIRYqYKACg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 023761372E;
 Mon,  5 May 2025 11:12:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oULHOgudGGgoCwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 May 2025 11:12:11 +0000
Message-ID: <71ec7bd1-be90-462e-8a07-e56fccae4096@suse.de>
Date: Mon, 5 May 2025 13:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/shmem-helper: Import dmabuf without mapping its
 sg_table
To: oushixiong1025@163.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250501064324.398650-1-oushixiong1025@163.com>
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
In-Reply-To: <20250501064324.398650-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4FB611F453
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[163.com,linux.intel.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,poorly.run,redhat.com,lists.freedesktop.org,vger.kernel.org,kylinos.cn,amd.com];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

(cc'ing Christian)

Hi,

I don't feel qualified to fully review this patch.

It would be good to have the issue with sg-tables solved, but I dislike 
the dedicated initializer macros. So my question is if this has any 
drawbacks. Or could we make this available and the default for all 
shmem-based drivers?

Best regards
Thomas

Am 01.05.25 um 08:43 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> [WHY]
> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>     DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>     sg_table import.
>     They only need dma_buf_vmap() to access the shared buffer's
>     kernel virtual address.
>
> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>     trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>     restricts the maximum DMA streaming mapping memory, resulting in
>     errors like:
>
>     ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>
> [HOW]
> Provide a gem_prime_import implementation without sg_table mapping
> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
> require sg_table can adopt this.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 95 ++++++++++++++++++++++++++
>   include/drm/drm_gem_shmem_helper.h     | 24 +++++++
>   2 files changed, 119 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d99dee67353a..9e41e350ff6f 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -39,6 +39,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>   static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>   	.free = drm_gem_shmem_object_free,
>   	.print_info = drm_gem_shmem_object_print_info,
> +	.export = drm_gem_shmem_object_prime_export,
>   	.pin = drm_gem_shmem_object_pin,
>   	.unpin = drm_gem_shmem_object_unpin,
>   	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> @@ -799,6 +800,100 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>   }
>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>   
> +const struct dma_buf_ops drm_gem_shmem_prime_dmabuf_ops =  {
> +	.cache_sgt_mapping = true,
> +	.attach = drm_gem_map_attach,
> +	.detach = drm_gem_map_detach,
> +	.map_dma_buf = drm_gem_map_dma_buf,
> +	.unmap_dma_buf = drm_gem_unmap_dma_buf,
> +	.release = drm_gem_dmabuf_release,
> +	.mmap = drm_gem_dmabuf_mmap,
> +	.vmap = drm_gem_dmabuf_vmap,
> +	.vunmap = drm_gem_dmabuf_vunmap,
> +};
> +
> +/**
> + * drm_gem_shmem_prime_export - implementation of the export callback
> + * @shmem: shmem GEM object
> + */
> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
> +					   int flags)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +	struct drm_device *dev = obj->dev;
> +	struct dma_buf_export_info exp_info = {
> +		.exp_name = KBUILD_MODNAME, /* white lie for debug */
> +		.owner = dev->driver->fops->owner,
> +		.ops = &drm_gem_shmem_prime_dmabuf_ops,
> +		.size = obj->size,
> +		.flags = flags,
> +		.priv = obj,
> +		.resv = obj->resv,
> +	};
> +
> +	return drm_gem_dmabuf_export(dev, &exp_info);
> +}
> +
> +/**
> + * drm_gem_shmem_prime_import - Import dmabuf without mapping its sg_table
> + * @dev: Device to import into
> + * @dma_buf: dma-buf object to import
> + *
> + * Drivers that use the shmem helpers but also wants to import dmabuf without
> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
> + * implementation.
> + */
> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
> +						  struct dma_buf *dma_buf)
> +{
> +	struct dma_buf_attachment *attach;
> +	struct drm_gem_shmem_object *shmem;
> +	size_t size;
> +	int ret;
> +
> +	if (dma_buf->ops == &drm_gem_shmem_prime_dmabuf_ops) {
> +		struct drm_gem_object *obj;
> +
> +		obj = dma_buf->priv;
> +		if (obj->dev == dev) {
> +			/*
> +			 * Importing dmabuf exported from our own gem increases
> +			 * refcount on gem itself instead of f_count of dmabuf.
> +			 */
> +			drm_gem_object_get(obj);
> +			return obj;
> +		}
> +	}
> +
> +	attach = dma_buf_attach(dma_buf, dev->dev);
> +	if (IS_ERR(attach))
> +		return ERR_CAST(attach);
> +
> +	get_dma_buf(dma_buf);
> +
> +	size = PAGE_ALIGN(attach->dmabuf->size);
> +
> +	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
> +	if (IS_ERR(shmem)) {
> +		ret = PTR_ERR(shmem);
> +		goto fail_detach;
> +	}
> +
> +	drm_dbg_prime(dev, "size = %zu\n", size);
> +
> +	shmem->base.import_attach = attach;
> +	shmem->base.resv = dma_buf->resv;
> +
> +	return &shmem->base;
> +
> +fail_detach:
> +	dma_buf_detach(dma_buf, attach);
> +	dma_buf_put(dma_buf);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import);
> +
>   MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>   MODULE_IMPORT_NS("DMA_BUF");
>   MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index cef5a6b5a4d6..78ef91593a8e 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -110,6 +110,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>   void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>   			  struct iosys_map *map);
>   int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
> +						  int flags);
>   
>   int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>   void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
> @@ -168,6 +170,18 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
>   	drm_gem_shmem_print_info(shmem, p, indent);
>   }
>   
> +/**
> + * drm_gem_shmem_object_prime_export - GEM object function for export()
> + * @obj: GEM object
> + *
> + */
> +static inline struct dma_buf *drm_gem_shmem_object_prime_export(struct drm_gem_object *obj,
> +								int flags)
> +{
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +
> +	return drm_gem_shmem_prime_export(shmem, flags);
> +}
>   /**
>    * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
>    * @obj: GEM object
> @@ -276,6 +290,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>   				    struct sg_table *sgt);
>   int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>   			      struct drm_mode_create_dumb *args);
> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
> +						  struct dma_buf *buf);
>   
>   /**
>    * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
> @@ -287,4 +303,12 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>   	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>   	.dumb_create		   = drm_gem_shmem_dumb_create
>   
> +/**
> + * This macro provides a shmem GEM operations that implementate a simple
> + * gem_prime_import.
> + */
> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
> +	.gem_prime_import	= drm_gem_shmem_prime_import, \
> +	.dumb_create		= drm_gem_shmem_dumb_create
> +
>   #endif /* __DRM_GEM_SHMEM_HELPER_H__ */

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

