Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B19FF9D6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3015410E25C;
	Thu,  2 Jan 2025 13:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1QxeSUBx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WgaNnnId";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1QxeSUBx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WgaNnnId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B399810E25C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:32:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6471C2115F;
 Thu,  2 Jan 2025 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1735824748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RlpeBegLDMWjIlaozf6zr/23rBU7oNvZVb1IrqZ6KHo=;
 b=1QxeSUBxYrahEdYTWGgcoWxi5ScO4QnBe34R6T79AznUPmjZInp/BLjNEHitk6NC+RHfC+
 FwLGo8I8zVYmmiEDZXnLNgzRs2cSevvgzpx6bw3zfPTbBJ6e5omy7H6oPJngO/hq5Yf/jr
 V8AJn+X36Yl8lhv8LdKrbdFbOr6CJVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1735824748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RlpeBegLDMWjIlaozf6zr/23rBU7oNvZVb1IrqZ6KHo=;
 b=WgaNnnIdsJ6Ijw9kBOzR+YcXefqL7kghxoU3Dq6wbkx7d+Hght8ux30TnPT6U4Mf2szNpF
 JVdQVMIybr+pDiDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1735824748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RlpeBegLDMWjIlaozf6zr/23rBU7oNvZVb1IrqZ6KHo=;
 b=1QxeSUBxYrahEdYTWGgcoWxi5ScO4QnBe34R6T79AznUPmjZInp/BLjNEHitk6NC+RHfC+
 FwLGo8I8zVYmmiEDZXnLNgzRs2cSevvgzpx6bw3zfPTbBJ6e5omy7H6oPJngO/hq5Yf/jr
 V8AJn+X36Yl8lhv8LdKrbdFbOr6CJVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1735824748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RlpeBegLDMWjIlaozf6zr/23rBU7oNvZVb1IrqZ6KHo=;
 b=WgaNnnIdsJ6Ijw9kBOzR+YcXefqL7kghxoU3Dq6wbkx7d+Hght8ux30TnPT6U4Mf2szNpF
 JVdQVMIybr+pDiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01D6D132EA;
 Thu,  2 Jan 2025 13:32:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E66rOmuVdmdQBwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Jan 2025 13:32:27 +0000
Message-ID: <390c14a5-44fe-4328-bcc4-2aa1384e3ad1@suse.de>
Date: Thu, 2 Jan 2025 14:32:27 +0100
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
In-Reply-To: <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[loongson.cn,kernel.org,acm.org,linux.intel.com,gmail.com,ffwll.ch,vger.kernel.org,lists.sourceforge.net,lists.freedesktop.org,xen0n.name,lists.linux.dev];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[]
X-Spam-Score: -2.80
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


Am 02.01.25 um 13:55 schrieb Binbin Zhou:
> Hi Thomas:
>
> Thanks for your reply.
>
> On Thu, Jan 2, 2025 at 5:07 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>>
>> Am 30.12.24 um 10:31 schrieb Binbin Zhou:
>> [...]
>>> +
>>> +static struct platform_driver ls2kbmc_platform_driver = {
>>> +     .driver = {
>>> +             .name = "ls2kbmc-framebuffer",
>> The driver is mostly a copy of simpledrm. Why don't you use
>> "simple-framebuffer" for your device name? You could use simpledrm
>> directly then.
> Ah, indeed, the driver is based on simpledrm.
>
> Initially, I also tried to use simpledrm directly, but it will fail in
> drm memory acquire.

Could you point to the exact call that fails within simpledrm?

> Because although we register the driver in platform form, its memory
> belongs to pci space and we can see the corresponding pci probe and
> resource allocation in Patch-1.

I don't understand. Graphics memory is often located on the PCI bus. 
What is so special about this one?

> Therefore, we need to use aperture_remove_conflicting_pci_devices().

So there is already a device that represents the graphics card? That's 
what you'd remove here? If you only add that MFD device, who owns the 
framebuffer? If it's the PCI device from patch 1 ("ls2k-bmc"), why does 
aperture_remove_conflicting_pci_devices() not remove that device? I'm 
somewhat confused, because the logic in your driver mostly looks like it 
binds to a pre-configured framebuffer, but some of the code doesn't. 
Best regards Thomas

>
> Also, since we are using BMC display, the display will be disconnected
> when BMC reset, at this time we need to push the display data (crtc,
> connector, etc.) manually as shown in Patch-4.
>
> Probably it's not the most suitable way to implement it.
>
>> Best regards
>> Thomas
>>
>>> +     },
>>> +     .probe = ls2kbmc_probe,
>>> +     .remove = ls2kbmc_remove,
>>> +};
>>> +
>>> +module_platform_driver(ls2kbmc_platform_driver);
>>> +
>>> +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
>>> +MODULE_LICENSE("GPL");
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

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

