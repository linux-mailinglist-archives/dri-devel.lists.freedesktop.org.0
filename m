Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE3A54209C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 03:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272FA10E98A;
	Wed,  8 Jun 2022 01:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7EE10E7EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 01:09:21 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 a8-20020a05683012c800b0060c027c8afdso3881750otq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 18:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TH0uwVgHZAwq0jKJ2rY7rr0n6nybjWr8m8j939NAcUE=;
 b=qqCZGsFj3WTgMs3F8eplwxhY8tlcCpyszawL420QxCE1KGOlb2XREx+0YHhA/DXDht
 y6FTG7VikxjZzWmeWN6N7dhQM6c04xnY1Y9LYsQa0IHup3PFgpYPGjBz949gatfecqpi
 UTKgVldl/uVChP2nADj5fLDq6mcJx1CAkykZRO+OF6G0E/S+cXNXjIZRZYjb71pMMMQu
 BR4xCLhM2SA+nS2/WaI7iPZmaNvV1DOWF24hrKmioPRzxxEm7vDUUV1peqgLyn8ZlhgR
 Hn5h/IxgLHkgxbj9VkurqF+8cQfRShUn2s3hqev+lUZXCEtavv3dWnsflftx7KmbvLnC
 k0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TH0uwVgHZAwq0jKJ2rY7rr0n6nybjWr8m8j939NAcUE=;
 b=IJLIoDu43RYneTTVF2CKREjwZ0Fq46n/M8tS11Rlz+S62cXTQNVMIfhQyaCcy6ZdEU
 kcOcvFCclSZafWhsGPETQo+EDjtF4aEjl4SmuKZUCQTpkes4ZNFlgBItNYAL3qXLfGtA
 P7MKI2rAbhD2EZ6zo4L7/IjRpJ7PKYLnprefxTuveCF5Q9scanCCtFJj8PMqML0fsql8
 RjiQ4fJYq4eR+o9J/Sk/V+fhi+DNk5M+oQOTXn3eg4O/twYAPIGRS+c9AE59gnE6GsRn
 lDwkQ1SoLv0F2R9zetYyMCaXQpc34ag6R/HCZloVtT/mzJPifuv5Hg8j//YgiAgj34rI
 54Hw==
X-Gm-Message-State: AOAM5332h2Z7vsJm6yH5B9LS2YDwRXwETQW79CIKvgpk4gjJY7xaZo+Z
 vpa3rclngAvs5VNhlGM9ILoaHQ==
X-Google-Smtp-Source: ABdhPJzuiHfBdj/hVttQ2zZajzaYxynowqNPbS/D5BqnB7NeOLdkb2qK7wfnz1fb68HTl5Wobxs8vA==
X-Received: by 2002:a05:6830:1456:b0:60b:f7b9:fc49 with SMTP id
 w22-20020a056830145600b0060bf7b9fc49mr6437094otp.260.1654650560284; 
 Tue, 07 Jun 2022 18:09:20 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a544e90000000b0032b1b84f4e3sm10343057oiy.22.2022.06.07.18.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 18:09:19 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Jun Lei <jun.lei@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>,
 Harrison Chiu <harrison.chiu@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [RFC 2/3] drm/amd/display: Move bw_fixed macros to header file
Date: Tue,  7 Jun 2022 22:07:10 -0300
Message-Id: <20220608010709.272962-3-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608010709.272962-1-maira.canal@usp.br>
References: <20220608010709.272962-1-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macros defined at bw_fixed are important mathematical definitions,
specifying masks to get the fractional part and the maximum and minimum
values of I64. In order to enable unit tests for bw_fixed, it is
relevant to have access to those macros. This commit moves the macros to
the header file, making it accessible to future unit tests.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 .../gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c    | 14 +-------------
 drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h      | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
index 6ca288fb5fb9..d944570e5695 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
@@ -26,19 +26,7 @@
 #include "bw_fixed.h"
 
 
-#define MIN_I64 \
-	(int64_t)(-(1LL << 63))
-
-#define MAX_I64 \
-	(int64_t)((1ULL << 63) - 1)
-
-#define FRACTIONAL_PART_MASK \
-	((1ULL << BW_FIXED_BITS_PER_FRACTIONAL_PART) - 1)
-
-#define GET_FRACTIONAL_PART(x) \
-	(FRACTIONAL_PART_MASK & (x))
-
-static uint64_t abs_i64(int64_t arg)
+uint64_t abs_i64(int64_t arg)
 {
 	if (arg >= 0)
 		return (uint64_t)(arg);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h b/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h
index d1656c9d50df..064839425b96 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h
@@ -33,12 +33,26 @@ struct bw_fixed {
 	int64_t value;
 };
 
+#define MIN_I64 \
+	(int64_t)(-(1ULL << 63))
+
+#define MAX_I64 \
+	(int64_t)((1ULL << 63) - 1)
+
+#define FRACTIONAL_PART_MASK \
+	((1ULL << BW_FIXED_BITS_PER_FRACTIONAL_PART) - 1)
+
+#define GET_FRACTIONAL_PART(x) \
+	(FRACTIONAL_PART_MASK & (x))
+
 #define BW_FIXED_MIN_I32 \
 	(int64_t)(-(1LL << (63 - BW_FIXED_BITS_PER_FRACTIONAL_PART)))
 
 #define BW_FIXED_MAX_I32 \
 	(int64_t)((1ULL << (63 - BW_FIXED_BITS_PER_FRACTIONAL_PART)) - 1)
 
+uint64_t abs_i64(int64_t arg);
+
 static inline struct bw_fixed bw_min2(const struct bw_fixed arg1,
 				      const struct bw_fixed arg2)
 {
-- 
2.36.1

