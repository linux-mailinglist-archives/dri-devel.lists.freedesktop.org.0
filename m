Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037923CA3D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688536E527;
	Wed,  5 Aug 2020 11:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90EB6E525
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:27:00 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1k3HZQ-0008I0-5Z; Wed, 05 Aug 2020 11:26:56 +0000
From: Colin King <colin.king@canonical.com>
To: Laura Abbott <labbott@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Subject: [PATCH] staging: ion: fix spelling mistake in function name "detatch"
 -> "detach"
Date: Wed,  5 Aug 2020 12:26:55 +0100
Message-Id: <20200805112655.17696-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the function name ion_dma_buf_detatch.
Fix it by removing the extraneous t.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/android/ion/ion.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 3c9f09506ffa..e1fe03ceb7f1 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -205,8 +205,8 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
 	return 0;
 }
 
-static void ion_dma_buf_detatch(struct dma_buf *dmabuf,
-				struct dma_buf_attachment *attachment)
+static void ion_dma_buf_detach(struct dma_buf *dmabuf,
+			       struct dma_buf_attachment *attachment)
 {
 	struct ion_dma_buf_attachment *a = attachment->priv;
 	struct ion_buffer *buffer = dmabuf->priv;
@@ -331,7 +331,7 @@ static const struct dma_buf_ops dma_buf_ops = {
 	.mmap = ion_mmap,
 	.release = ion_dma_buf_release,
 	.attach = ion_dma_buf_attach,
-	.detach = ion_dma_buf_detatch,
+	.detach = ion_dma_buf_detach,
 	.begin_cpu_access = ion_dma_buf_begin_cpu_access,
 	.end_cpu_access = ion_dma_buf_end_cpu_access,
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
