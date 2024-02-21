Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01D85D375
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEFE10E4E9;
	Wed, 21 Feb 2024 09:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OHSicdGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7B910E4F7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:06 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dced704f17cso2525042276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507685; x=1709112485;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xu+inTe2LF3ynuuv7W7Ho6VSuZooh3VEfNa1s4AiQic=;
 b=OHSicdGkKTrzTDALuKFHYlRlkX9U3oyfBg1cjgEVIkBB9HNoND9vJN9B8PpppM58v4
 1iEXgnGXhVwtm09G4PawVF0qao4A1iqjz4ihN5+teZMTfj5QWf6WBDyXv9txzEe08t0P
 pNrCBoUiO4PBX4J+ETTDzqQZTchHfGQNW9/vKP1xPB1So0T1K4HcbHZXBLaFHggA6fQT
 /3G1xxkylo6A6c1jO6NORdhhnNqgNd1Y2ofvZhqb4Q2aTfxsqaXd4TAnl2K0Oj7RSyzu
 Xb8TnT0u502vypRMYWwJLx1yBrLR1qhRDw8rI+h2zs/9/JSeC6GLHBW1lROSbWuwMQhJ
 x1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507685; x=1709112485;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xu+inTe2LF3ynuuv7W7Ho6VSuZooh3VEfNa1s4AiQic=;
 b=RZCR+mBoERsxRbCxRiNi1gfzhvhbFWq7ZcRobuomFzX9rbdhMrKg6GhLbmPdJveGiF
 rOQP1Yiqm1Exa3o7EwCQm4juf34zgch4M6GxyQol6JRkQmqj9Fj3lnR5GGorK57AaaG3
 5GahRDYWWOQO8k7dCaZR+PXUhAf0d1opZtY3foOtKvbwGHPyNIQRvFZPvDCankMilSGB
 CL3JVABhg38I4KjHVOmFuTtBALAws0IKdw3u96yVNSRzXPqqsfnJQV1Dgjn5aPbr5IZi
 1aEqXlYzRAaJNNaLyJkDhumk8S8jtyA99I/Bp+eXylFXTs1TJUbJPrCUkWtzKYZhXfoA
 dEUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVzTtHpXAhpwwcCuKFCVVTPxS8fj7g12Wr5IzSUXrtTmyQ/CUpfhcNkqElytdyiXBmrq6mkPwVuDf7UX9KNUkhRN/QmSwNX68E9W/2iXM6
X-Gm-Message-State: AOJu0YyoInHJkWpjFgwxZUSjdz5uVOWaDO8SLhRYjPeuRjx6sH1PQE9x
 JvFx2CVKrhHaC8TkFZXJ8woqABIxxFEDgFyY9lltUmcyMrDmDTxqe1foAVHYpJ43CD1klneH2R5
 XB7U6tdHpJg==
X-Google-Smtp-Source: AGHT+IFRWRv9O0ZJFWIQABWXYSjWTv0ZUYrlwMd+3gPavDYER8N+pRX59ZNK2IiQ8Dvkd5y8wLfb4lO8UUdSxw==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:1005:b0:dc7:59d9:7b46 with SMTP
 id w5-20020a056902100500b00dc759d97b46mr624383ybt.3.1708507685189; Wed, 21
 Feb 2024 01:28:05 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:14 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-2-davidgow@google.com>
Subject: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
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

KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
but passed a random character from the filter, rather than the whole
string.

This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
the format string.

Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/kunit/executor_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
index 22d4ee86dbed..3f7f967e3688 100644
--- a/lib/kunit/executor_test.c
+++ b/lib/kunit/executor_test.c
@@ -129,7 +129,7 @@ static void parse_filter_attr_test(struct kunit *test)
 			GFP_KERNEL);
 	for (j = 0; j < filter_count; j++) {
 		parsed_filters[j] = kunit_next_attr_filter(&filter, &err);
-		KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter '%s'", filters[j]);
+		KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter from '%s'", filters);
 	}
 
 	KUNIT_EXPECT_STREQ(test, kunit_attr_filter_name(parsed_filters[0]), "speed");
-- 
2.44.0.rc0.258.g7320e95886-goog

