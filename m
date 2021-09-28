Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6941BF9B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 09:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B33C6E9DC;
	Wed, 29 Sep 2021 07:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Tue, 28 Sep 2021 20:09:24 UTC
Received: from mail.shanghaitech.edu.cn (mail1.shanghaitech.edu.cn
 [119.78.254.90])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCAF36E96E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 20:09:24 +0000 (UTC)
Received: from [10.15.44.215] by mail.shanghaitech.edu.cn with MESSAGESEC
 ESMTP id 456895720416615; Wed, 29 Sep 2021 03:38:59 +0800 (CST)
Received: from DESKTOP-FOJ6ELG.localdomain (10.15.44.220) by
 smtp.shanghaitech.edu.cn (10.15.44.215) with Microsoft SMTP Server (TLS) id
 14.3.399.0; Wed, 29 Sep 2021 03:38:57 +0800
From: Mianhan Liu <liumh1@shanghaitech.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Mianhan
 Liu <liumh1@shanghaitech.edu.cn>
Subject: [PATCH -next] drivers/base/component.c: remove superfluous header
 files from component.c
Date: Wed, 29 Sep 2021 03:38:49 +0800
Message-ID: <20210928193849.28717-1-liumh1@shanghaitech.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.15.44.220]
X-Mailman-Approved-At: Wed, 29 Sep 2021 07:11:51 +0000
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

component.c hasn't use any macro or function declared in linux/kref.h.
Thus, these files can be removed from component.c safely without
affecting the compilation of the drivers/base/ module

Signed-off-by: Mianhan Liu <liumh1@shanghaitech.edu.cn>

---
 drivers/base/component.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5e79299f6..6dc309913 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -9,7 +9,6 @@
  */
 #include <linux/component.h>
 #include <linux/device.h>
-#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
--=20
2.25.1


