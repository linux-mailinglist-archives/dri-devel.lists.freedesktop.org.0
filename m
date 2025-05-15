Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA21DAB89D1
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3609710E8DB;
	Thu, 15 May 2025 14:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FRVJn47O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F36D10E8DB;
 Thu, 15 May 2025 14:48:52 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-85b4170f1f5so31304239f.3; 
 Thu, 15 May 2025 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747320531; x=1747925331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UcpEFBY6ddNvtG+RJyIJB7SfDGpOmaoMi5EF4Kq9Vk=;
 b=FRVJn47OiJgJ4JVQ7VNHRLYLuduFt4Hy2MU0hnkZ2bigw7tbOyMFXPCA3HeTFdfEp5
 hZZxFjbO8oE5MinB4e5qBfvDnRU56R6nD/7NAXZUNNn7nVNN7qaQhrwEQGCOQItNOiTX
 vJOfbz9nipe3aMbDbQ4vnb+aQ7pdhFPxmSR+xuNuhe1W/w4B55TTjFv+U0tJWbLFJDKI
 uuWD8I9DnoVT2eaaW4ceT12auaio/pdEIAL5L5/U2tf4FyX69bwl39T/kabCyUqhZKwy
 pXWFgbh5Djeu1ztcPMkCYoGpVQ7NhqK++zlJY+Nx4+UugzMirwAEcM5/zWPIbYpVnF59
 hglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747320531; x=1747925331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UcpEFBY6ddNvtG+RJyIJB7SfDGpOmaoMi5EF4Kq9Vk=;
 b=xPJH+xRui1B83TcjBC90phBH4fM0N2/ja6MZ0Tz7PVYrzlva2ulSVwxiywiC525c7y
 Qxmx02RigciwScROTJm44ULHv3Oazyw7uTnu9WTuDb6mgL2cQJrNOFsJG2og//N933j7
 TO6u9NZNOZ3EBQ9YJwobtgats5DdxTbh9lQ4pYpicXHotxJ0sNJpj2ieeMcmOLxkYJeF
 iRtTvnQJUqAzQ5L9AGix2o61SxAG95d+mX3g/wzuTNQHkb64eqRDr5EK5Qe60xpEX2Dt
 nGknzzcVFzRzu7cgDQ31B1U2nwcr5KQdIyeiGbZjfl8tJV4d6aj6MbvxMJbMxHJScpfN
 i2jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv1bgj9XHDG70LP9ebb7yv1CivyYXLBMsOw6UDbUngS1H2rhhp4rzBiUXUj6PqMWUFjixdR5WGqpg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRUtAT1MAYrGz5j035D6wVFhw4qvuuYRrsjKuxzuKy/pOHpEtY
 PW2uNX1UXvJDw3gQgKUgogATldQkg6/zC1PfDfzxOOcI54933SQJHwBajyJDYHyCgqSsHDwSc+9
 CPuxhrFrLvItJtnpz7GipEPE3TQY=
X-Gm-Gg: ASbGncupO601BR/84ZH7NfZBoC5uCDKsHH2jITXKWNggUQwaqVI1ZHRIr4YtHE8Mgoo
 Iepkj7+kCT4ZqHZZ8pZu1AgrfM2mrS1KVOmFSM7aXQosyXl8IxaNN0jQeDDxlN3LghSYr5Xp3fJ
 x82wYyTSA+KinlGqkX6cFHCr3smztSjRY5nCpBDPgj/A+zpFP4XTtIKCRibEDfXg==
X-Google-Smtp-Source: AGHT+IFtWg4FcpaQcpwpTvAAxNygeksmyF1l4sqwxDFcYvvnKFT5/XBtYVHhM71RjDfHHRY+SZGmXPFPj2VfnOhCfgs=
X-Received: by 2002:a05:6e02:5e08:b0:3d8:2023:d048 with SMTP id
 e9e14a558f8ab-3db6f7fa0c1mr68163045ab.22.1747320531316; Thu, 15 May 2025
 07:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
In-Reply-To: <20250515143309.GA12165@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 07:48:39 -0700
X-Gm-Features: AX0GCFtBF3BgAWnijILzbnLfQ8NIY_C-HxQIavKJnQ_xQacCvqpfSyafYx2RZYo
Message-ID: <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
To: Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Nicolin Chen <nicolinc@nvidia.com>, 
 Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>, 
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

On Thu, May 15, 2025 at 7:33=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping sequence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
> >
> > Now that there is a quirk, we can also drop the selftest_running
> > flag, and use the quirk instead for selftests.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
> >  include/linux/io-pgtable.h     |  8 ++++++++
> >  2 files changed, 22 insertions(+), 13 deletions(-)
>
> [...]
>
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
>
> This feels a bit fragile to me:
>   * IOMMU-API users of io-pgtable shouldn't be passing this quirk
>     but might end up doing so to paper over driver bugs.
>
>   * Low-level users of io-pgtable who expose page-table operations to
>     userspace need to pass the quirk, but might well not bother because
>     well-behaved userspace doesn't trigger the warning.
>
> So overall, it's all a bit unsatisfactory. Is there a way we could have
> the warnings only when invoked via the IOMMU API?

iommu drivers _not_ setting this flag seems like a good way to achieve that=
 ;-)

The alternative is to move the warns to the iommu driver... but they
could just as easily remove the WARN_ON()s as they could set the
NO_WARN_ON quirk, so :shrug:?

BR,
-R
