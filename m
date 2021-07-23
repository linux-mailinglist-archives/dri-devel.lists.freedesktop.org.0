Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09C3D3B77
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 15:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E596EADB;
	Fri, 23 Jul 2021 13:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E9D6EADB;
 Fri, 23 Jul 2021 13:55:46 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id y18so1913396oiv.3;
 Fri, 23 Jul 2021 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xiPsKiuBgLzz3oB3FDFLXiY1QpcjZxgxWcIC1Z0FmcA=;
 b=gbsoif+XPhxPufph/CkMw2gkDKz/zNlBpDDas+YFMv88tlR9tXM1XMcp6IjlXecSmA
 ut6rvKtSEufQymSIJ88tKk+3e+ororext6Ka1DxiEg8qGvThzuvaWvAX5SMwwjUlNrv+
 jXIZ40IdtSqPnvcRenF6rb1ez65nLwBJ2T8Lso6pTeFs7MpvPLIG8pJxXADSVODzkKOD
 fw7jqxdxFMnCURd/LI/nJjwIh8TMF46KAEWA3J1C7cG46Uur1ADlEbFW3hRklWVmR1fo
 K6knuM1uX6BadvwBvDPPVCyU3XYwJOQVKeIo6fwip5aGXEsnyRKzLPj2mPZ8LKlCp4cM
 2/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xiPsKiuBgLzz3oB3FDFLXiY1QpcjZxgxWcIC1Z0FmcA=;
 b=WxukKZYN33JG9HyQMjyziO9CJapYq5xrGfHH0QQevwp9UQNbtxjwHsSyIxyz7iE0Y9
 aEDoky+MQfmxQXUzJGL/wvhAe2+48FRgvteQvPTss5L1ko8UxAeczYI317t/J9+CQNpg
 oQNaIWNMFWsCJAh3ZdPTWQOsFBGfWBBxw1QPJ9y113NHXrB9lls8yCEpLQDmo0fw1lAE
 eEybAhottYDAediyy2qz+sJ6TWRMujTvCHdAOg4GC1DwVyfQ2vToamphWjefV+Qj99bQ
 s6IBRd4Tx3nyvteIhF4FXJXz8yM+HG3yQ+ylm6gSSLZD0uGXrABY8z5Lv7YimSaqI9QA
 /eng==
X-Gm-Message-State: AOAM5333fmb09pYmbbT2IZ8skbQ1N+rvl8DDsYGFsrGrFpBoBD4p1+pN
 nsFiBdQ+LJjfVww035QqPw81g2rDcDD1OhdPOH4=
X-Google-Smtp-Source: ABdhPJyb44uuqN94xRc87Kltn8/j0jrUWmBh5Eox7SyhTrhh7cZTQ/qcByg6uPS5rJKeIO1K6JAGVtgf05YiA2jSC2Y=
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr3083988oiw.123.1627048545312; 
 Fri, 23 Jul 2021 06:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <e6f53b40-b8bf-3d2b-2dbe-a568254e15d3@linux.intel.com>
 <5a4e9aad-5ad6-aa66-ce9b-3a937af39736@amd.com>
 <c1d36ff0-c54c-a2ee-8b1f-68e5cc00cdb5@linux.intel.com>
In-Reply-To: <c1d36ff0-c54c-a2ee-8b1f-68e5cc00cdb5@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jul 2021 09:55:34 -0400
Message-ID: <CADnq5_Mq6FjVhhcvQ8kYTWH4k0tyAi6NJkXrmuBAcURmAa04-g@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC 0/8] Per client GPU stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Nieto,
 David M" <David.Nieto@amd.com>, Roy Sun <Roy.Sun@amd.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 9:51 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 23/07/2021 12:23, Christian K=C3=B6nig wrote:
> > Am 23.07.21 um 13:21 schrieb Tvrtko Ursulin:
> >>
> >> On 15/07/2021 10:18, Tvrtko Ursulin wrote:
> >>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>
> >>> Same old work but now rebased and series ending with some DRM docs
> >>> proposing
> >>> the common specification which should enable nice common userspace
> >>> tools to be
> >>> written.
> >>>
> >>> For the moment I only have intel_gpu_top converted to use this and
> >>> that seems to
> >>> work okay.
> >>>
> >>> v2:
> >>>   * Added prototype of possible amdgpu changes and spec updates to
> >>> align with the
> >>>     common spec.
> >>
> >> Not much interest for the common specification?
> >
> > Well I would rather say not much opposition :)
>
> Hah, thanks, that's good to hear!
>
> > Of hand everything you do in this patch set sounds absolutely sane to
> > me, just don't have any time to review it in detail.
>
> That's fine - could you maybe suggest who on the AMD side could have a
> look at the relevant patches?

