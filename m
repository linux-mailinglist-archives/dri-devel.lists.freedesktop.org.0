Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE520CCD8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6435F6E40B;
	Mon, 29 Jun 2020 06:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2A6E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 03:18:53 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t25so11790002lji.12
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 20:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HlEJy5BcEYfJuRETmD/4cFe9b4ldi2YDayAxtaQnFzo=;
 b=kkHRe1nEGyLQiI8VAigNZ/OsAMEF3OAkcjxIxcoA3YJgV3nYrqOvDc/Be57y+YZPk9
 XmRuvgcO0C0wPaAHY9hFAaJbZLXZ6yp0f8H7V5iB1btoh9mVMFUNeR02iN16WPuusZAF
 fsy6+FI02jlQM0t+o7I2yTyFntlE/BUplz/0OKSx7LwgOPUA48IBDqOtiwJWfVfRUzDb
 KLM9lb36HixOj8JeYw00njRqAIydbWUV+XHXqu+EC3IXiUhCXlGqxVNdfDzIuC57n1kd
 zA0HmRZ4nj0C/pCHQLbaE0q7B2T4aIttsyebMmDspXpIW7PRGxKXig7jkqe8vKc6wfaB
 kqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HlEJy5BcEYfJuRETmD/4cFe9b4ldi2YDayAxtaQnFzo=;
 b=MWZ05UOGNQ2sS0Dn/URWW0YQXYwnxtuT0FtF3xry6tYdmzzs3B4W8tI5LHX/tx+EQI
 IS6lesgPiRFZCJ97VNikk25vtLe+n58pWV1m42fPZaOauqzWOKGkPJPq20kbKEWeObiT
 FhcaQzZQKPAsbLrTk6WITsveB8GC4WSZa16Yj/t60d1vPZwAl8YjH7MvlpAU1/dSoPm9
 CtDVEuEXwpfX1gLo3VNBJf5lDbtHMIAR9s1Uwcj2AEGEsy3TNuw0qQ/9Lgp10c9yJ0iw
 zqm8pZ3NimfMc4YnVtHq4yC0kA4JjSRe0GO3DHMZNvsvOqEhsQywJqgyGO97fUUkpWTe
 DU8g==
X-Gm-Message-State: AOAM5329+dr+NSsik65p5AF1YHgcTj/WXz1om7/XkGC8FFt5ELIA45Od
 JvRUgeJ/a1uvCfNrGLfqVzc=
X-Google-Smtp-Source: ABdhPJzFXYT+7+qKn0ocb0G8QP4XRZYfVx8VOholhZM09Vq42RxZqOylYDRPlvp0Ijw1ItlYdQ4erQ==
X-Received: by 2002:a2e:2c18:: with SMTP id s24mr359135ljs.291.1593400731986; 
 Sun, 28 Jun 2020 20:18:51 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:18:51 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v2 0/6] Tegra DRM / Host1x drivers improvements and corrections
Date: Mon, 29 Jun 2020 06:18:36 +0300
Message-Id: <20200629031842.32463-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This small series fixes a few minor long-standing problems of the
Tegra DRM and Host1x drivers. It also adds a push buffer dumping support,
which is a minor debugging feature.

Changelog:

v2: - The drm/tegra and host1x patches got aggregated into this common
      series because I'm a bit worried that the standalone patches may
      become forgotten for a long time.

    - In the patch "gpu: host1x: debug: Dump push buffer state" I fixed
      the printk formatting problem on ARM64 that was reported by kernel
      test robot for a previous version of this patch.

Dmitry Osipenko (6):
  drm/tegra: gr3d: Assert reset before power-gating
  drm/tegra: gr2d: Add tiled PATBASE address register
  gpu: host1x: Optimize BOs usage when firewall is enabled
  gpu: host1x: Put gather's BO on pinning error
  gpu: host1x: debug: Fix multiple channels emitting messages
    simultaneously
  gpu: host1x: debug: Dump push buffer state

 drivers/gpu/drm/tegra/gr2d.c     |  1 +
 drivers/gpu/drm/tegra/gr2d.h     |  1 +
 drivers/gpu/drm/tegra/gr3d.c     |  2 ++
 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 ++++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++++++-------
 6 files changed, 34 insertions(+), 7 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
