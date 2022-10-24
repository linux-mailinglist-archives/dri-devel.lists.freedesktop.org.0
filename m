Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED560B472
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 19:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFE510E197;
	Mon, 24 Oct 2022 17:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D7310E197
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 17:44:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACAACB81142
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 17:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB79C43144
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 17:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666633473;
 bh=rxyQTUdSdUwZ2Oz9EnvVUz0qxX4MCHVHqwvbb6aL05U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XfD0Iled2Tv4HZSuYwD9foAloyb2TNg/Wn8YFbjnQyzyNjNGK4qgw18aR/dV1k8zK
 hnvWg/J0PfbETsLprF3n9YPNN8SX16hG9BWWXTT2FQzlXkER1PkcBFZ1sPgNl0pJDn
 L8oPBFgU0oWtCGVLVOH3ySI/pt7NMmCMzCXHBGvwmZLO9vewnQ0TyX3GISvJ55gxqi
 fpLGZiAepxFqN2s98o7TQqU5WYPxcS1tKiFGEZhKb0Lma1YDWKiq9i2ZEuqjpVHgVv
 vcQvP8t0BWm0kJsolFSa+0/xsvn37gUrhuiETsUDHBumMzXk4IFil4qRmWww+uDqh4
 uuE5BwvzyrToQ==
Received: by mail-ej1-f50.google.com with SMTP id sc25so6690566ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 10:44:33 -0700 (PDT)
X-Gm-Message-State: ACrzQf3ekFlaLr6NGSUAv4vdaB4NM4vBs9jhyxthnCTiSQ7C6S5grIso
 7FczmtoNdRR0gyCmQapep3NUEdG6sqUpkKhMryk=
X-Google-Smtp-Source: AMsMyM6YYGgMMfIaWx4gP49hE7OH9LShLe6ZHYGkdMvLBIHBgpNCJGtSdAXwQBJtL7tPFso9ubAP3e4OWGP9JlHn+LU=
X-Received: by 2002:a17:906:8a52:b0:78d:b6db:149d with SMTP id
 gx18-20020a1709068a5200b0078db6db149dmr28562056ejc.733.1666633471396; Mon, 24
 Oct 2022 10:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-4-ogabbay@kernel.org>
 <bf8df463-3413-3027-0f4b-3977e6860404@quicinc.com>
In-Reply-To: <bf8df463-3413-3027-0f4b-3977e6860404@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 24 Oct 2022 20:43:58 +0300
X-Gmail-Original-Message-ID: <CAFCwf12R1CWz8GdJ0sNsVL+_5b+G5Wqf5qwZ8ixtoXLOr2-obg@mail.gmail.com>
Message-ID: <CAFCwf12R1CWz8GdJ0sNsVL+_5b+G5Wqf5qwZ8ixtoXLOr2-obg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
 Jiho Chu <jiho.chu@samsung.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 6:21 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 10/22/2022 3:46 PM, Oded Gabbay wrote:
> > The accelerator devices are exposed to user-space using a dedicated
> > major. In addition, they are represented in /dev with new, dedicated
> > device char names: /dev/accel/accel*. This is done to make sure any
> > user-space software that tries to open a graphic card won't open
> > the accelerator device by mistake.
> >
> > The above implies that the minor numbering should be separated from
> > the rest of the drm devices. However, to avoid code duplication, we
> > want the drm_minor structure to be able to represent the accelerator
> > device.
> >
> > To achieve this, we add a new drm_minor* to drm_device that represents
> > the accelerator device. This pointer is initialized for drivers that
> > declare they handle compute accelerator, using a new driver feature
> > flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
> > driver feature is mutually exclusive with DRIVER_RENDER. Devices that
> > want to expose both graphics and compute device char files should be
> > handled by two drivers that are connected using the auxiliary bus
> > framework.
> >
> > In addition, we define a different idr to handle the accelerators
> > minors. This is done to make the minor's index be identical to the
> > device index in /dev/. In most places, this is hidden inside the drm
> > core functions except when calling drm_minor_acquire(), where I had to
> > add an extra parameter to specify the idr to use (because the
> > accelerators minors index and the drm primary minor index both begin
> > at 0).
> >
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > ---
> >   drivers/gpu/drm/drm_drv.c      | 171 +++++++++++++++++++++++++--------
> >   drivers/gpu/drm/drm_file.c     |  69 +++++++++----
> >   drivers/gpu/drm/drm_internal.h |   2 +-
> >   drivers/gpu/drm/drm_sysfs.c    |  29 ++++--
> >   include/drm/drm_device.h       |   3 +
> >   include/drm/drm_drv.h          |   8 ++
> >   include/drm/drm_file.h         |  21 +++-
> >   7 files changed, 235 insertions(+), 68 deletions(-)
>
> Can we please add something to Documentation?  I know this leverages DRM
> a lot, but I believe that a new subsystem should not be introduced
> without documentation.  A lot of the info in the commit message is very
> good, but should not be buried in the git log.
>
> Besides, imagine this has been in mainline for N years, and someone
> completely new to the kernel wants to write an accel driver.  They
> should be able to get started with something from Documentation that
> at-least gives that person some insight into what to grep the code for.
Agreed. The only reason I haven't done it at this stage was because I
wanted to get an initial reaction to the code itself, see if the
direction is accepted.
I didn't want to write documentation and then completely re-write it.
So I will do it for the next patch-set, once I collect everyone's
feedback and I see there is a majority agreement.
>
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index b58ffb1433d6..c13701a8d4be 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
> >   static DEFINE_SPINLOCK(drm_minor_lock);
> >   static struct idr drm_minors_idr;
> >
> > +static DEFINE_SPINLOCK(accel_minor_lock);
> > +static struct idr accel_minors_idr;
>
> IDR is deprecated.  XArray is the preferred mechanism.
> Yes, there already is IDR here, but I believe we should not be adding
> new uses.  Maybe at some point, the current IDR will be converted.  Also
> with XArray, I think you don't need the spinlock since XArray has
> internal locking already.
ok, I wasn't aware. I don't have any problem replacing the idr to xarray.

Thanks,
Oded
