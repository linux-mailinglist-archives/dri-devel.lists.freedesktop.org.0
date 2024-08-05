Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECC4947810
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 11:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEE710E16A;
	Mon,  5 Aug 2024 09:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WXFw5BtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0CA10E16A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722849253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cYEr12ESNSjKojO6NUh+zO4URzAONDoFGizHlfeb6CM=;
 b=WXFw5BtViZwUqbc0+CS1qP5qd5eOmmRILvUR4BD7GPx2HfGt4QKyUL9i9KYpueYP4waX8H
 5aRt0udzZSnHmkIguWYS6STVzlhxzWqkx5EyIdNPzjOjffdkjuISDwnpvNvudT+yKBNOVH
 EEsTwi7SDW8PxDqFchSAzCiHcUJiZXs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-JgePaHbLMBKGRwWV3zyieQ-1; Mon, 05 Aug 2024 05:14:11 -0400
X-MC-Unique: JgePaHbLMBKGRwWV3zyieQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-70d14fc3317so9013691b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 02:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722849250; x=1723454050;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cYEr12ESNSjKojO6NUh+zO4URzAONDoFGizHlfeb6CM=;
 b=soNFhWmQa4T22poLtvk0i0Hso1Ow1VaE8rLK705bnr/gczG00dwGSkOZjmjSG57xvQ
 ielXY0ozNCP/v4J0OkqFGZWL87XeL6Fe6KTwiwvZsOoa1/W4JTbqmhDzdvfh2CEDF0Fs
 UUl7rkLOr34li2Q7k2Cu8oeL4GYogIwZWvHwYOS6UxJtkDJB5id665/US3g6dN+HlnNd
 3f55COMNdSQ/YPF+Lz9ZWPJzK/85khdJlEaHtGrm62AFLfF81V8kYiSc9FNTB8Mz7Ble
 9nLHTo3OvuaxKel9V4hXoC1JJEtuzFPBVVNB/qWYmqFiAK076WftMKpEmf4dMSONzc3L
 OqmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTFQUcdMVyqCFaUKQV7lvVQuFVHs/yU/eMDWMuDe+qRh+aCdP3t819ZDb0N3yUcwIQaISG0D1kALbNx164dYqN2Ciu9uBi32WrPOHWa8XX
X-Gm-Message-State: AOJu0YzVReQ1KUjyRIRYD2bDv7g5CeCsiT95SXooXau7IybVtJ0Gzi24
 jFMZL6t/aNo4rIhI6WPxUSEos3j503Sv1mnHpLGUwf3MdruOy9mIJhbghMp4We4BeAogKiRddhx
 uxY0b6SiEmQDa3f6XwLmxXCfpdSGGESLEh5Vdf2pm3KOyFzSLHhJOkutFCnOWWenJgFJO0yb6+N
 5n+LnSfK2D9bKvfKwbpqjRyocSur76+dvlF/nHtvML
X-Received: by 2002:a05:6a20:d80d:b0:1c0:f5ea:d447 with SMTP id
 adf61e73a8af0-1c69959d1ecmr11272131637.31.1722849250573; 
 Mon, 05 Aug 2024 02:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHx+ra0bxEhW+9FV7kXYO0559BlpJINXNAHMKtXsFbYfAG4Tt3wh9BjFp2TlNFgdjgQOeIaX1M39gbMSBHCUQ=
X-Received: by 2002:a05:6a20:d80d:b0:1c0:f5ea:d447 with SMTP id
 adf61e73a8af0-1c69959d1ecmr11272112637.31.1722849250168; Mon, 05 Aug 2024
 02:14:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Aug 2024 04:14:09 -0500
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
MIME-Version: 1.0
Date: Mon, 5 Aug 2024 04:14:09 -0500
Message-ID: <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 gurchetansingh@chromium.org, 
 tzimmermann@suse.de, mripard@kernel.org, olvaffe@gmail.com, kraxel@redhat.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, airlied@redhat.com
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:

> On 7/23/24 14:49, Sergio Lopez wrote:
>> There's an incresing number of machines supporting multiple page sizes
>> and on these machines the host and a guest can be running, each one,
>> with a different page size.
>>
>> For what pertains to virtio-gpu, this is not a problem if the page size
>> of the guest happens to be bigger or equal than the host, but will
>> potentially lead to failures in memory allocations and/or mappings
>> otherwise.
>
> Please describe concrete problem you're trying to solve. Guest memory
> allocation consists of guest pages, I don't see how knowledge of host
> page size helps anything in userspace.
>
> I suspect you want this for host blobs, but then it should be
> virtio_gpu_vram_create() that should use max(host_page_sz,
> guest_page_size), AFAICT. It's kernel who is responsible for memory
> management, userspace can't be trusted for doing that.

Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creation
and mapping into the guest of device-backed memory and shmem regions.
The CREATE_BLOB ioctl doesn't update drm_virtgpu_resource_create->size,
so the guest kernel (and, as a consequence, the host kernel) can't
override the user's request.

I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the host
page size to align the size of the CREATE_BLOB requests as required.

Thanks,
Sergio.

