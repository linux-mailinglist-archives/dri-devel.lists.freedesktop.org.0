Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F594FDDA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 08:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B850310E2B9;
	Tue, 13 Aug 2024 06:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IOF8+I8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3529210E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:30:53 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-268eec6c7c1so3685777fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723530652; x=1724135452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5RjnB2Ejjysk1p3v/3xpGaZLkpRb/wTvNBtiPCwne78=;
 b=IOF8+I8W4wD6Q6uW9ymd0gX+xbIvcYf9R9h/wThEv7KoHvnTsae1v1tni8w+6t0zGr
 zXAkgQ9ZdguzCK0S3vUGxm79yGs0OjiX4hL3c/50DFzMfipP9oQdA55lv/+CTxrv6Ped
 k+y5JM1STrGiEi6tw9B4/aC6a/bXcaSYWqofUWlu0jUInqsYRVBt1Oruht2xvhulGmDY
 9JJZOPosdcXJCHPk7FWRMUUKrpyIGtR0baei6LvU4tTFMQWW2d9+YbDz/8fxJ3DXsvpz
 AWdmYmkMf985Iq1Kv+bU0zTO7pNCnhQNGSIlPb6kADLNbzpsfABLvaSP4s2WFDIufwnx
 8mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723530652; x=1724135452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5RjnB2Ejjysk1p3v/3xpGaZLkpRb/wTvNBtiPCwne78=;
 b=ai+g2HrqOEQ//q18YHG3OpA/lC5yjMQhPYJjBV6fCFfHERWa3n68qHMqt5JebzXqPm
 fz/5GmMid8ZYKg2vCpUa9xHR8ITa1u1y3LuLZ90LulXqvk4Po1W8nvU8WtVZ6JftlsVI
 yDh1KlB6VapqMNQBn/ygjOcX9rSq8k2LbeX8aKlOdRZNHjJH0b/t7OHFJieUFAGmXCDU
 t1HaZ/whZDczOfc5Plqz4G2xiZC2hInDKdvAEW6i2tU7yzzixrZccGKJUkkcbh27VMy3
 IB83twsrwbHCouyWgZPAI+h4MeOZ6l2LQ7phNSevQYT7YrzJGs3MjTx+RQcPExXnIDZl
 lNEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpNGnd/LO2rafiOSo1PzYIjBJx2htI8jzedeODgPXOiwjXPdf2sK99r163vnA+FuyC2Fo7RdBs5abaYutkdjzIt9qm1SUGUKq+0NSldBzn
X-Gm-Message-State: AOJu0YyOVs8MFWHBDrGED/ZH4Bl0Lu0eUM4BGT6CNoKuDk365hBF5psW
 NQc3JQ63b2HYfDJJZRbWyr9YNJOFka1vLVXyBeQqdYrXbHYDkRDJ
X-Google-Smtp-Source: AGHT+IGWG6T741zNdayCHhZwDY54mzMFQZL/0A6jqcyQWCSStl0xCaWHAMs617lXXlsj4XM6ZDSe9w==
X-Received: by 2002:a05:6870:4597:b0:264:956e:6207 with SMTP id
 586e51a60fabf-26fcb6b53d7mr3102946fac.27.1723530652220; 
 Mon, 12 Aug 2024 23:30:52 -0700 (PDT)
Received: from distilledx.srmu.edu.in
 ([2401:4900:6325:9539:8b89:ebee:b1a0:5ff9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5874ef7sm4991965b3a.38.2024.08.12.23.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 23:30:51 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 0/2] extend "multi" functions and use them in jdi-fhd-r63452
Date: Tue, 13 Aug 2024 11:59:10 +0530
Message-ID: <20240813062912.467280-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
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

This patch adds mipi_dsi_dcs_set_tear_scanline_multi to the list of multi
functions and uses it with other multi functions in the jdi-fhd-r63452
panel.

This patch uses functions introduced in [1] and must be applied after
it.

[1] https://lore.kernel.org/all/20240806135949.468636-1-tejasvipin76@gmail.com/
---
Changes in v2:
    - Fixed return values
    - Removed extra error messages

v1: https://lore.kernel.org/all/20240810045404.188146-1-tejasvipin76@gmail.com/
---
Tejas Vipin (2):
  drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
  drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped functions

 drivers/gpu/drm/drm_mipi_dsi.c               |  31 ++++
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 150 ++++++-------------
 include/drm/drm_mipi_dsi.h                   |   2 +
 3 files changed, 82 insertions(+), 101 deletions(-)

-- 
2.46.0

