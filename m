Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3223B8799A2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8E7112F2A;
	Tue, 12 Mar 2024 17:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V32PRBjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6AA112F2B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:25 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6e6adc557f3so577029b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710263005; x=1710867805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
 b=V32PRBjTSDICv1tvFwVAfZes4natmJ7lZzOh+z7JIMK6VZk2Q99iRy1n4Zp2opvGzD
 U2Zq7GCfGgpO93zSrfZ4iXkBopSSGNtiWf1kVPy75uxFK6ZUZBdGfHgskjMrwysEFB/F
 k+9Q9p3MyCOktA4J8VNfAaqildEYfi4GiFHA9XqIZWpupZ6kzqJenVJXhlWjeXIJaVbA
 qBmNW9/Nt9X0PxnwCh5pYuxpjLbhwRJ74g2EulBRzrdhkoSyuLIJndUXg54ytb90N6ZG
 kKkxB86p4u2biSZlhWT+UZXuxrhFs3KjQT4o/WzCO5tceaFt9W83qgY++QAVuc2GXADz
 R2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710263005; x=1710867805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
 b=fkXtCO7McKsgFqezqkSP+kyq/Yr7rWSpA5Omrr7idVIu76Z/GdLI0DISTZoqJKlGuH
 IsP6kgfeO4nKEEeRkhBxKyzb5jTRqnWgVPY4/mQ5s/SFk5WEkr0H7hDnhomPe2vxWA8c
 v9Y0fZYVkbizHBUHlo/zw6T2M1xAgf4d1AKunHXI7PpvqDkcyrjjbFTwd2jtNLm7bUEw
 cgL6AyUZ2IiuOtEvKQvRI2xZX8qIc6Qowz01UHb3qacUaK7cn0Gv8VLJPm6NZrwKt2do
 5t4RUaal9xFkuulfBM0fohseLIe71rP5R+TfDWMnWhkEINsRCifQORJmzKtjyJoFUdLT
 KHBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbs8CjSZaX2H3Lnl7OXd87ZBuY7G54M8kNZeQ/f69uVg29cbLUKFoG/X1KKDRL68+VqPb3smPdV5GOqvAnDGuvVB9r/9MuM2bpsDspNCiy
X-Gm-Message-State: AOJu0Yy5MHTpXr31dkRJnGGkmf21zwggR4YmvLZHUqKCQA1KN0Z+uE0o
 hS4bC3I6TuEcHHh7Y06+helmrpVcVIXiG9CXp4YfOhkSrHQBF5+G
X-Google-Smtp-Source: AGHT+IGxFzq6cbK7MrvIXcZlkGCehcjfwe014BGxyN94I+kP8/p7v7PJMJz1gy7c7O8kch/y3R6C8g==
X-Received: by 2002:a05:6a20:1a8f:b0:1a1:4ea8:1844 with SMTP id
 ci15-20020a056a201a8f00b001a14ea81844mr8418900pzb.26.1710263004751; 
 Tue, 12 Mar 2024 10:03:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t123-20020a628181000000b006e657c72cf8sm6830699pfd.148.2024.03.12.10.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:23 -0700 (PDT)
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
 netdev@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/14] drm: Suppress intentional warning backtraces in scaling
 unit tests
Date: Tue, 12 Mar 2024 10:03:00 -0700
Message-Id: <20240312170309.2546362-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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

