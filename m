Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4382AB1E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E16510E80C;
	Thu, 11 Jan 2024 09:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 058D410E80C;
 Thu, 11 Jan 2024 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=grwVG+AmXoGKqTy2la
 H8uBXIiMvnlbZHKoSxHFDFIx0=; b=Kxd6mT6ou2yDWT6nJzl+KbGQfofmaClbZ1
 rgXuVFC6Jd9CPH29TccLw5ksGML03L33ll7Vpixj9IFCLUPoMJA509LfUquo4eZr
 FxLXCrmdDdHtz8OLvBZuTVwECMEaNvNpfwB/xH/H1EXX0Er20GZ9MIWlO1k2+Aab
 0RzY955jA=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wD3H7l_t59l0N42AA--.10079S2;
 Thu, 11 Jan 2024 17:40:15 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon/evergreen_cs: Clean up errors in evergreen_cs.c
Date: Thu, 11 Jan 2024 09:40:13 +0000
Message-Id: <20240111094013.14347-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3H7l_t59l0N42AA--.10079S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1fZFWDGw45tF48GrWrAFb_yoWftrX_Cr
 4rX3s8X3sru3ZFkF1xZF48WFWvkFW5ZrW8Cayfta4fGry5AF10grWS9ryFqw45W3WUJFZ5
 Aw4kWFW3Xr97WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRioUq5UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHB1ixWV2z0UUrQAAsG
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
Cc: XueBing Chen <chenxb_99091@126.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space required after that ',' (ctx:VxV)
ERROR: spaces required around that '>' (ctx:VxV)
ERROR: spaces required around that '<' (ctx:VxV)

Signed-off-by: XueBing Chen <chenxb_99091@126.com>
---
 drivers/gpu/drm/radeon/evergreen_cs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index 0de79f3a7e3f..1fe6e0d883c7 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -33,8 +33,8 @@
 #include "evergreen_reg_safe.h"
 #include "cayman_reg_safe.h"
 
-#define MAX(a,b)                   (((a)>(b))?(a):(b))
-#define MIN(a,b)                   (((a)<(b))?(a):(b))
+#define MAX(a, b)                   (((a) > (b)) ? (a) : (b))
+#define MIN(a, b)                   (((a) < (b)) ? (a) : (b))
 
 #define REG_SAFE_BM_SIZE ARRAY_SIZE(evergreen_reg_safe_bm)
 
-- 
2.17.1

