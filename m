Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE3B3DCFB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CD610E3B1;
	Mon,  1 Sep 2025 08:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B85410E3AF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:49:21 +0000 (UTC)
Received: from jtjnmail201610.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202509011649167765;
 Mon, 01 Sep 2025 16:49:16 +0800
Received: from localhost.localdomain.com (10.94.9.187) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.57; Mon, 1 Sep 2025 16:49:14 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: Koby Elbaz <koby.elbaz@intel.com>, Konstantin Sinyuk
 <konstantin.sinyuk@intel.com>, Oded Gabbay <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH 1/1] accel/habanalabs: fix typo in comment
Date: Mon, 1 Sep 2025 16:47:42 +0800
Message-ID: <20250901084742.1935-2-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250901084742.1935-1-chuguangqing@inspur.com>
References: <20250901084742.1935-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.9.187]
tUid: 20259011649167e168e19e6c266f69f95587056e1d8f6
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

The word "properties" was misspelled as "properites".

Signed-off-by: chuguangqing <chuguangqing@inspur.com>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 6f27ce4fa01b..f7b9e07233d4 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1068,7 +1068,7 @@ struct hl_encaps_signals_mgr {
  * @kernel_address: holds the queue's kernel virtual address.
  * @bus_address: holds the queue's DMA address.
  * @pq_dram_address: hold the dram address when the PQ is allocated, used when dram_bd is true in
- *                   queue properites.
+ *                   queue properties.
  * @pi: holds the queue's pi value.
  * @ci: holds the queue's ci value, AS CALCULATED BY THE DRIVER (not real ci).
  * @hw_queue_id: the id of the H/W queue.
-- 
2.43.5

