Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D0ACEB4B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 09:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F093210E855;
	Thu,  5 Jun 2025 07:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YP7M7FMa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+eB6TNeq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YP7M7FMa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+eB6TNeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3325810E9B7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 07:55:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ABFDD34684;
 Thu,  5 Jun 2025 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749110151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRd1tEzrVLQHewuIHSVriPCfBV3nNE1DWbs6tm2ALa8=;
 b=YP7M7FMa74q59tNGP33U+XFVji+IEYwZmnMR6xahitF1Vndpw/jc2T3fWYWl8S027eW+3p
 UYOOL0IRbGlqtzyh0OxRqtTsLkmNHb8ubYANvFBvaWCFVWvUoFq9GQmLEtzM2RVSHV9YlV
 E2He5tgYvn14cR0IzwwTj/Rbszcqa+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749110151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRd1tEzrVLQHewuIHSVriPCfBV3nNE1DWbs6tm2ALa8=;
 b=+eB6TNeqZt1/hkbo2PiIRhFrk3iql/AqJneqJ7lA4JvUiytR9pVHgaWVMX6uxomtf8b1ib
 E2ZGRmXiSM2yxQDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YP7M7FMa;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+eB6TNeq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749110151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRd1tEzrVLQHewuIHSVriPCfBV3nNE1DWbs6tm2ALa8=;
 b=YP7M7FMa74q59tNGP33U+XFVji+IEYwZmnMR6xahitF1Vndpw/jc2T3fWYWl8S027eW+3p
 UYOOL0IRbGlqtzyh0OxRqtTsLkmNHb8ubYANvFBvaWCFVWvUoFq9GQmLEtzM2RVSHV9YlV
 E2He5tgYvn14cR0IzwwTj/Rbszcqa+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749110151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRd1tEzrVLQHewuIHSVriPCfBV3nNE1DWbs6tm2ALa8=;
 b=+eB6TNeqZt1/hkbo2PiIRhFrk3iql/AqJneqJ7lA4JvUiytR9pVHgaWVMX6uxomtf8b1ib
 E2ZGRmXiSM2yxQDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43E681373E;
 Thu,  5 Jun 2025 07:55:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t3UmD4dNQWgYNwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 07:55:51 +0000
Message-ID: <d7a426b2-a66d-4d65-a9d5-c967b850dad6@suse.de>
Date: Thu, 5 Jun 2025 09:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
To: Michael Kelley <mhklinux@outlook.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: David Hildenbrand <david@redhat.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "deller@gmx.de" <deller@gmx.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "weh@microsoft.com" <weh@microsoft.com>, "hch@lst.de" <hch@lst.de>,
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
 <9a93813c-4d7c-45ef-b5a2-0ad37e7a078a@suse.de>
 <aEBcCjMWZJgbsRas@phenom.ffwll.local>
 <SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com>
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
In-Reply-To: <SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[17];
 FREEMAIL_TO(0.00)[outlook.com,ffwll.ch]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de,outlook.com];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ffwll.ch,gmx.de,microsoft.com,kernel.org,linux-foundation.org,lst.de,lists.freedesktop.org,vger.kernel.org,kvack.org];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: ABFDD34684
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 04.06.25 um 23:43 schrieb Michael Kelley:
> From: Simona Vetter <simona.vetter@ffwll.ch> Sent: Wednesday, June 4, 2025 7:46 AM
>> On Wed, Jun 04, 2025 at 10:12:45AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 03.06.25 um 19:50 schrieb Michael Kelley:
>>>> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Monday, June 2, 2025 11:25 PM
>>>>> Hi
>>>>>
>>>>> Am 03.06.25 um 03:49 schrieb Michael Kelley:
>>>>> [...]
>>>>> What is the motivation behind this work? The driver or fbdev as a whole
>>>>> does not have much of a future anyway.
>>>>>
>>>>> I'd like to suggest removing hyperv_fb entirely in favor of hypervdrm?
>>>>>
>>>> Yes, I think that's the longer term direction. A couple months ago I had an
>>>> email conversation with Saurabh Sengar from the Microsoft Linux team where
>>>> he raised this idea. I think the Microsoft folks will need to drive the deprecation
>>>> process, as they need to coordinate with the distro vendors who publish
>>>> images for running on local Hyper-V and in the Azure cloud. And my
>>>> understanding is that the Linux kernel process would want the driver to
>>>> be available but marked "deprecated" for a year or so before it actually
>>>> goes away.
>>> We (DRM upstream) recently considered moving some fbdev drivers to
>>> drivers/staging or marking them with !DRM if a DRM driver is available.
>>> Hyverv_fb would be a candidate.
>>>
>>> At least at SUSE, we ship hypervdrm instead of hyperv_fb. This works well on
>>> the various generations of the hyperv system. Much of our userspace would
>>> not be able to use hyperv_fb anyway.
> Good to know.  Red Hat has made the switch as well. The Ubuntu images
> in Azure have both hyperv_fb and hyperv_drm. I don't know what other
> distros have done.
>
>> Yeah investing into fbdev drivers, especially when some mm surgery seems
>> needed, does not sound like a good idea to me overall.
>>
>>>> I do have some concerns about the maturity of the hyperv_drm driver
>>>> "around the edges". For example, somebody just recently submitted a
>>>> patch to flush output on panic. I have less familiarity hyperv_drm vs.
>>>> hyperv_fb, so some of my concern is probably due to that. We might
>>>> need to do review of hyperv_drm and see if there's anything else to
>>>> deal with before hyperv_fb goes away.
>>> The panic output is a feature that we recently added to the kernel. It
>>> allows a DRM driver to display a final error message in the case of a kernel
>>> panic (think of blue screens on Windows). Drivers require a minimum of
>>> support to make it work. That's what the hypervdrm patches were about.
>> I'm also happy to help with any other issues and shortfalls of drm vs
>> fbdev. There are some, but I thought it was mostly around some of the low
>> bit color formats that really old devices want, and not anything that
>> hyperv would need.
> You've set me up perfectly to raise an issue. :-)  I'm still relatively new
> to the hyperv_drm driver and DRM in general, compared with hyperv_fb.
> One capability in fbdev is deferred I/O, which is what this entire patch
> series is about. The hyperv_drm driver doesn't currently use anything
> similar to deferred I/O like hyperv_fb. I don't know if that's because
> hyperv_drm doesn't make use of what DRM has to offer, or if DRM doesn't
> have a deferred I/O framework like fbdev. Do you know what the situation
> is? Or could you point me to an example of doing deferred I/O with DRM
> that hyperv_drm should be following?

