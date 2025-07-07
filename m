Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CAAFB0F1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C7010E436;
	Mon,  7 Jul 2025 10:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OZ15/u1N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lMvW1v9l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OZ15/u1N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lMvW1v9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F5A10E436
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 10:17:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6D8021199;
 Mon,  7 Jul 2025 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751883435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DE2k96o9iD+lqRTj460+OBpJ9c3Jss1dAuax0OXiA08=;
 b=OZ15/u1NnN/LfxoMWgJ0qoFvtXMP7BOl2FNLR81Cf6WFoNb24W9oNxc5ycteG4qc8eC6X4
 yqy7UsMPWFwwId7xByuaXMS98hIiIE8SKQo5HHn1Zkol0RLe0F5+QXrU0Ss5tsyzkoA1Om
 MTRXs/Am8L3eD9v9p0P63BPMT/HY+QI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751883435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DE2k96o9iD+lqRTj460+OBpJ9c3Jss1dAuax0OXiA08=;
 b=lMvW1v9lPd+8P5GUZC82JRnqQHmU1c95QVvLU8oKus5Bhr8TiYJavPx/gzS7SIztfMuwvq
 buCUOSIsrf+4S0Ag==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="OZ15/u1N";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lMvW1v9l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751883435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DE2k96o9iD+lqRTj460+OBpJ9c3Jss1dAuax0OXiA08=;
 b=OZ15/u1NnN/LfxoMWgJ0qoFvtXMP7BOl2FNLR81Cf6WFoNb24W9oNxc5ycteG4qc8eC6X4
 yqy7UsMPWFwwId7xByuaXMS98hIiIE8SKQo5HHn1Zkol0RLe0F5+QXrU0Ss5tsyzkoA1Om
 MTRXs/Am8L3eD9v9p0P63BPMT/HY+QI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751883435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DE2k96o9iD+lqRTj460+OBpJ9c3Jss1dAuax0OXiA08=;
 b=lMvW1v9lPd+8P5GUZC82JRnqQHmU1c95QVvLU8oKus5Bhr8TiYJavPx/gzS7SIztfMuwvq
 buCUOSIsrf+4S0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF6D713757;
 Mon,  7 Jul 2025 10:17:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I4ZRKaqea2iVWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Jul 2025 10:17:14 +0000
Message-ID: <2c02e746-73d0-4d3c-aa2e-093523d4d58d@suse.de>
Date: Mon, 7 Jul 2025 12:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed
 but not fixuped
To: Shixiong Ou <oushixiong1025@163.com>, Helge Deller <deller@gmx.de>
Cc: Peter Jones <pjones@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250626094937.515552-1-oushixiong1025@163.com>
 <3b3feb03-c417-4569-b7b0-44565d7cce4f@suse.de>
 <a937f41f-2cee-459d-b94f-b7f979072f3e@163.com>
 <1687bb52-e724-46a8-af75-26b486634c20@suse.de>
 <1567a84b-3f78-4f0a-9549-bfe9fd4aa96b@163.com>
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
In-Reply-To: <1567a84b-3f78-4f0a-9549-bfe9fd4aa96b@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E6D8021199
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[163.com,gmx.de];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, kylinos.cn:email, suse.de:dkim, suse.de:mid]
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

Hi

