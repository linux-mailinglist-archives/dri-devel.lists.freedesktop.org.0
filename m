Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6CB94B187
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BB910E20C;
	Wed,  7 Aug 2024 20:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bb/ufnk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5929A10E20C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 20:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723063247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NuT7wPEgPegJMdZEEQjcUmkz4FbQk34dp23i6B4YFbM=;
 b=Bb/ufnk2XD9i866XW1ip5xypTf6HjwpmvKbHDTLKY194Rwyg6ghxPHueiXIEDC0xkIiaF6
 iYMQcwon0djtW6CfUKshqVX2pu9ucCQHymz3wWsbhHkf5EDsyTc07NZ3ix8Wt6leDzeGwF
 +xraer4WVCP9fWc8vxrSBdoFzR68bA0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-qjKBbCxzOvWVfA1qSnjMmQ-1; Wed, 07 Aug 2024 16:40:45 -0400
X-MC-Unique: qjKBbCxzOvWVfA1qSnjMmQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-650b621f4cdso5082917b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 13:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723063245; x=1723668045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NuT7wPEgPegJMdZEEQjcUmkz4FbQk34dp23i6B4YFbM=;
 b=ELZT1+mK0FPX3CsbhQJBCi3GV7r2IpOtQ/08e1SSSwglpktNW3FpIA6obplu95XNxa
 3cUZHz4WFy6eH+p1FmJtQPqht5AhHRo6LofvAoFidIx8fur/3Vc30Hy2F+y2UNSZxb69
 EUxyZzGsKQUukVM441wJOD4/2vYocvp40ItWRMkpflVCXzg3P42aN3BFTTQt7gt2bsd1
 +YGsZLFBt9fYHOq4HEv194J1AY/ZgVSJOk05tieejzMwMrJ6E5ryKAWDe9kGnajq05tc
 2SjlTAtZJJdmsL1aFwOLh9k90/2DyWw4KF9L0FMDmQwSVimaD++EoLJwhOxTB4OV9uV4
 sa/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHIpulXFjnvlAMsACy2lD5s61s/9XDKjv7zYh92+votJTPFd0wXAtvu2DXJY4Yirh32KbiUxX7Ed5l8JZxa9rK1mMs46XBlx1FAXTBlqkN
X-Gm-Message-State: AOJu0Yy6IgtvoSg03BCSQSsF5qZRTlUP7K3hQsZuqqByMfgnFkFnUTtA
 94Ab/Uc8HJ8+2lvQvvv868E/E0GWGtGu/rnkOtLu3NHT6VAPpcgII3PfsTssashuIPB1EBXD4Fh
 ZA2E4uSaBvy1gJU6v9kCeOpDG4Sey7YreSYZZUMksTJEAOm3x5V/wpefuTQfZrLs1AwVikSmnl4
 7irnQVStld+9/2YNXflGVFSTJAajf3oSgX7bR9zWBq
X-Received: by 2002:a05:6902:108f:b0:e0b:e6da:83f2 with SMTP id
 3f1490d57ef6-e0be6da8570mr20071289276.22.1723063245078; 
 Wed, 07 Aug 2024 13:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7o6e1QQzQm+QZaPjztNenu/RRqVV+1JEdYvx5ZzNxvqvMPsnDM1pqizaWMoZmY8u96PT7o6OULbbwhXo7QHM=
X-Received: by 2002:a05:6902:108f:b0:e0b:e6da:83f2 with SMTP id
 3f1490d57ef6-e0be6da8570mr20071263276.22.1723063244750; Wed, 07 Aug 2024
 13:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240807083018.8734-2-pstanner@redhat.com>
 <20240807202431.GA110503@bhelgaas>
In-Reply-To: <20240807202431.GA110503@bhelgaas>
From: David Airlie <airlied@redhat.com>
Date: Thu, 8 Aug 2024 06:40:31 +1000
Message-ID: <CAMwc25q+SnSBFfuKcmw8W39CmsLn4V0ZCuuSbkGTc961WRGhoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: Deprecate pcim_iomap_regions() in favor of
 pcim_iomap_region()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
X-Mimecast-Spam-Score: 0
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

On Thu, Aug 8, 2024 at 6:33=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Wed, Aug 07, 2024 at 10:30:18AM +0200, Philipp Stanner wrote:
> > pcim_iomap_regions() is a complicated function that uses a bit mask to
> > determine the BARs the user wishes to request and ioremap. Almost all
> > users only ever set a single bit in that mask, making that mechanism
> > questionable.
> >
> > pcim_iomap_region() is now available as a more simple replacement.
> >
> > Make pcim_iomap_region() a public function.
> >
> > Mark pcim_iomap_regions() as deprecated.
> >
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>
> The interesting part of this little series is in ast_drv.c, but there
> may be similar conversions for other drivers coming as well.
>
> To avoid races during the merge window, I propose merging this via the
> PCI tree so I can ensure that any other conversions happen after
> pcim_iomap_region() becomes public.
>
> That would require an ack from Dave.  But if you'd rather take this
> yourself, Dave, here's my ack for the PCI piece:
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I'm fine with it going in via pci.

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.

>
> > ---
> >  drivers/pci/devres.c | 8 ++++++--
> >  include/linux/pci.h  | 2 ++
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> > index 3780a9f9ec00..89ec26ea1501 100644
> > --- a/drivers/pci/devres.c
> > +++ b/drivers/pci/devres.c
> > @@ -728,7 +728,7 @@ EXPORT_SYMBOL(pcim_iounmap);
> >   * Mapping and region will get automatically released on driver detach=
. If
> >   * desired, release manually only with pcim_iounmap_region().
> >   */
> > -static void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
> > +void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
> >                                      const char *name)
> >  {
> >       int ret;
> > @@ -761,6 +761,7 @@ static void __iomem *pcim_iomap_region(struct pci_d=
ev *pdev, int bar,
> >
> >       return IOMEM_ERR_PTR(ret);
> >  }
> > +EXPORT_SYMBOL(pcim_iomap_region);
> >
> >  /**
> >   * pcim_iounmap_region - Unmap and release a PCI BAR
> > @@ -783,7 +784,7 @@ static void pcim_iounmap_region(struct pci_dev *pde=
v, int bar)
> >  }
> >
> >  /**
> > - * pcim_iomap_regions - Request and iomap PCI BARs
> > + * pcim_iomap_regions - Request and iomap PCI BARs (DEPRECATED)
> >   * @pdev: PCI device to map IO resources for
> >   * @mask: Mask of BARs to request and iomap
> >   * @name: Name associated with the requests
> > @@ -791,6 +792,9 @@ static void pcim_iounmap_region(struct pci_dev *pde=
v, int bar)
> >   * Returns: 0 on success, negative error code on failure.
> >   *
> >   * Request and iomap regions specified by @mask.
> > + *
> > + * This function is DEPRECATED. Do not use it in new code.
> > + * Use pcim_iomap_region() instead.
> >   */
> >  int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *nam=
e)
> >  {
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 4cf89a4b4cbc..fc30176d28ca 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -2292,6 +2292,8 @@ static inline void pci_fixup_device(enum pci_fixu=
p_pass pass,
> >  void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long =
maxlen);
> >  void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
> >  void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
> > +void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
> > +                                    const char *name);
> >  int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *nam=
e);
> >  int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
> >                                  const char *name);
> > --
> > 2.45.2
> >
>

