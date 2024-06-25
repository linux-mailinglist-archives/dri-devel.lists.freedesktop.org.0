Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6C916D37
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 17:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D12D10E12F;
	Tue, 25 Jun 2024 15:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z3yrPOst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79BA10E075;
 Tue, 25 Jun 2024 15:36:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57cc30eaf0aso3441766a12.2; 
 Tue, 25 Jun 2024 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719329781; x=1719934581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ox1lbjwU21POUzsTNWtq+35PHOWR0ci2ck/cLItWRLY=;
 b=Z3yrPOst4aSzketKBImmiXCRUAxB+f+Z9EAGMkCk8qfFx15qq4v2VzGhjT1ShrhMrA
 DRm6kf7tZ0UTpwKniHmorna1BbBN/7QAUK82Nc7Qla5um0MicQLpadkjZ7a/RJzyy/zP
 NOrCMlQzAmtqkyzAgvqPEaNxb5eLhfKfGTm6WCO9yNwjhvbtSE9vFgxvaAHyvVPbF+ro
 zri6do2kIj1zBWhvVA4nHkHKUVgTzCLdAbMXg9r41CkBFFj295Afebl0ZKZipwJamNkw
 3nZH1RvO9sSfEwkgkOA68zZ5ya3ZUPQs499SCfTIOgRmU8NUuB/U3ZZp73CUThquuDt6
 44uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719329781; x=1719934581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ox1lbjwU21POUzsTNWtq+35PHOWR0ci2ck/cLItWRLY=;
 b=WKcxMTMJoQh4HFpKsDyTfbKTyYjEtc1lr6aCcoZJdK5Hcc/ao0U+ZN/3tC3vId0AdX
 rb7jTmfDPJZedI5V66pPOSQhZFTUjGWTtnycgQOyTHjUd0brIq5tEnwdsSGEEql/XG6C
 rldMqQhLAd0nBXyGn1SNFqmUGBVZgkFcGvKiNmhGxr9vOjxP7ig10kftnudQ5iJR617c
 gV1Qp/AWqYsZEzPPT+8CQY7YfcLeSwDnazynKjA1ZID8Ia9CzLZExPhlqCJUP2FXAhFd
 yqVA680EI5YoL8gChuTcfn7ZH/2apHk8vue5Oq6GJxobXl5+ADkEQnP+81+xqQuT4J0e
 6QHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcyCIkuTYqEbafMLKHQol0lHIWKz0aygr77yqOOKbpe0UjMq3R2nl1zaOuSZANGKJTEZUGD+jUfcqwdk1nJM5HCFoQzJED116pT1iRS1Eo
X-Gm-Message-State: AOJu0YyA8KC1c4L82JIZ/LdJTGmwpI03DbMa+BTf/nKN3iD5g3F2Ll+P
 yk+h2RgTqbCPOke15YLI5Laic6JY4EiQxQobWIUNE2cfZy7PSKkakS6Ej6m5suoJQKDirWj3bZ7
 mv31DIAwN2TAmkFi7bOXZoSfrHK8=
X-Google-Smtp-Source: AGHT+IHxpsEaiq7s8p8MnTUzi0PLbTnU1MrdrE7dFVtZiMWrVR2nmXkgwgR1pOTuRiNCFznIg23NJHs+fBN4vaKf6Qw=
X-Received: by 2002:a50:cdd2:0:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-57d4bd8fcf3mr6998806a12.24.1719329780722; Tue, 25 Jun 2024
 08:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
 <20240624151401.GB8706@willie-the-truck>
 <CAF6AEGttkHPOsO+NSHZeRXiZBxU_26HZyGMjOZ3-Y8NZUgz0gA@mail.gmail.com>
 <20240625112703.GA10175@willie-the-truck>
In-Reply-To: <20240625112703.GA10175@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 08:36:08 -0700
Message-ID: <CAF6AEGu-NxM0HO_sKxu_bhAxMEwOZkisPmoouocvisk6ng_6Bg@mail.gmail.com>
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

On Tue, Jun 25, 2024 at 4:27=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Jun 24, 2024 at 08:37:26AM -0700, Rob Clark wrote:
> > On Mon, Jun 24, 2024 at 8:14=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Add an io-pgtable method to walk the pgtable returning the raw PTEs=
 that
> > > > would be traversed for a given iova access.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++--=
----
> > > >  include/linux/io-pgtable.h     |  4 +++
> > > >  2 files changed, 46 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgta=
ble-arm.c
> > > > index f7828a7aad41..f47a0e64bb35 100644
> > > > --- a/drivers/iommu/io-pgtable-arm.c
> > > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > > @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_=
pgtable_ops *ops, unsigned long iov
> > > >                               data->start_level, ptep);
> > > >  }
> > > >
> > > > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *op=
s,
> > > > -                                      unsigned long iova)
> > > > +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsig=
ned long iova,
> > > > +                     int (*cb)(void *cb_data, void *pte, int level=
),
> > > > +                     void *cb_data)
> > > >  {
> > > >       struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(o=
ps);
> > > >       arm_lpae_iopte pte, *ptep =3D data->pgd;
> > > >       int lvl =3D data->start_level;
> > > > +     int ret;
> > > >
> > > >       do {
> > > >               /* Valid IOPTE pointer? */
> > > >               if (!ptep)
> > > > -                     return 0;
> > > > +                     return -EFAULT;
> > >
> > > nit: -ENOENT might be a little better, as we're only checking against=
 a
> > > NULL entry rather than strictly any faulting entry.
> > >
> > > >               /* Grab the IOPTE we're interested in */
> > > >               ptep +=3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> > > > @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(stru=
ct io_pgtable_ops *ops,
> > > >
> > > >               /* Valid entry? */
> > > >               if (!pte)
> > > > -                     return 0;
> > > > +                     return -EFAULT;
> > >
> > > Same here (and at the end of the function).
> > >
> > > > +
> > > > +             ret =3D cb(cb_data, &pte, lvl);
> > >
> > > Since pte is on the stack, rather than pointing into the actual pgtab=
le,
> > > I think it would be clearer to pass it by value to the callback.
> >
> > fwiw, I passed it as a void* to avoid the pte size.. although I guess
> > it could be a union of all the possible pte types
>
> Can you just get away with a u64?

yeah, that wfm if you're ok with it

BR,
-R
