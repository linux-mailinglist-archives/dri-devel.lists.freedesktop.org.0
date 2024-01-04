Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB1823AA6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 03:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A39D10E2D9;
	Thu,  4 Jan 2024 02:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B997C10E2D9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 02:30:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d89105365so605875e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 18:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704335407; x=1704940207; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LBuurdHLnnOev6b2QECRgmq+V/JnKnSW2JNh/0hOGNA=;
 b=PzGAehjSUbvAsFhKo1qIU5jmlobZ5KxoeauLZKzCLxsk/ON1I1sgQbrKUuv3+ZN3Yu
 VSZfbn77i6B+RPfax5xZN5Ux26HXH9r6595K4nuRzcHunUiUqKG9mweGve+Ok28JMm6a
 rVjoPh/t9E+3o5V+R7at0tyTetieJVhcoNuOhD9iKAsIHu8+idbQ+ZtrSuYUGJMXZUF1
 9Gr5eyz05hafz2+Iok7/d8zcfsnp/wQPF8tLLtG0+k4I3O0gCoArQLExz3P1XrBkNt4G
 iNnsAMSrU2MEDm5Gl7a5C8BzumxRydc2Ra/8lIqeFutAVXzzOLyqtbty79cDWuzFdNn7
 0sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704335407; x=1704940207;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LBuurdHLnnOev6b2QECRgmq+V/JnKnSW2JNh/0hOGNA=;
 b=k0QKk4IQD45Aq7RmyZyYZDIbmjdSxmowzXxyqArxsV8HILXzpXf7d0bhW2N6hoxrrq
 T50VeoA0io1B/TAaEBHMy7iiOf+NrguNqPJ13STwHAW/mFMfBq9lz0/GFLvZXwGTaJNC
 IkInagI5aYvkSxA1mUVB8dmZvc7R5QGqO2siTXiIAuxcQ8nR+FoIsW9FVSSzD4Md+kKE
 fb3uTJuwwhtELdnXjn3PYDPAiK26rQYIO5Fpx3Y14ss3usIDj3qG88nytXX/WsSs1Lo+
 QDq+kdVAlGmFjZDnlEKuanBZc1duIlp6FWu9EK4AlknuDtyoMl8qNKBWKkR1G73ps8GK
 fB9A==
X-Gm-Message-State: AOJu0YwXUQcG0HZQT4mRHm5Cpew7Sm9QctC4Iqfxsg6+yPyr24fmv6B9
 EvHW1QYBf7Ro5cd5bZA5a3g1HbMtFogoEwVIM/Y=
X-Google-Smtp-Source: AGHT+IEDuQOx0vVsPKToJX0YOyPsrm4LD+6C3A71UsalPstE8CC8Fm8BL63NjdWQjVqztD0Ff6vsFUC/iwGT3CiW9lo=
X-Received: by 2002:a05:600c:b41:b0:40d:3ade:9fac with SMTP id
 k1-20020a05600c0b4100b0040d3ade9facmr10766708wmr.75.1704335406772; Wed, 03
 Jan 2024 18:30:06 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Jan 2024 12:29:55 +1000
Message-ID: <CAPM=9txBXQR8YsaU2fO1frcGBP6HKTF473Rqae_hwT_yY-dRrg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

These were from over the holiday period, mainly i915, a couple of
qaic, bridge and an mgag200.

I have a set of nouveau fixes that I'll send after this, that might be
too rich for you at this point.

I expect there might also be some more regular fixes before 6.8, but
they should be minor.

Dave.

drm-fixes-2024-01-04:
drm fixes for 6.8

qaic:
- fix GEM import
- add quirk for soc version

bridge:
- parade-ps8640, ti-sn65dsi86: fix aux reads bounds

mgag200:
- fix gamma LUT init

i915:
- Fix bogus DPCD rev usage for DP phy test pattern setup
- Fix handling of MMIO triggered reports in the OA buffer
The following changes since commit 610a9b8f49fbcf1100716370d3b5f6f884a2835a:

  Linux 6.7-rc8 (2023-12-31 12:51:25 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-01-04

for you to fetch changes up to faa21f4c20960fee268bdb0fe977ed0edb6685fe:

  Merge tag 'drm-misc-fixes-2024-01-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2024-01-04
11:18:32 +1000)

----------------------------------------------------------------
drm fixes for 6.8

qaic:
- fix GEM import
- add quirk for soc version

bridge:
- parade-ps8640, ti-sn65dsi86: fix aux reads bounds

mgag200:
- fix gamma LUT init

i915:
- Fix bogus DPCD rev usage for DP phy test pattern setup
- Fix handling of MMIO triggered reports in the OA buffer

----------------------------------------------------------------
Dave Airlie (2):
      Merge tag 'drm-intel-fixes-2023-12-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-01-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Douglas Anderson (3):
      drm/bridge: parade-ps8640: Never store more than msg->size bytes
in AUX xfer
      drm/bridge: ti-sn65dsi86: Never store more than msg->size bytes
in AUX xfer
      drm/bridge: ps8640: Fix size mismatch warning w/ len

Jeffrey Hugo (1):
      accel/qaic: Implement quirk for SOC_HW_VERSION

Jocelyn Falempe (1):
      drm/mgag200: Fix gamma lut not initialized for G200ER, G200EV, G200SE

Khaled Almahallawy (1):
      drm/i915/dp: Fix passing the correct DPCD_REV for
drm_dp_set_phy_test_pattern

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Fix GEM import path code

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Update handling of MMIO triggered reports

 drivers/accel/qaic/mhi_controller.c      | 15 +++++++++++-
 drivers/accel/qaic/qaic_data.c           |  6 ++---
 drivers/gpu/drm/bridge/parade-ps8640.c   |  7 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c    |  4 +++-
 drivers/gpu/drm/i915/display/intel_dp.c  |  2 +-
 drivers/gpu/drm/i915/i915_perf.c         | 39 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 ++++
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  5 ++++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  5 ++++
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  5 ++++
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 10 ++++----
 11 files changed, 83 insertions(+), 20 deletions(-)
