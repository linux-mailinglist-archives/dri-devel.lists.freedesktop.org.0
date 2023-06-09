Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DE9728CF1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 03:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B076A10E079;
	Fri,  9 Jun 2023 01:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8275C10E079;
 Fri,  9 Jun 2023 01:15:13 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-39c77cf32deso231799b6e.0; 
 Thu, 08 Jun 2023 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686273312; x=1688865312;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=H0xCMAC/NtHY5CX7dP6e8DaXAI+xP/PPsv73S1ApFK4=;
 b=oblBIKSjWOPANq4L3jUYH9d7owGAzWhrcXAx9DqzBgGb6E6VYgc5ELqConP7Qz9SDY
 zhs2Pa9CsTcYO1R4glWacmaJpMrZVB63fy/O4y1gLyF55K8hPB0TV1gpbAtAVGtwhOlI
 XEDFRflvrZBOIpmJyeXF6ROighWmDeNMtq8y5Ao1V4M9m0XSenEqgypMCtZd/o7iiapM
 /vJSQC8o/uGPJRd40mEq6duxtX7RWCiQmRiq77TWqKat6zn603HwCwDqdPlDtY78Xeso
 Oqabz3PjcfOczDGAI1BroTwLKBDUntw6JXwdlXUwXeGiIjt8uO8bMfY/MHdb32Er4SBZ
 U1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686273312; x=1688865312;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H0xCMAC/NtHY5CX7dP6e8DaXAI+xP/PPsv73S1ApFK4=;
 b=anDzJXntSjMyUHKvZXV+HHRrJYjBBec1iqR2sXbdbKOZKngvgbhHRsXyE1UcxlZ8Gu
 YYFXiLZoMInvmj/I70F8Qfx5heoBooVJlk8bOz7cErrf+sdMegi9UbnQqmBBe5cZdAxT
 nz29EgH5HCZav6/L8COe/q0Ren0dvivfOgGFHc2eO58OJ1L1igHjKZdi/aJO88dNLdjF
 iV4oxTZ6r8kuvzdscGG4j8nrrQuYgJVi1gQwYO15xKPZYywtEIjB/zVznl2XxV8h0wMW
 6gI+DNMjIGqJcxA4FzuZ6pUhYMHJth7aI2fGDX0zAhK3Y+HyrGyDbLFjfF2ssWwABdqd
 7kLw==
X-Gm-Message-State: AC+VfDyO2ciXtxpUT51ki/zPUFRefh633SwlwnA+E4fT2J6j0M7Ui+TH
 O8Vptn6Ux1RoUJGz/4qFS6D3jT6mLgDQzVBH8VI=
X-Google-Smtp-Source: ACHHUZ5i1BVHpXVDIEhb2skg7ja9WfJxN/vbAYrCOckVTX31ArB0mO+iUW6nFeRen41NjCQEQSOjgq2tDHET0NKxuwI=
X-Received: by 2002:aca:efd5:0:b0:38e:ca21:db29 with SMTP id
 n204-20020acaefd5000000b0038eca21db29mr1922386oih.27.1686273311816; Thu, 08
 Jun 2023 18:15:11 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 Jun 2023 18:15:00 -0700
Message-ID: <CAF6AEGufjVZRNT6YfQ7YUXFC7Cz95wdLF7QHAYkiGfp+3Xc3DQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-06-08 for v6.4-rc6 [resend]
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

(retry of previous PR with missing s-o-b corrected but otherwise identical)

A few late fixes for v6.4.. meant to send this out last week but got
distracted setting my new x13s.

The following changes since commit 5c054db54c43a5fcb5cc81012361f5e3fac37637:

  drm/msm: Be more shouty if per-process pgtables aren't working
(2023-05-17 08:53:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-06-08

for you to fetch changes up to 12abd735f0300600bfc01b2a3832b966312df205:

  drm/msm/a6xx: initialize GMU mutex earlier (2023-06-08 18:10:51 -0700)

----------------------------------------------------------------
A few more late fixes for v6.4-rc6

+ Fix max segment size to address splat on newer a6xx
+ Disable PSR by default w/ modparam to re-enable, since there
  still seems to be a lingering issue
+ Fix HPD issue
+ Fix issue with unitialized GMU mutex

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: add module parameter for PSR

Dmitry Baryshkov (1):
      drm/msm/a6xx: initialize GMU mutex earlier

Kuogee Hsieh (1):
      drm/msm/dp: enable HDP plugin/unplugged interrupts at hpd_enable/disable

Rob Clark (1):
      drm/msm: Set max segment size earlier

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c   | 15 ++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h   |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c   | 77 +++++++++++------------------------
 drivers/gpu/drm/msm/msm_drv.c         |  4 +-
 6 files changed, 44 insertions(+), 59 deletions(-)
