Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42A409BB3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 20:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6FC6E210;
	Mon, 13 Sep 2021 18:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4513D6E210;
 Mon, 13 Sep 2021 18:05:48 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id bd1so15179671oib.5;
 Mon, 13 Sep 2021 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/AwSDxJWJnt1kDrlOTpMpbgSJep7OdIa5YDpwF0cPE=;
 b=PbjlPXH/wW9wxdAmEEha8UChy8PbB/qeDm/bDNYyE12m32+JOkouO+eMRqjBu5TtKT
 GtxfPnWp1sVDEU5R/zpvRdvW871f/advCcAv+GYfEeuzM7xAyiLDrkpDunrfGbm8kN2q
 k7ax13Q+q+JkJUamlNBi+sR6zFebT6nklFHVIVwB7Ehd5EDYfO0ECcx4hLFHZmSHcXWS
 4Z5mA4pq8IJIWsPs3C0JpLSMO7GODyfzBOL/c4Q9Bqx41xQu4vngQeP2TTOeTtdZ9U4o
 Fo9cTFSd0pr1gJCGmiliFB3jLXqcIQaV1sN2d5WfTsDxN0f4v8upBb+22N7n7f1a0KCa
 jnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/AwSDxJWJnt1kDrlOTpMpbgSJep7OdIa5YDpwF0cPE=;
 b=sYoxqHsEBtVJ54V4f2mOrqJR8jDsrWkrNdIaGi89Xh9Z6n0Da8wR5LXsBlmPcCDyDF
 eWNITS2561O7jBs3Ugi026DBPaGAE+ry9maCpGMMszryub+V5X5RGByTWibEUZS1WWIm
 C5bY0M69aA+PzFsdPtxBdVxrDDvU9z6k1e2JjIw2xenyZ327d0eXS5J4iARXghJQwH0C
 +jgmUV/DPuQofjz+ySlEsQxOH57QrztLFF32KgCvOJcjOtqyOmkpjJFpVIJy4irKl1Tq
 vFHKndWZ3mVUfMvcLXx6EQGvIXF9/u/zd+K8dV1GXLEsS66ATaBBZAvF5WFlhkwDxxCB
 /I4A==
X-Gm-Message-State: AOAM531bqynvN59BnntvCh6imF680ROi1762tWSFScLPQ6aWTzr9jrmw
 6Znr1xdH3swqPM/sutJdhYx+Ld2l+Iu/TQpiAV8=
X-Google-Smtp-Source: ABdhPJzEBTwSpxEMByRo9K10UmA4Evjw77ZYV8jFaM+CxnOd+SOF6XECS++N//HA0jN3T5O/TY/0UsOq6ahFFCjDtDg=
X-Received: by 2002:a05:6808:1310:: with SMTP id
 y16mr8745631oiv.123.1631556347562; 
 Mon, 13 Sep 2021 11:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210913175747.47456-1-sean@poorly.run>
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Sep 2021 14:05:36 -0400
Message-ID: <CADnq5_OA=Hz-DOj6X-wnZwsk+wU924rHxCKOCepsMfbdFGasQw@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/hdcp: Pull HDCP auth/exchange/check into
To: Sean Paul <sean@poorly.run>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>
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

On Mon, Sep 13, 2021 at 1:57 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Hello,
> This patchset pulls the HDCP protocol auth/exchange/check logic out from
> i915 into a HDCP helper library which drivers can use to implement the
> proper protocol and UAPI interactions for achieving HDCP.
>
> Originally this was all stuffed into i915 since it was the only driver
> supporting HDCP. Over the last while I've been working on HDCP support
> in the msm driver and have identified the parts which can/should be
> shared between drivers and the parts which are hw-specific.
>
> We can generalize all of the sink interactions in the helper as well as
> state handling and link checks. This tends to be the trickiest part of
> adding HDCP support, since the property state and locking is a bit of a
> nightmare. The driver need only implement the more mechanical display
> controller register accesses.
>
> The first third of the pachset is establishing the helpers, the next
> third is converting the i915 driver to use the helpers, and the last
> third is the msm driver implementation.
>
> I've left out HDCP 2.x support, since we still only have i915 as the
> reference implementation and I'm not super comfortable speculating on
> which parts are platform independent.

FWIW, amdgpu has support for both HDCP 1.x and 2.x

Alex

>
> Please take a look,
>
> Sean
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
>   drm/msm: Add hdcp register ranges to sc7180 device tree
>   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
>
>  .../bindings/display/msm/dp-controller.yaml   |   11 +-
>  drivers/gpu/drm/drm_hdcp.c                    | 1198 ++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
>  .../drm/i915/display/intel_display_types.h    |   58 +-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  341 ++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   35 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
>  drivers/gpu/drm/msm/Makefile                  |    1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
>  drivers/gpu/drm/msm/dp/dp_debug.c             |   49 +-
>  drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
>  drivers/gpu/drm/msm/dp/dp_display.c           |   47 +-
>  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
>  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  433 ++++++
>  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
>  drivers/gpu/drm/msm/dp/dp_parser.c            |   30 +-
>  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>  drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
>  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
>  include/drm/drm_hdcp.h                        |  194 +++
>  29 files changed, 2570 insertions(+), 1385 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
