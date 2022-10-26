Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8460DB73
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 08:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7094A10E400;
	Wed, 26 Oct 2022 06:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03AC10E400
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:39:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BD1361D64
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE5EC4314D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666766364;
 bh=yFlG8DyeHSBJrLAthLxUGjSJOLwrlJQPptyLz3jkn1U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dV2JLFsKDFQWV6+BzdLxfAPH3dmhFazYkd4h5vvIdk6BZtjHBWZ2JG9UPha18f1Fc
 PDp6r4gm6rGWQqWR34yPEvzHHlI1gndRON7DOHbdqM5rJtWytlGGcnHj5BWv+sF0C+
 i9+WI7tZUhQmVabPv/rMCUGJuSD0SqWt99/9AfRsxdjJBOA75ecHKiMsOC2iPTEiuG
 dzZuvzUb3a2Tv27uxoNnn0S4TyExbKH+yD576bA5rnwgOZMNIhoujBgxvTqrZyeDZY
 /7/6o5STHvzJmx+DuM3fTKV6ulM000uV9EU13xsrc2Pcm/FsFvu+El3noxTDJy2Zl/
 od/u1Y48g65GA==
Received: by mail-ej1-f42.google.com with SMTP id ud5so15150322ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 23:39:24 -0700 (PDT)
X-Gm-Message-State: ACrzQf0e/ABTxIPhLg9NrRg8SDm2s9aIO5MgyDY8NuAb33lmf2XuFYQM
 IpAs/38eB1Tg32D/xHZqtJC3JQHLb4p79+rrpXU=
X-Google-Smtp-Source: AMsMyM5NLtiLSM2kUbQIxcf5EE8nr0RjsoF43kkKzX6MSvTx0FCg+18TKL7PljaoDhAZzfVNkHppqygDf04utXVEpqM=
X-Received: by 2002:a17:906:5dcc:b0:78d:fb98:6f85 with SMTP id
 p12-20020a1709065dcc00b0078dfb986f85mr36812057ejv.123.1666766362209; Tue, 25
 Oct 2022 23:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-4-ogabbay@kernel.org>
 <bf8df463-3413-3027-0f4b-3977e6860404@quicinc.com>
 <CAFCwf12R1CWz8GdJ0sNsVL+_5b+G5Wqf5qwZ8ixtoXLOr2-obg@mail.gmail.com>
 <20221025132654.fcbw7xvl7pu3yp6c@nostramo>
In-Reply-To: <20221025132654.fcbw7xvl7pu3yp6c@nostramo>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 26 Oct 2022 09:38:55 +0300
X-Gmail-Original-Message-ID: <CAFCwf13Z8qO6ifHVSMkxnvYBAfAgim=avH7mOi9qViyb6Xtj5A@mail.gmail.com>
Message-ID: <CAFCwf13Z8qO6ifHVSMkxnvYBAfAgim=avH7mOi9qViyb6Xtj5A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 4:27 PM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
>
> On Mon, Oct 24, 2022 at 08:43:58PM +0300, Oded Gabbay wrote:
> > On Mon, Oct 24, 2022 at 6:21 PM Jeffrey Hugo <quic_jhugo@quicinc.com> w=
rote:
> > >
> > > On 10/22/2022 3:46 PM, Oded Gabbay wrote:
> > > > The accelerator devices are exposed to user-space using a dedicated
> > > > major. In addition, they are represented in /dev with new, dedicate=
d
> > > > device char names: /dev/accel/accel*. This is done to make sure any
> > > > user-space software that tries to open a graphic card won't open
> > > > the accelerator device by mistake.
> > > >
> > > > The above implies that the minor numbering should be separated from
> > > > the rest of the drm devices. However, to avoid code duplication, we
> > > > want the drm_minor structure to be able to represent the accelerato=
r
> > > > device.
> > > >
> > > > To achieve this, we add a new drm_minor* to drm_device that represe=
nts
> > > > the accelerator device. This pointer is initialized for drivers tha=
t
> > > > declare they handle compute accelerator, using a new driver feature
> > > > flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
> > > > driver feature is mutually exclusive with DRIVER_RENDER. Devices th=
at
> > > > want to expose both graphics and compute device char files should b=
e
> > > > handled by two drivers that are connected using the auxiliary bus
> > > > framework.
> > > >
> > > > In addition, we define a different idr to handle the accelerators
> > > > minors. This is done to make the minor's index be identical to the
> > > > device index in /dev/. In most places, this is hidden inside the dr=
m
> > > > core functions except when calling drm_minor_acquire(), where I had=
 to
> > > > add an extra parameter to specify the idr to use (because the
> > > > accelerators minors index and the drm primary minor index both begi=
n
> > > > at 0).
> > > >
> > > > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > > > ---
> > > >   drivers/gpu/drm/drm_drv.c      | 171 +++++++++++++++++++++++++---=
-----
> > > >   drivers/gpu/drm/drm_file.c     |  69 +++++++++----
> > > >   drivers/gpu/drm/drm_internal.h |   2 +-
> > > >   drivers/gpu/drm/drm_sysfs.c    |  29 ++++--
> > > >   include/drm/drm_device.h       |   3 +
> > > >   include/drm/drm_drv.h          |   8 ++
> > > >   include/drm/drm_file.h         |  21 +++-
> > > >   7 files changed, 235 insertions(+), 68 deletions(-)
> > >
> > > Can we please add something to Documentation?  I know this leverages =
DRM
> > > a lot, but I believe that a new subsystem should not be introduced
> > > without documentation.  A lot of the info in the commit message is ve=
ry
> > > good, but should not be buried in the git log.
> > >
> > > Besides, imagine this has been in mainline for N years, and someone
> > > completely new to the kernel wants to write an accel driver.  They
> > > should be able to get started with something from Documentation that
> > > at-least gives that person some insight into what to grep the code fo=
r.
> > Agreed. The only reason I haven't done it at this stage was because I
> > wanted to get an initial reaction to the code itself, see if the
> > direction is accepted.
> > I didn't want to write documentation and then completely re-write it.
> > So I will do it for the next patch-set, once I collect everyone's
> > feedback and I see there is a majority agreement.
> > >
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > > index b58ffb1433d6..c13701a8d4be 100644
> > > > --- a/drivers/gpu/drm/drm_drv.c
> > > > +++ b/drivers/gpu/drm/drm_drv.c
> > > > @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
> > > >   static DEFINE_SPINLOCK(drm_minor_lock);
> > > >   static struct idr drm_minors_idr;
> > > >
> > > > +static DEFINE_SPINLOCK(accel_minor_lock);
> > > > +static struct idr accel_minors_idr;
> > >
> > > IDR is deprecated.  XArray is the preferred mechanism.
> > > Yes, there already is IDR here, but I believe we should not be adding
> > > new uses.  Maybe at some point, the current IDR will be converted.  A=
lso
> > > with XArray, I think you don't need the spinlock since XArray has
> > > internal locking already.
> > ok, I wasn't aware. I don't have any problem replacing the idr to xarra=
y.
>
> The conversion is sitting on the mailinglist for a while now
> (unfortunately, without much interest).
> Perhaps you could help with reviewing it?
> https://lore.kernel.org/dri-devel/20220911211443.581481-2-michal.winiarsk=
i@intel.com/
>
> -Micha=C5=82
I'll do it.
Oded

>
> >
> > Thanks,
> > Oded
> >
