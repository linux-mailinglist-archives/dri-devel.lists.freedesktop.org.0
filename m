Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E52CD5078
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AFC10E5BD;
	Mon, 22 Dec 2025 08:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZv/BtyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0751B10E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:25:42 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a0834769f0so36073365ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391941; x=1766996741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
 b=OZv/BtyJ0GVWZseJiMw4O7OhWSe6mxtr3Kug+drjvNSgqvoFSXOnolwz5ajpS7WtKV
 KCsPDKpp/irVC6ymItIG2OtW9mEa05gsQlXJDWq/J+0Z8fnusQ7k2ORif4+sNGkPRi7S
 ivevLBo5R+oCUVSdneQwlWWz1ZThZoDiT5y02sz7qrXjLasEJ5/0Xhq6/3D+iqS1MqH/
 hPQSA5mMPh9Kk5S92m8ycbk8PdLN2cY/JC061ZAmuioALJF3Gc8hRZSx4ZMpA24WE64r
 53dGmlFFfsVoywXZ6DQqd4QL2xH9cOLUYDMhhrOPtxT5Jm25tp7ElBt2sh73LhNkwTEG
 O7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391941; x=1766996741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
 b=qoMYt/3r95yvtChjMMVRUTo/t5342d/oRbpHGyoempm05udWaQfdUTzMmp4SvGo1qq
 JELLzQLs7ElUucvM0+6lINhr8c2TkJEJK0BXVA+1KnaM59oTuY/RG+3l3bypVKX0C66k
 gIhaiqpuT1Z3x2HSyc2E/MFuxtBIa0MC0O7PD2gfgREaWJelqJVMJpcl2zXWwKD9bBcv
 XBBkOFu6nx91bkRsabjXHR/XPRAI91W37YEqDecepmTRWwT9gYbuxqLi/2St2xgkmRgo
 q4NZFdoYpcwS01lri53nna1Z36asQEitQ66S8LE3Xqt8Q8V7W86hahVRfFcq3zh6YkDa
 mHuA==
X-Gm-Message-State: AOJu0YxGk1wtIluXsMcloamPT1AKlpgj5FcVbwBWi8QJYO5fs6szyNC8
 ZngsYl57SEzu0kRRKg0PfzW7OrXMyVmc3MlX1oxn6kyKb4x0Kar75q95
X-Gm-Gg: AY/fxX7loMxF8dPeG/xU0xbujEOaVIwop1mVmKEVa9ugUcJ5gBfubIiR8XnJDj2pJmu
 v+AUEfMghcBE1NRU+MYwFgR0f9IH6VavR4wZ1P4tfjf+PlL9RNJ11X4NJhaktKnpVCdpNVoprC0
 K8TkoAY/y4W1g34NGNhL6G5Z1Ndcx5uT5cO6Fjx72DjNQl/zclOhxBim30hA4JY/zt1vTtCwdp9
 lpDGsc5ovqHK01t7hgMvvvAVHjrOMxcTFR1mI+CLQcpzAUNwP7xcVOBw4xDIdsyaMobUgga5kms
 OFA00U2zrfHePt3eetrB/jm6eEWrPfnNVFeO8m6J497/fgZ5e9iC2nudke9K6pACavtWQwQeM+L
 yAVgO+cGfMcDMs0xiaXKgpqIiZ96m11OET4+Ze4LdMYSMVdgcFZab0whjL1o9QHfiMs024X1GTI
 X03F9uGN7S
X-Google-Smtp-Source: AGHT+IFewFiHLSSMkteVB5+mJ427GMrWESNV1s0gzG1qZwVux0iZoGglO5KJ+zZHGWbOk0GOGu+BPQ==
X-Received: by 2002:a17:902:ea11:b0:290:91d2:9304 with SMTP id
 d9443c01a7336-2a2f22052f9mr107996865ad.4.1766391941481; 
 Mon, 22 Dec 2025 00:25:41 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:25:40 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 24/31] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Mon, 22 Dec 2025 21:20:41 +1300
Message-ID: <20251222082049.1782440-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b2bdfdfb6ba1..fa81177e8089 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,25 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
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
@@ -191,17 +198,20 @@ static void do_levels(void)
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
2.52.0

