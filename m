Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA83AD880
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 09:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECC46EA8A;
	Sat, 19 Jun 2021 07:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2D16EA90;
 Fri, 18 Jun 2021 19:57:42 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id f70so13674133qke.13;
 Fri, 18 Jun 2021 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37+/bJDLIApjJOabHdvoQrAss7FfPxN4WhCrNaoRcQ8=;
 b=VVK5tqIQzPOB/pClQcuBsJaDAbUUEnkPPKfulh8+2myK665uuDo09ot8XCi6sHxLZR
 y8fj3mrgXvbx9A3B+ONtPw+fgzGSVSenp/EXoiY0gWROqGi4Fn1A3bfSSLUZAqRutrON
 y6/Z4NVEd0pCnvPql7ZC2qz0kpv16hGqhZjcz6pRzjZpd2pCUk/Rx0NTK3mRSSCCeTNz
 w7VxyKoNdVRfMd0+aNfUIgW7eUgGosp5ty6Jf/80ptGfWLaf+TpH/azKTIXsZyVE7lva
 yo1XLSjlzAKK3hQ6WsNhDDGl4EuKC+ZgpibQ7FiIqr2BIgGmALXcE/0yLnEA8FN0OU8x
 W31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37+/bJDLIApjJOabHdvoQrAss7FfPxN4WhCrNaoRcQ8=;
 b=MaqMNfrPIKuDjMuIkRiVLn1kAGB/uYT+scuPJgHb2OKR4B82g6jCvCNb/WXJTTpW1/
 u1XrKpRrSu0i/Vr+7ZLBIi1K/8vGDijf4CidJpWtQNg8kkHLMgU7HoxQkjg6NO41sNJF
 B47s3x74/+m55xqNNqneYTSk+ma6eKR8ECabUwcLOoiAVEtv0UfhcLq0WvXHYSvkU9cv
 Y5qjH3XWg5+mZ/1P7lBsuBdVOjTd/fZhfBJzGH30pB4OMPyiHGny5gIrXZZ6DmPqpvfH
 juxBQhcvQf9osDHNmAPy2zF5vDFIcBk7KRsIHqJMTeEnNh49yuJVq9h+lGY8toQxK1Jz
 v2DQ==
X-Gm-Message-State: AOAM5312I+URdP1rsW7MR+Ck3TruZxmBB+pm1ThzZmn/rA04Z+ikUUo4
 wfB3Aqe4AUFwW2j7oFXfZis=
X-Google-Smtp-Source: ABdhPJwsBoaPQpmygNhzzHbhxJYWLoAgyxjLlepBLO8ruFcZoLk3lMO3BSYI+s1NjI072I/BF0YnWg==
X-Received: by 2002:a05:620a:4106:: with SMTP id
 j6mr11002088qko.452.1624046261378; 
 Fri, 18 Jun 2021 12:57:41 -0700 (PDT)
Received: from localhost ([207.98.216.60])
 by smtp.gmail.com with ESMTPSA id 7sm6015448qtx.33.2021.06.18.12.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:57:41 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Marc Zyngier <maz@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexey Klimov <aklimov@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Subject: [PATCH 3/3] Replace for_each_*_bit_from() with for_each_*_bit() where
 appropriate
Date: Fri, 18 Jun 2021 12:57:35 -0700
Message-Id: <20210618195735.55933-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618195735.55933-1-yury.norov@gmail.com>
References: <20210618195735.55933-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Jun 2021 07:44:34 +0000
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of kernel functions call for_each_*_bit_from() with start
bit equal to 0. Replace them with for_each_*_bit().

No functional changes, but might improve on readability.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/x86/kernel/apic/vector.c         | 4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++--
 drivers/hwmon/ltc2992.c               | 3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index fb67ed5e7e6a..d099ef226f55 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -760,9 +760,9 @@ void __init lapic_update_legacy_vectors(void)
 
 void __init lapic_assign_system_vectors(void)
 {
-	unsigned int i, vector = 0;
+	unsigned int i, vector;
 
-	for_each_set_bit_from(vector, system_vectors, NR_VECTORS)
+	for_each_set_bit(vector, system_vectors, NR_VECTORS)
 		irq_matrix_assign_system(vector_matrix, vector, false);
 
 	if (nr_legacy_irqs() > 1)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 4102bcea3341..42ce3287d3be 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1032,7 +1032,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
 {
-	unsigned int i = 0;
+	unsigned int i;
 
 	dev_err(gpu->dev, "recover hung GPU!\n");
 
@@ -1045,7 +1045,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
 
 	/* complete all events, the GPU won't do it after the reset */
 	spin_lock(&gpu->event_spinlock);
-	for_each_set_bit_from(i, gpu->event_bitmap, ETNA_NR_EVENTS)
+	for_each_set_bit(i, gpu->event_bitmap, ETNA_NR_EVENTS)
 		complete(&gpu->event_free);
 	bitmap_zero(gpu->event_bitmap, ETNA_NR_EVENTS);
 	spin_unlock(&gpu->event_spinlock);
diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 2a4bed0ab226..7352d2b3c756 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -248,8 +248,7 @@ static int ltc2992_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 
 	gpio_status = reg;
 
-	gpio_nr = 0;
-	for_each_set_bit_from(gpio_nr, mask, LTC2992_GPIO_NR) {
+	for_each_set_bit(gpio_nr, mask, LTC2992_GPIO_NR) {
 		if (test_bit(LTC2992_GPIO_BIT(gpio_nr), &gpio_status))
 			set_bit(gpio_nr, bits);
 	}
-- 
2.30.2

