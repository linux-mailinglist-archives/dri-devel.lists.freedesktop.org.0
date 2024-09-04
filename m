Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F096B9F6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 13:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0999310E762;
	Wed,  4 Sep 2024 11:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E8iHj6dr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TETMC/K/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E8iHj6dr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TETMC/K/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DC910E762
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:16:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95964219AE;
 Wed,  4 Sep 2024 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725448602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3f4k2uwSJVCVRbOUxb9IM3BC9rK5Ayd6RyaWkn65vQM=;
 b=E8iHj6drznelGDC/YyMYzkC5wwgJmaXL39UtyFSTStyiWerzcWv0HX4VxOc9DMl+33CamF
 mT/fn5jpu7mTco2PZJJxy9Jg94MCMGVhsh0Uuun82MnUoRdC0c7FPmULNMn8yHpWb4fCt2
 mWrxFXjGmq5o1KxgtKtJwuHaDhmWzGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725448602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3f4k2uwSJVCVRbOUxb9IM3BC9rK5Ayd6RyaWkn65vQM=;
 b=TETMC/K/csGPwPbrJyuiSM2NBWibD6L+AzDWrPsXPoGR3l/OTFeAmNZX1p3Dr+rvtBqMpS
 Btu0LP17fYVu7sAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E8iHj6dr;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="TETMC/K/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725448602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3f4k2uwSJVCVRbOUxb9IM3BC9rK5Ayd6RyaWkn65vQM=;
 b=E8iHj6drznelGDC/YyMYzkC5wwgJmaXL39UtyFSTStyiWerzcWv0HX4VxOc9DMl+33CamF
 mT/fn5jpu7mTco2PZJJxy9Jg94MCMGVhsh0Uuun82MnUoRdC0c7FPmULNMn8yHpWb4fCt2
 mWrxFXjGmq5o1KxgtKtJwuHaDhmWzGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725448602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3f4k2uwSJVCVRbOUxb9IM3BC9rK5Ayd6RyaWkn65vQM=;
 b=TETMC/K/csGPwPbrJyuiSM2NBWibD6L+AzDWrPsXPoGR3l/OTFeAmNZX1p3Dr+rvtBqMpS
 Btu0LP17fYVu7sAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 578EA139E2;
 Wed,  4 Sep 2024 11:16:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 19EcFJpB2GagOAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Sep 2024 11:16:42 +0000
Message-ID: <cd4543a3-c704-4e91-a63b-c484a168b3dc@suse.de>
Date: Wed, 4 Sep 2024 13:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-dma: Only install deferred I/O if necessary
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: javierm@redhat.com, alexander.stein@ew.tq-group.com,
 linus.walleij@linaro.org, daniel@ffwll.ch, airlied@gmail.com,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20240904093140.15203-1-tzimmermann@suse.de>
 <ZtgvgUT-ZvLIMeIb@phenom.ffwll.local>
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
In-Reply-To: <ZtgvgUT-ZvLIMeIb@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 95964219AE
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ew.tq-group.com,linaro.org,ffwll.ch,gmail.com,lists.freedesktop.org,linux.intel.com,kernel.org];
 MID_RHS_MATCH_FROM(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email, suse.de:dkim, suse.de:mid]
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

Hi

