Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C434BFE6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7C66E17A;
	Sun, 28 Mar 2021 23:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239C96E17A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:38 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id c3so10929885qkc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2CB+oDzRlKTXsQgvZVkoJMCXZMGg7B/MCg4u+Njtv4=;
 b=DU3fOkSXckynV4e9icZMhz7PfRsCbCFt8b1N3nx+vNJ0YQAtxeW+KmaA1o2ylavs+P
 G9TimVl49iLForzkyymJxqn2b28D4EzXm+ZI4/+f1dCXrwhbTbfRDX5G0QL1ER3Fhh0x
 dpDIUd6cWj4XZo/T3/DIaUMXfwdvNDgHGrHnl2tCzUbRq0Jfg/A1B6xXt+lUOwYkWcpB
 T868H80uh8Oet/UF1dj/OlPzy7hR3Ne9fF8ulO7aD4HXzCovy4cvZLjyK5mn8psXkAyf
 Suwp4AtV5/4hhTchePwPzbFsv8AI9iWSj9p3cyHx4hXz3hJw06YVnKG5SESwuZzZ6r74
 UuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2CB+oDzRlKTXsQgvZVkoJMCXZMGg7B/MCg4u+Njtv4=;
 b=jKC1Ikxt/1b0juVPBk1xdsLf8WEHlSVsZuVkSg4+6z7sC2EmI6ygVa+jLsJ9qG5goq
 cZkYqegSa4otjF/TolOp605HuYZ6aCQ706pZuuZhym9BWAtjPoK+U28wnuZluPyKAzhm
 NR4wcofxAJtftkDZL7MRS0zk1IZQBGyd6zlUcalf4fiFyDP0U/CXjqCwfQHTxfyUSjqU
 ZDZJPOhRFEqfZjiViKpKP2y/jNowdRtwvDePJ7SU0YdYdWdAt3B0L3gOfDiEWtGHQ9FO
 ihT7jf2gZ0DFWKamt1yTX+UA+4rNzxVV1sbDNRMuU2gxJbWuYsbjvG7mLQwC/45+dhoM
 X8cQ==
X-Gm-Message-State: AOAM532fg3kjexSXztEmsn8IERYLkVODJGV4PG2p5A1Xq78eykp4Ibj0
 /Er/qF0YZEgg5AaKkJHHQY4=
X-Google-Smtp-Source: ABdhPJxvo48SXWkMjNKknPMovLJbk743rE6Sor3y7HvVUau8ciblHI5RRV983LICXWJpgrB6vyRknw==
X-Received: by 2002:a37:9f4e:: with SMTP id i75mr23450908qke.283.1616975797420; 
 Sun, 28 Mar 2021 16:56:37 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 08/30] mv_xor.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:04 +0530
Message-Id: <46df86afac6c221e7eda9586db1233750c1c5477.1616971780.git.unixbhaskar@gmail.com>
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

s/capabilites/capabilities/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/mv_xor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 23b232b57518..a43388b6a30d 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1074,7 +1074,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 	if (!mv_chan->dma_desc_pool_virt)
 		return ERR_PTR(-ENOMEM);

-	/* discover transaction capabilites from the platform data */
+	/* discover transaction capabilities from the platform data */
 	dma_dev->cap_mask = cap_mask;

 	INIT_LIST_HEAD(&dma_dev->channels);
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
