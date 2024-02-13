Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6103853EED
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 23:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF0910E300;
	Tue, 13 Feb 2024 22:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="maguQthq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7196610E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 22:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=LlmxAiz2w1clOqh/oi3Em9gmhYSqMdjJu/XRaQqN+Ro=; b=maguQthqS7PI7tg7IGQ4SIH/ZN
 NnSS/TOp3+Ap5Ie3cTAhut67h5NN5N177J1c7VUEBCTSfzSWDgmFz4Mx+xkvkgWHiIodcFXlb7tm3
 OBYRc3MJfEU2o5ywuMz/1EY5AEZnw2OfndZWMLSGQwzpLfdmXiVrURoXn6WtoRkobb5Yn9rCor+6N
 nGNvXG8bXnawfBd1+pHXDn7oY3zaUqLJTdc+mwQOM7bCHb3Qb8h3pWyj5KIlvSJofO7N45jb/oQTK
 QZjhVgzeb7jbijydcyvpYTJNgNVMdAiihp/KQ3UpjFqR9OYPYpyHm9Qr5enTTk2jPk6Z9QWL37FFW
 cXhjZ2cw==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1ra1Tn-0000000B7EW-2Ckt; Tue, 13 Feb 2024 22:42:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] iosys-map: fix typo
Date: Tue, 13 Feb 2024 14:42:19 -0800
Message-ID: <20240213224219.10644-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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

Correct a spello/typo in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
v2: don't change "set up" to "setup" (Thomas)

 include/linux/iosys-map.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/include/linux/iosys-map.h b/include/linux/iosys-map.h
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -34,7 +34,7 @@
  * the same driver for allocation, read and write operations.
  *
  * Open-coding access to :c:type:`struct iosys_map <iosys_map>` is considered
- * bad style. Rather then accessing its fields directly, use one of the provided
+ * bad style. Rather than accessing its fields directly, use one of the provided
  * helper functions, or implement your own. For example, instances of
  * :c:type:`struct iosys_map <iosys_map>` can be initialized statically with
  * IOSYS_MAP_INIT_VADDR(), or at runtime with iosys_map_set_vaddr(). These
