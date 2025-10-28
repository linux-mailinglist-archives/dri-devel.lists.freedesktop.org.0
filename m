Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E3DC15F09
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 17:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDBA10E609;
	Tue, 28 Oct 2025 16:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="148WT74j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8ef14dOR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="148WT74j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8ef14dOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F404F10E609
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:50:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D5C41F460;
 Tue, 28 Oct 2025 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761670244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=owS9OnprOT3K4hADAtAD359h1dxz1oqAW4qwphgN8u4=;
 b=148WT74jBPnq+rhiu21v2Va5M90DekL9TiunscedZ7qBhsr0xGu+FikvdeWolLMplG6VwK
 ptzVtFMuhELXVLDAF8suzm/spqmEJpwF2LW0k22ssdlcRutSUMrnduvk37Kgonjgst3S2r
 +1WjBEjdDlBeiQhyD0CEL311p3azeCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761670244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=owS9OnprOT3K4hADAtAD359h1dxz1oqAW4qwphgN8u4=;
 b=8ef14dORKlnUV4gcQhOGh1sSUeT8CRlfVZxkIGnFsbUPxpe2Rl6Z5FxdtMbi055bGn684k
 adnNN9sV1+HSmACg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761670244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=owS9OnprOT3K4hADAtAD359h1dxz1oqAW4qwphgN8u4=;
 b=148WT74jBPnq+rhiu21v2Va5M90DekL9TiunscedZ7qBhsr0xGu+FikvdeWolLMplG6VwK
 ptzVtFMuhELXVLDAF8suzm/spqmEJpwF2LW0k22ssdlcRutSUMrnduvk37Kgonjgst3S2r
 +1WjBEjdDlBeiQhyD0CEL311p3azeCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761670244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=owS9OnprOT3K4hADAtAD359h1dxz1oqAW4qwphgN8u4=;
 b=8ef14dORKlnUV4gcQhOGh1sSUeT8CRlfVZxkIGnFsbUPxpe2Rl6Z5FxdtMbi055bGn684k
 adnNN9sV1+HSmACg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1165913693;
 Tue, 28 Oct 2025 16:50:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aHp9AmT0AGnULwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Oct 2025 16:50:44 +0000
Message-ID: <817215d6-0a37-41a3-89a0-b7d2f7c67f1f@suse.de>
Date: Tue, 28 Oct 2025 17:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] fbcon: Use screen info to find primary device
To: Mario Limonciello <superm1@kernel.org>,
 Aaron Erhardt <aer@tuxedocomputers.com>, David Airlie <airlied@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-4-superm1@kernel.org>
 <e172ebf2-4b65-4781-b9e7-eb7bd4fa956a@tuxedocomputers.com>
 <fb519d0e-9d7f-4835-964a-c21fd24b10e8@kernel.org>
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
In-Reply-To: <fb519d0e-9d7f-4835-964a-c21fd24b10e8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,tuxedocomputers.com,gmail.com,google.com];
 MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
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

Am 28.10.25 um 14:15 schrieb Mario Limonciello:
> On 10/28/25 5:16 AM, Aaron Erhardt wrote:
>>
>> On Mon, Aug 11, 2025 at 11:26:05AM -0500, Mario Limonciello (AMD) wrote:
>>> On systems with non VGA GPUs fbcon can't find the primary GPU because
>>> video_is_primary_device() only checks the VGA arbiter.
>>>
>>> Add a screen info check to video_is_primary_device() so that callers
>>> can get accurate data on such systems.
>>
>> I have a question regarding this change. To me, the function name
>> video_is_primary_device() implies that there is only one primary GPU.
>> I would also expect that the 'boot_display' attribute added later in
>> the patch series based on this function is only set for one GPU, but
>> that is not necessarily the case. Since I'm working on a user-space
>> program that reads the 'boot_display' attribute, I need to know what
>> behavior is intended in order to do a correct implementation.
>>
>>>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> ---
>>> v10:
>>>   * Rebase on 6.17-rc1
>>>   * Squash 'fbcon: Stop using screen_info_pci_dev()'
>>> ---
>>>   arch/x86/video/video-common.c | 25 ++++++++++++++++++++++++-
>>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/x86/video/video-common.c 
>>> b/arch/x86/video/video-common.c
>>> index 81fc97a2a837a..e0aeee99bc99e 100644
>>> --- a/arch/x86/video/video-common.c
>>> +++ b/arch/x86/video/video-common.c
>>> @@ -9,6 +9,7 @@
>>>     #include <linux/module.h>
>>>   #include <linux/pci.h>
>>> +#include <linux/screen_info.h>
>>>   #include <linux/vgaarb.h>
>>>     #include <asm/video.h>
>>> @@ -27,6 +28,11 @@ EXPORT_SYMBOL(pgprot_framebuffer);
>>>     bool video_is_primary_device(struct device *dev)
>>>   {
>>> +#ifdef CONFIG_SCREEN_INFO
>>> +    struct screen_info *si = &screen_info;
>>> +    struct resource res[SCREEN_INFO_MAX_RESOURCES];
>>> +    ssize_t i, numres;
>>> +#endif
>>>       struct pci_dev *pdev;
>>>         if (!dev_is_pci(dev))
>>> @@ -34,7 +40,24 @@ bool video_is_primary_device(struct device *dev)
>>>         pdev = to_pci_dev(dev);
>>>   -    return (pdev == vga_default_device());
>>> +    if (!pci_is_display(pdev))
>>> +        return false;
>>> +
>>> +    if (pdev == vga_default_device())
>>> +        return true;
>>
>> This can mark a VGA device as primary GPU.

Is the value returned from vga_default_device() eq to NULL?

>>
>>> +
>>> +#ifdef CONFIG_SCREEN_INFO
>>> +    numres = screen_info_resources(si, res, ARRAY_SIZE(res));
>>> +    for (i = 0; i < numres; ++i) {
>>> +        if (!(res[i].flags & IORESOURCE_MEM))
>>> +            continue;
>>> +
>>> +        if (pci_find_resource(pdev, &res[i]))
>>> +            return true;
>>> +    }
>>> +#endif
>>
>> And then the new code can also choose a primary GPU.

Maybe we should drop this block or move it to [1]? At [1] it would only 
run if the more sophisticated vgaarb has been disabled.

The vgaarb now selects CONFIG_SCREEN_INFO and already tests for 
overlapping resources. There's nothing here that vgaarb shouldn't 
already do. Yet, I don't understand how only one of the can be true at a 
time.

[1] 
https://elixir.bootlin.com/linux/v6.18-rc3/source/include/linux/vgaarb.h#L55

>>
>>> +
>>> +    return false;
>>>   }
>>>   EXPORT_SYMBOL(video_is_primary_device);
>>
>> In particular, I have hardware that has this exact configuration where
>> two GPUs are marked as primary and have a 'boot_display' attribute: the
>> first one through vga_default_device(), the second one through the new
>> detection method.
>>
>> Is this intended?
>>
>> Kind regards
>> Aaron
>>
>
> I wouldn't have expected a case like this and I think it means there 
> is a logic error.
>
> Can you please file a kernel bugzilla with details about your system 
> and CC me?
>
> dmesg and lspci -vvnn please
>
> Also; please clarify which GPU shows something when booting up.

Agreed.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


