Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCFCBE320C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 13:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824B210E9BD;
	Thu, 16 Oct 2025 11:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TM4Gyi0l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+T63Ye0g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q2daeUH5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ReuH89qS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFBC10E9BD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 11:43:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB12F1F391;
 Thu, 16 Oct 2025 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760614980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TyxwVPTjIOLGbiTeFlgoOYjK+uk1aDEvJn6T5pT61VE=;
 b=TM4Gyi0lg7pXRDVkLNMGZZmNVeMB3xnSaqoDE6CDi8nqR5huvKLjghSnxowweiUsJv7Ug9
 lObtWbVTSPgAYwildG7qqd0JN964FKlRZfTHOJZvMdYPinbe8Cs/6DAMD6JoHg5zwJ9BCv
 XOFpNeV1369TR6gWANYR/tOM28Y96oI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760614980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TyxwVPTjIOLGbiTeFlgoOYjK+uk1aDEvJn6T5pT61VE=;
 b=+T63Ye0ge4i9xATJMbqj4dfPXjyNwjhuqM3grvN9SoAxaPW/nONV73vuTSu5Ct2cyfKyxG
 DZh8XwTRsNNrc3Dw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q2daeUH5;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ReuH89qS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760614979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TyxwVPTjIOLGbiTeFlgoOYjK+uk1aDEvJn6T5pT61VE=;
 b=Q2daeUH57IkTVYLuFoIvYb+0m/5tYvbWpTFwOQo1++aiy6MABv+4Mx4jV2OsnT1WCkz0Ih
 IwHihSAoDvtGk48tGZ4x315moXBmOJET2bMRVzmflPnSIlLNO3esk7segBhCZjKtsqPhnA
 URsKz5Cnl5BImYxmke1LXdytoGkvuR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760614979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TyxwVPTjIOLGbiTeFlgoOYjK+uk1aDEvJn6T5pT61VE=;
 b=ReuH89qS1wjgEuQscyO2JcZjGq3tXJMFVdJ867DDHnjk5dQBLRTCMXhnXHsntArTNGHAsx
 nM55m0sJNl2L2oCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F6FC1340C;
 Thu, 16 Oct 2025 11:42:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UjzmHUPa8GgwWgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Oct 2025 11:42:59 +0000
Message-ID: <87813da2-4d97-4412-b1f2-1fde6ef6545b@suse.de>
Date: Thu, 16 Oct 2025 13:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <f89987b9-2df8-45ab-8b53-6a210a30ce50@suse.de>
 <20251016114016.12bb49cd@fedora>
 <c0f34c27-075a-49b1-be44-5b4d9c152ac7@suse.de>
 <20251016123217.01d32b85@fedora>
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
In-Reply-To: <20251016123217.01d32b85@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BB12F1F391
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[arm.com,lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,collabora.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid, suse.de:email]
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

Am 16.10.25 um 12:32 schrieb Boris Brezillon:
> On Thu, 16 Oct 2025 11:58:21 +0200
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Hi
>>
>> Am 16.10.25 um 11:40 schrieb Boris Brezillon:
>>> Hi Thomas,
>>>
>>> On Thu, 16 Oct 2025 10:32:46 +0200
>>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>   
>>>> Hi,
>>>>
>>>> on patches 2 to 4: sync is really begin/end access wrapped into one
>>>> interface, which I find questionable. I also don't like that these
>>>> patches add generic infrastructure for a single driver.
>>> It's actually two drivers (panfrost and panthor), and the interface is
>>> here so other drivers relying on drm_gem_shmem don't have to hand-roll
>>> these things in the future.
>> Ok.
>>
>> But what about the unrelated drivers? Most GEM SHMEM drivers don't need
>> this. Looking at patch 4, there's a for loop over the SG table, which
>> appears to affect all drivers.
> It doesn't. First off, this ::sync hook is optional, and if you look at
> patch 4's commit message, it says:
>
> "
> We provide a drm_gem_shmem_object_sync() for drivers that wants to
> have this default implementation as their drm_gem_object_funcs::sync,
> but we don't set drm_gem_shmem_funcs::sync to
> drm_gem_shmem_object_sync() to avoid changing the behavior of drivers
> currently relying on the default gem_shmem vtable.
> "
>
>> You know, there are two types of GEM SHMEM users. The ones like panthor
>> that build upon it with additional features. And the other type that
>> only use it as simple buffer storage. The former type what's building
>> blocks to combine as needed; that latter (actually the majority) wants a
>> simple solution. And TBH, I've considered spitting GEM SHMEM into two
>> for this reason.
> That's the very reason I don't force
>
> 	::sync = drm_gem_shmem_sync
>
> but leave it to each driver to decide whether they want it or not.

