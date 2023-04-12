Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92576DFF85
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 22:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD9210E959;
	Wed, 12 Apr 2023 20:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6651010E956
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 20:19:32 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-54bfa5e698eso394756427b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681330771; x=1683922771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTBfRC0LvSg06QgiZSsEJ06WzqdIIIpng+1SlnJvGDg=;
 b=wnRJwBqmiACuHtpVEqIwHDdg3GA5XSHjop9evKgRGBqje+3qMPEbYpxIcBTBgEJfut
 8Egwyx/v2cAAFWyjEwYAISZZvbH+9Ftu1f3IsT+GapthMoVtLgGUZUJngah+8MNWV10L
 PIP6/EYq9fGAchHg/+UJZ3xWWsmb1sX+W94wm8T+n1f3lxaq7XBqAtwB3rJv/W2Qei+m
 6ju/65zcJNmKXOMzro5s/V72TalgrZQPCTZPU+cPBHnRnmcXE+NcHVyXfuf+aiqXLAsq
 DJ6FwmPAmUQ9B8N9Y3Iv1PgasZnhVO2W0fP3g6egRhVfotUzQxIOIWnsSd3RChr6Ab8G
 FPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681330771; x=1683922771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UTBfRC0LvSg06QgiZSsEJ06WzqdIIIpng+1SlnJvGDg=;
 b=NKfl42Xy3bzRzoGGelfdqOf64TbbDQE9WAKsLXQp8Rrtl2C9IyfHBbgVBxldqNhOGG
 IWz1VYp8Cz9mox/t7W8VWvaQ52w8OWWa/mGkQjxjQPBdUpxheuIe4sVzUsRlxDoJrGxa
 7jVAcSm3f65bp3aJ+vr+HVUTztdSzVSAshiCxQ4XIuBdoja7mf4t6GHo0xDRb8XNzCLu
 kiQGjZYHFkfs0bRiTDOD2OyJp2braBJ7oPOYxe4O+zWbLqEre4WK4hRH7ucOj1IeNx0o
 hr68HREAEq6NbDGcv6UvCs7+Uddne/0m+VLaZtcFl7lIPMv3beIzLoU+U35c7PGXm9g0
 mtyg==
X-Gm-Message-State: AAQBX9dWmMgmxSh9eBNp2UoP5MGsx5dKDHWEu0R0fYYnV7oQO6iQZmRB
 +xKG6vQpwa1tDgw2IVHY0cSZnYTIwxcSs2vLykM36w==
X-Google-Smtp-Source: AKy350bCTF9qQ2g5MLXBdy0yjzrXjtWDco6Dp/V5MUtsVxURAVu+j8mkuberclHiRlugI+p9ycmjjhgEG8Dw+NcsIic=
X-Received: by 2002:a81:af0e:0:b0:54f:85a6:c80c with SMTP id
 n14-20020a81af0e000000b0054f85a6c80cmr2983965ywh.5.1681330771013; Wed, 12 Apr
 2023 13:19:31 -0700 (PDT)
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Apr 2023 23:19:19 +0300
Message-ID: <CAA8EJpoNc+cD9gSZx09JBiV2PFHO3teryaRqx2Ah+1R6dJbybw@mail.gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Apr 2023 at 23:09, Rob Clark <robdclark@gmail.com> wrote:
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

The thermal_device already registers the hwmon, see below. The
question is about linking that hwmon to the drm. Strictly speaking, I
don't think that we can reexport it in a clean way.

# grep gpu /sys/class/hwmon/hwmon*/name
/sys/class/hwmon/hwmon15/name:gpu_top_thermal
/sys/class/hwmon/hwmon24/name:gpu_bottom_thermal
# ls /sys/class/hwmon/hwmon15/ -l
lrwxrwxrwx    1 root     root             0 Jan 26 08:14 device ->
../../thermal_zone15
-r--r--r--    1 root     root          4096 Jan 26 08:14 name
drwxr-xr-x    2 root     root             0 Jan 26 08:15 power
lrwxrwxrwx    1 root     root             0 Jan 26 08:12 subsystem ->
../../../../../class/hwmon
-r--r--r--    1 root     root          4096 Jan 26 08:14 temp1_input
-rw-r--r--    1 root     root          4096 Jan 26 08:12 uevent

> Freq could possibly be added to hwmon (ie. seems like a reasonable
> attribute to add).  Devfreq might also be an option but on arm it
> isn't necessarily associated with the drm device, whereas we could
> associate the hwmon with the drm device to make it easier for
> userspace to find.

Possibly we can register a virtual 'passive' devfreq being driven by
another active devfreq device.

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



--=20
With best wishes
Dmitry
