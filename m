Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B38AC0AF0
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2510E9A1;
	Thu, 22 May 2025 11:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZusnmR1C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AUpbDowk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZusnmR1C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AUpbDowk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6710E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 11:58:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76B601F74C;
 Thu, 22 May 2025 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747915135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3CTKiEhyKi4gSlbAyyqJL/aKUlMoKpzfCiyfKRkinzU=;
 b=ZusnmR1CeZlrqpvJmvqmMj7JBcxoTV9VKj+EGmtkn2yuBWWyyJoWoMYmSH0ciiUl99DBet
 6MzQ2C3SEAigp2WJkceKmVtoWSr2A/0Sg5Yda71PzItvwM41kX+Y5C+NQzg7+93ciuvfcm
 +ekwU8wTrXOPHJDOPlAPvPcnZwkiA5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747915135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3CTKiEhyKi4gSlbAyyqJL/aKUlMoKpzfCiyfKRkinzU=;
 b=AUpbDowkOje9eXGpetGEstJ+3l06L1JqIU87sxYd8ELh7raLQ/XtiwDXIQU7OUYbSjexpT
 HcYy8ZYCj/lJ7PDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZusnmR1C;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AUpbDowk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747915135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3CTKiEhyKi4gSlbAyyqJL/aKUlMoKpzfCiyfKRkinzU=;
 b=ZusnmR1CeZlrqpvJmvqmMj7JBcxoTV9VKj+EGmtkn2yuBWWyyJoWoMYmSH0ciiUl99DBet
 6MzQ2C3SEAigp2WJkceKmVtoWSr2A/0Sg5Yda71PzItvwM41kX+Y5C+NQzg7+93ciuvfcm
 +ekwU8wTrXOPHJDOPlAPvPcnZwkiA5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747915135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3CTKiEhyKi4gSlbAyyqJL/aKUlMoKpzfCiyfKRkinzU=;
 b=AUpbDowkOje9eXGpetGEstJ+3l06L1JqIU87sxYd8ELh7raLQ/XtiwDXIQU7OUYbSjexpT
 HcYy8ZYCj/lJ7PDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DDA2137B8;
 Thu, 22 May 2025 11:58:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bKaZC38RL2gDZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 May 2025 11:58:55 +0000
Message-ID: <2cc885d5-adcf-46d1-abca-c50431ca8316@suse.de>
Date: Thu, 22 May 2025 13:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] iosys-map: add new accessor interfaces and use them
 internally.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-2-airlied@gmail.com>
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
In-Reply-To: <20250522065519.318013-2-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 76B601F74C
X-Spam-Level: 
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



Am 22.05.25 um 08:52 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This adds accessors inlines to the iosys-map. The intent is to
> roll the iomem flag into the lower bits of the vaddr eventually.
>
> First just add accessors to move all current in-tree users over to.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   include/linux/iosys-map.h | 53 +++++++++++++++++++++++++--------------
>   1 file changed, 34 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index 4696abfd311c..5ce5df1db60a 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -114,6 +114,21 @@ struct iosys_map {
>   	bool is_iomem;
>   };
>   
> +static inline bool iosys_map_is_iomem(const struct iosys_map *map)
> +{
> +	return map->is_iomem;
> +}
> +
> +static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
> +{
> +	return map->vaddr_iomem;
> +}
> +
> +static inline void *iosys_map_ptr(const struct iosys_map *map)
> +{
> +       return map->vaddr;
> +}
> +

These helpers need documentation.

We should encourage users to the other helpers for interacting with 
iosys-map structures instead of decoding them manually. OTOH there are 
cases where decoding them by hand is clearly better. I'd suggest to 
prefix the new helpers with __ so mark them an internal/special.

Best regards
Thomas

>   /**
>    * IOSYS_MAP_INIT_VADDR - Initializes struct iosys_map to an address in system memory
>    * @vaddr_:	A system-memory address
> @@ -234,9 +249,9 @@ static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>    */
>   static inline bool iosys_map_is_null(const struct iosys_map *map)
>   {
> -	if (map->is_iomem)
> -		return !map->vaddr_iomem;
> -	return !map->vaddr;
> +	if (iosys_map_is_iomem(map))
> +		return !iosys_map_ioptr(map);
> +	return !iosys_map_ptr(map);
>   }
>   
>   /**
> @@ -286,10 +301,10 @@ static inline void iosys_map_clear(struct iosys_map *map)
>   static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
>   				       const void *src, size_t len)
>   {
> -	if (dst->is_iomem)
> -		memcpy_toio(dst->vaddr_iomem + dst_offset, src, len);
> +	if (iosys_map_is_iomem(dst))
> +		memcpy_toio(iosys_map_ioptr(dst) + dst_offset, src, len);
>   	else
> -		memcpy(dst->vaddr + dst_offset, src, len);
> +		memcpy(iosys_map_ptr(dst) + dst_offset, src, len);
>   }
>   
>   /**
> @@ -306,10 +321,10 @@ static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
>   static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
>   					 size_t src_offset, size_t len)
>   {
> -	if (src->is_iomem)
> -		memcpy_fromio(dst, src->vaddr_iomem + src_offset, len);
> +	if (iosys_map_is_iomem(src))
> +		memcpy_fromio(dst, iosys_map_ioptr(src) + src_offset, len);
>   	else
> -		memcpy(dst, src->vaddr + src_offset, len);
> +		memcpy(dst, iosys_map_ptr(src) + src_offset, len);
>   }
>   
>   /**
> @@ -322,7 +337,7 @@ static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
>    */
>   static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>   {
> -	if (map->is_iomem)
> +	if (iosys_map_is_iomem(map))
>   		map->vaddr_iomem += incr;
>   	else
>   		map->vaddr += incr;
> @@ -341,10 +356,10 @@ static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>   static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>   				    int value, size_t len)
>   {
> -	if (dst->is_iomem)
> -		memset_io(dst->vaddr_iomem + offset, value, len);
> +	if (iosys_map_is_iomem(dst))
> +		memset_io(iosys_map_ioptr(dst) + offset, value, len);
>   	else
> -		memset(dst->vaddr + offset, value, len);
> +		memset(iosys_map_ptr(dst) + offset, value, len);
>   }
>   
>   #ifdef CONFIG_64BIT
> @@ -393,10 +408,10 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>    */
>   #define iosys_map_rd(map__, offset__, type__) ({					\
>   	type__ val_;									\
> -	if ((map__)->is_iomem) {							\
> -		__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
> +	if (iosys_map_is_iomem(map__)) {						\
> +		__iosys_map_rd_io(val_, iosys_map_ioptr(map__) + (offset__), type__);	\
>   	} else {									\
> -		__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);		\
> +		__iosys_map_rd_sys(val_, iosys_map_ptr(map__) + (offset__), type__);	\
>   	}										\
>   	val_;										\
>   })
> @@ -415,10 +430,10 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>    */
>   #define iosys_map_wr(map__, offset__, type__, val__) ({					\
>   	type__ val_ = (val__);								\
> -	if ((map__)->is_iomem) {							\
> -		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
> +	if (iosys_map_is_iomem(map__)) {						\
> +		__iosys_map_wr_io(val_, iosys_map_ioptr(map__) + (offset__), type__);	\
>   	} else {									\
> -		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);		\
> +		__iosys_map_wr_sys(val_, iosys_map_ptr(map__) + (offset__), type__);	\
>   	}										\
>   })
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

