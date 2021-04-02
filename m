Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1CA352DAD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 18:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCC46E134;
	Fri,  2 Apr 2021 16:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245166E134;
 Fri,  2 Apr 2021 16:25:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso4550624wmq.1; 
 Fri, 02 Apr 2021 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=A6UBEPWH4Pqrp2yST70F67kTWsb725VGtDiuWhpkKMw=;
 b=keH4UX76ym1k1mU0mAqLHL5lniAYVj7KiwGNCrIZvZTpexqtCX9yTpiJ6Vsq++zCSK
 P4iWzfEpHvAMSGJZ83ONXLCDrd8kiFJ6YNM3YmtQBWtRn7ZYQ0u8Ia+fx9iZSnKNplfM
 Q0RNbk75OHcRoLn+fIOjymjP3BA/f53A5FMdNSdjDuLShBf4bXG4RFY0qMHhWmU+G9Kl
 U46Lolp3xKVPFMG00ylJ4Dkah8fq3DNdRZRCOfD93ywCsolGi/YOcggdEsTb7luG9aqT
 uaPDMnlUU5y7dXps7XTlHkYkdkNVQ6PdMGs4D7ASP8dU2Pnl/M32sCDZGmmblne37z4j
 eoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=A6UBEPWH4Pqrp2yST70F67kTWsb725VGtDiuWhpkKMw=;
 b=eqg9u8AOzu6nHZy2+R7yHLgxV0oPdV23Mjbzw0+2wKZ3msXmE79i/JJmk9XS68sNyI
 mij+PADTqFj+yIeD3FHgWcbdJrtCj7zM2OEQ0RMeIJUJ38ISyRpYv6Ac3sC0dTew0B6t
 PoVmF1hCkDE6buFQsmIR7OaWu7hYD1d0c+hAGdOfwPye5O+FBV7aEvgb4bYa0QF/FbtB
 k4nhrthOfqfTeOC4XgWfpld9JL7tzLYPqFFQhIrcE5vNVyMOAqTy3o5X9b8xONyLm1ZH
 M0yhlR/2gLtBNQ0pKFsjPr4VKJnkPI9T3Gy+xfCTwcIar0RHZseElKBxifjAnkmXMWBu
 QApA==
X-Gm-Message-State: AOAM532ybIfZQMN1XdOtbQbxcpSLQLnx2SD7tt8Dme6jGuZ6qctjoaqJ
 Vy4+3OxOCMPGlpUIKl4qWnstC4s7PPY1WdHnD/s=
X-Google-Smtp-Source: ABdhPJykiFcugV/Elu5oRMaSCU6UPriPtZJa6ZQZm88VODiQYXJOAjvy5GOxJP1dAfIM/3htKwFDSc43vb3sCN2fRxc=
X-Received: by 2002:a1c:66c4:: with SMTP id
 a187mr13590583wmc.164.1617380715718; 
 Fri, 02 Apr 2021 09:25:15 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 2 Apr 2021 09:28:42 -0700
Message-ID: <CAF6AEGsMj7Nv3vVaVWMxPy8Y=Z_SnZmVKhKgKDxDYTr9rGN_+w@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-04-02 for v5.12-rc6
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

A couple more small fixes for v5.12

The following changes since commit 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
resume (2021-03-22 18:52:34 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-04-02

for you to fetch changes up to 12aca1ce9ee33af3751aec5e55a5900747cbdd4b:

  drm/msm/disp/dpu1: program 3d_merge only if block is attached
(2021-04-02 08:23:41 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm: a6xx: fix version check for the A650 SQE microcode

John Stultz (1):
      drm/msm: Fix removal of valid error case when checking speed_bin

Kalyan Thota (1):
      drm/msm/disp/dpu1: program 3d_merge only if block is attached

Rob Clark (1):
      drm/msm: Fix a5xx/a6xx timestamps

Stephen Boyd (1):
      drm/msm: Set drvdata to NULL when msm_drm_init() fails

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 18 ++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  4 +++-
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 4 files changed, 18 insertions(+), 9 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
