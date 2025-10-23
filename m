Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AD9BFF44B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 07:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4981210E871;
	Thu, 23 Oct 2025 05:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ermUGil6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9DA10E869
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:46:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so10036135e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761198383; x=1761803183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s+fuNZVjOzBfehguINbliZJdnuGZFQWDcRhaGc8hzwM=;
 b=ermUGil6MtUSj067BNosob73UOhcfzGEqIW6M1upD+TFcBDOyp/Ax+hTgFBZIUM5Dn
 usC3YXM5339C36eNBKGi0SCZxPlZMOs4hMH32g0sboaHne+lJD1lnlmzZ5+SgjdwQB0I
 ThcPEnGcIaKSUIXzTL4vgUDDH5r9nR3CZmOOBjtV3DiI7cWZbxdesgOGTzUhlJZKiOjb
 DnOl+Pu21G3n48Y+ZF/s9VT/oxGKZ6lqO8L4wWPJ1mZJcxde6ZtTtRFnfzUyEB8AT9MS
 wOxnKpctu7UDYBgzxwr3N1EJMbffuv1f+eI0DPUGAPdRRdnGaHgtdEtxV+uDNZMBuzxH
 Z18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761198383; x=1761803183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+fuNZVjOzBfehguINbliZJdnuGZFQWDcRhaGc8hzwM=;
 b=RChrBRxuKU8SAzR5oZQ4LKPY6bVgbfV/oRi2QTiu8vx2er6aW13lDtE25nrOP4Vyoo
 +r0qpwJc9zK8lEiWwZhnUafLj10qVRJfxVaa991Jx6+qbtEUxb+PwLDlxTnEV/aiHKZ0
 EFPRt+cJuIGv5oQVg2B0/Hypw3mKwnuFbG2rclfcp0RNFUltAw8schg0PaWmjsVrtkhy
 GQAgVH5ewkyGUNXxlCSz0WrefvOTVeiTIs3yWVhowF6oAgkA2Yb0121Wm3/BTD8e6DP6
 cXg+ScB8CcRp7c3VTVwD2qS29vUYudr8ihoYGd79livB3eO9muz6sP0utxZUVgpwIUbf
 prfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Ce5hCI8tQoaSZQTzb04DrD/0Tb82Gtu2grECVl79xefPFi30kSpD/B1V4PrujOAjd+ibQW9UPY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo4S64cMnFxWAgUpLTIGd5NgfY6micTlYULYym1nVNFjPdbTr7
 CnCIzx0wpEtb1aIWKPQjOD64fBwGHhJvQC1OUXworYuiKlANclsU595a
X-Gm-Gg: ASbGnctPLfALWnKU/aYV9cTSo41wHLPgmnYiFXJycfTavQZADEaAq+ZPxEzV1XHP8Bn
 qi0c5PzLSU3dcb0a3E1HUKebortS8MRv/xFLD3mXpOncrbe9Fxzs7pAX4tta+UTOG6Kl2n8pA/O
 vmYMBE4lQHqq2kuJpyzS/y9rWc0ocUbkS/pEWrh2fqGRDgPgbk4b/LTuFLnY+r9Ci7ItTYb94Pe
 ty4vwHTRyJ5F49Q2k0n5xyGdD9mhvdkMjGLhKmQ8AtdWo4cejFXyEzitaIsBPH/wqvgaVUU1rC7
 O60diSka9t8ls1AN2TvWD97vL4YCV4LGrmbQmmxYVprpQtZbq7jrV05skaVqU301yane9qPP4ac
 j8XwPkL/hpYkpgIBs593WTBALxbzWOFTKLVyGrEWGm+T4PjvumSs2r5AZTd7DUlXfIC6KsdNQu4
 tQKROQa7TI4w==
X-Google-Smtp-Source: AGHT+IExgoQzmmle3sIN1LH12hgZAmIRTnFnwVZCgFRS0GsdJQL5qbeVch7bnMJqPYEKU6bE9Moc+w==
X-Received: by 2002:a5d:584e:0:b0:407:d776:4434 with SMTP id
 ffacd0b85a97d-42856a89d28mr3012068f8f.30.1761198382987; 
 Wed, 22 Oct 2025 22:46:22 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496cf3b51sm50414785e9.9.2025.10.22.22.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 22:46:22 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: quic_jesszhan@quicinc.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 quic_abhinavk@quicinc.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] drm/tests: Handle EDEADLK in drm_test_check_valid_clones()
Date: Thu, 23 Oct 2025 07:46:05 +0200
Message-ID: <20251023054614.6267-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
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
2.51.0