Am 07.07.25 um 12:02 schrieb Shixiong Ou:
>
> 在 2025/7/7 17:28, Thomas Zimmermann 写道:
>> Hi
>>
>> Am 07.07.25 um 11:24 schrieb Shixiong Ou:
>>>
>>> 在 2025/6/27 17:13, Thomas Zimmermann 写道:
>>>> Hi
>>>>
>>>> Am 26.06.25 um 11:49 schrieb oushixiong1025@163.com:
>>>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>>>
>>>>> [WHY]
>>>>> On an ARM machine, the following log is present:
>>>>> [    0.900884] efifb: framebuffer at 0x1020000000, using 3072k, 
>>>>> total 3072k
>>>>> [    2.297884] amdgpu 0000:04:00.0: 
>>>>> remove_conflicting_pci_framebuffers: bar 0: 0x1000000000 -> 
>>>>> 0x100fffffff
>>>>> [    2.297886] amdgpu 0000:04:00.0: 
>>>>> remove_conflicting_pci_framebuffers: bar 2: 0x1010000000 -> 
>>>>> 0x10101fffff
>>>>> [    2.297888] amdgpu 0000:04:00.0: 
>>>>> remove_conflicting_pci_framebuffers: bar 5: 0x58200000 -> 0x5823ffff
>>>>>
>>>>> It show that the efifb framebuffer base is out of PCI BAR, and this
>>>>> results in both efi-framebuffer and amdgpudrmfb co-existing.
>>>>>
>>>>> The fbcon will be bound to efi-framebuffer by default and cannot 
>>>>> be used.
>>>>>
>>>>> [HOW]
>>>>> Do not load efifb driver if PCI BAR has changed but not fixuped.
>>>>> In the following cases:
>>>>>     1. screen_info_lfb_pdev is NULL.
>>>>>     2. __screen_info_relocation_is_valid return false.
>>>>
>>>> Apart from ruling out invalid screen_info, did you figure out why 
>>>> the relocation tracking didn't work? It would be good to fix this 
>>>> if possible.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>> I haven’t figure out the root cause yet.
>>>
>>> This issue is quite rare and might be related to the EFI firmware.
>>> However, I wonder if we could add some handling when no PCI 
>>> resources are found in screen_info_fixup_lfb(), as a temporary 
>>> workaround for the problem I mentioned earlier.
>>
>> As I said elsewhere in the thread, you can clear the screen_info's 
>> video type in the branch at [1] to disable it entirely. We should 
>> have probably done this anyway. Knowing the cause of the issue would 
>> still be nice though.
>>
>> Best regards
>> Thomas
>>
>> [1] 
>> https://elixir.bootlin.com/linux/v6.15.5/source/drivers/video/screen_info_pci.c#L44 
>>
>>
> thanks for you suggestion, while there are two cases:
>     1. screen_info_lfb_pdev is NULL.
>     2. __screen_info_relocation_is_valid return false.
>
> should we do it at [1] too?

No. This being NULL is an entirely valid state.

Best regards
Thomas

