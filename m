Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F138037F
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 07:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9886EE08;
	Fri, 14 May 2021 05:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D3D6E196;
 Fri, 14 May 2021 05:58:45 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so25630577otp.11; 
 Thu, 13 May 2021 22:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pVWajPyYcbpa8eIUWcNxrzfnoigWxSBYwCymPLbMoAs=;
 b=FhSuE2SoTRYpYljyoCyELWj1LGJ/lIYGAEIMjauVmA3XgThiacWIQu35tA+xOxKNeU
 b23erC1Ds6l9TMiVmIcVe7wkH7h4r6tTBlPawLVfPV9W11156WtH/y3oAqIvaojGZ6Sx
 h1hEgiY4hkYO6KQ6kURP1XZj1F7q5eHd/A1a82+q80wuWtzqtGJGfgN7CiKb/F0+J3Nt
 oATLIa4ACKxMeXdYhSS2DvaAj46M/zu1iWle9i3WPyHeYtsHFfVW6lZDBXjK+cq89Moz
 SS270yoEuWWUMhABsZ7MwVFf0bsZaVeY8RcXgMhofMUZifHI+x6h729hcXwgcF42qGM/
 ghCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pVWajPyYcbpa8eIUWcNxrzfnoigWxSBYwCymPLbMoAs=;
 b=YqTygkU+oMbLuxfZ2Rr3YPO/DhlsJQCQPAahsWh28N9V+J9dpNyi+ieJlXc+5W6Xxz
 wJbr5XVeOl8Zp0KtF6uAerz5kb0rDerKFNDaGMarUeJrqfiJ3xsPNvaCoNFGCoEQYSHh
 8YrusjCkeysiBt3lqASA6AFFQ7bZ+EgYHOEKi1t1dvTugZkexkd7ysPveQ6xvRrIjMUD
 nvl4ZZaSYb3CBvZLe68pMUaYk+4+h19KYrp/bmh2bGnNSSmJOPPs1yGe8pjjicXQWk0p
 YIZoFyn/yNE45iLCvziKo8ZyBg36S18wstLnGX6McuxQka8KFU6kqPQVl4KbcHEni8UG
 Lgkw==
X-Gm-Message-State: AOAM530BL1q09WmeB9pLckzcWB+q+7OwFIcYJ2+1/x6MOGpfFARFsTOG
 7s9jh28vnjdjAXqJ/b4ZAPlo6qFppO9ZFae9J3P54Hfu
X-Google-Smtp-Source: ABdhPJw7PZlK88Qbqb0j2aqMwMDSDFgCJ0XlC/mMq4awIMG6dA/HYGufJM53L8A/sP8WNI93oikQcK32tnOtufMBA+o=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr36095677oti.23.1620971924684; 
 Thu, 13 May 2021 22:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
In-Reply-To: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 May 2021 01:58:33 -0400
Message-ID: <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Nieto,
 David M" <David.Nieto@amd.com>, 
 Christian Koenig <christian.koenig@amd.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ David, Christian

On Thu, May 13, 2021 at 12:41 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> Hi,
>
> On 13/05/2021 16:48, Alex Deucher wrote:
> > On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Resurrect of the previosuly merged per client engine busyness patches.=
 In a
> >> nutshell it enables intel_gpu_top to be more top(1) like useful and sh=
ow not
> >> only physical GPU engine usage but per process view as well.
> >>
> >> Example screen capture:
> >> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
> >> intel-gpu-top -  906/ 955 MHz;    0% RC6;  5.30 Watts;      933 irqs/s
> >>
> >>        IMC reads:     4414 MiB/s
> >>       IMC writes:     3805 MiB/s
> >>
> >>            ENGINE      BUSY                                      MI_SE=
MA MI_WAIT
> >>       Render/3D/0   93.46% |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=8B  |      0%      0%
> >>         Blitter/0    0.00% |                                   |      =
0%      0%
> >>           Video/0    0.00% |                                   |      =
0%      0%
> >>    VideoEnhance/0    0.00% |                                   |      =
0%      0%
> >>
> >>    PID            NAME  Render/3D      Blitter        Video      Video=
Enhance
> >>   2733       neverball |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=8C     ||            ||            ||            |
> >>   2047            Xorg |=E2=96=88=E2=96=88=E2=96=88=E2=96=8A        ||=
            ||            ||            |
> >>   2737        glxgears |=E2=96=88=E2=96=8D          ||            ||  =
          ||            |
