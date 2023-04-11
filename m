Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147EB6DE3D2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 20:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D458510E34B;
	Tue, 11 Apr 2023 18:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C6F10E60C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 18:26:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f4130b898cso34151f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681237565;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6V2fpjYPL3sTmtLv/4ao+yq+fKEhSjDDl7REJsXZ3TQ=;
 b=d/zOnJVcqw74lXkfDZZyDOVgxROdHfNZVnimMK9k8hdpWl8ptHninUwzQqSnylc6dk
 AU95xm0qZ6TRmNZQU99Z6CrtzJgV9caG2BvHZ6TRGN1s+zeYiCvssaQ4OA7xsnluWqZn
 73hAIpcEjxwsKFiU3uqOeohoLEUmcBu3NCKFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681237565;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6V2fpjYPL3sTmtLv/4ao+yq+fKEhSjDDl7REJsXZ3TQ=;
 b=US8L6CEd7tZHRJybFOdbxpBFx8LtlkL4SD46mkGBSi/rnLcS37/iJJnWLBh98CRzm/
 +TB2OL04kaZdmIbPD+Ncnp6LXuxYEoo10G7U6LNe3S9UzkQWq4GbGULrIUT+YuSqRFm9
 NjVioVtU/a1DIEfP9k4hvAZfwZTPaIM39VaUcOgmYNYYTyX89y+Mfea+s8mVdwmSXrrr
 IJ9wQc6su5iIxkVgyCw8BXfgxzne+RThgoXH37H85yp2Lda0Tz5qI1H1pYKXB6Ir+zCA
 R+jyhpXX0/qTTzT3H0JwG60v9c4ogHUKOdj8eI8D0YPST/HVwEMK6/hRVYPaGBXBVwpg
 yKVA==
X-Gm-Message-State: AAQBX9dfIC1KQMTDGgg0wyMcMNIW8XV5/ys5VaYxtO1L3qrqzbNUrnDT
 nQNxTkPh1VtDuxuNRTlpA7M9eg==
X-Google-Smtp-Source: AKy350ZLN7z7OO5hsuZ3LMeZ1jZvhbwhr3vlegYw8TcKWLO3U/rRdkG0GmcZU7l+bRPFupzU7WNqNg==
X-Received: by 2002:a5d:644c:0:b0:2ef:9699:f906 with SMTP id
 d12-20020a5d644c000000b002ef9699f906mr39023wrw.7.1681237564706; 
 Tue, 11 Apr 2023 11:26:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e17-20020adffc51000000b002ef2e148d59sm14493882wrs.16.2023.04.11.11.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 11:26:04 -0700 (PDT)
Date: Tue, 11 Apr 2023 20:26:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
Message-ID: <ZDWmOsFL38ox+F5g@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 08:35:48PM +0300, Dmitry Baryshkov wrote:
> On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Apr 11, 2023 at 9:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > > > On Mon, Apr 10, 2023 at 2:06 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Similar motivation to other similar recent attempt[1].  But with an
> > > > > attempt to have some shared code for this.  As well as documentation.
> > > > >
> > > > > It is probably a bit UMA-centric, I guess devices with VRAM might want
> > > > > some placement stats as well.  But this seems like a reasonable start.
> > > > >
> > > > > Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> > > > > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> > > >
> > > > On a related topic, I'm wondering if it would make sense to report
> > > > some more global things (temp, freq, etc) via fdinfo?  Some of this,
> > > > tools like nvtop could get by trawling sysfs or other driver specific
> > > > ways.  But maybe it makes sense to have these sort of things reported
> > > > in a standardized way (even though they aren't really per-drm_file)
> > >
> > > I think that's a bit much layering violation, we'd essentially have to
> > > reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
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

There's not even sysfs links to connect the pieces in both ways?

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
> (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0)
> to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.

Hm ... do we need to make component more visible in sysfs, with _looooots_
of links? Atm it's just not even there.

> Getting all these items together in a platform-independent way would
> be definitely an important but complex topic.

Yeah this sounds like some work. But also sounds like it's all generic
issues (thermal zones above and component here) that really should be
fixed at that level?

Cheers, Daniel


> > > What might be needed is better glue to go from the fd or fdinfo to the
> > > right hw device and then crawl around the hwmon in sysfs automatically. I
> > > would not be surprised at all if we really suck on this, probably more
> > > likely on SoC than pci gpus where at least everything should be under the
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
> > > > >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
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

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
