Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40157AC3A05
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 08:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3610E0A1;
	Mon, 26 May 2025 06:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iYn7PfTh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qNNvTsJM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iYn7PfTh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qNNvTsJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F2610E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:39:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 526B71F82E;
 Mon, 26 May 2025 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748241562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hU2PAhEcY2QpgN4r39hzQDD8fU6tCvoHcZg6XcqSi+0=;
 b=iYn7PfThrLZyIItRGK518hlYu3K0NdUMPWbPQWq9BjY2SyxoGpLht83pEmSYfWD/pBRGL1
 C9x2lJ01Y0Xf4gIaMw1S/+wRUoSm0J1FO4iEaRfyNJHzBR4bOCfccxYUdjDZIEVt20F9ip
 Fk694fAoyXIbnqoRoJFkNghzFoANp3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748241562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hU2PAhEcY2QpgN4r39hzQDD8fU6tCvoHcZg6XcqSi+0=;
 b=qNNvTsJMbnxs/vQwaUgPVFQhyza5aoY8KIHV+ykv3xfBZ63iZ4voEL4mrF+Yd0nQC/hG32
 rVFMR78uIjSGrRBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iYn7PfTh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qNNvTsJM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748241562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hU2PAhEcY2QpgN4r39hzQDD8fU6tCvoHcZg6XcqSi+0=;
 b=iYn7PfThrLZyIItRGK518hlYu3K0NdUMPWbPQWq9BjY2SyxoGpLht83pEmSYfWD/pBRGL1
 C9x2lJ01Y0Xf4gIaMw1S/+wRUoSm0J1FO4iEaRfyNJHzBR4bOCfccxYUdjDZIEVt20F9ip
 Fk694fAoyXIbnqoRoJFkNghzFoANp3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748241562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hU2PAhEcY2QpgN4r39hzQDD8fU6tCvoHcZg6XcqSi+0=;
 b=qNNvTsJMbnxs/vQwaUgPVFQhyza5aoY8KIHV+ykv3xfBZ63iZ4voEL4mrF+Yd0nQC/hG32
 rVFMR78uIjSGrRBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2698C13964;
 Mon, 26 May 2025 06:39:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SXq0B5oMNGjpJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 06:39:22 +0000
