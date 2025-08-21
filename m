Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E4B2FBF3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E436010E9A6;
	Thu, 21 Aug 2025 14:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M/b3gb9K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LGC4zeGC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yAqnGrED";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yDgcAsut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A26310E9A4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:10:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A3C321F10;
 Thu, 21 Aug 2025 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755785447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jmm3Rcgx45Ek6+6JOc9UdX6C5lNjJzPeNBj+B3KBHSY=;
 b=M/b3gb9KaYn+zgSZBCrWoZy9gYsN1SytbN4WLLljsbYIBCO0FLUaVth30knSJeAm/BRn9s
 jBFQagENcGz8AuBHBFn8NTmejzpCer5jA2O4nmhydlFulsuJUZAuXRYz5s6EWOVF4O11gu
 Tah/3cnM8GeArDURRe+Rfy0yiE/WGSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755785447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jmm3Rcgx45Ek6+6JOc9UdX6C5lNjJzPeNBj+B3KBHSY=;
 b=LGC4zeGC+rWkFcXT4TIxucWDlKtBRqg4kPI5eBDA9QydlKDoh7pMgzjBipJi3fuD6fDEET
 +8oxl6FDNEEZBeAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yAqnGrED;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yDgcAsut
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755785446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jmm3Rcgx45Ek6+6JOc9UdX6C5lNjJzPeNBj+B3KBHSY=;
 b=yAqnGrEDV1/qNKKLM/r92HaigufAqe/1hjYNLOo5g2pOtDG0g5gkosQ5kVxni6fbJtRbm4
 OB1MX3Y6A2qDP7kdq4noz8S1mqaNAGdSxsrThxUPgrr8iYoCpIL8qM/gGfhBO9Evyervxj
 F32w/0TRvLO8cembLa+UYclsO33mNKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755785446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jmm3Rcgx45Ek6+6JOc9UdX6C5lNjJzPeNBj+B3KBHSY=;
 b=yDgcAsutsJJ4VK9wRHIw303rhsFxxyJDnyy/uVzVcZwKfLD/IJbJjTmNd86GkT2zNRcUBK
 83vACgJrqiE21zBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E52CF13867;
 Thu, 21 Aug 2025 14:10:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XhlQNuUop2g8eQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 14:10:45 +0000
Message-ID: <37cacb29-e382-400c-b4fb-bed733ce480b@suse.de>
Date: Thu, 21 Aug 2025 16:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH v3] drm/amdgpu: Pin buffers while
 vmap'ing exported dma-buf objects
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: sumit.semwal@linaro.org, oushixiong@kylinos.cn,
 alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250821064031.39090-1-tzimmermann@suse.de>
 <b92c072b-a302-47c8-b2c2-f4b2e3954165@amd.com>
 <CADnq5_PxpsXkzzpa8KJoZL-pBaM2ViVBOaXuYkYyd_xHBNLt9A@mail.gmail.com>
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
In-Reply-To: <CADnq5_PxpsXkzzpa8KJoZL-pBaM2ViVBOaXuYkYyd_xHBNLt9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[14];
 FREEMAIL_TO(0.00)[gmail.com,amd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linaro.org,kylinos.cn,amd.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:email,linaro.org:email,suse.de:mid,suse.de:dkim,suse.de:email];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 5A3C321F10
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

Hi

