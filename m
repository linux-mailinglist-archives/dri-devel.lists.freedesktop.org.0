Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOAnDE+ijWlh5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:50:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376612C054
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFEF10E712;
	Thu, 12 Feb 2026 09:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CRCnp2Uw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCB810E712
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770889802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7izo/A5Ul08EXM2WpJ9NM5vTC0yA5lFDEQbyiP4NFcY=;
 b=CRCnp2UwTvVzBCMIWlVfd4+IXB3P8x9g5GNV+WL6SeueerGzvkGLz/9sslIX0u5YeaN803
 sKQMHYZ0xP+8mYmMi9QzZiuuK+kdHxuJvRtzNCB17Mxuxbx368ETnNcsQoSemHHjQIxvzV
 V6yiKGl1XJ3E22Wg4gC8dP66IKjTO8M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-uPqlUl29NbKiSi4mA9cAGg-1; Thu, 12 Feb 2026 04:50:00 -0500
X-MC-Unique: uPqlUl29NbKiSi4mA9cAGg-1
X-Mimecast-MFC-AGG-ID: uPqlUl29NbKiSi4mA9cAGg_1770889800
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-483129eb5ccso38083295e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770889799; x=1771494599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7izo/A5Ul08EXM2WpJ9NM5vTC0yA5lFDEQbyiP4NFcY=;
 b=qIlu5Z827jO4D7OYgCL4iIp62PVRusACVo9I6u0Gdt7pZZYu5340sY1bsVsYbf+xNM
 +/zgBAqw1MUSHiwIYSrbHzoaOHYphc/17Uh31KXSHKNfcOYOwlAxqzSVZe2SRd7Hj4YU
 LGH/9H17I0F2XOCdEIi5WUT2XUAvkOTH90WLeI/m6FWHzKwbKIVLCdmQ5SV/93Knc4qQ
 YnvSZJ9NIq9LbWKzmNGEpbjP0c1fNQ+fo4uQ9T6iGjm5u0/6pAIHJWU9R+TNwztCNm+G
 3sn512k90dO2KHRYtMa5WlTB7xQe3koALBy+TofI889B7BtaTR3ojg1oRDqCh3PKfYM8
 VIRw==
X-Gm-Message-State: AOJu0Yy1Ud6WXDW4Zetk7eqmlpwH/Ex8gDfL2+XzqUkWq8ybWSBbalB2
 /xEqgrGk473O7nQc6O3CHQM/EnJx8AfGPMp3FL/JekcSNBh0UiLLgX102ZPL+jUJnfaxAwiST0A
 ZXgkNiW5XxPgZ6BQTUy323jcI+th/0YYIWqhg36X2Gym0obpxLZXQ/MOjsuipXWyk7aHw5Q==
X-Gm-Gg: AZuq6aIOUpSEgCAvWws2D+/uWdMWRitGEC0clKGcRHqAlr+3PysFAbRUUOMBifjUVpk
 pDbW8viiTVr9+U0ZYh1Kw2OI7Lu3wj9/TEFBwOIcglJrHP/lrD6HJ3tTUWSLAa/OHMP/LiMcIAj
 Eb79fh6v6hL5kwcgBC3FqdYfvW3sBmRkrym9ft5cdlZEQPu2JZxfP4a3FBVIJVG5j5NjNopUsNG
 3o8o1GpSjYTGZv3We4qlNOyR+PAGvXKl1s1D9i8I0q91UrqKCNJv1j4gMzX7uFXcqxbvzH00T1Y
 5gY+dmlVtJPImNGfdBzfXTIJcppDvmJnUO9adU7Whjj0UoUilsfdLfBweyzWPH+0Qi+XcNgosbm
 FfA8p3kb4ufhHD4ZzKtdCZJMNbdNgMv3bEDoyicfq1iFdJm9A13KslqvzC0z6Dw==
X-Received: by 2002:a05:600c:c08f:b0:483:6e32:50d4 with SMTP id
 5b1f17b1804b1-4836e3250ddmr2220445e9.18.1770889799508; 
 Thu, 12 Feb 2026 01:49:59 -0800 (PST)
X-Received: by 2002:a05:600c:c08f:b0:483:6e32:50d4 with SMTP id
 5b1f17b1804b1-4836e3250ddmr2220055e9.18.1770889799021; 
 Thu, 12 Feb 2026 01:49:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836aa0847asm29634535e9.3.2026.02.12.01.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:49:58 -0800 (PST)
Message-ID: <e9d35c78-1c4b-4a9c-8cf0-9531e972279f@redhat.com>
Date: Thu, 12 Feb 2026 10:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/hyperv: During panic do VMBus unload after frame
 buffer is flushed
