Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D3B29C95
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 10:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2927010E3F3;
	Mon, 18 Aug 2025 08:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M2U3N+dN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oMLZiTsy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M2U3N+dN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oMLZiTsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC1010E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 08:47:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C8F81F79A;
 Mon, 18 Aug 2025 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755506828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3hxmyqsalvedkmXdU+NKAOnUhZ5dwWvAyFOGDZxjOQM=;
 b=M2U3N+dN5FHZhEA/0xIgMCJNFuwnniEaT3O0EgGPJoZ0a/NnB/jkYbXd1XXJRIxelUmanw
 n7+kkyaPRLo0B/oYPKwOf5F8DvUnghKcYhUiM4FFNzQPGSllXmeQg401k6w/PBER+SDoqC
 BlED/bSibiocwka0oGMbXYCaSbDaPhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755506828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3hxmyqsalvedkmXdU+NKAOnUhZ5dwWvAyFOGDZxjOQM=;
 b=oMLZiTsy7ILpv8oNrcXZebuq+ApotCs6XdSTISqICFBjhiVAqcA9jdS0oywe8lFCq8Ul4a
 4id4TIj84Jj/KcBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755506828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3hxmyqsalvedkmXdU+NKAOnUhZ5dwWvAyFOGDZxjOQM=;
 b=M2U3N+dN5FHZhEA/0xIgMCJNFuwnniEaT3O0EgGPJoZ0a/NnB/jkYbXd1XXJRIxelUmanw
 n7+kkyaPRLo0B/oYPKwOf5F8DvUnghKcYhUiM4FFNzQPGSllXmeQg401k6w/PBER+SDoqC
 BlED/bSibiocwka0oGMbXYCaSbDaPhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755506828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3hxmyqsalvedkmXdU+NKAOnUhZ5dwWvAyFOGDZxjOQM=;
 b=oMLZiTsy7ILpv8oNrcXZebuq+ApotCs6XdSTISqICFBjhiVAqcA9jdS0oywe8lFCq8Ul4a
 4id4TIj84Jj/KcBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FE9F13686;
 Mon, 18 Aug 2025 08:47:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zm9wAozoomguLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 08:47:08 +0000
Message-ID: <6b039d9b-90a4-4527-9a6a-783137793d7f@suse.de>
Date: Mon, 18 Aug 2025 10:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Pin and unpin buffers when importing w/o
 S/G table
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, oushixiong@kylinos.cn, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250814073507.18587-1-tzimmermann@suse.de>
 <790da31e-b20c-4ad3-a534-de55cd741519@suse.de>
