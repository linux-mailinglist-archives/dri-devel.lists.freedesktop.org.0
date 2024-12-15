Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22F9F2343
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 12:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF48510E0DF;
	Sun, 15 Dec 2024 11:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xnbx8hqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBEB10E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 11:09:12 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso26424191fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 03:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734260951; x=1734865751; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SeDB0ItL8Yj1in2LC0z38zcNuwMyG0rmvT7gINHSHaM=;
 b=xnbx8hqOTilSsGLqMtf/XneXtht3udppqcEQcQRFKLHq/MOnqGYKBDGB+mLTuv2rFZ
 0fclYtM1IGVg8Ma8PH9Ah7x5HljtdzTNEANTGJNt5fCYP2d4I5pBqVSjh/fe+vc1miPK
 gR1gzk3zc3fgRXLiG/unz7aJbTu5o2TzddzInWEnioJWmq+dEy53qtd12pfIv2nUcw4F
 1zbzBbZEwDjipKpyR4b5nQvPGseJMgcVE5TIpv8pKbkxvHj6Jxv/MLNh60iuqJpIQQtP
 HLJ3zjkLOf9WSzyYB1+MvNntzMMq9WRT0DpnaqPMLDIgpWHsVf4TeYaPGRCS0Ars+zK6
 jvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734260951; x=1734865751;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SeDB0ItL8Yj1in2LC0z38zcNuwMyG0rmvT7gINHSHaM=;
 b=HYVkVAhc1Ebqin5J1t/ulAzhSEu7e8fGpvBU6dZ0WkKVk9H9YzJOkzJiajxxugFoKs
 peWLemjoqDxWbp8OD3rmZnIq+wIycpKpBX+23itaehF2y/SIZa3fUG/5+No+Bgje4AC1
 +YeevBtjqWECpF7KGlDvJYiOLsbbkF3tXSFPFag1rT/Aa/ajljTrl/jnqfJt3EWBR8fc
 ZrR1yUt++ocsyjS5vJVknxAKp8UY+p46R+nUhJhnmQ009IV9OlTwp3F59mMw8lOY0rpM
 9vIvutN8uGefsK+s5WvSXbxMrxUV0K162X+2AkdfhfK8bBLqIzK1k5faqwNV1CK3tvZw
 J9mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaZucwx0y65Jf+NPEMUe88sUBjsopKKQf06u0NGje66vcpQ7GYbJDZOcGYAmsG91U+eIMYhvorZZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4la8enSWdCk9x0W2WNFsXv2tXDln5dlXT59vfSnSfDOtzslGS
 mDjc30qfHEVAQCzt6vikd8irTTyuWyNjkI+16dS4PeaJvg4GzXg0Qt5li+myfnY=
X-Gm-Gg: ASbGnctMvtSkllGYEApFS2giHv+0/5g25/HvhQTBBPP6PzDBXBOygAGPE8wDYAewiLN
 ERaP1j8Drq3MEofGXp1gNOJf8ZnW7aJPgFJ31OmWkXJFLlpNDJ1FAwhVEqqneydmLUyohno5pLc
 0EWAY5d33mNOb2AZC9JyPai1aAax60J27QLrVCJrUgB/dJJtTHNLZeGYACKcnP3/BnztifTrA7a
 gUJiS0u9tbUZLW/2LMhJLQb051rVpeMM5AuotcWf6w6q7Nk+1RSoNHx6455Dfl1
X-Google-Smtp-Source: AGHT+IFLEfifCi6JDj/iZZTfcHQ+beHkrYhPMHVDqBtnumKKiOVDWta5zivt5uy/eOb4EPqSH5TH9g==
X-Received: by 2002:a05:651c:2115:b0:302:1cdd:73c2 with SMTP id
 38308e7fff4ca-302544617femr28249631fa.20.1734260951044; 
 Sun, 15 Dec 2024 03:09:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034404544csm5261531fa.29.2024.12.15.03.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 03:09:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Date: Sun, 15 Dec 2024 13:09:06 +0200
Message-Id: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANK4XmcC/x2MuwqAMAwAf0UyG7C1g/or4lBt1Aw+SKUUiv9uc
 DyOuwKRhCnCUBUQShz5OhVMXcGy+3Mj5KAMtrHOWOMwyIHHlQif4Pu+y9its2vVtC5Y0OwWWjn
 /y3F63w9f8XCSYgAAAA==
X-Change-ID: 20241214-drm-move-tda998x-8fb4321434d2
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7HHYNzqMQmgM/ow/NBf1mF2AenbPAy2tDdDG3io4Ctg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXrjUQBk298BZioDGsi03uy8bXYS2NvCInj35D
 2Lsa9K14r+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1641AAKCRCLPIo+Aiko
 1edXB/4pEQFtE5TmJ5hjKpoufomXtkzeuUWXe6tzTjCSPRWpJ2k9hifl1ocXtdxMdq8slE3ZMtD
 azSMdiRmwvQxv/5kvBqEqHPB1wbSQZgGh8OZ9dUudOyx2hw67P37P7f/0LjRtbzqpGLeBGiY8Mi
 6pD+MKbBj7nDu69sz/1NJ+bHtZ93g3YQYaTOZ7oVjNC6gtjy8PSnT+G/ySS3fvnNNowOdy7VKem
 e+5YWtjKyTtEXYWGAFZZiWQH+ZZhNXczbpbAWfQ4JxqKXAu6Y4XPBrjW41MOYLBNXl/5gzXDqge
 suOVxzwLFaG7yaXJLv/YvTM8h7wHXEu9VB13vITknkmQk0He
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

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
on-die on the TDA9989 and TDA19989 chips.

Move both drivers to live next to all DRM bridge drivers, under
drivers/gpu/drm/bridge/tda/. If we ever get a separate subdir for CEC
drivers, then TDA9950 driver can be moved to that dir.

Note to RMK: I didn't change that, but I'd like to propose to use
drm-misc tree for this bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/i2c: tda998x: drop support for platform_data
      drm/i2c: move TDA drivers under drivers/gpu/drm/bridge

 MAINTAINERS                                       |  3 +-
 drivers/gpu/drm/arm/Kconfig                       |  1 +
 drivers/gpu/drm/bridge/Kconfig                    |  2 +
 drivers/gpu/drm/bridge/Makefile                   |  1 +
 drivers/gpu/drm/bridge/tda/Kconfig                | 13 ++++++
 drivers/gpu/drm/bridge/tda/Makefile               |  4 ++
 drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
 drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c | 49 ++---------------------
 drivers/gpu/drm/i2c/Kconfig                       | 13 ------
 drivers/gpu/drm/i2c/Makefile                      |  4 --
 include/drm/i2c/tda998x.h                         | 40 ------------------
 11 files changed, 26 insertions(+), 104 deletions(-)
---
base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
change-id: 20241214-drm-move-tda998x-8fb4321434d2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

