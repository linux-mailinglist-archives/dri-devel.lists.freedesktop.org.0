Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPyHEzCre2kAHwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:47:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C53B3B1B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858C410E8BC;
	Thu, 29 Jan 2026 18:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KTVPK7TN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9E10E8BC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 18:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769712426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4+j/1ESYhDBOc0/ySW5KbZLWXBWumy70U4Psq4VqS4=;
 b=KTVPK7TNtRq9K4TTsG5ea+L44bHI2xSfpOUTypJ39vWG+bHj5FSGN/bqsSBgpjIJwu3Rtf
 wZ8wnTW2rHIZjzDzCatmrH59BvMrpcl8w1xFunSJgNQdelFe7qyafKpKXfZkeus0WWtsCs
 O3qenWe8gExYWhhS4BS4FgiJG+MxF98=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-t-g3xEzyMRCIXvdbMWrMAw-1; Thu, 29 Jan 2026 13:47:04 -0500
X-MC-Unique: t-g3xEzyMRCIXvdbMWrMAw-1
X-Mimecast-MFC-AGG-ID: t-g3xEzyMRCIXvdbMWrMAw_1769712424
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4803a72daaeso10492145e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769712423; x=1770317223;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h4+j/1ESYhDBOc0/ySW5KbZLWXBWumy70U4Psq4VqS4=;
 b=Txci0Yu73rS7n00mrII53KCevwkalr9PpGxN7V0wtZvaF/KF2b/vqsHbpTwsg3hNzQ
 9Es2Vi0QC3q7d1zywgU9a0b4IiCGwfrs2bo84mfgqwfoM3XDXZ1RhZJzW2rPoQrrqjXr
 qMGyDyDITlvJzLZD95Kq8YAFTCjA4rkzdqOoXS/roZBh3KDnyOwu6NsO2i6o13Gr27r6
 eQAJr5LKHp9HpjhKrzHKmR62NlkstZK/ITxASKkC52HJ3AZxcJM/Q/D1/lMz9xidAnD2
 +u3NbDagT7FgNvm4zoL4a3Ua+rJNNrE5JEZl+RCCPSlsNmjAmqclfjmA1STRe60aU4an
 u8Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX184l9z67Tn70xUQC/1ge7Y9rt5rpW10Z9XHJ9Dn+69DSrv4Qpol1nF6yiTqxBI5YQidZp6zXGV/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv6JKVQEeBlUSC/IgbB8fPi330seNLiIdCufkobWHyPiXCUpf6
 +UWXzCOy6mPYjrX0CgpHmUEg/1588OmDqUQNNYqrFRMgcgrzRmfbAeibGqaGexCBrWTehAbunHJ
 MrHANKUn7OUcsnGIeL8S9if0+e9yqPmioPYCuJ0r1GxUFSQ07sfOdy5rIieAXH5zqcE+A/g==
X-Gm-Gg: AZuq6aJES3NA/PHSnysEKaTorj5sQGKZjS//iUK9EYohU00IT1ob6iLs1Q7ZLMiu5a0
 51c6Cm8JO9+0pN+g1UI6FTRzUru2dJh1RMGCISCsdG+nDwgb419gBqEAZF9x9vPEa1L6P1AruVT
 K2Hc6mr3GebncvNvOHiOOyakofB5eYZFL6eimcd3pNx+a4waCIggxt+cRF0Qthk7Va6VMTqLKwe
 2hZojVRNb0xfoXqfIsEopuFoiJIRBCfpOUDSLnOFL5u+fZbkeNDkb8KyvIkQt7HmN52wUWsJ1I4
 j5gY7nYsuYPC902pnikmgdc3KbATXoXKBEy4/U9NrfTYCuDfQXvkyn6WKr/x0b6ZCO3FxKoqHRQ
 IS41zCqM71ZB7yPT6+Nb+DnUP73U1M9MEZNm2H7WhwcboX+y1Ug==
X-Received: by 2002:a05:600c:1e24:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-482db44866fmr2367665e9.5.1769712423604; 
 Thu, 29 Jan 2026 10:47:03 -0800 (PST)
X-Received: by 2002:a05:600c:1e24:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-482db44866fmr2367295e9.5.1769712423207; 
 Thu, 29 Jan 2026 10:47:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5e1842asm2907485e9.16.2026.01.29.10.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 10:47:02 -0800 (PST)
