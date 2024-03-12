Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC3879606
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 15:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBE1112400;
	Tue, 12 Mar 2024 14:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hM8z751l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81C9112400
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710253512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHTAr71y7pGMMfB6Zkn8DP5pBzVAx1tYjAwh1VoMvMk=;
 b=hM8z751lMe9gFwNa1CQW92xAHFd8ArkmI6Q9Jyp7e53uGjBmiAieDQUeLpLfO4ECK3vPd+
 J0QyOHDi91NpYvwlDxUIKpJr/F8vthbqQgqmuE0CtStwxeNexPQEvXTHRMQf4kThEcd2uG
 j3G9iF2+P+MWuRMzrDZjMhBB4pR7Ph8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-Dv8TqEW5NdWO_bCI0NJ3Lg-1; Tue, 12 Mar 2024 10:25:11 -0400
X-MC-Unique: Dv8TqEW5NdWO_bCI0NJ3Lg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e435a606aso33420565e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 07:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710253510; x=1710858310;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mHTAr71y7pGMMfB6Zkn8DP5pBzVAx1tYjAwh1VoMvMk=;
 b=HBIIIuRtzcwTXiTFSAXJVM3VwJSRPp/Dt1LXBi/GkbGtrVwNbhvRDrX6gKs/isrpJs
 wwXGYwSscxFcRHVQcGgGpWWfqKNKgRoNlvdTRVtzIHSmUrWpvdFPCLtJCmdaP/fkDW8a
 X55pSyM4cyfrKblkHqvpgNQAlDd8OwYCKynaFd5khuvNfRUzKAgqrthQjfyx+qjwQKzl
 VLs752/ShwBPZa6mD5kID4xA1zUhOgo53Snm0ktb3sN772PejINsYaoSqrvNG1Yqyv+h
 xfSgX75vU3Av7NneUiGF/ga2vE4CdmQS5RtjstzLkW2HXsDW8LzpvcNULDlkr35VUWJP
 rVQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVakElMD3DjQkXHc7AvcxwgMSznNBEiFEFotNq2Al98piOTS9Hi0/uHFM9jKG9RV9Lbvnb2Uf11ORloyGznNyh1NgJA6jlmb3pJrHWUO5uh
X-Gm-Message-State: AOJu0YwGXpbpYiFzYNxJs/zs4PHtTZPHBjONj+zlg3XW7CTp7ghr+4QJ
 4LaInRNA4QcE7DSua53ldHSKjbaNYay5JD+x1il0PvXMuoHMx5q0XWnsVW4FO/YBi0drby8yD2u
 zd0PjbAfKD8S+qd5JJb4PpXifhY/6j9eMEk8dn4Zo9K1u2rxcu/JBm6JcfI1OhgDkLg==
X-Received: by 2002:a05:600c:1e19:b0:413:2d05:7de3 with SMTP id
 ay25-20020a05600c1e1900b004132d057de3mr1571626wmb.3.1710253509973; 
 Tue, 12 Mar 2024 07:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH00Nh7bnoQLpmDSBwT+2EAOUi7PE4qgUUe09ya9JZINXPB4EDHU/T7R19/Xu0REtthSySngA==
X-Received: by 2002:a05:600c:1e19:b0:413:2d05:7de3 with SMTP id
 ay25-20020a05600c1e1900b004132d057de3mr1571613wmb.3.1710253509592; 
 Tue, 12 Mar 2024 07:25:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 fc20-20020a05600c525400b00412ae4b45b3sm18797103wmb.30.2024.03.12.07.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 07:25:09 -0700 (PDT)
Message-ID: <4167f9f8-07c6-46ba-975e-3481bb334749@redhat.com>
Date: Tue, 12 Mar 2024 15:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/mgag200: Add a workaround for low-latency
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, tzimmermann@suse.de, daniel@ffwll.ch
References: <20240208095125.377908-1-jfalempe@redhat.com>
 <212a3a40-e1d1-4e2f-97f1-7039f92121f5@linux.dev>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <212a3a40-e1d1-4e2f-97f1-7039f92121f5@linux.dev>
X-Mimecast-Spam-Score: 0
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



On 12/03/2024 13:56, Sui Jingfeng wrote:
> Hi,
> 
> 
> Interesting patch! I know this patch already merged.
> While study this patch, I have a few questions.
> 
> 
> On 2024/2/8 17:51, Jocelyn Falempe wrote:
>> We found a regression in v5.10 on real-time server, using the
>> rt-kernel and the mgag200 driver. It's some really specialized
>> workload, with <10us latency expectation on isolated core.
>> After the v5.10, the real time tasks missed their <10us latency
>> when something prints on the screen (fbcon or printk)
>>
>> The regression has been bisected to 2 commits:
>> commit 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
>> commit 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>>
>> The first one changed the system memory framebuffer from Write-Combine
>> to the default caching.
>> Before the second commit, the mgag200 driver used to unmap the
>> framebuffer after each frame, which implicitly does a cache flush.
> 
> 
> I don't know why it need to do a cache flush, where is the code.
> I'm asking because I want to study this technique.
> 
> Generally speaking, X86-64 platform's default page caching is cached.
> And I think the cached mapping is fastest for software rendering. And
> the platform guaranteed the coherency for us, right?
> 
> Because X86-64 platform(or CPU)'s write buffer is implemented on the
> top of cache? I'm means that for ARM(or other) CPU, when using 
> Write-combine
> the data will has nothing to do with cache.
> 
>> Both regressions are fixed by this commit, which restore WC mapping
>> for the framebuffer in system memory, and add a cache flush.
> 
> So switch back to WC probably will decrease overall performance, I think.
> And the cache flush operation should not have a impact. Except X86-64's
> Write-Combine is different other platform's Write-Combine?

Yes this patch is a bit weird. Usually you want your VRAM mapping to be 
Write-Combine. Here it also set the system memory framebuffer as 
Write-Combine. On most x86-64, Write Combine uses its own hardware 
buffer that is not in L1/L2/L3. So when it copies the framebuffer from 
WC system memory to VRAM, it doesn't involve the cache, and have less 
impact on latency for other tasks running on other CPU.
Also I think the cache flush is important to flush those WC buffers, so 
when the next frame comes, it won't have to wait for the buffers to be 
copied to the slow VRAM.
When running the latency tests, it's obvious that both are needed.
This is how I understand it, but I may be wrong.

-- 

Jocelyn

> 
> 
>> This is only needed on x86_64, for low-latency workload,
>> so the new kconfig DRM_MGAG200_IOBURST_WORKAROUND depends on
>> PREEMPT_RT and X86.
>>
>> For more context, the whole thread can be found here [1]
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Link: 
>> https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/ # 1
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

