Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3F29ACEAF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 17:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BFA10E80C;
	Wed, 23 Oct 2024 15:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gvm6E27/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C628010E80C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729697177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUh0g17SqyKPeTvfCPnxLjLxXG/Lptz+4Dsb0wobQHw=;
 b=gvm6E27/Jc8NOsNzkb9OOBRrudRINxO4j9OXqSngK7BawiKZ3yNQhJSUbvYg/eXyfGnRnj
 OYwyr7yc/9wmlcvRu3tO1/kwTv2U9kzws7BkBR6/lLa1iDnz31v2iHkzSwPEH6RjBED1fk
 3KMjezSAH4lonH9jsxPbQiM74Gj4Oag=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-hQ8JUa98O3-eJunF3_qkCw-1; Wed, 23 Oct 2024 11:26:13 -0400
X-MC-Unique: hQ8JUa98O3-eJunF3_qkCw-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-718074f58fcso5912994a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729697173; x=1730301973;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sUh0g17SqyKPeTvfCPnxLjLxXG/Lptz+4Dsb0wobQHw=;
 b=WUb1fumUASLFRDqcqlc6KV0vjKaf/YqU96SXTK2J6hGeEYOP21JGk45RpTZrVxcQ2j
 ziWTOcB5k34V+WdV4IB/e98jm1zuU9xDvM9rTQVjDiYmQpLkdyh42umRc8zAEjpoGXUJ
 nmbsNIxzmSerHIlIQ+93a43Bun+dL6z/pVCapVHsxVR4BrKY4s44hpPe3G4EU3urQ1ID
 XGGAGj+mAedfQSUE32osgxh5rfKZwreG5txto3efRswj2LbcTWiiE+lYeWiusCdLYmsf
 TTgQ3EtkP128xdWviytwCuhNuJPTtKeKZ53EfZ1JtOM+xvf5Ptzc6Q8NRqKt5HPi483s
 7EdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/DkYa8qUyzE/44lGrd7crFLn4IcRrq1meM4aRsx9xffnbwTXCQsU1qt1yqEXgV7xW15TBslHTuig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzBtSC20tI9/IiLDtA3juqsu9mu+/0OP/YyfRa56ARRkwmbxZh
 3NPWHOhItY21F70F1kj+TtCk6dRtFw9KGL0kKRJ0nk/sqAV3QMxWv+aOQs2rpLVZkmAZb5tA6Au
 UMcahKsqN176Hhx9ZulOi46L6tA61h7OP1fsXCZgJifogno+YH/HGBxzcG6l7Ujx/8w==
X-Received: by 2002:a05:6830:4428:b0:718:119:ee15 with SMTP id
 46e09a7af769-7184b2d43abmr3322097a34.10.1729697173049; 
 Wed, 23 Oct 2024 08:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ8HZNZZ1NdptD5eLWfYWIKUwYpZpDtDkhL+yfDSXkQRcv/wze/ury8WoK60x0GCFuj5xePQ==
X-Received: by 2002:a05:6830:4428:b0:718:119:ee15 with SMTP id
 46e09a7af769-7184b2d43abmr3322057a34.10.1729697172730; 
 Wed, 23 Oct 2024 08:26:12 -0700 (PDT)
Received: from ?IPV6:2601:188:ca00:a00:f844:fad5:7984:7bd7?
 ([2601:188:ca00:a00:f844:fad5:7984:7bd7])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ce008fb5e0sm40518826d6.33.2024.10.23.08.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 08:26:12 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <813cc1d5-1648-4900-ae56-5405e52926df@redhat.com>
Date: Wed, 23 Oct 2024 11:26:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] kernel/cgroup: Add "dev" memory accounting cgroup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 10/23/24 3:52 AM, Maarten Lankhorst wrote:
> The initial version was based roughly on the rdma and misc cgroup
> controllers, with a lot of the accounting code borrowed from rdma.
>
> The current version is a complete rewrite with page counter; it uses
> the same min/low/max semantics as the memory cgroup as a result.
>
> There's a small mismatch as TTM uses u64, and page_counter long pages.
> In practice it's not a problem. 32-bits systems don't really come with
>> =4GB cards and as long as we're consistently wrong with units, it's
> fine. The device page size may not be in the same units as kernel page
> size, and each region might also have a different page size (VRAM vs GART
> for example).
>
> The interface is simple:
> - populate dev_cgroup_try_charge->regions[..] name and size for each active
>    region, set num_regions accordingly.
> - Call (dev,drmm)_cgroup_register_device()
> - Use dev_cgroup_try_charge to check if you can allocate a chunk of memory,
>    use dev_cgroup__uncharge when freeing it. This may return an error code,
>    or -EAGAIN when the cgroup limit is reached. In that case a reference
>    to the limiting pool is returned.
> - The limiting cs can be used as compare function for
>    dev_cgroup_state_evict_valuable.
> - After having evicted enough, drop reference to limiting cs with
>    dev_cgroup_pool_state_put.
>
> This API allows you to limit device resources with cgroups.
> You can see the supported cards in /sys/fs/cgroup/dev.region.capacity
> You need to echo +dev to cgroup.subtree_control, and then you can
> partition memory.
>
> Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> Co-developed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst |  51 ++
>   Documentation/core-api/cgroup.rst       |   9 +
>   Documentation/core-api/index.rst        |   1 +
>   Documentation/gpu/drm-compute.rst       |  54 ++
>   include/linux/cgroup_dev.h              |  91 +++
>   include/linux/cgroup_subsys.h           |   4 +
>   include/linux/page_counter.h            |   2 +-
>   init/Kconfig                            |   7 +
>   kernel/cgroup/Makefile                  |   1 +
>   kernel/cgroup/dev.c                     | 893 ++++++++++++++++++++++++
>   mm/page_counter.c                       |   4 +-
>   11 files changed, 1114 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/core-api/cgroup.rst
>   create mode 100644 Documentation/gpu/drm-compute.rst
>   create mode 100644 include/linux/cgroup_dev.h
>   create mode 100644 kernel/cgroup/dev.c

Just a general comment.

Cgroup v1 has a legacy device controller in security/device_cgroup.c 
which is no longer available in cgroup v2. So if you use the name device 
controller, the documentation must be clear that it is completely 
different and have no relationship from the device controller in cgroup v1.

Cheers,
Longman

