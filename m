Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A898A2C0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B701610E43C;
	Mon, 30 Sep 2024 12:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T5Ts9TI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EBC10E43B;
 Mon, 30 Sep 2024 12:37:35 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42cbe624c59so34210055e9.3; 
 Mon, 30 Sep 2024 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699854; x=1728304654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4mtn3Z+z0ZXxXMNcR2ig5e/IN1sKqO9BkR2/07EQmxE=;
 b=T5Ts9TI6Ieb3iD562a95rq0fH/qT959MbOGRDFDhCJtzwg+48xMNNKIsCGcrRQD9bt
 095/oPml0secWeMp085H0ApT36eiKw4HSEVPtDROt6QyXR1buqG5Y04aCllkcoZ8KjnU
 D3tuX8Hk6HJW0+hmgNENYAOqkOxamS+Ps66cqDDras+7kMyf21OLZqMwUcOWhoU0gSPy
 +zzumzUb0BTQq0cbatYKzhEtgKi4Bn4MljqAvBgJvYj1XPN7Br+zt3SLRi3uHGTUOXbB
 tsCraPOoXI9wCyVpHEq3EKwoikFyhZEW4gNZrqZvPIhdhrWy6qJ7Vy3mbVwIUBqIzZZB
 uyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699854; x=1728304654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4mtn3Z+z0ZXxXMNcR2ig5e/IN1sKqO9BkR2/07EQmxE=;
 b=cgoBsJT5/z7E8Q5I4qqxZSKDbs0GlM7hNbQnJW4Y8iT9U9RAkn6mjIaO2rvos9Q4cS
 aZ7s5sQaj2EOT0OJGvPc1Y4OYCLICF/3dxaXR3Worn/QgADl+zuoRUurGP8rvCNanosX
 zXkCo6BA5r9L7OtPyi6G2W4PuEffisw9NeTApietMxlcjWwLIW8RIA+6mcZlWoRJnL3B
 BOhKfoG93C/xaGyZIgtWjJkRQ5QBOOTbtxFYihw3PBYl4lbBmCnMy0zWwrYTO9M1ohWM
 5/NcKg5TdWnWN7OhA/rH3dpGqNAEtmVPwd9pZ5BHxcdiVJWylp3k474o07YaidWFLpCF
 SCxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtr8iwOTJuM3dZkl2pYyHf/xxPuGCN7qcZ3+01RWukSXt92YfYS/v0oLVOUS1THLettqGrfHn6aa0h@lists.freedesktop.org,
 AJvYcCWp3Y34TDuhQ7jmOLvGP31VeXCbU8VuqDRv38y8PqIEBQSL+HMEAPijnikD8ZOFcMKu3vfZzEWtm1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxis2W5vz7Uy26qerruXMXiEZtpv31JrZ8X1b0I4YcuUFbNHho
 zkSZWGhgqIhx5eVo9mV6AfC6r+Ljytg53jd4qad16oTwigke8gUM
X-Google-Smtp-Source: AGHT+IHR5GBV9Sk+AH/yXxWplf7Dccbv713xjj5lLaRHbnIJlkBTu8kMh1LwOxClCDrwdMW16rb5Wg==
X-Received: by 2002:a05:600c:4e86:b0:42c:bb75:4f86 with SMTP id
 5b1f17b1804b1-42f58498ba3mr80097165e9.32.1727699853769; 
 Mon, 30 Sep 2024 05:37:33 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:32 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3 18/19] random: Do not include <linux/prandom.h> in
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:29 +0200
Message-ID: <20240930123702.803617-19-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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

Files that use prandom infrastructure are now converted to
use <linux/prandom.h> header instead of <linux/random.h>.
Remove the legacy inclusion of <linux/prandom.h> from
<linux/random.h>.

This is the "nice cleanup" part, wished in c0842fbc1b18.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Fixes: c0842fbc1b18 ("random32: move the pseudo-random 32-bit definitions to prandom.h")
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/random.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index b0a940af4fff..333cecfca93f 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -145,13 +145,6 @@ declare_get_random_var_wait(u64, u32)
 declare_get_random_var_wait(long, unsigned long)
 #undef declare_get_random_var
 
-/*
- * This is designed to be standalone for just prandom
- * users, but for now we include it from <linux/random.h>
- * for legacy reasons.
- */
-#include <linux/prandom.h>
-
 #ifdef CONFIG_SMP
 int random_prepare_cpu(unsigned int cpu);
 int random_online_cpu(unsigned int cpu);
-- 
2.46.2

