Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42423B2D775
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EF110E6B9;
	Wed, 20 Aug 2025 09:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rW8LlTp5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TNJr8Cbe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f2pomFcH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GAlbcD52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7EA10E6BE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:04:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 335F81F7B0;
 Wed, 20 Aug 2025 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755680694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nZ//gYY6UXXsx8QcVxJZiYWNUdOZeg7R6DnSFft/9ko=;
 b=rW8LlTp5Ius2uMmiWYqVwjeWp+YC2tYAXBljI9+eeJ0JmFnW5tylR0DNB8x8Z+4yJ9IIVO
 YrWSReN62jrRzUiHDjSrWYOWRQB2+JDl5VBs4i+g6Zw4qGHL+O14vRKbV4F08zhuhcxJpp
 t5aTBOq0KeGaPJUGUvCVXCQ9BI4gHIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755680694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nZ//gYY6UXXsx8QcVxJZiYWNUdOZeg7R6DnSFft/9ko=;
 b=TNJr8Cbe8WiZNrEobLpZEppNUMiLfbnxJrDdSJcIB0jRWHFi9vANAh0ptiW40NQFAWno3W
 yFzkVbCGxfWkxuAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f2pomFcH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GAlbcD52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755680693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nZ//gYY6UXXsx8QcVxJZiYWNUdOZeg7R6DnSFft/9ko=;
 b=f2pomFcHTALt76PEmDQKAAWWh/vx1Hy6018RNVGOx9Ejrw/sfEde/Y7l1G9iaBEzw4eJlT
 oxtNRHZsAuW9aUzJVGYruT+WHhT3ZivO5IWRIq/ytPo8Bs4tW8GyI83WpD9QOWOdqLXTmn
 AwcmXp6jD5msYuCurUQJnTOF+EYB+ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755680693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nZ//gYY6UXXsx8QcVxJZiYWNUdOZeg7R6DnSFft/9ko=;
 b=GAlbcD52iVotZJkLmCBtrtGaL2bcOF3GBEearKbQ1jwn4JNiLKWkUYkT7SBy+B3KC4kNyA
 e2kClt2La73YPfDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF4271368B;
 Wed, 20 Aug 2025 09:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id N/xoMbSPpWigdgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Aug 2025 09:04:52 +0000
Message-ID: <1dcb967f-4e7f-4a6b-957c-924d2dec55fc@suse.de>
Date: Wed, 20 Aug 2025 11:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: Pin buffers while vmap'ing exported
 dma-buf objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 sumit.semwal@linaro.org, oushixiong@kylinos.cn, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250818151710.284982-1-tzimmermann@suse.de>
 <f31550b1-b89c-47d6-b012-99479ba12aeb@amd.com>
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
In-Reply-To: <f31550b1-b89c-47d6-b012-99479ba12aeb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 335F81F7B0
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[amd.com,linaro.org,kylinos.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,amd.com:email,suse.de:dkim,suse.de:mid,suse.de:email];
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

Am 18.08.25 um 17:43 schrieb Christian König:
> On 18.08.25 17:17, Thomas Zimmermann wrote:
>> Current dma-buf vmap semantics require that the mapped buffer remains
>> in place until the corresponding vunmap has completed.
>>
>> For GEM-SHMEM, this used to be guaranteed by a pin operation while creating
>> an S/G table in import. GEM-SHMEN can now import dma-buf objects without
>> creating the S/G table, so the pin is missing. Leads to page-fault errors,
>> such as the one shown below.
>>
>> [  102.101726] BUG: unable to handle page fault for address: ffffc90127000000
>> [...]
>> [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>> [...]
>> [  102.243250] Call Trace:
>> [  102.245695]  <TASK>
>> [  102.2477V95]  ? validate_chain+0x24e/0x5e0
>> [  102.251805]  ? __lock_acquire+0x568/0xae0
>> [  102.255807]  udl_render_hline+0x165/0x341 [udl]
>> [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
>> [  102.265379]  ? local_clock_noinstr+0xb/0x100
>> [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
>> [  102.274246]  ? mark_held_locks+0x40/0x70
>> [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
>> [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
>> [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
>> [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
>> [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
>> [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
>> [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
>> [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
>> [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
>> [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
>> [  102.333622]  commit_tail+0x204/0x330
>> [...]
>> [  102.529946] ---[ end trace 0000000000000000 ]---
>> [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>>
>> In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
>> dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating the
>> mapping.
>>
>> Provide a custom dma-buf vmap method in amdgpu that pins the object before
>> mapping it's buffer's pages into kernel address space. Do the opposite in
>> vunmap.
>>
>> Note that dma-buf vmap differs from GEM vmap in how it handles relocation.
>> While dma-buf vmap keeps the buffer in place, GEM vmap requires the caller
>> to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf code
>> instead of its GEM code.
>>
>> A discussion of various approaches to solving the problem is available
>> at [1].
>>
>> v2:
>> - only use mapable domains (Christian)
>> - try pinning to domains in prefered order
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping its sg_table")
>> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
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
>> Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de/ # [1]
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 41 ++++++++++++++++++++-
>>   1 file changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index 5743ebb2f1b7..471b41bd3e29 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -285,6 +285,43 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>>   	return ret;
>>   }
>>   
>> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>> +{
>> +	struct drm_gem_object *obj = dma_buf->priv;
>> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>> +	int ret;
>> +
>> +	/*
>> +	 * Pin to keep buffer in place while it's vmap'ed. The actual
>> +	 * domain is not that important as long as it's mapable. Using
>> +	 * GTT should be compatible with most use cases. VRAM and CPU
>> +	 * are the fallbacks if the buffer has already been pinned there.
>> +	 */
>> +	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
>> +	if (ret) {
>> +		ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_VRAM);
> That makes even less sense :)

This is intentional so that amdgpu first tries the most compatible 
domain GTT and VRAM only as a second option.

>
> The values are a mask, try this:
>
> ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DOMAIN_VRAM);

I'm aware that it's a bitmask. But IIUC 
amdgpu_bo_placement_from_domain() [1] prefers VRAM over GTT if both are 
given. If another importer now comes that requires the BO in GTT, it 
would fail the pin.

[1] 
https://elixir.bootlin.com/linux/v6.16.1/source/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c#L109

>
> Otherwise the pin code will try to move the buffer around to satisfy the contrain you given.

>
> And don't use the CPU domain here, this will otherwise potentially block submission later on.

Ok.

Best regards
Thomas

>
> Regards,
> Christian.
>
>> +		if (ret) {
>> +			ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_CPU);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	}
>> +	ret = drm_gem_dmabuf_vmap(dma_buf, map);
>> +	if (ret)
>> +		amdgpu_bo_unpin(bo);
>> +
>> +	return ret;
>> +}
>> +
>> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>> +{
>> +	struct drm_gem_object *obj = dma_buf->priv;
>> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>> +
>> +	drm_gem_dmabuf_vunmap(dma_buf, map);
>> +	amdgpu_bo_unpin(bo);
>> +}
>> +
>>   const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>   	.attach = amdgpu_dma_buf_attach,
>>   	.pin = amdgpu_dma_buf_pin,
>> @@ -294,8 +331,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>   	.release = drm_gem_dmabuf_release,
>>   	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>>   	.mmap = drm_gem_dmabuf_mmap,
>> -	.vmap = drm_gem_dmabuf_vmap,
>> -	.vunmap = drm_gem_dmabuf_vunmap,
>> +	.vmap = amdgpu_dma_buf_vmap,
>> +	.vunmap = amdgpu_dma_buf_vunmap,
>>   };
>>   
>>   /**

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