Adding David and Roy who did the implementation for the AMD side.  Can
you take a look at these patches when you get a chance?

Thanks,

Alex


>
> Regards,
>
> Tvrtko
>
> >> For reference I've just posted the intel-gpu-top adaptation required
> >> to parse it here:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpa=
tchwork.freedesktop.org%2Fpatch%2F446041%2F%3Fseries%3D90464%26rev%3D2&amp;=
data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cc967de8b8c2b499eb25b08d94dcbf=
f2e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637626360837958764%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;sdata=3D07hzP1RuVQkFi8AXWK8i%2Ffu9ajnldcF36PLRrey5wXA%3=
D&amp;reserved=3D0.
> >>
> >>
> >> Note that this is not attempting to be a vendor agnostic tool but is
> >> adding per client data to existing i915 tool which uses PMU counters
> >> for global stats.
> >>
> >> intel-gpu-top: Intel Skylake (Gen9) @ /dev/dri/card0 -  335/ 339 MHz;
> >> 10% RC6;  1.24/ 4.18 W;      527 irqs/s
> >>
> >>       IMC reads:     3297 MiB/s
> >>      IMC writes:     2767 MiB/s
> >>
> >>          ENGINES BUSY MI_SEMA MI_WAIT
> >>        Render/3D   78.74%
> >> |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=8F
> >> |      0%      0%
> >>          Blitter    0.00% | |      0%      0%
> >>            Video    0.00% | |      0%      0%
> >>     VideoEnhance    0.00% | |      0%      0%
> >>
> >>    PID              NAME          Render/3D
> >> Blitter                      Video                    VideoEnhance
> >>  10202         neverball |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=8E || ||
> >> ||                          |
> >>   5665              Xorg |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=8D ||                          ||
> >> ||                          |
> >>   5679     xfce4-session | ||                          ||
> >> ||                          |
> >>   5772      ibus-ui-gtk3 | ||                          ||
> >> ||                          |
> >>   5775   ibus-extension- | ||                          ||
> >> ||                          |
> >>   5777          ibus-x11 | ||                          ||
> >> ||                          |
> >>   5823             xfwm4 | ||                          ||
> >> ||                          |
> >>
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>> Tvrtko Ursulin (8):
> >>>    drm/i915: Explicitly track DRM clients
> >>>    drm/i915: Make GEM contexts track DRM clients
> >>>    drm/i915: Track runtime spent in closed and unreachable GEM contex=
ts
> >>>    drm/i915: Track all user contexts per client
> >>>    drm/i915: Track context current active time
> >>>    drm: Document fdinfo format specification
> >>>    drm/i915: Expose client engine utilisation via fdinfo
> >>>    drm/amdgpu: Convert to common fdinfo format
> >>>
> >>>   Documentation/gpu/amdgpu.rst                  |  26 ++++
> >>>   Documentation/gpu/drm-usage-stats.rst         | 108 +++++++++++++
> >>>   Documentation/gpu/i915.rst                    |  27 ++++
> >>>   Documentation/gpu/index.rst                   |   1 +
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c    |  18 ++-
> >>>   drivers/gpu/drm/i915/Makefile                 |   5 +-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  42 ++++-
> >>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
> >>>   drivers/gpu/drm/i915/gt/intel_context.c       |  27 +++-
> >>>   drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
> >>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  24 ++-
> >>>   .../drm/i915/gt/intel_execlists_submission.c  |  23 ++-
> >>>   .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
> >>>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 ++--
> >>>   drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 +++
> >>>   drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
> >>>   drivers/gpu/drm/i915/i915_drm_client.c        | 143 +++++++++++++++=
+++
> >>>   drivers/gpu/drm/i915/i915_drm_client.h        |  66 ++++++++
> >>>   drivers/gpu/drm/i915/i915_drv.c               |   9 ++
> >>>   drivers/gpu/drm/i915/i915_drv.h               |   5 +
> >>>   drivers/gpu/drm/i915/i915_gem.c               |  21 ++-
> >>>   drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
> >>>   drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
> >>>   23 files changed, 581 insertions(+), 61 deletions(-)
> >>>   create mode 100644 Documentation/gpu/drm-usage-stats.rst
> >>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
> >>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
> >>>
> >
