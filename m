Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665518799A7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A623112F28;
	Tue, 12 Mar 2024 17:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jJ/l38QA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFA610E789
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:26 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1dd5df90170so518545ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710263006; x=1710867806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
 b=jJ/l38QAAfKHsn/mMBgG2rFtxpXpPOSyBSKtOAvGtZxn28RQN9ILgC7wQacquGGjfR
 kLkXDkLq+8CwIdEpTjQK8WQw/fxNnJmGDbhWa7lbG17i7ZkdOtu2G/ZTK43lg0xsuzXt
 jj2vUuI+E79wVX3hYYMXJzioEWzTwddPhWHTt2dVmTEiYzHNmSPa+XdK4TUWIO526A1O
 EaU9wPZ1Nk4QQhMgJOqoueAF5V9igk492SMmKCcCchaj4Q42CIhhDS3JXh6sCXgB0x7g
 bW+brBfMIiyNvLo53Um3fG8KKS2yKF5jihg+3OBs4dMY0CHhhR0f3aps8RuDCjCTMh3o
 5jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710263006; x=1710867806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
 b=uzi5f0KaoKUr0smu1E7Cllwf5wmimUY+0ByWccsV0qWkybEBVWehL4aR4+eY+XGnjI
 c7xPGlfMVXOL0UltlnS0tWKApTNq40Ms0hKr7LYV629dORJ/jT3k1uOWAbQIBr1hgZko
 y8KbSFYt0baSTCb695CYKrOtv+ziz+F7+Lj/4VkRDRhjyN2fJjVyv9j39tKWKFnjYOKi
 kkrlwWIqOMKTwjKmAbYYHnqm1zRHeX0MqYyxIKFXqj/F9lmt1NMWm523aP0IfIZQ95sE
 kAKhoeYZpKVcXeuq2FIuacDDL4Ib1IhMfjgjHzE9UiFvxsj8WICC9aZ2f3Gyia9YWO4x
 kXsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUOi0VUnCNMdEijE5PNBOr7sC8HJ9cxDCi4LOTOEhN8seujI4BtqSBDBfl7/KaR6418KkGWLfhhUaM7VUnFRyTuFosZSV28hQbEcRNOoG3
X-Gm-Message-State: AOJu0Yxzgk4jeZa3UT//AxBmdTJtXMILB8dlTDVwY2FmmmFuXwSg4aOW
 RuJgh4hRU3pGOgknVJo1kBFB1ej9OQktuAF1Qrxif/pXLzPr0fDf
X-Google-Smtp-Source: AGHT+IFHgAu4TIvnFI5COGYb5tswxOQ5AvbfbseYntF0tu2SzSXjMyu1g4BetZFgaKzrp5WqY1rOuQ==
X-Received: by 2002:a17:902:db10:b0:1dd:8ed0:59d0 with SMTP id
 m16-20020a170902db1000b001dd8ed059d0mr179469plx.17.1710263006272; 
 Tue, 12 Mar 2024 10:03:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170902ed1500b001d9a42f6183sm6958740pld.45.2024.03.12.10.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
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
 netdev@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 06/14] net: kunit: Suppress lock warning noise at end of
 dev_addr_lists tests
Date: Tue, 12 Mar 2024 10:03:01 -0700
Message-Id: <20240312170309.2546362-7-linux@roeck-us.net>
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

dev_addr_lists_test generates lock warning noise at the end of tests
if lock debugging is enabled. There are two sets of warnings.

WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())

WARNING: kunit_try_catch/1336 still has locks held!

KUnit test cleanup is not guaranteed to run in the same thread as the test
itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
be called from different threads. This triggers the warnings.
Suppress the warnings because they are irrelevant for the test and just
confusing.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 net/core/dev_addr_lists_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/dev_addr_lists_test.c b/net/core/dev_addr_lists_test.c
index 4dbd0dc6aea2..b427dd1a3c93 100644
--- a/net/core/dev_addr_lists_test.c
+++ b/net/core/dev_addr_lists_test.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <kunit/test.h>
+#include <linux/debug_locks.h>
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
@@ -49,6 +50,7 @@ static int dev_addr_test_init(struct kunit *test)
 		KUNIT_FAIL(test, "Can't register netdev %d", err);
 	}
 
+	debug_locks_silent = 1;
 	rtnl_lock();
 	return 0;
 }
@@ -56,8 +58,12 @@ static int dev_addr_test_init(struct kunit *test)
 static void dev_addr_test_exit(struct kunit *test)
 {
 	struct net_device *netdev = test->priv;
+	DEFINE_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 
+	START_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 	rtnl_unlock();
+	END_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
+	debug_locks_silent = 0;
 	unregister_netdev(netdev);
 	free_netdev(netdev);
 }
-- 
2.39.2

