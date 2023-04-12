Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404366DFF6C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 22:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF6910E954;
	Wed, 12 Apr 2023 20:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9D510E954;
 Wed, 12 Apr 2023 20:09:59 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-187878a90e6so1146106fac.0; 
 Wed, 12 Apr 2023 13:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681330199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WJBfqgHDVPfKU8NYqpJEjIgLGTuDGEpHWnbrpLt7FQE=;
 b=P6HsoZ0NO/iam4SNYEbrXw4BqROT0RRXrgJ56x/VXdrUO32o3wsGnWJlcvQ5kffrR2
 Zd4+0RlZ1ieNb7R97RYmYIsqKoZbH2TjIW6m5fVv2lF+z9I9iv0fq0vxsvZZilWGYile
 VKOiAnijri3ZrRanaWrQL+DL9+dkL1rVE57qLQNITZ/1s9333Seu0eNYkoEnUG5CZPD+
 IwjBiUNNbxHp3HobiCjdKVtVWkMHjHJA0DDkECfia5oRkwIAjaqqWNdzNhbhFA+XNYO2
 yku1PJNKqKZBovbVqFUe7oiv/GppRXV9JkT17ByV30ZEy6j1b2/mPxlfPVLiKV2qPKWE
 X6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681330199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJBfqgHDVPfKU8NYqpJEjIgLGTuDGEpHWnbrpLt7FQE=;
 b=EdyqFCYUxu/WYLrRgTvt2WtahN9VboR7UnqbLDo7ERPsxxU6YYZla0sQdsxXwAVAx4
 Sjm3BjIcNB09MzfMwDXZk8O35GxEcwamBBlEqyHfAxcGUBPW4eMqL+2bWMTUkb3DnpVq
 EQuqUEhZp9e3aYzVNhrkXKVjTmYq1Q4gWD4dpx7nsn3xQpSIQktctxs5WeF3LOBa+b8n
 L/647BbSKbIN8SRM6tKeofrhsYGU8mxy39N0GfHidlkYOfADO9x2divzkqytzlnVYsD1
 kstqXR33l0qEdwB6VQX5Ydwd8Nq+yHe1Ye55s1QQCqNJlLhYJpmi0WVVGT3ngCcMBpA4
 FuJQ==
X-Gm-Message-State: AAQBX9flXvgCCduiqVW7WhAhwiC7tNC++m+vo/2lt7YoSDwFsVepCCt3
 BUj45hQgtlrh6CN5T9rYpQktnKyu/JPcvCicpGI=
X-Google-Smtp-Source: AKy350aZmcFxxAhjq8LuFNpT8Di/LKsi2s2OUu0hdtvPIfK+7c8LRJpt3pcAkoIfaq3PQlRent59Q5QZU0OwSwceIq8=
X-Received: by 2002:a05:6870:fbaa:b0:17f:2918:2f46 with SMTP id
 kv42-20020a056870fbaa00b0017f29182f46mr64463oab.5.1681330198644; Wed, 12 Apr
 2023 13:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
 <CAF6AEGsE3NOe9TkEzrk5rr-D2PoKaxF5Yn3W8wWew8um6r2EXw@mail.gmail.com>
 <d93f4256-4554-e031-9730-4ca2a7de6aaf@linaro.org>
 <ZDZntP+0wG6+QyHh@phenom.ffwll.local> <ZDaoT44hqnIH4ZX3@intel.com>
