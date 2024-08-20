Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A3958935
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 16:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA57010E7EE;
	Tue, 20 Aug 2024 14:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KmytLbXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5585310E40E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724164074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ubk8Yb33ek9o28qQ4n8Su7NGdGoK0OIgkJPolUgXNBk=;
 b=KmytLbXCtgdEI93TrMZeU6CmYDpgiiDADL7cJe4Q41a9X3uiRooyYoD1Mjmx3+jwBWbpl8
 jr06hDcqMhPONN+0/TWIi6hbkXi/BdP+RGEq2Ux36uA2R9pf2zlzp5tM9umvvlsfN+Vl7o
 LFTMWPPRrs5yeOKYLePf4bPMcNv8yUc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-KOKKrZ6BPeetE1fJvRB7vA-1; Tue, 20 Aug 2024 10:27:51 -0400
X-MC-Unique: KOKKrZ6BPeetE1fJvRB7vA-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2d5dafe951eso184124a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 07:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724164070; x=1724768870;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x3ovf2iShaZ9qbPPkoSbbQpKOfxaHuRmMXoaahs1Ka0=;
 b=HJoi6tKWa/5kHY5NQSYm12+dhlKvfHbmD6x/oUrBGvkabXAmyinM3jGRP36gcGv9WK
 xQnBBaMxBAFnslfBM9Rz60ne+AGzow9Y2TAozkW1KceDJtKgIgvkJpVqCTWX6AKXjyPN
 y4fznHEmaa1EDY3E5JBVdlka2tEXrDbJqYEu17W5sOvelc4YxSSEDoP5OyD/dfSbRQug
 o1d9FFjYSInjjx2dkHXlMAaeEsRSsOZBsUmVq+Kpzeh/jhPWCTUUapE2NBU8CyCThdCK
 rdRvRB2db6uzpzxW5jFi8+7TvI5ZDYPcsTXoRKO8asL+cPrtvLrT8Zm9VPsU8YqJzOeh
 u4gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF0QhsOQW4GHJwYq2JFUOFqdkLcU68FuXR5zF3Thn6sMIC6f3qU3ISOKYKzqZENG/GqphQN4dztjL/uexPE2wCdaIY/KJ1PL6rjF/ld2AF
X-Gm-Message-State: AOJu0YyX/w1Z+9+SY8N+CdYe+9Ga7TG8QR3T83hUXTbYItJRKRtKed1k
 9G0+WjRnEUocJd/njubCBApSbf4u7iZpCVfM47H3qgZqjJxalIm40QpEiOwToNl1k4ZpXqzG+69
 4QBNAf46YaXwB+5HDvsShBrgKQSc3+z2RzYBFdbXyJ2nB7W4RZniPM+umVJaD1lxUPA==
X-Received: by 2002:a17:90a:d50a:b0:2c9:69cc:3a6f with SMTP id
 98e67ed59e1d1-2d3e00ebf73mr13052235a91.31.1724164069916; 
 Tue, 20 Aug 2024 07:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHypeLeTNx3e7ttHvILw7VadgW74FuCGTQOH1UI/v7taOrjRzD7/mgP3FVnPfvZk5PmxOkWCA==
X-Received: by 2002:a17:90a:d50a:b0:2c9:69cc:3a6f with SMTP id
 98e67ed59e1d1-2d3e00ebf73mr13052205a91.31.1724164069457; 
 Tue, 20 Aug 2024 07:27:49 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d418e7b76csm6684852a91.2.2024.08.20.07.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:27:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I
 Wu <olvaffe@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
Subject: Re: [PATCH v2 2/2] drm/virtio: Fix host color format for big endian
 guests
In-Reply-To: <ddd41844-1d3e-4755-9013-9ae4e751c501@redhat.com>
References: <20240820090908.151042-1-jfalempe@redhat.com>
 <20240820090908.151042-2-jfalempe@redhat.com>
 <efe083ed-b83b-45e8-a418-1861f535e31f@suse.de>
 <ddd41844-1d3e-4755-9013-9ae4e751c501@redhat.com>
Date: Tue, 20 Aug 2024 16:27:46 +0200
Message-ID: <87a5h79sm5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> On 20/08/2024 14:48, Thomas Zimmermann wrote:
>> Hi
>>=20
>> Am 20.08.24 um 11:07 schrieb Jocelyn Falempe:
>>> The colors are inverted when testing a s390x VM on a s390x host.
>>> Changing the conversion from DRM_FORMAT -> VIRTIO_GPU_FORMAT on big
>>> endian guests fixes the colors. But it may break big-endian guest on
>>> little-endian host. In this case, the fix should be in qemu, because
>>> the host endianess is not known in the guest VM.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>>> =C2=A0 drivers/gpu/drm/virtio/virtgpu_plane.c | 12 ++++++++++--
>>> =C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c=20
>>> b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> index 860b5757ec3fc..0ec6ecc96eb13 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> @@ -37,16 +37,24 @@ static const uint32_t virtio_gpu_cursor_formats[] =
=3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_FORMAT_ARGB8888,
>>> =C2=A0 };
>>> +#ifdef __BIG_ENDIAN
>>> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM
>>> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM
>>> +#else
>>> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM
>>> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM
>>> +#endif
>>=20
>> As these defines are only used here, would it be beneficial to put the=
=20
>> __BIG_ENDIAN branch directly around the switch statement?
>
> That was my first version, but I found it difficult to read, when I mix=
=20
> #ifdef in a switch case.
>
>
> or maybe something like the following would be better ?
>
>
>   =09switch (drm_fourcc) {
> #ifdef _BIG_ENDIAN
>   =09case DRM_FORMAT_XRGB8888:
> =09=09format =3D VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM;
>   =09=09break;
>   =09case DRM_FORMAT_ARGB8888:
> =09=09format =3D VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM;
>   =09=09break;
> #else
>   =09case DRM_FORMAT_XRGB8888:
> =09=09format =3D VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
>   =09=09break;
>   =09case DRM_FORMAT_ARGB8888:
> =09=09format =3D VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM;
>   =09=09break;
> #endif

IMO your current patch is easier to read than having the ifdefery
in the switch statement.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

