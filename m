Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE1A352FD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB45B10EBCC;
	Fri, 14 Feb 2025 00:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gHYoA3Y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AFA10E0FD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 19:32:18 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-220d27d490dso3305905ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739475137; x=1740079937;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lHPT8j19eeATQvpAXIQ4iMz+8wtwWzqZEPxJSsWFp70=;
 b=gHYoA3Y0oTT2kOc5urjjC+CHkgQvuZxUH7nCRLp1js8UxvvBJ1+qryVwRzqfSWjjrH
 8s21cwug7IJvJ1KBZhByY9dGJIpd01zWn5VQEPhzSQPzMPUduoW7TqX/rc/40lmpHW6i
 xFy9FQwrQgSjf/agHMNTRzCNyJf29t70JCQbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739475137; x=1740079937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lHPT8j19eeATQvpAXIQ4iMz+8wtwWzqZEPxJSsWFp70=;
 b=ZN0plKW0Yn932rDpjJru3w4GD1nzhVIE7hFfPZyZ0eRYQBs5qSaNST12bCW+918gVH
 S7aVMkceC79fpL4o3myOKg6CRDq+r9gafKdvwYcgC+7CKHR5OBxrvRtfFtdo4arszzgc
 Axb9QTmx+RsnUdj9LNWW9Pk2jP+e+VYHnc0jfN6i9fIxq99h2poVw/xouOi6w2fQtMzE
 JRC9Dn13R/XEGq4rPk1Hx6dTqrbPOA8TaJ529NBOhXyNOQSxPXUI7mXZ7Sa40e8K90Ep
 zRiwOn/UFP/hObVANlgozFHt3roLkX8Yjt2tSIdzpCF7ueyM6Sza7oFFmH7vaFn7M5QR
 D6Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXunWFcbM3y7iADi35b58MPNPYU+nZj4uRJsRcsM3s/zpjGdfw/QJEwEgCr8bx2yICeRiMQVKwbcSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp6QVvTKbjE6J2pScoH4miggUJXCGVsDAvLslFv8Ejhl2AEbp0
 NQn1NOhjFLznx7cV9BYpfYBecYNpKnxLAn8ucccfRV/bFbMHBbniU/lnqzZt5XWMkYVwR2OZT+8
 iMg==
X-Gm-Gg: ASbGnculKZea/QZA3+9QmCJao3QmECOIpP2gPnUCqrPYm59+45C36t9Wy4arM7QOez9
 4HboiDsFV88641Y6VU/gHrZ+If0ZGebPWaZJoo4pOJe3QWdcO0fgqXw5gFQAY5rQkrrCaVvi3fS
 FVNjeu8TVysUIyLp+OSd62ognrGF+OOmo2JOPDCbIZ6WqW37xUQ9vb1UKKhXMijQVIAmfyx9XLi
 O1VVDUcMhgm1wM97zgWDWq3Iu9yxiJ6JxNc70qSspAWT29whM1if39F0uyU1Vyzk7iTYPDhe5Y6
 GpkTPuEya/+e9XD6le1eq99C+8OXZ8VchYTR2yNEK3LGrYVXuaQXxL4Gges=