Content-Language: en-US
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
In-Reply-To: <790da31e-b20c-4ad3-a534-de55cd741519@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_TO(0.00)[linaro.org,amd.com,kylinos.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 URIBL_BLOCKED(0.00)[linaro.org:email,ffwll.ch:email,imap1.dmz-prg2.suse.org:helo,amd.com:email,suse.de:mid,suse.de:email,kylinos.cn:email,lists.freedesktop.org:email,intel.com:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email, suse.de:mid, suse.de:email,
 kylinos.cn:email, lists.freedesktop.org:email, intel.com:email,
 imap1.dmz-prg2.suse.org:helo]
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



Am 15.08.25 um 08:02 schrieb Thomas Zimmermann:
> FYI this patch got feedback at
>
> https://lore.kernel.org/dri-devel/805acaca-3b91-438d-b842-25c055fd898c@amd.com/ 
>
>
> Preferably the problem should be addressed on GEM/PRIME code instead 
> of dma-buf.

Follow-up patch is at 
https://lore.kernel.org/dri-devel/20250818084148.212443-1-tzimmermann@suse.de/

>
> Best regards
> Thomas
>
> Am 14.08.25 um 09:34 schrieb Thomas Zimmermann:
>> Imported dma-buf objects need to be pinned while being vmap'ed into
>> kernel address space. This used to be done before while creating an
>> S/G table.
>>
>> GEM-SHMEN can import dma-buf objects without creating the S/G table,
>> but the pin/unpin is now missing. Leads to page-mapping errors such
>> as the one shown below.
>>
>> [  102.101726] BUG: unable to handle page fault for address: 
>> ffffc90127000000
>> [...]
>> [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>> [...]
>> [  102.243250] Call Trace:
>> [  102.245695]  <TASK>
>> [  102.2477V95]  ? validate_chain+0x24e/0x5e0
>> [  102.251805]  ? __lock_acquire+0x568/0xae0
>> [  102.255807]  udl_render_hline+0x165/0x341 [udl]
>> [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
>> [  102.265379]  ? local_clock_noinstr+0xb/0x100
>> [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
>> [  102.274246]  ? mark_held_locks+0x40/0x70
>> [  102.278177] udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
>> [  102.284606]  ? 
>> __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
>> [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
>> [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
>> [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
>> [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
>> [  102.311028]  ? 
>> drm_atomic_helper_calc_timestamping_constants+0x141/0x200
>> [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
>> [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
>> [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
>> [  102.333622]  commit_tail+0x204/0x330
>> [...]
>> [  102.529946] ---[ end trace 0000000000000000 ]---
>> [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>>
>> Support pin/unpin in drm_buf_map_attachment() without creating an S/G
>> table. Passing DMA_NONE for the DMA direction will only pin. Do the
>> inverse for unmap_attachment(). Modify GEM-SHMEM accordingly, so that
>> it pins the imported dma-buf.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping 
>> its sg_table")
>> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Closes: 
>> https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
>> Cc: Shixiong Ou <oushixiong@kylinos.cn>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> ---
>>   drivers/dma-buf/dma-buf.c              | 16 +++++++++++++---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 11 ++++++++++-
>>   drivers/gpu/drm/drm_prime.c            |  2 ++
>>   3 files changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 2bcf9ceca997..f1e1385ce630 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -1086,7 +1086,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, "DMA_BUF");
>>    * @direction:    [in]    direction of DMA transfer
>>    *
>>    * Returns sg_table containing the scatterlist to be returned; 
>> returns ERR_PTR
>> - * on error. May return -EINTR if it is interrupted by a signal.
>> + * on error. May return -EINTR if it is interrupted by a signal. 
>> Returns NULL
>> + * on success iff direction is DMA_NONE.
>>    *
>>    * On success, the DMA addresses and lengths in the returned 
>> scatterlist are
>>    * PAGE_SIZE aligned.
>> @@ -1122,6 +1123,8 @@ struct sg_table *dma_buf_map_attachment(struct 
>> dma_buf_attachment *attach,
>>           if (ret)
>>               return ERR_PTR(ret);
>>       }
>> +    if (!valid_dma_direction(direction))
>> +        return NULL; /* only pin; don't map */
>>         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>>       if (!sg_table)
>> @@ -1216,14 +1219,21 @@ void dma_buf_unmap_attachment(struct 
>> dma_buf_attachment *attach,
>>   {
>>       might_sleep();
>>   -    if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
>> +    if (WARN_ON(!attach || !attach->dmabuf))
>>           return;
>>         dma_resv_assert_held(attach->dmabuf->resv);
>>   +    if (!valid_dma_direction(direction))
>> +        goto unpin;
>> +
>> +    if (WARN_ON(!sg_table))
>> +        return;
>> +
>>       mangle_sg_table(sg_table);
>>       attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>   +unpin:
>>       if (dma_buf_pin_on_map(attach))
>>           attach->dmabuf->ops->unpin(attach);
>>   }
>> @@ -1245,7 +1255,7 @@ void dma_buf_unmap_attachment_unlocked(struct 
>> dma_buf_attachment *attach,
>>   {
>>       might_sleep();
>>   -    if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
>> +    if (WARN_ON(!attach || !attach->dmabuf))
>>           return;
>>         dma_resv_lock(attach->dmabuf->resv, NULL);
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c 
>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 5d1349c34afd..1b66501420d3 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -817,6 +817,7 @@ struct drm_gem_object 
>> *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>>                                struct dma_buf *dma_buf)
>>   {
>>       struct dma_buf_attachment *attach;
>> +    struct sg_table *sgt;
>>       struct drm_gem_shmem_object *shmem;
>>       struct drm_gem_object *obj;
>>       size_t size;
>> @@ -838,12 +839,18 @@ struct drm_gem_object 
>> *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>>         get_dma_buf(dma_buf);
>>   +    sgt = dma_buf_map_attachment_unlocked(attach, DMA_NONE);
>> +    if (IS_ERR(sgt)) {
>> +        ret = PTR_ERR(sgt);
>> +        goto fail_detach;
>> +    }
>> +
>>       size = PAGE_ALIGN(attach->dmabuf->size);
>>         shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>>       if (IS_ERR(shmem)) {
>>           ret = PTR_ERR(shmem);
>> -        goto fail_detach;
>> +        goto fail_unmap;
>>       }
>>         drm_dbg_prime(dev, "size = %zu\n", size);
>> @@ -853,6 +860,8 @@ struct drm_gem_object 
>> *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>>         return &shmem->base;
>>   +fail_unmap:
>> +    dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_NONE);
>>   fail_detach:
>>       dma_buf_detach(dma_buf, attach);
>>       dma_buf_put(dma_buf);
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 43a10b4af43a..b3b070868e3b 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -1109,6 +1109,8 @@ void drm_prime_gem_destroy(struct 
>> drm_gem_object *obj, struct sg_table *sg)
>>       attach = obj->import_attach;
>>       if (sg)
>>           dma_buf_unmap_attachment_unlocked(attach, sg, 
>> DMA_BIDIRECTIONAL);
>> +    else
>> +        dma_buf_unmap_attachment_unlocked(attach, NULL, DMA_NONE);
>>       dma_buf = attach->dmabuf;
>>       dma_buf_detach(attach->dmabuf, attach);
>>       /* remove the reference */
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


