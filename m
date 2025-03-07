Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E3A5685C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514D210E249;
	Fri,  7 Mar 2025 12:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="P2Gl7T6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C6210E249
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 12:58:45 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-2c1c44c3f8dso779295fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 04:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741352324; x=1741957124;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hWOEnEleoMx6x5wYF5z4nnnbH/tvYM+ir9LyxHglc6o=;
 b=P2Gl7T6PsO+AYa+afAN9c+PNMrru5FYVfM/Qt9UJWaVtoSiFfOh0dTUZFbUjAJlSFn
 E+dRmED1zDa4dRs4XdWjKvQTrGkirD0bpAXcJz37NLUgpJV+/VJwsJJUqZY/9IEakz2+
 PJRGyY0BVkY6DLiLOk3nGOixME8ao0v6Jlb3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741352324; x=1741957124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hWOEnEleoMx6x5wYF5z4nnnbH/tvYM+ir9LyxHglc6o=;
 b=aDTKw0WT/b7MJ67EwZcjw4GdZfBmUtmScBrYCIqSlbe+Lj1slBjyiHbp2/PAmNkPuM
 sKM0/GS8IhNjI1YlowSVKqJ2Nb/SXmwkK/V8AUuppo06BvtsWTLtSAB9KCnLfiMO4plV
 oqvS5kx2Bu9zP1Pfn/SfakK+XgII8329FB6PWJPA7u+seKN7jMZqpRrwAgxP4aOxoh2N
 84W+PBF01SvTvoQ93Mktu3pmcL6MyH8Ml1Bdo3amNNut6Wf+PgE3lXPJF6aSBE5eqe0e
 CvuKo3mu63tsyLiZvQ7CsLoo/4JdFM0BS/Ivy6Qc8Sap2W+ACo64iTl5ZKPws25idf3z
 mzLw==
X-Gm-Message-State: AOJu0YwvW8e1nUUWw92U9nziN0fNHarP/9EXV4tcjYufbH1OYGLE4QiQ
 K6J5Qfm+hKFIFSA9B+AtBV9QvIfb9LGpoHJLRfTNtWdijxHxMGup8VVjRZOUzPFSWaZhs1c2Rhq
 HhYWkggqz3T36hy9Sg9CHzrH3MSTiWR2OVdcfki3BlDx9BOvMOoCXUuzqNzyq3dDy58/9OP79uA
 eufAV/ugoomcoGyI6NI8zXfpqcoWAWAK0FFjPmpFdp1QBv6HjTHw==
X-Gm-Gg: ASbGncveBwRWjEtSh86BTtCP8x2HjlPxJILCzGq+kn+CIb0Dy2Ig99IgvsKqSpDJUab
 yQGwwJ0iUejCUY9O1hvVptEUWEKn0zSTDSGvJFcgRq2USQAQmg9/MrPNeCGe9Jtrfd2pkHfVpR/
 t7MIkHEtfYjcDh9pxR2CSQytcnqVjXk4nvl6a+7Fxuq5A6rOxYrqTscuE8EUoV/x0em80TzhMQC
 hL46wreQWsOnXg5WfBPu3xm4lOm0IGFjUZboYUF5HKwYkL5FFg2UHKSDhYZNsNqmzKpgSKJ1Bvu
 jCaPQ0T+tGi1deTlXXdIo5fwFujZU7mxVhL6gRPFcS/9nOctc1wOep0LM2VyoKnYIqJkiKlmllq
 TuWARTqeYtRdRpd0eudtTyRv6mvIgEBdOv7ZN
X-Google-Smtp-Source: AGHT+IGiYHh/thRE6FimA6I6SxpGZTJtEE//DCmPwF+777lVzOhMWSwBbZfsELioHg6zRiiKaQUHfA==
X-Received: by 2002:a05:6870:6f12:b0:2c1:1f8d:a9b5 with SMTP id
 586e51a60fabf-2c260f85f93mr1482764fac.7.1741352324253; 
 Fri, 07 Mar 2025 04:58:44 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2c2488b1882sm664860fac.13.2025.03.07.04.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 04:58:43 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 0/2] Fix native cursors with vmwgfx
Date: Fri,  7 Mar 2025 07:57:37 -0500
Message-ID: <20250307125836.3877138-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmwgfx had a number of cursor issues that related both to our handling
of dumb buffers and general detection when a cursor has actually changed.
Fix those issues and bump the kernel module version to allow userspace
to recognize fixed versions of the driver.

v2: Include the fix for leaked dirty trackers in kms fb surface
cleanup code.

v3: Fix the copyrights as spotted by Maaz and fix the arm64 build as
spotted by the exynos kernel test robot

Zack Rusin (2):
  drm/vmwgfx: Refactor cursor handling
  drm/vmwgfx: Bump the minor version

 drivers/gpu/drm/vmwgfx/Makefile              |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |   6 +
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 844 ++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  81 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          |  34 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          | 874 +------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h          |  71 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |  63 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c         |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c         |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c      |  47 +-
 15 files changed, 1043 insertions(+), 1065 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h

-- 
2.45.2

