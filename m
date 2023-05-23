Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C067D70CEEF
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 02:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58A010E2E1;
	Tue, 23 May 2023 00:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC2810E2D7;
 Tue, 23 May 2023 00:17:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96fe88cd2fcso312853066b.1; 
 Mon, 22 May 2023 17:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684801050; x=1687393050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VvJrClLjnc7GTwo//Bcl7YXcX48efgizj6CzwviQgvQ=;
 b=bvGtXUuh02M6wX2vqbbNUCwtlmzdcXicrq+Ko5UE6ihY1RT0tRKajdOv+r6iAHdByq
 SjIgqAwjEVEmKbNdHLWb1jo7vev9X5lBvC0kFtiDQrFSkoQmg/bZnQqpA0K/jGIOPlSK
 PzvaMoQnZUFgIaAGbae2fH91K9sly+pyChl4WBFLwu1xtH7m3AvgeKbOIRMRUqJh0Sqj
 pDQGNhWeL9IyyAF0ATkVbIzAsERM9ftGF0h1d9WBZfHhXYnYplkAaOByIBMZLKHFSodG
 gixAne+NV7YCsBACXo0TufuJ01cmJdHYxWYiRgbxKosdc96JFCG+/lA33amnZ8p+I/Vs
 LzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684801050; x=1687393050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvJrClLjnc7GTwo//Bcl7YXcX48efgizj6CzwviQgvQ=;
 b=kQhfIWPGSaYdZm/oav/3fkVnJItfBgpT6Q0ikCmENdhrzCtTjfJazhJVMRSwqjXD8+
 VKGndkpLAT322X7vKiBOK9u9Z1EmuEHGByt9MVednygR2f4i9jxnfh03bFQQxXZxRF1K
 eal4VaV2CjFB891CJiEu2TTbAptMucDMEB8d4NT+NNSojet27ocEBMEO2WIvB32loIJ4
 n5TkLpm5nQH+4YeZnzu3fhs6DRZLy1JbBlajudvuvn+2p3gW6MXsVj/F7TEUe0Cj/RwK
 lDhuvE8+6BMl22pPMwltRJOu33be47/KXrXnScz4MNMFbfAAAOn6nfDVYP4E6Y7Z2zPL
 Dh2Q==
X-Gm-Message-State: AC+VfDx6ZO2Jt/YsSPaco8D6lERNiTEbXfNKhYEAaA208JSvHloORi3X
 57IJ7zyvJtfC6TQ/BX4I8t2np5wRqhTHf1FOuQs=
X-Google-Smtp-Source: ACHHUZ7gqfEHsJdFyQ6JccHcryfi/wSUCZIxFV/oqNefiC8lPfL2a5gGOIDwxQKYBgZav5BuqRdZuLBsAvEUzUjhgaA=
X-Received: by 2002:a17:906:9743:b0:96f:32ae:a7e1 with SMTP id
 o3-20020a170906974300b0096f32aea7e1mr13882790ejy.63.1684801049644; Mon, 22
 May 2023 17:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143023.801167-1-robdclark@gmail.com>
 <da1f7aa1-f560-31f4-6114-e400f35d325b@linaro.org>
In-Reply-To: <da1f7aa1-f560-31f4-6114-e400f35d325b@linaro.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 23 May 2023 10:17:17 +1000
Message-ID: <CAPM=9tyc+N0i+vXkZ-8Mf6kBN5BJHeL=tvbnp=LKCW6T5gPGfg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: fdinfo memory stats
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org, Christopher Healy <healych@amazon.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, Peter Maucher <bellosilicio@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 May 2023 at 10:03, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 15/05/2023 17:30, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Similar motivation to other similar recent attempt[1].  But with an
> > attempt to have some shared code for this.  As well as documentation.
> >
> > It is probably a bit UMA-centric, I guess devices with VRAM might want
> > some placement stats as well.  But this seems like a reasonable start.
> >
> > Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> >
> > I've combined the separate series to add comm/cmdline override onto
> > the end of this, simply out of convenience (they would otherwise
> > conflict in a bunch of places).
> >
> > v2: Extend things to allow for multiple regions other than just system
> >      "memory", make drm_show_memory_stats() a helper so that, drivers
> >      can use it or not based on their needs (but in either case, re-
> >      use drm_print_memory_stats()
> > v3: Docs fixes
> > v4: use u64 for drm_memory_stats, small docs update and collected
> >      Tvrtko's a-b
> >
> > [1] https://patchwork.freedesktop.org/series/112397/
> >
> > Rob Clark (9):
> >    drm/docs: Fix usage stats typos
> >    drm: Add common fdinfo helper
> >    drm/msm: Switch to fdinfo helper
> >    drm/amdgpu: Switch to fdinfo helper
> >    drm: Add fdinfo memory stats
> >    drm/msm: Add memory stats to fdinfo
> >    drm/doc: Relax fdinfo string constraints
> >    drm/fdinfo: Add comm/cmdline override fields
> >    drm/msm: Wire up comm/cmdline override for fdinfo
> >
> >   Documentation/gpu/drm-usage-stats.rst      | 101 ++++++++++----
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  16 +--
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
> >   drivers/gpu/drm/drm_file.c                 | 147 +++++++++++++++++++++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  24 +++-
> >   drivers/gpu/drm/msm/msm_drv.c              |  15 ++-
> >   drivers/gpu/drm/msm/msm_gem.c              |  15 +++
> >   drivers/gpu/drm/msm/msm_gpu.c              |   2 -
> >   drivers/gpu/drm/msm/msm_gpu.h              |  10 ++
> >   include/drm/drm_drv.h                      |   7 +
> >   include/drm/drm_file.h                     |  51 +++++++
> >   include/drm/drm_gem.h                      |  32 +++++
> >   13 files changed, 378 insertions(+), 47 deletions(-)
>
> What is the expected merge plan for this series? msm-next? drm-misc?

I'm fine with this going via drm-misc,

Acked-by: Dave Airlie <airlied@redhat.com> if that is the plan.

Dave.
