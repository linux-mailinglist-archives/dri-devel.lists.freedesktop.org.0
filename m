Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691FCB23A9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 08:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A3110E692;
	Wed, 10 Dec 2025 07:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NYPoVTtR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MlaQnvKD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qoN78xgX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jB7fv2Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA6310E68F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 07:34:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CEAA337F9;
 Wed, 10 Dec 2025 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765352045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kpbeKy2YUWiWXn9d2J9aYIcKmT+3L9NpOAElspY5VIk=;
 b=NYPoVTtRySso63SH+5nkyu01MKj8p2PDjXu9msB/d+6muNNY/B2J4p40l4p5l0KM8qaqmc
 VBcFH2sqJMKsHwpjsn8hmzuJhqu3BZuxlQEuCA0G8ZWvYYexDyDgf+RLkrRPHxsNNpwUFY
 tP3ZH/ke95vQ2wh5dhTO2js0XxENIfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765352045;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kpbeKy2YUWiWXn9d2J9aYIcKmT+3L9NpOAElspY5VIk=;
 b=MlaQnvKD+LVagdr6lIKdi3xfL8W5OhNEgjnctaNsiE6i3Uf8X1NxC+cmkHPQfDIIHas3aM
 RCbedxLPpxbZz0AQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qoN78xgX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jB7fv2Jx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765352044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kpbeKy2YUWiWXn9d2J9aYIcKmT+3L9NpOAElspY5VIk=;
 b=qoN78xgX89rQD7kmDtxoCH/xt9RfKY/BhzsClgCbm4RCOZJtl3JzKdPUj3PXoy3DJ8INPC
 to8gbL9h/fDVp/6Afa5oPZ9Z8nK+wKJTQl+3MC2z0nkt+DQeo/GrhxO4/Ldo62UQHB2/bS
 c12Uo9EnyLEwW8n5+KtEPqlqWMydkMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765352044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kpbeKy2YUWiWXn9d2J9aYIcKmT+3L9NpOAElspY5VIk=;
 b=jB7fv2JxkFOFcG97cWqPRR2dgqv+8WLI2fA99JxPq5Pz11TW4Y9qbrM0EjD9JZjUmvMJvN
 r0lHLlBiRwjff1AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D8FF3EA63;
 Wed, 10 Dec 2025 07:34:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VbE6FWsiOWkaZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Dec 2025 07:34:03 +0000
