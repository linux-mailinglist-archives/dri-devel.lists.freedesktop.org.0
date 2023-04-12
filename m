Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD56DFFA6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 22:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C2D10E0FB;
	Wed, 12 Apr 2023 20:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40BB10E0FB;
 Wed, 12 Apr 2023 20:23:53 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1878a0bf68fso675282fac.7; 
 Wed, 12 Apr 2023 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681331032; x=1683923032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hg45uBVvTMYShLSKhLpBhqKCtbh24xk1xg+8wXUpC8U=;
 b=jV99TkiHswVj9FIDBP8GYCygB1vxWsnp+2gd1KDdFw+6Oorh8IuUUwJ26O02rMmVTC
 MrLGQBEH7k6xXAc9rp7fRYtRaHB6RRHsKzitPWsBhjHTwfXRcngdq1sEIRuvnC0I4h/X
 Z2vm+mGAXhbo0stXvOb1Vi8E26WY7pKA8FFlFIKwVqbYcbc9FVQSHkEYJfHGZypk0Z2l
 ZdyCSXcjugl6g/HTYtuA0/KTJe8b6c93nt0nZfXinw3Yez63AF43xai8qNUIgAjLV6HR
 YEL45Knph7EXnd5UEBMK+E6GKmJTXIBQlkxT4QnEw1spS7QJhwg9Uk4I2YL7Q6VT6HvC
 rrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331032; x=1683923032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hg45uBVvTMYShLSKhLpBhqKCtbh24xk1xg+8wXUpC8U=;
 b=DlCaxdb0nE1+tuD0WlwcNivkHwnCo5YNKWP4KodL8H4sVImjbnzl8rIxubGZdRT2P6
 yT2r/pCo5AGPsYYLxeqMtOm2KMw2Sn9YwRJ4HrlAjwTyh47HoGCzReGn72mXXclDnqAl
 tY6VM9oTZvJ6o0zJdsjC+WLyUUs4rI5k3Ri9xPW6L03eZjsHnAF9ccsmHfo6FhTtJH5F
 Aju+9vgmk4iv2J4mJiJv5lXK8BM3pZsLPLoq6zi7mivAcXtWKe6EavVSEcVPi5fU2GUS
 KfkqYkVGwJKkTtDNdP2umuWgGGP8ZGlJCom2PW5/eQ8vNjp1EgtVUKoy3RgtUlGkoTY4
 xRtw==
X-Gm-Message-State: AAQBX9dWpnRwMUCCWCd6T+lx//toSt/a4w3s0mzva/AjTUDJvWpfhxsI
 G5agWQrPuvAxIvhc8Vw4J9cp+YOKnWaVhWP1Fho=
X-Google-Smtp-Source: AKy350bu1rvTbELfK5EPFKNuR6cBSyemvgimm2V7zeJqweH15FedR28ffLZCjPzTck4ePdGPJg+DrwD1Pv8RfUm0KnE=
X-Received: by 2002:a05:6870:700e:b0:184:56bd:363a with SMTP id
 u14-20020a056870700e00b0018456bd363amr79734oae.3.1681331032388; Wed, 12 Apr
 2023 13:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
 <CAF6AEGsE3NOe9TkEzrk5rr-D2PoKaxF5Yn3W8wWew8um6r2EXw@mail.gmail.com>
 <d93f4256-4554-e031-9730-4ca2a7de6aaf@linaro.org>
 <ZDZntP+0wG6+QyHh@phenom.ffwll.local> <ZDaoT44hqnIH4ZX3@intel.com>
 <CAF6AEGtOEwG+Wdh_7Nox8pqmWJ=nMs-GFEqTU42Mf=wOFGKfRQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtOEwG+Wdh_7Nox8pqmWJ=nMs-GFEqTU42Mf=wOFGKfRQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Apr 2023 16:23:41 -0400
Message-ID: <CADnq5_OH5j1DotgpyYOfOLEdLjGU-9uytjYAz0maB2pOiwBihw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
To: Rob Clark <robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 4:10=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Wed, Apr 12, 2023 at 5:47=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@intel.=
com> wrote:
> >
> > On Wed, Apr 12, 2023 at 10:11:32AM +0200, Daniel Vetter wrote:
> > > On Wed, Apr 12, 2023 at 01:36:52AM +0300, Dmitry Baryshkov wrote:
> > > > On 11/04/2023 21:28, Rob Clark wrote:
> > > > > On Tue, Apr 11, 2023 at 10:36=E2=80=AFAM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> w=
rote:
> > > > > > >
> > > > > > > On Tue, Apr 11, 2023 at 9:53=E2=80=AFAM Daniel Vetter <daniel=
@ffwll.ch> wrote:
> > > > > > > >
> > > > > > > > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > > > > > > > > On Mon, Apr 10, 2023 at 2:06=E2=80=AFPM Rob Clark <robdcl=
ark@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > > >
> > > > > > > > > > Similar motivation to other similar recent attempt[1]. =
 But with an
