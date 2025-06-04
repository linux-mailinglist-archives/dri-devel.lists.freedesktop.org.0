Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621A8ACD961
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844DA10E7A0;
	Wed,  4 Jun 2025 08:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QhfMbTe3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hsNOwS8i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QhfMbTe3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hsNOwS8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967CE10E798
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:12:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7986D2020C;
 Wed,  4 Jun 2025 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749024766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GehkjeXbUaVabMARjI8MzX+XYRRUc1ZTqrpmk77LOr8=;
 b=QhfMbTe30Rwek73ksQG2t0gY1NtsBG8m+qkcNnNTfWvX8whcx8B3oyxMCH5ZL59fkJGPBk
 ucBf8lyjTJj1FewA1QiLLMUppdRpocTtP3CiBBpwKHVqG3VrORPqJHjIfNytF0rnpVpqPE
 v/x/IMMxjzyiRSl7DrEI0pp0FIhaJeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749024766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GehkjeXbUaVabMARjI8MzX+XYRRUc1ZTqrpmk77LOr8=;
 b=hsNOwS8iLZwX6U7w8jV8ZtZg89TtoXPhFlxG+oQabjN/05IplQmo/iOjgfAClBbtKnIAgX
 q/MdGtILqg9SsJCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749024766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GehkjeXbUaVabMARjI8MzX+XYRRUc1ZTqrpmk77LOr8=;
 b=QhfMbTe30Rwek73ksQG2t0gY1NtsBG8m+qkcNnNTfWvX8whcx8B3oyxMCH5ZL59fkJGPBk
 ucBf8lyjTJj1FewA1QiLLMUppdRpocTtP3CiBBpwKHVqG3VrORPqJHjIfNytF0rnpVpqPE
 v/x/IMMxjzyiRSl7DrEI0pp0FIhaJeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749024766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GehkjeXbUaVabMARjI8MzX+XYRRUc1ZTqrpmk77LOr8=;
 b=hsNOwS8iLZwX6U7w8jV8ZtZg89TtoXPhFlxG+oQabjN/05IplQmo/iOjgfAClBbtKnIAgX
 q/MdGtILqg9SsJCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1652E13A63;
 Wed,  4 Jun 2025 08:12:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qthLBP7/P2hhdgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jun 2025 08:12:46 +0000
Message-ID: <9a93813c-4d7c-45ef-b5a2-0ad37e7a078a@suse.de>
Date: Wed, 4 Jun 2025 10:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
To: Michael Kelley <mhklinux@outlook.com>,
 David Hildenbrand <david@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "deller@gmx.de" <deller@gmx.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "weh@microsoft.com" <weh@microsoft.com>, "hch@lst.de" <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c0b91a50-d3e7-44f9-b9c5-9c3b29639428@suse.de>
 <SN6PR02MB4157871127ED95AD24EDF96DD46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
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
In-Reply-To: <SN6PR02MB4157871127ED95AD24EDF96DD46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.19)[-0.950]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de,outlook.com];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[outlook.com,redhat.com,ffwll.ch,gmx.de,microsoft.com,kernel.org,linux-foundation.org];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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

Am 03.06.25 um 19:50 schrieb Michael Kelley:
> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Monday, June 2, 2025 11:25 PM
>> Hi
>>
>> Am 03.06.25 um 03:49 schrieb Michael Kelley:
>> [...]
>>>> Will the VMA have VM_PFNMAP or VM_MIXEDMAP set? PFN_SPECIAL is a
>>>> horrible hack.
>>>>
>>>> In another thread, you mention that you use PFN_SPECIAL to bypass the
>>>> check in vm_mixed_ok(), so VM_MIXEDMAP is likely not set?
>>> The VMA has VM_PFNMAP set, not VM_MIXEDMAP.  It seemed like
>>> VM_MIXEDMAP is somewhat of a superset of VM_PFNMAP, but maybe that's
>>> a wrong impression. vm_mixed_ok() does a thorough job of validating the
>>> use of __vm_insert_mixed(), and since what I did was allowed, I thought
>>> perhaps it was OK. Your feedback has set me straight, and that's what I
>>> needed. :-)
>>>
>>> But the whole approach is moot with Alistair Popple's patch set that
>>> eliminates pfn_t. Is there an existing mm API that will do mkwrite on a
>>> special PTE in a VM_PFNMAP VMA? I didn't see one, but maybe I missed
>>> it. If there's not one, I'll take a crack at adding it in the next version of my
>>> patch set.
>> What is the motivation behind this work? The driver or fbdev as a whole
>> does not have much of a future anyway.
>>
>> I'd like to suggest removing hyperv_fb entirely in favor of hypervdrm?
>>
> Yes, I think that's the longer term direction. A couple months ago I had an
> email conversation with Saurabh Sengar from the Microsoft Linux team where
> he raised this idea. I think the Microsoft folks will need to drive the deprecation
> process, as they need to coordinate with the distro vendors who publish
> images for running on local Hyper-V and in the Azure cloud. And my
> understanding is that the Linux kernel process would want the driver to
> be available but marked "deprecated" for a year or so before it actually
> goes away.

We (DRM upstream) recently considered moving some fbdev drivers to 
drivers/staging or marking them with !DRM if a DRM driver is available. 
Hyverv_fb would be a candidate.

At least at SUSE, we ship hypervdrm instead of hyperv_fb. This works 
well on the various generations of the hyperv system. Much of our 
userspace would not be able to use hyperv_fb anyway.

>
> I do have some concerns about the maturity of the hyperv_drm driver
> "around the edges". For example, somebody just recently submitted a
> patch to flush output on panic. I have less familiarity hyperv_drm vs.
> hyperv_fb, so some of my concern is probably due to that. We might
> need to do review of hyperv_drm and see if there's anything else to
> deal with before hyperv_fb goes away.

The panic output is a feature that we recently added to the kernel. It 
allows a DRM driver to display a final error message in the case of a 
kernel panic (think of blue screens on Windows). Drivers require a 
minimum of support to make it work. That's what the hypervdrm patches 
were about.

Best regards
Thomas

>
> This all got started when I was looking at a problem with hyperv_fb,
> and I found several other related problems, some of which also existed
> in hyperv_drm. You've seen several small'ish fixes from me and Saurabh
> as a result, and this issue with mmap()'ing /dev/fb0 is the last one of that
> set. This fix is definitely a bit bigger, but it's the right fix. On the flip side,
> if we really get on a path to deprecate hyperv_fb, there are hack fixes for
> the mmap problem that are smaller and contained to hyperv_fb. I would
> be OK with a hack fix in that case.
>
> Michael

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

