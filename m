Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C121AC0B5E
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F4E10EB14;
	Thu, 22 May 2025 12:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gXO2NQde";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lotYrtLV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gXO2NQde";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lotYrtLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FDD10EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:10:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B6EA21A0F;
 Thu, 22 May 2025 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747915824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yI+puFaPnCBQg08J1D62RrSSlTu43LkV+1ZDrMTQpQE=;
 b=gXO2NQdeBUwU5WxHCMMCX7w0CDZtmkAZ8EQGQWfbsubxOax5zMEyE2PwuZZ+3O7YziEe0x
 lLSVN07992Yl47mjaTWm0WJ0SFzxkByQUJ+fxfonsTKywmZd2lBMrmINYWfFeGZQbVPoS9
 b15h0TagDaJeehjgNJEVCm7+/3HojSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747915824;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yI+puFaPnCBQg08J1D62RrSSlTu43LkV+1ZDrMTQpQE=;
 b=lotYrtLVGHbE2tbiYPlsUPunD+9/qCUbCFQi9QipeCr4s6zYu7Pvx0vn4gAPdPzoahGHW5
 +Jz5s/T+y/GkdoBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747915824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yI+puFaPnCBQg08J1D62RrSSlTu43LkV+1ZDrMTQpQE=;
 b=gXO2NQdeBUwU5WxHCMMCX7w0CDZtmkAZ8EQGQWfbsubxOax5zMEyE2PwuZZ+3O7YziEe0x
 lLSVN07992Yl47mjaTWm0WJ0SFzxkByQUJ+fxfonsTKywmZd2lBMrmINYWfFeGZQbVPoS9
 b15h0TagDaJeehjgNJEVCm7+/3HojSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747915824;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yI+puFaPnCBQg08J1D62RrSSlTu43LkV+1ZDrMTQpQE=;
 b=lotYrtLVGHbE2tbiYPlsUPunD+9/qCUbCFQi9QipeCr4s6zYu7Pvx0vn4gAPdPzoahGHW5
 +Jz5s/T+y/GkdoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55780137B8;
 Thu, 22 May 2025 12:10:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +zTFEzAUL2gkaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 May 2025 12:10:24 +0000
Message-ID: <76bf7f7a-01df-4941-baf0-0e527c71c881@suse.de>
Date: Thu, 22 May 2025 14:10:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
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
In-Reply-To: <20250522065519.318013-10-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_THREE(0.00)[3];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 22.05.25 um 08:52 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This reduces this struct from 16 to 8 bytes, and it gets embedded
> into a lot of things.

IIRC this has been discussed before. Makes sense to me.

> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   include/linux/iosys-map.h | 30 ++++++++----------------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index a6c2cc9ca756..44479966ce24 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -99,29 +99,27 @@
>    *	iosys_map_incr(&map, len); // go to first byte after the memcpy
>    */
>   
> +#define _IOSYS_MAP_IS_IOMEM 1

Two underscores would be preferable to me. And please use the BIT() 
macro to define this constant.

Best regards
Thomas

>   /**
>    * struct iosys_map - Pointer to IO/system memory
>    * @vaddr_iomem:	The buffer's address if in I/O memory
>    * @vaddr:		The buffer's address if in system memory
> - * @is_iomem:		True if the buffer is located in I/O memory, or false
> - *			otherwise.
>    */
>   struct iosys_map {
>   	union {
>   		void __iomem *_vaddr_iomem;
>   		void *_vaddr;
>   	};
> -	bool _is_iomem;
>   };
>   
>   static inline bool iosys_map_is_iomem(const struct iosys_map *map)
>   {
> -	return map->_is_iomem;
> +	return ((unsigned long)map->_vaddr) & _IOSYS_MAP_IS_IOMEM;
>   }
>   
>   static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
>   {
> -	return map->_vaddr_iomem;
> +	return (void __iomem *)((unsigned long)map->_vaddr_iomem & ~_IOSYS_MAP_IS_IOMEM);

Macros for encoding and decoding the pointer+bit would be preferred. 
Jani seems to have helpers for that.

Best regards
Thomas

>   }
>   
>   static inline void *iosys_map_ptr(const struct iosys_map *map)
> @@ -136,7 +134,6 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>   #define IOSYS_MAP_INIT_VADDR(vaddr_)	\
>   	{				\
>   		._vaddr = (vaddr_),	\
> -		._is_iomem = false,	\
>   	}
>   
>   /**
> @@ -145,8 +142,7 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>    */
>   #define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)	\
>   	{						\
> -		._vaddr_iomem = (vaddr_iomem_),		\
> -		._is_iomem = true,			\
> +		._vaddr_iomem = (void __iomem *)(((unsigned long)(vaddr_iomem_) | _IOSYS_MAP_IS_IOMEM)), \
>   	}
>   
>   /**
> @@ -198,7 +194,6 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>   static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
>   {
>   	map->_vaddr = vaddr;
> -	map->_is_iomem = false;
>   }
>   
>   /**
> @@ -211,8 +206,7 @@ static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
>   static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>   					     void __iomem *vaddr_iomem)
>   {
> -	map->_vaddr_iomem = vaddr_iomem;
> -	map->_is_iomem = true;
> +	map->_vaddr_iomem = (void __iomem *)((unsigned long)vaddr_iomem | _IOSYS_MAP_IS_IOMEM);
>   }
>   
>   /**
> @@ -229,12 +223,9 @@ static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>   static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>   				      const struct iosys_map *rhs)
>   {
> -	if (lhs->_is_iomem != rhs->_is_iomem)
> +	if (lhs->_vaddr != rhs->_vaddr)
>   		return false;
> -	else if (lhs->_is_iomem)
> -		return lhs->_vaddr_iomem == rhs->_vaddr_iomem;
> -	else
> -		return lhs->_vaddr == rhs->_vaddr;
> +	return true;
>   }
>   
>   /**
> @@ -279,12 +270,7 @@ static inline bool iosys_map_is_set(const struct iosys_map *map)
>    */
>   static inline void iosys_map_clear(struct iosys_map *map)
>   {
> -	if (map->_is_iomem) {
> -		map->_vaddr_iomem = NULL;
> -		map->_is_iomem = false;
> -	} else {
> -		map->_vaddr = NULL;
> -	}
> +	map->_vaddr = NULL;
>   }
>   
>   /**

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

