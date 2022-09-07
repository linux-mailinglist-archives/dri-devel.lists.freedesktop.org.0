Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08CA5B05B2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 15:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008FA10E768;
	Wed,  7 Sep 2022 13:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C5810E768
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 13:50:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e20so20470467wri.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=X0NRHzznEcchSri4bCoSt9nkeOdHiBAQ/5Pmte/Gyz8=;
 b=ZPGwmIXS/RcexDoa8uMC7Qrips3KiSqFH87cKBNHhTwrJyIbh+Gf46xHCuFlLz+D3r
 QJzjxWDnL/3wJ7vvsBEY1Rran3hIRJ8T7Apfg60js9xFLWTwZC8gcSHlapGLt6euwmcP
 wgNbvaxAKs/vl4DLQhzcnhAGxCj/OE1Nk8s5SsnoNQWY6ejjOfEbQcy1ij3+q6g7/rNs
 TGJ58yWg6fzHraOr7SAeKQyA5u0e1YJddwnU+sTLMYwvUCsuWPWsUM8CsZYsjyyqnDWT
 yBluKmdQc2i0pGvqpwH6/P1b+GDm9tvhHj33kDMuK8pjZ951VJygmrra4x9ZDpFAx2Dq
 S92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=X0NRHzznEcchSri4bCoSt9nkeOdHiBAQ/5Pmte/Gyz8=;
 b=6HmxYPRa+SQShUT6+M097fZ7BtoDR37MHp9kN6RYR4KIgzplU8JrtSCskHLUxARFn2
 A9/m/nrnS+25zPKt3lEEUBk7KOTWJVzwiKdKMHmbel8TMrOfGFg3eVBusWtR3vJyik1c
 +PxRs2RRXdkCEnThngpyfPB2b7TSa7Me78s/oQ/h2iTJ845DIkpCkvLKDxfgP11Je139
 qd1bfwIKqVNvL6wJC6wZKOmXiQIBCVFfb/jXkIHmZgnFB8HEx0G76HApzxJ6DxvE+oyh
 2WJHcuU918wyXVIBppcP2Wu20sfNlaGtVbTJyjqZnhhUur0rQyQQ6XppCh9fcOUhqlqL
 C9Hw==
X-Gm-Message-State: ACgBeo07fHTqEO3LDl21ebeS1uoR7wgpD3A2ijbRCkIP1zsPJChCSWLK
 okywNtadge4P9RSrhxaKS7M=
X-Google-Smtp-Source: AA6agR4RIMi9kvzI07nLVq88uJNBG/3Xnr/HatQQvRnewBFmASe0IG6eGxKCiJYiFkdZ1OToecCSkg==
X-Received: by 2002:a05:6000:1867:b0:21f:f2cf:74a8 with SMTP id
 d7-20020a056000186700b0021ff2cf74a8mr2224870wri.344.1662558657922; 
 Wed, 07 Sep 2022 06:50:57 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600018c300b002206203ed3dsm18379698wrq.29.2022.09.07.06.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 06:50:57 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Bernie Thompson <bernie@plugable.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: remove redundant initialization to variable identical
Date: Wed,  7 Sep 2022 14:50:56 +0100
Message-Id: <20220907135056.679617-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable identical is being initialized with a value that is never
read. The variable is being re-assigned later on. The initialization is
redundant and can be removed.

Cleans up clang scan-build warning:
drivers/video/fbdev/udlfb.c:373:6: warning: Value stored to 'identical'
during its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/udlfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index c863244ef12c..216d49c9d47e 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -370,7 +370,7 @@ static int dlfb_trim_hline(const u8 *bback, const u8 **bfront, int *width_bytes)
 	const unsigned long *back = (const unsigned long *) bback;
 	const unsigned long *front = (const unsigned long *) *bfront;
 	const int width = *width_bytes / sizeof(unsigned long);
-	int identical = width;
+	int identical;
 	int start = width;
 	int end = width;
 
-- 
2.37.1

