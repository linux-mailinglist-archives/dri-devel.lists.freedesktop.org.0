Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C49254FC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718710E74E;
	Wed,  3 Jul 2024 07:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZOJqGqU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DBB10E74E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 07:59:17 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-754d2b05db5so917075a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719993557; x=1720598357; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUXP1n3neYZQXYyEiIWXxaQep8rZCiu9VynGOnY6c9o=;
 b=ZOJqGqU9odO8wGvHn/2EkBvh0WsV53ABBUwmJkG7kWbyKSC0t9njWZcyO+Fw/Odwbb
 lYekQi+pExshUpjLr8X7CIPgYEEKdVeAfgVSEMU1104QloN6iuVmGZv7IQEx4LE9dQJP
 0flmbsFXgeQ42zacx5iMpKqEpcZubm+h7/gYj68z3/7ToeGWI+W2rg82+KeuxKYgrgKZ
 MxL+S2tqsYvKzIrQkknkPhwcfLKHe5KETDIWREm9vpcFZG3FoWXEkeJwcsPE2oUw3t1r
 CQKjQ/Gz9U8dbEpAT/2yBGAdeCI545XOzMu39c4GAdw/RD7+cCJ2sGA7N006+nQDAk9x
 vxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719993557; x=1720598357;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WUXP1n3neYZQXYyEiIWXxaQep8rZCiu9VynGOnY6c9o=;
 b=KpmljcThvTb+leqiODGU0QBLXc/wiE85kkQL/Q3V/2iW7rShifb832eaGgU1wlvQJ6
 7COVgABRhr2ncQM3Hgu0H0NgXeZEtEtwAQ5jV6BtvDUB5FCthvLyEYiqUq20iI1P5rqS
 LnOLJqgqCoWdXhm34E/LMpdTTnIrhWPmpiCily/iaWaQIxr90PSGoJGPFP9A24RCal1a
 hSaf0IHKZndP19r/8H1rxaSJP6Dcc9yIsaA8HWdXaity652i95PHM67T5HubEK8IPi4C
 iHhBU391WvZl+KXEtqve1dycQtRtj49fAGIRh2RxXj3g1zHDr++LrzkRB3uL9UaABpUP
 kxoQ==
X-Gm-Message-State: AOJu0Yz7isquz6UcACUmrUcoQiZ4pRUyMiGrjRNrhZ4XKLYzHTy8bPi4
 Bv6cVdabAfpZKEZ6y5dEbUGZladJTJqTmyFf/fEPAIsTvhmM+UNP
X-Google-Smtp-Source: AGHT+IEmp3rXcu2b0cdpoNk5erAfpzbe0GUB6DHEdKkuar1CPSsd+S+Xv2XmyThBNVhasHPcpzKcRg==
X-Received: by 2002:a05:6a20:28a9:b0:1be:c054:1ce1 with SMTP id
 adf61e73a8af0-1bef626eea6mr7742948637.55.1719993556427; 
 Wed, 03 Jul 2024 00:59:16 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15698d6sm96241075ad.192.2024.07.03.00.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 00:59:16 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Wed,  3 Jul 2024 16:59:12 +0900
Message-Id: <20240703075912.37106-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,
   
   Just three cleanup patches to Exynos Virtual Display driver
   for improved management.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit fb625bf6187d97c3cd28d680b14bf80f84207e5a:

  Merge tag 'drm-habanalabs-next-2024-06-23' of https://github.com/HabanaAI/drivers.accel.habanalabs.kernel into drm-next (2024-06-28 09:41:04 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.11

for you to fetch changes up to 2210093478443cd57cff5950379fec31ee8a5f79:

  drm/exynos/vidi: convert to struct drm_edid (2024-07-03 13:00:16 +0900)

----------------------------------------------------------------
Some cleanups to Exynos Virtual Display driver
- Use drm_edid_duplicate() instead of kmemdup().
- Replace existing EDID handling with struct drm_edid functions
  for improved management.
- Keep an allocated raw_edid or NULL and handle fake_edid_info in get_modes().

----------------------------------------------------------------
Inki Dae (1):
      Merge tag 'exynos-drm-fixes-for-v6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next

Jani Nikula (4):
      drm/exynos/vidi: fix memory leak in .get_modes()
      drm/exynos/vidi: use drm_edid_duplicate()
      drm/exynos/vidi: simplify fake edid handling
      drm/exynos/vidi: convert to struct drm_edid

Krzysztof Kozlowski (1):
      drm/exynos: dp: drop driver owner initialization

Marek Szyprowski (1):
      drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found

 drivers/gpu/drm/exynos/exynos_dp.c       |  1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 83 ++++++++++++++------------------
 drivers/gpu/drm/exynos/exynos_hdmi.c     |  7 ++-
 3 files changed, 42 insertions(+), 49 deletions(-)
