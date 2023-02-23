Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A386A0873
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1442910EB6D;
	Thu, 23 Feb 2023 12:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8994710EB6D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Md5XL3LVqYuyu7jSBi94vp1XHM897eearoraEjdM214=; b=c6gsjacZ9RnI2Nt5BUW07wUQZv
 4gBV6q5+uIKZeU6k8qJqN47PLi0rg2baQke85oeczVc5on3SihaUhqPSxA8SUjwZJeX5i898idn3a
 XucT131+IKsr3fwmRP/7f10fcAwlyO4qvabxyz/gRtpQ/6GumA0Hcm3bndYIJn6odzmtpfY8xoNge
 X3WAqcBI7Tho7grk1oySC69IPSp0BVhmzZd2xKYwwnqx5Jj7wf2OJTWUIG0E8DHvyZUpgi02IO8pL
 mNGYZv7IdHNL9XXmKfsvvxWDKHbQ7ladC9m3TXnj+ZAE6teoejrsiE98b8aQ3NRVexBpsr81y/Pq0
 eDKhrowQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pVAZN-00C3xT-Ju; Thu, 23 Feb 2023 13:19:30 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH] dma-buf: Include missing parentheses to documentation
Date: Thu, 23 Feb 2023 09:19:09 -0300
Message-Id: <20230223121909.149980-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The missing parentheses prevents the function to be rendered as a link
in the documentation. So, add the missing parentheses to the function on
the documentation.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 757c0fb77a6c..aa4ea8530cb3 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -828,7 +828,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  *     - dma_buf_attach()
  *     - dma_buf_dynamic_attach()
  *     - dma_buf_detach()
- *     - dma_buf_export(
+ *     - dma_buf_export()
  *     - dma_buf_fd()
  *     - dma_buf_get()
  *     - dma_buf_put()
-- 
2.39.2

