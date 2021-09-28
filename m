Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D031141B5A9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 20:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8636D6E91C;
	Tue, 28 Sep 2021 18:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99BD6E91D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 18:06:21 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 138so41189828qko.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jbQFOGMuTOKZGwegVTpIlO1GcuK+9dCOI/aFvlff79w=;
 b=E7z3kTRQP6BYuSBPNKJREQrSt7Uq0DBXGYkqoBpcNwGrRa1dkf7qKbhfqAC3SH6Mik
 vwKpsRXq9rrjonbiSNCGLwOLyWW63mOKe92QdcUoxpKzRh3bl18ThjaPvsx99nc8ZjXl
 e0dhedx1wbEqjv0NW96gcrCY9WxFLMc1hwB9UHbnVbV+8JAgJiq+V0+T4MqiWgkwkPtO
 2FP2s4nfWLLWaTvFZH6Xerj4MwIdXxTgythjcuw4svDSqKvcFCDeYDkl8Foc2LDUFMVM
 7BlzRIsqS8BgjYjTRc7zkuhC7KILFQs7ZIP9tmNIyP1GLbQyOkXWu1i9cufwFEdcaG4z
 +E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jbQFOGMuTOKZGwegVTpIlO1GcuK+9dCOI/aFvlff79w=;
 b=eWKr3KC9h0E1ZHm+qBu2MWBW/qNZoaCbt7srKfN+tJLYRqRDOk2qMUYPRSubP9UZUe
 vV1xfDjaCV3lVJUodfKFB+Gxan/JWlK6/Vow5nzKHCnDqJEg7DGZZ6oL8MAvcH65Pyym
 h1A9inRoDXUF27/9NViWz1DH0OqCFcvYVTFLm0vE/Y9yB7M0GtVUYL4+zPX3ZkVbHWGg
 ETX8VyIX9cbyIBBwYbeWbaWoKbQv3p/Me+YcRwUQnc71nTuMbBEZMaW4vuyTzYa/uXJ2
 HOHkyS6iIlJbGU4aueZSkg4H8ZRJ+R/5HlYmYcxj1Weby06IYz/llYVdPnXMyoAbpR9s
 V5Uw==
X-Gm-Message-State: AOAM530nAfhWPoY6cn19OIslRhqcBUJ0ZvXbuTqwdj4qOprKwvUQqD9G
 t/9BDGabScwfPt4ewYJ7ln6ebw==
X-Google-Smtp-Source: ABdhPJyqCvsm3f0vv6z72yNtFONjy2gE9DjHUmi4zAIY0uIK0nTiyRTb/KdfUqpiQvOsRnsjZO+u6Q==
X-Received: by 2002:a37:2e03:: with SMTP id u3mr1320123qkh.313.1632852381004; 
 Tue, 28 Sep 2021 11:06:21 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id y22sm14993445qkp.9.2021.09.28.11.06.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Sep 2021 11:06:20 -0700 (PDT)
Date: Tue, 28 Sep 2021 14:06:19 -0400
From: Sean Paul <sean@poorly.run>
To: abhinavk@codeaurora.org
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>
Subject: Re: [Freedreno] [PATCH v2 00/13] drm/hdcp: Pull HDCP
 auth/exchange/check into helpers
Message-ID: <20210928180619.GU2515@art_vandelay>
References: <20210915203834.1439-1-sean@poorly.run>
 <6ccc0ce547ccb015a114a9a1292d59f6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ccc0ce547ccb015a114a9a1292d59f6@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Sep 21, 2021 at 07:30:29PM -0700, abhinavk@codeaurora.org wrote:
> Hi Sean
> 
> On 2021-09-15 13:38, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Hello again,
> > This is the second version of the HDCP helper patchset. See version 1
> > here: https://patchwork.freedesktop.org/series/94623/
> > 
> > In this second version, I've fixed up the oopsies exposed by 0-day and
> > yamllint and incorporated early review feedback from the dt/dts reviews.
> > 
> > Please take a look,
> > 
> > Sean
> 
> One question overall on the series:
> 
> 1) Regarding validation, did you run any secure video to check the
> transitions?

Yep, the transitions look good, no visual artifacts.
Unplug/replug/suspend/resume all seem to be behaving as expected.

> 2) Is running HDCP 1x compliance also part of the validation efforts?

If Qualcomm has the ability to run validation, I'd be very keen to get some
help in that regard.

Sean

> 
> Thanks
> 
> Abhinav
> 
> > 
> > Sean Paul (13):
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
> >   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
> > 
> >  .../bindings/display/msm/dp-controller.yaml   |    7 +-
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi          |    4 +-
> >  drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
> >  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
> >  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
> >  .../drm/i915/display/intel_display_types.h    |   58 +-
> >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
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
> >  drivers/gpu/drm/msm/dp/dp_parser.c            |   22 +-
> >  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
> >  drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
> >  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
> >  include/drm/drm_hdcp.h                        |  194 +++
> >  30 files changed, 2561 insertions(+), 1389 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
> >  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
Sean Paul, Software Engineer, Google / Chromium OS
