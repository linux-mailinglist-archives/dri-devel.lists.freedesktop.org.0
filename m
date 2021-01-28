Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE2307E99
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9CF6E9CE;
	Thu, 28 Jan 2021 19:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317CB6E9B8;
 Thu, 28 Jan 2021 19:16:12 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 19so6406241qkh.3;
 Thu, 28 Jan 2021 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uKWppjoyPlKvDPCM4nZgYRlU6HkJoizZjnD/VkClUGg=;
 b=uWTKE8oGboFk26+37k1DBX9S6S/ANxtTjOXcYorIn34Abv5PYNhYPNccJDOZvZaI6+
 mN9MRTABnbL8w1aNh112u2m/h770MkcTcH/W0uC9jyXWnrXngdh7XIDtpuBm5n7MBokB
 PPs7h82Fsq7xQubGbJQ8lUL9MSRWKwqQ1XgekD/lv4l/A5k750rqr72JDVZZcKB0oo/a
 haVNvXjRIWROlOrm1sVn3HwIW6LxtxKHGKpONQlch4m5p4SyopJ3rLkaoQ7zZnB0p3MW
 Bc7oDNeNNfFYE7Ij4HukkSwjSaQ1bGkQlH/PMzWTyHtxXgr708OZ5McCGwxV4jgVK65y
 lp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uKWppjoyPlKvDPCM4nZgYRlU6HkJoizZjnD/VkClUGg=;
 b=hXDw6Uix2ljDFXSUXwSyO5dF7O3HjnEDqFOF5leid+puUd79HMYidgCkVhNRFdgiqT
 GAgMi88IkTlOziiNFMLmhDcv6wUdIuEM2zqwIgTgysIKFlmWu79BDN/0nd3061iamgvi
 W/E+WWjhcLRl+fPwYR7h5kVo5hrLuwC6olzmnwS9Kpm6uhaEZ4V01vXyTklO1ds8qYag
 qahkVybzFOIit45cu67Xx1wXkiqeukGfOwEdOsC8CeGxwd+g9C1Q9RO52gPySPGLARd9
 HQUAaIbSsTuaO+sSxg9P1u08nLTWMV1rnicGyeT6zfc/BKQ8DssvujXysZ+bEZzyBuOJ
 b99w==
X-Gm-Message-State: AOAM531cKi37HWBypPcXVwwExU8dQNKfaaCSKdgOC1PZQMoqAK8vVF4w
 tQCcfRQSw379WeDR4whOUBwMYjJUGME=
X-Google-Smtp-Source: ABdhPJybyzTvD/I9LqJ0Gv5DTRWc6yEa075sLMNpLkvSyUjwBvPGSXLDnqnTFtm2jTkg2I1K6qARtA==
X-Received: by 2002:ae9:e602:: with SMTP id z2mr713948qkf.403.1611861371279;
 Thu, 28 Jan 2021 11:16:11 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.237])
 by smtp.gmail.com with ESMTPSA id c12sm4064284qkg.118.2021.01.28.11.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 11:16:10 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.11
Date: Thu, 28 Jan 2021 14:15:58 -0500
Message-Id: <20210128191558.3821-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
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

A couple of fixes for 5.11.

The following changes since commit 06ee38dc2aab3b5a09feb74128cf7326a490b788:

  Merge tag 'amd-drm-fixes-5.11-2021-01-21' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-01-22 09:43:21 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.11-2021-01-28

for you to fetch changes up to 00190bc087e795290502dc51c5d32de85cb2c2b8:

  amdgpu: fix clang build warning (2021-01-28 13:40:48 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.11-2021-01-28:

amdgpu:
- Fix a fan control regression on some boards
- Fix clang warning

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amdgpu/swsmu: drop set_fan_speed_percent (v2)"

Arnd Bergmann (1):
      amdgpu: fix clang build warning

 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |  6 +++--
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |  3 ++-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |  3 ++-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |  1 +
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |  3 +++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  9 ++-----
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  1 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     | 31 +++++++++++++++++++++-
 10 files changed, 47 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
