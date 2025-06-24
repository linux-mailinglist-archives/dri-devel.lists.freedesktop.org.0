Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00FAE6639
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172CE10E5A3;
	Tue, 24 Jun 2025 13:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="V4IVCmB6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k9MKyAnU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V4IVCmB6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k9MKyAnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD02B10E5A5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:24:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 82BF41F460;
 Tue, 24 Jun 2025 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750771481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LltBA/+GdXK9zzSTRmwPUL/S5nl/ct0iuCcdfx7xkIo=;
 b=V4IVCmB6YGLv6MyO5F3FHya9eldZJTzeiADrdTYmN0dxDaSWucLQKo+5lRZqq7oL1JFnZR
 f856ApgUYKYdj+ONjWvlcFa/VSKGCEGEPo5f8AEiMVpFmJqbKnUQxQAbryOe4+2y6QCihh
 LnNLFEL8zOuLwb0+ZsDbZyZA+eRJDFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750771481;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LltBA/+GdXK9zzSTRmwPUL/S5nl/ct0iuCcdfx7xkIo=;
 b=k9MKyAnUDvWko4Yi3179tPeQzK/zAFVDHuiQ40/52n/r5zlb7CFYrWB6VZjWpL3LL9yfG5
 QNeKBf8LwthR6ADA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750771481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LltBA/+GdXK9zzSTRmwPUL/S5nl/ct0iuCcdfx7xkIo=;
 b=V4IVCmB6YGLv6MyO5F3FHya9eldZJTzeiADrdTYmN0dxDaSWucLQKo+5lRZqq7oL1JFnZR
 f856ApgUYKYdj+ONjWvlcFa/VSKGCEGEPo5f8AEiMVpFmJqbKnUQxQAbryOe4+2y6QCihh
 LnNLFEL8zOuLwb0+ZsDbZyZA+eRJDFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750771481;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LltBA/+GdXK9zzSTRmwPUL/S5nl/ct0iuCcdfx7xkIo=;
 b=k9MKyAnUDvWko4Yi3179tPeQzK/zAFVDHuiQ40/52n/r5zlb7CFYrWB6VZjWpL3LL9yfG5
 QNeKBf8LwthR6ADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DE4613751;
 Tue, 24 Jun 2025 13:24:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3wmWERmnWmi2aAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jun 2025 13:24:41 +0000
Message-ID: <93985dc2-3168-433f-a07b-1ee331100121@suse.de>
Date: Tue, 24 Jun 2025 15:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Test for imported buffers with
 drm_gem_is_imported()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250619121635.105329-1-tzimmermann@suse.de>
 <20250619121635.105329-2-tzimmermann@suse.de>
 <cc313e7d-a570-43e0-82c0-07c94c82e19c@amd.com>
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
In-Reply-To: <cc313e7d-a570-43e0-82c0-07c94c82e19c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
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

