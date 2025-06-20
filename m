Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51487AE268E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 01:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B170410E252;
	Fri, 20 Jun 2025 23:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ExK1KFjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5315410E23F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 23:51:07 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-748d982e92cso1563691b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 16:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750463467; x=1751068267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=waNy4ez4bEWiFAi20kf5V6Z5gKcc9dgtrDoRnH3Tvks=;
 b=ExK1KFjYqAoEOmWa3CpklfV6E/Twz02Mk1JFB+RkqVZJhl+Z98kYumG0z/DwmzBVBk
 sOTO4UVBt9PAJjiL3VqOG6zrB9B+Z+/gxwLvGxpduMyZ7kSB7WZWBtumAI5wdsU+9645
 9Jgv5G+KJlrcQ7UtSrvB5/3VP5JHDfRdfM8J3AsrTOm2Qyu5c8OI8UK3Ys6cHr1ELN9p
 QxoGuZAOLbfonRGy8Jc++UHimb34ztyMGIEMhIlTjwDcbEb5Lid+VWAJpkpCGgR3DmoG
 6SbjaWCBVUGNYIQ8FfyNHXtgNVb+xc4NSveaz7+AzzNNGhRIUlmLaamIitRyrx+lv+8D
 PXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750463467; x=1751068267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=waNy4ez4bEWiFAi20kf5V6Z5gKcc9dgtrDoRnH3Tvks=;
 b=W25HX58NZsf585vhGFdv4E1YWiawIJvWVaUg66YANtqveUDn/aVkNbJ1Hrk8XzEZ+b
 wmxcece5O5Ul0PV/XZak6f17lbjOtxxwbc2UtQgF0J1UQ5aY9oJN7V7GUKGzr8R8i/EN
 Pvn3pUOJlsMX5eZf5LsNBWrmcS3ez23k3U6Pp5BUnS6P9dodtW7YqDVC0ftr9NUfr3wo
 MrVL/oLdQxL5ep5LjbpUs5AXtN4G8ge5EmRO5C27kUagnZIqKASK7incjFX/gbht/Jhv
 GyQO/rzltISkdche0sjt0fKiS98yytcFVnPdvNgH+kRliNNb0TPwQ/MZSBoyBDSFEge6
 8esA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdVFqYZ6ES6a0ZFIDRnxx+xdxoAZ9ouEj1Pje/ncxLDzSx8CkMeEs1L6M0B2MhYdvF7S3fuOUKSx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHt3X0j6gj7mEkxQe5Ihhj+cGnDPlR8tAHg0akw/6FqVdSRVBX
 0LkujQOAXu4MROma/VdbFgjVvViIGyvcJ3FoVrgWutRg+km0B0DBMYZQ
X-Gm-Gg: ASbGncvWKTWSnNt1xVdndsS4asSysXD1UVpVI7FgVvNqFqWnBYJ1oQZU9GvpQhwIV/D
 FkxJaDAS0fUZLnJvvY8SF38o/c2O9O7CTmrScLjCsJt7XQVck+l62aAXB5L2S481bNQS40RxkkN
 +xFegLI+BrAS6jV4m9lkTd8g+aDnE4FhKsd9RO8dMZDbQIpfZjnaZoWp+FZMaWewS/HbmZQqpsY
 LKWptSGsL/H0YFNFWY9w1u9mTftnnynXUQGa2Z+hz0JW/zbUao17VgXluVFy61A10+oiNCUCAXV
 nhSA3yMffU+hQer28SO0IJc2B/ywvmKse/dKufAcrbvvpiiVM/x7nVEJ8vYmkC1cOKK+hNf6rOn
 TOZ5zHgD6tsFOCoAP9HuX
X-Google-Smtp-Source: AGHT+IGXhlS4EuNUY1DCvllWMfs8pL3PnyMNQSQDD+Igpi3bZ08W8gV4hTscMjZcqVGIThQOQyrTXA==
X-Received: by 2002:a05:6a21:44ca:b0:21f:751a:dd41 with SMTP id
 adf61e73a8af0-22026e2a41emr8617432637.40.1750463466892; 
 Fri, 20 Jun 2025 16:51:06 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b31f125837bsm2146049a12.56.2025.06.20.16.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 16:51:06 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] panthor: print task pid and comm on gpu errors
Date: Fri, 20 Jun 2025 16:50:49 -0700
Message-ID: <20250620235053.164614-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
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

This series saves task pid and comm in panthor_file, ensures panthor_group can
access panthor_file, and prints task pid and comm on gpu errors.

Chia-I Wu (4):
  panthor: set owner field for driver fops
  panthor: save panthor_file in panthor_group
  panthor: save task pid and comm in panthor_file
  panthor: dump task pid and comm on gpu errors

 drivers/gpu/drm/panthor/panthor_device.h | 22 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 38 ++++++++++++++++--------
 drivers/gpu/drm/panthor/panthor_mmu.c    |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c  | 31 +++++++++++++++----
 4 files changed, 75 insertions(+), 17 deletions(-)

-- 
2.50.0.714.g196bf9f422-goog

