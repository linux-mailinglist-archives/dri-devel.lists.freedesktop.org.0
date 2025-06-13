Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C2AD8C18
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E8A10E1F6;
	Fri, 13 Jun 2025 12:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YCsrnp6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF05410E1F6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:28:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1783882f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749817730; x=1750422530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3SdZ/GxfWV/W/p+CZLyOj0V8DqNHminUrDVPHxaO0zY=;
 b=YCsrnp6Qm0DnETxyDwN7Dp1HKrKDsv6+3TL/sUbggzYNgNQBF51ofcvSU21qZDxItV
 ps4StqeDVGiMoKzr10bnCrrOHLUvxghpdTLqlkVWxDlUu/r8wqnL0kzjufLgvxl0Qnt0
 Wf6wUKYk8gelGl0xmG8c8WBj0XuYwjopzNG3OF2j5esJLLe/DD3ctoCER2/PXUNUOFYC
 XbG4AjaMg58qiu4ZM3nrN0RINfioqq6qeuNRd2uM7+7GSS9G8xVJf5dUkBx0F8IW008L
 6BgNePEixCS/P+X24HpByF8HnPw8q2/DmC8FmcLcajQw08i3f7XLzO1Piu4nBUUrRRM9
 rGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749817730; x=1750422530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3SdZ/GxfWV/W/p+CZLyOj0V8DqNHminUrDVPHxaO0zY=;
 b=KSaoyRZ0ioquxOMiyJHIwUFbm70nOzvQE0IpH+9nmdScFqOt0s83prC15IWo/MTRcx
 KjGGa1a0eitPagR8/yZFPdaoAb3QNkGUwvANGicndft4QtgF/GL1QQ6llJ/tLi1VNOjj
 Zw2KQscBgbcf18dWFJGR7wrOocf+Hk36XTgQpP5up7KWQU0Qpjldn44fC12zso5DyOM1
 TpVYbGdVHvCZ3SAVyyMfjFT8pIzURfB3hdelZv7T0H6/Tb3CTX6CkF9Y/tbqZvJT1Je5
 3Zx/UB7UqQb8wewpoGY4QHnc/q0WFMtpUhYmKmj614B5NWU3rLJFe1mVYafBIOCrS1DY
 R8xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC+yp2LDMpKQDlp2aUjNH56do6f9XkfB2iN7XslVnp+bIfKy/09nDiURS3sKRR8sbDQrkjGsHLUDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9cRG5P/pskq4F2lr+2m6W0w6TlsO9b2ifiZ9Gj5tyhAWQlEOb
 vWjFSPx2mpwUCbOWsmj5j8o8J2F4KomPHwRSIIhGjrXA2INNi/F9cfdl
X-Gm-Gg: ASbGncsyvwXV4FfhwqC4IyITMXcHKcwbOMe/sOYldAto/KrPzlZRvwDRQ3fiDj4Kyax
 Mrg7NbyLyBUH4SqxnKJfWe81Q8cWIs/7DArT7Kssqi2eV/kK5V9D1MdGjbCHlSuOsHa9tffnu67
 lN8cpI7K2NtgK1haXgo/W+WFCVhWMAxqh0R0wzYyfX6lvenu9yiXv08bOTBPJ/QtxEjoxz8dViC
 DW8Wbgl7k0HmCcvTTH/i+y/CT36E4iwlfpyKmU5QwOjfXBTcq1So3rRfqbLjGdo7gfDQSKkAdIS
 kptSZge0TWNQv6T1hs9xxTCqwf13sQyajJDn85r3bcrTQ8qzB1WTzVBrJDKPT3w9xGkshKf6vRe
 cyMHwkRKV2P+Sm99B2RpZ8bqwgRFwwi3zKonmrikEtE2KUyzQY4zAAA==
X-Google-Smtp-Source: AGHT+IEFHENr5ISYnvmEiH8MxR7Wx9/fODHzGABFsPhDA+iTx85P13NmyGBvASmtgR9S5z/x1X2KCg==
X-Received: by 2002:a05:6000:2889:b0:3a4:d64a:3df6 with SMTP id
 ffacd0b85a97d-3a56869cdfemr2520299f8f.3.1749817729957; 
 Fri, 13 Jun 2025 05:28:49 -0700 (PDT)
Received: from localhost
 (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e232e0asm49941605e9.14.2025.06.13.05.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 05:28:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] drm/fbdev-client: Skip DRM clients if modesetting is absent
Date: Fri, 13 Jun 2025 14:28:38 +0200
Message-ID: <20250613122838.2082334-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
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

From: Thierry Reding <treding@nvidia.com>

Recent generations of Tegra have moved the display components outside of
host1x, leading to a device that has no CRTCs attached and hence doesn't
support any of the modesetting functionality. When this is detected, the
driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.

Unfortunately, this causes the following errors during boot:

    [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
    [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95

These originate from the fbdev client checking for the presence of the
DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
not support DRIVER_MODESET this is entirely expected and the error isn't
helpful.

Prevent this misleading error message by setting up the DRM clients only
if modesetting is enabled.

Changes in v2:
- use DRIVER_MODESET check to avoid registering any clients

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/clients/drm_client_setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
index e17265039ca8..e460ad354de2 100644
--- a/drivers/gpu/drm/clients/drm_client_setup.c
+++ b/drivers/gpu/drm/clients/drm_client_setup.c
@@ -2,6 +2,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
@@ -31,6 +32,10 @@ MODULE_PARM_DESC(active,
  */
 void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
 {
+	if (!drm_core_check_feature(dev, DRIVER_MODESET)) {
+		drm_dbg(dev, "driver does not support mode-setting, skipping DRM clients\n");
+		return;
+	}
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 	if (!strcmp(drm_client_default, "fbdev")) {
-- 
2.49.0

