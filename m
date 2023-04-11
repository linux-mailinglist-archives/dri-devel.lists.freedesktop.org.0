Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819A6DE3E8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 20:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1229710E113;
	Tue, 11 Apr 2023 18:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DBF10E113;
 Tue, 11 Apr 2023 18:29:05 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1842eb46746so10795438fac.4; 
 Tue, 11 Apr 2023 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681237745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04BQWUwBxDZ2Ggq7BQgfuwgR7cIa0rI/ETFyOfLGigY=;
 b=adR1pap581Si5eUy20kOKPZF+9sdl0vkghbMvZWluaR2MaugneQRN0zU6SAi61kDzv
 ohsvMWx6DU8krs4e8Dw4ch9e8pRuumtRyYCsKqJlA06lAH/aPab1WpvVhY1U49ZL+oRu
 9LUBqPrlgzx5AdGz/Q9Yo6f4UCetoXT/KbTydaEjGgWeF5w2JnYXC1Wq3XhPN3aeNfuW
 yBR5C6+erhkLFaNIU1IELQQ9xcyrjuk1g/OqGArd0vezAII6GLja7T+jBA3oXTRjSpiE
 I9gnuKtw3R3ImHTkbN1ygQumqawu50x7d6BsG2aTr9fdhTAzfo8R5pqNv6qkQY2bnqet
 j/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681237745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04BQWUwBxDZ2Ggq7BQgfuwgR7cIa0rI/ETFyOfLGigY=;
 b=ZyTDLpcswf6LcqiYJ4p6zbkQemA+QdgQo1j4AluYM+uYamfOGW1dcdaLKXCLm+s80B
 pcCnyMmA7zfWiAgJddZ4IkWEsE0D2Dx0wvH0QPOQtM0MBkhGX33xb/nqQgOuZBZ6M7hX
 4RZJL4y44qf5kHXKAEGK6nJoP4ywAKHCulI4D+xdBzoRBasSuHP5oWLJSXHSB0HHMgE9
 s0xTHjqRbTdT1mJoRWrfso+BwhdEXcjLrDCx19E+MsdcOIX79Chms6xGj4yJmAgRELO9
 tTkuHIHgUFdDCObPC5xyTpqClJ6WXPLOjjWtKI8d//i2gPOOAjzgxbQklQZUZXdztQyy
 GZgQ==
X-Gm-Message-State: AAQBX9cIWdj3kbzu9FPn9bag5A70TY/4s9dDCWTpClczom36h08qu9Eb
 3Nkd4352vuEwIPRLtvdghdomDW9aQl65fkDEJ5E=
X-Google-Smtp-Source: AKy350ZnxwLNoHMLAsnDrCIdVf4NqYNyx45hAU4P8O3GSVtWQDN1PG+sS9eukL4lgWdlEXuom0she3fyNoi/MMwTQXw=
X-Received: by 2002:a05:6870:5625:b0:180:b4c1:dfce with SMTP id
 m37-20020a056870562500b00180b4c1dfcemr5580747oao.5.1681237744881; Tue, 11 Apr
 2023 11:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
In-Reply-To: <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Apr 2023 11:28:53 -0700
Message-ID: <CAF6AEGsE3NOe9TkEzrk5rr-D2PoKaxF5Yn3W8wWew8um6r2EXw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 10:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Apr 11, 2023 at 9:53=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > >
> > > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > > > On Mon, Apr 10, 2023 at 2:06=E2=80=AFPM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Similar motivation to other similar recent attempt[1].  But with =
an
> > > > > attempt to have some shared code for this.  As well as documentat=
ion.
> > > > >
> > > > > It is probably a bit UMA-centric, I guess devices with VRAM might=
 want
> > > > > some placement stats as well.  But this seems like a reasonable s=
tart.
> > > > >
> > > > > Basic gputop support: https://patchwork.freedesktop.org/series/11=
6236/
> > > > > And already nvtop support: https://github.com/Syllo/nvtop/pull/20=
4
> > > >
> > > > On a related topic, I'm wondering if it would make sense to report
> > > > some more global things (temp, freq, etc) via fdinfo?  Some of this=
,
> > > > tools like nvtop could get by trawling sysfs or other driver specif=
ic
> > > > ways.  But maybe it makes sense to have these sort of things report=
ed
> > > > in a standardized way (even though they aren't really per-drm_file)
> > >
> > > I think that's a bit much layering violation, we'd essentially have t=
o
> > > reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want=
 to
> > > be in :-)
> >
> > I guess this is true for temp (where there are thermal zones with
> > potentially multiple temp sensors.. but I'm still digging my way thru
> > the thermal_cooling_device stuff)
>
> It is slightly ugly. All thermal zones and cooling devices are virtual
> devices (so, even no connection to the particular tsens device). One
> can either enumerate them by checking
> /sys/class/thermal/thermal_zoneN/type or enumerate them through
> /sys/class/hwmon. For cooling devices again the only enumeration is
> through /sys/class/thermal/cooling_deviceN/type.
>
> Probably it should be possible to push cooling devices and thermal
> zones under corresponding providers. However I do not know if there is
> a good way to correlate cooling device (ideally a part of GPU) to the
> thermal_zone (which in our case is provided by tsens / temp_alarm
> rather than GPU itself).
>
> >
> > But what about freq?  I think, esp for cases where some "fw thing" is
> > controlling the freq we end up needing to use gpu counters to measure
> > the freq.
>
> For the freq it is slightly easier: /sys/class/devfreq/*, devices are
> registered under proper parent (IOW, GPU). So one can read
> /sys/class/devfreq/3d00000.gpu/cur_freq or
> /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_freq.
>
> However because of the components usage, there is no link from
> /sys/class/drm/card0
> (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-co=
ntroller/drm/card0)
> to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
>
> Getting all these items together in a platform-independent way would
> be definitely an important but complex topic.

But I don't believe any of the pci gpu's use devfreq ;-)

And also, you can't expect the CPU to actually know the freq when fw
is the one controlling freq.  We can, currently, have a reasonable
approximation from devfreq but that stops if IFPC is implemented.  And
other GPUs have even less direct control.  So freq is a thing that I
don't think we should try to get from "common frameworks"

BR,
-R

> >
> > > What might be needed is better glue to go from the fd or fdinfo to th=
e
> > > right hw device and then crawl around the hwmon in sysfs automaticall=
y. I
> > > would not be surprised at all if we really suck on this, probably mor=
e
> > > likely on SoC than pci gpus where at least everything should be under=
 the
> > > main pci sysfs device.
> >
> > yeah, I *think* userspace would have to look at /proc/device-tree to
> > find the cooling device(s) associated with the gpu.. at least I don't
> > see a straightforward way to figure it out just for sysfs
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > >
> > > > > [1] https://patchwork.freedesktop.org/series/112397/
> > > > >
> > > > > Rob Clark (2):
> > > > >   drm: Add fdinfo memory stats
> > > > >   drm/msm: Add memory stats to fdinfo
> > > > >
> > > > >  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > > > >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> > > > >  drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > > > >  include/drm/drm_file.h                | 10 ++++
> > > > >  5 files changed, 134 insertions(+), 3 deletions(-)
> > > > >
> > > > > --
> > > > > 2.39.2
> > > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> With best wishes
> Dmitry
