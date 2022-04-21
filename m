Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0250A692
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 19:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F1410E5DA;
	Thu, 21 Apr 2022 17:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7BE10E5DA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 17:07:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u3so7608642wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mOsXpLWi9QLA5ykkzo2aKVd+yr4+GMP+CHJv0QHqFPU=;
 b=PhOXgh0Q5LE7m9gF9czIrKZRq55dBYQfo6JFtQeE9ijzQGIxBM1V5QZtkJjgUAPcva
 mijV+yVjCD1Y5vzy+S/9QeUO9MiLfeuJRoGQ20nYs5NNhxoMqORFTDdKMo8HmDzrMzo9
 q8voQxoIddhVNAF6gBbxgGFWo3cmsBYPJCeEq5oSHPHkD51e69O6TQt3OmbCXV13dl3x
 1nmhxU/KIU992jK2iLSLd01VSlI71j+KQOLtbEiSIGTgDUEOSG4tqwDOFLyrLtkcvG5s
 D3ssv0r5pDlrF6bXeXPICXsORkR4XZl7J1mLagy+RZiY5nXL4U+gkRy6RvMQllEHIZV5
 tHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mOsXpLWi9QLA5ykkzo2aKVd+yr4+GMP+CHJv0QHqFPU=;
 b=xFTkEKHnDGNCKv5NunpvBIOANyypfGKDUSNfflJzQhGXmm1m9+d4M0ukysrovaqfkV
 PP04ykn1qmTJUrFXDPuqJc83ojVkCwjzaDLkdM9+7tjrnA+6bFn3p9YG/KixA3YwLDQR
 i6elQaDhU+svibJEy33n2RBJkYKdEHADLY9VRqHTbwNuHY8x9Zrfu5JJjSBRISola5/S
 eG24+bxyJoCKPSMec4wdfuFRYkV7RFYI6hOd934r1v6p8nSMyIXRfjUPzkxIHvu9bSVm
 +lfNDkfz4Njv1SU/gx9i+MC47J7oSd8uNo9O3dbhCTQU3XxRQhWkbeVbzDX049HMuY2P
 P0iA==
X-Gm-Message-State: AOAM531u4ZYknZyOOwh+9khbz28F1Db7eTpjsrVdJAEOLB9cUSalY/pA
 x4zOxKYLAnj3ocs7kPUy654=
X-Google-Smtp-Source: ABdhPJwmkd8rSG5wIeasQSmzXw1Hxgzf6My3j9pRLVWS50GQVQrvimreO3rNSOKpZuUsPU9r5kjkvw==
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id
 b5-20020a5d45c5000000b0020abe8faca6mr513028wrs.493.1650560852175; 
 Thu, 21 Apr 2022 10:07:32 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:07:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: inki.dae@samsung.com
Subject: [PATCH 0/5] Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Thu, 21 Apr 2022 19:07:20 +0200
Message-Id: <20220421170725.903361-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 jernej.skrabec@gmail.com, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 samuel@sholland.org, krzk@kernel.org, linux-rockchip@lists.infradead.org,
 wens@csie.org, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

After implementing a similar change in the VC4 driver [1], as suggested
by Laurent in the ToDo list [2], I noticed that a similar pattern is
used in the Exynos, Rockchip, STI and sun4i drivers.

This patchset replaces drm_detect_hdmi_monitor() with is_hdmi in the
mentioned drivers.

Best wishes,
José Expósito

[1] https://lore.kernel.org/dri-devel/20220420114500.187664-1-jose.exposito89@gmail.com/T/
[2] https://docs.kernel.org/gpu/todo.html#replace-drm-detect-hdmi-monitor-with-drm-display-info-is-hdmi

José Expósito (5):
  drm/exynos: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
  drm/rockchip: inno_hdmi: Replace drm_detect_hdmi_monitor() with
    is_hdmi
  drm/rockchip: rk3066_hdmi: Replace drm_detect_hdmi_monitor() with
    is_hdmi
  drm/sti/sti_hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
  drm/sun4i: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi

 drivers/gpu/drm/exynos/exynos_hdmi.c   | 15 +++++++++------
 drivers/gpu/drm/rockchip/inno_hdmi.c   |  8 ++++----
 drivers/gpu/drm/rockchip/rk3066_hdmi.c |  6 +++---
 drivers/gpu/drm/sti/sti_hdmi.c         |  7 ++++---
 drivers/gpu/drm/sti/sti_hdmi.h         |  2 --
 drivers/gpu/drm/sun4i/sun4i_hdmi.h     |  1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c |  6 +++---
 7 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.25.1

