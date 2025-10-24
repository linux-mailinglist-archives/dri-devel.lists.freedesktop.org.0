Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E5C066FD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 15:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4C910EA7E;
	Fri, 24 Oct 2025 13:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xana0Y7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4157010EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761311823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ge4wmUcXTfZNuOeMfkfVL7HYbqF4GOnhAVQLb4Z8TRQ=;
 b=Xana0Y7amuEqy9wJCtP60PGb9RGtbSslmgyTpUI8wI2Ps5kYjejDA/A7h9z/XamEWnWYRV
 BzVVmC+lIuvV4vQHeJSThM1Tso7iZnEexwwVjOpE/OvEB23bXzukVU49wTQQzq1COCc+Zp
 /0Db9S6c10W61eJ2EMvNQ/zHBs7NVBM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-rdLHygC5NfSXifIsuXyt6w-1; Fri, 24 Oct 2025 09:17:02 -0400
X-MC-Unique: rdLHygC5NfSXifIsuXyt6w-1
X-Mimecast-MFC-AGG-ID: rdLHygC5NfSXifIsuXyt6w_1761311821
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-738a7fc9901so22838317b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761311821; x=1761916621;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ge4wmUcXTfZNuOeMfkfVL7HYbqF4GOnhAVQLb4Z8TRQ=;
 b=Od3qHPmvrQrieIFQp5pjtGyObtRtqzL/h/XlYRAYc7wr4bln6+k5+d3/pZ3nhsy0CP
 oJzUbEvJ1gCHjDOhHBWCY4p1X5T/c88BOOMTIhqZIt8Gor5seWRg5uxPYT6P6rrpcfsi
 u8w0oLAtYCWEZWgfCa5wPHwmB2wzw9l7eLAxuol7X5DpAe80ECgQolP42Xo20poUs+Ze
 UKeB+bMHk4P3W58qr2SxbWscU/AEnK44KXWgB02A4NxCbidzLfVKIdwsHmFxZzH4pQPt
 5Qm2MObCZGfKuygsWEFKXNvndkg4jkgq6L/QfPLqA4xNkKMqCgSbaJzTKDGdd7s9e2hP
 1vuw==
X-Gm-Message-State: AOJu0YySDJQhX1vtAfV3gl68PqDP4F0hRzT8iFTL2G/kVDk2dvBncbYS
 k2LBqh6Xf7TGqepLnkbGInQSQ/Fh/XhCSZ1PGJTIIKhO7FCzdQHoy1kwCb/SUerlqDtA231+12/
 b2TDGc2J3PFsSvRBu3i+0AQOLdkd9I0YxHKJBsVU6suSY6El4TptNshcNuFOMpx4+A1XJikSGax
 DqkIooDiKCJNEbqi69gNbg4dtvkb1vbh043/OHWT/WVQpA
X-Gm-Gg: ASbGncsX5cFap7ymU26bGOSNfsFfYKe9PJOlXxyDk70H96cdpOZ5aqbb6jzL5Rccp0v
 XuXSyLbTuqnTqQbTBrYgMUUq3uFlyjEdfqLkJY59vDPRLuvHIv1XMc8+VMkA0uoKhW9IanB/LOv
 tSFjk2C0UEGgnxUarfP3t0otlR1Wv41n9puRHEugIXPOsXVFxKeM7olQ==
X-Received: by 2002:a05:690c:d84:b0:785:cbf4:72cd with SMTP id
 00721157ae682-785e006d977mr19287027b3.3.1761311821275; 
 Fri, 24 Oct 2025 06:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw2pHpFwqrLR0jLivutX2xPOBZG6CgaJ2Z66kijd60YMdU40Jwv9xsb6JC8+9xUIZbekki8LE+Qe/CRsRCIP4=
X-Received: by 2002:a05:690c:d84:b0:785:cbf4:72cd with SMTP id
 00721157ae682-785e006d977mr19286637b3.3.1761311820805; Fri, 24 Oct 2025
 06:17:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Oct 2025 06:16:59 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Oct 2025 06:16:59 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <9aa46e0e-5a10-47d5-815f-8e97d42fff94@collabora.com>
References: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
 <9aa46e0e-5a10-47d5-815f-8e97d42fff94@collabora.com>
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 06:16:59 -0700
X-Gm-Features: AS18NWCQd2MYruc2pY3CEbkCOWeEH2LhMemjFsj6NKnUIFE35JvS0VbBWCc5og8
Message-ID: <CAAiTLFWCjKYSU1YaQHj1D5Xaj2e+P2OqUVt1NZQNkrHG+ypcXw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CH_dEEN7ShnCKL1dByFMA8V1wWDaC4c1Fm9TKNNN5Vo_1761311821
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

> On 4/2/25 20:45, Sergio Lopez wrote:
>> There's an incresing number of machines supporting multiple page sizes
>> and on these machines the host and a guest can be running, each one,
>> with a different page size.
>>
>> For what pertains to virtio-gpu, this is not a problem if the page size
>> of the guest happens to be bigger or equal than the host, but will
>> potentially lead to failures in memory allocations and/or mappings
>> otherwise.
>>
>> To improve this situation, we introduce here the HOST_PAGE_SIZE feature.
>> This feature indicates that the host has an extended virtio_gpu_config
>> structure that include it's own page size a new field.
>>
>> On the second commit, we also add a new param that can be read with
>> VIRTGPU_GETPARAM by userspace applications running in the guest to
>> obtain the host's page size and find out the right alignment to be used
>> in shared memory allocations.
>>
>> There has been a discussion in virtio-comments about whether the
>> information about alignment restrictions must be shared in a generic or
>> in a device-specific way, favoring the latter:
>>
>> https://lore.kernel.org/virtio-comment/CY8PR12MB7195B5E575099CD9CA1F2F39DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#t
>>
>> v2:
>>  - Rebase on top of current upstream.
>>  - Make a reference in the cover to the discussion about how device
>>    page alignment restrictions should be shared with the driver.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>> Sergio Lopez (2):
>>       drm/virtio: introduce the HOST_PAGE_SIZE feature
>>       drm/virtio: add VIRTGPU_PARAM_HOST_PAGE_SIZE to params
>>
>>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
>>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
>>  drivers/gpu/drm/virtio/virtgpu_ioctl.c |  5 +++++
>>  drivers/gpu/drm/virtio/virtgpu_kms.c   | 13 ++++++++++---
>>  include/uapi/drm/virtgpu_drm.h         |  1 +
>>  include/uapi/linux/virtio_gpu.h        |  5 +++++
>>  6 files changed, 24 insertions(+), 3 deletions(-)
>> ---
>> base-commit: acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
>> change-id: 20250402-virtio-gpu-host-page-size-282c99dfe44c
>>
>> Best regards,
>
> Hi Sergio,
>
> Curious if this feature still wanted. The protocol was updated many
> months ago with the VIRTIO_GPU_F_BLOB_ALIGNMENT addition.

Yes, we still need it to avoid having to carry downstream patches in
Mesa with a hack to hardcoded the alignment.

I'll prepare a new patch series (referencing this one) next week.

Thanks,
Sergio.