X-Google-Smtp-Source: AGHT+IEv/RVUujcdPCjBBwdYVKEkFu49n17dj4PYUfCWtEBt43FMcRappBJAgqUreKcNIhOKlFhj2g==
X-Received: by 2002:a17:902:d483:b0:215:8d29:af0b with SMTP id
 d9443c01a7336-220ece3fc33mr1005605ad.14.1739475137579; 
 Thu, 13 Feb 2025 11:32:17 -0800 (PST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556d3a6sm15739545ad.160.2025.02.13.11.32.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 11:32:16 -0800 (PST)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-21f92258aa6so33135465ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXk8lJHmlU3tXyfwYtoRQzWryC1ccCxTehNeO4uUru/Tt4/1wtJeXyWrw5g1S1+ss9i5glCK9pZ7gU=@lists.freedesktop.org
X-Received: by 2002:a17:902:da92:b0:21b:b3c9:38ff with SMTP id
 d9443c01a7336-220bbc5a245mr127466175ad.37.1739475134479; Thu, 13 Feb 2025
 11:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
 <20250213-virtio-shm-page-size-v1-3-5ee1f9984350@redhat.com>
 <CABVzXA=r=X+GYnSxgeyktKzfKCW2DW+v++c4v_+BHBDHZ_Bzyw@mail.gmail.com>
In-Reply-To: <CABVzXA=r=X+GYnSxgeyktKzfKCW2DW+v++c4v_+BHBDHZ_Bzyw@mail.gmail.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Thu, 13 Feb 2025 11:31:47 -0800
X-Gmail-Original-Message-ID: <CABVzXAkFPr-GiALnk2v53CzX0b5Y0yG=KoRoOFR7fy98Xeyb3w@mail.gmail.com>
X-Gm-Features: AWEUYZk5k0yVhKRl6x_CJTphuuoRNXkv7QK8mgqxAE6j9hp4qpFVaj_QTvwQhdQ
Message-ID: <CABVzXAkFPr-GiALnk2v53CzX0b5Y0yG=KoRoOFR7fy98Xeyb3w@mail.gmail.com>
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

On Thu, Feb 13, 2025 at 11:22=E2=80=AFAM Daniel Verkamp <dverkamp@chromium.=
org> wrote:
>
> On Thu, Feb 13, 2025 at 7:54=E2=80=AFAM Sergio Lopez <slp@redhat.com> wro=
te:
> >
> > Turn the 16 bit padding into a page_size field to allow the device to
> > pass its required page size with format PAGE_SIZE >> 12.
> >
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  drivers/virtio/virtio_pci_modern.c | 29 +++++++++++++++++++++++++----
> >  include/uapi/linux/virtio_pci.h    |  2 +-
> >  2 files changed, 26 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio=
_pci_modern.c
> > index 79616ce5057bf3b2b88cae7e8fb7729efa9dd632..26e9cd5148c0f10209c34d1=
2e65d64490a855d75 100644
> > --- a/drivers/virtio/virtio_pci_modern.c
> > +++ b/drivers/virtio/virtio_pci_modern.c
> [...]
> > +               if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
> > +                       pci_read_config_word(dev, pos + offsetof(struct=
 virtio_pci_cap,
> > +                                                                page_s=
ize), &res_psize);
> > +                       if (!res_psize) {
> > +                               dev_err(&dev->dev, "%s: shm cap with in=
valid page size on "
> > +                                       "a device with VIRTIO_F_SHM_PAG=
E_SIZE feature\n",
> > +                                       __func__);
>
> Maybe this should also constrain the page size to be a power of 2?
>
> [...]
> > diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virti=
o_pci.h
> > index 8549d4571257142ac6c9dad5c01369923791a85a..fb0ccb7a125d8178c1f7833=
3c4d2f43540e1764b 100644
> > --- a/include/uapi/linux/virtio_pci.h
> > +++ b/include/uapi/linux/virtio_pci.h
> > @@ -127,7 +127,7 @@ struct virtio_pci_cap {
> >         __u8 cfg_type;          /* Identifies the structure. */
> >         __u8 bar;               /* Where to find it. */
> >         __u8 id;                /* Multiple capabilities of the same ty=
pe */
> > -       __u8 padding[2];        /* Pad to full dword. */
> > +       __u16 page_size;        /* Device page size (PAGE_SIZE >> 12). =
*/
>
> This comment should probably clarify that the page_size field is only
> valid when cfg_type is VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, assuming
> that's the case. Or should the device be expected to provide the
> page_size for all capabilities regardless of type?
>
> It seems like the name should also ideally make it clearer that this
> is page_size/4096 rather than the actual page size to avoid confusing
> device implementers.

Alternatively, this could be represented as a single u8 page_shift,
where page_size =3D 1 << (page_shift + 12), and then existing devices
would "just work" (assuming they filled the padding with 0). It is
probably still a good idea to guard it with a feature bit, though, so
it doesn't really make that much difference.

Thanks,
-- Daniel
