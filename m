Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417B9F1FBD
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 16:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4582410E039;
	Sat, 14 Dec 2024 15:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PWJQEdRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473A410E039
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 15:35:49 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so2848027e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 07:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734190547; x=1734795347; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XLbSax+p06VLE36M3XSjU+HJbZ5A9uKBhZ4K6J4wh4s=;
 b=PWJQEdRqkZi4NjyXnOutEJlRmq+nM4PoL/WWwcFY60+P6amI1oF/z+mgdz5ONqDm1X
 DWncRkYJ0VIw3uTJ8eIMtXNL8ta0mtmViylDPn0oxQBOFSGTA2dTGds3MJsS5UkyrobM
 13QFxF0Nq7d9fRFy09gkm+YREECqDbRpR0eE+994iKxQc/yr2b5ikY6/p23ku9bA2DZW
 Dktwc8G64YzNRdHnx6/fhuZbxut+Upvhs5FCE1mvAXz9oGOtrlObQL+05ITReZc3u5rE
 qkdvNYhVt6pObPZPK3N7f7xjIHoXKKAMXYiU5iUNLsML7SNxcy719lyuZNwEvNuFoSD5
 PmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734190547; x=1734795347;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XLbSax+p06VLE36M3XSjU+HJbZ5A9uKBhZ4K6J4wh4s=;
 b=IQgUq//k9ZXBznaF52BoyLasaCYaHvrDQ8t0jGSO9f0TmasZK1AZ+yhSnOG0Syu0rQ
 k+AE3YfPVONCk3boDyVYtnaVSMfluS9bG5EdfMp0L04JxccmcVqo3lweFtGvybFSq4H+
 H4zGDclzVIaztwSnbWeJLgdwIb0gYtYP3eGDWE1TjxZXt7z6UHb6HRsuS3LBzzqybnlU
 swZWvj2OBkqL+bSmRpNHDuTuxZrLYBJYX3K104CdWSXJZkMHVvymu2GjgX9lbLSJt0pz
 poW7MCunC70XzQx4H2IH7Nh64DOcGP9c3WbsHlvaxeNOGfBpkgtV+WsDmnaiK+iqBji0
 yDOg==
X-Gm-Message-State: AOJu0Yy9K5imF+/OHgVCbJDJQGh5hhUZX9eLUoqZceN2ZM1nCwOm/h5v
 aUuYpAkbChXpY287uha7/jgG2U/c4ZddZdwRYzCJYmb9sQQgjLHPQvazGmhRNVeYwaJ3Xrplz0g
 r
X-Gm-Gg: ASbGncvTxERS2plAFN0b8rxgYSPe2/sxn7CqzPafYpuAioyv+ZRC6CiUJmIEGuZ9t5+
 h8CA559m0Q6zDUOE1uMfEBOBp0M3vz9jWgNqq8X+zj1rDSnHHDn/kUgEaRvV1gcHmYIGpTJiTmz
 I5OLTDamsShgxmG8WyC2jwTrBPKPf1aq54snh55W3MmHEaSFLKCeRPYlTTJWHoGLq6tFRmYHtRk
 QupdxwiTcu7YUrk/ZonqQhHMKwgP4yvIO3JmcS9NxOuzdnD5ff8jIEF5ElH4cKP
X-Google-Smtp-Source: AGHT+IEpdHXgq/AJVIBZFdCRma3KIOfO9gPTKCk88qdhJgKWQyKYuomFP9P2bj2ZCBIJ+C8NUXyj9w==
X-Received: by 2002:a05:6512:68c:b0:53e:3a73:d05a with SMTP id
 2adb3069b0e04-54099b71a9fmr1891769e87.55.1734190547608; 
 Sat, 14 Dec 2024 07:35:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c1357csm249821e87.182.2024.12.14.07.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 07:35:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/nouveau: remove drm_encoder_slave interface
Date: Sat, 14 Dec 2024 17:35:43 +0200
Message-Id: <20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+lXWcC/x3MQQqEMAxG4atI1gZsKAN6lWEWwf6OAWmlxSKId
 7e4/BbvXVSQDYWm7qKMasVSbHB9R/Oq8Q+20EwyiHfiPMd0VOjBiHMKyFw2rWD9hOBFFvU6Umv
 3jMXO9/v93fcDzB/upGcAAAA=
X-Change-ID: 20241214-nouveau-encoder-slave-a6dd422fa4a9
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uSCFLyOzY12sd0P2T5xQn2Moyu/qPWn/YYVBaZf61zk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXaXQuEDw5ySVoU+n5Nw1LD88fntA/Rrb912KI
 o4pUz5SayeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12l0AAKCRCLPIo+Aiko
 1dTwCACID+Vjt7FKREkIANKuhTq731TOGXKSrTAu/XNc9u6SoxQhz1qB1ijxgp+jMjdoV6V0pPR
 hWTa5yjtgL6MEYGQD2V8x4hNUs3JF16HpKPntJuE3tuVVnZV80Lt5+xIaNnKQIchfgL0W19q6Rr
 CmRykLXqJiYPb10gUtXWdJpAEWdnoKU+9X9OnYRPJMPxLklckECxcYN7TNqYuH6o1Q1mgvej2Qi
 qT/OF8QSoZmcF/vLj61gubdL/AqFNLJYF4i/QV+GbDPlEG/2yNy6H9rrumGnQE43oFVrlbr39Yl
 u3DddD6qx0ggLEWxIhgPW3Zvbrm94+vkP5L/LZfH/FpWgkul
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
Dmitry Baryshkov (2):
      drm/nouveau: incorporate I2C TV encoder drivers
      drm/nouveau: vendor in drm_encoder_slave API

 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/i2c/Kconfig                        |  18 ----
 drivers/gpu/drm/i2c/Makefile                       |   6 --
 drivers/gpu/drm/nouveau/Kconfig                    |  20 ++++
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  12 +--
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 +++---
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |   7 +-
 .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 ++++---
 .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  20 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
 .../gpu/drm/nouveau/include}/i2c/ch7006.h          |   0
 .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 108 ++++++++-------------
 .../gpu/drm/nouveau/include}/i2c/sil164.h          |   0
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
 18 files changed, 155 insertions(+), 219 deletions(-)
---
base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