Am 04.09.24 um 11:59 schrieb Simona Vetter:
> On Wed, Sep 04, 2024 at 11:31:23AM +0200, Thomas Zimmermann wrote:
>> Deferred I/O requires struct page for framebuffer memory, which is
>> not guaranteed for all DMA ranges. We thus only install deferred I/O
>> if we have a framebuffer that requires it.
>>
>> A reported bug affected the ipu-v3 and pl111 drivers, which have video
>> memory in either Normal or HighMem zones
>>
>> [    0.000000] Zone ranges:
>> [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
>> [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
>>
>> where deferred I/O only works correctly with HighMem. See the Closes
>> tags for bug reports.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 808a40b69468 ("drm/fbdev-dma: Implement damage handling and deferred I/O")
>> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Closes: https://lore.kernel.org/all/23636953.6Emhk5qWAg@steina-w/
>> Reported-by: Linus Walleij <linus.walleij@linaro.org>
>> Closes: https://lore.kernel.org/dri-devel/CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com/
>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
> I guess yet another reason we should look into vma-interception using
> mkwrite and read-only ptes, but that's a lot of typing and I think this
> should work interim at least.
>
>> ---
>>   drivers/gpu/drm/drm_fbdev_dma.c | 71 ++++++++++++++++++++++++---------
>>   1 file changed, 52 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
>> index 7ef5a48c8029..455dc48d17a7 100644
>> --- a/drivers/gpu/drm/drm_fbdev_dma.c
>> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
>> @@ -36,20 +36,11 @@ static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
>>   	return 0;
>>   }
>>   
>> -FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(drm_fbdev_dma,
>> -				   drm_fb_helper_damage_range,
>> -				   drm_fb_helper_damage_area);
>> -
>>   static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>>   {
>>   	struct drm_fb_helper *fb_helper = info->par;
>> -	struct drm_framebuffer *fb = fb_helper->fb;
>> -	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
>>   
>> -	if (!dma->map_noncoherent)
>> -		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>> -
>> -	return fb_deferred_io_mmap(info, vma);
>> +	return drm_gem_prime_mmap(fb_helper->buffer->gem, vma);
>>   }
>>   
>>   static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
>> @@ -70,13 +61,40 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
>>   }
>>   
>>   static const struct fb_ops drm_fbdev_dma_fb_ops = {
>> +	.owner = THIS_MODULE,
>> +	.fb_open = drm_fbdev_dma_fb_open,
>> +	.fb_release = drm_fbdev_dma_fb_release,
>> +	__FB_DEFAULT_DMAMEM_OPS_RDWR,
>> +	DRM_FB_HELPER_DEFAULT_OPS,
>> +	__FB_DEFAULT_DMAMEM_OPS_DRAW,
>> +	.fb_mmap = drm_fbdev_dma_fb_mmap,
>> +	.fb_destroy = drm_fbdev_dma_fb_destroy,
>> +};
>> +
>> +FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(drm_fbdev_dma,
>> +				   drm_fb_helper_damage_range,
>> +				   drm_fb_helper_damage_area);
>> +
>> +static int drm_fbdev_dma_deferred_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>> +{
>> +	struct drm_fb_helper *fb_helper = info->par;
>> +	struct drm_framebuffer *fb = fb_helper->fb;
>> +	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
>> +
>> +	if (!dma->map_noncoherent)
>> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>> +
>> +	return fb_deferred_io_mmap(info, vma);
>> +}
>> +
>> +static const struct fb_ops drm_fbdev_dma_deferred_fb_ops = {
>>   	.owner = THIS_MODULE,
>>   	.fb_open = drm_fbdev_dma_fb_open,
>>   	.fb_release = drm_fbdev_dma_fb_release,
>>   	__FB_DEFAULT_DEFERRED_OPS_RDWR(drm_fbdev_dma),
>>   	DRM_FB_HELPER_DEFAULT_OPS,
>>   	__FB_DEFAULT_DEFERRED_OPS_DRAW(drm_fbdev_dma),
>> -	.fb_mmap = drm_fbdev_dma_fb_mmap,
>> +	.fb_mmap = drm_fbdev_dma_deferred_fb_mmap,
>>   	.fb_destroy = drm_fbdev_dma_fb_destroy,
>>   };
>>   
>> @@ -89,6 +107,7 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>   {
>>   	struct drm_client_dev *client = &fb_helper->client;
>>   	struct drm_device *dev = fb_helper->dev;
>> +	bool use_deferred_io = false;
>>   	struct drm_client_buffer *buffer;
>>   	struct drm_gem_dma_object *dma_obj;
>>   	struct drm_framebuffer *fb;
>> @@ -111,6 +130,15 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>   
>>   	fb = buffer->fb;
>>   
>> +	/*
>> +	 * Deferred I/O requires struct page for framebuffer memory,
>> +	 * which is not guaranteed for all DMA ranges. We thus only
>> +	 * install deferred I/O if we have a framebuffer that requires
>> +	 * it.
>> +	 */
>> +	if (fb->funcs->dirty)
>> +		use_deferred_io = true;
>> +
>>   	ret = drm_client_buffer_vmap(buffer, &map);
>>   	if (ret) {
>>   		goto err_drm_client_buffer_delete;
>> @@ -130,7 +158,10 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>   
>>   	drm_fb_helper_fill_info(info, fb_helper, sizes);
>>   
>> -	info->fbops = &drm_fbdev_dma_fb_ops;
>> +	if (use_deferred_io)
>> +		info->fbops = &drm_fbdev_dma_deferred_fb_ops;
>> +	else
>> +		info->fbops = &drm_fbdev_dma_fb_ops;
>>   
>>   	/* screen */
>>   	info->flags |= FBINFO_VIRTFB; /* system memory */
>> @@ -145,13 +176,15 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>   	info->fix.smem_len = info->screen_size;
>>   
>>   	/* deferred I/O */
>> -	fb_helper->fbdefio.delay = HZ / 20;
>> -	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
>> -
>> -	info->fbdefio = &fb_helper->fbdefio;
>> -	ret = fb_deferred_io_init(info);
>> -	if (ret)
>> -		goto err_drm_fb_helper_release_info;
>> +	if (use_deferred_io) {
> I think a check here that roughly matches what fb_deferred_io_get_page
> does would be good. Specifically this part
>
> 	if (is_vmalloc_addr(screen_buffer + offs))
> 		page = vmalloc_to_page(screen_buffer + offs);
> 	else if (info->fix.smem_start)
> 		page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);
>
> So maybe something like:
>
> 	if (!is_vmalloc_addr(screen_buffer))
> 		if (WARN_ON(!pfn_to_page())))
> 			use_deferred_io = false;
>
> With maye a comment that we assume buffers aren't a hiliarious mix?

Ok.

>
> I worry about drivers that a) are on very special platforms where our dma
> memory might not be page backed and b) use manual upload like over i2c or
> spi. That sounds like a rather like embedded use-case combo ...

The solution here is just a quick-fix and luckily we already have a 
solution. You've probably seen the rework of the client setup in [1]. 
That series adds struct drm_driver.fbdev_probe, which will then 
implement fbdev buffer creation. In the next iteration, I plan to 
provide an implementation for DMA BOs with deferred I/O and another one 
without deferred I/O, so each driver can select the one it requires. In 
the worst case, a driver can provide its own implementation.

[1] https://patchwork.freedesktop.org/series/137391/

>
> With something like that added:
>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Thanks for reviewing.

Best regards
Thomas

>
> Cheers, Sima
>> +		fb_helper->fbdefio.delay = HZ / 20;
>> +		fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
>> +
>> +		info->fbdefio = &fb_helper->fbdefio;
>> +		ret = fb_deferred_io_init(info);
>> +		if (ret)
>> +			goto err_drm_fb_helper_release_info;
>> +	}
>>   
>>   	return 0;
>>   
>> -- 
>> 2.46.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