Fbdev deferred I/O is a workaround for the fact that fbdev does not 
require a flush operation on its I/O buffers. Writing to an mmaped 
buffer is expected to go to hardware immediately. On devices where this 
is not the case, deferred I/O tracks written pages and writes them back 
to hardware at intervals.

For DRM, there's the MODE_DIRTYFB ioctl [1] that all userspace has to 
call after writing to mmap'ed buffers. So regular DRM doesn't need 
deferred I/O as userspace triggers writeback explicitly.

[1] 
https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_ioctl.c#L686

>
> I ran a quick performance test comparing hyperv_drm with hyperv_fb.
> The test does "cat" of a big text file in the Hyper-V graphics console. The
> file has 1024 * 1024 lines, each with 64 characters, so total file size is
> 64 MiB.
>
> With hyperv_fb the test completes in 24 seconds elapsed time, with
> 24 seconds of system CPU time. With hyperv_drm, it takes 34 seconds
> elapsed time, but with about the same 24 seconds of system CPU time.
> Overall this difference isn't huge, and probably isn't that noticeable
> when doing human-scale work (i.e., 'dmesg' outputting several
> hundred lines in 0.19 seconds vs. my test doing 1M lines) on the Hyper-V
> graphics console. To me, the console doesn't feel slow with hyperv_drm
> compared to hyperv_fb, which is good.

DRM consoles are technically an fbdev device that operates on a DRM 
device. Both, DRM and fbdev, have some differences that can make this 
problematic. I'm not surprised that there are issues.

>
> Nonetheless, there's an underlying issue. A main cause of the difference
> is the number of messages to Hyper-V to update dirty regions. With
> hyperv_fb using deferred I/O, the messages are limited 20/second, so
> the total number of messages to Hyper-V is about 480. But hyperv_drm
> appears to send 3 messages to Hyper-V for each line of output, or a total of
> about 3,000,000 messages (~90K/second). That's a lot of additional load
> on the Hyper-V host, and it adds the 10 seconds of additional elapsed
> time seen in the guest. There also this ugly output in dmesg because the
> ring buffer for sending messages to the Hyper-V host gets full -- Hyper-V
> doesn't always keep up, at least not on my local laptop where I'm
> testing:
>
> [12574.327615] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
> [12574.327684] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
> [12574.327760] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
> [12574.327841] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
> [12597.016128] hyperv_sendpacket: 6211 callbacks suppressed
> [12597.016133] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
> [12597.016172] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
> [12597.016220] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
> [12597.016267] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] *ERROR* Unable to send packet via vmbus; error -11
>
> hyperv_drm could be fixed to not output the ugly messages, but there's
> still the underlying issue of overrunning the ring buffer, and excessively
> hammering on the host. If we could get hyperv_drm doing deferred I/O, I
> would feel much better about going full-on with deprecating hyperv_fb.

Thanks for debugging this. A number of things are playing into this.

- DRM performs display output along vblank IRQs. For example, if the 
display runs with 60 Hz there should be no more than 60 display updates 
per second. From what I can tell, there's no IRQ support in hypervdrm 
(or HyperV in general?). Without IRQ support, drivers output to hardware 
ASAP, which can result in large numbers of buffer updates per second. 
I've heard about this problem in other context [2] and you're likely 
seeing a similar issue.

- DRM's console also needs better support for vblank interrupts. It 
currently sends out updates ASAP as well.

Both points are not much of a problem on most desktop and server 
systems, but can be an be an issue with virtualization.

[2] https://bugzilla.suse.com/show_bug.cgi?id=1189174

Best regards
Thomas

>
> Michael
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

