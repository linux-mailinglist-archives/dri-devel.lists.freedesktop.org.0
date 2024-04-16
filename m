Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475EC8A6B60
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C09910F6BE;
	Tue, 16 Apr 2024 12:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IGk/LXsv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M1/YZYRE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IGk/LXsv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M1/YZYRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F3310FD15
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:44:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2ECE737473;
 Tue, 16 Apr 2024 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713271493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AuBMf/Uad19yCYIhnpOyVDrb5x8OWL2p4o577aT1akk=;
 b=IGk/LXsvyRiDACZaWz65kwfi/Ua7ySbxMkqnjk1xGvzgVX6ZSJ9FfZqQbre3rLQAK4fE0w
 kVSZ1730Z/YeINkI7DHkF8HYDpB5xdtbsmWX2zTPSx+oaoN1hTTmBq6W56hNho1qQBYdJT
 WR6jRmn6lnC6znTr4+toTBi/VxqDpg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713271493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AuBMf/Uad19yCYIhnpOyVDrb5x8OWL2p4o577aT1akk=;
 b=M1/YZYREQ0Q81ljq9Eej6XFLzNlRqV0KKz/tYiOsRJWs2GiuAZMeH1GF4gb0M9Sn+rG7DG
 1O/GrADTR94mQbCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="IGk/LXsv";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="M1/YZYRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713271493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AuBMf/Uad19yCYIhnpOyVDrb5x8OWL2p4o577aT1akk=;
 b=IGk/LXsvyRiDACZaWz65kwfi/Ua7ySbxMkqnjk1xGvzgVX6ZSJ9FfZqQbre3rLQAK4fE0w
 kVSZ1730Z/YeINkI7DHkF8HYDpB5xdtbsmWX2zTPSx+oaoN1hTTmBq6W56hNho1qQBYdJT
 WR6jRmn6lnC6znTr4+toTBi/VxqDpg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713271493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AuBMf/Uad19yCYIhnpOyVDrb5x8OWL2p4o577aT1akk=;
 b=M1/YZYREQ0Q81ljq9Eej6XFLzNlRqV0KKz/tYiOsRJWs2GiuAZMeH1GF4gb0M9Sn+rG7DG
 1O/GrADTR94mQbCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB68613432;
 Tue, 16 Apr 2024 12:44:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +qJON8RyHmaERwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Apr 2024 12:44:52 +0000
Message-ID: <18d461b6-8086-42f5-b629-b673daa04bd7@suse.de>
Date: Tue, 16 Apr 2024 14:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/43] drm/fbdev-dma: Implement damage handling and
 deferred I/O
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-22-tzimmermann@suse.de>
 <871q757b73.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <871q757b73.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2ECE737473
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Am 16.04.24 um 14:18 schrieb Javier Martinez Canillas:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
>> Add support for damage handling and deferred I/O to fbdev-dma. This
>> enables fbdev-dma to support all DMA-memory-based DRM drivers, even
>> such with a dirty callback in their framebuffers.
>>
>> The patch adds the code for deferred I/O and also sets a dedicated
>> helper for struct fb_ops.fb_mmap that support coherent mappings.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_fbdev_dma.c | 65 ++++++++++++++++++++++++++-------
>>   1 file changed, 51 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
>> index 6c9427bb4053b..8ffd072368bca 100644
>> --- a/drivers/gpu/drm/drm_fbdev_dma.c
>> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
>> @@ -4,6 +4,7 @@
>>   
>>   #include <drm/drm_crtc_helper.h>
>>   #include <drm/drm_drv.h>
>> +#include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_dma_helper.h>
>> @@ -35,6 +36,22 @@ static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
>>   	return 0;
>>   }
>>   
>> +FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_dma,
>> +				   drm_fb_helper_damage_range,
>> +				   drm_fb_helper_damage_area);
>> +
> Shouldn't this be FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() instead ?
>
> I know that right now the macros are the same but I believe that it was
> added it for a reason ?

Oh, thanks for noticing! I asked for that macro specifically for this 
reason. It went through the omap tree and hadn't arrived in 
drm-misc-next when I first made these patches. I'll update the patch 
accordingly.

>
>> +static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>> +{
>> +	struct drm_fb_helper *fb_helper = info->par;
>> +	struct drm_framebuffer *fb = fb_helper->fb;
>> +	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
>> +
>> +	if (!dma->map_noncoherent)
>> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> I noticed that some drivers do:
>
>                   vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>
> I see that vm_get_page_prot() is a per-architecture function, but I don't
> know about the implications of getting the pgprot_t from the vma->vm_flags
> set or just using the current vma->vm_page_prot value...

That's in interesting observation. The code in the patch adds a WC flag 
to the existing vm_page_prot. The code in your example first creates a 
new vm_page_prot from the vm_flags field. Fbdev drivers generally use 
the former approach. So where does the original vm_page_prot value come 
from? (I think that's also the question behind your comment.)

I've looked through the kernel's mmap code from the syscall [1] to the 
place where it invokes the mmap callback. [2] Shortly before doing so, 
mmap_region() set's vm_page_prot from vm_flags like in your example. [3] 
I would assume there's no reason for drivers to call vm_get_page_prot() 
by themselves. DRM drivers specially seem to have the habit of doing so.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.8/source/arch/x86/kernel/sys_x86_64.c#L86
[2] https://elixir.bootlin.com/linux/v6.8/source/mm/mmap.c#L2829
[3] https://elixir.bootlin.com/linux/v6.8/source/mm/mmap.c#L2824


>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

