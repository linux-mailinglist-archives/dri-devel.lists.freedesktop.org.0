Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD677B445F
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 00:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEFF10E049;
	Sat, 30 Sep 2023 22:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3B10E049
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 22:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Qv7sIj+M0crhVSc6FpMOVlK8L6+Jn5DSpcnSw/+/oEM=; b=WMJNfUGBRsbOUDLvFPbNhvF0Ee
 zPdk79w3ON2Kn2CdrvQBvtec+tdxCvHCd9A8H15e7VTRUQq3ibrYtAiS+XnpsLT7j982TpSt5xp2u
 Jb2PokZJ/xyNshqAEEFcCGaQi5NKsYDpGD7L3ABxiw5ATO0HeyBey0dz+YnL4ZxCNRwQMMHcdMDKQ
 0HTHiBvTR1G/0WF/uosutnucQNyP2gOxSUJhG9Rw4o3Y4ma/qtxCOLOdAKbTXEUd2IDeMS0LWr/zC
 uZ2OWNjSBsxHB3MDy0f+H8MJtL32ToXmBq4YWNgqA1c0Xxx5ucjMNT6/zBPs30dYHEubV7GjY1g2W
 RGkXhhMg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qmiEH-00AAxS-2j; Sat, 30 Sep 2023 22:14:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] iosys-map: fix kernel-doc typos
Date: Sat, 30 Sep 2023 15:14:27 -0700
Message-ID: <20230930221428.18463-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230930221428.18463-1-rdunlap@infradead.org>
References: <20230930221428.18463-1-rdunlap@infradead.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct spelling of "beginning".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 include/linux/iosys-map.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/include/linux/iosys-map.h b/include/linux/iosys-map.h
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -426,7 +426,7 @@ static inline void iosys_map_memset(stru
  * iosys_map_rd_field - Read a member from a struct in the iosys_map
  *
  * @map__:		The iosys_map structure
- * @struct_offset__:	Offset from the beggining of the map, where the struct
+ * @struct_offset__:	Offset from the beginning of the map, where the struct
  *			is located
  * @struct_type__:	The struct describing the layout of the mapping
  * @field__:		Member of the struct to read
@@ -494,7 +494,7 @@ static inline void iosys_map_memset(stru
  * iosys_map_wr_field - Write to a member of a struct in the iosys_map
  *
  * @map__:		The iosys_map structure
- * @struct_offset__:	Offset from the beggining of the map, where the struct
+ * @struct_offset__:	Offset from the beginning of the map, where the struct
  *			is located
  * @struct_type__:	The struct describing the layout of the mapping
  * @field__:		Member of the struct to read
