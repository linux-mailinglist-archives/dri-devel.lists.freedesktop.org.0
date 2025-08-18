Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28036B2AC45
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6044710E46B;
	Mon, 18 Aug 2025 15:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RYWCd55x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cRz4Sfdg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RYWCd55x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cRz4Sfdg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F145310E46B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 15:15:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D3F921747;
 Mon, 18 Aug 2025 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755530130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pPaXx3GogupYUzudWeXDprQsHT8asP4kTul//FivS9Q=;
 b=RYWCd55xZLaZONp7prQ3mH50rrSmh1QQtWKv8V+nio8tdSTQHXRYh5PmwpFl+N6Sy1VF1o
 6/FwfAZVGfp10PzYPSASQb5xyjxFZQ25Uj/hj8ncNTItLzbECMxocBfjmaajynAtHbiA69
 pa3y1YcBYek9CeYfJ1h/YLd6G+S61Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755530130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pPaXx3GogupYUzudWeXDprQsHT8asP4kTul//FivS9Q=;
 b=cRz4Sfdg3ADJWsIAuK/dNAM76hCO7xUoz0dlG2jiVqh6Wc/l+ztT9xi9RMEEyprkCUOI7C
 MlLhzOZY5szA5pAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RYWCd55x;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cRz4Sfdg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755530130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pPaXx3GogupYUzudWeXDprQsHT8asP4kTul//FivS9Q=;
 b=RYWCd55xZLaZONp7prQ3mH50rrSmh1QQtWKv8V+nio8tdSTQHXRYh5PmwpFl+N6Sy1VF1o
 6/FwfAZVGfp10PzYPSASQb5xyjxFZQ25Uj/hj8ncNTItLzbECMxocBfjmaajynAtHbiA69
 pa3y1YcBYek9CeYfJ1h/YLd6G+S61Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755530130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pPaXx3GogupYUzudWeXDprQsHT8asP4kTul//FivS9Q=;
 b=cRz4Sfdg3ADJWsIAuK/dNAM76hCO7xUoz0dlG2jiVqh6Wc/l+ztT9xi9RMEEyprkCUOI7C
 MlLhzOZY5szA5pAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D549C13A55;
 Mon, 18 Aug 2025 15:15:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vDi1MpFDo2jXLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 15:15:29 +0000
Message-ID: <7a470b3f-fc20-476e-bc97-be9008d5aeef@suse.de>
Date: Mon, 18 Aug 2025 17:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Pin buffer while vmap'ing exported dma-buf
 objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 sumit.semwal@linaro.org, oushixiong@kylinos.cn, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250818084148.212443-1-tzimmermann@suse.de>
 <6f409954-2e01-4e87-b8b7-5688bea837f6@amd.com>
 <7c2d8894-7eb5-4c86-a80a-935fcf24ef83@suse.de>
 <6cb1d152-898a-4cc4-a086-44d85cf7a24d@amd.com>
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
In-Reply-To: <6cb1d152-898a-4cc4-a086-44d85cf7a24d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3D3F921747
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
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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

Hi Christian

Am 18.08.25 um 15:23 schrieb Christian König:
> On 18.08.25 14:46, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 18.08.25 um 14:40 schrieb Christian König:
>> [...]
>>>> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>>>> +{
>>>> +    struct drm_gem_object *obj = dma_buf->priv;
>>>> +    struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>>> +    int ret;
>>>> +
>>>> +    /*
>>>> +     * Pin to keep buffer in place while it's vmap'ed. The actual
>>>> +     * location is not important as long as it's mapable.
>>> Yeah, exactly that won't work here. Most of the locations are not CPU accessible.
>>>
>>> You could use AMDGPU_GEM_DOMAIN_GTT, that should most likely work in all cases but isn't necessarily the most optimal solution.
>> No problem about that, but why not a bit more flexibility? When udl copies from the buffer, it is likely pinned to VRAM.
>>
>> A bit mask of _CPU, _GTT, and _VRAM should work fine. The other domains are probably irrelevant for our use case.
> The problem is that as soon as you pin into this domain you get an error if you try to pin into another domain.
>
> So if you try to use the same buffer with udl and amdgpu scanout and pin it into GTT -> error.
>
> If you try to use the same buffer with udl and V4L and pin it into VRAM -> error.

What you're describing is exactly the current situation for udl plus 
amdgpu now. When udl tries to pin, amdgpu has already pinned the buffer 
to VRAM. So it doesn't work. There needs to be at least VRAM and GTT in 
the list. What does work is to try pinning to various domains in the 
preferred order.

Best regards
Thomas

>
> There is not works for everybody case here and we need to guess. Pinning it into GTT is just what works most likely.
>
> Regards,
> Christian.
>
>> Best regards
>> Thomas
>>
>>> Regards,
>>> Christian.
>>>
>>>> +     *
>>>> +     * This code is required for exporting to GEM-SHMEM without S/G table.
>>>> +     * Once GEM-SHMEM supports dynamic imports, it should be dropped.
>>>> +     */
>>>> +    ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_MASK);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +    ret = drm_gem_dmabuf_vmap(dma_buf, map);
>>>> +    if (ret)
>>>> +        amdgpu_bo_unpin(bo);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>>>> +{
>>>> +    struct drm_gem_object *obj = dma_buf->priv;
>>>> +    struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>>> +
>>>> +    drm_gem_dmabuf_vunmap(dma_buf, map);
>>>> +    amdgpu_bo_unpin(bo);
>>>> +}
>>>> +
>>>>    const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>>>        .attach = amdgpu_dma_buf_attach,
>>>>        .pin = amdgpu_dma_buf_pin,
>>>> @@ -294,8 +326,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>>>        .release = drm_gem_dmabuf_release,
>>>>        .begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>>>>        .mmap = drm_gem_dmabuf_mmap,
>>>> -    .vmap = drm_gem_dmabuf_vmap,
>>>> -    .vunmap = drm_gem_dmabuf_vunmap,
>>>> +    .vmap = amdgpu_dma_buf_vmap,
>>>> +    .vunmap = amdgpu_dma_buf_vunmap,
>>>>    };
>>>>      /**

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


