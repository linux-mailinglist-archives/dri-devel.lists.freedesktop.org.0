Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BA7F34A7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 18:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F61F10E535;
	Tue, 21 Nov 2023 17:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C1B10E52B;
 Tue, 21 Nov 2023 17:13:15 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so8006358a12.2; 
 Tue, 21 Nov 2023 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700586794; x=1701191594; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tfrKxQU+NNoEgEsTzhWUkNf39I3RD72xOvaEb8T1Q6Y=;
 b=MCYi26JlTqoIjEUin4Klms8huJ8ZYFyAjT4PlGaiBD65yoUo0NB0OZOl5F6Q4sc3lp
 keZXbRhWesZnDw2G3gmmkhcixb+YkAnMZRR9AtWtbTKncyYHjDMgeJjvPFhgHJyEfoaz
 M1Rzm3zn5Eu9EPejSxLudoFviIHI1GscTysYtLcJ8MN7ep3ZqpqTK/0RTnIbzfqf3Ri+
 N732WU0Kt0nOnBGNyY6Xom3sCvYd7VcM7droztCqhnFuk3wfsxhKyp0uhTiYuy6FvmPC
 Rpj8jxlqkXIASjYRXk6s798BL/jDgmyAvpJEyNs8e7/cuVSVUx9TsS7eUImoYueZhj5k
 1/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700586794; x=1701191594;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tfrKxQU+NNoEgEsTzhWUkNf39I3RD72xOvaEb8T1Q6Y=;
 b=df8upZamUYW1B/zeG3ZEgU4Z4+2b/KUAT3eCItQ1ps01r9JzjggieVh1Fpk7MMi60v
 AstPH0BC9MmXEuTgW4LcJkeBvd1Wnb8PHIU95+6grGWk/q3JTv1Ig55YqC+H22dznLOT
 vgwc8Whr4GsTL+/mW/NMj6j6Fw3Kn2YVU+CnV2pL35gLErxHq0fmQmiJsCF8e/GZfrB7
 MXEF5CXEmUi1ZijqI9T2V+z7nFzTmFt342mIjNQ4uWVx1jOxB+td7Gd0qZuPBDl+V1Fp
 y4N2srZdenCgrvT5plA5sdPEj5CemKAxkO4YDJIEBuIHlTmhqSwEBhW6u1NCSzUPQqcX
 AUJQ==
X-Gm-Message-State: AOJu0YxnxGPGQ9Lx555fk2pyODcibOCegaXNN6N4bkUgFzMMn0kLFZT4
 tFygWb3y4wjhBUShlXTQS7Is9vE0ml1a/bUVZMhNeuu4LX4=
X-Google-Smtp-Source: AGHT+IHVKdbANVF0O868LMUeMnwzlbjGCJCKaJOT2Q+jF/7i+A0oTP25OuFrrkLpZkfRP2d4cGgDDzeMfznicLPIAXA=
X-Received: by 2002:a05:6402:3d9:b0:548:e8aa:dfc8 with SMTP id
 t25-20020a05640203d900b00548e8aadfc8mr2020104edw.32.1700586793501; Tue, 21
 Nov 2023 09:13:13 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Nov 2023 09:13:01 -0800
Message-ID: <CAF6AEGtkna3P3mvaF53n2ARJACaXQU+OFfShayTrsUVmqCOmNQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-11-21 for v6.7-rc3
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A few fixes for v6.7, description below

The following changes since commit b08d26dac1a1075c874f40ee02ec8ddc39e20146:

  drm/msm/a7xx: actually use a7xx state registers (2023-10-16 09:38:56 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-11-21

for you to fetch changes up to 56466f653cb59a8f46e991ad1e285f43afdca7d4:

  drm/msm: remove unnecessary NULL check (2023-11-17 15:32:49 -0800)

----------------------------------------------------------------
Fixes for v6.7-rc3:

- Fix the VREG_CTRL_1 for 4nm CPHY to match downstream
- Remove duplicate call to drm_kms_helper_poll_init() in msm_drm_init()
- Fix the safe_lut_tbl[] for sc8280xp to match downstream
- Don't attach the drm_dp_set_subconnector_property() for eDP
- Fix to attach drm_dp_set_subconnector_property() for DP. Otherwise
  there is a bootup crash on multiple targets
- Remove unnecessary NULL check left behind during cleanup

----------------------------------------------------------------
Abel Vesa (1):
      drm/msm/dp: don't touch DP subconnector property in eDP case

Bjorn Andersson (1):
      drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog

Dan Carpenter (1):
      drm/msm: remove unnecessary NULL check

Dmitry Baryshkov (2):
      drm/msm: remove exra drm_kms_helper_poll_init() call
      drm/msm/dp: attach the DP subconnector property

Jonathan Marek (1):
      drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                 |  3 +--
 drivers/gpu/drm/msm/dp/dp_display.c                      | 15 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_drm.c                          |  3 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c                |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                            |  2 --
 6 files changed, 16 insertions(+), 10 deletions(-)
