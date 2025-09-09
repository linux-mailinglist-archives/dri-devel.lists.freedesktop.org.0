Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC48B4A40B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D9410E63F;
	Tue,  9 Sep 2025 07:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ey45sGgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E6410E163
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:43:14 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55f76454f69so4971438e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757403793; x=1758008593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AS7VNoPE31hVbngNYKGN2vb4znQT5BywBU8nWd9Q2tk=;
 b=Ey45sGgxHNahueHzGs/BXAL20du36MOPAoRaeDMF4t2GL/YkLY/Sa0j+TCKwC8fiS9
 MQmqt1oWDKjYQQ1I4lJVlHFd4QVxX3/GC9MaHms17ThXdVfosJdiGlMX2R19XdL1Q913
 eeCS0C+vBSz07t3X5nGrTe+5ez4/yIlnLacWWeP9EN/5kY2yFlDOtAzpH0Kppok3aph1
 aabmNhMXetOy6DH/qvdbFPd429S2N/z3OVdcojUxAKhqRjPIVBnCjaD2DW714IXLYcml
 eiu8+QrimXFXrXksO7SRQCs3VcLCapq7ZQ6JRWTROUtdjlmmwkl9SleIKcecSFb4N05s
 bm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403793; x=1758008593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AS7VNoPE31hVbngNYKGN2vb4znQT5BywBU8nWd9Q2tk=;
 b=ekyol+ZrN9ST/CfI38wT4aWYtnMUWhrt+D9JHKpdeI8S0RHAfLPaZfJeau7mkCt9og
 J/PiIQVsr4m9owFxFclZGSwi+4QJN9khHFZuVuWf58rR8Sd0zSqPJfSOFlSBj6ai8gxQ
 OAGeRfQQZtK6XOnL/fAfkpoQsCgM/Vm18f3wihoIgoJSR3V/c3NtpBW44AWKzXunqipI
 9zrNYGAUEksS2s2kryjTYv9cZT7I+ETArLiFthYf7T8aORVTUFWl35DtfBWYA3I6N2PB
 G3QvJC/bRWlPt49QIfcLxzjCwmCX8PGZLb/104Xza7e9jzSqhdq8MeS7l2lm0supuDQx
 mmtQ==
X-Gm-Message-State: AOJu0YytiPsi/M0YeOogWq8fj9IfCXuINJV+Y116cUuuO/ZoJFXFygUG
 ecSL+v2Cvhb8KMuN1dagbCyPWpcYtxVTJ2Q4Fm7KWjXthPA7xyRff9dN
X-Gm-Gg: ASbGncsa5eP2BqpStHd3sjswvDT97mHj2l3SMUCvpeNk0VpbHDcEONQZGELX98r8UwM
 YEoKtLnefDV+vv8ECiz9qTCUNNaTV1N+QLAf2oZTyiG4q3fOKh3jZf3GerBLOhkpUv4/DhTZWOC
 JBbKBstbeItb3wGHTcV4Lxa+esUm7+GDYtuz8IXoTQUhGGlfJJkhwfX/sT3FWH9Lq2MSHrnv+mW
 0mPPIrYZ5wDpB9E+K4HDDzbh7InV8M2Zsu+9h9IAYwS02IfPkIPTUier1zHubZWaHcUJB0tDuMt
 xhhQbspw0PCnClg85ReEsSSosR3LjZsGAFKD0KuLTT/tqs8AIzpzwkpmq36wbRRROLYX9EriQvE
 4NGRpsDRhWKnGjy75SJwsm7KUn2AFdpE9t+I=
X-Google-Smtp-Source: AGHT+IFVQZHqLjAbCZi2TcAKzcKwotgrbVRy+JcaKxU5U4GsAo4FHGFmFmjOR5+4JFXb0wcxlhDOtQ==
X-Received: by 2002:a05:6512:3a8a:b0:55f:3ef4:a0f0 with SMTP id
 2adb3069b0e04-5625fed2778mr3793700e87.24.1757403792554; 
 Tue, 09 Sep 2025 00:43:12 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795d633sm333731e87.68.2025.09.09.00.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 00:43:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] video: backlight: lp855x_bl: set correct eprom start
 for LP8556
Date: Tue,  9 Sep 2025 10:43:04 +0300
Message-ID: <20250909074304.92135-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909074304.92135-1-clamor95@gmail.com>
References: <20250909074304.92135-1-clamor95@gmail.com>
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

According to LP8556 datasheet eprom region starts at 0x98 so adjust value
in the driver accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lp855x_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 7075bfab59c4..d191560ce285 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -22,7 +22,7 @@
 #define LP855X_DEVICE_CTRL		0x01
 #define LP855X_EEPROM_START		0xA0
 #define LP855X_EEPROM_END		0xA7
-#define LP8556_EPROM_START		0xA0
+#define LP8556_EPROM_START		0x98
 #define LP8556_EPROM_END		0xAF
 
 /* LP8555/7 Registers */
-- 
2.48.1

