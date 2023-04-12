Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC96DFFF4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 22:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E50010E96E;
	Wed, 12 Apr 2023 20:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D326210E974;
 Wed, 12 Apr 2023 20:34:32 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id ec6so1946485oib.8;
 Wed, 12 Apr 2023 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681331672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukvfKrWTMbtKDrhAH2p+2mgTMVHipRVIbeqsAb4+6v8=;
 b=j8tXkuNOWXBH+4MthDNYIj4BGF9eQpAauOnpcE9V+TGy5cE2+h6bBK1igAt3GcNKGk
 AJGBbt3YShbo7vujEeXjJQF3kQRmNW7z5I+TvcEK6S+FkvsgL0w4aeQGuGE43E0o39TT
 m/+fqmnwdBpAasINQEoo8jpB1+f1R5HbbAdDYBINn6v0cjUgWDYZfYuSq6XYzHSaR7Gq
 5K9Qz7POQSgBE+3XsIdh91UDSzNEvsuJuPWwONI0Z+0h+HZp+dZGMkaMFV1Afvz1Yiza
 ZUItETKRA7JMJ++ZbbQRor1MSp+UzGFjKVuzTYbGHH8hWMZqjt8ilskI2va7IS0ve67O
 kiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ukvfKrWTMbtKDrhAH2p+2mgTMVHipRVIbeqsAb4+6v8=;
 b=E2NeShTxZtwRRm0fsw02s9V09/7dJYStb74iaKsv1mw4VjWnrzHOtoG2a3lDlF5RCl
 0JPZsQ8Hxg9U7XKn+9bA6IO6RWExw1tI4/TkGKohQkG1Yg/mXuF/jkOuHeWcWJcqeaUi
 6xDaD/eG1q1PcNUJOi02bIu4tNmrIbrHdfT3ZhCU6U7+v8uIEgFg0MOssI6E1VQG6mnZ
 SSyrkF3gzWBs0Ll3wZR9g1M18gkg9JPc3IPuyPKhb+8t4o0cs4R9ZjzeXd54H7E0mH9H
 KTSGhA6cyN5OK2BnFGkBh/0zPHJ6OU/gptGVS0nIr/RL0X0JuoYZC6dhZnKiRZp6A8lT
 aYCA==
X-Gm-Message-State: AAQBX9fNnoKRusWDFyXug5bF+h7SpIQk5H+Vkl/4EaBXf6iQiLirysUC
 JKIWEn0PRI+cLmurwpmUaaERsRO1JHO/Z0xt7YI=
X-Google-Smtp-Source: AKy350bxAXRX5aBerO0YUKhS3D/OyYv66R+USmVpYsivgBtbeDsGb9KX4bMrhGZ/r1Qd4BnhpXokycYxtz4nGLqMRCs=
X-Received: by 2002:a05:6808:2994:b0:384:1e6a:bf10 with SMTP id
 ex20-20020a056808299400b003841e6abf10mr3195344oib.5.1681331671757; Wed, 12
 Apr 2023 13:34:31 -0700 (PDT)
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
 <CAA8EJpoNc+cD9gSZx09JBiV2PFHO3teryaRqx2Ah+1R6dJbybw@mail.gmail.com>
In-Reply-To: <CAA8EJpoNc+cD9gSZx09JBiV2PFHO3teryaRqx2Ah+1R6dJbybw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Apr 2023 13:34:20 -0700
Message-ID: <CAF6AEGtK2o6hPwTOhmFM5mncvgrCXL-fx4ukz1TQpRUZMjCV=w@mail.gmail.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 1:19=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 12 Apr 2023 at 23:09, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Apr 12, 2023 at 5:47=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@inte=
l.com> wrote:
> > >
> > > On Wed, Apr 12, 2023 at 10:11:32AM +0200, Daniel Vetter wrote:
> > > > On Wed, Apr 12, 2023 at 01:36:52AM +0300, Dmitry Baryshkov wrote:
> > > > > On 11/04/2023 21:28, Rob Clark wrote:
> > > > > > On Tue, Apr 11, 2023 at 10:36=E2=80=AFAM Dmitry Baryshkov
> > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > > >
> > > > > > > On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com>=
 wrote:
