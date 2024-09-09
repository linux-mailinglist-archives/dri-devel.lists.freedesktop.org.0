Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6610970ED9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539CD10E2EA;
	Mon,  9 Sep 2024 07:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="az3mlxrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE2710E2EA;
 Mon,  9 Sep 2024 07:08:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-374c84dcc90so2297128f8f.1; 
 Mon, 09 Sep 2024 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865713; x=1726470513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
 b=az3mlxrVCeZ+e0it1vGYHdoVdwntTXPNLVhq6WH2QJzIjgwyMRPPdnB5I6AFPfTy2E
 s7M5WuyYg6J+FAEUiZQ9ZON8gP7dwms7htt6raBVanqYlMycAwQnFG+H1VsBxMmLsn9d
 oixJPYJ45/t/2Y2PB78sNPQwgvW3vUmqmSiizJT0NfRzcaxoMX9x3fkm7P3/J0z+3X10
 gdE8Z519f9oZgsPNFS1e2h13ETQPI48HVOXsG1YiSCOBOWwgLh3RbmRgre8xe2I/xr3+
 xTipanD2eCS1/EN8MfDcd7+V0RlTcY09FzbFBDcwD5jpn8faASVMb7rShENz4ax5WYuT
 bX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865713; x=1726470513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
 b=UDYMYdiy4eR7CFvm43mEAZijA4aq0cUubph+tu93kjHw3WBsFyaTp/0QulEcWhVAuY
 Aa7hzs5szGiJdwSI/woaCH+Ux7smeS77h01Q8Uat4Bdv03Kaee/VMAxt4FMRE9e6q9CS
 5OxRmfr9xrg1J6NBRIS/5VVMUEC8zPnvsvi2QGswt4RuIH73vH+zw4WJZhMP9I131mOt
 O/osySqUGHaJGML1PizpnGM+ZGyGZ1LnrGtWgnSK6qQ2PM4L2O5sFV4StiB1V6sOoC7n
 H1lnGIuxDv//MV8O8ML6M4SZTsBa37jldL6pVvKFfjSuwmuH1qfSRrXX4SApCawbRYs7
 j+dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIer/FTru45HYexpqyUspKlTbN8qq0UJBdBEIh0u3cF6m7NdGms3RM9XTuJzM3yTlea2MV/wIIGVE=@lists.freedesktop.org,
 AJvYcCWsuLUQMLxdyy8ddmkppTynHupkP9gZH/OR7B9YuljZAl/++VT3v3tPn/o4HLoiu9vNB/ERx1X4tgmq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbFwj22zi5UI24WmJAOa9RdnGeIK+aaGXUqlx29LkezrT8HOwv
 rNlC9ffR06r9hohv4j+MzexhPyCJRo/UYinGdWu5to9xtcDL2jm7
X-Google-Smtp-Source: AGHT+IFi67K8QB4r8x5dBm9y5325f1H3SNjB1ndU/CGDMv41P1K19WzeQTZI+70hfCKm0xevGHxxxA==
X-Received: by 2002:a05:6000:1143:b0:371:87d4:8f12 with SMTP id
 ffacd0b85a97d-378895ca2e1mr6475478f8f.17.1725865713228; 
 Mon, 09 Sep 2024 00:08:33 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:31 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 10/19] lib/interval_tree_test.c: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:24 +0200
Message-ID: <20240909070742.75425-11-ubizjak@gmail.com>
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
 lib/interval_tree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index f37f4d44faa9..837064b83a6c 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interval_tree.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.0

