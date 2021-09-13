Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2571409CF2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 21:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FC46E23B;
	Mon, 13 Sep 2021 19:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4692B6E23B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 19:27:23 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id w1so11329475ilv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 12:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqhwtjPaliftZjpY9BcuH+rR9n6maIndj6zCIjQTkH8=;
 b=S/Z+BtSSJyMIlhwTrv6Rt34R99UwU2l2704HWs9ElWQMtZ54qXTWajsD6upqGEDRN5
 qygA3yj+24yOnSelN27ZDhJ8zIsLj8tWmxUnQa5sOyQrSMYiyDrOJUOa+7JYQazo5DyT
 lwKG8ReeM8+0xh/CUNPkOq6h9QVFhJlXf+g48PFXTeyUB/ItFcug4GnYPjY6jXZ3OXts
 hrLQtFO890IQeqX9eMmZFGYJueuu2/EMFA022PUcKbqywve70mMmlSsUUUAs4KFLyE2w
 gu9AICWiJOOSlldoy+P+ezm34+vVePgpXgAu2Y/FCQnsjLMm1uQG3NA+qmunmrcP1B+C
 yIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqhwtjPaliftZjpY9BcuH+rR9n6maIndj6zCIjQTkH8=;
 b=4Y1Z2fCIkOpvnrS2Ieh0amZaUa0inQf+JvYfGDQlZLYXAmGEnQppzKpHtFtRhd/U2v
 /K5dA/E3pHYcfceG5SwxUjdaoNua5kgX9s7TbYdjKutCcuBQTuFtUUvZbQq3/NRcj8BV
 0n4yXBn9zf0/LoiRSQ/+bx6cqps3kyOo0O4b9eoBje1mKXD/9SuMlwDbic0oRZynveN8
 ktzQLTuTMberi4vGRrtVe+jwCycA4JSPj/uk+0832B9+7AwML3yp3CKrRVUzdpCmmgnn
 hOLpe1a99+D5ohMQntxpvuaqkjOfwQsBOZlBbgnSx9r6r3LuMQ3GP4DolZUzlP5vWpn+
 +T3g==
X-Gm-Message-State: AOAM531jmpgAQ2S1/r8DDyDwjfFFDBAPd5GrF20Z+OD8wYT+fSWHWhmf
 T84MUDFKGaHtZk17J+LYID4Oy0WbnGkWyNpMNP/7Cw==
X-Google-Smtp-Source: ABdhPJxSnZ+blXYFIIpVWTUGqhjsJ+AkKnc7QY2qvoTiTcWN8m51depte/1dV+TFfLz6pZJjhJUiFtcwnwAq2rUni7A=
X-Received: by 2002:a05:6e02:2165:: with SMTP id
 s5mr9337353ilv.274.1631561242465; 
 Mon, 13 Sep 2021 12:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210913175747.47456-1-sean@poorly.run>
 <CADnq5_OA=Hz-DOj6X-wnZwsk+wU924rHxCKOCepsMfbdFGasQw@mail.gmail.com>
In-Reply-To: <CADnq5_OA=Hz-DOj6X-wnZwsk+wU924rHxCKOCepsMfbdFGasQw@mail.gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 13 Sep 2021 15:26:45 -0400
Message-ID: <CAMavQK+BJqSmxFCPvTJKpt1VTaY=KeQPw-VwGYM8mQQU4TS=Wg@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/hdcp: Pull HDCP auth/exchange/check into
To: Alex Deucher <alexdeucher@gmail.com>
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

On Mon, Sep 13, 2021 at 2:05 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Sep 13, 2021 at 1:57 PM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Hello,
> > This patchset pulls the HDCP protocol auth/exchange/check logic out from
> > i915 into a HDCP helper library which drivers can use to implement the
> > proper protocol and UAPI interactions for achieving HDCP.
> >
> > Originally this was all stuffed into i915 since it was the only driver
> > supporting HDCP. Over the last while I've been working on HDCP support
> > in the msm driver and have identified the parts which can/should be
> > shared between drivers and the parts which are hw-specific.
> >
> > We can generalize all of the sink interactions in the helper as well as
> > state handling and link checks. This tends to be the trickiest part of
> > adding HDCP support, since the property state and locking is a bit of a
> > nightmare. The driver need only implement the more mechanical display
> > controller register accesses.
> >
> > The first third of the pachset is establishing the helpers, the next
> > third is converting the i915 driver to use the helpers, and the last
> > third is the msm driver implementation.
> >
> > I've left out HDCP 2.x support, since we still only have i915 as the
> > reference implementation and I'm not super comfortable speculating on
> > which parts are platform independent.
>
> FWIW, amdgpu has support for both HDCP 1.x and 2.x
>

Thanks Alex, I knew this and neglected to mention it, apologies for
the omission.

IIRC amdgpu is much less hands-on than i915/msm, with PSP doing most
of the heavy lifting. There's probably some value in using the helpers
since it'll handle the state transitions in a consistent manner, do
you think this is something you can use?

Sean


> Alex
>
> >
> > Please take a look,
> >
> > Sean
> >
> > Sean Paul (14):
> >   drm/hdcp: Add drm_hdcp_atomic_check()
> >   drm/hdcp: Avoid changing crtc state in hdcp atomic check
> >   drm/hdcp: Update property value on content type and user changes
> >   drm/hdcp: Expand HDCP helper library for enable/disable/check
> >   drm/i915/hdcp: Consolidate HDCP setup/state cache
> >   drm/i915/hdcp: Retain hdcp_capable return codes
> >   drm/i915/hdcp: Use HDCP helpers for i915
> >   drm/msm/dpu_kms: Re-order dpu includes
> >   drm/msm/dpu: Remove useless checks in dpu_encoder
> >   drm/msm/dpu: Remove encoder->enable() hack
> >   drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
> >   dt-bindings: msm/dp: Add bindings for HDCP registers
> >   drm/msm: Add hdcp register ranges to sc7180 device tree
> >   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
> >
> >  .../bindings/display/msm/dp-controller.yaml   |   11 +-
> >  drivers/gpu/drm/drm_hdcp.c                    | 1198 ++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
> >  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
> >  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
> >  .../drm/i915/display/intel_display_types.h    |   58 +-
> >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  341 ++---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
> >  drivers/gpu/drm/i915/display/intel_hdcp.h     |   35 +-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
> >  drivers/gpu/drm/msm/Makefile                  |    1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
> >  drivers/gpu/drm/msm/dp/dp_debug.c             |   49 +-
> >  drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c           |   47 +-
> >  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
> >  drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
> >  drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
> >  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  433 ++++++
> >  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
> >  drivers/gpu/drm/msm/dp/dp_parser.c            |   30 +-
> >  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
> >  drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
> >  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
> >  include/drm/drm_hdcp.h                        |  194 +++
> >  29 files changed, 2570 insertions(+), 1385 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
> >  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> >
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
