Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBDADFDFE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 08:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7510E9BA;
	Thu, 19 Jun 2025 06:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="V1e8QzEW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rhBPxMmZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G2ofXcsG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I9Ga88zD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6020B10E9BA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 06:50:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D456B1F38D;
 Thu, 19 Jun 2025 06:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750315854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MY6q/zfwGyNIsBmdF0wz7m322Ngb7VousKzr0NDJHV0=;
 b=V1e8QzEWQY43q/vXGNk0uXX+Xds/2l4sM2kR//9gXPYN4O72+ao7mEW08rg6nbID7iPGW5
 GSECOStoJabiV3v22iu012FNSvrsGGTromc/WNTy9m6lWR94u9W3VkF+P+l/s3+9qFlOzJ
 35OsMOOwR1VwsB4GXnOsRXkvePX7/W0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750315854;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MY6q/zfwGyNIsBmdF0wz7m322Ngb7VousKzr0NDJHV0=;
 b=rhBPxMmZOcVfmrCU0Eb7K7mSrfpDTMgubcCaEId5KadM5X0HgijC+DVDpefxnNb7Qeotdi
 6pFr95/UJjfDwgBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G2ofXcsG;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I9Ga88zD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750315852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MY6q/zfwGyNIsBmdF0wz7m322Ngb7VousKzr0NDJHV0=;
 b=G2ofXcsG8EpKAtGMlQOXFVDxLk20aBGDO617SThmTfGyUsdsvTju6b9qiqB3CEQbiHw5Bi
 cIWJFZPwDeyGYuzYa99rKOBisftDvyEM9Sg2ITyG5J9GDSxhmTWIeWiPIpN41WfBZq/1GJ
 iLM4/IDKAl+htxfW2Nbp0spP3pcLm9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750315852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MY6q/zfwGyNIsBmdF0wz7m322Ngb7VousKzr0NDJHV0=;
 b=I9Ga88zDPzzIrKlhwRpOtF1VnCUdrmiJ7hUV7NnvLXcaKTqz3LLBe6sBqmyFx4F0ug0ZSI
 0Bz2lPnvH9LeF0Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BF5613721;
 Thu, 19 Jun 2025 06:50:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WAJpDUyzU2jdFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Jun 2025 06:50:52 +0000
Message-ID: <7daa3cf2-356b-4320-94bb-7f039b841fb7@suse.de>
Date: Thu, 19 Jun 2025 08:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] vgaarb: Look at all PCI display devices in VGA
 arbiter
To: Mario Limonciello <superm1@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-7-superm1@kernel.org>
 <20250617132228.434adebf.alex.williamson@redhat.com>
 <08257531-c8e4-47b1-a5d1-1e67378ff129@kernel.org>
 <4b4224b8-aa91-4f21-8425-2adf9a2b3d38@suse.de>
 <aFLJTSIPVE0EnNvh@phenom.ffwll.local>
 <8ee5d492-4777-4dc7-a001-0bdbb3bff2a4@kernel.org>
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
In-Reply-To: <8ee5d492-4777-4dc7-a001-0bdbb3bff2a4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D456B1F38D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,redhat.com,gmail.com,google.com,amd.com,ffwll.ch,wunner.de,linux.intel.com,infradead.org,8bytes.org,arm.com,perex.cz,suse.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,nvidia.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[25]; MIME_TRACE(0.00)[0:+];
 TO_DN_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email, gitlab.freedesktop.org:url,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:dkim, suse.de:email]
X-Spam-Score: -4.51
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

