Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF4A94E9F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 11:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C438E10E252;
	Mon, 21 Apr 2025 09:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CT1km82+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC84A10E34E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:59:14 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-73bf5aa95e7so3344731b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745225953; x=1745830753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hdfyYcjWGTOdu/UCbalSGgUhj6rHypbD9RyxJsRcQ6c=;
 b=CT1km82+5/sz6C+P4AeLY8nsprwybU+Z6859WBKks3zsfaDihtEbKCekIzshbtljNE
 TP1a6FndPY3IcYkkTTAsKf2qqB0m60C4l17fKy8mu/rTvERMUkBzqhnaqjX7kfGeDzP4
 XJ5HFhXm2F4fEMp9fSzBl28rYKlesOaoAi6NMM4OJ73MpHbBbmFbynhQXByHir0VdY53
 l38ao/exCB5P/JE9olp61GuCeZKrM4DpNrnLkTTyy8PcqfGlq1gkGheOEVQamtj6z/0z
 +3DhmiOTubAiICKP/dWWBVVWumZoXSSNJ6v16ev4UFkALd7F2C8E3xJs923IYuYkoCtY
 Pl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745225953; x=1745830753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hdfyYcjWGTOdu/UCbalSGgUhj6rHypbD9RyxJsRcQ6c=;
 b=BE0dFKPRVVien1ySm2BHaR8JJFoOSqA8P90lz4fAwMRo0UbR3mERvlGsKQo3+iaRj7
 Ah5nPLuhpLI9w523x1ZyI9mbOGSglK1+0AkMY2GVIPgYf3Uxue/TIRKoY1YpSAJIpZQi
 ch0ParVY+iDiTABaViY9jbiWwE8XfrpyhWnHPsdQI5nqvyrp6J2KfVRPL6uy6g3DNKOB
 P3D8eAf/qo2lQHgS3m/JksIFeSHeK7nqe0rIUs8RjHKRuq7S264re1llx3RL9wXzoJmR
 FImAHSsll4u9fMXStZq8cl+JBzkVDHEzSXAAEA0skq2kXTyEj1EPPgSy8Dd1/PiO/tgI
 +nGQ==
X-Gm-Message-State: AOJu0YyCaV9MZD7N1+f++XYuNCKqfi0Ze0WNXb1n+bfoKF1w8jmAeplG
 QbrYhd1pubqkablV8j975jf5kas7w+jplJfdnjw0OAzjxFzmczsu
X-Gm-Gg: ASbGncspewN2n24bIYnoTpTjMfSESpi4HwcHedYjYvMacjQTfMHWD009SoD1Q0FjbBx
 m4ZiU+cGQEjT4XOjlQsd+g8Jg37sIa8hpwJI9DCkgyKFZww/zKO9DgRBQZWivXnwlm8innKQfTe
 FcJpk2B3QMP80vw9a3YBFAWdnnEelKDpJD48B6OqLz8GMBMKSHmNwcFbSt/4M6jh6yB0lE/5Lig
 f7YggMFlg4F2y93DkQLYauw8e1MMs7g/2jjq9jV+sBpGtb61sptSanMHxdMASHDz9iRNBVU9dRl
 Izp+ej1KBfPne+Htq+s7pvTzjhlbvvfws37Vom+ucbo5LyXpsK1Mj3wyt/s=
X-Google-Smtp-Source: AGHT+IEdexOf33Nc2LGLtrfxZIzDjmw8YeKrnPWNGs7WB2LGvu8CfsnuMSErAkh78OcSgvv7kP9FlQ==
X-Received: by 2002:a05:6a00:39aa:b0:736:ab49:d56 with SMTP id
 d2e1a72fcca58-73dc1453877mr15139537b3a.1.1745225953312; 
 Mon, 21 Apr 2025 01:59:13 -0700 (PDT)
Received: from localhost.localdomain ([115.99.204.184])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf8beb0dsm6082879b3a.33.2025.04.21.01.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:59:12 -0700 (PDT)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, mcanal@igalia.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jagathjog1996@gmail.com
Subject: [RFC 0/1] drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor
Date: Mon, 21 Apr 2025 14:29:06 +0530
Message-Id: <20250421085907.24972-1-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Apr 2025 09:27:07 +0000
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

This patch updates the MIPI DBI driver to use drm_device.debugfs_root
instead of drm_minor for creating debugfs files. The debugfs setup is now
done earlier in probe(), before drm_dev_register(), and the drivers can
avoid using the .debugfs_init callback.

This is an initial version, and only a few drivers are updated for now.

I noticed that some newer drivers or patches still use
drm_debugfs_create_files(), which relies on drm_minor. I was wondering if
there is a specific reason for this, or if there's a plan to switch to
drm_debugfs_add_files? I can send patches to update more drivers if
that helps.

This patch helps move toward the debugfs cleanup task listed here:
https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support

Looking forward to your feedback.

Jagath Jog J (1):
  drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and
    .debugfs_init

 drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
 drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
 include/drm/drm_mipi_dbi.h            | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.20.1