> > > > > > > > > > attempt to have some shared code for this.  As well as =
documentation.
> > > > > > > > > >
> > > > > > > > > > It is probably a bit UMA-centric, I guess devices with =
VRAM might want
> > > > > > > > > > some placement stats as well.  But this seems like a re=
asonable start.
> > > > > > > > > >
> > > > > > > > > > Basic gputop support: https://patchwork.freedesktop.org=
/series/116236/
> > > > > > > > > > And already nvtop support: https://github.com/Syllo/nvt=
op/pull/204
> > > > > > > > >
> > > > > > > > > On a related topic, I'm wondering if it would make sense =
to report
> > > > > > > > > some more global things (temp, freq, etc) via fdinfo?  So=
me of this,
> > > > > > > > > tools like nvtop could get by trawling sysfs or other dri=
ver specific
> > > > > > > > > ways.  But maybe it makes sense to have these sort of thi=
ngs reported
> > > > > > > > > in a standardized way (even though they aren't really per=
-drm_file)
> > > > > > > >
> > > > > > > > I think that's a bit much layering violation, we'd essentia=
lly have to
> > > > > > > > reinvent the hwmon sysfs uapi in fdinfo. Not really a busin=
ess I want to
> > > > > > > > be in :-)
> > > > > > >
> > > > > > > I guess this is true for temp (where there are thermal zones =
with
> > > > > > > potentially multiple temp sensors.. but I'm still digging my =
way thru
> > > > > > > the thermal_cooling_device stuff)
> > > > > >
> > > > > > It is slightly ugly. All thermal zones and cooling devices are =
virtual
> > > > > > devices (so, even no connection to the particular tsens device)=
. One
> > > > > > can either enumerate them by checking
> > > > > > /sys/class/thermal/thermal_zoneN/type or enumerate them through
> > > > > > /sys/class/hwmon. For cooling devices again the only enumeratio=
n is
> > > > > > through /sys/class/thermal/cooling_deviceN/type.
> > > > > >
> > > > > > Probably it should be possible to push cooling devices and ther=
mal
> > > > > > zones under corresponding providers. However I do not know if t=
here is
> > > > > > a good way to correlate cooling device (ideally a part of GPU) =
to the
> > > > > > thermal_zone (which in our case is provided by tsens / temp_ala=
rm
> > > > > > rather than GPU itself).
> > > > > >
> > > > > > >
> > > > > > > But what about freq?  I think, esp for cases where some "fw t=
hing" is
> > > > > > > controlling the freq we end up needing to use gpu counters to=
 measure
