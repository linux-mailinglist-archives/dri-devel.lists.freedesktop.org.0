Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F89590C71
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32F5A9066;
	Fri, 12 Aug 2022 07:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA87211A6E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:01:25 +0000 (UTC)
X-QQ-mid: bizesmtp90t1660233677t7kazeqf
Received: from localhost.localdomain ( [110.188.55.240])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 12 Aug 2022 00:01:12 +0800 (CST)
X-QQ-SSF: 0100000000000080H000000A0000020
X-QQ-FEAT: ILHsT53NKPgyimJccMYtRICob5h5v4gBQ1pwz09xH1r8vp6AzRaN7xxiRXs3V
 HEqsS4oVFnTccMV9E48O1NHXafi6/CPdPa8zhywonBGhS+vNZzH4cCOHLgx7ZlQuZ8kdvOg
 OQjSZ1LSOITlj2UVTrUox6FprR70VCs7gYcvzsna8EMWWRCErQF3dEygakf2klPoXcTca7Q
 vYJsI80hW1tgktE+00RTOSf7hhdFqUTsep6tny/bJJcKq2ObskAbpFD6r4NtpcBoxV07b1i
 pPovhB1Hq59u1XYJOLOjyZ+5JhjCOz1G64mJG0y+ve/BBN9gBcpSCdWhew67HEgP2YCQt4j
 tbVpaEnvQphGiXMn/I=
X-QQ-GoodBg: 0
From: min tang <tangmin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/ttm: Fix comment typo
Date: Fri, 12 Aug 2022 00:01:00 +0800
Message-Id: <20220811160100.13798-1-tangmin@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: min tang <tangmin@cdjrlc.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `sure' is duplicated in line 454, remove one.

Signed-off-by: min tang <tangmin@cdjrlc.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 7bc99b1279f7..2e9349e01e8e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -450,7 +450,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 	}
 
 	/*
-	 * If we don't track dirty using the MKWRITE method, make sure
+	 * If we don't track dirty using the MKWRITE method, make
 	 * sure the page protection is write-enabled so we don't get
 	 * a lot of unnecessary write faults.
 	 */
-- 
2.17.1

