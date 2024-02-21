Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B377585D37B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70E310E652;
	Wed, 21 Feb 2024 09:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cPDX3ks7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7248310E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:24 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6047a047f58so104742807b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507703; x=1709112503;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6oh8w0yc8LvH1yvSHI8zU+2R7q+ewyvFM42Am6pdhYA=;
 b=cPDX3ks7b/yKJBo8KX35o3UB1RnqeTpaaGv1TlLxQ1pYn4USJ82e8iOSsPWO81Yb3K
 NqmPRksegPt1HnD7D5ET691TwidH61ecEvm93TNt8He1PGOk/Qf1tXB0CmX9sTX6Gq7Q
 asYeDkUXC1ypg4+VSjfb222LwmXqkGblXF4N3HI+M/Vrll81pfRcivsyQj+eqDYOqGVH
 Jo/HGDai/UsbH4lmpi/bqlLSC55q7UpBgjohiDWDbraB1ZghGddS/6WkOkY9+8CV8O5p
 xK9cMzQdWq+nTU43aO9cyprHGSaDpsZCt5qUdObjzunwGra6KHTYTe6LbQ+8FFwzTGgT
 q56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507703; x=1709112503;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6oh8w0yc8LvH1yvSHI8zU+2R7q+ewyvFM42Am6pdhYA=;
 b=GwzQ1SK+K1akSIdFy2aRM0y6VfftfhDQ/iYGMnsFFoc1ek8AnUjOih88hy/NYBbbal
 0Bj5gg4EL7TuP2c6x96jmXh0quKCD9bRn+n9SjgBX5DiDnNFYI6Ogo1QVPqo7ZZZZ/1t
 Q9rNmfF2T6lY13I0Uh33fFTKLEIxA104cbIdRKnT0rYR58kK55M9fh6QtVEoYWaeATen
 wcZuq6gvITuc/TAkrSlxOa/7pg/WqeEd4seRUGmy6yeXAWjnPs8kzNbizOnynSIx94fy
 Iq3zzgF4/eXHqc9oc/at/uKE7LgEAdOj5Qz8kp7kL4YoFRIqp6sryxE7+mcUHEv6mAZq
 HetA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1iQUqB2pZUMoiqJjDEohM/Pz57mAs3WvjeCIzJDZ5OJYNAP7ZLuD5/D77mT7JExsOLg4jDELB/J0xZ/kZ+Hejkb3/wg4YCWqDA4v4wdVn
X-Gm-Message-State: AOJu0YyYwEODlMmr3KppsdKt5QxvnelMOdJNaXXl2B3s9ogl0P+XmS17
 Vn/8kCag1LlTjyR7Dz8ttxmI3fHdIM9bo/+jrmcvWQ/My/7+j1dKa9bf4F7G3Q4YuTLs1sdtQJ7
 tB2EEOr7mag==
X-Google-Smtp-Source: AGHT+IHAVxan3IBdGfT14ZlxAMIfrkzUxv01ETxOcEryam+Wji8MbAhrWelAxlNmlmHCaTgl78twQW5eAT/4hw==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a0d:e8c4:0:b0:607:cd11:5464 with SMTP id
 r187-20020a0de8c4000000b00607cd115464mr4264994ywe.9.1708507703514; Wed, 21
 Feb 2024 01:28:23 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:18 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-6-davidgow@google.com>
Subject: [PATCH 5/9] rtc: test: Fix invalid format specifier.
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

'days' is a s64 (from div_s64), and so should use a %lld specifier.

This was found by extending KUnit's assertion macros to use gcc's
__printf attribute.

Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/rtc/lib_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index d5caf36c56cd..225c859d6da5 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
 
 		days = div_s64(secs, 86400);
 
-		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
+		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
 			year, month, mday, yday, days
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
-- 
2.44.0.rc0.258.g7320e95886-goog

