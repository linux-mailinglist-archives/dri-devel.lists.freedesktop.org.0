Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7FAA93F3
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 15:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517F510E3F5;
	Mon,  5 May 2025 13:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lMEr3AV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7nxSakYs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v9Ae7hKI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HzxJgYRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE410E3FC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 13:05:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC78D2118E;
 Mon,  5 May 2025 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746450335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9kNURRV4ukZ4v7vcX5H09sYuQZgZBE4hWy/W8Sz/DCo=;
 b=lMEr3AV1Tly1ms9I3JoEVvg/zIQ0/VFz/OHBdCcnkTyaihj9RFv7mIUeVRHz+qlPArjzdH
 OBY+v3uIdmYXyM0JDK5gPXBf9VqISozjTV2Y2SudiaJ2caNN1G+RBHiUXew2G7P0qUJvlJ
 52+95aTTInTZY4fwEgaFCPlD2bGT13U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746450335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9kNURRV4ukZ4v7vcX5H09sYuQZgZBE4hWy/W8Sz/DCo=;
 b=7nxSakYsOsZCo+kVpO7TQ9uZqp7qC498asgJ33nx+NVf4Jy227iEvPUSbbb+DxlVLY2KsI
 QtYUbJhyGBWsVoBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v9Ae7hKI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HzxJgYRg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746450334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9kNURRV4ukZ4v7vcX5H09sYuQZgZBE4hWy/W8Sz/DCo=;
 b=v9Ae7hKITxuZvfavY2a/7NJd2MJbVb2BrHnvbBg3Zdrom0EjCSrVcJ293QHFggVJa5Mi43
 pn5gy8ZHGJRn/shn/NzaEpuIVQQ8Kl4p6Hj0i7990uYEQ5eE/DJsszAVQNJykIPIu876Oj
 PWwN/BSZes5/7077ZVOxMq7ttFSPXsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746450334;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9kNURRV4ukZ4v7vcX5H09sYuQZgZBE4hWy/W8Sz/DCo=;
 b=HzxJgYRgeS6yMTgHuNfEA4DhDHJfN/rlI9OoaFMFgAbCqxNLeakwBm5TP1FivGKnQHhRS1
 ZtjoROJk78Rk4eCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A066B1372E;
 Mon,  5 May 2025 13:05:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dJLyJJ63GGhpLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 May 2025 13:05:34 +0000
Message-ID: <14971422-04af-4f0e-8c3b-7aa97e7af2a5@suse.de>
Date: Mon, 5 May 2025 15:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] video: screen_info: Relocate framebuffers behind PCI
 bridges
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: javierm@redhat.com, iivanov@suse.de, tiwai@suse.de, bhelgaas@google.com,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 stable@vger.kernel.org
References: <20250422214711.GA385826@bhelgaas>
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
In-Reply-To: <20250422214711.GA385826@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DC78D2118E
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid,bootlin.com:url,lists.freedesktop.org:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 22.04.25 um 23:47 schrieb Bjorn Helgaas:
> On Tue, Apr 22, 2025 at 09:49:57AM +0200, Thomas Zimmermann wrote:
>> Apply bridge window offsets to screen_info framebuffers during
>> relocation. Fixes invalid access to I/O memory.
>>
>> Resources behind a PCI bridge can be located at a certain offset
>> in the kernel's I/O range. The framebuffer memory range stored in
>> screen_info refers to the offset as seen during boot (essentialy 0).
>> During boot up, the kernel may assign a different memory offset to
>> the bridge device and thereby relocating the framebuffer address of
>> the PCI graphics device as seen by the kernel. The information in
>> screen_info must be updated as well.
> I can't see the bug report below, so I'm not sure what's happening
> here.  Apparently the platform is one where PCI bus addresses are not
> identical to CPU physical addresses.  On such platforms, the PCI host
> bridge applies an offset between CPU and PCI addresses.  There are
> several systems like that, but I'm not aware of any that change that
> CPU->PCI bus address offset at runtime.
>
> So I suspect the problem is not that the kernel has assigned a
> different offset.  I think it's more likely that the hardware or
> firmware has determined the offset before the kernel starts, and this
> code just doesn't account for that.

Right, that's what I'm trying to say. I guess my explanation simply 
isn't clear.

>
> I don't know what "stored in screen_info" means.  Most of the
> addresses filled in by screen_info_resources() are hard-coded bus
> addresses specified by PCI and VGA specs.  These are not just offsets
> "seen during boot"; these are legacy addresses that are not
> programmable via usual PCI BARs.  They're hard-wired into VGA devices,
> so if we use the VGA frame buffer at 0xA0000, the 0xA0000 address must
> appear on the PCI bus.
>
> VIDEO_TYPE_VLFB and VIDEO_TYPE_EFI are exceptions; I don't know how
> they work, but if they return addresses from firmware, I would expect
> them to be PCI bus addresses as well.