> > > > > > > >
> > > > > > > > On Tue, Apr 11, 2023 at 9:53=E2=80=AFAM Daniel Vetter <dani=
el@ffwll.ch> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote=
:
> > > > > > > > > > On Mon, Apr 10, 2023 at 2:06=E2=80=AFPM Rob Clark <robd=
clark@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > > > >
> > > > > > > > > > > Similar motivation to other similar recent attempt[1]=
.  But with an
> > > > > > > > > > > attempt to have some shared code for this.  As well a=
s documentation.
> > > > > > > > > > >
> > > > > > > > > > > It is probably a bit UMA-centric, I guess devices wit=
h VRAM might want
> > > > > > > > > > > some placement stats as well.  But this seems like a =
reasonable start.
> > > > > > > > > > >
> > > > > > > > > > > Basic gputop support: https://patchwork.freedesktop.o=
rg/series/116236/
> > > > > > > > > > > And already nvtop support: https://github.com/Syllo/n=
vtop/pull/204
> > > > > > > > > >
> > > > > > > > > > On a related topic, I'm wondering if it would make sens=
e to report
> > > > > > > > > > some more global things (temp, freq, etc) via fdinfo?  =
Some of this,
> > > > > > > > > > tools like nvtop could get by trawling sysfs or other d=
river specific
> > > > > > > > > > ways.  But maybe it makes sense to have these sort of t=
hings reported
> > > > > > > > > > in a standardized way (even though they aren't really p=
er-drm_file)
> > > > > > > > >
> > > > > > > > > I think that's a bit much layering violation, we'd essent=
ially have to
> > > > > > > > > reinvent the hwmon sysfs uapi in fdinfo. Not really a bus=
iness I want to
> > > > > > > > > be in :-)
> > > > > > > >
> > > > > > > > I guess this is true for temp (where there are thermal zone=
s with
> > > > > > > > potentially multiple temp sensors.. but I'm still digging m=
y way thru
> > > > > > > > the thermal_cooling_device stuff)
> > > > > > >
> > > > > > > It is slightly ugly. All thermal zones and cooling devices ar=
e virtual
> > > > > > > devices (so, even no connection to the particular tsens devic=
e). One
> > > > > > > can either enumerate them by checking
> > > > > > > /sys/class/thermal/thermal_zoneN/type or enumerate them throu=
gh
> > > > > > > /sys/class/hwmon. For cooling devices again the only enumerat=
ion is
> > > > > > > through /sys/class/thermal/cooling_deviceN/type.
> > > > > > >
> > > > > > > Probably it should be possible to push cooling devices and th=
ermal
> > > > > > > zones under corresponding providers. However I do not know if=
 there is
> > > > > > > a good way to correlate cooling device (ideally a part of GPU=
) to the
> > > > > > > thermal_zone (which in our case is provided by tsens / temp_a=
larm
> > > > > > > rather than GPU itself).
> > > > > > >
> > > > > > > >
> > > > > > > > But what about freq?  I think, esp for cases where some "fw=
 thing" is
> > > > > > > > controlling the freq we end up needing to use gpu counters =
to measure
> > > > > > > > the freq.
> > > > > > >
> > > > > > > For the freq it is slightly easier: /sys/class/devfreq/*, dev=
ices are
> > > > > > > registered under proper parent (IOW, GPU). So one can read
> > > > > > > /sys/class/devfreq/3d00000.gpu/cur_freq or
> > > > > > > /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur=
_freq.
> > > > > > >
> > > > > > > However because of the components usage, there is no link fro=
m
> > > > > > > /sys/class/drm/card0
> > > > > > > (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae0100=
0.display-controller/drm/card0)
> > > > > > > to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
> > > > > > >
> > > > > > > Getting all these items together in a platform-independent wa=
y would
> > > > > > > be definitely an important but complex topic.
> > > > > >
> > > > > > But I don't believe any of the pci gpu's use devfreq ;-)
> > > > > >
> > > > > > And also, you can't expect the CPU to actually know the freq wh=
en fw
> > > > > > is the one controlling freq.  We can, currently, have a reasona=
ble
> > > > > > approximation from devfreq but that stops if IFPC is implemente=
d.  And
> > > > > > other GPUs have even less direct control.  So freq is a thing t=
hat I
> > > > > > don't think we should try to get from "common frameworks"
> > > > >
> > > > > I think it might be useful to add another passive devfreq governo=
r type for
> > > > > external frequencies. This way we can use the same interface to e=
xport
> > > > > non-CPU-controlled frequencies.
> > > >
> > > > Yeah this sounds like a decent idea to me too. It might also solve =
the fun
> > > > of various pci devices having very non-standard freq controls in sy=
sfs
> > > > (looking at least at i915 here ...)
> > >
> > > I also like the idea of having some common infrastructure for the GPU=
 freq.
> > >
> > > hwmon have a good infrastructure, but they are more focused on indivi=
dual
> > > monitoring devices and not very welcomed to embedded monitoring and c=
ontrol.
> > > I still want to check the opportunity to see if at least some freq co=
ntrol
> > > could be aligned there.
> > >
> > > Another thing that complicates that is that there are multiple freque=
ncy
> > > domains and controls with multipliers in Intel GPU that are not very
> > > standard or easy to integrate.
> > >
> > > On a quick glace this devfreq seems neat because it aligns with the c=
pufreq
> > > and governors. But again it would be hard to align with the multiple =
domains
> > > and controls. But it deserves a look.
> > >
> > > I will take a look to both fronts for Xe: hwmon and devfreq. Right no=
w on
> > > Xe we have a lot less controls than i915, but I can imagine soon ther=
e
> > > will be requirements to make that to grow and I fear that we end up j=
ust
> > > like i915. So I will take a look before that happens.
> >
> > So it looks like i915 (dgpu only) and nouveau already use hwmon.. so
> > maybe this is a good way to expose temp.  Maybe we can wire up some
> > sort of helper for drivers which use thermal_cooling_device (which can
> > be composed of multiple sensors) to give back an aggregate temp for
> > hwmon to report?
>
> The thermal_device already registers the hwmon, see below. The
> question is about linking that hwmon to the drm. Strictly speaking, I
> don't think that we can reexport it in a clean way.
>
> # grep gpu /sys/class/hwmon/hwmon*/name
> /sys/class/hwmon/hwmon15/name:gpu_top_thermal
> /sys/class/hwmon/hwmon24/name:gpu_bottom_thermal

