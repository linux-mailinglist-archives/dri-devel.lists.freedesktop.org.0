Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8991DDA28
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 00:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE24B6E26F;
	Thu, 21 May 2020 22:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BA26E26F;
 Thu, 21 May 2020 22:24:26 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id l1so6852430qtp.6;
 Thu, 21 May 2020 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3CQCiR8svJQ7O4RzaroW4mvufa3lG771nqCJTVuRBo=;
 b=VkMOjLw+wuI2Cnz+rSU1+c2lYyS/lMURy3Ili+5IzQ/ICb3aQcC/uSt671ITM0zCvd
 ZValjhh0ECZL2VluAhhZR8eujw4IvgOg1mPFuDrd4IORYMdUdHLuNvMqu8fqFqkUkdJi
 SsLX89gRwIRXxWCprkiZAlIrXaGsTTT5galAkTlR7Dtt81puGJssvQHEU/jq7976tWJE
 89rBWB/BsTDdiu+1C49W8xGVvt8z/psoqD1RyZDfQ5wrhq7WvXw1Gr+DPe7CWvJvTzvz
 Q97/xy2mtKOk0cL3qPq0HJI36hsU3JESy2qwdLRsYMxftnwxlkOVsYCULjbd300WvD+g
 BkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3CQCiR8svJQ7O4RzaroW4mvufa3lG771nqCJTVuRBo=;
 b=ZpOnnGyES5ffn+/BqWfxCOCATTvGbhd/uWD8YUNMqA0SMvGoxp2VS7JDolELuy1h9L
 Kb5HIBVGrhsYUTC7uKhg4ku8pPMr1/uiAaWEiN0vP/IllQVcshXJwb9dvl2v3LgU9h2L
 Lv6W4+7+1wZdkj0GJj48e4gE9owHOicsuNUi4YhRDOkc9zZA0tVrmsw/GCxxNlIvFTZD
 eag8OWRtvRtvrnOcWlfhCM6NSuEFa9reg126c7Jl1V0ZhpEgICVzzWhYrCADUAHWUeuz
 evMUtaQ9tc/JK8/3Z0Zgx4oECIqcnr1pt04Vv8eFvSsjmNFkR/flq0umWxczHX0R17K8
 6QCQ==
X-Gm-Message-State: AOAM531q2xbuQqCpXBKfr5yuVttRg6ZYZDTNagsmynpHZAYbX+eXWwYQ
 JnwI9npL9QHCAB+auNW+5Rldt8vV
X-Google-Smtp-Source: ABdhPJxtygEPTu0QMZlxHbNVExxab+0/B2JEZ8a1+P83cly4rKhkGbfVwKu3h7rd6EkPbtNWopUEow==
X-Received: by 2002:ac8:5210:: with SMTP id r16mr13206758qtn.341.1590099864885; 
 Thu, 21 May 2020 15:24:24 -0700 (PDT)
Received: from localhost.localdomain ([71.51.180.250])
 by smtp.gmail.com with ESMTPSA id a4sm6327042qtb.27.2020.05.21.15.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 15:24:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.7
Date: Thu, 21 May 2020 18:24:15 -0400
Message-Id: <20200521222415.4122-1-alexander.deucher@amd.com>
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

Fixes for 5.7.

The following changes since commit 5a3f610877e9d08968ea7237551049581f02b163:

  drm/edid: Add Oculus Rift S to non-desktop list (2020-05-20 12:56:49 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.7-2020-05-21

for you to fetch changes up to 31ecebee9c36d5e5e113a357a655d993fa916174:

  drm/amd/display: Defer cursor lock until after VUPDATE (2020-05-20 17:32:13 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.7-2020-05-21:

amdgpu:
- DP fix
- Floating point fix
- Fix cursor stutter issue

----------------------------------------------------------------
Nicholas Kazlauskas (1):
      drm/amd/display: Defer cursor lock until after VUPDATE

Rodrigo Siqueira (1):
      drm/amd/display: Remove dml_common_def file

Vladimir Stempen (1):
      drm/amd/display: DP training to set properly SCRAMBLING_DISABLE

 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 27 +++++++++
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 69 +++++++++++++++++++++-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |  5 ++
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |  1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |  1 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |  1 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  2 -
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.h  |  1 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.h        |  1 -
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.h  |  2 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |  6 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |  2 -
 .../amd/display/dc/dml/display_rq_dlg_helpers.h    |  1 -
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.h  |  2 -
 .../gpu/drm/amd/display/dc/dml/dml_common_defs.c   | 43 --------------
 .../gpu/drm/amd/display/dc/dml/dml_common_defs.h   | 37 ------------
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   | 15 ++++-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |  5 ++
 18 files changed, 126 insertions(+), 95 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_common_defs.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_common_defs.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
