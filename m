Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADABE292D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF45810E98E;
	Thu, 16 Oct 2025 09:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E/9iqK/7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vQxsizlG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E/9iqK/7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vQxsizlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D0810E98D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:58:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE08B21E14;
 Thu, 16 Oct 2025 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760608701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rOJi9b7kJjazgiCGEenvm7QZLfh+zyP0m6FGAkK0+Yk=;
 b=E/9iqK/7eZEgezE0Zw7L28DQNoaKXSLMIZLbjWwZHSiLZ0hl8VVEROcOoNvpCo2YYPmS4i
 J5AW5mxiawxWYEqrkR9kzNRIBDW9/Y1Q1VtQRj8G0VasShdC1R+l1Mc3jZ84oKhKlE3+8F
 Sl+ld2aBQDtW7eL2i9jw0AmjZiEHD+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760608701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rOJi9b7kJjazgiCGEenvm7QZLfh+zyP0m6FGAkK0+Yk=;
 b=vQxsizlGwbjluIYKDY/m6WbjQXJQgKzjh1nMxlw4tsphCIhmi1ygF0fJpatVmRukPCIrqG
 bY/8yEoyMirEPyDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760608701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rOJi9b7kJjazgiCGEenvm7QZLfh+zyP0m6FGAkK0+Yk=;
 b=E/9iqK/7eZEgezE0Zw7L28DQNoaKXSLMIZLbjWwZHSiLZ0hl8VVEROcOoNvpCo2YYPmS4i
 J5AW5mxiawxWYEqrkR9kzNRIBDW9/Y1Q1VtQRj8G0VasShdC1R+l1Mc3jZ84oKhKlE3+8F
 Sl+ld2aBQDtW7eL2i9jw0AmjZiEHD+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760608701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rOJi9b7kJjazgiCGEenvm7QZLfh+zyP0m6FGAkK0+Yk=;
 b=vQxsizlGwbjluIYKDY/m6WbjQXJQgKzjh1nMxlw4tsphCIhmi1ygF0fJpatVmRukPCIrqG
 bY/8yEoyMirEPyDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 914E31340C;
 Thu, 16 Oct 2025 09:58:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LWIFIr3B8GgJcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Oct 2025 09:58:21 +0000
Message-ID: <c0f34c27-075a-49b1-be44-5b4d9c152ac7@suse.de>
Date: Thu, 16 Oct 2025 11:58:21 +0200
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
In-Reply-To: <20251016114016.12bb49cd@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.994]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[arm.com,lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,collabora.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
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

Hi

Am 16.10.25 um 11:40 schrieb Boris Brezillon:
> Hi Thomas,
>
> On Thu, 16 Oct 2025 10:32:46 +0200
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Hi,
>>
>> on patches 2 to 4: sync is really begin/end access wrapped into one
>> interface, which I find questionable. I also don't like that these
>> patches add generic infrastructure for a single driver.
> It's actually two drivers (panfrost and panthor), and the interface is
> here so other drivers relying on drm_gem_shmem don't have to hand-roll
> these things in the future.

Ok.

But what about the unrelated drivers? Most GEM SHMEM drivers don't need 
this. Looking at patch 4, there's a for loop over the SG table, which 
appears to affect all drivers.

You know, there are two types of GEM SHMEM users. The ones like panthor 
that build upon it with additional features. And the other type that 
only use it as simple buffer storage. The former type what's building 
blocks to combine as needed; that latter (actually the majority) wants a 
simple solution. And TBH, I've considered spitting GEM SHMEM into two 
for this reason.

>
>> My proposal is to make your own dma_buf exporter in panthor and set the
>> begin/end_cpu_access functions as you need. Panthor already contains its
>> own GEM export helper at [1]. If you inline drm_gem_prime_export() [2]
>> you can set the cpu_access callbacks to panthor-specific code. The other
>> dma-buf helpers' symbols should be exported and can be re-used. That is
>> a lot less intrusive and should provide what you need.
> I can of course do that in panthor, but then I'll have to duplicate
> the same logic in panfrost. Also, the whole point of making it generic
> is so that people don't forget that begin/end_cpu_access() is a thing
> they should consider (like happened to me if you look at v2 of this
> patchset), otherwise importers of their buffers might have unpleasant
> side effects because of missing flush/invalidates. This, IMHO, is a good
> reason to have it as a drm_gem_funcs::sync() callback. That, or we
> decide that the default dma_buf_ops is not a thing, and we force
> developers to think twice when they select the default hooks to pick
> for their dma_buf implementation.

See my comment above. Panthor and panfrost should treat GEM SHMEM like a 
set of building blocks rather and a full solution.

>
>> I found that a hand full of other DRM drivers implement dma-buf's
>> begin/end access callbacks. If you want a generic begin/end interface
>> for GEM, you certainly want to get them on board. If there's something
>> common to share, this should be done in a separate series.
> Fair enough. I'll try to convert freedreno and imagination to this new
> interface, and gather some feedback.

I did 'git grep \.begin_cpu_access' in the drm directory. This returned, 
amdgpu, i915, tegra, omap, and xe. These where the ones I had in mind.

Best regards
Thomas

>
> Regards,
>
> Boris

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