> > > > > > > the freq.
> > > > > >
> > > > > > For the freq it is slightly easier: /sys/class/devfreq/*, devic=
es are
> > > > > > registered under proper parent (IOW, GPU). So one can read
> > > > > > /sys/class/devfreq/3d00000.gpu/cur_freq or
> > > > > > /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_f=
req.
> > > > > >
> > > > > > However because of the components usage, there is no link from
> > > > > > /sys/class/drm/card0
> > > > > > (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.=
display-controller/drm/card0)
> > > > > > to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
> > > > > >
> > > > > > Getting all these items together in a platform-independent way =
would
> > > > > > be definitely an important but complex topic.
> > > > >
> > > > > But I don't believe any of the pci gpu's use devfreq ;-)
> > > > >
> > > > > And also, you can't expect the CPU to actually know the freq when=
 fw
> > > > > is the one controlling freq.  We can, currently, have a reasonabl=
e
> > > > > approximation from devfreq but that stops if IFPC is implemented.=
  And
> > > > > other GPUs have even less direct control.  So freq is a thing tha=
t I
> > > > > don't think we should try to get from "common frameworks"
> > > >
> > > > I think it might be useful to add another passive devfreq governor =
type for
> > > > external frequencies. This way we can use the same interface to exp=
ort
> > > > non-CPU-controlled frequencies.
> > >
> > > Yeah this sounds like a decent idea to me too. It might also solve th=
e fun
> > > of various pci devices having very non-standard freq controls in sysf=
s
> > > (looking at least at i915 here ...)
> >
> > I also like the idea of having some common infrastructure for the GPU f=
req.
> >
> > hwmon have a good infrastructure, but they are more focused on individu=
al
> > monitoring devices and not very welcomed to embedded monitoring and con=
trol.
> > I still want to check the opportunity to see if at least some freq cont=
rol
> > could be aligned there.
> >
> > Another thing that complicates that is that there are multiple frequenc=
y
> > domains and controls with multipliers in Intel GPU that are not very
> > standard or easy to integrate.
> >
> > On a quick glace this devfreq seems neat because it aligns with the cpu=
freq
> > and governors. But again it would be hard to align with the multiple do=
mains
> > and controls. But it deserves a look.
> >
> > I will take a look to both fronts for Xe: hwmon and devfreq. Right now =
on
> > Xe we have a lot less controls than i915, but I can imagine soon there
> > will be requirements to make that to grow and I fear that we end up jus=
t
> > like i915. So I will take a look before that happens.
>
> So it looks like i915 (dgpu only) and nouveau already use hwmon.. so
> maybe this is a good way to expose temp.  Maybe we can wire up some
> sort of helper for drivers which use thermal_cooling_device (which can
> be composed of multiple sensors) to give back an aggregate temp for
> hwmon to report?

amdgpu uses hwmon as well for temp, voltage, power, etc.  Once of the
problems with hwmon is that it's designed around individual sensors.
However, on the GPU at least, most customers, at least in the
datacenter, want an atomic view of all of the attributes.  It would be
nice if there were some way to get nice snapshot of all of the
attributes at one time.

>
> Freq could possibly be added to hwmon (ie. seems like a reasonable
> attribute to add).  Devfreq might also be an option but on arm it
> isn't necessarily associated with the drm device, whereas we could
> associate the hwmon with the drm device to make it easier for
> userspace to find.

freq attributes seem natural for hwmon, at least for reporting.  I'm
not familiar with devfreq; I wonder if it's flexible enough to deal
with devices that might have full or partial firmware control of the
frequencies.  Moreover, each clock domain is not necessarily
independent.  You might have multiple clock domains with different
voltage, thermal, and tdp dependencies.  Power limits are controlled
via hwmon and you may need to adjust them in order to make certain
clock changes.  Then add in overclocking support on top and it gets
more complex.

Alex

>
> BR,
> -R
>
> > >
> > > I guess it would minimally be a good idea if we could document this, =
or
> > > maybe have a reference implementation in nvtop or whatever the cool t=
hing
> > > is rn.
> > > -Daniel
> > >
> > > >
> > > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > > >
> > > > > > > > What might be needed is better glue to go from the fd or fd=
info to the
> > > > > > > > right hw device and then crawl around the hwmon in sysfs au=
tomatically. I
> > > > > > > > would not be surprised at all if we really suck on this, pr=
obably more
> > > > > > > > likely on SoC than pci gpus where at least everything shoul=
d be under the
> > > > > > > > main pci sysfs device.
> > > > > > >
> > > > > > > yeah, I *think* userspace would have to look at /proc/device-=
tree to
> > > > > > > find the cooling device(s) associated with the gpu.. at least=
 I don't
> > > > > > > see a straightforward way to figure it out just for sysfs
> > > > > > >
> > > > > > > BR,
> > > > > > > -R
> > > > > > >
> > > > > > > > -Daniel
> > > > > > > >
> > > > > > > > >
> > > > > > > > > BR,
> > > > > > > > > -R
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > [1] https://patchwork.freedesktop.org/series/112397/
> > > > > > > > > >
> > > > > > > > > > Rob Clark (2):
> > > > > > > > > >    drm: Add fdinfo memory stats
> > > > > > > > > >    drm/msm: Add memory stats to fdinfo
> > > > > > > > > >
> > > > > > > > > >   Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > > > > > > > > >   drivers/gpu/drm/drm_file.c            | 79 ++++++++++=
+++++++++++++++++
> > > > > > > > > >   drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> > > > > > > > > >   drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > > > > > > > > >   include/drm/drm_file.h                | 10 ++++
> > > > > > > > > >   5 files changed, 134 insertions(+), 3 deletions(-)
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > 2.39.2
> > > > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Daniel Vetter
> > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > http://blog.ffwll.ch
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > With best wishes
> > > > > > Dmitry
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
