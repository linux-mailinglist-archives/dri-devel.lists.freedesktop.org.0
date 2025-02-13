Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693BA352F6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC0310EBC0;
	Fri, 14 Feb 2025 00:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XZUN6iH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805F410EB87
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 19:23:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-216513f8104so2655475ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739474595; x=1740079395;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KC+znPA2H1vB7HU6VZGH/VUzzp6EPafRFN/wfL/kwkY=;
 b=XZUN6iH8fUJ+zDVkOYvVsd1M3SxtXO+HyDaIp3mQpGM8ejIJUolk7lHCDpiB1m45zg
 olL/KdT9l8oLg1VAfTGoydmvqDSFYsfmuUVA2pumrD9qYbUvc+bN4GKrGhpLEdVLswhf
 Hsm78Vu9k++BRtJRR8X3xrFcarz3qvocNKx3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739474595; x=1740079395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KC+znPA2H1vB7HU6VZGH/VUzzp6EPafRFN/wfL/kwkY=;
 b=QrPo9K0dKmH/K7E1jML54NBmcnHZgX3ypgjQ8lnE199eJAJ9SO7EXuUozuvOPNrk6A
 CCB/MPjvo1eZaFlSHRLzz+33XJHv5xMGGjiXpFI0Zdd5q+ZGd4D4NB9VAfTIeQ75MAuy
 89AJso1GFw+z7Bordb0ZbeJAtdxa3sD+fPBvmjtXHJYGxsM2HRfuWa1bwyBjdOPXd1jR
 fYcFB/RhKZbwD0FZP9nKQGD2thRe/HYaNOKv7wPSjjcNICGsRYQFMMGqBwHtiqFw3R1S
 KSLGMjQX0nMx5uyIebjKKANvBHk674TE/FFjiSpeHD2+UHxycATCrQwBBi8sDJyYUFHy
 2a/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbI2pvCzhGK7WQfzz+oxcD/qlP+HA+3K2lAXafNNBb9PMy/MRDXyMU1N01xxHENIcA3FdCvAIUl6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhZhKCoWmBVH1SZTyWJYcgE3NiZA5DNNgDpGUvS5RvBQUA+n5Y
 YNCT9v0ktQJJp6KXTplrFNuPeLDEnE1OHHVZ+xJYMgB/laWndrIdOw5XQDYt66GGjTcCCmYsk55
 MrQ==
X-Gm-Gg: ASbGnctACq09rTFuforkO4/e09bToZHmTcxK5veFCTEK82+uLcqm5N0CP0p+0tCMP/k
 of1pRxd23C7mqgtXfJWXqvioNqFBPsAWWvTu2qyVUAEMJgu/RhKrv1r3QvNB7Gukg/vQtapXb90
 yMxy7GDV70ie7P3pGKc8oZ/otqxdumc4gIFJLEeEGOA/m88qzFGVhUg52eEqclc9cohC9WlvnUW
 dNMmiErjI9Ry7yqUS30ryVRUNwgP/3+v8s4XWV8Oe3eIaI2y3XmuI/4+Q9JeF5KuHeDcKQ+aXVk
 8SRlrRluBAP3bB02PONVoS4jBaRi5WYAa7y62zTP448yozNmKQmuEvs=
X-Google-Smtp-Source: AGHT+IFgI0tWHhdOrTmdFlqpnDALV2YwEeGuG5T5ut2BQqYp7+zX7VAfkGmUm9EJ14nH5bTMm/LisQ==
X-Received: by 2002:a17:902:d585:b0:220:d71d:4666 with SMTP id
 d9443c01a7336-220ece56b68mr869455ad.13.1739474594736; 
 Thu, 13 Feb 2025 11:23:14 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com.
 [209.85.216.46]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5349077sm15926045ad.1.2025.02.13.11.23.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 11:23:13 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fbf77b2b64so2306621a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:23:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjbs0LaOOfClmKBAfHNJx1vRQDp7yC93YxySJCxecajcabann9UK6HsAUW0SLzw2oDlGP/BvMPu8g=@lists.freedesktop.org
X-Received: by 2002:a17:90b:274e:b0:2fa:17d2:166 with SMTP id
 98e67ed59e1d1-2fbf5c6f900mr11663838a91.31.1739474591586; Thu, 13 Feb 2025
 11:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
 <20250213-virtio-shm-page-size-v1-3-5ee1f9984350@redhat.com>
In-Reply-To: <20250213-virtio-shm-page-size-v1-3-5ee1f9984350@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Thu, 13 Feb 2025 11:22:45 -0800
X-Gmail-Original-Message-ID: <CABVzXA=r=X+GYnSxgeyktKzfKCW2DW+v++c4v_+BHBDHZ_Bzyw@mail.gmail.com>
X-Gm-Features: AWEUYZnbyEFvCjOaJipQpOfb1MF9Gi7XhI32b8q-z-30QmKnx8ZNHSfRGuJzTvI
Message-ID: <CABVzXA=r=X+GYnSxgeyktKzfKCW2DW+v++c4v_+BHBDHZ_Bzyw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] virtio-pci: extend virtio_pci_cap to hold
 page_size
To: Sergio Lopez <slp@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Feb 2025 00:33:52 +0000
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

On Thu, Feb 13, 2025 at 7:54=E2=80=AFAM Sergio Lopez <slp@redhat.com> wrote=
:
>
> Turn the 16 bit padding into a page_size field to allow the device to
> pass its required page size with format PAGE_SIZE >> 12.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  drivers/virtio/virtio_pci_modern.c | 29 +++++++++++++++++++++++++----
>  include/uapi/linux/virtio_pci.h    |  2 +-
>  2 files changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_p=
ci_modern.c
> index 79616ce5057bf3b2b88cae7e8fb7729efa9dd632..26e9cd5148c0f10209c34d12e=
65d64490a855d75 100644
> --- a/drivers/virtio/virtio_pci_modern.c
> +++ b/drivers/virtio/virtio_pci_modern.c
[...]
> +               if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
> +                       pci_read_config_word(dev, pos + offsetof(struct v=
irtio_pci_cap,
> +                                                                page_siz=
e), &res_psize);
> +                       if (!res_psize) {
> +                               dev_err(&dev->dev, "%s: shm cap with inva=
lid page size on "
> +                                       "a device with VIRTIO_F_SHM_PAGE_=
SIZE feature\n",
> +                                       __func__);

Maybe this should also constrain the page size to be a power of 2?

[...]
> diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_=
pci.h
> index 8549d4571257142ac6c9dad5c01369923791a85a..fb0ccb7a125d8178c1f78333c=
4d2f43540e1764b 100644
> --- a/include/uapi/linux/virtio_pci.h
> +++ b/include/uapi/linux/virtio_pci.h
> @@ -127,7 +127,7 @@ struct virtio_pci_cap {
>         __u8 cfg_type;          /* Identifies the structure. */
>         __u8 bar;               /* Where to find it. */
>         __u8 id;                /* Multiple capabilities of the same type=
 */
> -       __u8 padding[2];        /* Pad to full dword. */
> +       __u16 page_size;        /* Device page size (PAGE_SIZE >> 12). */

This comment should probably clarify that the page_size field is only
valid when cfg_type is VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, assuming
that's the case. Or should the device be expected to provide the
page_size for all capabilities regardless of type?

It seems like the name should also ideally make it clearer that this
is page_size/4096 rather than the actual page size to avoid confusing
device implementers.

>         __le32 offset;          /* Offset within bar. */
>         __le32 length;          /* Length of the structure, in bytes. */
>  };
