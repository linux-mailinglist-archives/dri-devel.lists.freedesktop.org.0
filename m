Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C590A359EE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC610E26C;
	Fri, 14 Feb 2025 09:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OL6xd6/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A7910E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739524418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhQbOMy8+GzTi4lxjceqncwBz0c2/iKXPxAWUqDq8Jg=;
 b=OL6xd6/FMuuisDcLeqc9RGGEnKaU9mQVDeiVhuj7bqVjiZSw68XD3WDfXRX9OvpYo+GLji
 5laFNY+vX1cnYCq6L8POXrgg0qgnqomG3BNWoqOarIU/D1LwNM4p1VQfKKOwPBD9Hioomw
 VrMcjEjuIjCkmi64Nwy8pl5oFQe1lrU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-c17zbpjwNym1Kc7blHDHjg-1; Fri, 14 Feb 2025 04:13:37 -0500
X-MC-Unique: c17zbpjwNym1Kc7blHDHjg-1
X-Mimecast-MFC-AGG-ID: c17zbpjwNym1Kc7blHDHjg_1739524416
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05c00so6026661a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 01:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739524416; x=1740129216;
 h=content-transfer-encoding:cc:to:subject:message-id:date
 :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zhQbOMy8+GzTi4lxjceqncwBz0c2/iKXPxAWUqDq8Jg=;
 b=ROEbKracSOsHdqW/0rURv85jRjrCPJCKtaf6d86IYT5XvJVONwviv7njDg1ljB9xFP
 N5PG2HpeZA1I+GBqrANv7x7mdTJ6fpvEFOUjGDNYKWdsaDvsvMYzqix1h8EPXeGnPFcQ
 fBva0/vB+xVaerzULMYfHBowyAiAEKLboU7doZ7+kNriOtQdXUudAK2dMW/5Bno07oT5
 3m3pSqEX9NoYgDUsu3e+u2G4qwiGSt/MfNBGf77cE/vp/6K1714qVUxoQZHwHkJJzkxq
 eACdwgBjGcrW5bVUUTIdWXZHt4Y+SejZ9jk5M/M12jl5OfMGt8J7so+R7gQmpaDfrUht
 AYNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCnV3dmJhVHwo83bEB5Nb2amh3gfRqYAcxv0gkIDJfcC92asexmDzR6z/3uJMzGBplxE1oLjE8fe0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqeA7dWBQ4RF7EoLiJ7+qskP23hebM+nHgOTZv3eAZl8i//EKd
 bXwQ0su5Op9iNWHaFaPJBgyL3GBHwxuYCI+lQ7svbaBX6PQPnudcmF6s2a536xdqp21xTgNMd7r
 uQe2Gyg3jOY6VuNFVMwX/lkg8kWc4BqdAZgTA7cS7zLx/F/N5DFpW8FJQtTTznnffkaS6qDUSeI
 Mc1xOlFIHwjoqbExUdyb4NGXuq1a6i1acLCi+7Npi5
X-Gm-Gg: ASbGncuherVHNo0se2xPPjP6N1Uk9kLm41EL4kRmLcVwmpNygLV3AoFxP1nbYuNtPsj
 Y6vrHB66dZ2Rzf++Uv1fML4SSiulY88uSDtbD4nE2t6hw0wKF8y2xwOWGLQ==
X-Received: by 2002:a17:90b:5108:b0:2ea:a25d:3baa with SMTP id
 98e67ed59e1d1-2fc0decea17mr9715222a91.5.1739524416375; 
 Fri, 14 Feb 2025 01:13:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPjo8jgtMHBDLzBP7QJE/fw8dRdYz3BXgwyJ4HUWTCvNtTSRgFZS9D1zgj8trFg+27pY2Nw3L5Um8vBjoQvM8=
X-Received: by 2002:a17:90b:5108:b0:2ea:a25d:3baa with SMTP id
 98e67ed59e1d1-2fc0decea17mr9715176a91.5.1739524416083; Fri, 14 Feb 2025
 01:13:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Feb 2025 01:13:35 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CABVzXAkFPr-GiALnk2v53CzX0b5Y0yG=KoRoOFR7fy98Xeyb3w@mail.gmail.com>
