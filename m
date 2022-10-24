Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94160AE9F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC010E82C;
	Mon, 24 Oct 2022 15:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED9310E82C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:10:40 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id h4so8161994vsr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3u6vBok7fkMUG4gQWkOOT25X5n6LqbLhBS964rQOfgo=;
 b=Kz+/GLpa/rMZEKMRFCEZyGkW+wQIX+WLtvg3AqAFKkv7GxVd9S5MEc9DNnBkxkki6d
 APip50piSLHmTJSariD3lrJhc1qzkkNwNkXfF6wjhyBxIhu9E2ICsEOoXQu5Bfc0PqPu
 M0xJ/K4Zbe6P5QWU15D3awM4jBuK+Uv5EL8n93jX5bqnOgql9u8HYWupBuhjQrZjLug+
 uz9cApNtOQ38jVejrBNX+nYdYdf12xnZrlPNUrfAHx6SbeN9iTmyDJumfinVFz54vXXS
 t3YjyHKmsIsC6kZjxCR+kZDB2gCG6R1AHuHDN7+BJW032blVD8B58y2NzU2JOraDV3aU
 5mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3u6vBok7fkMUG4gQWkOOT25X5n6LqbLhBS964rQOfgo=;
 b=QTxNTa7CHkklN4y6gLbwk1HVs64FWAEtz4AXBz+i2+g+8Bd5QZdPN7ctV1526VyUwS
 2/BNvU9iZQYFyuo/fOYH7416FKu0Ta9RoMHCZjQWrbAmyTUtTJHOT9bjAoQ3agTU71PK
 fTNjkBiKAr/6tLvlzsfQYF07FlvQnUUBExxPgwNJ161UNy2FnqR0dXojV219P1k6oNiN
 Sb47bx4Vh/+Z2pLzwATE7ycLZ0PV++R6vmnH0dTkpcDnGKj/hglMyOZIauwdFHvLb0j/
 +3mjdrU80vOT5nJEH3enN2Dv1jOakpRY1NZGHKPgPbaJHLqDuepRnQho90Yvd0Z1jO0R
 udhg==
X-Gm-Message-State: ACrzQf02CmWrq3UGKG0xNwk8wk8eRjPjvmEFYgEwzSWwXUeDNs0oZGKO
 K3np+L3CvwnVuX5r64dBvGKQN+86IxLC4k2TTx0=
X-Google-Smtp-Source: AMsMyM5zu8pxT5x+9L6CqBXSAp02gnlW9du+lUi7pOpMdclbUdyibdNIstYatHC6YgUrUSsa0RtL7BLxxriz1VEb260=
X-Received: by 2002:a05:6102:224d:b0:3a7:68fc:9163 with SMTP id
 e13-20020a056102224d00b003a768fc9163mr17650095vsb.74.1666624238228; Mon, 24
 Oct 2022 08:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <CADnq5_PwNwsSUeyhXDkoy-y1JXFrTj99AgVV02oHX0a29QUXpQ@mail.gmail.com>
 <CAFCwf11CPvW8uqbDs8-qyMVMbPhw1tPF9ddfjee1MvKthRQb+g@mail.gmail.com>
In-Reply-To: <CAFCwf11CPvW8uqbDs8-qyMVMbPhw1tPF9ddfjee1MvKthRQb+g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Oct 2022 11:10:25 -0400
Message-ID: <CADnq5_PsM1xPzZgj_2sVBQQnDerzOEestLh_PmTQxpddD5Dsvg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
To: Oded Gabbay <ogabbay@kernel.org>
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