Apologies for misunderstanding. My impression was that the sync helper 
is now the default. But that brings me to another question: where do you 
set the gem callback? I applied your series and grepped for it. It's not 
set in the panthor/panfrost gem funcs nor the default funcs for shmem. I 
can only find the sync calls in the ioctl code.

>
>>>   
>>>> My proposal is to make your own dma_buf exporter in panthor and set the
>>>> begin/end_cpu_access functions as you need. Panthor already contains its
>>>> own GEM export helper at [1]. If you inline drm_gem_prime_export() [2]
>>>> you can set the cpu_access callbacks to panthor-specific code. The other
>>>> dma-buf helpers' symbols should be exported and can be re-used. That is
>>>> a lot less intrusive and should provide what you need.
>>> I can of course do that in panthor, but then I'll have to duplicate
>>> the same logic in panfrost. Also, the whole point of making it generic
>>> is so that people don't forget that begin/end_cpu_access() is a thing
>>> they should consider (like happened to me if you look at v2 of this
>>> patchset), otherwise importers of their buffers might have unpleasant
>>> side effects because of missing flush/invalidates. This, IMHO, is a good
>>> reason to have it as a drm_gem_funcs::sync() callback. That, or we
>>> decide that the default dma_buf_ops is not a thing, and we force
>>> developers to think twice when they select the default hooks to pick
>>> for their dma_buf implementation.
>> See my comment above. Panthor and panfrost should treat GEM SHMEM like a
>> set of building blocks rather and a full solution.
> That's exactly what it does. Panfrost/Panthor have their own
> drm_gem_object_funcs, they just use the default drm_gem_shmem_sync
> implementation provided by this patch, that's all. And yes,
> hand-rolling your own drm_prime implem is not only annoying, it's also
> error prone because some of the gem_shmem helpers [1] might rely on
> drm_gem_is_prime_exported_dma_buf(), which checks the dma_buf ops
> against the default drm_prime implementation.

I know, but that's a shortcoming of the current implementation. IIRC all 
driver's prime importers have code like [1] at the top, so we probably 
should do that in common code.

But that's not the point here. I really do think that drivers either use 
a simple turn-key solution OR hand-pick the building blocks for the 
complex scenarios. There's no middle ground IMHO. IIRC the original TTM 
was supposed to provide a full solution for the complex scenarios and 
failed at that.


>
>>>   
>>>> I found that a hand full of other DRM drivers implement dma-buf's
>>>> begin/end access callbacks. If you want a generic begin/end interface
>>>> for GEM, you certainly want to get them on board. If there's something
>>>> common to share, this should be done in a separate series.
>>> Fair enough. I'll try to convert freedreno and imagination to this new
>>> interface, and gather some feedback.
>> I did 'git grep \.begin_cpu_access' in the drm directory. This returned,
>> amdgpu, i915, tegra, omap, and xe. These where the ones I had in mind.
> Hm, so tegra/omap should be relatively easy, but I'm reluctant to touch
> the big drivers here (amdgpu, i915 and xe). Because it's an opt-in, and
> because these drivers already have hand-rolled these dma_buf_ops, I'd
> rather let their owners deal with the transition if they want to. IOW,
> if you ask me to find new users, I'd like to focus on relatively small
> drivers, and primarily those relying on drm_gem_shmem already. Note
> that there might be drivers lacking a {begin,end}_cpu_access()
> implementation, but don't know it, because there's very few use cases
> where GPU is the exporter and the importer is not the same GPU device.
> The other reason would be that most drivers relying on gem_shmem set
> ::map_wc=true unconditionally (CPU mappings are not cached, and thus
> don't require synchronization), or just that those devices are IO
> coherent.

I'm not asking you to rewrite all these drivers, but to take them into 
consideration. Feedback from their devs would be valuable. Semantics of 
similar operations in dma-buf and GEM sometimes differ in subtle ways. 
Things like pinning, locking and eviction might be of importance to make 
sync work for all drivers.

>
> Honestly, I'm not too sure why this is a problem if this hook is
> optional. If it turns out to be too simple for more complex use cases
> others have, it can still be extended when those drivers transition to
> this ::sync() approach, as no in-kernel API is immutable. And in the
> meantime, we have a solution for two drivers that doesn't imply
> duplicating a bunch of drm_prime boiler-plate that's otherwise rather
> generic.

The prime code you'd have to duplicate is just 10 lines, plus some small 
per-driver code. Most of that being data-structure inits.

I want to point out that I'm not opposing the general idea of GEM sync, 
but I think it should get more feedback from others. It's supposed to be 
a generic interface after all. Hence I was asking to put all this into a 
separate series.

Best regards
Thomas

>
> [1]https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L825

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


