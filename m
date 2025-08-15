Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8BB2808E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136B910E930;
	Fri, 15 Aug 2025 13:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UinPBhZJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9kPkoRsz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UinPBhZJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9kPkoRsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E9810E930
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 13:22:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44CDA1F83C;
 Fri, 15 Aug 2025 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755264167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qQ1254Ap3/WW0iY+sdiEc8dXhmzmHRdetubI5rVH3w=;
 b=UinPBhZJa3iCCyDb2Nt4i5l2NRu3zRw3pDkxmLNjPgpd/CZ43UTAeT3KWo/n2QiE7gKZnV
 tooxIYbQnggh+t79XmqnNDjuvezJYEFHoiexl7/l1AjFGtORwpqZqR50NfKBhCiJGP53Co
 xH/8tqhJUQ2tl2KlY8AELpfm5NkbCV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755264167;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qQ1254Ap3/WW0iY+sdiEc8dXhmzmHRdetubI5rVH3w=;
 b=9kPkoRszDqB7OKs3mGvyE+Dzn3Ohx+i9DU2RbWVO3JmCcU2dRhPM+TYbQbXEt11B0ERgCX
 2UV0NO5RO/cLX9Cw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UinPBhZJ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9kPkoRsz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755264167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qQ1254Ap3/WW0iY+sdiEc8dXhmzmHRdetubI5rVH3w=;
 b=UinPBhZJa3iCCyDb2Nt4i5l2NRu3zRw3pDkxmLNjPgpd/CZ43UTAeT3KWo/n2QiE7gKZnV
 tooxIYbQnggh+t79XmqnNDjuvezJYEFHoiexl7/l1AjFGtORwpqZqR50NfKBhCiJGP53Co
 xH/8tqhJUQ2tl2KlY8AELpfm5NkbCV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755264167;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qQ1254Ap3/WW0iY+sdiEc8dXhmzmHRdetubI5rVH3w=;
 b=9kPkoRszDqB7OKs3mGvyE+Dzn3Ohx+i9DU2RbWVO3JmCcU2dRhPM+TYbQbXEt11B0ERgCX
 2UV0NO5RO/cLX9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D42671368C;
 Fri, 15 Aug 2025 13:22:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OrAXMqY0n2gzcgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Aug 2025 13:22:46 +0000
Message-ID: <f9177443-9704-48a8-847a-8eb59b01d36e@suse.de>
Date: Fri, 15 Aug 2025 15:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9 v3] drm/i915: Remove todo and comments about
 struct_mutex
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
 <20250813135035.144762-10-luiz.mello@estudante.ufscar.br>
 <aJ8wNzS_W--oTxGe@intel.com>
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
In-Reply-To: <aJ8wNzS_W--oTxGe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 44CDA1F83C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,ffwll.ch,gmail.com,ursulin.net,lists.freedesktop.org,riseup.net];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
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



Am 15.08.25 um 15:03 schrieb Rodrigo Vivi:
> On Wed, Aug 13, 2025 at 10:50:33AM -0300, Luiz Otavio Mello wrote:
>> This patch completes the removal of struct_mutex from the driver.
>>
>> Remove the related TODO item, as the transition away from struct_mutex
>> is now complete.
>>
>> Also clean up references to struct_mutex in i915.rst to avoid outdated
>> documentation.
>>
>> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/i915.rst |  7 -------
>>   Documentation/gpu/todo.rst | 25 -------------------------
> drm,drm-misc maintainers, ack to merge this through drm-intel-next?

Sure, ack.

>
>>   2 files changed, 32 deletions(-)
>>
>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>> index 72932fa31b8d..eba09c3ddce4 100644
>> --- a/Documentation/gpu/i915.rst
>> +++ b/Documentation/gpu/i915.rst
>> @@ -358,8 +358,6 @@ Locking Guidelines
>>   #. All locking rules and interface contracts with cross-driver interfaces
>>      (dma-buf, dma_fence) need to be followed.
>>   
>> -#. No struct_mutex anywhere in the code
>> -
>>   #. dma_resv will be the outermost lock (when needed) and ww_acquire_ctx
>>      is to be hoisted at highest level and passed down within i915_gem_ctx
>>      in the call chain
>> @@ -367,11 +365,6 @@ Locking Guidelines
>>   #. While holding lru/memory manager (buddy, drm_mm, whatever) locks
>>      system memory allocations are not allowed
>>   
>> -	* Enforce this by priming lockdep (with fs_reclaim). If we
>> -	  allocate memory while holding these looks we get a rehash
>> -	  of the shrinker vs. struct_mutex saga, and that would be
>> -	  real bad.
>> -
>>   #. Do not nest different lru/memory manager locks within each other.
>>      Take them in turn to update memory allocations, relying on the object’s
>>      dma_resv ww_mutex to serialize against other operations.
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 92db80793bba..b5f58b4274b1 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -173,31 +173,6 @@ Contact: Simona Vetter
>>   
>>   Level: Intermediate
>>   
>> -Get rid of dev->struct_mutex from GEM drivers
>> ----------------------------------------------
>> -
>> -``dev->struct_mutex`` is the Big DRM Lock from legacy days and infested
>> -everything. Nowadays in modern drivers the only bit where it's mandatory is
>> -serializing GEM buffer object destruction. Which unfortunately means drivers
>> -have to keep track of that lock and either call ``unreference`` or
>> -``unreference_locked`` depending upon context.
>> -
>> -Core GEM doesn't have a need for ``struct_mutex`` any more since kernel 4.8,
>> -and there's a GEM object ``free`` callback for any drivers which are
>> -entirely ``struct_mutex`` free.
>> -
>> -For drivers that need ``struct_mutex`` it should be replaced with a driver-
>> -private lock. The tricky part is the BO free functions, since those can't
>> -reliably take that lock any more. Instead state needs to be protected with
>> -suitable subordinate locks or some cleanup work pushed to a worker thread. For
>> -performance-critical drivers it might also be better to go with a more
>> -fine-grained per-buffer object and per-context lockings scheme. Currently only
>> -the ``msm`` and `i915` drivers use ``struct_mutex``.
>> -
>> -Contact: Simona Vetter, respective driver maintainers
>> -
>> -Level: Advanced
>> -
>>   Move Buffer Object Locking to dma_resv_lock()
>>   ---------------------------------------------
>>   
>> -- 
>> 2.50.1
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