Am 24.06.25 um 15:17 schrieb Christian König:
> On 19.06.25 14:15, Thomas Zimmermann wrote:
>> Instead of testing import_attach for imported GEM buffers, invoke
>> drm_gem_is_imported() to do the test.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 14 ++++++--------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 ++--
>>   6 files changed, 13 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index 35c778426a7c..9e463d3ee927 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -1317,7 +1317,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>>   	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
>>   	bo = gem_to_amdgpu_bo(obj);
>>   	domains = amdgpu_display_supported_domains(drm_to_adev(dev), bo->flags);
>> -	if (obj->import_attach && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
>> +	if (drm_gem_is_imported(obj) && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
>>   		drm_dbg_kms(dev, "Cannot create framebuffer from imported dma_buf\n");
>>   		drm_gem_object_put(obj);
>>   		return ERR_PTR(-EINVAL);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index 44e120f9f764..5743ebb2f1b7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -513,7 +513,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
>>   	if (!adev)
>>   		return false;
>>   
>> -	if (obj->import_attach) {
>> +	if (drm_gem_is_imported(obj)) {
>>   		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>>   
>>   		if (dma_buf->ops != &amdgpu_dmabuf_ops)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index e5e33a68d935..d1ccbfcf21fa 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -317,7 +317,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>>   	 */
>>   	if (!vm->is_compute_context || !vm->process_info)
>>   		return 0;
>> -	if (!obj->import_attach ||
>> +	if (!drm_gem_is_imported(obj) ||
>>   	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
>>   		return 0;
>>   	mutex_lock_nested(&vm->process_info->lock, 1);
>> @@ -1024,7 +1024,7 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>>   		break;
>>   	}
>>   	case AMDGPU_GEM_OP_SET_PLACEMENT:
>> -		if (robj->tbo.base.import_attach &&
>> +		if (drm_gem_is_imported(&robj->tbo.base) &&
>>   		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
>>   			r = -EINVAL;
>>   			amdgpu_bo_unreserve(robj);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 73403744331a..989181e5f8e6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -62,7 +62,7 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>>   
>>   	amdgpu_bo_kunmap(bo);
>>   
>> -	if (bo->tbo.base.import_attach)
>> +	if (drm_gem_is_imported(&bo->tbo.base))
>>   		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
>>   	drm_gem_object_release(&bo->tbo.base);
>>   	amdgpu_bo_unref(&bo->parent);
>> @@ -939,7 +939,7 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
>>   		domain = bo->preferred_domains & domain;
>>   
>>   	/* A shared bo cannot be migrated to VRAM */
>> -	if (bo->tbo.base.import_attach) {
>> +	if (drm_gem_is_imported(&bo->tbo.base)) {
>>   		if (domain & AMDGPU_GEM_DOMAIN_GTT)
>>   			domain = AMDGPU_GEM_DOMAIN_GTT;
>>   		else
>> @@ -967,7 +967,7 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
>>   	 */
>>   	domain = amdgpu_bo_get_preferred_domain(adev, domain);
>>   
>> -	if (bo->tbo.base.import_attach)
>> +	if (drm_gem_is_imported(&bo->tbo.base))
>>   		dma_buf_pin(bo->tbo.base.import_attach);
>>   
>>   	/* force to pin into visible video ram */
>> @@ -1018,7 +1018,7 @@ void amdgpu_bo_unpin(struct amdgpu_bo *bo)
>>   	if (bo->tbo.pin_count)
>>   		return;
>>   
>> -	if (bo->tbo.base.import_attach)
>> +	if (drm_gem_is_imported(&bo->tbo.base))
>>   		dma_buf_unpin(bo->tbo.base.import_attach);
>>   
>>   	if (bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>> @@ -1263,7 +1263,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>>   
>>   	amdgpu_bo_kunmap(abo);
>>   
>> -	if (abo->tbo.base.dma_buf && !abo->tbo.base.import_attach &&
>> +	if (abo->tbo.base.dma_buf && !drm_gem_is_imported(&abo->tbo.base) &&
>>   	    old_mem && old_mem->mem_type != TTM_PL_SYSTEM)
>>   		dma_buf_move_notify(abo->tbo.base.dma_buf);
>>   
>> @@ -1576,7 +1576,6 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>>   u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
>>   {
>>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>> -	struct dma_buf_attachment *attachment;
>>   	struct dma_buf *dma_buf;
>>   	const char *placement;
>>   	unsigned int pin_count;
>> @@ -1631,9 +1630,8 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
>>   		seq_printf(m, " pin count %d", pin_count);
>>   
>>   	dma_buf = READ_ONCE(bo->tbo.base.dma_buf);
>> -	attachment = READ_ONCE(bo->tbo.base.import_attach);
>>   
>> -	if (attachment)
>> +	if (drm_gem_is_imported(&bo->tbo.base))
> Mhm we did that here for printing BO information without taking a lock.
>
> That isn't 100% clean since the backing DMA-buf could be destroyed in just that moment, but since it is only used for debugfs hasn't bothered anybody so far.
>
> Maybe putting this in an RCU critical section instead of the READ_ONCE would help? The underlying file is RCU protected.

Together with the READ_ONCE on the dma_buf field, it looks like this is 
fairly special anyway. I'll drop this from the patch.

Best regards
Thomas

>
> Apart from that looks good to me.
>
> Regards,
> Christian.
>
>>   		seq_printf(m, " imported from ino:%lu", file_inode(dma_buf->file)->i_ino);
>>   	else if (dma_buf)
>>   		seq_printf(m, " exported as ino:%lu", file_inode(dma_buf->file)->i_ino);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 9c5df35f05b7..6ce45278d69b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1060,7 +1060,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>>   	/* if the pages have userptr pinning then clear that first */
>>   	if (gtt->userptr) {
>>   		amdgpu_ttm_tt_unpin_userptr(bdev, ttm);
>> -	} else if (ttm->sg && gtt->gobj->import_attach) {
>> +	} else if (ttm->sg && drm_gem_is_imported(gtt->gobj)) {
>>   		struct dma_buf_attachment *attach;
>>   
>>   		attach = gtt->gobj->import_attach;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index 0ff95a56c2ce..04100d4dea03 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -1271,7 +1271,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>>   	} else {
>>   		struct drm_gem_object *obj = &bo->tbo.base;
>>   
>> -		if (obj->import_attach && bo_va->is_xgmi) {
>> +		if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
>>   			struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>>   			struct drm_gem_object *gobj = dma_buf->priv;
>>   			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
>> @@ -1631,7 +1631,7 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>>   		 * validation
>>   		 */
>>   		if (vm->is_compute_context &&
>> -		    bo_va->base.bo->tbo.base.import_attach &&
>> +		    drm_gem_is_imported(&bo_va->base.bo->tbo.base) &&
>>   		    (!bo_va->base.bo->tbo.resource ||
>>   		     bo_va->base.bo->tbo.resource->mem_type == TTM_PL_SYSTEM))
>>   			amdgpu_vm_bo_evicted_user(&bo_va->base);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

