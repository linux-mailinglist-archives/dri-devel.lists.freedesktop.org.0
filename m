Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1BF85D383
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D0C10E4F7;
	Wed, 21 Feb 2024 09:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="q9woSA6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A868A10E682
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:42 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dbf618042daso10802698276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507722; x=1709112522;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UtSX1a4twDclpP0XCHq3xRlg28EKI7v3CFBboD2ALTI=;
 b=q9woSA6z3OFhNshtrJy2C+p0cuBXQHCgZhZcPUOkN69SCrBZggDP4dh8ZWYQ49B7xE
 CYNu5MAHXdA03ImOwMx4cLQhFJd6bW7/j8V2qLOlW6YZ9Ym6pgaZtHHYJGy6bhcr3o+d
 mZeA6qRYD6NSBa7hV7XD77H8LJgr0hnxH0P7yQiJrLe2DS5fxRBPdKaKydOa1v+odx6k
 /k4GRRo9HME1+RDGLhHAcp/cweLmurXJ4UES2fSDM/+giobT8p0mPBG+acfuR0dlAdyS
 c465C0FRb6dt79vYKqWQgGgNjWXkrkChAo5dPHO2LjppylBFsv9yAKIzPg8MFFnjlLtd
 7ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507722; x=1709112522;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtSX1a4twDclpP0XCHq3xRlg28EKI7v3CFBboD2ALTI=;
 b=tVa9ioKFsVrolGRgBX7CQJrwLrVexE1k3HAEfUOXwf6hqArtTrNZXhyKEvru5PzNXg
 ELZjn7sOfn9T8HzEWi4/kj28k0vfyKE/HlTwKjmPRkIeh/3NBthQdOAsdkrxHlHltKYw
 AUxGLXJfH7ZS59tv/0IxsoJmGGNwMv5pJff4Rtzlx9umGTLEPJcSXn6/MMPNFPqTmB6V
 iaWc4fsJd01ima7VA2iC0nv5PcstsGtx4FgBQhiF92UqUdqKtpIEshlo5GDqbiMCqAl4
 mgrt2RoHUTwoDlQ2irZ+L53VLZTfqgXLlBiRlKCmYxfvKuXpwBV7oU4XHOaGm+1VAXir
 dDcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLi5JVFw9PnR06l7hY/tB2egDWiy4rCPP7Iwb1fy3s4yhRhfhwD3trCGP7hV1c4ZoMq7nOoiWlfs/3e+uF86WM3EXcm/qmj3DEXBAzW+xJ
X-Gm-Message-State: AOJu0YyvMtrI4jzZHd9P1Ung2tOXW2kS54/B5xJHKFqQmDH1rvzODX8c
 pkO87BMKE9/ZYs1mvHsIozuae+HozqNm0e+b+aQ8Ac2N0UyWYcB+la6wD9xgSlmjQfeD50wpkYB
 AvqIK4XT1ow==
X-Google-Smtp-Source: AGHT+IE+u4BHsnTY4zBV9uwlLnSALfH2VACViqUl+6ZdsI4Ll1wRpv0qUeWfBww+/YNGvG/0sUR+LBCAIAUp6Q==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:4ce:b0:dc7:865b:22c6 with SMTP
 id v14-20020a05690204ce00b00dc7865b22c6mr618682ybs.8.1708507721736; Wed, 21
 Feb 2024 01:28:41 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:22 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-10-davidgow@google.com>
Subject: [PATCH 9/9] kunit: Annotate _MSG assertion variants with gnu printf
 specifiers
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

KUnit's assertion macros have variants which accept a printf format
string, to allow tests to specify a more detailed message on failure.
These (and the related KUNIT_FAIL() macro) ultimately wrap the
__kunit_do_failed_assertion() function, which accepted a printf format
specifier, but did not have the __printf attribute, so gcc couldn't warn
on incorrect agruments.

It turns out there were quite a few tests with such incorrect arguments.

Add the __printf() specifier now that we've fixed these errors, to
prevent them from recurring.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: David Gow <davidgow@google.com>
---
 include/kunit/test.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index fcb4a4940ace..61637ef32302 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -579,12 +579,12 @@ void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt,
 
 void __noreturn __kunit_abort(struct kunit *test);
 
-void __kunit_do_failed_assertion(struct kunit *test,
-			       const struct kunit_loc *loc,
-			       enum kunit_assert_type type,
-			       const struct kunit_assert *assert,
-			       assert_format_t assert_format,
-			       const char *fmt, ...);
+void __printf(6, 7) __kunit_do_failed_assertion(struct kunit *test,
+						const struct kunit_loc *loc,
+						enum kunit_assert_type type,
+						const struct kunit_assert *assert,
+						assert_format_t assert_format,
+						const char *fmt, ...);
 
 #define _KUNIT_FAILED(test, assert_type, assert_class, assert_format, INITIALIZER, fmt, ...) do { \
 	static const struct kunit_loc __loc = KUNIT_CURRENT_LOC;	       \
-- 
2.44.0.rc0.258.g7320e95886-goog

