Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F66DED44
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 10:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3904F10E733;
	Wed, 12 Apr 2023 08:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA0310E733
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:11:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f27a10f72bso165784f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681287095; x=1683879095;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ApQh3OO8N/EkSlcg/GoWQjRUynfLNJg2zkmAQ0bDPGw=;
 b=gfyWMUpShdnQKWyAjpTEdc2LlGQvtN0yklmxrUAwTj29EHlkO5IhoMlUjmWqHs/QD8
 Mb7XfysniPM4irakrgTheWv1Pk91OvVsHCAzzqQyCbxRl8G5wB9UshcnPPA6YQ4eGZmy
 QsJIeA5rz0iifCC/VUKfFFyWjgyIK9rVjnbmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681287095; x=1683879095;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ApQh3OO8N/EkSlcg/GoWQjRUynfLNJg2zkmAQ0bDPGw=;
 b=YVX+kEKDUwhVMAByx2cm7/wRjn6MjO6q2hQ5iQeIrkXqgdH1sTTSwhNmaJbWT+eUrm
 0QayZVPy7cQ4PPVUrXuvjWBilKHztHDvAR7eJebMQHhshg0+NXUlUc+8t1kDqGnSGNtn
 moBw06X/Ty+GvAi6e59SXdVrwPZjQsOsG1NtHFZrddybE480Xs3mSOmbIW80he17JBLu
 aexfAQpLO9pwTASY9OSJbHacFgJZ/GowK860WGQfqyrl1+xTPW15BlFwsFGDgk85DTbt
 K0n9GAtewni3BYGY7ErA9NyzODMEj9uhSOUZD5jsyvacoF2QS3dp9w0dyyJS+z/xTQM1
 k8nQ==
X-Gm-Message-State: AAQBX9e1/Isgmm9in4ERCwG0svGfXPM7HLu9nyPo/WEGm0JnmnnrnnME
 5nRYlsOKN3nhqCKDFc6/sUp5mQ==
X-Google-Smtp-Source: AKy350bnBOA1yKbUJKGFfK7Ajlx+yHLgcIBWXcno+RB9JgfyhFepkx/MEZdWOedrsJ7jrgeu2MHhLQ==
X-Received: by 2002:a5d:6588:0:b0:2e4:aa61:a50 with SMTP id
 q8-20020a5d6588000000b002e4aa610a50mr9004356wru.1.1681287094654; 
 Wed, 12 Apr 2023 01:11:34 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 m3-20020adfdc43000000b002c5691f13eesm16556148wrj.50.2023.04.12.01.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 01:11:34 -0700 (PDT)