Message-ID: <27af79a8-ee84-4845-a737-82d3883536e7@redhat.com>
Date: Thu, 29 Jan 2026 19:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
To: Jacob Keller <jacob.e.keller@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
 <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
 <88f33e4e-5d0e-4520-a399-5be2901a3281@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <88f33e4e-5d0e-4520-a399-5be2901a3281@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wopbWmCuadLLthHs6dMyv5FeI0HZKiHjo3iV7b3KmNI_1769712424
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacob.e.keller@intel.com,m:tzimmermann@suse.de,m:airlied@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A9C53B3B1B
X-Rspamd-Action: no action

On 29/01/2026 18:35, Jacob Keller wrote:
> On 1/29/2026 12:15 AM, Thomas Zimmermann wrote:
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/ 
>>> mgag200/mgag200_bmc.c
>>> index a689c71ff165..599b710bab9b 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> @@ -1,6 +1,7 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   #include <linux/delay.h>
>>> +#include <linux/iopoll.h>
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_edid.h>
>>> @@ -12,7 +13,7 @@
>>>   void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>>>   {
>>>       u8 tmp;
>>> -    int iter_max;
>>> +    int ret;
>>>       /*
>>>        * 1 - The first step is to inform the BMC of an upcoming mode
>>> @@ -44,28 +45,20 @@ void mgag200_bmc_stop_scanout(struct mga_device 
>>> *mdev)
>>>        * 3a- The third step is to verify if there is an active scan.
>>>        * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
>>>        */
>>
>> Either these comments or the original test seems incorrect.
>>
>> The test below is supposed to detect whether the BMC is scanning out 
>> from the framebuffer. While it reads a horizontal scanline the bit 
>> should be 0. That's what the test is for, but it gets the condition 
>> wrong.
>>
>>> -    iter_max = 300;
>>> -    while (!(tmp & 0x1) && iter_max) {
>>> -        WREG8(DAC_INDEX, MGA1064_SPAREREG);
>>> -        tmp = RREG8(DAC_DATA);
>>> -        udelay(1000);
>>> -        iter_max--;
>>> -    }
>>> +    ret = read_poll_timeout(RREG_DAC, tmp, !(tmp & 0x1),
>>> +                1000, 300000, false,
>>> +                MGA1064_SPAREREG);
>>
>> The original while loop ran as long as "!(tmp & 0x1)".  And now the 
>> test stops if "!(tmp & 0x1)" AFAICT.  This (accidentally?) fixes the 
>> test and makes the comment correct.
>>
>>
>>> +    if (ret == -ETIMEDOUT)
>>> +        return;
>>>       /*
>>>        * 3b- This step occurs only if the remove is actually
>>
>> Since you're at it, maybe fix this comment to say
>>
>> '... only if the remote BMC is ...'
>>
>>>        * scanning. We are waiting for the end of the frame which is
>>>        * a 1 on remvsyncsts (XSPAREREG<1>)
>>>        */
>>> -    if (iter_max) {
>>> -        iter_max = 300;
>>> -        while ((tmp & 0x2) && iter_max) {
>>> -            WREG8(DAC_INDEX, MGA1064_SPAREREG);
>>> -            tmp = RREG8(DAC_DATA);
>>> -            udelay(1000);
>>> -            iter_max--;
>>> -        }
>>> -    }
>>> +    (void)read_poll_timeout(RREG_DAC, tmp, (tmp & 0x2),
>>> +                1000, 300000, false,
>>> +                MGA1064_SPAREREG);
>>
>> Again, the comment and original code disagree and the original test 
>> condition appears to be inverted. It whats to test of the BMC has 
>> finished scanning out the final frame. The bit should turn 1. Instead 
>> it tests if the bit is already 1, which is likely true. Hence that's 
>> probably where your 300 msec delays comes from.
>>
>> Best regards
>> Thomas
>>
> @Dave or @Jocelyn, any chance one of you could help me figure out 
> whether Thomas is correct here? It does seem likely that the conditions 
> were originally inverted and thus forcing a wait for 300msec every time 
> regardless. That does match my experience... But I don't have (and web 
> searches failed to find) any relevant datasheets...

I will give it a try tomorrow, on my test machine, and check what this 
register value is in this case.
Regarding documentation, I've only seen the original documentation for 
the Matrox AGP card from 1999, but I never seen one with the BMC registers.

 From what I understand this code is only there to wait enough time. As
mgag200_bmc_stop_scanout() is only called on hotplug, we could even 
replace that part with a msleep(300);

-- 

Jocelyn

> 
> I guess I can switch the conditions back such that we match the original 
> code and sleep.. but it does seem likely that we really don't need to 
> wait for the 300msec, but actually just that the scanout is done and the 
> conditions were wrong..
> 
> Obviously we need a v2 with either the conditions matched to the 
> original code or I'll need to re-write the commit message.
> 
> Thanks,
> Jake
> 

