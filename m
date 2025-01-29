Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8929A21B82
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A7B10E7A0;
	Wed, 29 Jan 2025 11:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hHW2zEpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056CA10E7AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so47146375e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148465; x=1738753265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mKQmn//IE9ck0+6IUP/lOyaVpLnb4kfQKhmo5wjSgao=;
 b=hHW2zEpWzaX0gsJoJty73ESv5844oYhAYEikKCrWLEb3yJow7VSmeeIu6rUOl5R7QU
 dY/ugUqbyFNL2JsMU/JlValiJcAj9XOXyPJzkCj4q7m/e5DV58y2F9rYF0YyG33Jsyzf
 jmGDhffLuOEIeJVO8LtsXtQnUrYfvPw1vAWF5uAiOP+ZES+7wF+Nm3NdPmkFQ+JQJ7N/
 abfZSttwytmx7lFc0gVYRduqYzbBfKfQ887t5DtDd3NyWOS2kvhDUdmjA71HcY7eWvDu
 5uP0/ncuqWzfH4rfxB3H92Vt0nMn6wTQqJTtLsFv7QONYzrPE3JSdqq2bCUoKoANEZpZ
 vXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148465; x=1738753265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mKQmn//IE9ck0+6IUP/lOyaVpLnb4kfQKhmo5wjSgao=;
 b=advD+eG4eQza2wDG48Tp5PqMz8mmkzPTa/3Nhfowu8Iz0MgnCCo8p6M/XdpnUNIR29
 QR48gE6pFa/iQl7A/qQ7huauBaMkqF/cA1I8AAuUmpYvT+K+4GSfqm2yDFAr7rwqUnDe
 5T/Wyw+KDvE39j+m2w6SMvK5VXPBnhayksx1ty8GPpym92FcvzJLOiPG6F/ysVYjPZWo
 EFmvZugdMWKvM4i7l7CHuHz77IWSHZG61X31/AVykBaJVLc5JqThAoGj8aSWirIF2/z0
 prbiAVh+3DtcR/Gm4F/Sgz60nxXWpzTR+v+mllWyey1HBzszG3S0Q77d+YNXh2Z2aDsx
 a6QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpXKDNNFPWQryY+sYewSRd6y7iepTxpAR6zSMau6maAb2znOB/PblBnEjsrpJoNWUAnsLocpDsyPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWwr8PSUjvwmCglEjEP/m30CaF7WTjxm6ZVUbxMO6QsJ3U8DRx
 ICOSQwFIVsEkxoVeTLwltKS028Vdqy6JoMfsz2/j8ulk/9LeaHC7
X-Gm-Gg: ASbGncsvw/wY7xT7qJPJ9arroMwLb5KW5Sg8iFZQlChrZRlQUa0+MYhkZTeVMNC6GBm
 dHfVpVXDDUQwfOB/G3RTGSNHrdnqxj11z04hVP5ZZEdvjBhoggu7ZGUJqCMMtIhmP8GPIMNUOwn
 ueMwdTL4xn6P1qaJo8WxnEN5sSMqc42wHhtmDQu4BrxMN026MFpSPk+mT7GtTwdbShxRAGGGItO
 9Q9wHDWi9ZyJ40BvLtEjkDRnsozfREO00Xp8tvrsEA+4dua8nhDQRk7efrUpeHrcEDWOGwZxdFO
 lAS8t2PU4+DV0c7X
X-Google-Smtp-Source: AGHT+IEqUnl4tIS7KEUNZG9Biawe59gWB8PYXlD0420vcx3XG6PZ/wm4j0QwgV4se6GzFs9zyJCn0g==
X-Received: by 2002:a05:6000:1863:b0:38a:624b:d55e with SMTP id
 ffacd0b85a97d-38c5209399dmr2430182f8f.41.1738148465116; 
 Wed, 29 Jan 2025 03:01:05 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:04 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 00/13] drm/vkms: Allow to configure device
Date: Wed, 29 Jan 2025 12:00:46 +0100
Message-ID: <20250129110059.12199-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
is required.
This series adds the required APIs to create a configuration, the code changes
required to apply it and KUnit test validating the changes.

Louis Chauvet and I are working on ConfigFS support. In this series I tried to
merge his changes [1] with mine [2].
I kept his Signed-off-by to reflect that, even if I show up as the author of
some/most of the patches, this was a joint effort.

I'm still polishing the ConfigFS code [3] and its IGT tests [4] (connector
hot-add/remove bugs) but the IGT tests also exercise this series and can be used
for additional test coverage.

Best wishes,
José Expósito

[1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
[2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
[3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
[4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs

José Expósito (12):
  drm/vkms: Extract vkms_connector header
  drm/vkms: Add KUnit test scaffolding
  drm/vkms: Extract vkms_config header
  drm/vkms: Move default_config creation to its own function
  drm/vkms: Set device name from vkms_config
  drm/vkms: Allow to configure multiple planes
  drm/vkms: Allow to configure multiple CRTCs
  drm/vkms: Allow to attach planes and CRTCs
  drm/vkms: Allow to configure multiple encoders
  drm/vkms: Allow to attach encoders and CRTCs
  drm/vkms: Allow to configure multiple connectors
  drm/vkms: Allow to attach connectors and encoders

Louis Chauvet (1):
  drm/vkms: Add a validation function for VKMS configuration

 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 782 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 784 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 479 +++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
 drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  45 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  17 +-
 drivers/gpu/drm/vkms/vkms_output.c            | 255 ++++--
 12 files changed, 2337 insertions(+), 139 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

-- 
2.48.1

