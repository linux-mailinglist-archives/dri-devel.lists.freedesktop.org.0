Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB01FD85F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611986E1A3;
	Wed, 17 Jun 2020 22:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FA66E1A3;
 Wed, 17 Jun 2020 22:07:52 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id b4so3621604qkn.11;
 Wed, 17 Jun 2020 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFlkTlA3a1jIkp/uIQ1lT7+XHzRWxghrvYHHu6hHp4k=;
 b=pb8YWAbNJHvWAh7BqnqcGJtnl85jqErNX4o4yHSfH1jRGmN6LLACf3YPy8d0e5PcJi
 AWi0PHBmH9BSNB0Avv36f18+6oOa45aK+gjKOdGnUWVJ29qygyIfsjdgOq6bjeHqpD2X
 YVk83U0DnulDxqnr9xydfgPVDUTo7mD/9yXzRo0lRK9zByB/bI4jUDuiQe/YhowaahB9
 SmgdlIP0U7V4cGfTrgrUddAFvY7UJEhN1zv2kagrC60DxNgnnJmqoCZV8Ge1ySmew4Kk
 2Ntbq880vUuJ40WR6yzD7gx0i8mxoYY8z5nbSk6YNiWngxKpt2c+ggquwuwcqoCahvOZ
 tg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFlkTlA3a1jIkp/uIQ1lT7+XHzRWxghrvYHHu6hHp4k=;
 b=OowqArIRYCyyjNwRf6GuvaXMGFEGqmVU0kKoBf/p2U9bRqWYxvPIN16ZFyOJtdYA54
 9suoteHmYvg298gYBFuSffoohP3TqfPYRrN8pUPp7z5DMsH1V6w8tDL6wFBdLYEyC9e/
 Y4doAgogLYawJOJkVSACETppzIwTfgwNzw23DM4f5K/YrPqzRJKFvmhJMCbkTtOGUFfL
 8eaCQOsheCP+zTq+HGziWfHCynSdyBeSiDiUjXQAQECoExQ4NM/z65wuTC+AVlQGJcpj
 1bTYwGC5prbfgPleiMPW7zW9agUJod9/hJ1nhnOTGzWi9D1Y0lH4XCO+7AdbetRgnqLy
 MACg==
X-Gm-Message-State: AOAM531Eb19XLSyCkFrKwaD9tqnlqq3woG6ikWt1m3smShTGMoElpwBg
 qQZAcW1Ue9eMqQtnPih2PQUf4o5+
X-Google-Smtp-Source: ABdhPJxc2vMx2ucm3nMe7TO2XqzPqiQL9pi5E3ARzRRNs94kgAOywm7c04qJshVqDbTQ/uX6YJnp5Q==
X-Received: by 2002:a05:620a:1132:: with SMTP id
 p18mr812026qkk.494.1592431671444; 
 Wed, 17 Jun 2020 15:07:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.51.205])
 by smtp.gmail.com with ESMTPSA id v69sm1077892qkb.96.2020.06.17.15.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:07:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.8
Date: Wed, 17 Jun 2020 18:07:33 -0400
Message-Id: <20200617220733.3773183-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.8.

The following changes since commit 8d286e2ff4400d313955b4203fc640ca6fd9228b:

  Merge tag 'drm-intel-next-fixes-2020-06-04' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-06-08 11:59:57 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.8-2020-06-17

for you to fetch changes up to da9cebe16930f0273278fe893f2809450c61ae41:

  drm/amdgpu: fix documentation around busy_percentage (2020-06-17 17:42:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.8-2020-06-17:

amdgpu:
- Fix kvfree/kfree mixup
- Fix hawaii device id in powertune configuration
- Display FP fixes
- Documentation fixes

amdkfd:
- devcgroup check fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/pm: update comment to clarify Overdrive interfaces
      drm/amdgpu: fix documentation around busy_percentage

Denis Efremov (2):
      drm/amd/display: Use kvfree() to free coeff in build_regamma()
      drm/amd/display: Use kfree() to free rgb_user in calculate_user_regamma_ramp()

Lorenz Brun (1):
      drm/amdkfd: Use correct major in devcgroup check

Rodrigo Siqueira (1):
      drm/amd/display: Rework dsc to isolate FPU operations

Sandeep Raghuraman (1):
      drm/amdgpu: Replace invalid device ID with a valid device ID

 Documentation/gpu/amdgpu.rst                       |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   3 +-
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   2 -
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  18 +--
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       | 151 ++++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |   5 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |  27 +---
 .../drm/amd/display/modules/color/color_gamma.c    |   4 +-
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c   |   2 +-
 10 files changed, 166 insertions(+), 59 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
