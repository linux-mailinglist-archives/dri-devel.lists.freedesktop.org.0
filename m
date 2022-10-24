Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1D660ADF2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A192010E0D5;
	Mon, 24 Oct 2022 14:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B9710E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:41:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33EBB61419
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E1EC43145
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666622491;
 bh=573Ln4cycAv4yHsGNxf7bxVDj7O7ePVFwztAvN6jSoM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ve9b6v3p7QvgpNMvPAfnelFnZ6rpTL9FI1yN3G61HI/80RytHOODhAsDOm6XKs19k
 4cL2XQ42BJh/Mlf95fxcaNH9J1DYJ09eVc8RhUGC6xDXpOBLsFOQI/eRzrfN1Fp8L9
 qmFFPy5BnYBExdpc+0pBO6y4vypZ26XGrQKNjXCEO8YPjZZoYaoOv+c+L8uK0E/hUp
 /tMpmtra6GFNqdf3djo1iQ/QzOe+Xj5CckKt13noT6UJ3ajed5xXE77APPWj+jH/YQ
 OgV+Rau+HNt/eaTXO3O0pZakS6mVi5bmE2mk0yc/DqAqUD8YZnemzOocfk3+BP9uy7
 i3QYYr5WGUJfQ==
Received: by mail-ed1-f53.google.com with SMTP id m15so32072446edb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:41:30 -0700 (PDT)
X-Gm-Message-State: ACrzQf0qG5uzm6zFRD5Iprzjkx2f2gjZtPcDPLTPodRmSwcXUhIrxCJW
 0HKX6wbSWejqu6MzM6Lyu6npbSbqMX0K5hpdnTA=
X-Google-Smtp-Source: AMsMyM7sKGmviZaWbmgBjJrmStEDKqj4gFQWVeLtPAXAlPTvbW1zSztmy5BKQLk0oZ5O9EqH/+4IOlfmDyFvTrQiihU=
X-Received: by 2002:a17:906:ef90:b0:7ab:1b2c:b654 with SMTP id
 ze16-20020a170906ef9000b007ab1b2cb654mr906693ejb.627.1666622489127; Mon, 24
 Oct 2022 07:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <CADnq5_PwNwsSUeyhXDkoy-y1JXFrTj99AgVV02oHX0a29QUXpQ@mail.gmail.com>
In-Reply-To: <CADnq5_PwNwsSUeyhXDkoy-y1JXFrTj99AgVV02oHX0a29QUXpQ@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 24 Oct 2022 17:41:02 +0300
X-Gmail-Original-Message-ID: <CAFCwf11CPvW8uqbDs8-qyMVMbPhw1tPF9ddfjee1MvKthRQb+g@mail.gmail.com>
Message-ID: <CAFCwf11CPvW8uqbDs8-qyMVMbPhw1tPF9ddfjee1MvKthRQb+g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 4:55 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Sat, Oct 22, 2022 at 5:46 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > In the last couple of months we had a discussion [1] about creating a new
> > subsystem for compute accelerator devices in the kernel.
> >
> > After an analysis that was done by DRM maintainers and myself, and following
> > a BOF session at the Linux Plumbers conference a few weeks ago [2], we
> > decided to create a new subsystem that will use the DRM subsystem's code and
> > functionality. i.e. the accel core code will be part of the DRM subsystem.
> >
> > This will allow us to leverage the extensive DRM code-base and
> > collaborate with DRM developers that have experience with this type of
> > devices. In addition, new features that will be added for the accelerator
> > drivers can be of use to GPU drivers as well (e.g. RAS).
> >
> > As agreed in the BOF session, the accelerator devices will be exposed to
> > user-space with a new, dedicated device char files and a dedicated major
> > number (261), to clearly separate them from graphic cards and the graphic
> > user-space s/w stack. Furthermore, the drivers will be located in a separate
> > place in the kernel tree (drivers/accel/).
> >
> > This series of patches is the first step in this direction as it adds the
> > necessary infrastructure for accelerator devices to DRM. The new devices will
> > be exposed with the following convention:
> >
> > device char files - /dev/accel/accel*
> > sysfs             - /sys/class/accel/accel*/
> > debugfs           - /sys/kernel/debug/accel/accel*/
> >
> > I tried to reuse the existing DRM code as much as possible, while keeping it
> > readable and maintainable.
>
> Wouldn't something like this:
> https://patchwork.freedesktop.org/series/109575/
> Be simpler and provide better backwards compatibility for existing
> non-gfx devices in the drm subsystem as well as newer devices?

As Greg said, see the summary. The consensus in the LPC session was
that we need to clearly separate accel devices from existing gpu
devices (whether they use primary and/or render nodes). That is the
main guideline according to which I wrote the patches. I don't think I
want to change this decision.

Also, there was never any intention to provide backward compatibility
for existing non-gfx devices. Why would we want that ? We are mainly
talking about drivers that are currently trying to get upstream, and
the habana driver.

Oded
>
> Alex
>
> >
> > One thing that is missing from this series is defining a namespace for the
> > new accel subsystem, while I'll add in the next iteration of this patch-set,
> > after I will receive feedback from the community.
> >
> > As for drivers, once this series will be accepted (after adding the namespace),
> > I will start working on migrating the habanalabs driver to the new accel
> > subsystem. I have talked about it with Dave and we agreed that it will be
> > a good start to simply move the driver as-is with minimal changes, and then
> > start working on the driver's individual features that will be either added
> > to the accel core code (with or without changes), or will be removed and
> > instead the driver will use existing DRM code.
> >
> > In addition, I know of at least 3 or 4 drivers that were submitted for review
> > and are good candidates to be included in this new subsystem, instead of being
> > a drm render node driver or a misc driver.
> >
> > [1] https://lkml.org/lkml/2022/7/31/83
> > [2] https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
> >
> > Thanks,
> > Oded
> >
> > Oded Gabbay (3):
> >   drivers/accel: add new kconfig and update MAINTAINERS
> >   drm: define new accel major and register it
> >   drm: add dedicated minor for accelerator devices
> >
> >  Documentation/admin-guide/devices.txt |   5 +
> >  MAINTAINERS                           |   8 +
> >  drivers/Kconfig                       |   2 +
> >  drivers/accel/Kconfig                 |  24 +++
> >  drivers/gpu/drm/drm_drv.c             | 214 +++++++++++++++++++++-----
> >  drivers/gpu/drm/drm_file.c            |  69 ++++++---
> >  drivers/gpu/drm/drm_internal.h        |   5 +-
> >  drivers/gpu/drm/drm_sysfs.c           |  81 +++++++++-
> >  include/drm/drm_device.h              |   3 +
> >  include/drm/drm_drv.h                 |   8 +
> >  include/drm/drm_file.h                |  21 ++-
> >  include/drm/drm_ioctl.h               |   1 +
> >  12 files changed, 374 insertions(+), 67 deletions(-)
> >  create mode 100644 drivers/accel/Kconfig
> >
> > --
> > 2.34.1
> >
