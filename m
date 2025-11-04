Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E6C307DE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2D110E5AE;
	Tue,  4 Nov 2025 10:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PU5vG23J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCAA10E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:25:48 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-429b7eecf7cso3798930f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762251947; x=1762856747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JsUvrI+bVG+WlTg2GHY2axwhhFFNatFaC6KQ6ywH2FA=;
 b=PU5vG23JQ7CpvLY5cAcR917BupMEyCoYhnoktynL1Daxqz2mU709pW+bVP22RY8hW4
 Y9E40js7U6KVffNK16i+ctVgak4opHZi020agE5qewjSv6mTciaAfuGggLgVzZS+106f
 BmSM65I7ZThU12Vu3tRMYXraXx1E4GabYeEY5K/op2XmCpG+U14z823A7mB6WuH5TSbs
 YI8b4dGf6BbiWMoOOIekUqv5Ke2W21cHX50tDivXbMii1fSltbM+UtBp5UXxtsllO5j6
 OEVrMaXrLW69UVMzT2guDm4ku3xrKbPbelnql/fruIhIiuE5JKv7VEOQPZZtLjyfJT7U
 b2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762251947; x=1762856747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JsUvrI+bVG+WlTg2GHY2axwhhFFNatFaC6KQ6ywH2FA=;
 b=o8OmtAOhw1oXY5pPWNg9NGYie+K6/rFEDISY9zG2zk1FZlXxol5OkwpxxmplQ6b2YD
 MS8HGKEO5VGITFHB1hy3RYj29J8K87Vl52dHy8Vbc9Ejd1MmOI/YAewRQyJH2r+Db5Q7
 9Xb1MZC2RQhXRCH/IJXtB/xVUDTOMEeXuRKGZZ30UAfyxjwbn7KxzGeM7VOGCG/G727B
 5QkpX7UyGYmYH7tilw6Tsem32fFSihbPxi+xcH7so3QJtxvSK+HFj63o1w7kUKoAv42X
 ytrZwScMMZGpASDBm+CmdxizRMbfL3hozmamBxhYFQTqAKTOnGQdqIXsiWZLgjlRGYMk
 kdXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE0tG9hKN9+RAhnhvSOIcAAH35COvg+HGguM8UJSViSwXWyAqRwRL8gNEdXTszZeMY0Yeaolh/V8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk8+PDSpEIuwwNb5EIKkgaw+wYnm44DbV23kMr+EprD3aYq6c/
 bCoe4rcWRbkU1WAOu3dAsI2oxPy8l23mvhJlWSVjFUCQjphPlyr76F3f
X-Gm-Gg: ASbGncuR6TplpiAsyYtbLXwww12HesAdTl2gwZBn/GZDxb3XCy+UvzirY3ZyBdsDi6j
 ShPR8IxUu0wAsXrfyQ3SzYJKPTjBgJ6Mg2fVhVO/5uwHNealxp/tWDa7bwxyOfAMX0qV/XStq69
 6vHtcYLqu5IB5V8yJV18wbjNuIvvoIfrINvlXiHQylIy3T26pozE04a7NQL4yX/CDwWI6oGZshs
 YuC/5G2nseyzKq6jjoIf8ynFxJSm061bPAwXrjvSxNzy8f4wTGHIDHT5BzOSBJteWi8fifE9N8k
 C8a6bCwAdlJcyiKosDh3TxN+oNup72WkXI2cJ2tYSL20M/mLKr9jxOhTzyKugbNbCWB7/er9hsE
 4IMf1NIGnxKbKDnvDubWmSUd7I/EJE1eH/PF7AHJtSG9PDVlOvpmuwKXrMOi2IQ9beOpEfvIYRQ
 ==
X-Google-Smtp-Source: AGHT+IEFVm7U2UQsd537HSbXE97LuE8N/Q+Vgp/0beLP0A4bKl4h9zVL2B9q7Oj0nO4Hkut8N8AkMg==
X-Received: by 2002:a05:6000:40dd:b0:429:cfa3:5fde with SMTP id
 ffacd0b85a97d-429dbce00c7mr2483596f8f.11.1762251946685; 
 Tue, 04 Nov 2025 02:25:46 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f98d9sm3798796f8f.32.2025.11.04.02.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 02:25:45 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: quic_jesszhan@quicinc.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 quic_abhinavk@quicinc.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 1/2] drm/tests: Handle EDEADLK in
 drm_test_check_valid_clones()
Date: Tue,  4 Nov 2025 11:25:21 +0100
Message-ID: <20251104102535.12212-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fedora/CentOS/RHEL CI is reporting intermittent failures while running
the drm_test_check_valid_clones() KUnit test.

The error log can be either [1]:

    # drm_test_check_valid_clones: ASSERTION FAILED at
    # drivers/gpu/drm/tests/drm_atomic_state_test.c:295
    Expected ret == param->expected_result, but
        ret == -35 (0xffffffffffffffdd)
        param->expected_result == 0 (0x0)

Or [2] depending on the test case:

    # drm_test_check_valid_clones: ASSERTION FAILED at
    # drivers/gpu/drm/tests/drm_atomic_state_test.c:295
    Expected ret == param->expected_result, but
        ret == -35 (0xffffffffffffffdd)
        param->expected_result == -22 (0xffffffffffffffea)

Restart the atomic sequence when EDEADLK is returned.

[1] https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-artifacts/2113057246/test_x86_64/11802139999/artifacts/jobwatch/logs/recipes/19824965/tasks/204347800/results/946112713/logs/dmesg.log
[2] https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-artifacts/2106744297/test_aarch64/11762450907/artifacts/jobwatch/logs/recipes/19797942/tasks/204139727/results/945094561/logs/dmesg.log
Fixes: 88849f24e2ab ("drm/tests: Add test for drm_atomic_helper_check_modeset()")
Closes: https://datawarehouse.cki-project.org/issue/4004
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2: Added Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
index 2f6ac7a09f44..1e857d86574c 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
@@ -283,7 +283,14 @@ static void drm_test_check_valid_clones(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	if (PTR_ERR(crtc_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
 
 	crtc_state->encoder_mask = param->encoder_mask;
@@ -292,6 +299,12 @@ static void drm_test_check_valid_clones(struct kunit *test)
 	crtc_state->mode_changed = true;
 
 	ret = drm_atomic_helper_check_modeset(drm, state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
 	KUNIT_ASSERT_EQ(test, ret, param->expected_result);
 
 	drm_modeset_drop_locks(&ctx);
-- 
2.51.1

