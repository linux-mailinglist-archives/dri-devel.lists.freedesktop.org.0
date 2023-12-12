Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F0880E388
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 06:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606F10E559;
	Tue, 12 Dec 2023 05:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B184810E559
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 05:11:39 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5e196c128fcso8973207b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 21:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702357899; x=1702962699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=efhztduuZIlbY8gtoUVvteotjPJzAA0l+EK879qIAA0=;
 b=QQXiy5f/xf1haT+CcUJApvkNC6novnMZRd08XSRowPR3RodnTKJSFMfBA1CW6mhBye
 tEiciKNWb5Ut0Jj3P/XUhMGeE8nZWhTXKlu05S0sweUlz7Wl8BjHGf9VoGdBYdDaCfen
 9W8kYpXi7I0MIvcp4nIhOGko65D65nUxmOorvvwxeMewTDOgCvIuRC7rWIbLLU2fiojN
 vQNMWgxBJmRu7pMdrlI+sRLa0M3FhgOWBYRAJpLQkkbKonpG/N6fVwlvT9N2FVzYYOFO
 KfVJ9gbB5/FMmA6CjuezwXSDtL8g8l1E8K0uZWcOop47R/5Lb0PMoJBjYONoyb8IsxjO
 Ejww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702357899; x=1702962699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=efhztduuZIlbY8gtoUVvteotjPJzAA0l+EK879qIAA0=;
 b=U7LT566cFbB/PCoQZVB/I5oD7pAZozj76ES8EMKpC4n+2u2dvgF7RD54nTpaOwb2qJ
 FoOc9WbEjfKAZhdsz2EYS8HbvolTM7l7iNvqSRBMO/MqVhDqUNRf+6ZuKAo/hSl41JmH
 qnxYp+BTnvcspEEf0naKwz6UQM1WGoGdliueP6nT1EBcEtjF4kdV/5j/6wK4r5bybDRq
 FI+KHqOytByyam0kk5leiXnkNDSOnlSzmMMFhzRt2Smv+KGeDxnry0ZJErMNDxqt6foQ
 k0SoeBq9gFrYTSoOUCvnP+46WX5hvOm0LtAWiRwkwFHWPOC4S4CJviksrAHpyuV5ZoAg
 Zajw==
X-Gm-Message-State: AOJu0YyBvIw6lf5msTcqjQl6S+khgMPm6TuuRKi2yAgJ2OWH7pbHZe6+
 7rOkT+aXKOPTRxNJiWQerHg=
X-Google-Smtp-Source: AGHT+IH7XAeJow/VB+6EaHQqX8MAujQsj+TAU/S53+aGMo4e7wTNOPaUX+dhBGViFk9bdLu8g6ZHEg==
X-Received: by 2002:a05:690c:2c84:b0:5e1:79fc:fe77 with SMTP id
 ep4-20020a05690c2c8400b005e179fcfe77mr1175848ywb.55.1702357898614; 
 Mon, 11 Dec 2023 21:11:38 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170902aa4a00b001b86dd825e7sm7532011plr.108.2023.12.11.21.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 21:11:37 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 12 Dec 2023 14:11:34 +0900
Message-Id: <20231212051134.48524-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just one fixup to shutdown relevant issue and two cleanups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit a2f8994c1001cfa48483a3afa3550016a3ab0a3e:

  Merge tag 'exynos-drm-next-for-v6.7-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next (2023-12-12 13:06:29 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.8

for you to fetch changes up to ead5a41c8f8a13ad7b1c9fd2d7edb1ea909b777f:

  drm/exynos: dpi: Change connector type to DPI (2023-12-12 13:06:38 +0900)

----------------------------------------------------------------
One bug fix
- Add a missing call to drm_atomic_helper_shutdown() in Exynos DRM
driver.

  This function is necessary during system shutdown and when the driver
  is unbound. Without this function, components like panels may not shut
  down properly, potentially leading to power issue as mentioned in the
  kernel documentation, specially in the "driver instance overview"
  secstion of 'drm_drv.c'.

Two cleanups
- Convert '.remove()' callback function in the Exynos DRM platform
  driver to a version that returns void instead of an integer.
- Change connector type of exynos_drm_dpi.c module to DPI.

----------------------------------------------------------------
Douglas Anderson (1):
      drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time

Paul Cercueil (1):
      drm/exynos: dpi: Change connector type to DPI

Uwe Kleine-König (1):
      drm/exynos: Convert to platform remove callback returning void

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  6 ++----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  6 ++----
 drivers/gpu/drm/exynos/exynos_dp.c            |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 16 +++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_mic.c       |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  6 ++----
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  6 ++----
 drivers/gpu/drm/exynos/exynos_mixer.c         |  6 ++----
 15 files changed, 40 insertions(+), 56 deletions(-)
