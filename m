Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91196DE21A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 19:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDACA10E5DC;
	Tue, 11 Apr 2023 17:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FF710E5D5;
 Tue, 11 Apr 2023 17:13:22 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i15-20020a9d610f000000b006a11f365d13so3472460otj.0; 
 Tue, 11 Apr 2023 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681233201;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxtzPcW3Ex5kMGD7sa+/5wWtmpcBmZsy3edwHTQbrFE=;
 b=hUdi5klm1amL18vIBphzpl7YJCKzA7wc0SjMwOMy6c6GMOfnFpG9mGtJ25V+UYaVQq
 2fDyeLg24ZpdsPq07LjMfs+8kkQRct/Q0bZZ8Q8izB9jT0SaHHhbBDyB8+vHVeBCQR2A
 S9KipMuDJpJp39e04BPyhZIQ4iGNC5FDJZX8Ch7TieL7LLlVMX4p5xDTAJsgLZtOJe/n
 5cuzoi3W5QuFWgNLejG40+9AMzIOkAySqYy27yd2LUcqf74bkfJVKB0rze8wtmM+BuMf
 8ND4yGMHYzPlkvxNYXLedui3s9QcvZyoj6UzC8ngzlrZfUWc/gPt6PpV8+YDSIQ+jYVB
 ICrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233201;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DxtzPcW3Ex5kMGD7sa+/5wWtmpcBmZsy3edwHTQbrFE=;
 b=KfkyT8gEKQJW+eBUXJ66wuzB/dzwdFiXGfBXa+xzXB+BPdzh4n458s1TnwcCLT0JfM
 nPeWciFQwFEYsRkGgfkIDPJmOxiaQhOCH/P+ErzktjPNSdriGEnlTeqM98MG/3ToYXVF
 Q+WRlZuLkfzNVXXCH6NIR0zv2u+2SHJuXMjNM8tjMwX/kLadKCQk9OHhLtj/9W7RA4jT
 xi6takNyzYm6tqzMO82d0ZEg9hgVBtGtEWPOIcF45XJ70UeQz7oZQ8Q0IjMTqaZ5Pcyv
 N4tOZDgAKuTfy4EuoTIxRsEIND15tb6cmmJoDmpo1se8SWoRUCQuF9yERaAfQFHlOivU
 e0Qw==
X-Gm-Message-State: AAQBX9ewsW2zPAsQDkTxi6HaB7iT35wOA5KzQ8sNxwWeorPInBpxcppk
 JTlEIJrw8kQfWjaqBGP1834oYHZKZGzGdwrcoDo=
X-Google-Smtp-Source: AKy350ZJXfWSqMLKwYKQjji07J9nMEef1IpUVstXdq+Nzk9LgEtRt9GxW0qAMsQE3ccyyrXnl53Y7VyMzoN5lu5dGCE=
X-Received: by 2002:a05:6830:1d73:b0:69f:abec:b057 with SMTP id
 l19-20020a0568301d7300b0069fabecb057mr3650582oti.7.1681233201703; Tue, 11 Apr
 2023 10:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
In-Reply-To: <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Apr 2023 10:13:10 -0700
Message-ID: <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm: fdinfo memory stats
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 Emil Velikov <emil.l.velikov@gmail.com>, Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 9:53=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > On Mon, Apr 10, 2023 at 2:06=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Similar motivation to other similar recent attempt[1].  But with an
> > > attempt to have some shared code for this.  As well as documentation.
> > >
> > > It is probably a bit UMA-centric, I guess devices with VRAM might wan=
t
> > > some placement stats as well.  But this seems like a reasonable start=
.
> > >
> > > Basic gputop support: https://patchwork.freedesktop.org/series/116236=
/
> > > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> >
> > On a related topic, I'm wondering if it would make sense to report
> > some more global things (temp, freq, etc) via fdinfo?  Some of this,
> > tools like nvtop could get by trawling sysfs or other driver specific
> > ways.  But maybe it makes sense to have these sort of things reported
> > in a standardized way (even though they aren't really per-drm_file)
>
> I think that's a bit much layering violation, we'd essentially have to
> reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
> be in :-)

I guess this is true for temp (where there are thermal zones with
potentially multiple temp sensors.. but I'm still digging my way thru
the thermal_cooling_device stuff)

But what about freq?  I think, esp for cases where some "fw thing" is
controlling the freq we end up needing to use gpu counters to measure
the freq.

> What might be needed is better glue to go from the fd or fdinfo to the
> right hw device and then crawl around the hwmon in sysfs automatically. I
> would not be surprised at all if we really suck on this, probably more
> likely on SoC than pci gpus where at least everything should be under the
> main pci sysfs device.

yeah, I *think* userspace would have to look at /proc/device-tree to
find the cooling device(s) associated with the gpu.. at least I don't
see a straightforward way to figure it out just for sysfs

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> >
> > > [1] https://patchwork.freedesktop.org/series/112397/
> > >
> > > Rob Clark (2):
> > >   drm: Add fdinfo memory stats
> > >   drm/msm: Add memory stats to fdinfo
> > >
> > >  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> > >  drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > >  include/drm/drm_file.h                | 10 ++++
> > >  5 files changed, 134 insertions(+), 3 deletions(-)
> > >
> > > --
> > > 2.39.2
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
