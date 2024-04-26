Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17A8B31FB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 10:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C8611AAC3;
	Fri, 26 Apr 2024 08:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iUu67gYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786F112292
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714118829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGAcZesai+U0xVAWvA7J/MAJQ7c0rregms0Ggpsl5S0=;
 b=iUu67gYVsOfcyjG+kN3vXsAneSSnXQkTVp9hfFTqttetZvbqD2FJIP0w/pGLoKykusMSgJ
 lZm92ZXTg09PD58PrG7IzWi32fqknR0KAfpDVvjz1+KJl88UGqzI+pF6zB0G+s0yE4a+F8
 No+6drArGznBHC5gFVATD0FULwLFf0Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-YXh2vw-4OtqGyy06tTnu7Q-1; Fri, 26 Apr 2024 04:07:07 -0400
X-MC-Unique: YXh2vw-4OtqGyy06tTnu7Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-434ed2e412fso5817441cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 01:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714118827; x=1714723627;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TGAcZesai+U0xVAWvA7J/MAJQ7c0rregms0Ggpsl5S0=;
 b=DHa8vmK29OWO8JxO8ssu/7mLsWsrumJWR1cxfsjTHl92q6ZxVOc0m3MM9X4BNZ0oA/
 fB1z3NKxLZK8PCjTikRVQhX+oshDGuv1qZABb075m/sI2eBYngFy5PAQoEmUGfDU35jc
 F4zwRquHbAdLgKULH5s4IiBY/lFqgqLg7fEDUcJDYbabisWuR7OX6ko5WNqN85eFwlkb
 MzjEp6842HQ67RXqTaIBp1ywQUlxQf4jkZpRA+ytiy7mgDl017ilbbtNSzmnj509G+fB
 9XoWTHKIrdKolVz4uqr4v24LxSyEBkQAprSxwwTcpm5dml0Y59mikqCFjHJAdrD/2g/c
 7x1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYMwzCyxncxbUuzTxAtBgzDLl5XfCR2J9RsPUNXaV9A55IbyMd2HeCHjCBUEgZpr9KkgfQQtRpP0C3YbMDvaY2kC6vn8sRa9CXPDnMGu/F
X-Gm-Message-State: AOJu0YxUmPwnOzgog7uqbXSNPQvumhCckuaZeesf+IjBn5uaTZqMVCSH
 u6GY4UO3t+zdF+705CL6k1hWd96uj12wndN0/FwWfoaXIv4rRJbKkR1ip6ZQ6pYqK59wHQTnKKw
 tQcmgdiNRNR6zxrCH0kiS2+nhSKaD7zUi/FTXamSAJXlL4S7QFhp1NHlTljoe8Iq8sw==
X-Received: by 2002:a05:6214:4008:b0:6a0:b2e4:583c with SMTP id
 kd8-20020a056214400800b006a0b2e4583cmr268858qvb.3.1714118827152; 
 Fri, 26 Apr 2024 01:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9/G3aBbIJJGde1rRzmHIwatW3ktBZ39Vo5CZV6c+UaHMj1uKk0ppHJzc4RWsj3GbzINlW+w==
X-Received: by 2002:a05:6214:4008:b0:6a0:b2e4:583c with SMTP id
 kd8-20020a056214400800b006a0b2e4583cmr268820qvb.3.1714118826480; 
 Fri, 26 Apr 2024 01:07:06 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a0c9a92000000b0069f77a0079fsm7761670qvd.34.2024.04.26.01.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:07:06 -0700 (PDT)
Message-ID: <77ee27e2f155abd340b166e2856181577fdf08cc.camel@redhat.com>
Subject: Re: [PATCH v6 00/10] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Fri, 26 Apr 2024 10:07:02 +0200
In-Reply-To: <20240424201229.GA503230@bhelgaas>
References: <20240424201229.GA503230@bhelgaas>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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

On Wed, 2024-04-24 at 15:12 -0500, Bjorn Helgaas wrote:
> On Mon, Apr 08, 2024 at 10:44:12AM +0200, Philipp Stanner wrote:
> > ...
> > PCI's devres API suffers several weaknesses:
> >=20
> > 1. There are functions prefixed with pcim_. Those are always
> > managed
> > =C2=A0=C2=A0 counterparts to never-managed functions prefixed with pci_=
 =E2=80=93 or
> > so one
> > =C2=A0=C2=A0 would like to think. There are some apparently unmanaged
> > functions
> > =C2=A0=C2=A0 (all region-request / release functions, and pci_intx()) w=
hich
> > =C2=A0=C2=A0 suddenly become managed once the user has initialized the =
device
> > with
> > =C2=A0=C2=A0 pcim_enable_device() instead of pci_enable_device(). This
> > "sometimes
> > =C2=A0=C2=A0 yes, sometimes no" nature of those functions is confusing =
and
> > =C2=A0=C2=A0 therefore bug-provoking. In fact, it has already caused a =
bug in
> > DRM.
> > =C2=A0=C2=A0 The last patch in this series fixes that bug.
> > 2. iomappings: Instead of giving each mapping its own callback, the
> > =C2=A0=C2=A0 existing API uses a statically allocated struct tracking o=
ne
> > mapping
> > =C2=A0=C2=A0 per bar. This is not extensible. Especially, you can't cre=
ate
> > =C2=A0=C2=A0 _ranged_ managed mappings that way, which many drivers wan=
t.
> > 3. Managed request functions only exist as "plural versions" with a
> > =C2=A0=C2=A0 bit-mask as a parameter. That's quite over-engineered
> > considering
> > =C2=A0=C2=A0 that each user only ever mapps one, maybe two bars.
> >=20
> > This series:
> > - add a set of new "singular" devres functions that use devres the
> > way
> > =C2=A0 its intended, with one callback per resource.
> > - deprecates the existing iomap-table mechanism.
> > - deprecates the hybrid nature of pci_ functions.
> > - preserves backwards compatibility so that drivers using the
> > existing
> > =C2=A0 API won't notice any changes.
> > - adds documentation, especially some warning users about the
> > =C2=A0 complicated nature of PCI's devres.
>=20
> There's a lot of good work here; thanks for working on it.

