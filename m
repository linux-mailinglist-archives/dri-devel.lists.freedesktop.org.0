Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D828A7B883
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E92C10EA60;
	Fri,  4 Apr 2025 08:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xI0IuMHU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SANosif4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xI0IuMHU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SANosif4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7169310EA60
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:01:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 384EB1F38F;
 Fri,  4 Apr 2025 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743753711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xbqz+Ba023NIU2D0jAx+CBA8aEjI5ZNQltMYLKjptN8=;
 b=xI0IuMHUqMEwA/b3asMlzA/jVa3UNOBj7wFCbIDcCLJgkpEipOBxVIK7zo3es1TxGNGR0x
 wp0gGRKl51cotj4/iFU3vfBsNPgC9tORt45Dpnje6xDyhZsaesvX3E0lzrEdZkIvYp3iSS
 SuCPfkEto1MKcIUc4VIVWGKWnrtI+bI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743753711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xbqz+Ba023NIU2D0jAx+CBA8aEjI5ZNQltMYLKjptN8=;
 b=SANosif4ZXmcMqDnVTiPHBm6qrUkEJCAnfs2Z9+zL96UoYYS15e8duryPYKEvmNOaAZNjp
 9zk+ipZmn1/cqWAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xI0IuMHU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SANosif4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743753711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xbqz+Ba023NIU2D0jAx+CBA8aEjI5ZNQltMYLKjptN8=;
 b=xI0IuMHUqMEwA/b3asMlzA/jVa3UNOBj7wFCbIDcCLJgkpEipOBxVIK7zo3es1TxGNGR0x
 wp0gGRKl51cotj4/iFU3vfBsNPgC9tORt45Dpnje6xDyhZsaesvX3E0lzrEdZkIvYp3iSS
 SuCPfkEto1MKcIUc4VIVWGKWnrtI+bI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743753711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xbqz+Ba023NIU2D0jAx+CBA8aEjI5ZNQltMYLKjptN8=;
 b=SANosif4ZXmcMqDnVTiPHBm6qrUkEJCAnfs2Z9+zL96UoYYS15e8duryPYKEvmNOaAZNjp
 9zk+ipZmn1/cqWAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C435B1364F;
 Fri,  4 Apr 2025 08:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bjqULu6R72c+cAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Apr 2025 08:01:50 +0000
Message-ID: <29cfb98b-fe27-4243-abe4-ce66aa504573@suse.de>
Date: Fri, 4 Apr 2025 10:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 09/10] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-10-dmitry.osipenko@collabora.com>
 <ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
 <710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
 <20250402152102.01d9cfee@collabora.com>
 <a8ed4b8b-5116-4ac2-bfce-21b2751f7377@suse.de>
 <20250403105053.788b0f6e@collabora.com>
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
In-Reply-To: <20250403105053.788b0f6e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 384EB1F38F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,amd.com,redhat.com,arm.com,imgtec.com,lists.freedesktop.org,vger.kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 03.04.25 um 10:50 schrieb Boris Brezillon:
> On Thu, 3 Apr 2025 09:20:00 +0200
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Hi
>>
>> Am 02.04.25 um 15:21 schrieb Boris Brezillon:
>>> On Wed, 2 Apr 2025 15:58:55 +0300
>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>   
>>>> On 4/2/25 15:47, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 22.03.25 um 22:26 schrieb Dmitry Osipenko:
>>>>>> The vmapped pages shall be pinned in memory and previously get/
>>>>>> put_pages()
>>>>>> were implicitly hard-pinning/unpinning the pages. This will no longer be
>>>>>> the case with addition of memory shrinker because pages_use_count > 0
>>>>>> won't
>>>>>> determine anymore whether pages are hard-pinned (they will be soft-
>>>>>> pinned),
>>>>>> while the new pages_pin_count will do the hard-pinning. Switch the
>>>>>> vmap/vunmap() to use pin/unpin() functions in a preparation of addition
>>>>>> of the memory shrinker support to drm-shmem.
>>>>> I've meanwhile rediscovered this patch and I'm sure this is not correct.
>>>>> Vmap should not pin AFAIK. It is possible to vmap if the buffer has been
>>>>> pinned, but that's not automatic.  For other vmaps it is necessary to
>>>>> hold the reservation lock to prevent the buffer from moving.
>>> Hm, is this problematic though? If you want to vmap() inside a section
>>> that's protected by the resv lock, you can
>>>
>>> - drm_gem_shmem_vmap_locked()
>>> - do whatever you need to do with the vaddr,
>>> - drm_gem_shmem_vunmap_locked()
>>>
>>> and the {pin,page_use}_count will be back to their original values.
>>> Those are just ref counters, and I doubt the overhead of
>>> incrementing/decrementing them makes a difference compared to the heavy
>>> page-allocation/vmap operations...
>> I once tried to add pin as part of vmap, so that pages stay in place.
>> Christian was very clear about not doing this. I found this made a lot
>> of sense: vmap means "make the memory available to the CPU". The memory
>> location doesn't matter much here. Pin means something like "make the
>> memory available to the GPU". But which GPU depends on the caller: calls
>> via GEM refer to the local GPU, calls via dma-buf usually refer to the
>> importer's GPU. That GPU uncertainty makes pin problematic already.
> Okay, so it looks more like a naming issue then. The intent here is to

