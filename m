Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C12A4587A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA1E10E88A;
	Wed, 26 Feb 2025 08:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S6PcKiT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D5410E889
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:35:50 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3091fecb637so52570971fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740558949; x=1741163749; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bW1fZDIVdFn95WDQdT8nnBozEwJn/hwsIeBOhLkuZbM=;
 b=S6PcKiT/ihlCyNsy4Ku3CqCrDAKf4/AtZvCx3yciiRK6AUHewhVbys4xDg9xW9iPmm
 DTj2kIYJobDcoW5NuB1KvfvZ3MDaFHbsa041IPCzi5wu6AULh0F6ANFQR+uI8qcJEZLz
 y44f+e1PsOyWKoqTTfl05ezCoUoZQtC318o8aw7Zjvrjl17yVbcmxeCRo3WsH+QFlUzo
 2964FUXe/wyi62i99gwxELv1SmiYjfeGcVMHGlp+z5PKNfMe+zVchbGZnvEKhJLVZICL
 zXnFHMPeXNEldAXivxNMoRO451ZvPpo949DDsj9WKNAdvvLCidj1DvQWwYB8iDJWcIi0
 6m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740558949; x=1741163749;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bW1fZDIVdFn95WDQdT8nnBozEwJn/hwsIeBOhLkuZbM=;
 b=OsopzR1z/MkUqxf1U/OoYKU/WvmEWsVZur11L2aWlQicVZK6zuXUyLL8S0mt+xc03k
 Ujxciw/2+FrwLAnDATkI/APppz501UDMXnBiQjT2yEulV64Ix5x69keCAKN1mvdgT8xL
 UeJbbLwqvLiWlbY9edZnKZ4TaJr16NfNMkobC22ke7rkF3GiZHjboxjibvqFH7yMhMKl
 Zg9eo1E5HB0iwBF0Un0qNmwvwsDsbmIhTSce7EhQ7UVt1fSE1VLshRqLyY61XU3MjGzr
 LtFPWy+z2TtULroT/xS8Yt1dw7v9/sHwJEMkORsjweN5ji+NOxmmddVWP1n5hgQUIEsh
 LCgA==
X-Gm-Message-State: AOJu0YwEzC6V/NJD1eHBlFZh8Ah5NtnW+l1zdUNoewMEM8+MgOEJ7cch
 gE25mw4ErWEwc8Rggqwtxkp9FqqkMsXBgTwswloGKdSkHFKuH3urORFuTpMWgcE=
X-Gm-Gg: ASbGncuqLc50wBSYH8epHT3Qb/DqFO0/ZgzZRo6oQsiieK3TC0VOq3y/dPccjHuC2W1
 nVo5Kxsff+y6ugdwB4UDH7C02JuGhuQ+2UrBf0q/rdGFtovD/cZC4988tV53W2aMeKtgZLCXjoQ
 tvB4PVE0I3NnVZlWDL0N4vNqzYrs9CKSR+34soAIsrMpSodOWl0pC6g5wv9l3+GTMZ1HQCjKgN/
 9r5BVNT0pU4H/GeN3enNsDodlCidzRVy/iuvzwQqZoJpzpCNK+0hlvJ08ysTMIcDC2QEt2sXADZ
 w9FAfwtnrprkBtqMavelRLgP4c43NWK/9A==
X-Google-Smtp-Source: AGHT+IFilW2vYILEBAZQ6VX4V6rTlc6qIxQwn+zrj7FCNmekcqLsTBXZ0G5XrZfa+NCP0HoIcj/A7A==
X-Received: by 2002:a2e:9013:0:b0:308:e54d:6196 with SMTP id
 38308e7fff4ca-30a80c7c5bfmr35663041fa.31.1740558949099; 
 Wed, 26 Feb 2025 00:35:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819ebe44sm4532701fa.30.2025.02.26.00.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:35:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:35:45 +0200
Subject: [PATCH] drm/ci: extend python-artifacts timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-ci-python-timeout-v1-1-0a9092a3d6fb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGDSvmcC/x3MPQqAMAxA4atIZgMasP5cRRxKjZrBVtoqSvHuF
 sdveC9BYC8cYCgSeL4kiLMZdVmA2bRdGWXOBqqoqYgUGsHjiZuzGGVnd0Zsa9XOZKjvGg25Ozw
 vcv/PcXrfD2ZEfV1jAAAA
X-Change-ID: 20250226-ci-python-timeout-7167d2c2985a
To: Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=878;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8jC8GE4iiOuzSa2Zvx7LLBQ5XuHRNjDZasqAxsEZL7o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtJidks9NJNkSDHsJ3unFLdRLFWtCnNUFyzS5
 OBgONf2hFuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77SYgAKCRCLPIo+Aiko
 1dvrB/97AeYZX9Nm5BzkOiwf17Vo06dYUYXJx23U8aDBkskFD+/haGrGlvV0p/skwktkD/XlA2B
 vapgCO4I7Ch9KxBHLNFGO6p5sZJEaWjE9k+rHzlkGJMVV+SlB1n/eANuEZ55MQ9SjWQFf6gGWQG
 4tOgzOPxbi6br5HQbSKIw8uuBJ3Jnrvm7/lAPr3zydjzjZ1xTUpySKO7m27Kwvrjk/bJITL43hT
 0/jRarKxpWKsaO610qwBdo75oSscNgwR/WKUjspURYnQp/jN0e7iL3yIupkwqCo5c/UVz2qwDkA
 eb57SZeHwk/gZ+eFwEW4AhlQctWtKMB7eArR8cRRT3oH/3Zi
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

The job has a timeout of 10 minutes, which causes a build failures as it
is even unable to clone the repo within the specified limits. Extend
the job's timeout to 1 hour.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/build.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 274f118533a7a1a0a4b8a768298fec624bfe67c2..e8d466c319275724687b8581c086b5ab352c3cd1 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -210,3 +210,6 @@ windows-msvc:
 yaml-toml-shell-py-test:
   rules:
     - when: never
+
+python-artifacts:
+  timeout: 1h

---
base-commit: 130377304ed09e54ff35a8974372498aad7059f3
change-id: 20250226-ci-python-timeout-7167d2c2985a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

