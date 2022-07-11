Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855395707BD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5568F572;
	Mon, 11 Jul 2022 15:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2AF8F56D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:56:45 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id trwj2700m4C55Sk01rwkx0; Mon, 11 Jul 2022 17:56:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvm7-003723-K1; Mon, 11 Jul 2022 17:56:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvm7-006sue-8u; Mon, 11 Jul 2022 17:56:43 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] util: Remove unused definitions of RED, GREEN, and BLUE
Date: Mon, 11 Jul 2022 17:56:41 +0200
Message-Id: <76c3c5d0e44a385f7289a918ca77cc3ca19a9b18.1657554940.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are unused since commit edcef53685edf5fb ("modetest: Add test
pattern support for missing RGB formats").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 tests/util/pattern.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index f28fad311ec3de11..178aee8341a38920 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -764,11 +764,6 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	}
 }
 
-/* swap these for big endian.. */
-#define RED   2
-#define GREEN 1
-#define BLUE  0
-
 static void make_pwetty(void *data, unsigned int width, unsigned int height,
 			unsigned int stride, uint32_t format)
 {
-- 
2.25.1