I can't get excited about userspace relying on naming conventions or
other heuristics like this.  Also, userspace's view of the world is
very much that there is a "gpu card", not a collection of parts.
(Windows seems to have the same view of the world.)  So we have the
component framework to assemble the various parts together into the
"device" that userspace expects to deal with.  We need to do something
similar for exposing temp and freq.

> # ls /sys/class/hwmon/hwmon15/ -l
> lrwxrwxrwx    1 root     root             0 Jan 26 08:14 device ->
> ../../thermal_zone15
> -r--r--r--    1 root     root          4096 Jan 26 08:14 name
> drwxr-xr-x    2 root     root             0 Jan 26 08:15 power
> lrwxrwxrwx    1 root     root             0 Jan 26 08:12 subsystem ->
> ../../../../../class/hwmon
> -r--r--r--    1 root     root          4096 Jan 26 08:14 temp1_input
> -rw-r--r--    1 root     root          4096 Jan 26 08:12 uevent
>
> > Freq could possibly be added to hwmon (ie. seems like a reasonable
> > attribute to add).  Devfreq might also be an option but on arm it
> > isn't necessarily associated with the drm device, whereas we could
> > associate the hwmon with the drm device to make it easier for
> > userspace to find.
>
> Possibly we can register a virtual 'passive' devfreq being driven by
> another active devfreq device.

That's all fine and good, but it has the same problem that existing
hwmon's associated with the cooling-device have..

BR,
-R

> >
> > BR,
> > -R
> >
> > > >
> > > > I guess it would minimally be a good idea if we could document this=
, or
> > > > maybe have a reference implementation in nvtop or whatever the cool=
 thing
> > > > is rn.
> > > > -Daniel
> > > >
> > > > >
> > > > > >
> > > > > > BR,
> > > > > > -R
> > > > > >
> > > > > > > >
> > > > > > > > > What might be needed is better glue to go from the fd or =
fdinfo to the
> > > > > > > > > right hw device and then crawl around the hwmon in sysfs =
automatically. I
> > > > > > > > > would not be surprised at all if we really suck on this, =
probably more
> > > > > > > > > likely on SoC than pci gpus where at least everything sho=
uld be under the
> > > > > > > > > main pci sysfs device.
> > > > > > > >
> > > > > > > > yeah, I *think* userspace would have to look at /proc/devic=
e-tree to
> > > > > > > > find the cooling device(s) associated with the gpu.. at lea=
st I don't
> > > > > > > > see a straightforward way to figure it out just for sysfs
> > > > > > > >
> > > > > > > > BR,
> > > > > > > > -R
> > > > > > > >
> > > > > > > > > -Daniel
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > BR,
> > > > > > > > > > -R
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > [1] https://patchwork.freedesktop.org/series/112397/
> > > > > > > > > > >
> > > > > > > > > > > Rob Clark (2):
> > > > > > > > > > >    drm: Add fdinfo memory stats
> > > > > > > > > > >    drm/msm: Add memory stats to fdinfo
> > > > > > > > > > >
> > > > > > > > > > >   Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > > > > > > > > > >   drivers/gpu/drm/drm_file.c            | 79 ++++++++=
+++++++++++++++++++
> > > > > > > > > > >   drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++=
-
> > > > > > > > > > >   drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > > > > > > > > > >   include/drm/drm_file.h                | 10 ++++
> > > > > > > > > > >   5 files changed, 134 insertions(+), 3 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > 2.39.2
> > > > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Daniel Vetter
> > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > http://blog.ffwll.ch
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > With best wishes
> > > > > > > Dmitry
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
>
>
>
> --
> With best wishes
> Dmitry