>
> Best regards
> Shixiong Ou
>
> [1] 
> https://elixir.bootlin.com/linux/v6.15.5/source/drivers/video/screen_info_pci.c#L47
>
>>>
>>> Best regards
>>> Shixiong Ou
>>>
>>>>>
>>>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>>>> ---
>>>>>   drivers/video/fbdev/efifb.c     |  4 ++++
>>>>>   drivers/video/screen_info_pci.c | 24 ++++++++++++++++++++++++
>>>>>   include/linux/screen_info.h     |  5 +++++
>>>>>   3 files changed, 33 insertions(+)
>>>>>
>>>>> diff --git a/drivers/video/fbdev/efifb.c 
>>>>> b/drivers/video/fbdev/efifb.c
>>>>> index 0e1bd3dba255..de8d016c9a66 100644
>>>>> --- a/drivers/video/fbdev/efifb.c
>>>>> +++ b/drivers/video/fbdev/efifb.c
>>>>> @@ -303,6 +303,10 @@ static void efifb_setup(struct screen_info 
>>>>> *si, char *options)
>>>>>     static inline bool fb_base_is_valid(struct screen_info *si)
>>>>>   {
>>>>> +    /* check whether fb_base has changed but not fixuped */
>>>>> +    if (!screen_info_is_useful())
>>>>> +        return false;
>>>>> +
>>>>>       if (si->lfb_base)
>>>>>           return true;
>>>>>   diff --git a/drivers/video/screen_info_pci.c 
>>>>> b/drivers/video/screen_info_pci.c
>>>>> index 66bfc1d0a6dc..ac57dcaf0cac 100644
>>>>> --- a/drivers/video/screen_info_pci.c
>>>>> +++ b/drivers/video/screen_info_pci.c
>>>>> @@ -9,6 +9,8 @@ static struct pci_dev *screen_info_lfb_pdev;
>>>>>   static size_t screen_info_lfb_bar;
>>>>>   static resource_size_t screen_info_lfb_res_start; // original 
>>>>> start of resource
>>>>>   static resource_size_t screen_info_lfb_offset; // framebuffer 
>>>>> offset within resource
>>>>> +static bool screen_info_changed;
>>>>> +static bool screen_info_fixuped;
>>>>>     static bool __screen_info_relocation_is_valid(const struct 
>>>>> screen_info *si, struct resource *pr)
>>>>>   {
>>>>> @@ -24,6 +26,24 @@ static bool 
>>>>> __screen_info_relocation_is_valid(const struct screen_info *si, stru
>>>>>       return true;
>>>>>   }
>>>>>   +bool screen_info_is_useful(void)
>>>>> +{
>>>>> +    unsigned int type;
>>>>> +    const struct screen_info *si = &screen_info;
>>>>> +
>>>>> +    type = screen_info_video_type(si);
>>>>> +    if (type != VIDEO_TYPE_EFI)
>>>>> +        return true;
>>>>> +
>>>>> +    if (screen_info_changed && !screen_info_fixuped) {
>>>>> +        pr_warn("The screen_info has changed but not fixuped");
>>>>> +        return false;
>>>>> +    }
>>>>> +
>>>>> +    pr_info("The screen_info is useful");
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>>   void screen_info_apply_fixups(void)
>>>>>   {
>>>>>       struct screen_info *si = &screen_info;
>>>>> @@ -32,18 +52,22 @@ void screen_info_apply_fixups(void)
>>>>>           struct resource *pr = 
>>>>> &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
>>>>>             if (pr->start != screen_info_lfb_res_start) {
>>>>> +            screen_info_changed = true;
>>>>>               if (__screen_info_relocation_is_valid(si, pr)) {
>>>>>                   /*
>>>>>                    * Only update base if we have an actual
>>>>>                    * relocation to a valid I/O range.
>>>>>                    */
>>>>>                   __screen_info_set_lfb_base(si, pr->start + 
>>>>> screen_info_lfb_offset);
>>>>> +                screen_info_fixuped = true;
>>>>>                   pr_info("Relocating firmware framebuffer to 
>>>>> offset %pa[d] within %pr\n",
>>>>>                       &screen_info_lfb_offset, pr);
>>>>>               } else {
>>>>>                   pr_warn("Invalid relocating, disabling firmware 
>>>>> framebuffer\n");
>>>>>               }
>>>>>           }
>>>>> +    } else {
>>>>> +        screen_info_changed = true;
>>>>>       }
>>>>>   }
>>>>>   diff --git a/include/linux/screen_info.h 
>>>>> b/include/linux/screen_info.h
>>>>> index 923d68e07679..632cdbb1adbe 100644
>>>>> --- a/include/linux/screen_info.h
>>>>> +++ b/include/linux/screen_info.h
>>>>> @@ -138,9 +138,14 @@ ssize_t screen_info_resources(const struct 
>>>>> screen_info *si, struct resource *r,
>>>>>   u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si);
>>>>>     #if defined(CONFIG_PCI)
>>>>> +bool screen_info_is_useful(void);
>>>>>   void screen_info_apply_fixups(void);
>>>>>   struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
>>>>>   #else
>>>>> +bool screen_info_is_useful(void)
>>>>> +{
>>>>> +    return true;
>>>>> +}
>>>>>   static inline void screen_info_apply_fixups(void)
>>>>>   { }
>>>>>   static inline struct pci_dev *screen_info_pci_dev(const struct 
>>>>> screen_info *si)
>>>>
>>>
>>
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

