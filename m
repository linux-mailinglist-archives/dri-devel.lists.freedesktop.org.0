Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C814C0E0E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 09:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94810EF5D;
	Wed, 23 Feb 2022 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com
 [203.205.221.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221D510E747
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1645530063;
 bh=699eMzBA/qyobrvCuYrfTZQ0V28mV755xfbax2dpsmg=;
 h=From:To:Cc:Subject:Date;
 b=PtpOlma8LoDZw0wyTeq9JOrrneAZ7R+FHE4nKfBbJatDh6VEz2u05izKLKOXsdDdo
 s2YsHkWL6TERSHrx/6KVVaXyv2GAV6ECodzKytkivXUhuJjdCMTuXmqXVcfcisn3gl
 JUtsJiLy3Q1gLpP41T9dSdv+j5ZKSw6T4ZgXKq8c=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id A3BA16B2; Tue, 22 Feb 2022 19:40:59 +0800
X-QQ-mid: xmsmtpt1645530059tml951xhj
Message-ID: <tencent_7E4716854F78B812C4FF16C83573486E1806@qq.com>
X-QQ-XMAILINFO: NqN/wpVFVRYX9w3UoN3kG1OGR3IqIo7RMgu5GU/ntuck/574TWNUhjq96ugm1Y
 5L6KId2msDcc/H2U/ZAuaF50TNsGkr7fjSKvBSNOGlwxOPfN1Bmjosl806djxmlX3Hze+xoUWFW6
 dLiFW5OK2t7YH1j9bVqIDhvOdrWp6s4w4KxDSuaYYzeDHwo9WMmM1kEZ9iPc5LflLt9Suqwt5xFM
 60yQnTtkINfVDgu1ryYvxmSPONSh+a51U4m+ZgeXoBFPA6AvZ3dXZq4fW2DtObvn0W2YtkwjdXqu
 Ku6Cq+cUKF3W9Afa0UqfEmWivSAzVMasAOeZnSqyagv5InYx2wx7F8I+nvWbxRMocgOooUA8q9Oz
 GE1rZXEgMS+HbC57eZkAMANrhfWxZb2vZi0I8F8FLa94ZJCYtWurACvMl+mpjoGkwugdV6U2n1mv
 Hq+Q2Zm9c4QMj2d66nBfTX+7EMasRqui9e+ReRyJ/ZEdVeY/qBp1lsD0s8Y3WEQviGJKGwvStb4q
 KVvyMtm7tZXabMXSyXBMfEpsC3pcDzxSvcBXef4okGezeacwKEPK2drnfSzB1GtW6v38hrqKiBOS
 rzgTZLCMLfE+WWlPuPtGRDpy2pd0z386jSP/Cqi85V2Y6vzAhcjuwMyhlYuygIClzkR+2w567jAX
 xM7gD4ubadA+Av7PYJKWTozPVo46zSdXCt/ffXVKgUa0iGP1GYY8dgfl9ZnuB0J/G8a6OXsSjM+j
 AI9IDmlw40zc7YSlGD1PzduhBr2MAZtSuZqvu8V+H5J/6b2Q/dFO89eXs0d3/hDD753C2KeBVvHH
 YI+OpRKw3/QQkLBqYrcnh6LvydG4jbDOeGqRA+ZAWQZEZa7NipGdOIyd56lgROTtDktaoEdzk5fh
 1tedJh/4Hk6rWLQdtW0jP+YLTzQE+ZNFL+clwK4zSZgkyoHGUBYf4oJxHqmOIz2Q==
From: xkernel.wang@foxmail.com
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/i915/selftests: check the return value of kstrdup()
Date: Tue, 22 Feb 2022 19:40:28 +0800
X-OQ-MSGID: <20220222114028.3947-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 08:09:33 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xiaoke Wang <xkernel.wang@foxmail.com>,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kstrdup() is a memory allocation function which can return NULL when
some internaly memory errors happen. It is better to check the return
value of it to prevent further wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/gpu/drm/i915/selftests/i915_selftest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 484759c..1bcd065 100644
--- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
+++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
@@ -246,6 +246,9 @@ static bool apply_subtest_filter(const char *caller, const char *name)
 	bool result = true;
 
 	filter = kstrdup(i915_selftest.filter, GFP_KERNEL);
+	if (!filter)
+		return false;
+
 	for (sep = filter; (tok = strsep(&sep, ","));) {
 		bool allow = true;
 		char *sl;
-- 