References: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
 <20250213-virtio-shm-page-size-v1-3-5ee1f9984350@redhat.com>
 <CABVzXA=r=X+GYnSxgeyktKzfKCW2DW+v++c4v_+BHBDHZ_Bzyw@mail.gmail.com>
 <CABVzXAkFPr-GiALnk2v53CzX0b5Y0yG=KoRoOFR7fy98Xeyb3w@mail.gmail.com>
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 01:13:35 -0800
X-Gm-Features: AWEUYZlFdNHXiXC67hDCe7uvDGJZv05mhOU5Gr2Fjb2yYXvv8J_67e4Yb22V8Nc
Message-ID: <CAAiTLFX6kNtuqWCk5qCVqCLUgNxB8yTKis0gBPKHiyNVr3a_GA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] virtio-pci: extend virtio_pci_cap to hold
 page_size
To: Daniel Verkamp <dverkamp@chromium.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, fnkl.kernel@gmail.com, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OClbb_X8RShWuZfkN3iGRWD3obXpAtT832JBBmx0GE8_1739524416
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Daniel Verkamp <dverkamp@chromium.org> writes:

> On Thu, Feb 13, 2025 at 11:22=E2=80=AFAM Daniel Verkamp <dverkamp@chromiu=
m.org> wrote:
>>
>> On Thu, Feb 13, 2025 at 7:54=E2=80=AFAM Sergio Lopez <slp@redhat.com> wr=
ote:
>> >
>> > Turn the 16 bit padding into a page_size field to allow the device to
>> > pass its required page size with format PAGE_SIZE >> 12.
>> >
>> > Signed-off-by: Sergio Lopez <slp@redhat.com>
>> > ---
>> >  drivers/virtio/virtio_pci_modern.c | 29 +++++++++++++++++++++++++----
>> >  include/uapi/linux/virtio_pci.h    |  2 +-
>> >  2 files changed, 26 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virti=
o_pci_modern.c
>> > index 79616ce5057bf3b2b88cae7e8fb7729efa9dd632..26e9cd5148c0f10209c34d=
12e65d64490a855d75 100644
>> > --- a/drivers/virtio/virtio_pci_modern.c
>> > +++ b/drivers/virtio/virtio_pci_modern.c
>> [...]
>> > +               if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
>> > +                       pci_read_config_word(dev, pos + offsetof(struc=
t virtio_pci_cap,
>> > +                                                                page_=
size), &res_psize);
>> > +                       if (!res_psize) {
>> > +                               dev_err(&dev->dev, "%s: shm cap with i=
nvalid page size on "
>> > +                                       "a device with VIRTIO_F_SHM_PA=
GE_SIZE feature\n",
>> > +                                       __func__);
>>
>> Maybe this should also constrain the page size to be a power of 2?
>>
>> [...]
>> > diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virt=
io_pci.h
>> > index 8549d4571257142ac6c9dad5c01369923791a85a..fb0ccb7a125d8178c1f783=
33c4d2f43540e1764b 100644
>> > --- a/include/uapi/linux/virtio_pci.h
>> > +++ b/include/uapi/linux/virtio_pci.h
>> > @@ -127,7 +127,7 @@ struct virtio_pci_cap {
>> >         __u8 cfg_type;          /* Identifies the structure. */
>> >         __u8 bar;               /* Where to find it. */
>> >         __u8 id;                /* Multiple capabilities of the same t=
ype */
>> > -       __u8 padding[2];        /* Pad to full dword. */
>> > +       __u16 page_size;        /* Device page size (PAGE_SIZE >> 12).=
 */
>>
>> This comment should probably clarify that the page_size field is only
>> valid when cfg_type is VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, assuming
>> that's the case. Or should the device be expected to provide the
>> page_size for all capabilities regardless of type?
>>
>> It seems like the name should also ideally make it clearer that this
>> is page_size/4096 rather than the actual page size to avoid confusing
>> device implementers.
>
> Alternatively, this could be represented as a single u8 page_shift,
> where page_size =3D 1 << (page_shift + 12), and then existing devices
> would "just work" (assuming they filled the padding with 0). It is
> probably still a good idea to guard it with a feature bit, though, so
> it doesn't really make that much difference.

I actually considered not using a feature bit and just behave like this,
but then I've noticed that, for the mmio transport, it would mean
reading from a new register. Some VMMs may overreact to the unexpected
read and crash or, even if they don't, it's not guaranteed they aren't
going to return garbage in response. So I think it's better being a bit
conservative and protect the behavior behind a feature bit.

Thanks,
Sergio.

