Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B31DA363
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 23:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBA16E091;
	Tue, 19 May 2020 21:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625256E091
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 21:17:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n18so751329wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 14:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrBghAL5CPtw/Nggrgh37CwRoMhdgtGcnzOBXGkN41E=;
 b=TgjdqjgkUPa75MEFE4xAFZFGv1E1DgFAC1F82WUpDVPTO7iKyR5qdX/dQ3dxhgXBZj
 LCrQzmmhWU+8qSfEzR3npbQM/arN2gLGFLlhLFRau8KjsmGrQxFizIthZys91trAvB52
 ssnpc5dPKoJeMGh+KRsxIFBQ/M+r5tFmF6qTpqtG/tO0kWjQP/tKTgzHOncPEWuuA4+D
 ggHEXQzDebpEh8Z9pXVmJFK+ez59x0jBI8hwGsrEi1CMkdNaGgC8uhJOh3BkStUqPitK
 DJfRa7Rk0qlN7hhfhTf0hRhsT2h3FFMyzVNMgMDQH3aMtlDgaPTjpGOdo9XnIKLhh1dN
 wA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrBghAL5CPtw/Nggrgh37CwRoMhdgtGcnzOBXGkN41E=;
 b=mNQfsbwqRefS2XGoNYBFyvzYa0WohWyj7SzkxzP4M1lVe1ItjcrLbmlxG5pIqZHSVD
 VRAh5pz2lCPPMjQQjtxpN1UjYj1RAo5A695cCq3fR5QPjOz+RME1aB/u0WeYtIbbjrdU
 iddeUbnlNQhLmQxRbIlSqO/Vwa4KR/wabY8d31IdMtlDNezAD/D5EqUNnJK73x0koiG6
 2LTyQ4ItBNdh3ghJZM8SzqcX6uU8BeemP34maZoeC6sdiNKDp9HCiYKf9jWJQiYq8rS2
 j8eNS5QE8WO5d+zSvkPQEY2g2dJeb1jKmabLPgh47pUG5nn3wehda+QV/BNjbsVkx2pB
 OtNg==
X-Gm-Message-State: AOAM533TCyVPBD2jqvsvVgkfVv6FfMAN84TEA1FM9m4qxjHhVCWpxRG8
 jqsOrtwDVxacAAxU6OqkzTjQ/RU6
X-Google-Smtp-Source: ABdhPJzNoq+nTV4mzeUKHdB6/aKVEe21pblSTqDQWAVzZ699ciNkqr7KBNv5A61nhuwdTK5d80UkiQ==
X-Received: by 2002:a1c:2bc1:: with SMTP id r184mr1360259wmr.58.1589923063698; 
 Tue, 19 May 2020 14:17:43 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id z9sm710425wrp.66.2020.05.19.14.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 14:17:42 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] linux/bits.h: adjust GENMASK_INPUT_CHECK() check
Date: Tue, 19 May 2020 22:14:52 +0100
Message-Id: <20200519211452.422179-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519101320.33495-1-emil.l.velikov@gmail.com>
References: <20200519101320.33495-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, emil.l.velikov@gmail.com,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently the GENMASK_INPUT_CHECK() was added, aiming to catch cases
where there GENMASK arguments are flipped.

Although it seems to be triggering -Wtype-limits in the following cases:

   unsigned foo = (10 + x);
   unsigned bar = GENMASK(foo, 0);

   const unsigned foo = (10 + x);
   unsigned bar = GENMASK(foo, 0);

Here are the warnings, from my GCC 9.2 box.

warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
                            ^
warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
                                        ^

This results in people disabling the warning all together or promoting
foo to signed. Either of which being a sub par option IMHO.

Add a trivial "+ 1" to each h and l in the constant expression.

v2: drop accidental !

Fixes: 295bcca84916 ("linux/bits.h: add compile time sanity check of
GENMASK inputs")
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 include/linux/bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 4671fbf28842..02a42866d198 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -23,7 +23,7 @@
 #include <linux/build_bug.h>
 #define GENMASK_INPUT_CHECK(h, l) \
 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
-		__builtin_constant_p((l) > (h)), (l) > (h), 0)))
+		__builtin_constant_p((l + 1) > (h + 1)), (l + 1) > (h + 1), 0)))
 #else
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
