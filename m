Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15731850D28
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 05:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E342B10E545;
	Mon, 12 Feb 2024 04:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="S1j14499";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7879E10E545
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 04:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=79tMagtsx8zWFd0gwV9uxN+xp9p3j086sCtxdA2GSnk=; b=S1j14499hTlFQh4PjQdIe5aq1V
 Yzq4+AHFjY13dZpmxeO8cgp2BIrgk5/6DtVUybA+cU8V7QZzspwdwFy3L+J1BTAjIdEjqQpC5VG5R
 Z0WxNRTokWO5Zihd3TQ8sAm0XYjpOxWVltOS4uK5z1NZw+bvwkfmIkXwLrupuAcodxEgGMpyEcpxP
 WWzAixZpddqKEPv/J/UUJ3olp0QZ0CAew4TE6hAxAww7PPyauYdh9YaRtsYl9vC1vCxED6fySbE6l
 Kv5MowAhPDXBDNcwdTzrKYqXxKXsGm45YTYX4RE2+nSFKlVdhg3XGTwwmFqBGUxfvvomBArTsCLeu
 RCDizLXQ==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rZNvq-00000004Iou-1Cay; Mon, 12 Feb 2024 04:28:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] iosys-map: fix typos
Date: Sun, 11 Feb 2024 20:28:37 -0800
Message-ID: <20240212042837.21071-1-rdunlap@infradead.org>
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

Correct spellos/typos in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 include/linux/iosys-map.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
@@ -85,7 +85,7 @@
  *	if (iosys_map_is_equal(&sys_map, &io_map))
  *		// always false
  *
- * A set up instance of struct iosys_map can be used to access or manipulate the
+ * A setup instance of struct iosys_map can be used to access or manipulate the
  * buffer memory. Depending on the location of the memory, the provided helpers
  * will pick the correct operations. Data can be copied into the memory with
  * iosys_map_memcpy_to(). The address can be manipulated with iosys_map_incr().