Thanks!
Good to get some more feedback from you

>=20
> > Philipp Stanner (10):
> > =C2=A0 PCI: Add new set of devres functions
>=20
> This first patch adds some infrastructure and several new exported
> interfaces:
>=20
> =C2=A0 void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
> const char *name)
> =C2=A0 void pcim_iounmap_region(struct pci_dev *pdev, int bar)
> =C2=A0 int pcim_request_region(struct pci_dev *pdev, int bar, const char
> *name)
> =C2=A0 void pcim_release_region(struct pci_dev *pdev, int bar)
> =C2=A0 void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
> =C2=A0 void __iomem *pcim_iomap_region_range(struct pci_dev *pdev, int
> bar,
> =C2=A0 void pcim_iounmap_region_range(struct pci_dev *pdev, int bar,
>=20
> > =C2=A0 PCI: Deprecate iomap-table functions
>=20
> This adds a little bit of infrastructure (add/remove to
> legacy_table),
> reimplements these existing interfaces:
>=20
> =C2=A0 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned
> long maxlen)
> =C2=A0 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
> =C2=A0 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char
> *name)
> =C2=A0 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
> =C2=A0 void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
>=20
> and adds a couple new exported interfaces:
>=20
> =C2=A0 void pcim_release_all_regions(struct pci_dev *pdev)
> =C2=A0 int pcim_request_all_regions(struct pci_dev *pdev, const char
> *name)
>=20
> There's a lot going on in these two patches, so they're hard to
> review.=C2=A0 I think it would be easier if you could do the fixes to
> existing interfaces first,

I agree that the patches can be further split into smaller chunks to
make them more atomic and easier to review. I can do that.

BUT I'd need some more details about what you mean by "do the fixes
first" =E2=80=93 which fixes?
The later patches at least in part rely on the new better functions
being available.


> followed by adding new things, maybe
> something like separate patches that:
>=20
> =C2=A0 - Add pcim_addr_devres_alloc(), pcim_addr_devres_free(),
> =C2=A0=C2=A0=C2=A0 pcim_addr_devres_clear().
>=20
> =C2=A0 - Add pcim_add_mapping_to_legacy_table(),
> =C2=A0=C2=A0=C2=A0 pcim_remove_mapping_from_legacy_table(),
> =C2=A0=C2=A0=C2=A0 pcim_remove_bar_from_legacy_table().
>=20
> =C2=A0 - Reimplement pcim_iomap(), pcim_iomap_regions(), pcim_iounmap().
>=20
> =C2=A0 - Add new interfaces like pcim_iomap_region(),
> =C2=A0=C2=A0=C2=A0 pcim_request_region(), etc.
>=20
> =C2=A0=C2=A0=C2=A0 AFAICS, except for pcim_iomap_range() (used by vbox), =
these new
> =C2=A0=C2=A0=C2=A0 interfaces have no users outside drivers/pci, so ... w=
e might
> =C2=A0=C2=A0=C2=A0 defer adding them, or at least defer exposing them via
> =C2=A0=C2=A0=C2=A0 include/linux/pci.h, until we have users for them.

Dropping (the export of) functions like pcim_request_region_range() or
pcim_request_all_regions() is not a problem.

What I quite fundamentally have to disagree with, however, is not to
export the functions=C2=A0

 * pcim_request_region()
 * pcim_iomap_region()

the main point of this series is to deprecate that hybrid nature of
those existing pci_* functions. You can only deprecate something when
you provide users with new, better alternatives.

Not exporting them would inevitably tempt driver programmers into using
pcim_enable_device() + pci_*() as they did so far, which caused at
least that leak in vboxvideo and another one that my plan was to
address after we got this merged.

Once we have those new pcim_ functions exported, we could successively
port the older drivers which use the aforementioned combination with
pcim_enable_device().
Then we could drop the hybrid nature of pci_ functions once and for all
and would end up with a consistent, clean API.

I intended to do that over the months after we merged this.

So I'd suggest let me cancel the export of the "luxury functions" and
let's keep the two listed above exported


P.

>=20
> > =C2=A0 PCI: Warn users about complicated devres nature
> > =C2=A0 PCI: Make devres region requests consistent
> > =C2=A0 PCI: Move dev-enabled status bit to struct pci_dev
> > =C2=A0 PCI: Move pinned status bit to struct pci_dev
> > =C2=A0 PCI: Give pcim_set_mwi() its own devres callback
> > =C2=A0 PCI: Give pci(m)_intx its own devres callback
> > =C2=A0 PCI: Remove legacy pcim_release()
> > =C2=A0 drm/vboxvideo: fix mapping leaks
> >=20
> > =C2=A0drivers/gpu/drm/vboxvideo/vbox_main.c |=C2=A0=C2=A0 20 +-
> > =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1011
> > +++++++++++++++++++++----
> > =C2=A0drivers/pci/iomap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 18 +
> > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 123 ++-
> > =C2=A0drivers/pci/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 21 +-
> > =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 18 +-
> > =C2=A06 files changed, 999 insertions(+), 212 deletions(-)
> >=20
> > --=20
> > 2.44.0
> >=20
>=20

