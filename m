Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7FF5887DE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC17910FEB3;
	Wed,  3 Aug 2022 07:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (unknown [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7488EE31
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 12:20:20 +0000 (UTC)
X-QQ-mid: bizesmtp71t1659442798tgsihsb9
Received: from kali.lan ( [125.69.43.47]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 02 Aug 2022 20:19:56 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000000
X-QQ-FEAT: swyrzWPvyR2qDD5rPmQ/VXbiVD4x75MF6MoDQejb2G9zwz1gVFQdbfqXPwQ3P
 nOfI5MjJNkqkFJVKQERE7twIgTeivKoo1pgIrRhH5QAV0ExReKBBIBsH7uVFIHbolDd0SbS
 0Zn/fsIe+MQIe8UOMituqc1ghaBUZM/yF66LJqlMEcUY8caElLIsgYPVvIxKiNPYY8XMmcp
 2PPQPRwgjE2ZDPjo5miu9tgaGMxxRInviuBi8Rx0LH53ZF3VLtLi/EVzbm85685wloA/3yA
 ShZeq0tW52MBTgZgiuGZcZ1HJD6L3WpZe+OnW9t3ipJuENvC7MUDL3JXzdZPICSlUAw/Vh/
 x3871Ed3Q9Wc0uBSY/Ibf9WW5y9+Y0r1kLQeDjgTdzwnA+12xX7RUO+mLwajfP3fNEDGioM
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: christian.koenig@amd.com
Subject: [PATCH] dma-buf: heaps: Fix comment typo
Date: Wed,  3 Aug 2022 04:19:55 +0800
Message-Id: <20220802201955.8634-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:28 +0000
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 lmark@codeaurora.org, linaro-mm-sig@lists.linaro.org, jstultz@google.com,
 dri-devel@lists.freedesktop.org, Jason Wang <wangborong@cdjrlc.com>,
 labbott@redhat.com, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `by' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 28fb04eccdd0..cd386ce639f3 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -316,7 +316,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 			kunmap_atomic(vaddr);
 			/*
 			 * Avoid wasting time zeroing memory if the process
-			 * has been killed by by SIGKILL
+			 * has been killed by SIGKILL
 			 */
 			if (fatal_signal_pending(current))
 				goto free_cma;
-- 
2.35.1

