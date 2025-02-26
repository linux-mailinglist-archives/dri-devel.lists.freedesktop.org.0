Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8EA457EE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A45210E87C;
	Wed, 26 Feb 2025 08:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LDTLr8IA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="loDyTY05";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LDTLr8IA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="loDyTY05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7A810E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:16:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D38C1F387;
 Wed, 26 Feb 2025 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740557787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZudkjdRVQNPg848x41RYi8LijSsi8vBmiAuiAX8utgc=;
 b=LDTLr8IA+argGZIDJevpVmw+I2jbjO8uxicQUX9Zxf1UZYu/KjfKfc5sIgcHzfHfEcQotZ
 tga8Wyi1YjR/Y4hlCqOOxOIEHAz460iwl/3ITxcVXTXDvynq5WoLYi7nMx7bZFchywI4Cq
 JLjE+1NjFoR5iSoBs2h9nitQFoc68v4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740557787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZudkjdRVQNPg848x41RYi8LijSsi8vBmiAuiAX8utgc=;
 b=loDyTY05jK63KsFbF/VdpdoZup6lnBJiQes8DhqYb4Pc0Ob38XWn1a21CDRw0Z0/afgeDt
 2ga5x2tyCwhiHBBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740557787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZudkjdRVQNPg848x41RYi8LijSsi8vBmiAuiAX8utgc=;
 b=LDTLr8IA+argGZIDJevpVmw+I2jbjO8uxicQUX9Zxf1UZYu/KjfKfc5sIgcHzfHfEcQotZ
 tga8Wyi1YjR/Y4hlCqOOxOIEHAz460iwl/3ITxcVXTXDvynq5WoLYi7nMx7bZFchywI4Cq
 JLjE+1NjFoR5iSoBs2h9nitQFoc68v4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740557787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZudkjdRVQNPg848x41RYi8LijSsi8vBmiAuiAX8utgc=;
 b=loDyTY05jK63KsFbF/VdpdoZup6lnBJiQes8DhqYb4Pc0Ob38XWn1a21CDRw0Z0/afgeDt
 2ga5x2tyCwhiHBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D30BF1377F;
 Wed, 26 Feb 2025 08:16:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id W60NMtrNvmd9QgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 08:16:26 +0000
Message-ID: <29ecc7c4-2887-4989-a1d3-aa76b44c0387@suse.de>
Date: Wed, 26 Feb 2025 09:16:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dummycon: only build module if there are users
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250225164436.56654-1-arnd@kernel.org>
 <4d047af3-fd30-4fa4-aa3d-c0359856d750@suse.de>
 <a2c0e681-2cdf-4dc9-82fc-be35f54ff795@app.fastmail.com>
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
In-Reply-To: <a2c0e681-2cdf-4dc9-82fc-be35f54ff795@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00];
 RSPAMD_URIBL(4.50)[arndb.de:email]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[arndb.de,kernel.org,linuxfoundation.org,gmx.de];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,arndb.de:email]
X-Spam-Score: 0.20
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

Am 26.02.25 um 08:55 schrieb Arnd Bergmann:
> On Wed, Feb 26, 2025, at 08:48, Thomas Zimmermann wrote:
>> Am 25.02.25 um 17:44 schrieb Arnd Bergmann:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Dummycon is used as a fallback conswitchp for vgacon and fbcon
>>> in the VT code, and there are no references to it if all three
>>> are disabled, so just leave it out of the kernel image for
>>> configurations without those.
>>>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>    drivers/video/console/Kconfig | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
>>> index bc31db6ef7d2..1c4263c164ce 100644
>>> --- a/drivers/video/console/Kconfig
>>> +++ b/drivers/video/console/Kconfig
>>> @@ -47,8 +47,7 @@ config SGI_NEWPORT_CONSOLE
>>>    	  card of your Indy.  Most people say Y here.
>>>    
>>>    config DUMMY_CONSOLE
>>> -	bool
>>> -	default y
>>> +	def_bool VT || VGA_CONSOLE || FRAMEBUFFER_CONSOLE
>> What about MDA_CONSOLE and STI_CONSOLE. Don't they require this as fallback?
>>
> MDA_CONSOLE clearly does not, because that is only the second
> console when VGA_CONSOLE is the main one.
>
> For sti_console, I don't see how it would do use it: when CONFIG_VT
> is enabled, the line above turns on DUMMY_CONSOLE, but without
> CONFIG_VT there seems to be no reference to it after
> 58a5c67aadde ("parisc/sticon: Always register sticon console
> driver"). I also see that CONFIG_STI_CONSOLE is a 'bool' symbol,
> so there is no dynamic loading/unloading of the driver.

Thanks.

Here's another general question. vgacon and fbcon only seem usable with 
CONFIG_VT=y. Wouldn't it make sense to have them depend on CONFIG_VT=y? 
dummycon could then be implemented as part of the vt code, maybe even 
become a vt-internal thing. The console code is complex, so I'm probably 
missing something here?

Best regards
Thomas

>
>      Arnd

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

