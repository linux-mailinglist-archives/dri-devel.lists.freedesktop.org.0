Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15954A01C5B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 00:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F94310E53D;
	Sun,  5 Jan 2025 23:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VCyKt7+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F1810E53D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 23:01:21 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso14287159e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 15:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736118019; x=1736722819; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WCrt8tmPhl/PazcPZULV+mOJhKFlUUnTodJCBeRZ3LU=;
 b=VCyKt7+DVp+IOEWJNTvl2HwRzHktTOzuMSJlMXJ2jvbXo9ow9ekS5KtCGyB+6ZNicI
 /dhTfQV7/xEI2xugJ1pfzxr6JCYlK5Jz5RTsHXlw8hhe6a7R2KEfjTW1Hzm7FI4LkDqq
 Tb6EAmOp+v/tZJ3pYyoOEy6h9Zqr15lMN9nCT0/daZfIH4SKeAu7CT/DGx2ZFalyr3p6
 98lMoFGx92RIN1uJAkdcY3nCnOQLIfTDDtvxG6Hs8vuIUzvXwhjiU6W5pMpk60R4kjFA
 8Ocn4W1YV5cqOhLAl6bKlnmWaUnrAgcdO7ky2bBoO/tBcnIZ2Q6kAY1Ppo1vVj4WBD/N
 ezug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736118019; x=1736722819;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WCrt8tmPhl/PazcPZULV+mOJhKFlUUnTodJCBeRZ3LU=;
 b=kJpJCx6028wVS9bT+4LiAHW/U655Rw+LRgmuFJ+SWC5hmf82W+5yHYaPSFIDaqSzBH
 IAMGiMmH0vhRxH/7/YrH39ZRcZR/nB+XxMKyDw9nT54OtoY1J38V1Cbt/f3pzH+jjvve
 qa45/WVzk7Ulhks198hspbq4d5zMjybehsivBGy8xtcNzs/rD9aWDX+ibH4I5IIjrART
 5ZG5PrfC1Od3DSzxg4kxWF9/uLPfOTBrPFldaY9g2TYikq+Y6c/rQ7Rv8AY/aizrWG8E
 8Nh8emDwRazm55GhcHbSpAFkbNPph3naurDpaGkZPs3uJYnWR7m2Be53ITl8iZH3s75g
 Bpeg==
X-Gm-Message-State: AOJu0Yz/VnpvkKXgcJc+OT4Mzj0tgz4mDXaaM+V9C2p9e4OLByEKfR7A
 Vx7VxTytYQ95nORHd8fyp1LKtENyLgD2Z6pmdvJPUkiSoHi/3YJNAME3HCeVbWM=
X-Gm-Gg: ASbGncv/RcfV5RgD5CyieuR0UzeaLAMvONux8dWZ2zb62u/niA32p8E8AAV9E/Wy3Eb
 zz2NFXfX0+NBPs1DXN6p1jA/+nYY8Y8d5INiNCO5j8aWcSZf9wavxJf1koF7SDq+/Dxh8SfZd1q
 64SuMrzMhy5RpF5yrIfA96udf8lgoYTYIYT5LEuW5Rti9R107eLU6S9LmRU7kEOvN1ZVu8nWIwH
 RhOcuLdgSRoK249O2VuYb+ZvXCpxgOftjKkoKbRiZcykDmwiEqOM5HpJTqOfy0F
X-Google-Smtp-Source: AGHT+IEa9s4RHPghxGMaSlBDMdhWj+kIQ+tWX+hXXbf8XL3JqgaWtSiYuSXqPjuyp6pc6VeEB8MVYg==
X-Received: by 2002:a05:6512:1316:b0:540:2fe6:6a3a with SMTP id
 2adb3069b0e04-54229586bf8mr17486044e87.57.1736118019321; 
 Sun, 05 Jan 2025 15:00:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223821583sm4614034e87.203.2025.01.05.15.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 15:00:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/2] drm/nouveau: remove drm_encoder_slave interface
Date: Mon, 06 Jan 2025 01:00:12 +0200
Message-Id: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwOe2cC/4XNQQ6CMBCF4auQrq2hQ6XqynsYFyMdoAlpyVQaD
 eHuFla6MC7/l8w3s4jEjqI4F7NgSi664HNUu0I0PfqOpLO5BZSgFSgtfZgS4STJN8ESyzhgIom
 1tRqgRY0nkW9HptY9N/d6y927+Aj82t4kta7/xKRkKe9k0dRGG6DqMjiPHPaBO7GSCT6Zwy8GM
 kOtwZLqowENX8yyLG9bTawVAgEAAA==
X-Change-ID: 20241214-nouveau-encoder-slave-a6dd422fa4a9
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aOcldVdbqjILyVtpyvco3ISK3lAxKklS6+rIV9e5yIM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnew8A6i1DrQa3drg11bpFI5xDxBHFm2GJFs6S8
 4LEOv7hVdWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3sPAAAKCRCLPIo+Aiko
 1UIUB/9gJhRB28XgXdRmeE1FB7beSSIMy3GgOg2qDAkyBrtFcV8QtLJfFosMb5r3bk4zKMUcwWj
 NNpQVR+JzaOle1FJg+G5WrPzP/j0EYZdKmQ9aDkJnJjqaBnj3muYy33eNqeawoG1VlvsX0ucJrU
 SI9052sa64qB6yhuN8yF19vWRPmh7p0s+t/mN4yoWxwwm8bXg+iY3UKqR+L7Pl8Nu9Eq0IGVsck
 c6pGxP+2aOXgbojo3ZeE3lNQ3k6/06d0dJiRR4RkNhKR7b0aw4HsusGa1AU26bEGD/qWJoe2FkT
 O642Cc2V+xCLZ5nurz5Hn945TdhBkUfuIz5bpLqjta+4a5Qe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The nouveau driver is the only user of the drm_encoder_slave interface.
Demote it from KMS helpers module to the nouveau driver itself, moving
corresponding I2C encoders to be handled by nouveau driver too.

Ideally those two drivers should be converted to the drm_bridge
interface, but it's unclear if it's worth spending time on that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Moved includes to drivers/gpu/drm/nouveau/include/dispnv04/i2c/
  (Danilo)
- Trimmed Kconfig entries to remove mentions of "some nVidia cards"
  (Danilo)
- Fixed checkpatch issues related to alignment and code formatting
  (Danilo)
- Link to v2: https://lore.kernel.org/r/20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org

Changes in v2:
- Renamed symbols in defconfig (Laurent)
- Added missing Kbuild file (Laurent, LKP)
- Renamed guarding defines in include files.
- Dropped mentions of two removed functions.
- Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org

---
Dmitry Baryshkov (2):
      drm/nouveau: incorporate I2C TV encoder drivers
      drm/nouveau: vendor in drm_encoder_slave API

 arch/arm/configs/multi_v7_defconfig                |   4 +-
 arch/parisc/configs/generic-32bit_defconfig        |   4 +-
 arch/parisc/configs/generic-64bit_defconfig        |   4 +-
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/i2c/Kconfig                        |  18 ---
 drivers/gpu/drm/i2c/Makefile                       |   6 -
 drivers/gpu/drm/nouveau/Kconfig                    |  18 +++
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  17 +--
 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 ++---
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 +-
 .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 +++---
 .../dispnv04/nouveau_i2c_encoder.c}                |  95 +++++-----------
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  24 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
 .../gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h |   4 +-
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 121 +++++++++------------
 .../gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  10 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
 22 files changed, 190 insertions(+), 247 deletions(-)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