In-Reply-To: <ZDaoT44hqnIH4ZX3@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Apr 2023 13:09:47 -0700
Message-ID: <CAF6AEGtOEwG+Wdh_7Nox8pqmWJ=nMs-GFEqTU42Mf=wOFGKfRQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 5:47=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
>
> On Wed, Apr 12, 2023 at 10:11:32AM +0200, Daniel Vetter wrote:
> > On Wed, Apr 12, 2023 at 01:36:52AM +0300, Dmitry Baryshkov wrote:
> > > On 11/04/2023 21:28, Rob Clark wrote:
> > > > On Tue, Apr 11, 2023 at 10:36=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wro=
te:
> > > > > >
> > > > > > On Tue, Apr 11, 2023 at 9:53=E2=80=AFAM Daniel Vetter <daniel@f=
fwll.ch> wrote:
> > > > > > >
> > > > > > > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > > > > > > > On Mon, Apr 10, 2023 at 2:06=E2=80=AFPM Rob Clark <robdclar=
k@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > >
> > > > > > > > > Similar motivation to other similar recent attempt[1].  B=
ut with an
> > > > > > > > > attempt to have some shared code for this.  As well as do=
cumentation.
> > > > > > > > >
> > > > > > > > > It is probably a bit UMA-centric, I guess devices with VR=
AM might want
> > > > > > > > > some placement stats as well.  But this seems like a reas=
onable start.
> > > > > > > > >
> > > > > > > > > Basic gputop support: https://patchwork.freedesktop.org/s=
eries/116236/
> > > > > > > > > And already nvtop support: https://github.com/Syllo/nvtop=
/pull/204
> > > > > > > >
> > > > > > > > On a related topic, I'm wondering if it would make sense to=
 report
> > > > > > > > some more global things (temp, freq, etc) via fdinfo?  Some=
 of this,
> > > > > > > > tools like nvtop could get by trawling sysfs or other drive=
r specific
> > > > > > > > ways.  But maybe it makes sense to have these sort of thing=
s reported
> > > > > > > > in a standardized way (even though they aren't really per-d=
rm_file)
> > > > > > >
> > > > > > > I think that's a bit much layering violation, we'd essentiall=
y have to
> > > > > > > reinvent the hwmon sysfs uapi in fdinfo. Not really a busines=
s I want to
> > > > > > > be in :-)
> > > > > >
> > > > > > I guess this is true for temp (where there are thermal zones wi=
th
> > > > > > potentially multiple temp sensors.. but I'm still digging my wa=
y thru
> > > > > > the thermal_cooling_device stuff)
> > > > >
> > > > > It is slightly ugly. All thermal zones and cooling devices are vi=
rtual
> > > > > devices (so, even no connection to the particular tsens device). =
One
> > > > > can either enumerate them by checking
> > > > > /sys/class/thermal/thermal_zoneN/type or enumerate them through
> > > > > /sys/class/hwmon. For cooling devices again the only enumeration =
is
> > > > > through /sys/class/thermal/cooling_deviceN/type.
> > > > >
> > > > > Probably it should be possible to push cooling devices and therma=
l
> > > > > zones under corresponding providers. However I do not know if the=
re is
> > > > > a good way to correlate cooling device (ideally a part of GPU) to=
 the
