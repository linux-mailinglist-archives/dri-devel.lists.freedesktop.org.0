Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82385FE1D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 17:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17C710E153;
	Thu, 22 Feb 2024 16:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Uq8xSbpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB1110E153
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708619633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njZCOqSfwyB80QbQtxM7mZ+GgiYBhl+JhpjZqiRCVAA=;
 b=Uq8xSbpvvJtT4xs+yBgcP54pUYqd/+Ev3F/pK+vB8HM7vwKDWcaFA7xkVTsOaZz4D3JZCC
 ZKnAfzqi1EdCAgVxuGS1b79bD67YHd5dCG6kJchsGhYvoYT4TY4Kc4MWkbie7hnjM5aqy5
 VVH86rdrqXViKGQbk7Gz4G1FGuQqN7k=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-9Se8lLBLO7mlCl7fb4-XdA-1; Thu, 22 Feb 2024 11:33:51 -0500
X-MC-Unique: 9Se8lLBLO7mlCl7fb4-XdA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2d23683df7fso41590101fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708619630; x=1709224430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=njZCOqSfwyB80QbQtxM7mZ+GgiYBhl+JhpjZqiRCVAA=;
 b=sEV1CSunttiPW17zaIFGt4ioocAMcxV/70kSYO7hWhDdBlnwrtHITO+jsaKaNYLxtY
 zXgBuc338WV0NnT1RyQLJ82WcZ1OvNSG3uFsmfXTZSfgVAx+LyNp/ciUuZb7ccrdgwHY
 pJmJbCNflRK4LqgVyYhrsnKXBBkvGn2OzwK2loM+fVlF4YW5GT0hlgwLu3pbAyHZhN8c
 oC9oeIAuDeU2d2WHORS8PLeKuGmE81JTtlehZU2ppB8TRF8OGZwdIU7ATfvgVMaSKMHI
 YVV9gtz8vvxbF6x4uYPfc/yG7G3LkaWjuDVV4A9K1c4vKRvE9gnK/hdPWNSbwBDPcVbr
 REkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFgbErAQVewMUG3ZxFI2gSTCEHoWRjHXqFhe5KVwaZv2aQ/lYLX2k2Pou2e262xCH9nYteCpqDY3SkYTG1QkAHb4J4r9KTUSR1o1zV4dMh
X-Gm-Message-State: AOJu0YwMoljAWOeQB92Q3xQleHkKXYlR2IeI/MoQ0UZ4TloEzjbB+8pH
 GAJg46kEk+lQhSdUdp30GWX5y0c3xDnMn/pIfS/3+ksh+gYkEZW1j/5LiOEABTG4a9f2OlTCAbc
 IXMMgB9/e8K+9CfiQz5Dr31F3vjYR5hZIpCfilvIkKHUZe9hedLCZC5l4FuyR4M2j
X-Received: by 2002:a2e:3006:0:b0:2d2:3a0b:cafd with SMTP id
 w6-20020a2e3006000000b002d23a0bcafdmr10418098ljw.39.1708619630297; 
 Thu, 22 Feb 2024 08:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI138h4lOSeCRjEurXIrOuTh8eLV27RylT4Rf4kQNmJ/ypogDBjDEPgj0+u2J83JlT0EPEWA==
X-Received: by 2002:a2e:3006:0:b0:2d2:3a0b:cafd with SMTP id
 w6-20020a2e3006000000b002d23a0bcafdmr10418075ljw.39.1708619629961; 
 Thu, 22 Feb 2024 08:33:49 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-30-118.cust.vodafonedsl.it.
 [2.34.30.118]) by smtp.gmail.com with ESMTPSA id
 g5-20020adffc85000000b0033d8aeb229csm3152570wrr.27.2024.02.22.08.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 08:33:49 -0800 (PST)
Message-ID: <ad03c582-28b9-40b2-9c7b-8372ed5a05c2@redhat.com>
Date: Thu, 22 Feb 2024 17:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20231130171417.74162-1-marpagan@redhat.com>
 <a45b796d-5e04-4eac-b5ba-ea6bb3b6131b@roeck-us.net>
 <045bfb84-9833-442c-ac54-ed7a26451afa@redhat.com>
 <fb2ac929-6650-444e-8f24-c9b1562d2bb3@roeck-us.net>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <fb2ac929-6650-444e-8f24-c9b1562d2bb3@roeck-us.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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



On 2024-02-22 16:52, Guenter Roeck wrote:
> Hi Marco,
> 
> On 2/22/24 07:32, Marco Pagani wrote:
>>
>>
>> On 2024-02-18 16:49, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On Thu, Nov 30, 2023 at 06:14:16PM +0100, Marco Pagani wrote:
>>>> This patch introduces an initial KUnit test suite for GEM objects
>>>> backed by shmem buffers.
>>>>
>>>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>>>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>>>
>>> When running this in qemu, I get lots of warnings backtraces in the drm
>>> core.
>>>
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:327
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:173
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:385
>>> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:211
>>> WARNING: CPU: 0 PID: 1345 at kernel/dma/mapping.c:194
>>> WARNING: CPU: 0 PID: 1347 at drivers/gpu/drm/drm_gem_shmem_helper.c:429
>>> WARNING: CPU: 0 PID: 1349 at drivers/gpu/drm/drm_gem_shmem_helper.c:445
>>>
>>> It looks like dma_resv_assert_held() asserts each time it is executed.
>>> The backtrace in kernel/dma/mapping.c is triggered by
>>>     if (WARN_ON_ONCE(!dev->dma_mask))
>>>         return 0;
>>> in __dma_map_sg_attrs().
>>>
>>> Is this a possible problem in the test code, or can it be caused by
>>> some limitations or bugs in the qemu emulation ? If so, do you have any
>>> thoughts or ideas what those limitations / bugs might be ?
>>
>> Hi Guenter,
>>
>> Thanks for reporting this issue. As you correctly noted, the warnings appear to
>> be caused by the dma_mask in the mock device being uninitialized. I'll send a
>> patch to fix it soon.
>>
> 
> Thanks a lot for the update.
> 
> In this context, the TTM unit tests fail as well in qemu, with worse result:
> It seems there is some bad cleanup after a failed test case, causing list
> corruptions in the drm core and ultimately a crash. I don't know if this
> is also caused by the missing dma_mask initialization.
> 

That's interesting. Which --arch argument are you using to run the
tests with QEMU?
Thanks,
Marco

