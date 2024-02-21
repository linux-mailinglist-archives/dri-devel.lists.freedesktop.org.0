Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C785D382
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECCC10E683;
	Wed, 21 Feb 2024 09:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sAfrc/IC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023AC10E682
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:37 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6047fed0132so98282367b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507717; x=1709112517;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nYdfpz73mSSQOJip1+ZL+ticY/JfIGD+cYhY46XA/58=;
 b=sAfrc/ICgjT2kbnhPOzg8pDsskofs1BoFvQVV7gmhJO0Hd09IUxaHmaV9R7QKeB2vK
 10yzIhuaj3ktfcE21dA2p1HsAY9eJJ/VRPh2k8taBpHzOxMYoASGpNNB0OsbzB3KY749
 Q3Fx7HFAE0BluMhMoD0rn38nKDpRB92hgy1Yl3SdZqFWW2IUCE9naqWyqNN0+4gBldst
 N/kdfYwaakFJ6megJVOpFjZrjmh6ek821sMlej+m2iCxaB+8iRe72RrkCFVI3vw9jnDX
 KSvPX+hBDNNcS/q8EuuR58tGeTPoZ1YFVi49qDyVMORnq2Tw/hyNO0WJ0JiytRxz8j2s
 zuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507717; x=1709112517;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nYdfpz73mSSQOJip1+ZL+ticY/JfIGD+cYhY46XA/58=;
 b=w/DEEd5y+M03iBqqbJAa+XzBEDnLrGoEcYVAj/onelYPS2BMhbwgIUNlle+2J0V0OG
 GSLEKyzcmvX1dmWy3/xf64jTRVc+xrFv6heNS5SwwW3LQSJ4ihHsMEIUv8eQyz4b+wK8
 6DXX6mXvHt2bNmEkPwGnFRd9N84l8fLCQ7wx5p9P/naRPALhNkGDSQACqsFcRQMPtb0s
 +ydqemotlwfKLSc3pLr1sJnMint4uYiRLAswDKJ164czVQ4OE5v0DxVwsBpRtqmkbR2b
 J/4KJLzY1v3kdS1T0+KQSfcof/sLPi/wkgrAeiaDd+nn/N0mgas0BBW1QbRGh3ZlDVXe
 +F4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5ik7SnqMyVpY8xH9h3lK2KUACSDvT4ZNqCz4JhCZ/WjiZo9qytEUz5/iN69b5vOtgo8YlJytEysUR1ez5iefo5TfBGvydjTiHLPaB3Z0m
X-Gm-Message-State: AOJu0YxbnYlinQU2Ybj+5eOQQKfxR/D1mETr6Q1g+SLh/cbqZHK2KdPi
 bLIRDBgmpbXM62wlhgVwkslT50a+4cZLyCvHMaDmZephx3gLpBWx6OfrpOGoYsPjR7K58JLNGfh
 bs9/e9PMjDg==
X-Google-Smtp-Source: AGHT+IFa/fu29ZmsVki9pPhB5PrTsNvq7jb5hiZUPefFb8PbN6D0cYOdutojAKCl/4VlBY7r3iK54hwJmjuHsQ==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a0d:d685:0:b0:607:7564:a830 with SMTP id
 y127-20020a0dd685000000b006077564a830mr3019910ywd.0.1708507717035; Wed, 21
 Feb 2024 01:28:37 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:21 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-9-davidgow@google.com>
Subject: [PATCH 8/9] drm/xe/tests: Fix printf format specifiers in xe_migrate
 test
From: David Gow <davidgow@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Willem de Bruijn <willemb@google.com>,
 Florian Westphal <fw@strlen.de>, Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

KUNIT_FAIL() is used to fail the xe_migrate test when an error occurs.
However, there's a mismatch in the format specifier: '%li' is used to
log 'err', which is an 'int'.

Use '%i' instead of '%li', and for the case where we're printing an
error pointer, just use '%pe', instead of extracting the error code
manually with PTR_ERR(). (This also results in a nicer output when the
error code is known.)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index a6523df0f1d3..c347e2c29f81 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -114,21 +114,21 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 						   region |
 						   XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(remote)) {
-		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %li\n",
-			   str, PTR_ERR(remote));
+		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
+			   str, remote);
 		return;
 	}
 
 	err = xe_bo_validate(remote, NULL, false);
 	if (err) {
-		KUNIT_FAIL(test, "Failed to validate system bo for %s: %li\n",
+		KUNIT_FAIL(test, "Failed to validate system bo for %s: %i\n",
 			   str, err);
 		goto out_unlock;
 	}
 
 	err = xe_bo_vmap(remote);
 	if (err) {
-		KUNIT_FAIL(test, "Failed to vmap system bo for %s: %li\n",
+		KUNIT_FAIL(test, "Failed to vmap system bo for %s: %i\n",
 			   str, err);
 		goto out_unlock;
 	}
-- 
2.44.0.rc0.258.g7320e95886-goog

