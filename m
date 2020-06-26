Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B820B4B3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 17:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385466ECBF;
	Fri, 26 Jun 2020 15:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605FC6ECBE;
 Fri, 26 Jun 2020 15:35:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id dm19so1007697edb.13;
 Fri, 26 Jun 2020 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=nxgdI0PHS9fZd2ASUWxvxCPW2bkr766GJBjvOuZLk+k=;
 b=CRHD68toCt/9VGp07w4mYOLHRn3hIGw+Vm8TkX4eh2Y+RpKuLPkP5OLY2ZhV0PNHZU
 ls3VbZ8XlFfN2Uv6fW1mNwvgwQiPhKrzl5JYmjvsi6bIIEPHr4+ryG+7c4jVr4NO9Jhd
 M4/P49jxmgv9JZ2HkPy3TGGmsPX49kQKUDoRnuuSuuDqBt8Gfd8UIMYb5y0pnSboFAVf
 XXxn4gTZViPoINfrRWO7tj6oNl5/3GxFuOgyaLrlV4d4UK3WKDWpkx/obpsKGwu0I7w3
 gOwYHpf5O2SF2eqYbfTXi3QqAvsKKrZ+jOKzCI/RYfCL06csxokDz1Z5g0O+2ViiVMas
 trBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=nxgdI0PHS9fZd2ASUWxvxCPW2bkr766GJBjvOuZLk+k=;
 b=nzRkqbKhAIkD63uYvbWltdAr1W7q0pv62G4oRyKeegLaKyoQDKHpzzJLpQj9IHL/mQ
 crTtzlp8bC0DNqHulXx1M6TqU8wXdNYSP40FczaSJZWNmMAgQTu7lpwUhoID6PyijJDz
 5TEYYD8NEWR+mg1UK7/vKm9DXvX0CEsPql2T++1nkbRLwlXwymEzFoK9vraoUzF2YRmn
 HqFDN+BjNnck0TYRPZzmRS2iPhheobPSNge2F15cLripnA0mJVj6JOisjIjNsG0ADDp1
 5buIXo4tMS3E3o2C6+7DLMPUWMo8zDJUf1KNRz7cwv7cqTb32jGAGwqNwploEfaQjmAL
 f4lQ==
X-Gm-Message-State: AOAM5301c6WccA3NFIJ7FO1z4EjJAvNJE2hEIRQyim+m1/5qGEIhn+Z3
 7A/yFkJj0XGbJrLhkZYo6YR8mb9BcL2ILaDO6Yg=
X-Google-Smtp-Source: ABdhPJyKflh7rbf7+P3RC95QxeqWSkrhiz5R9M1XvZ0YJ8a1m63hDgbcRRE25gjcqOQX/Z7qVhDK6qWOXmd7ovRzO3U=
X-Received: by 2002:a50:eb02:: with SMTP id y2mr1417044edp.281.1593185751055; 
 Fri, 26 Jun 2020 08:35:51 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 26 Jun 2020 08:36:21 -0700
Message-ID: <CAF6AEGv0SSXArdYs=mOLqJPJdkvk8CpxaJGecqgbOGazQ2n5og@mail.gmail.com>
Subject: [pull] drm/msm: msm-fixes for 5.8-rc3
To: Dave Airlie <airlied@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(retry with $subject)

Hi Dave,

A few fixes, mostly fallout from the address space refactor and dpu
color processing.


The following changes since commit 1cb2c4a2c89b2004a36399860c85a1af9b3fcba7:

  Revert "drm/msm/dpu: add support for clk and bw scaling for display"
(2020-06-01 20:56:18 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-06-25

for you to fetch changes up to 30480e6ed508e3ff7a3e03c975696aa5196ffe8a:

  drm/msm: Fix up the rest of the messed up address sizes (2020-06-22
12:12:29 -0700)

----------------------------------------------------------------
Bernard Zhao (1):
      drm/msm: fix potential memleak in error branch

Chen Tao (1):
      drm/msm/dpu: fix error return code in dpu_encoder_init

Eric Anholt (2):
      drm/msm: Fix address space size after refactor.
      drm/msm: Fix setup of a6xx create_address_space.

John Stultz (1):
      drm/msm: Fix 0xfffflub in "Refactor address space initialization"

Jordan Crouse (1):
      drm/msm: Fix up the rest of the messed up address sizes

Kalyan Thota (1):
      drm/msm/dpu: request for display color blocks based on hw catalog entry

Krishna Manikandan (1):
      drm/msm/dpu: allow initialization of encoder locks during encoder init

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c    |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c    |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c       |  4 +++-
 9 files changed, 21 insertions(+), 15 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