Message-ID: <b867c60d-c6ad-4847-a2f6-4652bad89b25@suse.de>
Date: Mon, 26 May 2025 08:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
To: Lucas De Marchi <lucas.demarchi@intel.com>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Michal.Wajdeczko@intel.com
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
 <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
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
In-Reply-To: <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: 526B71F82E
X-Spam-Score: -1.51
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_TO(0.00)[intel.com,gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 22.05.25 um 17:09 schrieb Lucas De Marchi:
> On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> This reduces this struct from 16 to 8 bytes, and it gets embedded
>> into a lot of things.
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> Replied too early on cover. Chatting with Michal Wajdeczko today, this
> may break things as we then can't byte-address anymore. It seems
> particularly dangerous when using the iosys_map_wr/iosys_map_rd as
> there's nothing preventing an unaligned address and we increment the map
> with the sizeof() of a struct that could be __packed. Example: in
> xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
> In this particular case it doesn't give unaligned address, but we should
> probably then protect iosys_map from doing the wrong thing.
>
> So, if we are keeping this patch, we should probably protect
> initially-unaligned addresses and the iosys_map_incr() call?

That sounds like a blocker to me. And there's another thing to keep in 
mind. We have use cases where we need to know the caching of the memory 
area. I never got to fully implement this, but it would be stored in the 
iosys-map struct as well. We'd need 2 additional bits to represent UC, 
WC and WT caching. If we don't have at least 3-bit alignment, shrinking 
iosys-map might not be feasible anyway.

Best regards
Thomas

>
> thanks
> Lucas De Marchi
>
>> ---
>> include/linux/iosys-map.h | 30 ++++++++----------------------
>> 1 file changed, 8 insertions(+), 22 deletions(-)
>>
>> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>> index a6c2cc9ca756..44479966ce24 100644
>> --- a/include/linux/iosys-map.h
>> +++ b/include/linux/iosys-map.h
>> @@ -99,29 +99,27 @@
>>  *    iosys_map_incr(&map, len); // go to first byte after the memcpy
>>  */
>>
>> +#define _IOSYS_MAP_IS_IOMEM 1
>> /**
>>  * struct iosys_map - Pointer to IO/system memory
>>  * @vaddr_iomem:    The buffer's address if in I/O memory
>>  * @vaddr:        The buffer's address if in system memory
>> - * @is_iomem:        True if the buffer is located in I/O memory, or 
>> false
>> - *            otherwise.
>>  */
>> struct iosys_map {
>>     union {
>>         void __iomem *_vaddr_iomem;
>>         void *_vaddr;
>>     };
>> -    bool _is_iomem;
>> };
>>
>> static inline bool iosys_map_is_iomem(const struct iosys_map *map)
>> {
>> -    return map->_is_iomem;
>> +    return ((unsigned long)map->_vaddr) & _IOSYS_MAP_IS_IOMEM;
>> }
>>
>> static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
>> {
>> -    return map->_vaddr_iomem;
>> +    return (void __iomem *)((unsigned long)map->_vaddr_iomem & 
>> ~_IOSYS_MAP_IS_IOMEM);
>> }
>>
>> static inline void *iosys_map_ptr(const struct iosys_map *map)
>> @@ -136,7 +134,6 @@ static inline void *iosys_map_ptr(const struct 
>> iosys_map *map)
>> #define IOSYS_MAP_INIT_VADDR(vaddr_)    \
>>     {                \
>>         ._vaddr = (vaddr_),    \
>> -        ._is_iomem = false,    \
>>     }
>>
>> /**
>> @@ -145,8 +142,7 @@ static inline void *iosys_map_ptr(const struct 
>> iosys_map *map)
>>  */
>> #define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)    \
>>     {                        \
>> -        ._vaddr_iomem = (vaddr_iomem_),        \
>> -        ._is_iomem = true,            \
>> +        ._vaddr_iomem = (void __iomem *)(((unsigned 
>> long)(vaddr_iomem_) | _IOSYS_MAP_IS_IOMEM)), \
>>     }
>>
>> /**
>> @@ -198,7 +194,6 @@ static inline void *iosys_map_ptr(const struct 
>> iosys_map *map)
>> static inline void iosys_map_set_vaddr(struct iosys_map *map, void 
>> *vaddr)
>> {
>>     map->_vaddr = vaddr;
>> -    map->_is_iomem = false;
>> }
>>
>> /**
>> @@ -211,8 +206,7 @@ static inline void iosys_map_set_vaddr(struct 
>> iosys_map *map, void *vaddr)
>> static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>>                          void __iomem *vaddr_iomem)
>> {
>> -    map->_vaddr_iomem = vaddr_iomem;
>> -    map->_is_iomem = true;
>> +    map->_vaddr_iomem = (void __iomem *)((unsigned long)vaddr_iomem 
>> | _IOSYS_MAP_IS_IOMEM);
>> }
>>
>> /**
>> @@ -229,12 +223,9 @@ static inline void 
>> iosys_map_set_vaddr_iomem(struct iosys_map *map,
>> static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>>                       const struct iosys_map *rhs)
>> {
>> -    if (lhs->_is_iomem != rhs->_is_iomem)
>> +    if (lhs->_vaddr != rhs->_vaddr)
>>         return false;
>> -    else if (lhs->_is_iomem)
>> -        return lhs->_vaddr_iomem == rhs->_vaddr_iomem;
>> -    else
>> -        return lhs->_vaddr == rhs->_vaddr;
>> +    return true;
>> }
>>
>> /**
>> @@ -279,12 +270,7 @@ static inline bool iosys_map_is_set(const struct 
>> iosys_map *map)
>>  */
>> static inline void iosys_map_clear(struct iosys_map *map)
>> {
>> -    if (map->_is_iomem) {
>> -        map->_vaddr_iomem = NULL;
>> -        map->_is_iomem = false;
>> -    } else {
>> -        map->_vaddr = NULL;
>> -    }
>> +    map->_vaddr = NULL;
>> }
>>
>> /**
>> -- 
>> 2.49.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