It's certainly possible to see this as a problem naming.

> make sure the page array doesn't disappear while we have a kernel
> mapping active (address returned by vmap()). The reason we went from
> pages_count to pages_use_count+pin_count is because we have two kind of
> references in drm_gem_shmem:
>
> - weak references (tracked with pages_use_count). Those are
>    usually held by GPU VMs, and they are weak in the sense they
>    shouldn't prevent the shrinker to reclaim them if the GPU VM is idle.
>    The other user of weak references is userspace mappings of GEM
>    objects (mmap()), because then we can repopulate those with our fault
>    handler.
> - hard references (tracked with pin_count) which are used to prevent
>    the shrinker from even considering the GEM as reclaimable. And clearly
>    kernel mappings fall in that case, because otherwise we could reclaim
>    pages that might be dereferenced by the CPU later on. It's also used
>    to implement drm_gem_pin because it's the same mechanism really,
>    hence the name

Yeah, this should be rename IMHO. Pin is a TTM operation that fixes 
buffers in certain locations. Drivers do this internally. It has nothing 
to do with gem-shmem.

There's also a pin operation in GEM BOs' drm_gem_object_funcs, but it is 
only called for PRIME-exported buffers and not for general use. For 
gem-shmem, the callback would be implemented on top of the hard references.

And there's also a pin in dma_buf_ops. The term 'pin' is somewhat 
overloaded already.

>
>> In your case, vmap an pin both intent to hold the shmem pages in memory.
>> They might be build on top of the same implementation, but one should
>> not be implemented with the other because of their different meanings.
> But that's not what we do, is it? Sure, in drm_gem_shmem_vmap_locked(),
> we call drm_gem_shmem_pin_locked(), but that's an internal function to
> make sure the pages are allocated and stay around until
> drm_gem_shmem_vunmap_locked() is called.
>
> I guess we could rename pin_count into hard_refcount or
> page_residency_count or xxx_count, and change the pin/unpin_locked()
> function names accordingly, but that's just a naming detail, it doesn't
> force you to call drm_gem_pin() to vmap() your GEM, it's something we
> do internally.

Such a rename would be much appreciated. page_residency_count seems 
appropriate.

>
>> More generally speaking, I've meanwhile come to the conclusion that pin
>> should not even exist in the GEM interface. It's an internal operation
>> of TTM and reveals too much about what happens within the
>> implementation. Instead GEM should be free to move buffers around.
> Well, yes and no. There are situations where you simply can't move
> things around if there are active users, and vmap() is one of those
> AFAICT.

Sure. What I mean here is that pin/unpin is something of an 
implementation detail. IMHO the pin/unpin callbacks in 
drm_gem_object_funcs should get different names, such as pin_exported. 
They are not for general use.

>   
>> Dma-buf importers should only tell exporters to make buffers available
>> to them, but not how to do this. AFAIK that's what dma-buf's
>> attach/detach is for.
> And that's what they do, no? attach() tells the exporter to give the
> importer a way to access those buffers, and given the exporter has no
> clue about when/how the exporter will access those, there's no other way
> but to pin the pages. Am I missing something here?

Yeah, that's what they do.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