Message-ID: <44d3e6c9-6759-4a76-9016-c9749badab94@suse.de>
Date: Wed, 10 Dec 2025 08:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/13] drm: Introduce GEM-UMA memory management
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209152734.6851f3ac@fedora>
 <2b95d76e-2672-4cae-a545-73c407f2b20c@suse.de>
 <20251209163011.436e613b@fedora>
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
In-Reply-To: <20251209163011.436e613b@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 1CEAA337F9
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[28]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,tomeuvizoso.net,imgtec.com,arm.com,collabora.com,igalia.com,redhat.com,chromium.org,lwn.net,lists.freedesktop.org,lists.linux.dev,vger.kernel.org];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 R_RATELIMIT(0.00)[to_ip_from(RLeotmymkgqo3fhapiyq3uwbs4)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:dkim, suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Am 09.12.25 um 16:30 schrieb Boris Brezillon:
> On Tue, 9 Dec 2025 15:51:21 +0100
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Hi
>>
>> Am 09.12.25 um 15:27 schrieb Boris Brezillon:
>>> On Tue,  9 Dec 2025 14:41:57 +0100
>>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>   
>>>> Duplicate GEM-SHMEM to GEM-UMA. Convert all DRM drivers for UMA
>>>> systems if they currently use GEM-SHMEM.
>>>>
>>>> Many DRM drivers for hardware with Unified Memory Architecture (UMA)
>>>> currently builds upon GEM-SHMEM and extends the helpers with features
>>>> for managing the GPU MMU. This allows the GPU to access the GEM buffer
>>>> content for its operation.
>>>>
>>>> There is another, larger, set of DRM drivers that use GEM-SHMEM merely
>>>> as buffer management with no hardware support. These drivers copy the
>>>> buffer content to the GPU on each page flip. The GPU itself has no direct
>>>> access. Hardware of this type is usually in servers, behind slow busses
>>>> (SPI, USB), or provided by firmware (drivers in sysfb/).
>>>>
>>>> After some discussion with Boris on the future of GEM-SHMEM, it seems
>>>> to me that both use cases more and more diverge from each other. The
>>>> most prominent example is the implementation of gem_prime_import,
>>>> where both use cases use distinct approaches.
>>>>
>>>> So we discussed the introduction of a GEM-UMA helper library for
>>>> UMA-based hardware. GEM-UMA will remain flexible enough for drivers
>>>> to extend it for their use case. GEM-SHMEM will become focused on the
>>>> simple-hardware use case. The benefit for both libraries is that they
>>>> will be easier to understand and maintain. GEM-SHMEM can be simplified
>>>> signiifcantly, I think.
>>>>
>>>> This RFC series introduces GEM-UMA and converts the UMA-related drivers.
>>>>
>>>> Patches 1 and 2 fix issues in GEM-SHMEM, so that we don't duplicate
>>>> errornous code.
>>>>
>>>> Patch 3 copies GEM-SHMEM to GEM-UMA. Patch 4 then does soem obvious
>>>> cleanups of unnecessary code.
>>> Instead of copying the code as-is, I'd rather take a step back and think
>>> about what we need and how we want to handle more complex stuff, like
>>> reclaim. I've started working on a shrinker for panthor [1], and as part
>>> of this series, I've added a commit implementing just enough to replace
>>> what gem-shmem currently provides. Feels like the new GEM-UMA thing
>>> could be designed on a composition rather than inheritance model,
>>> where we have sub-components (backing, cpu_map, gpu_map) that can be
>>> pulled in and re-used by the driver implementation. The common helpers
>>> would take those sub-components instead of a plain GEM object. That
>>> would leave the drivers free of how their internal gem_object fields are
>>> laid out and wouldn't require overloading the ->gem_create_object()
>>> function. It seems to be that it would better match the model you were
>>> describing the other day.
>> Yeah, I've seen your update to that series. Making individual parts of
>> the memory manager freely composable with each other is a fine idea.
>>
>> But the flipside is that I also want the simple drivers to move away
>> from the flexible approach that GEM-SHMEM currently takes. There are
>> many drivers that do not need or want that. These drivers benefit from
>> something that is self contained. Many of the drivers are also hardly
>> maintained, so simplifying things will also be helpful.
>>
>> I could have added a new GEM implementation for these drivers, but there
>> are less UMA drivers to convert and the GEM-UMA naming generally fits
>> better than GEM-SHMEM.
>>
>> I'd rather have GEM-UMA and evolve it from where it stands now; and also
>> evolve GEM-SHMEM in a different direction. There's a difference in
>> concepts here.
> Problem is, we'll be stuck trying to evolve gem-uma to something
> cleaner because of the existing abuse of gem-shmem that you're moving
> to gem-uma, so I'm not sure I like the idea to be honest. I'm all for
> this gem-uma thing, but I'm not convinced rushing it in is the right
> solution.

The abuse you're talking about is what you mentioned about ivpu? How it 
uses the gem-shmem internals, right? Ivpu can get its own copy of 
gem-shmem, so that the developers can work it out. There's no benefit in 
sharing code at all cost. Code sharing only make sense if the callers 
are conceptually aligned on what the callee does.

Also what stops you from fixing any of this in the context of gem-uma? 
It should even be easier, as you won't have to keep my use cases in mind.

In parallel, gem-shmem could go in its own direction. I'd like to do 
some changes and simplifications there, which conflict with where 
gem-uma will be heading.

Best regards
Thomas




-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