Date: Wed, 12 Apr 2023 10:11:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
Message-ID: <ZDZntP+0wG6+QyHh@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
 <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
 <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
 <CAF6AEGsE3NOe9TkEzrk5rr-D2PoKaxF5Yn3W8wWew8um6r2EXw@mail.gmail.com>
 <d93f4256-4554-e031-9730-4ca2a7de6aaf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d93f4256-4554-e031-9730-4ca2a7de6aaf@linaro.org>
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
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 01:36:52AM +0300, Dmitry Baryshkov wrote:
> On 11/04/2023 21:28, Rob Clark wrote:
> > On Tue, Apr 11, 2023 at 10:36 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > 
> > > On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wrote:
> > > > 
> > > > On Tue, Apr 11, 2023 at 9:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > 
> > > > > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > > > > > On Mon, Apr 10, 2023 at 2:06 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > 
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > 
> > > > > > > Similar motivation to other similar recent attempt[1].  But with an
> > > > > > > attempt to have some shared code for this.  As well as documentation.
> > > > > > > 
> > > > > > > It is probably a bit UMA-centric, I guess devices with VRAM might want
> > > > > > > some placement stats as well.  But this seems like a reasonable start.
> > > > > > > 
> > > > > > > Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> > > > > > > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> > > > > > 
> > > > > > On a related topic, I'm wondering if it would make sense to report
> > > > > > some more global things (temp, freq, etc) via fdinfo?  Some of this,
> > > > > > tools like nvtop could get by trawling sysfs or other driver specific
> > > > > > ways.  But maybe it makes sense to have these sort of things reported
> > > > > > in a standardized way (even though they aren't really per-drm_file)
> > > > > 
> > > > > I think that's a bit much layering violation, we'd essentially have to
> > > > > reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
> > > > > be in :-)
> > > > 
> > > > I guess this is true for temp (where there are thermal zones with
> > > > potentially multiple temp sensors.. but I'm still digging my way thru
> > > > the thermal_cooling_device stuff)
> > > 
> > > It is slightly ugly. All thermal zones and cooling devices are virtual
> > > devices (so, even no connection to the particular tsens device). One
> > > can either enumerate them by checking
> > > /sys/class/thermal/thermal_zoneN/type or enumerate them through
> > > /sys/class/hwmon. For cooling devices again the only enumeration is
> > > through /sys/class/thermal/cooling_deviceN/type.
> > > 
> > > Probably it should be possible to push cooling devices and thermal
> > > zones under corresponding providers. However I do not know if there is
> > > a good way to correlate cooling device (ideally a part of GPU) to the
> > > thermal_zone (which in our case is provided by tsens / temp_alarm
> > > rather than GPU itself).
> > > 
> > > > 
> > > > But what about freq?  I think, esp for cases where some "fw thing" is
> > > > controlling the freq we end up needing to use gpu counters to measure
> > > > the freq.
> > > 
> > > For the freq it is slightly easier: /sys/class/devfreq/*, devices are
> > > registered under proper parent (IOW, GPU). So one can read
> > > /sys/class/devfreq/3d00000.gpu/cur_freq or
> > > /sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_freq.
> > > 
> > > However because of the components usage, there is no link from
> > > /sys/class/drm/card0
> > > (/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0)
> > > to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.
> > > 
> > > Getting all these items together in a platform-independent way would
> > > be definitely an important but complex topic.
> > 
> > But I don't believe any of the pci gpu's use devfreq ;-)
> > 
> > And also, you can't expect the CPU to actually know the freq when fw
> > is the one controlling freq.  We can, currently, have a reasonable
> > approximation from devfreq but that stops if IFPC is implemented.  And
> > other GPUs have even less direct control.  So freq is a thing that I
> > don't think we should try to get from "common frameworks"
> 
> I think it might be useful to add another passive devfreq governor type for
> external frequencies. This way we can use the same interface to export
> non-CPU-controlled frequencies.

Yeah this sounds like a decent idea to me too. It might also solve the fun
of various pci devices having very non-standard freq controls in sysfs
(looking at least at i915 here ...)

I guess it would minimally be a good idea if we could document this, or
maybe have a reference implementation in nvtop or whatever the cool thing
is rn.
-Daniel

> 
> > 
> > BR,
> > -R
> > 
> > > > 
> > > > > What might be needed is better glue to go from the fd or fdinfo to the
> > > > > right hw device and then crawl around the hwmon in sysfs automatically. I
> > > > > would not be surprised at all if we really suck on this, probably more
> > > > > likely on SoC than pci gpus where at least everything should be under the
> > > > > main pci sysfs device.
> > > > 
> > > > yeah, I *think* userspace would have to look at /proc/device-tree to
> > > > find the cooling device(s) associated with the gpu.. at least I don't
> > > > see a straightforward way to figure it out just for sysfs
> > > > 
> > > > BR,
> > > > -R
> > > > 
> > > > > -Daniel
> > > > > 
> > > > > > 
> > > > > > BR,
> > > > > > -R
> > > > > > 
> > > > > > 
> > > > > > > [1] https://patchwork.freedesktop.org/series/112397/
> > > > > > > 
> > > > > > > Rob Clark (2):
> > > > > > >    drm: Add fdinfo memory stats
> > > > > > >    drm/msm: Add memory stats to fdinfo
> > > > > > > 
> > > > > > >   Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > > > > > >   drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
> > > > > > >   drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> > > > > > >   drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > > > > > >   include/drm/drm_file.h                | 10 ++++
> > > > > > >   5 files changed, 134 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > --
> > > > > > > 2.39.2
> > > > > > > 
> > > > > 
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > 
> > > 
> > > 
> > > --
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