> > > > > thermal_zone (which in our case is provided by tsens / temp_alarm
> > > > > rather than GPU itself).
> > > > >
> > > > > >
> > > > > > But what about freq?  I think, esp for cases where some "fw thi=
ng" is
> > > > > > controlling the freq we end up needing to use gpu counters to m=
easure
> > > > > > the freq.
> > > > >
> > > > > For the freq it is slightly easier: /sys/class/devfreq/*, devices=
 are
> > > > > registered under proper parent (IOW, GPU). So one can read
> > > > > /sys/class/devfreq/3d00000.gpu/cur_freq or
> > > > > /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_fre=
q.
> > > > >
> > > > > However because of the components usage, there is no link from
> > > > > /sys/class/drm/card0
> > > > > (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.di=
splay-controller/drm/card0)
> > > > > to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
> > > > >
> > > > > Getting all these items together in a platform-independent way wo=
uld
> > > > > be definitely an important but complex topic.
> > > >
> > > > But I don't believe any of the pci gpu's use devfreq ;-)
> > > >
> > > > And also, you can't expect the CPU to actually know the freq when f=
w
> > > > is the one controlling freq.  We can, currently, have a reasonable
> > > > approximation from devfreq but that stops if IFPC is implemented.  =
And
> > > > other GPUs have even less direct control.  So freq is a thing that =
I
> > > > don't think we should try to get from "common frameworks"
> > >
> > > I think it might be useful to add another passive devfreq governor ty=
pe for
> > > external frequencies. This way we can use the same interface to expor=
t
> > > non-CPU-controlled frequencies.
> >
> > Yeah this sounds like a decent idea to me too. It might also solve the =
fun
> > of various pci devices having very non-standard freq controls in sysfs
> > (looking at least at i915 here ...)
>
> I also like the idea of having some common infrastructure for the GPU fre=
q.
>
> hwmon have a good infrastructure, but they are more focused on individual
> monitoring devices and not very welcomed to embedded monitoring and contr=
ol.
> I still want to check the opportunity to see if at least some freq contro=
l
> could be aligned there.
>
> Another thing that complicates that is that there are multiple frequency
> domains and controls with multipliers in Intel GPU that are not very
> standard or easy to integrate.
>
> On a quick glace this devfreq seems neat because it aligns with the cpufr=
eq
> and governors. But again it would be hard to align with the multiple doma=
ins
> and controls. But it deserves a look.
>
> I will take a look to both fronts for Xe: hwmon and devfreq. Right now on
> Xe we have a lot less controls than i915, but I can imagine soon there
> will be requirements to make that to grow and I fear that we end up just
> like i915. So I will take a look before that happens.

So it looks like i915 (dgpu only) and nouveau already use hwmon.. so
maybe this is a good way to expose temp.  Maybe we can wire up some
sort of helper for drivers which use thermal_cooling_device (which can
be composed of multiple sensors) to give back an aggregate temp for
hwmon to report?

Freq could possibly be added to hwmon (ie. seems like a reasonable
attribute to add).  Devfreq might also be an option but on arm it
isn't necessarily associated with the drm device, whereas we could
associate the hwmon with the drm device to make it easier for
userspace to find.

BR,
-R

> >
> > I guess it would minimally be a good idea if we could document this, or
> > maybe have a reference implementation in nvtop or whatever the cool thi=
ng
> > is rn.
> > -Daniel
> >
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > >
> > > > > > > What might be needed is better glue to go from the fd or fdin=
fo to the
> > > > > > > right hw device and then crawl around the hwmon in sysfs auto=
matically. I
> > > > > > > would not be surprised at all if we really suck on this, prob=
ably more
> > > > > > > likely on SoC than pci gpus where at least everything should =
be under the
> > > > > > > main pci sysfs device.
> > > > > >
> > > > > > yeah, I *think* userspace would have to look at /proc/device-tr=
ee to
> > > > > > find the cooling device(s) associated with the gpu.. at least I=
 don't
> > > > > > see a straightforward way to figure it out just for sysfs
> > > > > >
> > > > > > BR,
> > > > > > -R
> > > > > >
> > > > > > > -Daniel
> > > > > > >
> > > > > > > >
> > > > > > > > BR,
> > > > > > > > -R
> > > > > > > >
> > > > > > > >
> > > > > > > > > [1] https://patchwork.freedesktop.org/series/112397/
> > > > > > > > >
> > > > > > > > > Rob Clark (2):
> > > > > > > > >    drm: Add fdinfo memory stats
> > > > > > > > >    drm/msm: Add memory stats to fdinfo
> > > > > > > > >
> > > > > > > > >   Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > > > > > > > >   drivers/gpu/drm/drm_file.c            | 79 ++++++++++++=
+++++++++++++++
> > > > > > > > >   drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> > > > > > > > >   drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > > > > > > > >   include/drm/drm_file.h                | 10 ++++
> > > > > > > > >   5 files changed, 134 insertions(+), 3 deletions(-)
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.39.2
> > > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
