Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDFDA6AD89
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB9D10E694;
	Thu, 20 Mar 2025 18:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HcLMUNHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D248210E6CA;
 Thu, 20 Mar 2025 18:53:26 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85b40c7d608so100199039f.3; 
 Thu, 20 Mar 2025 11:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496806; x=1743101606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9crVnbk3XjpJrHsY0dIqQRNI8E7oyjJ17chOf0dhmBE=;
 b=HcLMUNHWPVgHWePmbChAc7QpndKMZc/X7Wb37TuChpkcmyGfdRrp7Hr9q4yFcppneC
 MrDGDHWcb+DIakgh3/SBwhKtmfexAM91WzqM0XyacLBLnqgjy10kYaxK1RHnYeP0iT/Y
 6pAH7ml0Qf4A38L22J3OmbLPtIsrAFrX90KFOQD4vc7Z/y+Lu31+soYDDvcUKNcsWgSj
 6OOCw1Pc7xMBeeGx8cYggMFFWFIqGouhqYMjhb1jnFZtnic0hTR6dapVlool49aMYsU0
 oGvec2g2vKL/agNlvuW6zpgs3pRLlfiFvhbq+7VkNm/XV6eYJZjgGaMlJIHQC2Bk8k3h
 STDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496806; x=1743101606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9crVnbk3XjpJrHsY0dIqQRNI8E7oyjJ17chOf0dhmBE=;
 b=dn3rGiZd3hyrXDk0w2ICtUusfvzpTtoW8jeRzwwFEa99iJF5RN0lUBobHDuIy353dL
 jtNdIQ9z5UxlMPiYcmcwc9EH0jHVS8+QUWzdlucpaGvWh2jNEzqyhhhydz03c2o+mzJe
 PUq4yBABjazgqus98aQKRjS2Zpl9RXuoAb6ani94PqeJvWooBVQUmTFTZzLMxQ+vM1dn
 8zOTLWOyLB7Jt0xPBHS1rx1auJ47pJQ0GL8ioPGCewmrx1B4jA14yDGV2MuJx5z0OfTZ
 htIDS2GMOV1tIIQ0Kwh3kqShxGxTVQlRBZ2RYIYnceKvulOA9/AURiXqqEFwumM88TTi
 OVZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURmOSJoF7eOXxUECNE7r9x2ovrrsR3FhZj8lW9xuTCw9BJYmiUw+NzmiYeNM1V0ZTOnCYiU6ziqzmd@lists.freedesktop.org,
 AJvYcCUc79+/srW/TONvgLRMidS3QUu7s12WbIz+7nxpOcjgTcsjkL6BLY9VIHD+Y07mBcTcPCo9Yle8ndVKPyMNcQ==@lists.freedesktop.org,
 AJvYcCUraPDaQxBTj0sIr9qj5Ry6H4Ju4TP2Ngb2JagzRCtjUSC+SNZU7YOKhFgpITuSPQ544sD7xikjJ827SY6dzVv4HA==@lists.freedesktop.org,
 AJvYcCX32CxLazI9EDygnlPV58u5D+1bxlm6sqoTR64pl0OYGWn4DpodKlvWgvu8eBdqmoZFK1cpBQX0dSHZ@lists.freedesktop.org,
 AJvYcCX6CGM/TvMAcd6tTo/jkeYTqhhDhstfZHLEZZopjqrjYQKrPQgoC/SHu9bfHHegYuPCE93mQr9G@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzifPzvLPszy6CrtFeMHiaSiB2tbGFEFn8wHZZI+I3WqT+agMO4
 ExvlEAWNzgazJxJhQU11P0etLdTXNnUph9Z9eAP0y/w/pQHwu7D5O1gmBEbD
X-Gm-Gg: ASbGncusXliehLlAWZtaFexvlepF7Rmpaya/S8wG8ehRs0Y9Zqv5m5hepwh8Hu5fg2o
 cNMQwGBf4meMgj4HjEvr9mK/RxeouH/J9cJHPJKRGKyT3rfhE55ooX4gIfCNw1Fb2E7rtT4jA9f
 LHAvoNOATLUTWSyUkuqyip+7BlEVVtx8coJnZnBhsvZZZTrOlvX80rpzsqWbutvXUJOmhCOdjD5
 fFDqno78PS8cP/+H6vH15jTJlyiJJRzwfwUJnb83mZckgyjxV7s6JGgzo3IAzJ52d+frUaA8s+J
 KAZc8h8inF2vOyV7fPEXGnHJl759e1NyTxyVacbHJN7UFVShz01K/j8woj6ZkdxMQLQY6Z2zU8h
 NtXCPWpPhTEd+
X-Google-Smtp-Source: AGHT+IFxuCjaPGKkc88YGwLvCjCbtuIgV8RzngvtW7+0U59GwUXVQHXX/CedAfIKgwgp/utTkRuZ3w==
X-Received: by 2002:a05:6602:2b15:b0:85b:482b:8530 with SMTP id
 ca18e2360f4ac-85e2ca2d1a0mr42658039f.2.1742496806093; 
 Thu, 20 Mar 2025 11:53:26 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 21/59] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Thu, 20 Mar 2025 12:51:59 -0600
Message-ID: <20250320185238.447458-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

NB: the count is clamped to 10000, chosen to be notice able, but not
annoying, and not enough to accidentally flood the logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 9f9e3fddd7e6..4a3d2612ef60 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,30 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+#define PRINT_CLAMP 10000
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	if (ct > PRINT_CLAMP) {
+		ct = PRINT_CLAMP;
+		pr_info("clamping print-count to %d\n", ct);
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +203,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.49.0