On Mon, Oct 24, 2022 at 10:41 AM Oded Gabbay <ogabbay@kernel.org> wrote:
>
> On Mon, Oct 24, 2022 at 4:55 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Sat, Oct 22, 2022 at 5:46 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> > >
> > > In the last couple of months we had a discussion [1] about creating a new
> > > subsystem for compute accelerator devices in the kernel.
> > >
> > > After an analysis that was done by DRM maintainers and myself, and following
> > > a BOF session at the Linux Plumbers conference a few weeks ago [2], we
> > > decided to create a new subsystem that will use the DRM subsystem's code and
> > > functionality. i.e. the accel core code will be part of the DRM subsystem.
> > >
> > > This will allow us to leverage the extensive DRM code-base and
> > > collaborate with DRM developers that have experience with this type of
> > > devices. In addition, new features that will be added for the accelerator
> > > drivers can be of use to GPU drivers as well (e.g. RAS).
> > >
> > > As agreed in the BOF session, the accelerator devices will be exposed to
> > > user-space with a new, dedicated device char files and a dedicated major
> > > number (261), to clearly separate them from graphic cards and the graphic
> > > user-space s/w stack. Furthermore, the drivers will be located in a separate
> > > place in the kernel tree (drivers/accel/).
> > >
> > > This series of patches is the first step in this direction as it adds the
> > > necessary infrastructure for accelerator devices to DRM. The new devices will
> > > be exposed with the following convention:
> > >
> > > device char files - /dev/accel/accel*
> > > sysfs             - /sys/class/accel/accel*/
> > > debugfs           - /sys/kernel/debug/accel/accel*/
> > >
> > > I tried to reuse the existing DRM code as much as possible, while keeping it
> > > readable and maintainable.
> >
> > Wouldn't something like this:
> > https://patchwork.freedesktop.org/series/109575/
> > Be simpler and provide better backwards compatibility for existing
> > non-gfx devices in the drm subsystem as well as newer devices?
>
> As Greg said, see the summary. The consensus in the LPC session was
> that we need to clearly separate accel devices from existing gpu
> devices (whether they use primary and/or render nodes). That is the
> main guideline according to which I wrote the patches. I don't think I
> want to change this decision.
>
> Also, there was never any intention to provide backward compatibility
> for existing non-gfx devices. Why would we want that ? We are mainly
> talking about drivers that are currently trying to get upstream, and
> the habana driver.

If someone already has a non-gfx device which uses the drm subsystem,
should they be converted to the new accel stuff?  What about new
devices that utilize the same driver?  SHould they use accel or
continue to use drm?  For the sake of the rest of the stack drm would
make more sense, but if accel grows a bunch of stuff that all accel
drivers should be using what do we do?  Also using render nodes also
makes the devices compatible with all of the existing user space tools
that use the existing drm device nodes like libdrm, etc.  I'm failing
to see what advantage accel brings other than requiring userspace to
support two very similar device nodes.

Alex

>
> Oded
> >
> > Alex
> >
> > >
> > > One thing that is missing from this series is defining a namespace for the
> > > new accel subsystem, while I'll add in the next iteration of this patch-set,
> > > after I will receive feedback from the community.
> > >
> > > As for drivers, once this series will be accepted (after adding the namespace),
> > > I will start working on migrating the habanalabs driver to the new accel
> > > subsystem. I have talked about it with Dave and we agreed that it will be
> > > a good start to simply move the driver as-is with minimal changes, and then
> > > start working on the driver's individual features that will be either added
> > > to the accel core code (with or without changes), or will be removed and
> > > instead the driver will use existing DRM code.
> > >
> > > In addition, I know of at least 3 or 4 drivers that were submitted for review
> > > and are good candidates to be included in this new subsystem, instead of being
> > > a drm render node driver or a misc driver.
> > >
> > > [1] https://lkml.org/lkml/2022/7/31/83
> > > [2] https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
> > >
> > > Thanks,
> > > Oded
> > >
> > > Oded Gabbay (3):
> > >   drivers/accel: add new kconfig and update MAINTAINERS
> > >   drm: define new accel major and register it
> > >   drm: add dedicated minor for accelerator devices
> > >
> > >  Documentation/admin-guide/devices.txt |   5 +
> > >  MAINTAINERS                           |   8 +
> > >  drivers/Kconfig                       |   2 +
> > >  drivers/accel/Kconfig                 |  24 +++
> > >  drivers/gpu/drm/drm_drv.c             | 214 +++++++++++++++++++++-----
> > >  drivers/gpu/drm/drm_file.c            |  69 ++++++---
> > >  drivers/gpu/drm/drm_internal.h        |   5 +-
> > >  drivers/gpu/drm/drm_sysfs.c           |  81 +++++++++-
> > >  include/drm/drm_device.h              |   3 +
> > >  include/drm/drm_drv.h                 |   8 +
> > >  include/drm/drm_file.h                |  21 ++-
> > >  include/drm/drm_ioctl.h               |   1 +
> > >  12 files changed, 374 insertions(+), 67 deletions(-)
> > >  create mode 100644 drivers/accel/Kconfig
> > >
> > > --
> > > 2.34.1
> > >
