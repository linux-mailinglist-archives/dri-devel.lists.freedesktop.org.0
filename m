Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716446DD50
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 21:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFCD6E959;
	Wed,  8 Dec 2021 20:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D904F6E8F1;
 Wed,  8 Dec 2021 20:56:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c4so6212458wrd.9;
 Wed, 08 Dec 2021 12:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CJdDQMhYJ6d11BQ4V6PS5aK//Lt1I9eil0VryL8BiHs=;
 b=diNzzL/bmu6IXSKa7EYhlc/sF1RDPca+QHs2fCuSpNWquM4myOiXaUkrcLpBYWAp9y
 BVQwpo5fn++KRgB3/uyVYa6XimL+VzNa0yEw3+3UyCQKE1J/nBi0RUaIXV/R0HD+rU2H
 b6xLu3pLUU3+gdW5NTVSzFbMhFy2CFGll4e7nejfHZN+q8c55k1tDGm1iO1sSyCtVmux
 SgMHuADJE+1q42YofxSmJY7je0MaUX78Gi6xCUrhLn8kPj+TzgD/sdNtSu+WyxuLmOvV
 GvD3gYFcKYWVvvJn+vdrvWEbZW/X3JyyNBeG+Yqlq1TnTDfUEyJvsZYJIxKj6SPWcvM4
 nOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJdDQMhYJ6d11BQ4V6PS5aK//Lt1I9eil0VryL8BiHs=;
 b=0JKCtrdBMBnsrfDCCXuJsn24cvdz/dQ2TeFwDJK26nqJnOjvjvOhbUqWIOhbT97YII
 kuWVWTcvnRni4FZ4cUyibljy1pTvfbl6IU14b+NX57lOAjsbR1yE1EKWjm3qXgmpEJum
 GhQ/onfW6PV6cxZbXxZH5SLCm8stVgMyC2yVQ5JOShfBAF+RxI+GOuO9wnY6DlZC2UkV
 PuPJMRl0zmSsw6fD/BTLfa6Bw5cu5Dt/0dVKYICR+B2nm7XPo+vQ2zYvolMto2R8idhk
 qzMCB2R7JocHZlG3BrA6Rlup339MR+rlv2kNiS7tJSz0+VLvOtJgeQNJ5jCUHUvH+XXY
 2Neg==
X-Gm-Message-State: AOAM530w2BO90G0BlRMtOhdl2ldn8xP4VsrwplYLGZUpGEFaFBHXLUqm
 Gbo0jANaeYCKkM+JM7Y38ipAlbvyx96Sh2Q14m8=
X-Google-Smtp-Source: ABdhPJzwjXwlVKvdHYUQ/foo40aFsu61uxV259oMyWxrLZWwYlB3cBMpPDHb9TMbXrKHbUTXb1qj1ssgIBWeDk/LOAE=
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr1196355wrw.141.1638996967126; 
 Wed, 08 Dec 2021 12:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20211105030434.2828845-1-sean@poorly.run>
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Dec 2021 12:55:55 -0800
Message-ID: <CAF6AEGvD-2gtqhbWCUMmbJYsOBYKk9DUxzX5+tE7O+Z-BQfghQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 00/14] drm/hdcp: Pull HDCP
 auth/exchange/check into helpers
To: Sean Paul <sean@poorly.run>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 4, 2021 at 8:04 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Just me with another revision of HDCP support for msm.
>
> This v4 patch series is mostly a retread of v3 with the following
> changes:
> - rebased on Bjorn's displayport-controller register refactor
> - another change to the dt bindings to remove the compatible string added in v3
> - updated review tags
>
> I'm missing reviews on the core, i915 patches, and the final patch. It would be
> fantastic to get some feedback on these before the set once again drifts too far
> from -tip and I need a painful rebase :-)
>
> Thank you to the reviewers for their feedback thus far!
>
> Please take a look,

It looks like all but the last two (msm specific) patches have at
least a-b or r-b.. I'll try and get someone to look at those last two

Any thoughts about preferred way to land this.  I currently have a few
of the msm patches which don't depend on core patches in
msm-next-staging, but I can drop those before it gets pushed to
msm-next.  Maybe we want a topic branch that both msm and i915 can
pull into their -next branches?

BR,
-R

>
> Sean
>
> Link: https://patchwork.freedesktop.org/series/94623/ #v1
> Link: https://patchwork.freedesktop.org/series/94713/ #v2
> Link: https://patchwork.freedesktop.org/series/94712/ #v3
>
> Sean Paul (14):
>   drm/hdcp: Add drm_hdcp_atomic_check()
>   drm/hdcp: Avoid changing crtc state in hdcp atomic check
>   drm/hdcp: Update property value on content type and user changes
>   drm/hdcp: Expand HDCP helper library for enable/disable/check
>   drm/i915/hdcp: Consolidate HDCP setup/state cache
>   drm/i915/hdcp: Retain hdcp_capable return codes
>   drm/i915/hdcp: Use HDCP helpers for i915
>   drm/msm/dpu_kms: Re-order dpu includes
>   drm/msm/dpu: Remove useless checks in dpu_encoder
>   drm/msm/dpu: Remove encoder->enable() hack
>   drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
>   dt-bindings: msm/dp: Add bindings for HDCP registers
>   arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
>   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
>
>  .../bindings/display/msm/dp-controller.yaml   |    8 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |    8 +-
>  drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
>  .../drm/i915/display/intel_display_types.h    |   58 +-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   36 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
>  drivers/gpu/drm/msm/Makefile                  |    1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
>  drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
>  drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
>  drivers/gpu/drm/msm/dp/dp_display.c           |   48 +-
>  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
>  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  462 +++++++
>  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
>  drivers/gpu/drm/msm/dp/dp_parser.c            |   20 +-
>  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>  drivers/gpu/drm/msm/dp/dp_reg.h               |   32 +-
>  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
>  include/drm/drm_hdcp.h                        |  194 +++
>  30 files changed, 2592 insertions(+), 1377 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
