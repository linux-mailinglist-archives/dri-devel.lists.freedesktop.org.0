Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4CA1EBE50
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 16:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAD46E3FB;
	Tue,  2 Jun 2020 14:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677606E3FE;
 Tue,  2 Jun 2020 14:39:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e1so3678578wrt.5;
 Tue, 02 Jun 2020 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FUYPo8fB6BaXWbeo8MJfYdpZveOhkfTpvMXfShXVl2U=;
 b=UNfJ7i15I+Y/LzEU4j8lQ7MgEBaWKP0vWG7JdIILtTvy5ReIgcx3InYMMZKjAOiqRV
 FcbghXOQN1BXoMHzAAB9FppHnhkd3NUND2KjB4TmF0je+uTY/SnWRtw7C1eB/MwD4Czk
 j26LgN3HFBAmyNGdGLspNBYQJhzlbf1WT9KsDPiIsQ//AAjPp+qiUHRxyTmAZGzWTv4R
 z9phdzRtSzavTj32z+H8tzuSSllOEaueh8p7bjM4PHVJHQCRLcAGHnBE1Dn0JG/4yxus
 yBvViXAEfvsuuvU0Fcze8Q6tH3wXa4m+7bWejd+BOfiXtVtCAbE4ar5oMGiyRJxaLcDJ
 U/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FUYPo8fB6BaXWbeo8MJfYdpZveOhkfTpvMXfShXVl2U=;
 b=Neamivqf1p4OHV5TdhKKkE8LACh81JZQoHmg0x8oJ6B3Ym7bD53kFMAmS8bxuiJZzw
 mublRUmAmCewyCIBi2GcGhJqKaWQqWHxVMd0pjeZem/TLtw0UhGVu5eqCDazOboOCWYc
 vcS+0t30i5/CNBEm/m8GamvkLIMGdcb78NNA8dAbcCYMauXpE+l2PPjGQMKPwbYQZmgY
 VGcV0PZ6htF/mudvqigANzZvI/lJPWCHpXW80rQMmVCdWYZyYm9fUZpNlsMerdJO/y5K
 27zF89hcyKoTAHV0042jsIkr1xTpH1WrpkXr6/4W6I3PTmPDgzqmtSPTYFL5B2V7pTTw
 QCKw==
X-Gm-Message-State: AOAM532+nq9lQR0IpGU2wkJolZRLUYdFUDCP1Q7/EGS4wov20Og/JROC
 T1HBq85AWXRpSsAOyvr5xAeEJiZZSFHamH0rY3A=
X-Google-Smtp-Source: ABdhPJwrjdBmlreZah9W7r9r21z3nSN/KOpVsiV4cBN3K6kvpACwdA9Zl067g+t1tRAigKtydZQnx9ZgBZwfjYr/bzI=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr27830873wrs.374.1591108798154; 
 Tue, 02 Jun 2020 07:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200602092030.31966-1-piotr.stankiewicz@intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663010E23E538@FMSMSX108.amr.corp.intel.com>
 <CAHp75Vfe5dQkOiFoAZx5b-NS1afiD-YC_w+5LcX8P1Hm0ASenA@mail.gmail.com>
 <CADnq5_OO=gyo22ZrXp6pDtz2QZ2=LC429u_kkd0ZvX4=M3mBPw@mail.gmail.com>
 <CAHp75Vd1zVt7F2+44EFPHOrCOzexe=mLaiZixqJR9NNK9-wNQg@mail.gmail.com>
In-Reply-To: <CAHp75Vd1zVt7F2+44EFPHOrCOzexe=mLaiZixqJR9NNK9-wNQg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jun 2020 10:39:47 -0400
Message-ID: <CADnq5_Mcys8tF-UAZ1JrLy1HnL-Ms7TTrLBPrWkA08tuhjkB2A@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/amdgpu: use PCI_IRQ_MSI_TYPES where appropriate
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Tom St Denis <tom.stdenis@amd.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, "Stankiewicz,
 Piotr" <piotr.stankiewicz@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 10:35 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jun 2, 2020 at 5:21 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Tue, Jun 2, 2020 at 10:00 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Jun 2, 2020 at 4:38 PM Ruhl, Michael J <michael.j.ruhl@intel.com> wrote:
> > > > >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > > > >Piotr Stankiewicz
>
> > > > >               int nvec = pci_msix_vec_count(adev->pdev);
> > > > >               unsigned int flags;
> > > > >
> > > > >-              if (nvec <= 0) {
> > > > >+              if (nvec > 0)
> > > > >+                      flags = PCI_IRQ_MSI_TYPES;
> > > > >+              else
> > > > >                       flags = PCI_IRQ_MSI;
> > > > >-              } else {
> > > > >-                      flags = PCI_IRQ_MSI | PCI_IRQ_MSIX;
> > > > >-              }
> > > >
> > > > Minor nit:
> > > >
> > > > Is it really necessary to set do this check?  Can flags just
> > > > be set?
> > > >
> > > > I.e.:
> > > >         flags = PCI_IRQ_MSI_TYPES;
> > > >
> > > > pci_alloc_irq_vector() tries stuff in order.  If MSIX is not available,
> > > > it will try MSI.
> > >
> > > That's also what I proposed earlier. But I suggested as well to wait
> > > for AMD people to confirm that neither pci_msix_vec_count() nor flags
> > > is needed and we can directly supply MSI_TYPES to the below call.
> > >
> >
> > I think it was leftover from debugging and just to be careful.  We had
> > some issues when we originally enabled MSI-X on certain boards.  The
> > fix was to just allocate a single vector (since that is all we use
> > anyway) and we were using the wrong irq (pdev->irq vs
> > pci_irq_vector(pdev, 0)).
>
> Do you agree that simple
>
>   nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, PCI_IRQ_MSI_TYPES);
>
> will work and we can remove that leftover?

Yes, I believe so.  Tom, can you give this a quick spin on raven just
in case if you get a chance?  Something like this:

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 0cc4c67f95f7..c59111b57cc2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -248,16 +248,10 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
        adev->irq.msi_enabled = false;

        if (amdgpu_msi_ok(adev)) {
-               int nvec = pci_msix_vec_count(adev->pdev);
-               unsigned int flags;
+               int nvec;

-               if (nvec <= 0) {
-                       flags = PCI_IRQ_MSI;
-               } else {
-                       flags = PCI_IRQ_MSI | PCI_IRQ_MSIX;
-               }
                /* we only need one vector */
-               nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, flags);
+               nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1,
PCI_IRQ_MSI | PCI_IRQ_MSIX);
                if (nvec > 0) {
                        adev->irq.msi_enabled = true;
                        dev_dbg(adev->dev, "using MSI/MSI-X.\n");


Thanks,

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
