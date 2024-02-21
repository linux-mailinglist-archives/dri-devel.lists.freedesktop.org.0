Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5304485D376
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDDF10E4F8;
	Wed, 21 Feb 2024 09:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nOXzTG+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF9E10E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:10 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6082ad43ca1so50800377b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507690; x=1709112490;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NeQowu5ygMbqfsZc+b92OS1HjirLANcwpz/yagEqKMA=;
 b=nOXzTG+y/H4sMZ952zd48wxhKvVyu6iky1TCnDEejRdX3vRuoPZVhD0cCYMNwZcaEv
 gmDHZKf1mVebAbrrdy4f7XL4I0KhEQJoOmownLcQvGPM6R/2i8oI+JzmzR9JdOT6Fdjt
 EORSkB4QOLSD+teKLIe96K8ffTckGc9s37No+2jirMVWniqHaeOSR5BeCrGSxEQD/lZ9
 PCbrH/vPzCgk9PPfeuvd/za+VDfZ+HvdAZ3mMB7GnwAt6Sb+C0A1WurvOfhdRRkVjsvB
 J320Tx3hBNn+OUvTYA1W4aiOLifDhd6//HQvhkSTSu+Td/X+JjyDFXMoe889ktH1mwEp
 2pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507690; x=1709112490;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NeQowu5ygMbqfsZc+b92OS1HjirLANcwpz/yagEqKMA=;
 b=C63EuvWpmJRMBoheSKtrlyQbKcZEqGiDqpOBjiG8zMELsFN6fhvil8WkAww7km1Yck
 Xa0XHR6rCbgZwCZ1LPQ8xvACors+twbRw5rr1zmDCFj3Ed2dUbipfFP93JtyAbPdI8rv
 VrjQTxDvx9puyi4IQW3rWPqp6A9IwJth5vMxVqDDrpxHw7lbioaZ6D14Thu7lQR3QZq2
 yck7rzVZ/A55PAfKBZykHrwocC6Gf94HqeP2BbDNm6z22SXtlxhLYLdIbvHDx7F8uHGV
 gVkJvqhLXnZUwHQ1dow4FQSH+oipCHh10W981KnHpspoNJOgj1pakwIP1tGJG1nAv/A2
 dFpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/gwXcWXgym043+0NWf3CGSw+lv08lnsMOKk0T1wLMoZIS3UPyOaqmh+aann1rPu4SIq/OOzDW2f1oSNQR9tgNzeL1wkzL90tJdVkDEXSF
X-Gm-Message-State: AOJu0YxK9twgzCg975nnnbciVPJ/erdAykI5zjxfe9JptHjy2xIPq0pb
 rpzR8Gr3hMdMwjjdA32mdcKVIPKxe1hz6LKWxLrHgUFy9+eV87PKSOx1lQeCOhn8kNjLZobVlpB
 m1MAMh8qClQ==
X-Google-Smtp-Source: AGHT+IGKmHDvlseXRZ4Y+4ut8ocdYLBEplEGH+dd9qwAR6JMHTXNGTF3psUQFQki1OvQHuO3rgwKUwj3z7weqQ==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:1001:b0:dcc:79ab:e522 with SMTP
 id w1-20020a056902100100b00dcc79abe522mr728743ybt.11.1708507689903; Wed, 21
 Feb 2024 01:28:09 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:15 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-3-davidgow@google.com>
Subject: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
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

The correct format specifier for p - n (both p and n are pointers) is
%td, as the type should be ptrdiff_t.

This was discovered by annotating KUnit assertion macros with gcc's
printf specifier, but note that gcc incorrectly suggested a %d or %ld
specifier (depending on the pointer size of the architecture being
built).

Fixes: 0ea09083116d ("lib/cmdline: Allow get_options() to take 0 to validate the input")
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/cmdline_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
index d4572dbc9145..705b82736be0 100644
--- a/lib/cmdline_kunit.c
+++ b/lib/cmdline_kunit.c
@@ -124,7 +124,7 @@ static void cmdline_do_one_range_test(struct kunit *test, const char *in,
 			    n, e[0], r[0]);
 
 	p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
-	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %u out of bound", n, p - r);
+	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %td out of bound", n, p - r);
 }
 
 static void cmdline_test_range(struct kunit *test)
-- 
2.44.0.rc0.258.g7320e95886-goog

