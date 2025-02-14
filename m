Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CAAA359BE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B96B10EC0C;
	Fri, 14 Feb 2025 09:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MlKhOzkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893710EC15
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739524159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+nbout4lsz7dbdgL7U1+4YNWasydkL0pPSm+7Ne+0E=;
 b=MlKhOzkp6jO5mQ0zXEsR53Tx1NFXt5V5hmVKGVLpXe5lRGb7pF1xFTITD20Y/QjOSbGEZj
 /ty4lBIhhbyc91nuPbBI5/9+Il/3i9cs9SUX3CfUl3fdggLU44mDbsA3p/0oxPGQg9+Bzo
 LlSaVwxtyGllUAwz4UnA6+5ic3E4ng4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-pNqPICulOVahQ2foOvKp1w-1; Fri, 14 Feb 2025 04:09:17 -0500
X-MC-Unique: pNqPICulOVahQ2foOvKp1w-1
X-Mimecast-MFC-AGG-ID: pNqPICulOVahQ2foOvKp1w
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2fc2b258e82so1620626a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 01:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739524156; x=1740128956;
 h=content-transfer-encoding:cc:to:subject:message-id:date
 :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/+nbout4lsz7dbdgL7U1+4YNWasydkL0pPSm+7Ne+0E=;
 b=vbvHGcySWZBiAPlD2N3/asiRe5G1WXHzQ4zQxSy5AiC3EVuZowGJFzPRchTZ54l95S
 awayEmL4FzzCgP2B+PyO0kiDf5klQew7tkXCLQyXIIuww03LwlwmKoFtP0DPNVCkch81
 0LAg9m7qPFb7UmezxQR6S79EvTjW+uG+l6NPGPoxZs77rsF7lbQcxP4sXdAUDjwMuK2/
 cWZYn/TpQwEuf48nvf+X+oSsu3syGIfCuW4i35oB3Ss4o0hAxYD26d4pzqR5q12nT7GR
 ba7YKBvPqYQq9dxg2SUG8hVYbeVAyB+txD0YSDTF0EU64L0vjd4JKkYdnYwKHFYMhmVV
 sCfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6U9BIyJvH2CZq2W95sY8Mn7vH1MXEX4MqrcYCI6OFSwMIXhhgGbVerawL/nmdEJ4UHMdU1y1NzAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy23A8HbD3v58kIn4pRi01X6y4meGVAhQNnjnK0LLM9XghoOgm9
 hjldriayB13AYLVge7ytsvVe1GrBMpbu0pixe8jZOM81B2wic0YgvZ6pffvD1S2dG3aRFFqkSeB
 Yke/xM0g3Is3ezjqUDj2YxQPTTzrrPZFiapJ1wSZ5Mp3mTQ5wFh8CP3rL1KT4WT2AG50iy3E7bg
 lc7vdDRPnJpYWojTWUy3keXVZ4Bbe0o0iU+cDekcQm
X-Gm-Gg: ASbGncvxQblrPEZYB8JDUkxzsYii4GMUSFshGMiRdc7Qrvp3EccWmH22bBQyrAILOWs
 D2xmw3ZxAJUbwp1d2iIaS8i7YThcw1zYmyQbJ/KhbXn+OzE+ZAGP37mPZTw==
X-Received: by 2002:a17:90b:23cf:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-2fbf5adefb1mr18493339a91.0.1739524156702; 
 Fri, 14 Feb 2025 01:09:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfBgLIwyh2FsWpWhHAyE4zl/I82er44UopncdtHfHPjqZPaXeOHlFpwjXqLXDv7MngbAIpn83RTELo7JIUQoE=
X-Received: by 2002:a17:90b:23cf:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-2fbf5adefb1mr18493302a91.0.1739524156373; Fri, 14 Feb 2025
 01:09:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Feb 2025 01:09:14 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CABVzXA=r=X+GYnSxgeyktKzfKCW2DW+v++c4v_+BHBDHZ_Bzyw@mail.gmail.com>
References: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
 <20250213-virtio-shm-page-size-v1-3-5ee1f9984350@redhat.com>
 <CABVzXA=r=X+GYnSxgeyktKzfKCW2DW+v++c4v_+BHBDHZ_Bzyw@mail.gmail.com>
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 01:09:14 -0800
X-Gm-Features: AWEUYZkUHPoBM7Ip5aSx6k-wlgqT6hg27bhkTyFnhLlZU7B6wD2b2Y1SLRAiVHo
Message-ID: <CAAiTLFVZGNi-i-qCZZcoyX6Hfgtz+NMAQSq-OHE4Q0n+kvsc2A@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: Dbu3JuuK08KrJ6YJyx0m_T4Ixxxa-e0wI0VtBYB_Gig_1739524157
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

> On Thu, Feb 13, 2025 at 7:54=E2=80=AFAM Sergio Lopez <slp@redhat.com> wro=
te:
>>
>> Turn the 16 bit padding into a page_size field to allow the device to
>> pass its required page size with format PAGE_SIZE >> 12.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>>  drivers/virtio/virtio_pci_modern.c | 29 +++++++++++++++++++++++++----
>>  include/uapi/linux/virtio_pci.h    |  2 +-
>>  2 files changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_=
pci_modern.c
>> index 79616ce5057bf3b2b88cae7e8fb7729efa9dd632..26e9cd5148c0f10209c34d12=
e65d64490a855d75 100644
>> --- a/drivers/virtio/virtio_pci_modern.c
>> +++ b/drivers/virtio/virtio_pci_modern.c
> [...]
>> +               if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
>> +                       pci_read_config_word(dev, pos + offsetof(struct =
virtio_pci_cap,
>> +                                                                page_si=
ze), &res_psize);
>> +                       if (!res_psize) {
>> +                               dev_err(&dev->dev, "%s: shm cap with inv=
alid page size on "
>> +                                       "a device with VIRTIO_F_SHM_PAGE=
_SIZE feature\n",
>> +                                       __func__);
>
> Maybe this should also constrain the page size to be a power of 2?
>
> [...]
>> diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio=
_pci.h
>> index 8549d4571257142ac6c9dad5c01369923791a85a..fb0ccb7a125d8178c1f78333=
c4d2f43540e1764b 100644
>> --- a/include/uapi/linux/virtio_pci.h
>> +++ b/include/uapi/linux/virtio_pci.h
>> @@ -127,7 +127,7 @@ struct virtio_pci_cap {
>>         __u8 cfg_type;          /* Identifies the structure. */
>>         __u8 bar;               /* Where to find it. */
>>         __u8 id;                /* Multiple capabilities of the same typ=
e */
>> -       __u8 padding[2];        /* Pad to full dword. */
>> +       __u16 page_size;        /* Device page size (PAGE_SIZE >> 12). *=
/
>
> This comment should probably clarify that the page_size field is only
> valid when cfg_type is VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, assuming
> that's the case. Or should the device be expected to provide the
> page_size for all capabilities regardless of type?

Only for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, I'll clarify that in the
comment.

> It seems like the name should also ideally make it clearer that this
> is page_size/4096 rather than the actual page size to avoid confusing
> device implementers.

I like your suggestion in the other email of turning this into
page_shift, which clarifies the field contents and also addresses the
need check the constrains you highlighted above. I'll do that in v2.

Thanks!
Sergio.

