Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2CAA0E07
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05710E49F;
	Tue, 29 Apr 2025 13:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c2PY34vV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5394710E49E;
 Tue, 29 Apr 2025 13:59:34 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3d93c060279so15099925ab.3; 
 Tue, 29 Apr 2025 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745935173; x=1746539973; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PN2fPM9RQoCTPXB4B9XFqTVhXX0UMZxTQo24wURnSIU=;
 b=c2PY34vVz1erfMYe9JY+W4dWc3yypnKInD/npLso2yG5mYKI/T2sp05OZesf92dKu4
 y6/UMG1V+pwRZUhlFxSerW6fE5pMUQKMH0XP+cHhwlAxZhQlBVAnfQJTDCGMffjMdQQr
 CGnJU31N4ADK20QrDrY3TcR3iyukkgL4NM6QJhInhAFCpuwE3SruE+a+XQjmPZPQjb2r
 MXe/7gVeVAMAe51ZylqX+wjzc9/w444YNHOn8uzTixxeM7dl+lU1GJynSNa+fAAzq1rU
 Yx03KU7/Mu4MTji8hDow4kodCeSSQQBc3KJyGg0wyxnzRbZKQhyEf2jDx8sfWCfFHpZ2
 KTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745935173; x=1746539973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PN2fPM9RQoCTPXB4B9XFqTVhXX0UMZxTQo24wURnSIU=;
 b=VT6GSJamSxMvP1rwCtNlf/bulbTsmS4nfURsVfvi11jMcIKE5bF1BjqKVthX5JhQ8Q
 e1FKi6HT+R3HfLCwWERKabDukLt+bNV8A46yWxSaXzTvwwZG2TJrIBaIT8Ed0BudXfQX
 PWuGYNnA+DSaOtq4cgo8aRYwGri3p0ie+E7pqm5+NsP0M/VEikVbjBbP3qQDZXWKZcMD
 wcBNCQ1fcR+UqYS0YjK7L4+ceicP0ZFFXcFpir/V+OTLGwKQuf9NIUq7jQJL9inEpk//
 Ggl5dlU92xAS1ObqWqmG9kd230w8gJNIWN3k70dBpzsL+mRxhvhrjrZ5N7PQeN3BcZKC
 pr3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpGAzp43iYTJ9VAu6QNr/cpTtmxIq4INTyBw9yVbBy8e2pGcQPPyGM2Z398pk19EeWbzlDkd+tV9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL5LAaJRyoO0kOmaon+TFvFpIikmqC/p4IXkQ0G6beywvqwlOX
 RaCN/O/XgSJYnJJkSUAkG+AnzHprygVHoCLDQiO+8Bm2/27Xltfx6mbZ5Oy/4iaQvn/02qHtKAS
 RpdEjIWmK4BOOOQI8SGX3VfgwM4E=
X-Gm-Gg: ASbGncvLZPiNTuZ+ZEgSu6LjbiZYgRPBJn9NMzswpz8YciCY6d2ls7xbZFt7zmdl+CX
 8CxiS+U2b5S7Pwy10xwM0fHunCPB+Da8phU3F8FV/FoE9rUksyikK66aIzQzzgKnHgVqBLysNbf
 58SWjs8TYjllU8Kq3W3lQUi/Bk87Gf7Ck8ZYL7GLWBv3GTYD5eJW4=
X-Google-Smtp-Source: AGHT+IEdTO5hNn1ezgivOymNsegNzfJ83eKjctWNeTpWMsM57J4OJKn3z6ximxQld4YNySvnfhfQGQpz4RThMZJUjO0=
X-Received: by 2002:a05:6e02:3e02:b0:3d4:3ab3:5574 with SMTP id
 e9e14a558f8ab-3d95d24557emr38606775ab.3.1745935173509; Tue, 29 Apr 2025
 06:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
 <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
In-Reply-To: <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Apr 2025 06:59:20 -0700
X-Gm-Features: ATxdqUHI0I0FZW2gLzxkvF3EsTwzlI4FDJUgZ3k8m88LbsKKtn-nlD3_9TKUqac
Message-ID: <CAF6AEGs8gPtmYeYBMCn3r=w4eq4pk25fdS=YeqMYUySj7kz0ow@mail.gmail.com>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
To: Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
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

On Tue, Apr 29, 2025 at 5:38=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 28/04/2025 9:54 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping squence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
> >   include/linux/io-pgtable.h     |  8 ++++++++
> >   2 files changed, 20 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f27965caf6a1..99523505dac5 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtabl=
e *data, unsigned long iova,
> >               cptep =3D iopte_deref(pte, data);
> >       } else if (pte) {
> >               /* We require an unmap first */
> > -             WARN_ON(!selftest_running);
> > +             WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_Q=
UIRK_NO_WARN_ON));
>
> If we are going to have this as a general mechanism then the selftests
> should use it as well.

Makes sense, I can remove the selftest_running hack in the next version.

BR,
-R

> Thanks,
> Robin.
>
> >               return -EEXIST;
> >       }
> >
> > @@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_=
pgtable *data,
> >       unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> >       ptep +=3D unmap_idx_start;
> >       pte =3D READ_ONCE(*ptep);
> > -     if (WARN_ON(!pte))
> > -             return 0;
> > +     if (!pte) {
> > +             WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN=
_ON));
> > +             return -ENOENT;
> > +     }
> >
> >       /* If the size matches this level, we're in the right place */
> >       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> > @@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_=
pgtable *data,
> >               /* Find and handle non-leaf entries */
> >               for (i =3D 0; i < num_entries; i++) {
> >                       pte =3D READ_ONCE(ptep[i]);
> > -                     if (WARN_ON(!pte))
> > +                     if (!pte) {
> > +                             WARN_ON(!(data->iop.cfg.quirks & IO_PGTAB=
LE_QUIRK_NO_WARN_ON));
> >                               break;
> > +                     }
> >
> >                       if (!iopte_leaf(pte, lvl, iop->fmt)) {
> >                               __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
> > @@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg =
*cfg, void *cookie)
> >       if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
> >                           IO_PGTABLE_QUIRK_ARM_TTBR1 |
> >                           IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> > -                         IO_PGTABLE_QUIRK_ARM_HD))
> > +                         IO_PGTABLE_QUIRK_ARM_HD |
> > +                         IO_PGTABLE_QUIRK_NO_WARN_ON))
> >               return NULL;
> >
> >       data =3D arm_lpae_alloc_pgtable(cfg);
> > @@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cf=
g *cfg, void *cookie)
> >       struct arm_lpae_io_pgtable *data;
> >       typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr =3D &cfg->arm_lpae_s2_cfg=
.vtcr;
> >
> > -     if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
> > +     if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
> > +                         IO_PGTABLE_QUIRK_NO_WARN_ON))
> >               return NULL;
> >
> >       data =3D arm_lpae_alloc_pgtable(cfg);
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index bba2a51c87d2..639b8f4fb87d 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> >        *
> >        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pag=
etable.
> >        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttr=
s bits
> > +      *
> > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > +      *      mappings, but silently return -EEXISTS.  Normally an atte=
mpt
> > +      *      to map over an existing mapping would indicate some sort =
of
> > +      *      kernel bug, which would justify the WARN_ON().  But for G=
PU
> > +      *      drivers, this could be under control of userspace.  Which
> > +      *      deserves an error return, but not to spam dmesg.
> >        */
> >       #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> >       #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> >       #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> >       #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> >       #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
> >       unsigned long                   quirks;
> >       unsigned long                   pgsize_bitmap;
> >       unsigned int                    ias;
