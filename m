Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F278916F
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 00:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77B610E158;
	Fri, 25 Aug 2023 22:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36A810E158
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 22:09:54 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-58419550c3aso20995307b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693001394; x=1693606194;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IdHKEBf6LNa2SDLafbTePlchXJqRhBXEEMD76f6TFqQ=;
 b=Q81oK/zkDH876XIfN0sPNVNN5z8b6L18X4x/1+1qY92QqqQw7RJRN82Vwabqzz8jrz
 yHCgVzhl9GVIhGnnLQxocTR0yqRL9v3b5FA/IwncCsNRSrd/ESpv2nYwsG1l/hZ1Y2J4
 uAyCLHE/pmVmYzGGkJ/Q7H8MW0nyoHLw8eYch6DINFcG0D/1UDyS0q72RiLzlfOFcJjN
 OW6JujW6FHIXebrZScvsrviTCqEUJM/XiL0dfIQC2KEGrZgt8q6eM6oS8v0a0eSnq5vn
 VPEFVNM9NG39LxSIl2Fk+Vlv+A7ZelyFFuFC1HzNShnlt7pZVtaN0Sm07XZ1Uiv1FDCA
 YpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001394; x=1693606194;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IdHKEBf6LNa2SDLafbTePlchXJqRhBXEEMD76f6TFqQ=;
 b=dwj3uxbq6AcW1JyxIPyPilsUn6QQlg0mi2EDxwmwO+N66NSPHIYE/ZSp61TfsgI6KK
 1fguWxujjzPpzabvu/Nlj/6uMJWIBFasC6ZiKSYKYCyqUM5/7oXpL3SiDUE3SzKBqE4y
 D2fM3TJC0OT6AUlz0HSecSbg//v+HQkRHS74Hm3gU9delLY1TX6Se/bWM4X+KZenWi7e
 72eT+ht4Lw2QW5dbRr1ERpLJR+CrlgXvkEgUB+DxK/1+dfoZdGwP0QSy2YFGl/KE9mKy
 TjnjUUWPgj2QovP2a0AN2DtIEJ1khuSGQi2zqSMv4cWiZu8biykFieKga3/Sapd3beXb
 XWfg==
X-Gm-Message-State: AOJu0Ywm/3e4GaInrXo/fA2Vr5uJ/lY5FzH8Sqc4jdHrUQKhdeap9ate
 29ZTOhsLWY5UTmpVjTDw9O8i4bAB2UmeRKLTtA==
X-Google-Smtp-Source: AGHT+IHtHRJ7fRcrma2Kt5JyL7K7aUmRWz+4dgMzIzO4z3FEZfOjTLnf+nN/dtoeAPuD6wy6OK9GjuCLAJHjuYGHxg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:ae06:0:b0:569:e04a:238f with SMTP
 id m6-20020a81ae06000000b00569e04a238fmr475035ywh.4.1693001393869; Fri, 25
 Aug 2023 15:09:53 -0700 (PDT)
Date: Fri, 25 Aug 2023 22:09:51 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK4m6WQC/x3MwQqDMAwA0F+RnBdoqxO3Xxk7pG3UwBalkbEh/
 rtlx3d5OxgXYYN7s0Phj5gsWuEvDaSZdGKUXA3BhdYN4Yq2FU3rD2eKpPSiaJiWdxTljKlro8/
 e33rHUIe18Cjf//54HscJfImEpm0AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693001392; l=5014;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=F1dg9ALegRSZFeyfAqDYuZEhvE32uhDXNyNHIraocuA=;
 b=3yMl0CQziwtRieL23Jknw+VaM6GOX8JUpBH9l1dlLv9vmV7gcjOFiB3EcfL6Q7IDaNoZziNU+
 AYzlvo2lvZlCy8qmFlE1zcPe8wLsY2EG7W3nj6zGmEYx2OgYbFLym4q
