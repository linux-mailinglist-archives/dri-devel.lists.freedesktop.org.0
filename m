Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9389A98D21
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC72710E212;
	Wed, 23 Apr 2025 14:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Udm2eLtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E33010E6C3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:30:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22c33ac23edso65355605ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745418649; x=1746023449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=gaQX08B2+8x266QyJ6QuzOwzOJ8c1UJqUK6mYtewD40=;
 b=Udm2eLtvVCl/7BcM50uFHiJZagygMSEY8nIyFDYpizod7JwqNIDo0sy5LPS2W5B5Gw
 dmXwFJfBeaFCmoYwbpZONWMKIPpqI+/4NGvNPzJcL7EDiIJoAbeANucbxqhkTsdxcuXK
 aXh4TrJjrVFjGdAM+eXQ48CjEwgaKBfNplMm/svgwk59t2RnjtB80Z0uOo6lDcNqOi03
 l7ivEMFJh5zpjN+Oz8BVY1yWoCykWhBjHV5d38gtfVhsDP8aAu1MKyEpW1mugskOFcw3
 xxavifdwUrH9LFpp7KaR2gorD4PhMxHoX200Cg6IkcmgnQuN5CTk14ev/Djy4OpH43v/
 kHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745418650; x=1746023450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gaQX08B2+8x266QyJ6QuzOwzOJ8c1UJqUK6mYtewD40=;
 b=lKM7Su36eHeIl5N9q+Uv+JPdMuOMuu2/IUZN1h3V46EX1/Qgw002nacOtyV7IL991A
 smn0ZKXUajV/3fOldouy1PNij0fq50Ax0TjGpPRmv8b1+wBcIkMrntZOpdxvWxfIQF6/
 7mL/+UQWbEiAR8FMqLzVWc2nqc2mbbeF7I40U3TVr4sjEI5GGSwFVq3cjOkUhAJkYCcB
 G8sDCN8c9AHARPeBTfTaDUjA1dzPEhww7qDyUS5sBP3Ja7BxoEMW3NnK1RAfSqYNFhNQ
 yf2gkb6gyXJqCnZSvJfv+JoHbJqT4KhxWFlUB0a10PqOm4rAEbMq7Xpb8y2SOKxYGEq4
 GCCw==
X-Gm-Message-State: AOJu0YxFk+GZFVjYuK1+cnRDmSI8tLH/1feR2zTKTM8DKc1/+QyCDS3m
 mfyLZpIQxsNTbFExVxCNsLsTuaWtdEFGns3RInozpF4naSpgxV0l
X-Gm-Gg: ASbGncvg4xf0BgTJFOs1DFiMsXfMgcC9HKbyoo7Qli9BNhCvW2F96WHeYRSWpBdlV+k
 bCL6hn493bNS5nKMYp+R5OpMJAgvAWCvO739PFNkPy++vaNuo0pMQuYZfMyz3pNEmuZ1Q/RWGMJ
 nhPTmCyR6QID0OJxEPJKG54A+HUzAJ9kg47SHkQdjWGpQGWVTZKXgiJ2UfafmomI2qnCd9aVCh/
 gHZFwmFM0e8UQ2MKjquRP9TdyOLDdPTTQ58rys7ZjMElhleFD5HYJRyasb22PoGOHSBC7PjIdd3
 iKVjxRoW0yLyqnFKxaNk+C6xQJFlqQSn9EYzY1cLg23TTB8IEYz2Lw4ZV8yuzXA0Ds2o3Qc6XAT
 G4xb45RkhqCKzdTTnPnW7
X-Google-Smtp-Source: AGHT+IH4v/tQKdMaHFAFk0yNJ2N0GNG1N9zIvOuNxHaZ9ts2MjhK6ik5G1JhmRDmwinwBCgqB4Hu5w==
X-Received: by 2002:a17:903:110c:b0:223:66bb:8993 with SMTP id
 d9443c01a7336-22c5362e04bmr303908445ad.43.1745418649550; 
 Wed, 23 Apr 2025 07:30:49 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50eb5349sm105397745ad.157.2025.04.23.07.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 07:30:49 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Wed, 23 Apr 2025 23:30:44 +0900
Message-Id: <20250423143044.46165-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
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

Hi Dave and Daniel,

   Just minor fixups and cleanup.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 0467145fab3b3a7a1efd221722310fe32329b3da:

  Merge tag 'drm-msm-fixes-2025-04-18' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2025-04-19 15:09:29 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.15-rc4

for you to fetch changes up to c171ad1e8166ff8b3ab9ac94bad2574167b41f66:

  drm/exynos: Fix spelling mistake "enqueu" -> "enqueue" (2025-04-23 23:07:28 +0900)

----------------------------------------------------------------
Several fixups
- fix spelling error
- remove redundant error handling in exynos_drm_vidi.c module.
- marks struct decon_data as const in the exynos7_drm_decon driver since it is only read.

Cleanup
- Remove unnecessary checking in exynos_drm_drv.c module

----------------------------------------------------------------
Anindya Sundar Gayen (1):
      drm/exynos: fixed a spelling error

Colin Ian King (1):
      drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"

Guoqing Jiang (1):
      drm/exynos: Remove unnecessary checking

Krzysztof Kozlowski (1):
      drm/exynos: exynos7_drm_decon: Consstify struct decon_data

Wentao Liang (1):
      drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.c    | 3 +--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 3 ---
 5 files changed, 5 insertions(+), 9 deletions(-)
