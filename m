Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF5B19BC81
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15EB6E9F8;
	Thu,  2 Apr 2020 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73B6E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 01:23:48 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g2so719649plo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 18:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ECaKk1XEhaLeQWM1QY7b2cbJfc2H+NtdzI3cEs6W3bc=;
 b=lrnBX7I6IKNCgf1u3GPjWv9QoK7is/FfxG+LIXGzXoYz1Q+HIXh/mCNNMKcQjJRmQS
 2dBtTJMH24EcnO3L40rmSFnqUTq5oFVKQBhXCqzS8e3j0lJ3hznCoyUj3CjHiPXPnN/Q
 VLMKCIvdn3WhMDO54WQqDsUf2+bybLMzkzn9nRL30XD/sEozqQi77BBlKBuJ6FJXiniW
 7TT7bLBuDnoDhpTHg77HLwEqzqKv/2C4eKDrFfhbXqDCxcLGgq+FaU01o/cBd6nTlR1I
 1G9feHEB3Z1ObO1GSPb0sMl4d6re664SUkngnuJz9ao8jlwf7D0gJNpEEYp6mwKEqPJl
 x1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ECaKk1XEhaLeQWM1QY7b2cbJfc2H+NtdzI3cEs6W3bc=;
 b=MCOOToNSrTFB1ushYHBheH5PXS1WjAGYLrAckxB5vHkpeenVgKjdZqbO3dpADRVHE2
 5QOI73jlkL8Z1hUuySFsYunzCpdMbL1KgUigTjb1pFrqBJKRyeslIPRjt7XYfb2DP4mi
 htOdklERoclCEubW82Lb1EcnIb28hSCK3KzQcD/p4ODDlxwXRkFHwwUkW3fR/Pmpp01A
 Lmj/jaI7G4T/Dp0+eVFDyMnYaHcuZ1VbRmj7Jg7kg73V9Etpb9QesYoj/Xoyixr/GZfj
 wjf0/rD91OVVbeBn79xrj8+TroC6dTr2G49JanwdOpP5bl6R3yTTGN98SdUXYzl2mWCw
 NqXQ==
X-Gm-Message-State: AGi0Pua4meZi12V7VYo3N14ArMmLMEcRCxeGh1tnNE+BJRIOcyLaU8Ug
 pBR9f9HKEXkT5LTyuWa2YAg=
X-Google-Smtp-Source: APiQypKphdtygtFszPZHfDmC+v0cOhFzs1P9x5/bGH+iexQPlMgBXonWT55xdU1Z9qFQawYE5bgI5Q==
X-Received: by 2002:a17:90a:a602:: with SMTP id
 c2mr931092pjq.135.1585790627416; 
 Wed, 01 Apr 2020 18:23:47 -0700 (PDT)
Received: from OptiPlexFedora.fios-router.home ([47.144.161.84])
 by smtp.gmail.com with ESMTPSA id x71sm2424587pfd.129.2020.04.01.18.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 18:23:46 -0700 (PDT)
From: "John B. Wyatt IV" <jbwyatt4@gmail.com>
To: Laura Abbott <labbott@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: android: ion: Fix parenthesis alignment
Date: Wed,  1 Apr 2020 18:23:15 -0700
Message-Id: <20200402012315.429064-1-jbwyatt4@gmail.com>
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
