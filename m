Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8355AC3B56
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 10:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F256D10E295;
	Mon, 26 May 2025 08:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="S3NFTXnK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZwxXwTPB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S3NFTXnK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZwxXwTPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A810E297
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:14:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54A0B21CFD;
 Mon, 26 May 2025 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748247286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+tTb2e3IZtD/9fQ/KLyArMhpuHcVUvz99ORKDkyw7Zk=;
 b=S3NFTXnKzWXK3a5opyKf3rIytfzU0tja4nS82M7DikyKACWmjVSkPITUIy6U7bHoMxjha2
 SQH4RnF0XxijI7cFMJg1yEVUDYPC4Vng0UQq8s7Y/RkGP7Xq0K7IVQhBgJqkaMBluWYtEd
 SVr0Mxx4lKkjLyZ9jLpBotda2X3ak0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748247286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+tTb2e3IZtD/9fQ/KLyArMhpuHcVUvz99ORKDkyw7Zk=;
 b=ZwxXwTPBqr6dRkji+14qcq8hC8rUbVJjbehkghF4ZQSV1QOssiDVCP24HHsZ16tZFkwDtG
 Lw/QgvL3slZcHzBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748247286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+tTb2e3IZtD/9fQ/KLyArMhpuHcVUvz99ORKDkyw7Zk=;
 b=S3NFTXnKzWXK3a5opyKf3rIytfzU0tja4nS82M7DikyKACWmjVSkPITUIy6U7bHoMxjha2
 SQH4RnF0XxijI7cFMJg1yEVUDYPC4Vng0UQq8s7Y/RkGP7Xq0K7IVQhBgJqkaMBluWYtEd
 SVr0Mxx4lKkjLyZ9jLpBotda2X3ak0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748247286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+tTb2e3IZtD/9fQ/KLyArMhpuHcVUvz99ORKDkyw7Zk=;
 b=ZwxXwTPBqr6dRkji+14qcq8hC8rUbVJjbehkghF4ZQSV1QOssiDVCP24HHsZ16tZFkwDtG
 Lw/QgvL3slZcHzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F49413964;
 Mon, 26 May 2025 08:14:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id u3FRCvYiNGiaRgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 08:14:46 +0000
Message-ID: <4e2d7da2-1a9f-4760-8854-cfcbb8bc9d1e@suse.de>
Date: Mon, 26 May 2025 10:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
To: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Michal.Wajdeczko@intel.com
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
 <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
 <b867c60d-c6ad-4847-a2f6-4652bad89b25@suse.de>
 <CAPM=9ty=Fz6UFcUinVHjDmTpgczTz_-OkxXoV78p=rNWmEk6Fg@mail.gmail.com>
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
In-Reply-To: <CAPM=9ty=Fz6UFcUinVHjDmTpgczTz_-OkxXoV78p=rNWmEk6Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_FIVE(0.00)[5]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
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

Am 26.05.25 um 09:58 schrieb Dave Airlie:
> On Mon, 26 May 2025 at 16:39, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 22.05.25 um 17:09 schrieb Lucas De Marchi:
>>> On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
>>>> From: Dave Airlie <airlied@redhat.com>
>>>>
>>>> This reduces this struct from 16 to 8 bytes, and it gets embedded
>>>> into a lot of things.
>>>>
>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>> Replied too early on cover. Chatting with Michal Wajdeczko today, this
>>> may break things as we then can't byte-address anymore. It seems
>>> particularly dangerous when using the iosys_map_wr/iosys_map_rd as
>>> there's nothing preventing an unaligned address and we increment the map
>>> with the sizeof() of a struct that could be __packed. Example: in
>>> xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
>>> In this particular case it doesn't give unaligned address, but we should
>>> probably then protect iosys_map from doing the wrong thing.
>>>
>>> So, if we are keeping this patch, we should probably protect
>>> initially-unaligned addresses and the iosys_map_incr() call?
>> That sounds like a blocker to me. And there's another thing to keep in
>> mind. We have use cases where we need to know the caching of the memory
>> area. I never got to fully implement this, but it would be stored in the
>> iosys-map struct as well. We'd need 2 additional bits to represent UC,
>> WC and WT caching. If we don't have at least 3-bit alignment, shrinking
>> iosys-map might not be feasible anyway.
> I've played around a bit, and it's starting to seem like it might be
> difficult to get this across the line.
>
> I can add the iter stuff separately to fix the sub-dword offsets if
> needed, we probably don't want to be doing 8-bit iomem accesses
> anyways.
>
> But if we need 3-bits then it's messier, what's the use case out of
> interest to store the info? do you need all 3 states?

Various drivers perform format conversion or a memcpy of BO data as part 
of their display update. For buffers without caching, it's fastest to 
read the buffer once into system memory and do any further processing 
from there. If the buffer is already in cached memory, this would be 
overhead. Due to the lack of caching information, the gud driver treats 
all imported BOs as uncached. (Fourth argument at [1]). Storing the 
caching info in the iosys-map would benefit this driver and several others.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/gpu/drm/gud/gud_pipe.c#L446

>
> Dave.

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

