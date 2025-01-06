Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6558FA0278B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 15:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5948A10E1F4;
	Mon,  6 Jan 2025 14:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HelyNMIx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WRdPCFNc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HelyNMIx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WRdPCFNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E4A10E67D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 14:10:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC2852115D;
 Mon,  6 Jan 2025 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736172625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=De2f0n7HkbUbWwqJqOqDRVUUeul3Z2c9oNqi2ssPUOc=;
 b=HelyNMIxaBWze5R7sTCqWKff0Ugd8fwW4o4jcw4+kHsmCDqg4h3sWBAZg/kgy0l0rgaANU
 CWkCPl5WhsQHSVSBzVEs4/TH2Rj0gAKTmWroZotx+dee6/RENl7EDBOD+6/Z4Xwtr3cHwr
 9+RhpzzyrQsBI4+7f4Vb2ynpMQpPYjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736172625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=De2f0n7HkbUbWwqJqOqDRVUUeul3Z2c9oNqi2ssPUOc=;
 b=WRdPCFNc32Gn4oAdt7BCTIBxOGoaE907HS33bajlGXXejq5rZKFkxdti4EIvXh5Zh70E1F
 SyzN+X+Gr1UNdGCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736172625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=De2f0n7HkbUbWwqJqOqDRVUUeul3Z2c9oNqi2ssPUOc=;
 b=HelyNMIxaBWze5R7sTCqWKff0Ugd8fwW4o4jcw4+kHsmCDqg4h3sWBAZg/kgy0l0rgaANU
 CWkCPl5WhsQHSVSBzVEs4/TH2Rj0gAKTmWroZotx+dee6/RENl7EDBOD+6/Z4Xwtr3cHwr
 9+RhpzzyrQsBI4+7f4Vb2ynpMQpPYjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736172625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=De2f0n7HkbUbWwqJqOqDRVUUeul3Z2c9oNqi2ssPUOc=;
 b=WRdPCFNc32Gn4oAdt7BCTIBxOGoaE907HS33bajlGXXejq5rZKFkxdti4EIvXh5Zh70E1F
 SyzN+X+Gr1UNdGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45EC5137DA;
 Mon,  6 Jan 2025 14:10:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GA1fD1Hke2fPNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Jan 2025 14:10:25 +0000
Message-ID: <392f855c-4474-4e12-8bdc-3baf43d34e13@suse.de>
Date: Mon, 6 Jan 2025 15:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/ls2kbmc: Add support for Loongson-2K BMC
 display
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
 Corey Minyard <minyard@acm.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Chong Qiao <qiaochong@loongson.cn>
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
 <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
 <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
 <CAMpQs4L38rDEDYM64jJ6pO+g=M4+etKN9v9+ygzkLY6RQgu94A@mail.gmail.com>
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
In-Reply-To: <CAMpQs4L38rDEDYM64jJ6pO+g=M4+etKN9v9+ygzkLY6RQgu94A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[loongson.cn,kernel.org,acm.org,linux.intel.com,gmail.com,ffwll.ch,vger.kernel.org,lists.sourceforge.net,lists.freedesktop.org,xen0n.name,lists.linux.dev];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TAGGED_RCPT(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
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

Hi,

Thanks for the info.


Am 06.01.25 um 08:03 schrieb Binbin Zhou:
[...]
>> Could you point to the exact call that fails within simpledrm?
> If we use simpledrm directly, the following error occurs:
>
> [    8.289823] simple-framebuffer simple-framebuffer.0: [drm] *ERROR*
> could not acquire memory range [mem 0xe0031200000-0xe00315fffff flags
> 0x200]: -16
> [    8.312681] simple-framebuffer simple-framebuffer.0: probe with
> driver simple-framebuffer failed with error -16
>
> The reason for the failure: overlapping resources.
>
> https://elixir.bootlin.com/linux/v6.12.6/source/drivers/video/aperture.c#L175

This error means that there's already an instance of simpledrm bound to 
the BMC framebuffer. So you already have a working display and some 
graphics under Linux without the new driver, right?

If so, why do you need a new driver that does exactly the same as simpledrm?

Best regards
Thomas

>>> Because although we register the driver in platform form, its memory
>>> belongs to pci space and we can see the corresponding pci probe and
>>> resource allocation in Patch-1.
>> I don't understand. Graphics memory is often located on the PCI bus.
>> What is so special about this one?
>>
>>> Therefore, we need to use aperture_remove_conflicting_pci_devices().
>> So there is already a device that represents the graphics card? That's
>> what you'd remove here? If you only add that MFD device, who owns the
>> framebuffer? If it's the PCI device from patch 1 ("ls2k-bmc"), why does
>> aperture_remove_conflicting_pci_devices() not remove that device? I'm
>> somewhat confused, because the logic in your driver mostly looks like it
>> binds to a pre-configured framebuffer, but some of the code doesn't.
> Perhaps the use of aperture_remove_conflicting_pci_devices() is wrong,
> as there is only one display device for the LS2K BMC and there will be
> no phase conflict.
>
> When I tried to use that API before, it was partly due to the error
> above, and partly because I referenced that other display drivers via
> pci_driver.probe() would have it, just in case I used it, which was
> probably the wrong choice.
>
> The resources for pci bar0 are as follows:
> BAR0: e0030000000/SZ_32M
>
> 0x0              0x600000  0xf00001c    16M            32M
> +----+--------------+--------+-----------+---+-----------------+
> | 2M | simpldrm |           | IPMI      |     | video env     |
> +-----------------------------------------------------------------+
>
> The mfd driver registers the ls2kbmc-framebuffer and ls2k-ipmi-si
> devices according to the resource allocation shown above. At the same
> time, the ls2kbmc drm is bound to the pre-configured “simpldrm”
> resource in the above figure, which is passed through the
> ls2kbmc-framebuffer driver. In addition, the resolution is read from
> “video env” for the time being, and the resolution adaption is planned
> to be added later.
>
>> Best regards Thomas
>>
>>> Also, since we are using BMC display, the display will be disconnected
>>> when BMC reset, at this time we need to push the display data (crtc,
>>> connector, etc.) manually as shown in Patch-4.
>>>
>>> Probably it's not the most suitable way to implement it.
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> +     },
>>>>> +     .probe = ls2kbmc_probe,
>>>>> +     .remove = ls2kbmc_remove,
>>>>> +};
>>>>> +
>>>>> +module_platform_driver(ls2kbmc_platform_driver);
>>>>> +
>>>>> +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
>>>>> +MODULE_LICENSE("GPL");
>>>> --
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Frankenstrasse 146, 90461 Nuernberg, Germany
>>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>>>> HRB 36809 (AG Nuernberg)
>>>>
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>
>
> --
> Thanks.
> Binbin

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

