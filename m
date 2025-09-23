Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2145DB976B5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 21:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DCF10E09A;
	Tue, 23 Sep 2025 19:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MreSzpgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D6210E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 19:51:06 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-267fac63459so56439905ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758657066; x=1759261866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ehAB6FDec8ZClTzkqi6qQhO0SFHIZCiWE6qrwdH3NY=;
 b=MreSzpgtjm1rBlcAuqvo2rpai+OpXwVmDpPeNmpvMiqnuFJUPtzeaHDpBtNbg5qk5F
 vC4RomxV5ygEyXL9fO4D2Wj2fRwQ5nZ7skLf8gY/f3jiteOkAqe4tpSbcPf+qP3Rtflv
 2kT2++0I9BtlI+pYA7gwUG5+4XvCyJ7xtByusPCRUmzJHbKwE6yiYjNf9/9rFhfc8RWK
 bumPf++kcHKmMJU1ABVBO9oE6UomaS66O5Oyog3DMyt9wWayGfSlPXrP28yrQFmkgeh4
 WLFgu4A39Tdt3fvgOC2h3ECfsyQJfuDeMkEFAzjl4O0BoC6APqNQ5+I9Ar6taMBEIzJf
 UxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758657066; x=1759261866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ehAB6FDec8ZClTzkqi6qQhO0SFHIZCiWE6qrwdH3NY=;
 b=DMU9vBMkCqXttq1DxNYLvCmL76HQqlqPC0F7iyRxutpEdGAKt2aDps09QkNQ4WrNtE
 dGwsUAStbSGIrrU6uhtwSLXEI+dY7AQoSzjtlDma/CHmuGTGj7eEGpQkku3YxS6jkRWl
 WI7T+KZre3rue5yCdgNHifCrpuARrrfYsaxQL4HhnR2UA2lAGL1UW+16qwngtn2QnOlw
 ew9c4Xbw0OLPKY8vK9ZO55z9Kr8NUrVjHW4dssmsiAsLX8IIHaPl6t6iryNpFBatB9nv
 YEUDvAuWsvI7QEWRI15sBvc7wYhgRH2G0S5y8ZmirA4s3XWtgwDahCWiX/0ewwNjzaKe
 qrXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOrO2R8Nqqe1WQ7kSO2SIy9LQQEpNbl0CpShLVOKO0z4BpgHP58LnKyw2NEdXvexF/rjeYmCDfJkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJbS2H9UQG2NzIClIQaa1EJuiTdavkhUO2lYSbz2O8MeWeGXo5
 isgsY5+0F572lq9CKJ3N+RBYhnUoT9+VBv+IxxAzZXIOwbKRJ3IbLjOF
X-Gm-Gg: ASbGncs8fK96K7bUzB61it2n8J41liae0XS8mpWOTdraPxp3pGpa2wWFphd/TG3x++P
 6yvqcoSmXdDofGQpPPgotYvnNVIb3oxZnYOiKb2Z8lfh8Ch8mqm7FM+Vk1+xepTeOd9CJGsxap4
 3OsrQ82Cxo+nDhKAjSFIBVdObIW+wT+LbajDa/NVuYcedPnwBySNRhYORqW/LHTvmmaAnUtOrRf
 rgo0tAHXQH89UZK3UMVwIU/QAMg5EmEoZPM5BmeNa8NgWsVSly8+lCEVPjpgnaCcb3ohewct1wm
 7WNb4AA0aZqsLa2+PcDkXM2LKqEH5QOscSwQ/vY+oRSWQpWReh0igino39ujDnDabTxXcTualNe
 VIGH/sNwDRsRxSHHDg7yLMKDV
X-Google-Smtp-Source: AGHT+IEv/yGGrlpOdfY2cliSiBhQF6mMtksTl6D3DmZd+ZV/JQOSaJhhtwrh4WbSv9rczttlYVIw7Q==
X-Received: by 2002:a17:902:ce81:b0:276:9863:44da with SMTP id
 d9443c01a7336-27cc1570dffmr41713785ad.8.1758657065909; 
 Tue, 23 Sep 2025 12:51:05 -0700 (PDT)
Received: from archlinux ([36.255.84.56]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018d0fasm170974755ad.60.2025.09.23.12.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 12:51:05 -0700 (PDT)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: jani.nikula@linux.intel.com
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm/i915: i915_pmu: Use sysfs_emit() instead of sprintf()
Date: Wed, 24 Sep 2025 01:20:51 +0530
Message-ID: <20250923195051.1277855-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 5bc696bfbb0f..d8f69bba79a9 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -895,7 +895,7 @@ static ssize_t i915_pmu_format_show(struct device *dev,
 	struct i915_str_attribute *eattr;
 
 	eattr = container_of(attr, struct i915_str_attribute, attr);
-	return sprintf(buf, "%s\n", eattr->str);
+	return sysfs_emit(buf, "%s\n", eattr->str);
 }
 
 #define I915_PMU_FORMAT_ATTR(_name, _config) \
@@ -925,7 +925,7 @@ static ssize_t i915_pmu_event_show(struct device *dev,
 	struct i915_ext_attribute *eattr;
 
 	eattr = container_of(attr, struct i915_ext_attribute, attr);
-	return sprintf(buf, "config=0x%lx\n", eattr->val);
+	return sysfs_emit(buf, "config=0x%lx\n", eattr->val);
 }
 
 #define __event(__counter, __name, __unit) \
-- 
2.51.0