To: mhklkml@zohomail.com, mhklinux@outlook.com, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, ryasuoka@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, stable@vger.kernel.org
References: <20260209070201.1492-1-mhklinux@outlook.com>
 <20260209070201.1492-2-mhklinux@outlook.com>
 <a5372b72-8dc0-4f2d-ad5c-086f3e75ee81@redhat.com>
 <002601dc9baa$517d8b40$f478a1c0$@zohomail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <002601dc9baa$517d8b40$f478a1c0$@zohomail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A4SKciGoEXMFd-1NM5QjnCZlRtNjRMBruxUwpRzb504_1770889800
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhklkml@zohomail.com,m:mhklinux@outlook.com,m:drawat.floss@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ryasuoka@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:stable@vger.kernel.org,m:drawatfloss@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[zohomail.com,outlook.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,microsoft.com,redhat.com];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,zohomail.com:email]
X-Rspamd-Queue-Id: 8376612C054
X-Rspamd-Action: no action

On 12/02/2026 00:01, mhklkml@zohomail.com wrote:
> From: Jocelyn Falempe <jfalempe@redhat.com> Sent: Wednesday, February 11, 2026 1:54 PM
>>
>> On 09/02/2026 08:02, mhkelley58@gmail.com wrote:
>>> From: Michael Kelley <mhklinux@outlook.com>
>>>
>>> In a VM, Linux panic information (reason for the panic, stack trace,
>>> etc.) may be written to a serial console and/or a virtual frame buffer
>>> for a graphics console. The latter may need to be flushed back to the
>>> host hypervisor for display.
>>>
>>> The current Hyper-V DRM driver for the frame buffer does the flushing
>>> *after* the VMBus connection has been unloaded, such that panic messages
>>> are not displayed on the graphics console. A user with a Hyper-V graphics
>>> console is left with just a hung empty screen after a panic. The enhanced
>>> control that DRM provides over the panic display in the graphics console
>>> is similarly non-functional.
>>>
>>> Commit 3671f3777758 ("drm/hyperv: Add support for drm_panic") added
>>> the Hyper-V DRM driver support to flush the virtual frame buffer. It
>>> provided necessary functionality but did not handle the sequencing
>>> problem with VMBus unload.
>>>
>>> Fix the full problem by using VMBus functions to suppress the VMBus
>>> unload that is normally done by the VMBus driver in the panic path. Then
>>> after the frame buffer has been flushed, do the VMBus unload so that a
>>> kdump kernel can start cleanly. As expected, CONFIG_DRM_PANIC must be
>>> selected for these changes to have effect. As a side benefit, the
>>> enhanced features of the DRM panic path are also functional.
>>
>> Thanks for properly fixing this issue with DRM Panic on hyperv.
>>
>> I've a small comment below.
>>
>> With that fixed:
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> The first patch looks good too, I can review it if no other step up, as
>> I'm not familiar with hyperv.
>>
>>>
>>> Fixes: 3671f3777758 ("drm/hyperv: Add support for drm_panic")
>>> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
>>> ---
>>>    drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  4 ++++
>>>    drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 15 ++++++++-------
>>>    2 files changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>>> index 06b5d96e6eaf..79e51643be67 100644
>>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>>> @@ -150,6 +150,9 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>>>    		goto err_free_mmio;
>>>    	}
>>>
>>> +	/* If DRM panic path is stubbed out VMBus code must do the unload */
>>> +	if (IS_ENABLED(CONFIG_DRM_PANIC) && IS_ENABLED(CONFIG_PRINTK))
>>
>> I think drm_panic should still work without printk.
>> The "user" panic screen would be unaffected, but the "kmsg" screen might
>> be blank, and the "qr_code" would generate an empty qr code.
>> (Actually I never tried to build a kernel without printk).
> 
> Yeah, I had never built such a kernel either until recently when the kernel
> test robot flagged an error in Hyper-V code when CONFIG_PRINTK is not set. :-)
> 
> But for this patch, the issue is that drm_panic() never gets called if CONFIG_PRINTK
> isn't set. In that case, kmsg_dump_register() is a stub that returns an error.  So
> drm_panic_register() never registers the callback to drm_panic(). And if
> drm_panic() isn't going to run, responsibility for doing the VMBus unload
> must remain with the VMBus code. It's hard to actually test this case because
> of depending on printk() for debugging output, so double-check my
> thinking.

Ok you're right. I changed from 
atomic_notifier_chain_register(&panic_notifier_list, ...) to 
kmsg_dump_register() in the v10 of drm_panic.

So I should either make DRM_PANIC depends on PRINTK, or call 
atomic_notifier_chain_register() if PRINTK is not defined.

As I think kernel without PRINTK are uncommon, I'll probably do the 
first solution.

-- 

Jocelyn
> 
> Michael
> 
>>
>>> +		vmbus_set_skip_unload(true);
>>>    	drm_client_setup(dev, NULL);
>>>
>>>    	return 0;
> 