Am 18.06.25 um 20:45 schrieb Mario Limonciello:
> On 6/18/2025 9:12 AM, Simona Vetter wrote:
>> On Wed, Jun 18, 2025 at 11:11:26AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 17.06.25 um 22:22 schrieb Mario Limonciello:
>>>>
>>>>
>>>> On 6/17/25 2:22 PM, Alex Williamson wrote:
>>>>> On Tue, 17 Jun 2025 12:59:10 -0500
>>>>> Mario Limonciello <superm1@kernel.org> wrote:
>>>>>
>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>
>>>>>> On a mobile system with an AMD integrated GPU + NVIDIA discrete 
>>>>>> GPU the
>>>>>> AMD GPU is not being selected by some desktop environments for any
>>>>>> rendering tasks. This is because neither GPU is being treated as
>>>>>> "boot_vga" but that is what some environments use to select a GPU 
>>>>>> [1].
>>>>>>
>>>>>> The VGA arbiter driver only looks at devices that report as PCI 
>>>>>> display
>>>>>> VGA class devices. Neither GPU on the system is a PCI display VGA 
>>>>>> class
>>>>>> device:
>>>>>>
>>>>>> c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
>>>>>> c6:00.0 Display controller: Advanced Micro Devices, Inc.
>>>>>> [AMD/ATI] Device 150e (rev d1)
>>>>>>
>>>>>> If the GPUs were looked at the vga_is_firmware_default()
>>>>>> function actually
>>>>>> does do a good job at recognizing the case from the device used 
>>>>>> for the
>>>>>> firmware framebuffer.
>>>>>>
>>>>>> Modify the VGA arbiter code and matching sysfs file entries to
>>>>>> examine all
>>>>>> PCI display class devices. The existing logic stays the same.
>>>>>>
>>>>>> This will cause all GPUs to gain a `boot_vga` file, but the
>>>>>> correct device
>>>>>> (AMD GPU in this case) will now show `1` and the incorrect
>>>>>> device shows `0`.
>>>>>> Userspace then picks the right device as well.
>>>>>>
>>>>>> Link: 
>>>>>> https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12
>>>>>> [1]
>>>>>> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> ---
>>>>>>    drivers/pci/pci-sysfs.c | 2 +-
>>>>>>    drivers/pci/vgaarb.c    | 8 ++++----
>>>>>>    2 files changed, 5 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>>>>>> index 268c69daa4d57..c314ee1b3f9ac 100644
>>>>>> --- a/drivers/pci/pci-sysfs.c
>>>>>> +++ b/drivers/pci/pci-sysfs.c
>>>>>> @@ -1707,7 +1707,7 @@ static umode_t
>>>>>> pci_dev_attrs_are_visible(struct kobject *kobj,
>>>>>>        struct device *dev = kobj_to_dev(kobj);
>>>>>>        struct pci_dev *pdev = to_pci_dev(dev);
>>>>>>    -    if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
>>>>>> +    if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
>>>>>>            return a->mode;
>>>>>>          return 0;
>>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>>> index 78748e8d2dbae..63216e5787d73 100644
>>>>>> --- a/drivers/pci/vgaarb.c
>>>>>> +++ b/drivers/pci/vgaarb.c
>>>>>> @@ -1499,8 +1499,8 @@ static int pci_notify(struct
>>>>>> notifier_block *nb, unsigned long action,
>>>>>>          vgaarb_dbg(dev, "%s\n", __func__);
>>>>>>    -    /* Only deal with VGA class devices */
>>>>>> -    if (!pci_is_vga(pdev))
>>>>>> +    /* Only deal with PCI display class devices */
>>>>>> +    if (!pci_is_display(pdev))
>>>>>>            return 0;
>>>>>>          /*
>>>>>> @@ -1546,12 +1546,12 @@ static int __init vga_arb_device_init(void)
>>>>>>          bus_register_notifier(&pci_bus_type, &pci_notifier);
>>>>>>    -    /* Add all VGA class PCI devices by default */
>>>>>> +    /* Add all PCI display class devices by default */
>>>>>>        pdev = NULL;
>>>>>>        while ((pdev =
>>>>>>            pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>>>>>>                       PCI_ANY_ID, pdev)) != NULL) {
>>>>>> -        if (pci_is_vga(pdev))
>>>>>> +        if (pci_is_display(pdev))
>>>>>>                vga_arbiter_add_pci_device(pdev);
>>>>>>        }
>>>>>
>>>>> At the very least a non-VGA device should not mark that it decodes
>>>>> legacy resources, marking the boot VGA device is only a part of what
>>>>> the VGA arbiter does.  It seems none of the actual VGA arbitration
>>>>> interfaces have been considered here though.
>>>>>
>>>>> I still think this is a bad idea and I'm not sure Thomas didn't
>>>>> withdraw his ack in the previous round[1].  Thanks,
>>>>
>>>> Ah; I didn't realize that was intended to be a withdrawl.
>>>> If there's another version of this I'll remove it.
>>>
>>> Then let me formally withdraw the A-b.
>>>
>>> I think this updated patch doesn't address the concerns raised in the
>>> previous reviews. AFAIU vgaarb is really only about VGA devices.
>>
>> I missed the earlier version, but wanted to chime in that I concur. 
>> vgaarb
>> is about vga decoding, and modern gpu drivers are trying pretty hard to
>> disable that since it can cause pain. If we mix in the meaning of 
>> "default
>> display device" into this, we have a mess.
>>
>> I guess what does make sense is if the kernel exposes its notion of
>> "default display device", since we do have that in some sense with
>> simpledrm. At least on systems where simpledrm is a thing, but I 
>> think you
>> need some really old machines for that to not be the case.
>>
>> Cheers, Sima
>
> Thanks guys.  Let's discard patch 6.  Here's a spin of an approach for 
> userspace that does something similar to what the compositors are doing.
> We can iterate on that.
>
> https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/38

Did you look at my suggestion to extend the kernel's 
video_is_primary_device()? This would also benefit fbcon. It is 
architecture specific and currently uses vgaarb on x86. I think it could 
be extended with the current patch's logic.

Best regards
Thomas

>
> I think patches 1-5 still are valuable though.  So please add reviews 
> to those and we can take those without patch 6 if there is agreement.

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

