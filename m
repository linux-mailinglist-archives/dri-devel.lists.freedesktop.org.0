Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D415F1B1F11
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF046E89B;
	Tue, 21 Apr 2020 06:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C286E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1587368520; x=1618904520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=diXxeA7g1XTByahSm1bZcJHQIm4bVeBMr5YsbeKB+8g=;
 b=k8HhJk73yPzsd2uHAVrH7x6M4JrT5AHw9Tstv9h20jTnYLbb3ZY+60vE
 WxoKjun8aDk1ZpZ+FKZWc51T4s2/QjQgaEbUlSdJ0x17/0wAv7wX/1wmn
 qBE+4LKXB+Vl/bAn3RmldeH8G15A7jHpr/lFW5Xe9a+Cjsh15sd8AOOLy k=;
IronPort-SDR: AmsFB0BwD4OAWhfXLlxjCwyJV9epkON3aQtMBQZbecXGslCYlS6V1+aA3Q1QJU/BdPndTjo4D5
 0YNf69AdKzVQ==
X-IronPort-AV: E=Sophos;i="5.72,406,1580774400"; d="scan'208";a="27648254"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 20 Apr 2020 07:41:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id EE8A2A0716; Mon, 20 Apr 2020 07:41:45 +0000 (UTC)
Received: from EX13D19EUB001.ant.amazon.com (10.43.166.229) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 20 Apr 2020 07:41:45 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D19EUB001.ant.amazon.com (10.43.166.229) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 20 Apr 2020 07:41:44 +0000
Received: from 8c85908914bf.ant.amazon.com (10.1.212.20) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 20 Apr 2020 07:41:40 +0000
From: Gal Pressman <galpress@amazon.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] dma-buf: Couple of documentation typo fixes
Date: Mon, 20 Apr 2020 10:41:15 +0300
Message-ID: <20200420074115.23931-1-galpress@amazon.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: linux-doc@vger.kernel.org, Gal Pressman <galpress@amazon.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a couple of typos: "as" -> "has" and "int" -> "in".

Signed-off-by: Gal Pressman <galpress@amazon.com>
---
 Documentation/driver-api/dma-buf.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index c78db28519f7..63dec76d1d8d 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -11,7 +11,7 @@ course not limited to GPU use cases.
 The three main components of this are: (1) dma-buf, representing a
 sg_table and exposed to userspace as a file descriptor to allow passing
 between devices, (2) fence, which provides a mechanism to signal when
-one device as finished access, and (3) reservation, which manages the
+one device has finished access, and (3) reservation, which manages the
 shared or exclusive fence(s) associated with the buffer.
 
 Shared DMA Buffers
@@ -31,7 +31,7 @@ The exporter
  - implements and manages operations in :c:type:`struct dma_buf_ops
    <dma_buf_ops>` for the buffer,
  - allows other users to share the buffer by using dma_buf sharing APIs,
- - manages the details of buffer allocation, wrapped int a :c:type:`struct
+ - manages the details of buffer allocation, wrapped in a :c:type:`struct
    dma_buf <dma_buf>`,
  - decides about the actual backing storage where this allocation happens,
  - and takes care of any migration of scatterlist - for all (shared) users of

base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