X-Mailer: b4 0.12.3
Message-ID: <20230825-strncpy-habanalabs-combined-v1-1-daa05a89b7e3@google.com>
Subject: [PATCH] accel/habanalabs: refactor deprecated strncpy to strscpy_pad
From: Justin Stitt <justinstitt@google.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-hwmon@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We see that `prop->cpucp_info.card_name` is supposed to be
NUL-terminated based on its usage within `__hwmon_device_register()`
(wherein it's called "name"):
|	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
|		dev_warn(dev,
|			 "hwmon: '%s' is not a valid name attribute, please fix\n",
|			 name);

A suitable replacement is `strscpy_pad` [2] due to the fact that it
guarantees both NUL-termination and NUL-padding on its destination
buffer.

NUL-padding on `prop->cpucp_info.card_name` is not strictly necessary as
`hdev->prop` is explicitly zero-initialized but should be used
regardless as it gets copied out to userspace directly -- as per Kees' suggestion.

Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
Suggested-by: Kees Cook <keescook@chromium.org>
---
Note: build-tested only

This patch combines three previous strncpy refactor patches into one.
1) https://lore.kernel.org/all/20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com/
2) https://lore.kernel.org/all/20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-v1-1-1a37b65576b4@google.com/
3) https://lore.kernel.org/all/20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-v1-1-b81d5639e7a3@google.com/
---
 drivers/accel/habanalabs/gaudi/gaudi.c   | 4 ++--
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 drivers/accel/habanalabs/goya/goya.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 056e2ef44afb..1b5fe4d0cf5d 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -660,7 +660,7 @@ static int gaudi_set_fixed_properties(struct hl_device *hdev)
 	prop->pcie_dbi_base_address = mmPCIE_DBI_BASE;
 	prop->pcie_aux_dbi_reg_addr = CFG_BASE + mmPCIE_AUX_DBI;
 
-	strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
+	strscpy_pad(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
 					CARD_NAME_MAX_LEN);
 
 	prop->max_pending_cs = GAUDI_MAX_PENDING_CS;
@@ -8000,7 +8000,7 @@ static int gaudi_cpucp_info_get(struct hl_device *hdev)
 		return rc;
 
 	if (!strlen(prop->cpucp_info.card_name))
-		strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
+		strscpy_pad(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
 				CARD_NAME_MAX_LEN);
 
 	hdev->card_type = le32_to_cpu(hdev->asic_prop.cpucp_info.card_type);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 20c4583f12b0..2ba7a50103bc 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2431,7 +2431,7 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 	prop->pcie_dbi_base_address = CFG_BASE + mmPCIE_DBI_BASE;
 	prop->pcie_aux_dbi_reg_addr = CFG_BASE + mmPCIE_AUX_DBI;
 
-	strncpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
+	strscpy_pad(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
 
 	prop->mme_master_slave_mode = 1;
 
@@ -2884,7 +2884,7 @@ static int gaudi2_cpucp_info_get(struct hl_device *hdev)
 	}
 
 	if (!strlen(prop->cpucp_info.card_name))
-		strncpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
+		strscpy_pad(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
 
 	/* Overwrite binning masks with the actual binning values from F/W */
 	hdev->dram_binning = prop->cpucp_info.dram_binning_mask;
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 7c685e6075f6..024ccf2e159b 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -466,7 +466,7 @@ int goya_set_fixed_properties(struct hl_device *hdev)
 	prop->pcie_dbi_base_address = mmPCIE_DBI_BASE;
 	prop->pcie_aux_dbi_reg_addr = CFG_BASE + mmPCIE_AUX_DBI;
 
-	strncpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
+	strscpy_pad(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
 		CARD_NAME_MAX_LEN);
 
 	prop->max_pending_cs = GOYA_MAX_PENDING_CS;
@@ -5122,7 +5122,7 @@ int goya_cpucp_info_get(struct hl_device *hdev)
 	}
 
 	if (!strlen(prop->cpucp_info.card_name))
-		strncpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
+		strscpy_pad(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
 				CARD_NAME_MAX_LEN);
 
 	return 0;

---
base-commit: 706a741595047797872e669b3101429ab8d378ef
change-id: 20230825-strncpy-habanalabs-combined-c43b1d11960e

Best regards,
--
Justin Stitt <justinstitt@google.com>

