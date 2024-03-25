Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF4A88AC78
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497AB10E2CA;
	Mon, 25 Mar 2024 17:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CXjU86xK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99CD10EA2A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:53:03 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1dddbeac9f9so29181285ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711389183; x=1711993983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSmEsP2HwUjZ+Kmad7RzlLHqlu7fphsCj8c3+UcbJqs=;
 b=CXjU86xKK9wBWeCARX0kEQHbozjHr/yf5PN/nqlqsss0sHrtffZmZm1Vv1vEdohcPJ
 svv8SAzH7taoMClMBQqKQUW11w+tnwrXcynbBXr7wiLxoqXAci6jG/aI2DVNZEz4CX3q
 k9ZTP8aag2imJqcxpuvp24sJvJkmRbqntA3CX45bpKIMcsTS/oxAhysiIW++0jFw5Dxz
 ulrvoHc9332HzuZrFFxJIqyx//rpSxO8sjQjG4wwTJh8ZYNJsjLyCsOv0avd/rhMYDic
 43qP35eXz90fPpIJTp4yU0Gvi9CDBKiAQGxvmxo1Z8HY2X01NqDrrMRFVOdzxUM8cm3d
 bJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711389183; x=1711993983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TSmEsP2HwUjZ+Kmad7RzlLHqlu7fphsCj8c3+UcbJqs=;
 b=CZtcCpb/ukMNn2oaUo2dZTg4BZA0GqigYjTIQlg8D+pG3lP+v3B4BLUucbzwfgMUDf
 ByFHkKavYWtiX1yOllrsZzfKW+9uGtEl9ALHpvECTjIGmWtWRt4NMznGB/kgbK8hmS78
 X2nhhgNg51FcZ3+Xo8boA90fSt/2o/YABCut9zygNqbozmaXAwIi7z9IPlLZBqeBqw4O
 yF4LLNXx9jL3s6R8fK+J9SbZvy+r9m4bjheDgGPCtJJn1lqJWwIO2Jxwu1+vEG1yqc4U
 MNsxK/CKZFmjPDXZzTz7iTm/D40OZaLRrFhxv6SDwLCbkTcFbDmLbs2aPlBHYuZdV5NI
 r+hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/r4oXyBBAqQzo3ZuoIwUUlwc9QApc2iC54QZq6iqsoVNnJAXLbM6/3vj9K9GqqSZhOPts6aPM9b6e9+56GEuiZd7Es4Gjvg+qpj7KuqoI
X-Gm-Message-State: AOJu0YwXPz5t8VpNoBJkc5Q6x4l4xCOPs5w2TqDTHC0RYxVfW5LJ58p7
 p6jIPNHkODGYFEjqYH1LXPws4jBZw7OzsjgyBM2uW4IPw+YpXPMI
X-Google-Smtp-Source: AGHT+IEVej1vJgDHyMhirxlQLl4uccA8YOz8D7GQmS3E1f+SiDCdIFMWODSUkw2joL6x2b4cQW8ruw==
X-Received: by 2002:a17:90a:a88a:b0:2a0:486e:780a with SMTP id
 h10-20020a17090aa88a00b002a0486e780amr504319pjq.15.1711389183399; 
 Mon, 25 Mar 2024 10:53:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a17090ad40c00b0029c68206e2bsm6603983pju.0.2024.03.25.10.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:53:02 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
Date: Mon, 25 Mar 2024 10:52:39 -0700
Message-Id: <20240325175248.1499046-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
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

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

 drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 76332cd2ead8..75614cb4deb5 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.39.2

