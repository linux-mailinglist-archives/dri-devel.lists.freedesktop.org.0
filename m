Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B4234BFDF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF8F6E140;
	Sun, 28 Mar 2021 23:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F746E12B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:18 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id q9so5697701qvm.6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPii/xX6YhM4hcBO+zp3OVMgz+jDeBjNcGIvzkkQGYk=;
 b=bObaSHbQgF7HnhhFevByLeRAEjwh9Xgx/6poqOyVrhU9nI9SQbKZibaot0nVJHtdHK
 o79A8Sp+Gz79oGtGsF5SxsTYB9AMcZOuDAKRePAi8OQlhWEu8LqzdcK18F1hIKWGpwTt
 +hcuXkQ52IF+FdKd1u3A+2KvczRYSW2FxnhgIJbngK13+y5D665LByLLaOIYq5prJ2BB
 q0KPV1xmQES9uuwOigJWctcX+oM6I0mAu6NH+RzVkz/A8hrPHIr5VI27yaHxNHMRhJ9S
 ZkZNPLNBdVtA2r2vkh1TOiWiTBT+BsXGquBT60jgmW2VoagfFPx16zh5v8S/U1Z6V3eJ
 yCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPii/xX6YhM4hcBO+zp3OVMgz+jDeBjNcGIvzkkQGYk=;
 b=hvOj5hTCraaekD5kOkPMWXrGYbXaDLTzjjrUFjEgrF1bFom//dmRQf+Hf9yxPZ9o9c
 Kd3CUQKwm+OD7RaIm/Hs5PbIN7I5Lrdi6erQbKKYQ49JEbDrO+AfpmenaxhotFU8QoYW
 jekahhEJaBEgvpoc4HfDNEKIezvCMopwFoXhyQhRW14ApVEO4AGFgHCWW1n7GMcDSkPU
 6vHVtu6V7TVRV0GZBUvCW8SUcxjYbc/eQokQTe26tJHTLY/Shg2u3Z9mUEylf9JGk5oS
 ZdGvbgnYxKfRdRgDr3u0i12zvWydhGONFpCY6jZ8HRqYu5R0eYIk6swODPjwNkCLrx7A
 8q9w==
X-Gm-Message-State: AOAM532QCoBPFAPYkZgLCkMyRmWmKgWzUK1jsNXUcevbJ3vnGrzXMGdc
 tB6qZLaTxvHOXIFblK019WUy2GD+L0O0IR1k
X-Google-Smtp-Source: ABdhPJyIwQh8O82d8qyrfIuUZz0SqJYcgUURzt27W+q5h1fBWMUvMvJGKHkKfG17NwqDAaW/0JNrSg==
X-Received: by 2002:a05:6214:d85:: with SMTP id
 e5mr22653184qve.36.1616975777547; 
 Sun, 28 Mar 2021 16:56:17 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:17 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 04/30] bcm-sba-raid.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:00 +0530
Message-Id: <a421c27ea6dc2808edec25b18238941ab5aefcf4.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/Maibox/Mailbox/
s/alloced/allocated/
s/atleast/"at least"/
s/parallely/parallel/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/bcm-sba-raid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 64239da02e74..fba1585eb7ad 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -25,7 +25,7 @@
  * number of hardware rings over one or more SBA hardware devices. By
  * design, the internal buffer size of SBA hardware device is limited
  * but all offload operations supported by SBA can be broken down into
- * multiple small size requests and executed parallely on multiple SBA
+ * multiple small size requests and executed parallel on multiple SBA
  * hardware devices for achieving high through-put.
  *
  * The Broadcom SBA RAID driver does not require any register programming
@@ -143,7 +143,7 @@ struct sba_device {
 	u32 max_xor_srcs;
 	u32 max_resp_pool_size;
 	u32 max_cmds_pool_size;
-	/* Maibox client and Mailbox channels */
+	/* Mailbox client and Mailbox channels */
 	struct mbox_client client;
 	struct mbox_chan *mchan;
 	struct device *mbox_dev;
@@ -328,7 +328,7 @@ static void sba_cleanup_nonpending_requests(struct sba_device *sba)

 	spin_lock_irqsave(&sba->reqs_lock, flags);

-	/* Freeup all alloced request */
+	/* Freeup all allocated request */
 	list_for_each_entry_safe(req, req1, &sba->reqs_alloc_list, node)
 		_sba_free_request(sba, req);

@@ -1633,7 +1633,7 @@ static int sba_probe(struct platform_device *pdev)
 	sba->dev = &pdev->dev;
 	platform_set_drvdata(pdev, sba);

-	/* Number of mailbox channels should be atleast 1 */
+	/* Number of mailbox channels should be at least 1 */
 	ret = of_count_phandle_with_args(pdev->dev.of_node,
 					 "mboxes", "#mbox-cells");
 	if (ret <= 0)
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
