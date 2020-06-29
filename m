Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7411920D039
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 18:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2456A89DEA;
	Mon, 29 Jun 2020 16:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FAB89DEA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:42:41 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id w73so3207780ila.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SI/vbupyZhwC3o03plXEHIf+lUxq1LHewYV7+dJHwLo=;
 b=Knd7y2+9BKFBS6L8sqHJwRgZ9LoUpUoLtnUvVbfzWVHevlDMT0Q4nIJvJxmRvnSGRq
 idaaEM9JxZGr9OW3WoSYCHpEqxX/qCvCaDfBmEqjxF/Ibk2dVP/LXgWk4wudfH38FfYE
 HJeM6jYCH1lT8Jaw5hZqjGR79T7JEg6bWyxz6Dhuk/gaVIPwUgi8Cz2F0yonJC2E5mPE
 /nJfFZeAHY2yp1rvAPsYH84PLjSg0/rbZNPYYGyJCcPtxJEZwhtlXZP5lSxSLwC4WAeH
 14JjsH9+8fFDVjQRWNuaUTFyiRgne/0tFrGD/lQ9u+iDwA3vR7ZgdmIeK2kQxmcOINBn
 aBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SI/vbupyZhwC3o03plXEHIf+lUxq1LHewYV7+dJHwLo=;
 b=Rzh3yxWSBozFZ5rWD0sDTZv9dKCJ+sjsLb30TXcCr5JGopsjow4VL682Vb6K63ltdP
 BGBDknok23mSY9oKxIw0Lox37SPhSEG7FmU/Q+ggwz202dHG9vW8nhgVYsy36quCfLL/
 U1g3ps1bHhIoO5oZFv0HCj3VvXVqiNC7uOu/IYXMNghRl2E0JaGU3ivHiOHXm45x1CMt
 Z7mFp+kpn1txS3qBId24tZo4m7cNbMStYy7SdSF8Alrpbvv/rcEbxxpKZCFQrfLwFjGs
 UWOg4YQxh1ss8et3GfjgILeRDCrYIirq/2lA8DPdV5+XvHijg0UklTUK57PRDFvChlxl
 OxZg==
X-Gm-Message-State: AOAM531Wtw7BZ6Pp0FK1rnxMyKoL1Z16c2BUzMCLfBzDKLGY5AciKXJ8
 CuRbj79Y0DaALj4z5eNdP1tLtcsVKnDXCyRYlyIaYE6B
X-Google-Smtp-Source: ABdhPJxuICrscMDez8glgwl2j1GO+t9NNkUh8kUjYo5+9aIp5KK7J0UrQuXHIfKn49BHWFLotVIqNrUHxdUcEzauAyo=
X-Received: by 2002:a05:6e02:4ce:: with SMTP id
 f14mr16666965ils.2.1593448960243; 
 Mon, 29 Jun 2020 09:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200608210505.48519-1-sean@poorly.run>
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
From: Sean Paul <sean@poorly.run>
Date: Mon, 29 Jun 2020 12:42:04 -0400
Message-ID: <CAMavQKLO1jN9jcOT+-0GhbV7UFdCoGL1oJDz0iVKW+40s3UE+w@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] drm/trace: Mirror DRM debug logs to tracefs
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 8, 2020 at 5:05 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This series is the latest in my journey to create a lightweight,
> always-on "flight recorder" (name credit Weston) of drm logs. This
> incarnation uses a trace_array to keep logs in memory exposed through
> tracefs. Users and distros can enable drm logs by using the drm.trace
> module parameter to choose the debug categories they are interested in.
>
> The set has ballooned a little bit since the last version. Reason being
> is that I decided to return true from drm_debug_enabled if trace was
> enabled. This should make it easier and more seamless for driver
> developers to use the correct interface, but meant I needed to audit all
> uses of drm_debug_enabled and drm_debug_printer.
>
> Out of all those calls, there are 3 situations which arose:
> 1- The logs should only go to syslog:
>         I've converted these to use the drm_debug_syslog variant of
>         enable check/printer.
>
> 2- The logs should go to both syslog/trace, but were using pr_debug():
>         I've converted these to use the proper drm logging helper. In
>         cases which used a drm_printer I've had to use a new
>         drm_debug_category_printer to ensure they are routed correctly.
>
> 3- The logs should go to both syslog/trace and are using drm logging fns:
>         These are untouched and should be routed to the appropriate
>         place(s)
>

Friendly ping. Is this something upstream wants, or should we continue
carrying it downstream?

Sean

>
> Sean Paul (13):
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
>   drm/print: Add tracefs support to the drm logging helpers
>
>  Documentation/gpu/drm-uapi.rst               |   6 +
>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
>  drivers/gpu/drm/drm_drv.c                    |   3 +
>  drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
>  drivers/gpu/drm/drm_print.c                  | 228 ++++++++++++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
>  drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
>  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
>  drivers/gpu/drm/i915/i915_drv.c              |   3 +-
>  drivers/gpu/drm/i915/i915_utils.c            |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h      |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
>  include/drm/drm_print.h                      |  96 +++++++-
>  15 files changed, 318 insertions(+), 96 deletions(-)
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
