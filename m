Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A434BFEE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDFB6E17F;
	Sun, 28 Mar 2021 23:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212E6E17F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:47 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id g15so10929219qkl.4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8tgWIwF1h1UyJsPg+lZdKEi7xs5ze/71DPorsIrKaw=;
 b=QluZ0Za6bZK99BZdD6eZ6JK4FwNMO4t5rMeypTHxnNI3xBR1C2N9OlpcqyHrjbfiG7
 Mq+uCBl35SjAQuc4Cd3qJdRpJ8vzBl4D90dLBtuXnvkjJv+cBZgbaWDnKk0zLxPYIS5s
 yLVuS7nx+qZck+0nJsmLB5ns+K+JwVd6Y6pl1A4EIAd++4AWNUtouvQSF69/S9sHRHtI
 82eWm4rI6oMz57f/q2nVm5TOpV26u7QBwLLqbGpcE8fk9pIhGRBUJPEzl+czndefkZ/p
 YmPsBvQP7Bqq6+uK2YKh2oXukU70f0KR3ysooGwavL9tHQRwV60nHxsIuviiOJDcFJf8
 +KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8tgWIwF1h1UyJsPg+lZdKEi7xs5ze/71DPorsIrKaw=;
 b=ho7UCEDgG8MvURGYBLnqhUMnUvlZ6sBe76meYqbyf2JReb2n1/N53marivq0tOSLxo
 9c4iosOCWcN2Gu0PDRnmpNhnVnW5jJqs/nP0rL6PQL876fQYhTi6FINWccTF+rkAWWjf
 3+ygJA2BNxjrR/SIC8pccaDLrTYIpqOWFhlt5pG5MlrgPXbsoyuk0b/+W4bROLjwOsBU
 joEKulNF8brKmhR3AyDkP8ptlo7Uvf1Y03mkJGVUMZgVzaLbfy6wZAvMcCTPiI3KO/wX
 VbRHDEONWH014VN+x06U8IEj030qlMaYGl9+TOTIMuxRxDPNEb6rtdgWhz7tdwHrzcQ2
 GTbg==
X-Gm-Message-State: AOAM531uQT/n7+BKs9jco7Sp3z4StoGG9Wx4Km+4YQ5h3KyKgN0oJgP6
 mzoNXQY3ddTvpKBL6TfAQx8=
X-Google-Smtp-Source: ABdhPJzpxSRSjtr4pJygkDPBEhRffmMMyfd9P0g2mrERYszZ3+DVR0YWumqOtPLQE4YK+O+8QPuhTQ==
X-Received: by 2002:a05:620a:2915:: with SMTP id
 m21mr22225739qkp.147.1616975807180; 
 Sun, 28 Mar 2021 16:56:47 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 10/30] mv_xor_v2.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:06 +0530
Message-Id: <c2a5a94826aa421f14b4ee7cbf99f74b82f91d32.1616971780.git.unixbhaskar@gmail.com>
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

s/assosiated/associated/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/mv_xor_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index 9b0d463f89bb..8a45861299a0 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -175,7 +175,7 @@ struct mv_xor_v2_device {
  * struct mv_xor_v2_sw_desc - implements a xor SW descriptor
  * @idx: descriptor index
  * @async_tx: support for the async_tx api
- * @hw_desc: assosiated HW descriptor
+ * @hw_desc: associated HW descriptor
  * @free_list: node of the free SW descriprots list
 */
 struct mv_xor_v2_sw_desc {
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
