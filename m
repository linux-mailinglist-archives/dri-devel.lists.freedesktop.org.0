Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EhFIoCUpWnXEAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:45:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99641DA06F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730C910E10F;
	Mon,  2 Mar 2026 13:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="i/R9yZ6K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZWaC3KlO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MNVteQfP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EEoWOfIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B73F10E355
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 13:45:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26B4D3F887;
 Mon,  2 Mar 2026 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772459131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hGrb3NMgIgqEfMlakG7obxX71STFY5ujm7uR5zREPSU=;
 b=i/R9yZ6KfbcpWMucW3SE/ogYvrv5Wtp+FqSXPggweB9idGIpKCwGaoIDZCOHK8cIQbBRIe
 /a8BmVB93z/t9Pz9RVqT7uTeIAfAsPcyH+u3nALDQ0scDniIHrz+kInR5TMowcRWK2p8CX
 1Q2XeDksPa2n+5OwT95uf2UKeFPv3/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772459131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hGrb3NMgIgqEfMlakG7obxX71STFY5ujm7uR5zREPSU=;
 b=ZWaC3KlO7tytB8fzvGNYtrvt9mOnuDWbyQqzKMhNBsesGZSMhiBMqIY2b2ZoRbxoHoyJAE
 7K84oHHHKNHb+iAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772459130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hGrb3NMgIgqEfMlakG7obxX71STFY5ujm7uR5zREPSU=;
 b=MNVteQfPofnKqBG7U6LYjres8YzIicr+Kl+vAXjhFE+dN+VVyUC11LCsi3rnu+qW9gXzUV
 c/XaNQM6M1XyUdPxmGfds8SA7fz5BgG+2In7iYUNoCMv0++qVL7Ivyfu3hcJTyr7rx1SzB
 hnXmDm6Kqmsu8uIVztxJAIjIrY2YVzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772459130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hGrb3NMgIgqEfMlakG7obxX71STFY5ujm7uR5zREPSU=;
 b=EEoWOfIt/vpjP85FofwZ5kjK76TTwWLILLeFGUFauorAkp4QUunFbW1fBE7IsCa8V7kCXP
 VIbWLUhPFR2Td+Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0CAB3EA69;
 Mon,  2 Mar 2026 13:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZHJaOXmUpWmECwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 13:45:29 +0000
Message-ID: <d251b638-2323-4d14-af14-2f15ee826a9a@suse.de>
Date: Mon, 2 Mar 2026 14:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] lib/fonts: Remove internal symbols and macros from
 public header file
To: Helge Deller <deller@gmx.de>, gregkh@linuxfoundation.org, sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260218083855.10743-1-tzimmermann@suse.de>
 <20260218083855.10743-14-tzimmermann@suse.de>
 <d8633caa-c01c-433c-8dd3-f300dac53a0b@gmx.de>
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
In-Reply-To: <d8633caa-c01c-433c-8dd3-f300dac53a0b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:gregkh@linuxfoundation.org,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org,ravnborg.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: D99641DA06F
X-Rspamd-Action: no action



Am 23.02.26 um 16:05 schrieb Helge Deller:
> On 2/18/26 09:16, Thomas Zimmermann wrote:
>> diff --git a/include/linux/font.h b/include/linux/font.h
>> index 4ff956a1cd0a..6e9a4c93b47b 100644
>> --- a/include/linux/font.h
>> +++ b/include/linux/font.h
>> @@ -92,20 +92,12 @@ struct font_desc {
>>   #define FONT6x8_IDX    12
>>   #define TER10x18_IDX    13
>>   -extern const struct font_desc    font_vga_8x8,
>> -            font_vga_8x16,
>> -            font_pearl_8x8,
>> -            font_vga_6x11,
>> -            font_7x14,
>> -            font_10x18,
>> -            font_sun_8x16,
>> -            font_sun_12x22,
>> -            font_acorn_8x8,
>> -            font_mini_4x6,
>> -            font_6x10,
>> -            font_ter_16x32,
>> -            font_6x8,
>> -            font_ter_10x18;
>> +#if defined(CONFIG_FONT_8x8)
>> +extern const struct font_desc font_vga_8x8;
>> +#endif
>> +#if defined(CONFIG_FONT_8x16)
>> +extern const struct font_desc font_vga_8x16;
>> +#endif
>
> I suggest not to use all those #ifdef(CONFIG_XXX) in the header files.
> They are not necessary, and trigger a rebuild of a whole lot C-files
> in case one single CONFIG option is changed.
> Instead use it in the C-files only.
> That way (re-)compilation is faster and you still get a link/build error
> when a symbol is used although the config option is not set.

Ok. I'll send out an update in a bit.

>
>> diff --git a/lib/fonts/font.h b/lib/fonts/font.h
>> new file mode 100644
>> index 000000000000..00f65a3da5c2
>> --- /dev/null
>> +++ b/lib/fonts/font.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef _LIB_FONTS_FONT_H
>> +#define _LIB_FONTS_FONT_H
>> +
>> +#include <linux/font.h>
>> +
>> +#if defined(CONFIG_FONT_PEARL_8x8)
>> +extern const struct font_desc font_pearl_8x8;
>> +#endif
>> +#if defined(CONFIG_FONT_6x11)
>> +extern const struct font_desc font_vga_6x11;
>> +#endif
> ...
> same here...
>
> Helge
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


