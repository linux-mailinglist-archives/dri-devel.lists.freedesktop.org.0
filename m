Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D119BC66
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BDC6E9D9;
	Thu,  2 Apr 2020 07:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47196E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 01:25:20 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t4so698625plq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 18:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ECaKk1XEhaLeQWM1QY7b2cbJfc2H+NtdzI3cEs6W3bc=;
 b=e0Y8bY0Qfsg7n02ddZ8uiswipY9fuSgKm6X1sbnDAv/lfkxMia058WZBkqhK1Shm17
 rbhURDSsKfGqJjKOlUlUV1hPqO/r5cxIWXuo9ebuaF40Cwx1NIv7hgfZMYswHlnED/uy
 laXWmR2WR+D2bLl2xpsyRKvB0q1LRWQVbwujyCMO2IHN7v2HyE4eonQeMS3SafncKKi9
 a5LEam9Ct4DCAiN63J2BaN5vV43vEQlKajNeDrT0wioFYYpGMIJpTJQ8+Z2XAvX1LnzC
 wY/Y10MjzbOx4iwbFW0KTzL8oVlYWuoOPNiEIHLJXBzBwB4He1uIlnNFMg7OraR5KX3D
 xWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ECaKk1XEhaLeQWM1QY7b2cbJfc2H+NtdzI3cEs6W3bc=;
 b=DYqTHC/NNITXsm6vBC85KfZFHpmh1wBDy4on5Hk0Oup6DXSqVDGPNkDXtxZvbVNBeY
 +65If7JpYJOtQctrbW0X4A0zjdUh7LuS+kIIxUyEidH8Mowx0CP2LoXnuM7Awn09+h+1
 Vg7p4ATj0VX0ebe1iNpPYIuQ4Pned1keymX2k7XWu4VpvlJbYWNJcqZ96tOkRJSh6RUz
 oKsQsYjBGZW/Prg/We39xijLpQotzhPPEhgTai2MXMDu3ofxb7cyzbPlghpAsBT/jpyd
 Vir8WPMbn44rXwl25OJlHa12FOoFBHimg38LYjL37fzS0OK+mLrVwrqsLM+2rZqtj/DM
 ymTA==
X-Gm-Message-State: AGi0PuaZ3/zlPPXRHCXv7GyCeuvkIm8b1IyoD4FpwrPsgS1B/CiDa1h4
 C713xd1BJwbHUjR8zpsF8Yk=
X-Google-Smtp-Source: APiQypLOFU9FlGJw8iOOANTLu4h97F20JAA88jZyZ5O8imCDYlYaifG5zMltxu9kuj6+J1fWyc7dAQ==
X-Received: by 2002:a17:90a:36c7:: with SMTP id
 t65mr946992pjb.182.1585790720459; 
 Wed, 01 Apr 2020 18:25:20 -0700 (PDT)
Received: from OptiPlexFedora.fios-router.home ([47.144.161.84])
 by smtp.gmail.com with ESMTPSA id q71sm2516633pfc.92.2020.04.01.18.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 18:25:19 -0700 (PDT)
From: "John B. Wyatt IV" <jbwyatt4@gmail.com>
To: outreachy-kernel@googlegroups.com, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: android: ion: Fix parenthesis alignment
Date: Wed,  1 Apr 2020 18:25:15 -0700
Message-Id: <20200402012515.429329-1-jbwyatt4@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix 2 parenthesis alignment issues.

Reported by checkpatch.

Signed-off-by: John B. Wyatt IV <jbwyatt4@gmail.com>
---
 drivers/staging/android/ion/ion_page_pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index f85ec5b16b65..0198b886d906 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -37,7 +37,7 @@ static void ion_page_pool_add(struct ion_page_pool *pool, struct page *page)
 	}
 
 	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
-							1 << pool->order);
+			    1 << pool->order);
 	mutex_unlock(&pool->mutex);
 }
 
@@ -57,7 +57,7 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
 
 	list_del(&page->lru);
 	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
-							-(1 << pool->order));
+			    -(1 << pool->order));
 	return page;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
