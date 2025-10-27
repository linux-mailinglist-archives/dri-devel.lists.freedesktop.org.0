Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C8AC0CF04
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C610E44F;
	Mon, 27 Oct 2025 10:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J+1xMEXD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vILLBvcr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J+1xMEXD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vILLBvcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCC510E440
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:23:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F4DE1F44F;
 Mon, 27 Oct 2025 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761560622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=whW2iiLtU4ET03pwB+V8O2+DYWbCjcYuB4tklJa8Je4=;
 b=J+1xMEXDgMGkmSRMhWr3vQayUlCiAoSUTn1Kfd2ZQRUEYugD5ZCuVvfDLCS3qewXCxGViS
 owRoQrcUTYC0chqLcwFt/9AR+tgyH0e1JVYS/aeejJVzRvjNV+g1pGn4jaRp0Ww6Fn+QIv
 J8lD10YPPx1p1yFn1PpM+PvzqsxtnBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761560622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=whW2iiLtU4ET03pwB+V8O2+DYWbCjcYuB4tklJa8Je4=;
 b=vILLBvcr0OLGpqzoSZQX2pNulImi/WqzPA8cEh9xU7ntMyvkCXZgFf21Wrqm+XI/6SJCHu
 3/VwJZeMD1LMQlDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761560622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=whW2iiLtU4ET03pwB+V8O2+DYWbCjcYuB4tklJa8Je4=;
 b=J+1xMEXDgMGkmSRMhWr3vQayUlCiAoSUTn1Kfd2ZQRUEYugD5ZCuVvfDLCS3qewXCxGViS
 owRoQrcUTYC0chqLcwFt/9AR+tgyH0e1JVYS/aeejJVzRvjNV+g1pGn4jaRp0Ww6Fn+QIv
 J8lD10YPPx1p1yFn1PpM+PvzqsxtnBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761560622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=whW2iiLtU4ET03pwB+V8O2+DYWbCjcYuB4tklJa8Je4=;
 b=vILLBvcr0OLGpqzoSZQX2pNulImi/WqzPA8cEh9xU7ntMyvkCXZgFf21Wrqm+XI/6SJCHu
 3/VwJZeMD1LMQlDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1FF113693;
 Mon, 27 Oct 2025 10:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mX+jOS1I/2hSFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 10:23:41 +0000
Message-ID: <d7fe5c62-4a0b-4323-a24b-205229a2eab7@suse.de>
Date: Mon, 27 Oct 2025 11:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251024110432.1313391-1-jfalempe@redhat.com>
 <a1d6cf1f-02b6-4c89-84e2-4b2af39829ef@ursulin.net>
 <6757f62e-0b10-4fc5-a9cb-16006c723459@redhat.com>
 <a9c1aea1-1427-4c15-9453-3e7510183082@mailbox.org>
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
In-Reply-To: <a9c1aea1-1427-4c15-9453-3e7510183082@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[12];
 FREEMAIL_TO(0.00)[mailbox.org,redhat.com,ursulin.net,linux.intel.com,intel.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
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

Am 24.10.25 um 18:49 schrieb Michel Dänzer:
> On 10/24/25 14:48, Jocelyn Falempe wrote:
>> On 24/10/2025 13:53, Tvrtko Ursulin wrote:
>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>>>> ast driver for display, the graphic output is corrupted, and almost
>>>> unusable.
>>>>
>>>> Adding a clflush call in the vmap function fixes this issue
>>>> completely.
>>> AST is importing i915 allocated buffer in this use case, or how exactly is the relationship?
>> I think it's mutter/gnome-shell who copy the buffer from i915 to ast, here is the logs:
>>
>> gnome-shell[2079]: Failed to initialize accelerated iGPU/dGPU framebuffer sharing: Do not want to use software renderer (llvmpipe (LLVM 19.1.7, 256 bits)), falling back to CPU copy path
> FWIW, the code which logged "falling back to CPU copy path" was removed in mutter 42. Can you still reproduce the issue with a newer version of mutter, ideally 49? A lot has changed over the last 3.5 years.
>
>
>> gnome-shell[1533]: Created gbm renderer for '/dev/dri/card0'
>> gnome-shell[1533]: GPU /dev/dri/card1 selected as primary
>>
>> card0 is ast and card1 is i915
>>
>> Do you think there is something missing in mutter?
> Not that I can see offhand.
>
> After logging "Failed to initialize accelerated iGPU/dGPU framebuffer sharing", mutter tries to export a dma-buf from the i915 BO, import it into the AST device, create an KMS FB for the imported BO and assign the FB to the primary plane of a CRTC. If this path works (which seems to be the case in this scenario, or you wouldn't see BOs shared between i915 & AST), mutter doesn't do any copies between different BOs. It's between the AST & i915 drivers to correctly handle access to the shared BO.
>
> Does the AST driver wait for the i915 GPU to finish drawing to the shared BO, by waiting for the exclusive fence of the dma-buf synchronization object, before reading from the BO?

Yes, ast waits for all the plane fences here: 
https://elixir.bootlin.com/linux/v6.17.5/source/drivers/gpu/drm/drm_atomic_helper.c#L2762

Best regards
Thomas

>
>
> P.S. If the path described above didn't work, mutter would fall back to reading the i915 BO contents with glReadPixels and copying them to a dumb BO allocated from the AST device, so you wouldn't see BOs shared between the drivers. With current mutter, you can force this fallback with the environment variable MUTTER_DEBUG_MULTI_GPU_FORCE_COPY_MODE=primary-gpu-cpu . Does that avoid the issue?
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


