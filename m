Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C2372BED
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 16:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A44389FCC;
	Tue,  4 May 2021 14:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9010889FCC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 14:23:44 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m12so13497150eja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ensQSDTh3BO9iGPVrV6EYBnSBYEfz7lspMmgWRr6tEM=;
 b=A/agEr85m2gTABKwkX7MweJdDLUWMMy/uuv8cOATtF0IOSbqQGQWqB7WVO/2i6CTej
 A/xEN0wabqwjnysRyxUsM6987Nm7ZjOXb3ElY7BOmpcbi2Nz6d878YWmh7i2EiFYeKva
 NM7Q/fRoU0PTIKl2uxcCG8z+XO6JfxPjFQ6us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ensQSDTh3BO9iGPVrV6EYBnSBYEfz7lspMmgWRr6tEM=;
 b=EMkMvBfNNIJtVq5yd898bkYl6Oe5G6fQAeL3iRl6gwKac0710M9+/9d+jSUqlXXyhh
 N42m+VcofDaPRbRdLbdBe+pQqCyfDwlGEShQyDxG2C5QjHIbnXoBROmH4p3G2x6RbpL/
 0T7RY+q3+aFxIJBZcG5m9O90ctmIgPdHpu057JsMvgiEOYQTYyXVviQD49Km1YVgiyVa
 Bzp0qwGadvpRKzTVv450I++AMPZy2oxpHgpRYAAss2E4aOZGfbrNBKIKHE6LRJD467x5
 PNlS1QOtPQfX+Xg4ix+Klf8E3a9ybm3oqur2Oc9xmQk2V+MGQe1qe4iG7qhJxllo7uUi
 P0iQ==
X-Gm-Message-State: AOAM530yr4bhab+AqeilccMJ/3O0NmSDIDUQXq8xW4HIrL0ddTXi0N9f
 BX0iJDBpIiP8cOkMl0Upnkl0rg==
X-Google-Smtp-Source: ABdhPJzaM96uclt2Tpt863I3ZtqPW7KYS209iLyt378polAbgvCVI1aPL30//Pa3FZcXPaOgGHkVGA==
X-Received: by 2002:a17:906:194d:: with SMTP id
 b13mr22253337eje.83.1620138223252; 
 Tue, 04 May 2021 07:23:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm1462204ejc.121.2021.05.04.07.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 07:23:42 -0700 (PDT)
Date: Tue, 4 May 2021 16:23:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kurz <groug@kaod.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJFY7NjEBtCSlJHw@phenom.ffwll.local>
Mail-Followup-To: Greg Kurz <groug@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504152034.18e41ec3@bahia.lan>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, qemu-ppc@nongnu.org,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 04, 2021 at 03:20:34PM +0200, Greg Kurz wrote:
> On Tue, 4 May 2021 14:59:07 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> > > On Fri, 26 Mar 2021 07:13:09 +0100
> > > Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > > > feature without any open source component - what would normally be
> > > > the normal open source userspace that we require for kernel drivers,
> > > > although in this particular case user space could of course be a
> > > > kernel driver in a VM.  It also happens to be a complete mess that
> > > > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > > > and also pulles in over 1000 lines of code always build into powerpc
> > > > kernels that have Power NV support enabled.  Because of all these
> > > > issues and the lack of breaking userspace when it is removed I think
> > > > the best idea is to simply kill.
> > > > 
> > > > Changes since v1:
> > > >  - document the removed subtypes as reserved
> > > >  - add the ACK from Greg
> > > > 
> > > > Diffstat:
> > > >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> > > >  b/arch/powerpc/include/asm/opal.h            |    3 
> > > >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> > > >  b/arch/powerpc/include/asm/pci.h             |    7 
> > > >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> > > >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> > > >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> > > >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> > > >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> > > >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> > > >  b/drivers/vfio/pci/Kconfig                   |    6 
> > > >  b/drivers/vfio/pci/Makefile                  |    1 
> > > >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> > > >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> > > >  b/include/uapi/linux/vfio.h                  |   38 -
> > > 
> > > 
> > > Hi Christoph,
> > > 
> > > FYI, these uapi changes break build of QEMU.
> > 
> > What uapi changes?
> > 
> 
> All macros and structure definitions that are being removed
> from include/uapi/linux/vfio.h by patch 1.

Just my 2cents from drm (where we deprecate old gunk uapi quite often):
Imo it's best to keep the uapi headers as-is, but exchange the
documentation with a big "this is removed, never use again" warning:

- it occasionally serves as a good lesson for how to not do uapi (whatever
  the reasons really are in the specific case)

- it's good to know which uapi numbers (like parameter extensions or
  whatever they are in this case) are defacto reserved, because there are
  binaries (qemu in this) that have code acting on them out there.

The only exception where we completely nuke the structs and #defines is
when uapi has been only used by testcases. Which we know, since we defacto
limit our stable uapi guarantee to the canonical open&upstream userspace
drivers only (for at least the driver-specific stuff, the cross-driver
interfaces are hopeless).

Anyway feel free to ignore since this might be different than drivers/gpu.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
