Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F075224A539
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 19:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D126E46F;
	Wed, 19 Aug 2020 17:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9A96E46F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 17:51:46 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9AD7220758;
 Wed, 19 Aug 2020 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597859506;
 bh=J+IjkUW3t6+Z48T6sJ6E00JRYLjetsG85a5bs6k5OlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZSwvVSWyiG9/khcwBoGOaVfY5XAVh206RjrXDPYAp0WwMUcluNAZVLukSAlAEbakq
 Z0W2Zs4wUGS4hONtqysZJnkVK9xhIi3W7f5MnjestiyLWkmEN7i8wwddg1if3vFs4T
 tJIt0XuVfyU+rXsUv7zjrp9bNS4T2CpybASzF+cU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/2] dma-buf: fence-chain: Document missing
 dma_fence_chain_init() parameter in kerneldoc
Date: Wed, 19 Aug 2020 19:51:34 +0200
Message-Id: <20200819175134.19261-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175134.19261-1-krzk@kernel.org>
References: <20200819175134.19261-1-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/dma-buf/dma-fence-chain.c:233: warning: Function parameter or member 'seqno' not described in 'dma_fence_chain_init'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/dma-buf/dma-fence-chain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 3d123502ff12..7d129e68ac70 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -222,6 +222,7 @@ EXPORT_SYMBOL(dma_fence_chain_ops);
  * @chain: the chain node to initialize
  * @prev: the previous fence
  * @fence: the current fence
+ * @seqno: the sequence number to use for the fence chain
  *
  * Initialize a new chain node and either start a new chain or add the node to
  * the existing chain of the previous fence.
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