Exactly. These addresses are determined by Grub, stored in the 
screen_info field of the kernel's boot params, and then transferred to 
the kernel. [1] Somewhere between storing them and using them in the 
kernel, the offset is applied to the address range. The content in 
screen_info is never being updated. That's what this patch does.

[1] 
https://elixir.bootlin.com/linux/v6.14.5/source/arch/x86/include/uapi/asm/bootparam.h#L117

>
>> The helper pcibios_bus_to_resource() performs the relocation of
>> the screen_info resource. The result now matches the I/O-memory
>> resource of the PCI graphics device. As before, we store away the
>> information necessary to update the information in screen_info.
>>
>> Commit 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated
>> EFI framebuffers") added the code for updating screen_info. It is
>> based on similar functionality that pre-existed in efifb. Efifb uses
>> a pointer to the PCI resource, while the newer code does a memcpy of
>> the region. Hence efifb sees any updates to the PCI resource and avoids
>> the issue.
>>
>> v2:
>> - Fixed tags (Takashi, Ivan)
>> - Updated information on efifb
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: "Ivan T. Ivanov" <iivanov@suse.de>
>> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1240696
> This bug isn't public.  Can it be made public?  Or even better, a
> report at https://bugzilla.kernel.org?


Try again, please. I've updated the settings of this bug report.

>
> s/essentialy/essentially/
>
>> Tested-by: "Ivan T. Ivanov" <iivanov@suse.de>
>> Fixes: 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated EFI framebuffers")
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v6.9+
>> ---
>>   drivers/video/screen_info_pci.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
>> index 6c5833517141..c46c75dc3fae 100644
>> --- a/drivers/video/screen_info_pci.c
>> +++ b/drivers/video/screen_info_pci.c
>> @@ -8,7 +8,7 @@
>>   static struct pci_dev *screen_info_lfb_pdev;
>>   static size_t screen_info_lfb_bar;
>>   static resource_size_t screen_info_lfb_offset;
>> -static struct resource screen_info_lfb_res = DEFINE_RES_MEM(0, 0);
>> +static struct pci_bus_region screen_info_lfb_region;
>>   
>>   static bool __screen_info_relocation_is_valid(const struct screen_info *si, struct resource *pr)
>>   {
>> @@ -31,7 +31,7 @@ void screen_info_apply_fixups(void)
>>   	if (screen_info_lfb_pdev) {
>>   		struct resource *pr = &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
>>   
>> -		if (pr->start != screen_info_lfb_res.start) {
>> +		if (pr->start != screen_info_lfb_region.start) {
>>   			if (__screen_info_relocation_is_valid(si, pr)) {
>>   				/*
>>   				 * Only update base if we have an actual
>> @@ -69,10 +69,21 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
>>   
>>   	for (i = 0; i < numres; ++i) {
>>   		struct resource *r = &res[i];
>> +		struct pci_bus_region bus_region = {
>> +			.start = r->start,
>> +			.end = r->end,
>> +		};
> screen_info_resources() above fills in "struct resource res[]", but
> that's not quite right.  A struct resource contains CPU addresses, and
> screen_info_resources() fills in PCI bus addresses (0xa0000, etc).
>
> struct pci_bus_region is meant to hold PCI bus addresses, so this
> assignment gets them back where they should be.
>
>>   		const struct resource *pr;
>>   
>>   		if (!(r->flags & IORESOURCE_MEM))
>>   			continue;
>> +
>> +		/*
>> +		 * Translate the address to resource if the framebuffer
>> +		 * is behind a PCI bridge.
>> +		 */
>> +		pcibios_bus_to_resource(pdev->bus, r, &bus_region);
> And this converts the PCI bus addresses to CPU addresses, so this
> makes sense.
>
> The comment might be a little misleading, though.  When PCI bus
> addresses are different from CPU addresses, it's because the PCI host
> bridge has applied an offset.  This only happens at the host bridge,
> never at a PCI-PCI bridge (which is what "PCI bridge" usually means).
>
> The commit log and comments could maybe be clarified, but this all
> looks to me like it's doing the right thing in spite of abusing the
> use of struct resource.

Thanks for reviewing. I'll try to clarify on the commit message. Not 
sure how to change the issue with struct pci_bus_region though.

Best regards
Thomas

>
>>   		pr = pci_find_resource(pdev, r);
>>   		if (!pr)
>>   			continue;
>> @@ -85,7 +96,7 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
>>   		screen_info_lfb_pdev = pdev;
>>   		screen_info_lfb_bar = pr - pdev->resource;
>>   		screen_info_lfb_offset = r->start - pr->start;
>> -		memcpy(&screen_info_lfb_res, r, sizeof(screen_info_lfb_res));
>> +		memcpy(&screen_info_lfb_region, &bus_region, sizeof(screen_info_lfb_region));
>>   	}
>>   }
>>   DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY, 16,
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

