Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F21B7C84
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E8D6EADE;
	Fri, 24 Apr 2020 17:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735EA6EADE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 17:14:26 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id m5so1730215ilj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RYByyO3QIEU47gTN7mqAa4K1vs54y8GQ0x5KuvlJFVY=;
 b=crFmzsS8lWUOAAgiwUHxODA0VdX/NmN1uriNwtVUUxeQaK6UjeTU8g+fpOFh5DHg5Z
 ywSPkI7dTX4Q+k1xGvY8RE+c1imAur9njIPVgQGFLJrrJWol7k8ymDw011RnY4NCmTRD
 J8cDVFeHjut2K/RXWWmDzhYA0uh2wEb/vXvkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYByyO3QIEU47gTN7mqAa4K1vs54y8GQ0x5KuvlJFVY=;
 b=YZiSKjKl6/Xe3bMqx2E9HLR0Cj35g/a+MdjYJXS6lgrm6ItVV/JZ3NUrDZVx0MxNx0
 NUa6RVU85l/OKjlTg67NYIhhX4PX43OpUZVmtHodPCbb9VFsI/V/doJdbB29tzL1MelD
 +FfblV6rdGmgpemVSSGBzUgwYHHO8DIxWzpP95h3w/HctOjpt9L5GE8pb1er8drqNp2O
 kbMw59ImNcZ9lTABXIiXP5ZSENtZP0gPdjb++hsYzZR5YIcppVjXvzFcJNd6Mb8hJQ3J
 sa6PEpK5bRzvotUDmKM06LRC9lEAzuH7XKKkixV8IXh49WJ28NxL33SlFvb1S6cZoOLB
 RCTA==
X-Gm-Message-State: AGi0PuabSv2RiuBazsdUDYKXJ/nl19K98Ia3D0IZdWumYrr8V+tRE69p
 jCJl+kXfou1XE9Uc8dx/8wKSbHGX0k5hYA==
X-Google-Smtp-Source: APiQypI3S2B7/73fl+XLhjO3CiM1YlDvNAt4wg6ET2ru4tAu8CBN7hWtD/Jh9+BkREMBq9CRK7GG6Q==
X-Received: by 2002:a92:1d3:: with SMTP id 202mr9969963ilb.77.1587748465284;
 Fri, 24 Apr 2020 10:14:25 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id m5sm2273171ilg.15.2020.04.24.10.14.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 10:14:18 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id i19so11110166ioh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 10:14:12 -0700 (PDT)
X-Received: by 2002:a5d:8615:: with SMTP id f21mr9473817iol.155.1587748451793; 
 Fri, 24 Apr 2020 10:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
In-Reply-To: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 24 Apr 2020 13:13:34 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKus8S-ZWjuozKQ8Ft4s-8dPsihrNoZf-GjcToR466RZA@mail.gmail.com>
Message-ID: <CAOw6vbKus8S-ZWjuozKQ8Ft4s-8dPsihrNoZf-GjcToR466RZA@mail.gmail.com>
Subject: Re: [DPU PATCH v5 0/5] Add support for DisplayPort driver on
 SnapDragon.
To: Tanmay Shah <tanmay@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 abhinavk@codeaurora.org, swboyd@chromium.org,
 Kristian Kristensen <hoegsberg@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 8:31 PM Tanmay Shah <tanmay@codeaurora.org> wrote:
>
> These patches add support for Display-Port driver on SnapDragon 845 hardware. It adds
> DP driver and DP PLL driver files along with the needed device-tree bindings.
>

I focused on patches 2, 3 & 5, seems like you have good feedback on
the others by more qualified folks than me.

At a high level I don't have any major issues with the set. There are
some rough edges that I noticed as I was reading it (as would any
patch of this size), but I think it's probably not a good use of
either of our time for me to nitpick 10k lines of code over multiple
iterations.

So in the interest of not letting the perfect get in the way of the
good, I suggest we apply the set and fix up as time and necessity
allow.

Patches 2/3/5 are:

Acked-by: Sean Paul <seanpaul@chromium.org>

Sean


> The block diagram of DP driver is shown below:
>
>
>                  +-------------+
>                  |DRM FRAMEWORK|
>                  +------+------+
>                         |
>                    +----v----+
>                    | DP DRM  |
>                    +----+----+
>                         |
>                    +----v----+
>      +------------+|   DP    +----------++------+
>      +             | DISPLAY |+---+      |      |
>      |             +-+-----+-+    |      |      |
>      |               |     |      |      |      |
>      |               |     |      |      |      |
>      |               |     |      |      |      |
>      v               v     v      v      v      v
>  +------+          +---+ +----+ +----+ +---+ +-----+
>  |  DP  |          |DP | | DP | | DP | |DP | | DP  |
>  |PARSER|          |AUX| |LINK| |CTRL| |PHY| |POWER|
>  +--+---+          +---+ +----+ +--+-+ +-+-+ +-----+
>     |                              |     |
>  +--v---+                         +v-----v+
>  |DEVICE|                         |  DP   |
>  | TREE |                         |CATALOG|
>  +------+                         +---+---+
>                                       |
>                                   +---v----+
>                                   |CTRL/PHY|
>                                   |   HW   |
>                                   +--------+
>
>
> These patches have dependency on clock driver changes mentioned below:
> https://patchwork.kernel.org/patch/10632753/
> https://patchwork.kernel.org/patch/10632757/
>
> Chandan Uddaraju (4):
>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>   drm: add constant N value in helper file
>   drm/msm/dp: add displayPort driver support
>   drm/msm/dp: add support for DP PLL driver
>
> Jeykumar Sankaran (1):
>   drm/msm/dpu: add display port support in DPU
>
>  .../devicetree/bindings/display/msm/dp-sc7180.yaml |  325 ++++
>  .../devicetree/bindings/display/msm/dpu.txt        |   16 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
>  drivers/gpu/drm/msm/Kconfig                        |   21 +
>  drivers/gpu/drm/msm/Makefile                       |   16 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   28 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    8 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |  531 ++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |   35 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  988 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   86 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1707 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   35 +
>  drivers/gpu/drm/msm/dp/dp_display.c                |  943 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h                |   31 +
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  170 ++
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   19 +
>  drivers/gpu/drm/msm/dp/dp_hpd.c                    |   69 +
>  drivers/gpu/drm/msm/dp/dp_hpd.h                    |   79 +
>  drivers/gpu/drm/msm/dp/dp_link.c                   | 1216 ++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |  132 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |  490 ++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   95 ++
>  drivers/gpu/drm/msm/dp/dp_parser.c                 |  473 ++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h                 |  220 +++
>  drivers/gpu/drm/msm/dp/dp_power.c                  |  545 +++++++
>  drivers/gpu/drm/msm/dp/dp_power.h                  |  115 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |  489 ++++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.c                |  127 ++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.h                |   57 +
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c           |  401 +++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h           |   86 +
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c      |  524 ++++++
>  drivers/gpu/drm/msm/msm_drv.c                      |    2 +
>  drivers/gpu/drm/msm/msm_drv.h                      |   53 +-
>  include/drm/drm_dp_helper.h                        |    2 +
>  37 files changed, 10178 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
>
> --
> 1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
