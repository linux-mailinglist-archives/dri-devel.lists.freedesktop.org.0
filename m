Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CE21301FD
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520636E400;
	Sat,  4 Jan 2020 11:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F806E0D6;
 Thu,  2 Jan 2020 12:25:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b8so38946265edx.7;
 Thu, 02 Jan 2020 04:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eUosEFFlJyLBkAJpLLG/P0dLyLKtDq9JJJqWv/Cqz00=;
 b=KvAG1IFheFrL0NNtMXcIDAvp8B0JnHpjsdMNwbFV4aTEp8RNLxg+mVACDfOzRHQJ39
 sX2cEVdxpM5VSUV5m31w1x/1n5c9+0EAK512W38+b/Z1dJ8VK/vDRZfputyyj9AZnpAu
 qYcrgfEl7Q1RcPdpcBqLRO6fN5gqrczkSe2nlIkbUb+jIW3l9+puc+42k7CyrSBCmd52
 GpLJO1Ye2EZLw5F3qcBd+EBYY545dRuYRdNptY5pNhzRTYqjX2IYyfhbarLyNuQx8L0d
 sJx4j3DqsI2Eb/kJ+Pm6FP0TkiqZ7NP4KQ8CiG7W5zx41r6Ybe1Xo3eyeYRuOZvlX4Rf
 SCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eUosEFFlJyLBkAJpLLG/P0dLyLKtDq9JJJqWv/Cqz00=;
 b=ndvTwr7mKPdcIPdjvRUPm/x4KEGL6u4teSL/lX6B6Fd7uJZl9+1lelsqQN5q+EZihr
 TxRGDkX5LZP6kuVsksfo1FqvJYDwl61BcEhuLGYvs++v42ziH/iuanQ4YqZjDI4ATsSu
 qckoHAL6MzwRBPWe2xPj7bzA0iYZP+2jSsQilgRY1Pep8fj6Rf20gB6ee4ybPHa6uH2f
 DXeLMOXtRrhNm6cTA1HkO/fv6+flWg/eWpQMhz0G4Swx/aT/4/4p1pNE0M2/p1op/dH5
 CuQ3fdsON+vIRwgCWyjZsfCUNVNX4RXZS1RVTHrhp/yoCSvA9FEk8npC6mLpbdj99Unr
 hWqw==
X-Gm-Message-State: APjAAAXh9LbZLTEacE0uHIEYbQBqoL78rjDYpJBc5KNeOt+LI2c3YbRI
 2H0+pWlo+f2lLBlvVQI/l/U=
X-Google-Smtp-Source: APXvYqxc5WtVvFE6pNt3gQRWOzXi/QaCmmXaQ7fiEcxhre+2N+8m3hoHMN/Hezubib4TZ3OXBJDK+A==
X-Received: by 2002:a17:906:3084:: with SMTP id
 4mr82604101ejv.140.1577967953633; 
 Thu, 02 Jan 2020 04:25:53 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id x3sm6839509edr.72.2020.01.02.04.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 04:25:53 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2] drm/nouveau: declare constants as unsigned long long.
Date: Thu,  2 Jan 2020 15:25:48 +0300
Message-Id: <20200102122548.25696-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explicitly declare constants as unsigned long long to address the
following sparse warnings:
warning: constant is so big it is long

v2: convert to unsigned long long for compatibility with 32-bit
architectures.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
Suggested by: lia Mirkin <imirkin@alum.mit.edu>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
index ac87a3b6b7c9..ba43fe158b22 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
@@ -655,7 +655,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
 
 static const struct nvkm_ram_func
 gf100_ram = {
-	.upper = 0x0200000000,
+	.upper = 0x0200000000ULL,
 	.probe_fbp = gf100_ram_probe_fbp,
 	.probe_fbp_amount = gf100_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
index 70a06e3cd55a..d97fa43efb91 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
@@ -43,7 +43,7 @@ gf108_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
 
 static const struct nvkm_ram_func
 gf108_ram = {
-	.upper = 0x0200000000,
+	.upper = 0x0200000000ULL,
 	.probe_fbp = gf100_ram_probe_fbp,
 	.probe_fbp_amount = gf108_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
index 456aed1f2a02..d350d92852d2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
@@ -1698,7 +1698,7 @@ gk104_ram_new_(const struct nvkm_ram_func *func, struct nvkm_fb *fb,
 
 static const struct nvkm_ram_func
 gk104_ram = {
-	.upper = 0x0200000000,
+	.upper = 0x0200000000ULL,
 	.probe_fbp = gf100_ram_probe_fbp,
 	.probe_fbp_amount = gf108_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
index 27c68e3f9772..be91da854dca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
@@ -33,7 +33,7 @@ gm107_ram_probe_fbp(const struct nvkm_ram_func *func,
 
 static const struct nvkm_ram_func
 gm107_ram = {
-	.upper = 0x1000000000,
+	.upper = 0x1000000000ULL,
 	.probe_fbp = gm107_ram_probe_fbp,
 	.probe_fbp_amount = gf108_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
index 6b0cac1fe7b4..8f91ea91ee25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
@@ -48,7 +48,7 @@ gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
 
 static const struct nvkm_ram_func
 gm200_ram = {
-	.upper = 0x1000000000,
+	.upper = 0x1000000000ULL,
 	.probe_fbp = gm107_ram_probe_fbp,
 	.probe_fbp_amount = gm200_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
index adb62a6beb63..378f6fb70990 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
@@ -79,7 +79,7 @@ gp100_ram_probe_fbpa(struct nvkm_device *device, int fbpa)
 
 static const struct nvkm_ram_func
 gp100_ram = {
-	.upper = 0x1000000000,
+	.upper = 0x1000000000ULL,
 	.probe_fbp = gm107_ram_probe_fbp,
 	.probe_fbp_amount = gm200_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gp100_ram_probe_fbpa,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
