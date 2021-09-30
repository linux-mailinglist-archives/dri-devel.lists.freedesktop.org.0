Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B941D82E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26AA6EB70;
	Thu, 30 Sep 2021 10:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AB46E3DF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 10:56:34 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id p4so5321676qki.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SXEQR628QG6aprLZ/8ATDdzNXmEZHiN+i7ietQErBE=;
 b=MPR30yb1MMFtgZ5nxqpjz2a3PA3bjEtkcftcaU4VpmiZ3NleHQUgWyVVgb7BFVPNOS
 czRsOhSt0v/Co9yK6E2FQJitGTfOO/E5srA//5rXoiiSWANQRBcuJTkQeTHS62S4L/WY
 f69/ZJmhAdw7P4gMhC07+4sU8Gz1uQL8Vf4NeYPmFJCMjt6dVIRyrtigndoEhx4lw+LC
 1OEansD+C6y+GVQeObNWtbQ0nk5xaQM9PW+GsX2A9h/B8qGNEIOIelRHnNCX3UN3rIHF
 /R6fxBHAceKAr3aHDGbRSdaiSVaXrYSRrwXMDfIPiiBOHGCxA7K7Jwsr3Etn1CZHur+h
 lrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SXEQR628QG6aprLZ/8ATDdzNXmEZHiN+i7ietQErBE=;
 b=cKxs85GgS88xsvLbaJK3NLhvHWwJDCnPQ4jjxuV+/mDrVTmWseqo7kO3ykJC0Sbir+
 lUu9iM2U/+nLcjkp1Rwz480w2qUYIxV57wFaqs+TUaHWSHZQ/kWlzIFMEeKAo+iFDaLQ
 pAZRdMhI9s7oVedCkY8OuqGImt0b2gO5CpqNQMC0Nz/09VKqjKWPAgmVsjKylHnLvVWS
 zhY3AXkM9hY1EklVsjiifpODRYGagoK/eJ/eQ9PGz2FhH7LikJ+9bOW78BEudRf/2mjA
 eqae94kfwzJPUGeZfM0fZ8/eKiXUAGCicpf9TOuEyQKUjnlO4P5U37QsXU73HzGAXzVR
 Vi/g==
X-Gm-Message-State: AOAM532Ik3DuccFKFH6MdLRZbUnKT5G3yshC4DGKnUaHi0TAp7b861/F
 s2eVDlHde3JzM2q3OehH6atvTkg8K/MLnW55b15z3754EXs=
X-Google-Smtp-Source: ABdhPJxmA5IuZvu5pAAvkwwgCJLBY+GxJU6rkWIf58n/KiL0W6gT0BW9ueWiP50cYtUhOOfaPjIyDZuz4dm1kQDq89M=
X-Received: by 2002:ae9:edd6:: with SMTP id c205mr3919799qkg.289.1632999393811; 
 Thu, 30 Sep 2021 03:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <c7caa55f5244ba4b7341a1b912835d91@codeaurora.org>
