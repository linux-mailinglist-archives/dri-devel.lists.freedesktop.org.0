Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45391529D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2F610E089;
	Mon, 24 Jun 2024 15:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dDG/0Pa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD7D10E089;
 Mon, 24 Jun 2024 15:37:40 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso5022648a12.1; 
 Mon, 24 Jun 2024 08:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719243458; x=1719848258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQc+e+I6ia7/ogMpB2OJkI6aQ1tlYzw7cUiWzpvi62U=;
 b=dDG/0Pa3JD24+ugRI0cBh8/xUUfOeXCQqN4IDBI8eUD8WMbFNEFHpx7U9Ua9YvMngw
 i9H2Fzp5NeufFloGc/4JCJE4864XqPU/xhPvasF7yJpBnfER49sh0Nkm9saMj2Y4o9j1
 +IrNfQlVMdZ0eY7BlOOSV+nZRunwqTxxi8KrQpaKJOk/kjAd53JbrIlmQXIL+02LEgE3
 VtJEloGqWCobKlqIl8/LrfRt/0yUyNXNHgL7flsy+nme6/N12nGFnYvyzfRCHfPWI5QG
 4lkyev5bkKL6yVj6wnBBX+AsF5M5yZkD3cWqgq/30zhZq+LB4uFp9999wwuPDpvcepTC
 2kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719243458; x=1719848258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQc+e+I6ia7/ogMpB2OJkI6aQ1tlYzw7cUiWzpvi62U=;
 b=SSQHlCqnUd0EoYx0oOxSoOuvrGVUmK7ZYRPm6jHbj07Ll7j5dQM8FxU7RiwF+1rbZQ
 Yvz6pSw3VlmxVJVFLq0TKFzkUb5hvtg8Yx9Fzu6NIflsLDM7GIEftO4ujNCT8NxQ/nsb
 KEZ277DTda3Aesll4tQI073BE5ahD/EQZk8Bze7RVbG7K3MGbU3IP3F2+FdGUkghJn/0
 icN2DEbxev0chAqGSnaTUi+ojWcNMMePbx9w/I14UVHHwHw7n7afwTo9JPWHYOrwK/Ok
 OarGhMj3eVoUOngdkg3w+FPpJUbkADf0OZw90nmA4eobF12bJ9pQQkb0dQVkKRAz5/sj
 tkQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULTyVqkGk6Fa9NHClV9HEvjDubbnCSoUXfSe5zK7kjlY+9eh7HfzhYayIv5xkhKxCxw1OVV8wr3ZBywe8NhVRwGSG2czR+GTkTIyyoxXnv
X-Gm-Message-State: AOJu0YzqS5MTirOKD5kAcC7vBN5uqlsRgJalcvVNrLP3HSdl48N+WqoK
 nD6IrBZ5WAaPUe2tLMA3kY2I+FvRJycT2QrQf0aS+/kaQnp32wtemK2UbpfmWlYW6U+KLRPAvVW
 XWlYL+GFedHaCCVkC1kaGDsee7DI=
X-Google-Smtp-Source: AGHT+IHEEQxmIHCl7aQptuGI+5uw01VLWA2AyOiSUHqCVl//O6JanrQFmlogbqjX9PEO1AhYjBS3Z5mQrF25LbmaeRY=
X-Received: by 2002:a50:931a:0:b0:57d:2db9:15e8 with SMTP id
 4fb4d7f45d1cf-57d4bdcb3bfmr2974167a12.34.1719243458252; Mon, 24 Jun 2024
 08:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
 <20240624151401.GB8706@willie-the-truck>
In-Reply-To: <20240624151401.GB8706@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 08:37:26 -0700
Message-ID: <CAF6AEGttkHPOsO+NSHZeRXiZBxU_26HZyGMjOZ3-Y8NZUgz0gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
To: Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>, 
 Joao Martins <joao.m.martins@oracle.com>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
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

On Mon, Jun 24, 2024 at 8:14=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add an io-pgtable method to walk the pgtable returning the raw PTEs tha=
t
> > would be traversed for a given iova access.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
> >  include/linux/io-pgtable.h     |  4 +++
> >  2 files changed, 46 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f7828a7aad41..f47a0e64bb35 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgta=
ble_ops *ops, unsigned long iov
> >                               data->start_level, ptep);
> >  }
> >
> > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > -                                      unsigned long iova)
> > +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned =
long iova,
> > +                     int (*cb)(void *cb_data, void *pte, int level),
> > +                     void *cb_data)
> >  {
> >       struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> >       arm_lpae_iopte pte, *ptep =3D data->pgd;
> >       int lvl =3D data->start_level;
> > +     int ret;
> >
> >       do {
> >               /* Valid IOPTE pointer? */
> >               if (!ptep)
> > -                     return 0;
> > +                     return -EFAULT;
>
> nit: -ENOENT might be a little better, as we're only checking against a
> NULL entry rather than strictly any faulting entry.
>
> >               /* Grab the IOPTE we're interested in */
> >               ptep +=3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> > @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct i=
o_pgtable_ops *ops,
> >
> >               /* Valid entry? */
> >               if (!pte)
> > -                     return 0;
> > +                     return -EFAULT;
>
> Same here (and at the end of the function).
>
> > +
> > +             ret =3D cb(cb_data, &pte, lvl);
>
> Since pte is on the stack, rather than pointing into the actual pgtable,
> I think it would be clearer to pass it by value to the callback.

fwiw, I passed it as a void* to avoid the pte size.. although I guess
it could be a union of all the possible pte types

BR,
-R

>
> > +             if (ret)
> > +                     return ret;
> >
> > -             /* Leaf entry? */
> > +             /* Leaf entry?  If so, we've found the translation */
> >               if (iopte_leaf(pte, lvl, data->iop.fmt))
> > -                     goto found_translation;
> > +                     return 0;
> >
> >               /* Take it to the next level */
> >               ptep =3D iopte_deref(pte, data);
> >       } while (++lvl < ARM_LPAE_MAX_LEVELS);
> >
> >       /* Ran out of page tables to walk */
> > +     return -EFAULT;
> > +}
> > +
> > +struct iova_to_phys_walk_data {
> > +     arm_lpae_iopte pte;
> > +     int level;
> > +};
>
> Expanding a little on Robin's suggestion, why don't we drop this structur=
e
> in favour of something more generic:
>
>         struct arm_lpae_walk_data {
>                 arm_lpae_iopte ptes[ARM_LPAE_MAX_LEVELS];
>         };
>
> and then do something in the walker like:
>
>         if (cb && !cb(pte, lvl))
>                 walk_data->ptes[lvl] =3D pte;
>
> which could return the physical address at the end, if it reaches a leaf
> entry. That way arm_lpae_iova_to_phys() is just passing a NULL callback
> to the walker and your debug callback just needs to return 0 (i.e. the
> callback is basically just saying whether or not to continue the walk).
>
> Will
