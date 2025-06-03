Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A6ACCCA5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 20:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868D610E1F8;
	Tue,  3 Jun 2025 18:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zzw1Lhtt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CCE10E1F8;
 Tue,  3 Jun 2025 18:04:24 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1542065f8f.0; 
 Tue, 03 Jun 2025 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748973863; x=1749578663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UUV+ii5u6eXM/9z4t0zPuEnw9506tcp6lSpVIjqTuQM=;
 b=Zzw1LhtttT33lgm4QKmKO60S5KXUn/O5jFw5ppRsIoeoKiJPmPKEh3EqE055Sb38ZZ
 cbkUTV1VneC7Vj/BDjiVzb0NRSNJDrcAS+Z/nZK9dQ9M2jMFsns8bJiQ4eb0Du0ONUod
 RYWS+1kWpIo3Ye4+AVHdCvkbITpkyZaJF7cEiKfGKcCwdqTZ8Y0IjU8qYqP7+IIOPc5a
 nUM6hLbmWWFkdk27687jPnYEch3bWAPw6mtB0xpLPGunbIMCHYUlQ92DrehcfIJwQGn5
 zZSRpz3wpfZ/hyWJk2GTNbuLOBzbLucZhLBh6bIRjm9NSLg2m6DOVTJlkExFNY6G12pM
 PbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973863; x=1749578663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUV+ii5u6eXM/9z4t0zPuEnw9506tcp6lSpVIjqTuQM=;
 b=hK2d0jrNdpAsJgo0D9iH8Y/ngSjAnp+nfEpUmDADcB1+4cCyI3eVqQykzbvo98UsBE
 luQG/jOWmLHmHosZSb77aWRFyU6Pyja+VJpxGGNavpXiMBTcF6qsoV59jHu4VaQayaeC
 ARdf6oe9crdJWw6exRmrZh0gZqfQan8BSmi6wBGBbVFplFD+zrwcH/GHPr83726jj+HI
 B6o8BfKsctVsUbfpj4LArTnD9mx4HcydkSK+0aGMdtZznZSyHw+7vMjqELsjcsAnzKGh
 1Iw+imxX8gU7qDQ+7GG2Ow5SZ4qNkVghpQFCCAlTVbE/4fOUKuj0j4yXgjCSvfEH7l92
 tAwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfWCGMI5NLqbAu2c28EA7Mltas5FUJcHuiXHTpMRuHflMyB45Xa92xUlglI5IHJ5Rp3qxfApTvB9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKjfokffkpTBmyoDCSbe9ZKR4cOtk5tqsyr+PyJYkYyP9LcReB
 MQBk7R1G7Ezos+pX4mjdfAUjaybLi8ncmA+ZW5Xn/UuA05rH1+orwdK9
X-Gm-Gg: ASbGnctbDu4kfS9X8i/UUV5BIOlEtE1hAPCHy+MMl+fRxxOWwOszq5Ssf+d8o46LtsV
 2vnlor0y44j8GffhTMIKHDC1gB+pquB0weeK7RB18dN1J5Pnh0GuO1KrO8TLExlR+Vkhiykhbdq
 CL5WKOoC317u5Sjd81OXBJXl7oOSKi2tBsHBNc2HAOO9nVULvutAcsQHoFrTp8eidIMiGuYoMCV
 1xRS3LxttDE0oYeuZtNqrUUqkKVIzfy9joYkiq1d6d16ICWIgT/SZyXGOQDwJhhgvKasnzyY1lN
 0x7Yn1MZamyEhLU1+WRUkWe9UItWWepGu6AiayT4LY8kbFMH9HjpwrHPSgpIknc=
X-Google-Smtp-Source: AGHT+IFWDRZ5DMF8AWYghMojAC19CnsoSoHQTSNpwtp6Jv2nP6IRBRnbRL5Y916DRs9zZwsULYr8uQ==
X-Received: by 2002:a05:6000:18ad:b0:3a3:727d:10e8 with SMTP id
 ffacd0b85a97d-3a4fe3a6ac9mr9056440f8f.50.1748973863165; 
 Tue, 03 Jun 2025 11:04:23 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:397c:823b:f900:56d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b887sm19468210f8f.18.2025.06.03.11.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 11:04:22 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/hwmon: fix uninitialised access in
 xe_hwmon_pcode_write_power_limit
Date: Tue,  3 Jun 2025 19:03:33 +0100
Message-Id: <20250603180333.32117-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=n
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

val0/val1 are not initialised and are passed to xe_pcode_read():

    xe_hwmon_pcode_write_power_limit()
      └─▶ xe_pcode_read()
            └─▶ pcode_mailbox_rw()
                  └─▶ __pcode_mailbox_rw()

If __pcode_mailbox_rw fails, val0/val1 could be left
uninitialised leading to xe_hwmon_pcode_write_power_limit()
to access them via drm_dbg. Or an uninitialised val0/val1
could be dereferenced inside __pcode_mailbox_rw.

To fix zero-initialise them to avoid potential UB and 
propagate error on failure.

Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0d32e977537c..04acb47488a0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -179,7 +179,7 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 					    u32 uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 val0, val1;
+	u32 val0 = 0, val1 = 0;
 	int ret = 0;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
@@ -190,9 +190,11 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
 						  &val0, &val1);
 
-	if (ret)
+	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
+		return ret;
+	}
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = uval;
-- 
2.39.5