In-Reply-To: <c7caa55f5244ba4b7341a1b912835d91@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Sep 2021 13:56:22 +0300
Message-ID: <CAA8EJpqiCyBZUoE5VafG8cO7dZxHTnV=WT3+Ah+7yEG+3__u+w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 00/22] drm/msm/dpu: switch dpu_plane to be
 virtual
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 30 Sept 2021 at 05:19, <abhinavk@codeaurora.org> wrote:
>
> Hi Dmitry
>
> On 2021-07-04 18:20, Dmitry Baryshkov wrote:
> > As discussed on IRC, change dpu_plane implementation to be virtual:
> > register unified planes and select backing SSPP block at runtime.
> >
> > Use msm.dpu_use_virtual_planes=1 to enable usage of virtual planes
> > rather than statically allocated SSPPs at the plane registration.
> >
> > Patches 1-9 move state variables from struct dpu_plane onto the stack
> > allocation. State should not be a part of struct dpu_plane anyway.
> >
> > Patches 10-18 make additional changes to plane code, reworking check,
> > debugfs, dropping old multirec support, which results in patch 19
> > adding
> > support for virtual planes per se.
> >
> > Patches 20-22 demonstrate my main goal behind reworking dpu_plane
> > support. They change dpu_plane to automatically use one of SSPP block
> > features - multirec, an ability to display two unscaled RGB rectangles
> > using single SSPP block. This allows us to double the amount of created
> > planes. If the user tries to enable more planes than actually supported
> > by the underlying SSPP blocks, atomic_check code would return an error.
> >
> > As you can see, this patchset is not atomic, so different patches can
> > go
> > separately.
>
> I am half way through this series and have finished checking patches
> 1-12
> I am okay with patches 1-4, 6-12. Its a reasonable cleanup to make the
> dpu_plane struct lighter.
> I need a little more time with the rest as I am comparing the downstream
> solution against yours.
>
> As you mentioned, this patchset is not atomic, hence can you break it up
> like
> -> cleanup of dpu_plane struct in one series
> -> removal of current multirect and current src split which will include
> patch 5 as well
>
> So that the first series can go through and it gives us a little more
> time to check the second
> series.

Ok, I'll split the series according to your review.

>
> Thanks
>
> Abhinav
>
> >
> > Changes since v1:
> >  - Add multirec implementation
> >  - Added msm.dpu_use_virtual_planes kernel parameter instead of using
> >    compile time switch
> >  - Changed code to always reallocate SSPPs in the CRTC atomic check to
> >    let the kernel pick up the best multirec config. This can be
> >    optimized later.
> >  - Rework RM SSPP API to always receive plane id
> >  - Removed scaler_cfg, pixel_ext and cdp_cfg from struct
> > dpu_plane_state
> >  - Made _dpu_scaler_setup() call sspp's setup_scaler and setup_pe
> >  - Removed dpu_csc_cfg from dpu_plane
> >
> > The following changes since commit
> > e88bbc91849b2bf57683119c339e52916d34433f:
> >
> >   Revert "drm/msm/mdp5: provide dynamic bandwidth management"
> > (2021-06-23 14:06:20 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.linaro.org/people/dmitry.baryshkov/kernel.git
> > dpu-multirec-2
> >
> > for you to fetch changes up to
> > 19f6afd40097d4c826e56b8f4a8cbd807f7b61f6:
> >
> >   drm/msm/dpu: add multirect support (2021-07-05 04:04:50 +0300)
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (22):
> >       drm/msm/dpu: move LUT levels out of QOS config
> >       drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
> >       drm/msm/dpu: drop pipe_name from struct dpu_plane
> >       drm/msm/dpu: remove stage_cfg from struct dpu_crtc
> >       drm/msm/dpu: rip out master planes support
> >       drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
> >       drm/msm/dpu: drop scaler config from plane state
> >       drm/msm/dpu: drop dpu_csc_cfg from dpu_plane
> >       drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from dpu_plane
> >       drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
> >       drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
> >       drm/msm/dpu: rip out debugfs support from dpu_plane
> >       drm/msm/dpu: drop src_split and multirect check from
> > dpu_crtc_atomic_check
> >       drm/msm/dpu: add list of supported formats to the DPU caps
> >       drm/msm/dpu: simplify DPU_SSPP features checks
> >       drm/msm/dpu: do not limit the zpos property
> >       drm/msm/dpu: add support for SSPP allocation to RM
> >       drm/msm/dpu: move pipe_hw to dpu_plane_state
> >       drm/msm/dpu: add support for virtualized planes
> >       drm/msm/dpu: fix smart dma support
> >       drm/msm/dpu: fix CDP setup to account for multirect index
> >       drm/msm/dpu: add multirect support
> >
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 261 +++-----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 -
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  20 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  20 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  41 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  52 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c    |   2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h    |   2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 234 ++++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  70 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 851
> > +++++++++++--------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  75 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  81 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |   6 +
> >  14 files changed, 793 insertions(+), 924 deletions(-)
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno



-- 
With best wishes
Dmitry
