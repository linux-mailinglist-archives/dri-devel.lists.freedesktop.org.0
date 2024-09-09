Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE71970EDD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C966310E2ED;
	Mon,  9 Sep 2024 07:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3RikVgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F8110E2EC;
 Mon,  9 Sep 2024 07:08:38 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374c326c638so2945562f8f.2; 
 Mon, 09 Sep 2024 00:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865717; x=1726470517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
 b=J3RikVgCmcjg0ETCMAAzsQIzYN/lY/ZqQOSA4JS9rjEeXhFex//8QFRYENpc1MJgh5
 U1jniitBg6tpDG8efbiCFEBeI+9enkHBU/NiUIohCWfsIh4jr8ccjWPjAdK8MKZNVOWV
 fiBAAU/G81FDNtiakqkjyGTTmb/uxKxXV7313gVLOrjlrQLW2gjDZU/GENNm4cnQuzQy
 sJqFFmYEm69DFjM1BLoCvhUS93pOu0dmTVmfEI8l0D5AzsnhTyzfkXGu6xrx4pl+CqAY
 UlsbDgzoTJJ0DBzekZQRdCjKp0Cs2R6BTfKM+7Kw0AXjQEovh7rN1KTe9vlaxI0geX11
 eP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865717; x=1726470517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
 b=phJvh0YkR6dL5lFhwflOOUjPG2XBZ/6wYO71VhFptctIYH0ahuE6ybX9OdpUi7CC2G
 kYVJCEwJdprVDyb841FxBQElKlFZ924COTrv2xEcBdRjHtoZu4+DvG8PBOGTd/utu9m0
 AKmG8sAhpXGmB0hfEL9rm9+CzXlO5FNphoGmAY5UwPwU5m9C5xyVZFjkjN41MISPt1DN
 pld+m+aiyqh6qR7BpjRqLfBXFJe28aEgwwDEQidbYgdXNB65+wovUIjC9SFwQ81eVquo
 tJ1tbooLxQi6l+YITBjNgFRd5z02heM7op8A8EcUYry6H8xrCYxmJLk9/OYtW6VfzUZR
 sVMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6cOPLB66XrG+RRiVHys81MurcqDdho+oStvKrFEwixx2lS+Upy81zVEdYNv6NePQ7TOuLXuMrnNM=@lists.freedesktop.org,
 AJvYcCVIyGtv/rU4DFbIt/2axtLed6s9QuDR7tw2g7GowfUzzLUeqv3RuN10G7xpe6H8gOqOmtBCIGG/elQ3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+HYdxbk8Kk9A5gk/5NFgMuLBdMioXIL8hpjN8CQla/KgRaKHD
 2+VaD3aZ4GaKBGYqhssDsS8Qk8+1aDlIFfRGOUpzvajUKDASjxZnbCye38K/qLY=
X-Google-Smtp-Source: AGHT+IGvCGyXAe+yX+BYaSRb/hI+Ilgk0idYw90HidcMT2AOiWBbY9IJ69nJCH4grLww7mZj552B4Q==
X-Received: by 2002:a05:6000:4581:b0:371:9377:975f with SMTP id
 ffacd0b85a97d-378895d4740mr6131926f8f.25.1725865717197; 
 Mon, 09 Sep 2024 00:08:37 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:36 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 13/19] lib/rbtree-test: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:27 +0200
Message-ID: <20240909070742.75425-14-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/rbtree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index 41ae3c7570d3..8655a76d29a1 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/rbtree_augmented.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.0

