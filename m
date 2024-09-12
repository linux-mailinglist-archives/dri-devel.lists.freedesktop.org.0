Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D932976718
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 12:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1AF10E91E;
	Thu, 12 Sep 2024 10:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CYtfd8iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD0D10E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726138721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KfxXIJl6sSUrt0oCskygd0emWR47w0CtNjllXkmzZ0=;
 b=CYtfd8iwUetPQVnmqvmZvup0NRfk0v5Nb0tIh87mrd/yKqZXWkI+f87DWvM8FkyhcTJsMN
 zNVfDuNdqTQKwE3aL0T282XcdFN5a1IQ4rLJtivCfCdLgmA9VI+OC7wyQQsQPx2vVJ/1sO
 iuskca0xgi2WoLs1+scv/DdfObS6Q8E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-BOSI77nAOsiXC5H5jdcesw-1; Thu, 12 Sep 2024 06:58:40 -0400
X-MC-Unique: BOSI77nAOsiXC5H5jdcesw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cbfc2aac6so5103665e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 03:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726138719; x=1726743519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8KfxXIJl6sSUrt0oCskygd0emWR47w0CtNjllXkmzZ0=;
 b=S7gFGc7Y3vzLzxgzHnQvyAtBcaXBLpSXVJoDLtJuTO6gsUEu3As64I7c1uaFSOvddT
 fZyI8jzJ+zOS3q9hnDjSg6xWWyyTXUzfY5rZyi0S47rOWYH07EYkoCX+RiySkGVOtAZt
 fyV2x0EAijDjwgISWQZ0av7JVnBS3bG9mSWC35mXQEuaxoWrrL+vxFtC3xefgEPciqZ3
 HFS82Dft01xG1xtrJ7Fc9Jplk53gZkP4FPcyxiGRkragexr4PlJ5SJtziUXzNLJV+GFq
 9nSHBD9SIwRKAQ5iA/qtJz8c40QzVpEulcW9tcRFog6RGxpwZ78ob9TQI2i1kBN6ZMDy
 zwrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS7VrC4zWmTYLOSSmio35BXwP6wpT+ai+USvSrgmag9Q37iCZyddj06cYwDEWTXS6AuQ8tqJ5IwzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEnUQHirhLY5KElADH9lGPfyL/gQNccQ5U5EkbJRRXCtM7Q1TO
 IyZHUG77oUPOu0W8LtQs40PaxSK54BHYpiOEKgnXrXbmxgo4anhfaXOxY5qXsMqdnUVOoThagQH
 kCPF9vAbM/zvw3hP3gV48LsPJTXBF+hnLJAZw70I7lSUaNyRzl4c1K8kAUk6CUq7fsg==
X-Received: by 2002:a05:600c:4709:b0:42c:ac9f:b505 with SMTP id
 5b1f17b1804b1-42cdb58e130mr20444415e9.31.1726138718986; 
 Thu, 12 Sep 2024 03:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1kIFj2gZcJpQft3Ip9R95sfyHMqUrmQJsZC95T9uKYSfa2rNf2Foa4QJ4mM6FRnsdjjYg7Q==
X-Received: by 2002:a05:600c:4709:b0:42c:ac9f:b505 with SMTP id
 5b1f17b1804b1-42cdb58e130mr20444125e9.31.1726138718419; 
 Thu, 12 Sep 2024 03:58:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cae117aeesm174467035e9.6.2024.09.12.03.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:58:37 -0700 (PDT)
Message-ID: <2c97cb8f-94ff-4aa6-be55-c03bcd91cc9f@redhat.com>
Date: Thu, 12 Sep 2024 12:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: James Jones <jajones@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240906100434.1171093-1-jfalempe@redhat.com>
 <20240906100434.1171093-4-jfalempe@redhat.com>
 <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
 <21e44532-7989-43a9-99dd-04461c346be6@nvidia.com>
 <2fb7978b-9d1f-49f1-afe0-f32cc3b6a0c0@redhat.com>
 <CAKb7Uvh8x0z00DY_w-16voWwBbm6pRGLLMBKai-M6_8CDLQfGw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAKb7Uvh8x0z00DY_w-16voWwBbm6pRGLLMBKai-M6_8CDLQfGw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
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

On 11/09/2024 16:39, Ilia Mirkin wrote:
> On Wed, Sep 11, 2024 at 10:19 AM Jocelyn Falempe <jfalempe@redhat.com 
> <mailto:jfalempe@redhat.com>> wrote:
> 
>     On 06/09/2024 21:36, James Jones wrote:
>      > Right, there are 3 iterations of block linear tiling actually.
>     NV50 does
>      > support scanout of block linear surfaces. All block-linear-
>     capable GPUs
>      > do. The 3 generations are:
>      >
>      > NV5x/G8x/GTXXX line: Original block size.
>      > GFXXX(nvc0 I believe in nouveau terms)-GV100: double the block
>     height I
>      > believe.
>      > GTXXX+: Same block size, but the layout within a block is subtly
>      > different, at least as visible in CPU mappings.
>      >
> 
>     I'm looking at how to check for specific chip in nouveau, and fix the
>     tiling for other cards than Turing.
>     It looks like in most case nouveau uses device->info.chipset, with
>     hardcoded hex value. so for nvc0+ I should check device-
>      >info.chipset >=
>     0xc0 ?
> 
>     chipset < c0 : block_height 4, "old layout"
>     chipset >= c0 : block_height 8, "old layout"
>     chispet >= ?? : block_height 8, "new layout"
> 
>     For testing, I have at hand a GTX1650 (Turing) and an old Geforce
>     8800GTS (Tesla?), so it's a NV92, and still uses this nv50+ code ?
> 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/nouveau/nvkm/engine/device/base.c#n2399 <https:// 
> git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/ 
> gpu/drm/nouveau/nvkm/engine/device/base.c#n2399>
> 
> So probably >= 0x160
> 
> There should also be a device->card_type which is an enum that you can 
> use too, depending on what you have available? Set here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/nouveau/nvkm/engine/device/base.c#n3177 <https:// 
> git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/ 
> gpu/drm/nouveau/nvkm/engine/device/base.c#n3177>
> 
> Once you have a patch tested, ideally someone with the hardware should 
> test on a >= fermi && < turing card.

I'm testing on my 8800 GTS.

The problem I have is that fb->modifier is 0, but the buffer is still 
tiled. I found there is a nouveau_framebuffer_get_layout() which gives 
tile_mode and kind, and works on my Tesla.

So if I understand correctly, if kind != 0, there is tiling, and the 
block size is 8 * (1 << tile_mode). (and half this on Tesla).

At least tiling is much easier on Tesla, there is no tiling inside the 
block. In my test, block size is 4K, 16x64 pixels, tile_mode is 4, and 
kind is 122.

I will send a v3 which works on Tesla and Turing soon.

Thanks for your help.

-- 

Jocelyn

> 
> Hope this helps,
> 
>    -ilia

