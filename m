Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974C85D378
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC44610E4DA;
	Wed, 21 Feb 2024 09:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aZNNDVVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0183110E674
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:14 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dc746178515so10656710276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507694; x=1709112494;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sajAUUIIQYuGe8qQNpfUtUdwcf5MUYWJWHx5st8lTqQ=;
 b=aZNNDVVkooGqF0VIHCgsHDDjf5Miq9XQTfhvP0nclgDDVOTpVDuJNzKizwa5ITqsrZ
 aGHHrPECgpb70NSyT1aU+qJCCNsidNtElTEYuhQJZ6QR5UquPQOcf1jd5ppOfvsLdZoe
 RLqA5nYteKPZwkFYOxPD2H4Z56//6it2zClWtg0ib1znP3KWwqK9SWJlnbpTpBOiK8ty
 t8QniAkSRPRdDTKtgAcyAE2FQP9v413BGopLADWGbgwPJYcq/7rVL2eSvxCGBCaosOfp
 nbIsLJBY2vtUu7zW7fTLXfe8UBZUscDvZVRIz4vy7AYxsuCry4epFTCn+Hz02EyGXi0a
 X0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507694; x=1709112494;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sajAUUIIQYuGe8qQNpfUtUdwcf5MUYWJWHx5st8lTqQ=;
 b=MqHJ4SinFVdY/OMxbCGyrE7728jXZ0oVOLNXfLPbL9VD5DrlftNPwYNu6ag8ZaV1yq
 tdRajAzPjZPhhKJ7LAb3o76c6r2hLu8lwPeL5jnQ4p4MkKwJNwbulsfF9RQU606Q8Koz
 /+i+FHItBRM1tMYWR4RKocexh5A5FBK+bDoU/QI/++zukmX7VFYJ0uBZlCrBdim7Ku01
 yKL11eeoEIJ4l8CdrxEOfGBNBLofcWKElT6fGaahIdvraGtrOiUdMVwY+CtvYrSRS0O8
 pr+SfOljl3wxa3eegVT8lVORRh9aGwuJd7IOiLND1KRgPlPcHEr6LJ6jAoORS4FBAXXb
 n4VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBwPLi8u1ZaxNW7m8pzM/AQnxP9vnMqyuY40b/qpiLSRK6MF0BfLA6oLiwIZeRlTry40yAoyYEfLRcsz0JRxjOVTbnx06+DA9BogYsjXjg
X-Gm-Message-State: AOJu0YztxoKVCIjUClAVQbsWay6W7K/3LCk58Wzx2TUI3nhBVqIGzFOB
 7Zh9SavdRsUPtqsUFp0lANkEvEup+eaNBNCnBbS63TGXXye1oUF7goW/utb1tlUEfan8NdchkQf
 I8VxXxRMLPQ==
X-Google-Smtp-Source: AGHT+IHXN4IhYXj6gHEWGA94Amz/iLtPWuo+Xnyc3GcMGDuMyWPS0mpLGyU+Di2N0vYTLFyOCsPHpf7g1H0Bgg==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:b192:0:b0:dcd:88e9:e508 with SMTP id
 h18-20020a25b192000000b00dcd88e9e508mr4406327ybj.5.1708507694045; Wed, 21 Feb
 2024 01:28:14 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:16 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-4-davidgow@google.com>
Subject: [PATCH 3/9] lib: memcpy_kunit: Fix an invalid format specifier in an
 assertion msg
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

The 'i' passed as an assertion message is a size_t, so should use '%zu',
not '%d'.

This was found by annotating the _MSG() variants of KUnit's assertions
to let gcc validate the format strings.

Fixes: bb95ebbe89a7 ("lib: Introduce CONFIG_MEMCPY_KUNIT_TEST")
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/memcpy_kunit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/memcpy_kunit.c b/lib/memcpy_kunit.c
index 440aee705ccc..30e00ef0bf2e 100644
--- a/lib/memcpy_kunit.c
+++ b/lib/memcpy_kunit.c
@@ -32,7 +32,7 @@ struct some_bytes {
 	BUILD_BUG_ON(sizeof(instance.data) != 32);	\
 	for (size_t i = 0; i < sizeof(instance.data); i++) {	\
 		KUNIT_ASSERT_EQ_MSG(test, instance.data[i], v, \
-			"line %d: '%s' not initialized to 0x%02x @ %d (saw 0x%02x)\n", \
+			"line %d: '%s' not initialized to 0x%02x @ %zu (saw 0x%02x)\n", \
 			__LINE__, #instance, v, i, instance.data[i]);	\
 	}	\
 } while (0)
@@ -41,7 +41,7 @@ struct some_bytes {
 	BUILD_BUG_ON(sizeof(one) != sizeof(two)); \
 	for (size_t i = 0; i < sizeof(one); i++) {	\
 		KUNIT_EXPECT_EQ_MSG(test, one.data[i], two.data[i], \
-			"line %d: %s.data[%d] (0x%02x) != %s.data[%d] (0x%02x)\n", \
+			"line %d: %s.data[%zu] (0x%02x) != %s.data[%zu] (0x%02x)\n", \
 			__LINE__, #one, i, one.data[i], #two, i, two.data[i]); \
 	}	\
 	kunit_info(test, "ok: " TEST_OP "() " name "\n");	\
-- 
2.44.0.rc0.258.g7320e95886-goog