Am 21.08.25 um 15:13 schrieb Alex Deucher:
> On Thu, Aug 21, 2025 at 4:52 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> On 21.08.25 08:40, Thomas Zimmermann wrote:
>>> Current dma-buf vmap semantics require that the mapped buffer remains
>>> in place until the corresponding vunmap has completed.
>>>
>>> For GEM-SHMEM, this used to be guaranteed by a pin operation while creating
>>> an S/G table in import. GEM-SHMEN can now import dma-buf objects without
>>> creating the S/G table, so the pin is missing. Leads to page-fault errors,
>>> such as the one shown below.
>>>
>>> [  102.101726] BUG: unable to handle page fault for address: ffffc90127000000
>>> [...]
>>> [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>>> [...]
>>> [  102.243250] Call Trace:
>>> [  102.245695]  <TASK>
>>> [  102.2477V95]  ? validate_chain+0x24e/0x5e0
>>> [  102.251805]  ? __lock_acquire+0x568/0xae0
>>> [  102.255807]  udl_render_hline+0x165/0x341 [udl]
>>> [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
>>> [  102.265379]  ? local_clock_noinstr+0xb/0x100
>>> [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
>>> [  102.274246]  ? mark_held_locks+0x40/0x70
>>> [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
>>> [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
>>> [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
>>> [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
>>> [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
>>> [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
>>> [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
>>> [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
>>> [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
>>> [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
>>> [  102.333622]  commit_tail+0x204/0x330
>>> [...]
>>> [  102.529946] ---[ end trace 0000000000000000 ]---
>>> [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>>>
>>> In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
>>> dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating the
>>> mapping.
>>>
>>> Provide a custom dma-buf vmap method in amdgpu that pins the object before
>>> mapping it's buffer's pages into kernel address space. Do the opposite in
>>> vunmap.
>>>
>>> Note that dma-buf vmap differs from GEM vmap in how it handles relocation.
>>> While dma-buf vmap keeps the buffer in place, GEM vmap requires the caller
>>> to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf code
>>> instead of its GEM code.
>>>
>>> A discussion of various approaches to solving the problem is available
>>> at [1].
>>>
>>> v3:
>>> - try (GTT | VRAM); drop CPU domain (Christian)
>>> v2:
>>> - only use mapable domains (Christian)
>>> - try pinning to domains in preferred order
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping its sg_table")
>>> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
>>> Cc: Shixiong Ou <oushixiong@kylinos.cn>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de/ # [1]
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Thomas did you want to take this through drm-misc or do you want me to
> pick this up?

If you haven't send out this week's fixes for amdgpu, you're welcome to 
pick it up. Otherwise I can merge it via drm-misc-fixes next week.

Best regards
Thomas

>
> Thanks,
>
> Alex
>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 34 +++++++++++++++++++--
>>>   1 file changed, 32 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> index 5743ebb2f1b7..ce27cb5bb05e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> @@ -285,6 +285,36 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>>>        return ret;
>>>   }
>>>
>>> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>>> +{
>>> +     struct drm_gem_object *obj = dma_buf->priv;
>>> +     struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>> +     int ret;
>>> +
>>> +     /*
>>> +      * Pin to keep buffer in place while it's vmap'ed. The actual
>>> +      * domain is not that important as long as it's mapable. Using
>>> +      * GTT and VRAM should be compatible with most use cases.
>>> +      */
>>> +     ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DOMAIN_VRAM);
>>> +     if (ret)
>>> +             return ret;
>>> +     ret = drm_gem_dmabuf_vmap(dma_buf, map);
>>> +     if (ret)
>>> +             amdgpu_bo_unpin(bo);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>>> +{
>>> +     struct drm_gem_object *obj = dma_buf->priv;
>>> +     struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>> +
>>> +     drm_gem_dmabuf_vunmap(dma_buf, map);
>>> +     amdgpu_bo_unpin(bo);
>>> +}
>>> +
>>>   const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>>        .attach = amdgpu_dma_buf_attach,
>>>        .pin = amdgpu_dma_buf_pin,
>>> @@ -294,8 +324,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>>        .release = drm_gem_dmabuf_release,
>>>        .begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>>>        .mmap = drm_gem_dmabuf_mmap,
>>> -     .vmap = drm_gem_dmabuf_vmap,
>>> -     .vunmap = drm_gem_dmabuf_vunmap,
>>> +     .vmap = amdgpu_dma_buf_vmap,
>>> +     .vunmap = amdgpu_dma_buf_vunmap,
>>>   };
>>>
>>>   /**
>> _______________________________________________
>> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