> >>   2128           xfwm4 |            ||            ||            ||    =
        |
> >>   2047            Xorg |            ||            ||            ||    =
        |
> >> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
> >>
> >> Internally we track time spent on engines for each struct intel_contex=
t, both
> >> for current and past contexts belonging to each open DRM file.
> >>
> >> This can serve as a building block for several features from the wante=
d list:
> >> smarter scheduler decisions, getrusage(2)-like per-GEM-context functio=
nality
> >> wanted by some customers, setrlimit(2) like controls, cgroups controll=
er,
> >> dynamic SSEU tuning, ...
> >>
> >> To enable userspace access to the tracked data, we expose time spent o=
n GPU per
> >> client and per engine class in sysfs with a hierarchy like the below:
> >>
> >>          # cd /sys/class/drm/card0/clients/
> >>          # tree
> >>          .
> >>          =E2=94=9C=E2=94=80=E2=94=80 7
> >>          =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 busy
> >>          =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 0
> >>          =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 1
> >>          =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 2
> >>          =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 3
> >>          =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 name
> >>          =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pid
> >>          =E2=94=9C=E2=94=80=E2=94=80 8
> >>          =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 busy
> >>          =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 0
> >>          =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 1
> >>          =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 2
> >>          =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 3
> >>          =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 name
> >>          =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pid
> >>          =E2=94=94=E2=94=80=E2=94=80 9
> >>              =E2=94=9C=E2=94=80=E2=94=80 busy
> >>              =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 0
> >>              =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 1
> >>              =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 2
> >>              =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 3
> >>              =E2=94=9C=E2=94=80=E2=94=80 name
> >>              =E2=94=94=E2=94=80=E2=94=80 pid
> >>
> >> Files in 'busy' directories are numbered using the engine class ABI va=
lues and
> >> they contain accumulated nanoseconds each client spent on engines of a
> >> respective class.
> >
> > We did something similar in amdgpu using the gpu scheduler.  We then
> > expose the data via fdinfo.  See
> > https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1774baa64f9395fa=
884ea9ed494bcb043f3b83f5
> > https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D874442541133f78c=
78b6880b8cc495bab5c61704
>
> Interesting!
>
> Is yours wall time or actual GPU time taking preemption and such into
> account? Do you have some userspace tools parsing this data and how to
> do you client discovery? Presumably there has to be a better way that
> going through all open file descriptors?

Wall time.  It uses the fences in the scheduler to calculate engine
time.  We have some python scripts to make it look pretty, but mainly
just reading the files directly.  If you know the process, you can
look it up in procfs.

>
> Our implementation was merged in January but Daniel took it out recently
> because he wanted to have discussion about a common vendor framework for
> this whole story on dri-devel. I think. +Daniel to comment.
>
> I couldn't find the patch you pasted on the mailing list to see if there
> was any such discussion around your version.

It was on the amd-gfx mailing list.

Alex

>
> Regards,
>
> Tvrtko
>
> >
> > Alex
> >
> >
> >>
> >> Tvrtko Ursulin (7):
> >>    drm/i915: Expose list of clients in sysfs
> >>    drm/i915: Update client name on context create
> >>    drm/i915: Make GEM contexts track DRM clients
> >>    drm/i915: Track runtime spent in closed and unreachable GEM context=
s
> >>    drm/i915: Track all user contexts per client
> >>    drm/i915: Track context current active time
> >>    drm/i915: Expose per-engine client busyness
> >>
> >>   drivers/gpu/drm/i915/Makefile                 |   5 +-
> >>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  61 ++-
> >>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
> >>   drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
> >>   drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
> >>   drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
> >>   .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
> >>   .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
> >>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
> >>   drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
> >>   drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
> >>   drivers/gpu/drm/i915/i915_drm_client.c        | 365 ++++++++++++++++=
++
> >>   drivers/gpu/drm/i915/i915_drm_client.h        | 123 ++++++
> >>   drivers/gpu/drm/i915/i915_drv.c               |   6 +
> >>   drivers/gpu/drm/i915/i915_drv.h               |   5 +
> >>   drivers/gpu/drm/i915/i915_gem.c               |  21 +-
> >>   drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +-
> >>   drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
> >>   drivers/gpu/drm/i915/i915_sysfs.c             |   8 +
> >>   19 files changed, 716 insertions(+), 81 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
> >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
> >>
> >> --
> >> 2.30.2
> >>
