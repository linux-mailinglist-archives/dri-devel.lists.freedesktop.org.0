Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8277261B0C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BDD6E8B3;
	Tue,  8 Sep 2020 18:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81B26E8B3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:53:46 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id b17so16452719ilh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2W5MxW15Zq/LjkbBTBwfgrRaNE8mI3ZGNHUF4bCW1vo=;
 b=SodXynGi6pfaEyRiu24Wx4XkUh6Vdg6Z2uDff6Cx7idwHVLOa84d2F2ugb4CNHeDBK
 jUM9GTITXKjxsLXUSPhsOnc6ibz74ywczFEEBunk+OWA8eEiRoBmnScyyZJbSCzOWRve
 7QltdjL+YO8Ilj/CNYO4GKM6gU+Q5KMmXZs6DqOrsnBO3HNJivuTCgxcoMovAb1zdi3t
 XaXeef+K6/zgMXcECz2IOILnrK7CU5ik3zfg6NEj49k2CEsa3+fK1ahiWu8bggPqzEpk
 fPtQAlZ4vzpXQn2m+Sk17xBiSjtKaK9oFII22j7aUsxVCDri0rEdoJR7IP4O2LwC4AqT
 klJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2W5MxW15Zq/LjkbBTBwfgrRaNE8mI3ZGNHUF4bCW1vo=;
 b=cwzZWjd8oWFHkbeBbJJsekS5qTNRg05gCUOgRFol4wgepnBtvzNNyzpr4AzPIVdvem
 bu7W7hc/IjfB/AdS6MXfX9d5AHGU5afO8Y0uuJzNksARNXwd8mtKOoxJHwJB2oiM2ibC
 9/vdvfBumQwT1XZM85wFoOrFgqo2nUQjDZMqxyPM6OZRCancsVkCxZB+jwCbP2BZnIX7
 J0TxR5eWrrC7B2m/rVmpQjPif2arvxlGlIRH5hFf7gNYDqq0HOXVFxC9Wt9Pw7LBardH
 UCU6ieNRFysKc8LCoBqlibzZsUo98Ov3BkPlnYKq0eir3L5QF4XM5jmzresJo3mFKioY
 /gRA==
X-Gm-Message-State: AOAM533Gr156EB1hbtGuIMxHt+56En3vmYbQRMfEbTKs2r54poOd4jeT
 wfmMBMCBMOZepgTWpZDWjfMsU63o0PQthIRahRx8LCS6x2c=
X-Google-Smtp-Source: ABdhPJzyyaea3XYp8ALZ7xWtVSvUZANyW03ZlJjCZKyuo4W+sBIcCSzGC1v+Yrnzpt+XxYW2rqwmcl+N4h+6lZEg21o=
X-Received: by 2002:a92:b6d8:: with SMTP id m85mr130679ill.165.1599591226122; 
 Tue, 08 Sep 2020 11:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200818210510.49730-1-sean@poorly.run>
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
From: Sean Paul <sean@poorly.run>
Date: Tue, 8 Sep 2020 14:53:08 -0400
Message-ID: <CAMavQKLG1ENagwWPjDqv+87_WJv90Ea2CYFhENo2w1Z9n=QezA@mail.gmail.com>
Subject: Re: [PATCH v6 00/14] drm/trace: Mirror DRM debug logs to tracefs
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>, 
 Dave Airlie <airlied@linux.ie>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Friendly ping, does anyone care to review/comment?

On Tue, Aug 18, 2020 at 5:05 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Mostly a rebase on drm-tip.
>
> New changes:
>  - Use the new trace_array_init_printk() call init the global trace buffers.
>  - Add patch 13 to the set to pipe atomic state logging through trace
>
> v5 is available here:
>  https://patchwork.freedesktop.org/series/78133/
>
> Sean Paul (14):
>   drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
>   drm/sil164: Convert dev_printk to drm_dev_dbg
>   drm/i915/utils: Replace dev_printk with drm helpers
>   drm/msm/dpu: Replace definitions for dpu debug macros
>   drm/print: rename drm_debug* to be more syslog-centric
>   drm/amd: Gate i2c transaction logs on drm_debug_syslog
>   drm/etnaviv: Change buffer dump checks to target syslog
>   drm/nouveau: Change debug checks to specifically target syslog
>   drm/i915: Change infoframe debug checks to specify syslog
>   drm/print: Add drm_debug_category_printer
>   drm/mst: Convert debug printers to debug category printers
>   drm/i915: Use debug category printer for welcome message
>   drm/atomic: Use debug category printer for atomic state printer
>   drm/print: Add tracefs support to the drm logging helpers
>
>  Documentation/gpu/drm-uapi.rst               |   6 +
>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
>  drivers/gpu/drm/drm_atomic.c                 |   5 +-
>  drivers/gpu/drm/drm_atomic_uapi.c            |   2 +-
>  drivers/gpu/drm/drm_crtc_internal.h          |   3 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
>  drivers/gpu/drm/drm_drv.c                    |   3 +
>  drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
>  drivers/gpu/drm/drm_print.c                  | 235 ++++++++++++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
>  drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
>  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
>  drivers/gpu/drm/i915/i915_drv.c              |   3 +-
>  drivers/gpu/drm/i915/i915_utils.c            |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
>  include/drm/drm_print.h                      |  96 +++++++-
>  17 files changed, 329 insertions(+), 98 deletions(-)
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
