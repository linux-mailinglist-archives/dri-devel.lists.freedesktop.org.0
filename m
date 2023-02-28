Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF1C6A5C35
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6737A10E4D0;
	Tue, 28 Feb 2023 15:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ADA10E4CE;
 Tue, 28 Feb 2023 15:45:07 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 q11-20020a056830440b00b00693c1a62101so5848205otv.0; 
 Tue, 28 Feb 2023 07:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=47Io8bjBgTfpx9irLzQIk7kc2k6GPp2PZ97i5J/VsnU=;
 b=cmBSfjVhL11B7Tk2kzeIA9iNdYDewp+Lj2BTbbj6UDcbnNNnGRKEG9iCWQZ+Zn3g9m
 +0Zx+GlqRizxRKPwVVA4/JaFtaKfoHx9z08Qt2aL2jYElbluHU/qNXZSmld3edT7vPer
 mqK5c2oWjXhedR1BJv6EXjMqwSeGb6qxBliUPUwERul1AYJ+81hovh17DHIbCSD5cK5w
 9gwm8dkKVD7UCQUidLDzlT+m/No89gMZlEDYYGUWzhhwiazV+8nn9uut0WCqrLE6UV/g
 tafJgCdHGRGVm9NWQqu21rdJz8b0ivr1k0uKj14YYV/O5qMTtismWvnVbWfVfSc1EyjJ
 t6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=47Io8bjBgTfpx9irLzQIk7kc2k6GPp2PZ97i5J/VsnU=;
 b=t+v9pgG4OS0si8LmkPgk+lGwMVN8TF4n2m1nJbqb0urhaZ9qoW7OhT9KkyCif9JUKR
 IeUSt5gtXTOj6HeYp+qqsHzBXVm15U1bOfEJAIpm1prcXKx25359HlF3hu/2jnJ9nGSb
 WQ9J/AlNSASwdp/2j1fhgt0GLobwa8BgcFsnFc1JNyGJRoB1x6MSt/vJxB5Fm1fygVuE
 T1QscxJbE+2fg3Oy7bHfoaVFCnkMSMhCan0x4rey5LHWK4GUevP1ON7a0FebpZ1uBnhH
 clj33MkHivjtLQEphW8LcMigr4XeMNhI02OCBLy0kPyG5kXwIe6s5dp/lPNs4BTjyRb8
 WF7w==
X-Gm-Message-State: AO0yUKWR1pEDIi6nuBx3msY7EUoSo4iKVbcijcWB+liDEziJvtwmo4MT
 RYtY1/XwTFz+UUvfgmi/KbYIqrThcasu3rYe+Ss=
X-Google-Smtp-Source: AK7set84ZiKu/x5bhuHzdqKQUv7sjdjnKY8F7kTvWRv1lYoh5z8jZHyiBzPqCGMtJV4jXTtlMVk45nk6MjMvbYL6vxQ=
X-Received: by 2002:a9d:128e:0:b0:688:cf52:6e18 with SMTP id
 g14-20020a9d128e000000b00688cf526e18mr1074144otg.4.1677599106749; Tue, 28 Feb
 2023 07:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <Y/320d96QmbLe1J8@debian.me>
In-Reply-To: <Y/320d96QmbLe1J8@debian.me>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Feb 2023 07:44:55 -0800
Message-ID: <CAF6AEGuqHDDQS22qcp8sk+5bj16XFiBarCLvpX=qNc2r2euMUw@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] dma-fence: Deadline awareness
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Rob Clark <robdclark@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 4:43 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Mon, Feb 27, 2023 at 11:35:06AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This series adds a deadline hint to fences, so realtime deadlines
> > such as vblank can be communicated to the fence signaller for power/
> > frequency management decisions.
> >
> > This is partially inspired by a trick i915 does, but implemented
> > via dma-fence for a couple of reasons:
> >
> > 1) To continue to be able to use the atomic helpers
> > 2) To support cases where display and gpu are different drivers
> >
> > This iteration adds a dma-fence ioctl to set a deadline (both to
> > support igt-tests, and compositors which delay decisions about which
> > client buffer to display), and a sw_sync ioctl to read back the
> > deadline.  IGT tests utilizing these can be found at:
> >
> >   https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline
> >
> >
> > v1: https://patchwork.freedesktop.org/series/93035/
> > v2: Move filtering out of later deadlines to fence implementation
> >     to avoid increasing the size of dma_fence
> > v3: Add support in fence-array and fence-chain; Add some uabi to
> >     support igt tests and userspace compositors.
> > v4: Rebase, address various comments, and add syncobj deadline
> >     support, and sync_file EPOLLPRI based on experience with perf/
> >     freq issues with clvk compute workloads on i915 (anv)
> > v5: Clarify that this is a hint as opposed to a more hard deadline
> >     guarantee, switch to using u64 ns values in UABI (still absolute
> >     CLOCK_MONOTONIC values), drop syncobj related cap and driver
> >     feature flag in favor of allowing count_handles==0 for probing
> >     kernel support.
> > v6: Re-work vblank helper to calculate time of _start_ of vblank,
> >     and work correctly if the last vblank event was more than a
> >     frame ago.  Add (mostly unrelated) drm/msm patch which also
> >     uses the vblank helper.  Use dma_fence_chain_contained().  More
> >     verbose syncobj UABI comments.  Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > v7: Fix kbuild complaints about vblank helper.  Add more docs.
> >
>
> I want to apply this series for testing, but it can't be applied cleanly
> on current drm-misc tree. On what tree (and commit) is this series based
> on?

You can find my branch here:

https://gitlab.freedesktop.org/robclark/msm/-/commits/dma-fence/deadline

BR,
-R
