Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9091AC405B
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797C710E22F;
	Mon, 26 May 2025 13:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JHulEUe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AB110E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748266107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIJNc4z+prl6uqE8TJXFoIi+LuDA64zLV+jmBQfkFuc=;
 b=JHulEUe0+4N7TzKHIhGuywkBkAJbJFfXVLEMwKJCxsiQ0TULpq2BEQNyxDSN4ERELyWgrg
 VGbhMNT5whxx4oP9Jt3g11Xb99I/NR6nw+z6m1F6QkriZ/0M7e0IHeqMALXDrVGAvDR/8y
 O7vzzL1CpI5eF6TCtIwEF/t0NAwXnAg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-Vp3OSOYbPi6J4rULRoZYGg-1; Mon, 26 May 2025 09:28:23 -0400
X-MC-Unique: Vp3OSOYbPi6J4rULRoZYGg-1
X-Mimecast-MFC-AGG-ID: Vp3OSOYbPi6J4rULRoZYGg_1748266103
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-442cdf07ad9so12627015e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748266102; x=1748870902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tIJNc4z+prl6uqE8TJXFoIi+LuDA64zLV+jmBQfkFuc=;
 b=PlDted6zWw4XshTnm0CPAxCMOWBLuwKjyfpGYTJy4OU06XLs01LBqRDdb5ZwNSwpZ1
 Cvya4cUTPlRK06B4hoL/na8iRNbWzZ18rxUJueKpRL0snyCQ0y0G9paw4RXN1syTS+kL
 MQL40MX55824gMmkakOCjqicl/K+Cn2dOHDJG6fN8CxI4qO7TTt+UHO2oz8e8wy/W407
 fHodQxSzsEJHfRcADCWA0yAXqro2RZY5aGX0D2yoMLGRsZgHLNe33+b2Hx8jPjEamHbB
 oHbCiAe1NZCwwlhVaP7zXhYL4EtE8SS6l9cKkfWyf/eSSVdX/17NV/Uk+ZWVv4q9E4Yz
 YZvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEam8jRya4jexOrQYZXyRdJaikJwJr/oRy4MqBah09qCiS2DTslcHUUWDgHZnNWa4y86aF64BKe+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz1mGrfEUhEclbVMvpmS9/p1DyIhhLIVST6hV8VjMLdnHDBds7
 l0l9GsNohSn7Al+ZWDTafhi+FyUgnr8QZBUWrV9Syp8jWlmzjFxyFXRkDV2hQax7ynVlolLEqwT
 7qYPfE1Mb3T+zKUJ3p7Bsm642DTvtX8FPU/9BXYXDginrYrvRXyf+MXqKBHCxpCuiw9qwJA==
X-Gm-Gg: ASbGnct14WjNmgDoVxUzG+yOmr0o/6eYKnDojw3cJUopDSt0vE6y2tElZW5d7YalJjb
 FFSD8MwbVXHAJkBz7ZZQ0bjg8QNET92D96YYZ4Rv5FXfofmLPgU1+MUPUAp2Bupsdx9o9wFxjk+
 hjX2dgVkSSXZs7/A0F1ee/wxrpa5fcZbQSan3U3a9ggV8KvKat9JDXWoTNPVkOMpUnlmVyH/+yn
 rORNiTHOJvwFaofms8WEiV91U5T0dGxWlglaiJeILDd+tptdTtKRcPnzOKWAKuq/CQQYsrIcAoL
 6TR/Ha9DbPEhLOac
X-Received: by 2002:a7b:cb0e:0:b0:43d:8ea:8d80 with SMTP id
 5b1f17b1804b1-44cf6d81628mr43597835e9.5.1748266102535; 
 Mon, 26 May 2025 06:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr19bNHeLuqPTA70dJ3loiMHnX3Wbi8DckD7ViZVw9xearBz01pBMAJtm6RFOqVblZmf8Afw==
X-Received: by 2002:a7b:cb0e:0:b0:43d:8ea:8d80 with SMTP id
 5b1f17b1804b1-44cf6d81628mr43597425e9.5.1748266102096; 
 Mon, 26 May 2025 06:28:22 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 06:28:21 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v5 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
Date: Mon, 26 May 2025 13:27:54 +0000
Message-Id: <20250526132755.166150-5-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FMntvjSjKjKeIB9iyfLSV1UYKk5pOvXjVcnkEeYdalo_1748266103
X-Mimecast-Originator: redhat.com
Content-type: text/plain
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

From: Guenter Roeck <linux@roeck-us.net>

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log and distraction from real problems.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Maíra Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 17e1f34b7610..867845e7d5ab 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,38 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	KUNIT_DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_hscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	KUNIT_DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_vscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.34.1

