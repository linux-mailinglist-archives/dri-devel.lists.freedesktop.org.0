Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1B1C0EEA
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977F6EBA6;
	Fri,  1 May 2020 07:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73E36EBA6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 07:40:03 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id e6so2071098pjt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 00:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NSH9BerjJoV88xjF7QVK1SklBZqxZKa42SGy8GT/SY0=;
 b=gMfRkU6y7H6ig9SB1voFB4Yprbz40Y65m2Mu8m2ApDv+jlMCQ2E6B9PMumov1+nGbF
 45e9GP/a2A50GpZUNhd4HGTouy7LlSl5VzwQlUCMs1AXhJXwuMJcLarUGrUkRjxNS0+s
 CyzTAHjlmacCveMfha1bTwwkBCOPfUE7uuSPucD0Z+vxu1J/f4pWD34fBtGcMp6CN5j0
 WMzgYCWeYRnk5hwW12qNNwjCMvrO4G4QzAW5V1SgWMWdDrFL1f6Szn68URsUfcJpdrLj
 vJQtM0xsiQq2qKPoVohGRHexTuBl0Itj2tNgGnXC3UD9PZdIeoJ518WZvDOK9dLvUKuk
 HzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NSH9BerjJoV88xjF7QVK1SklBZqxZKa42SGy8GT/SY0=;
 b=WixncW8p6RUH7nP7X88/Wn1KLWVPuBkUmfbkKAudoKY9GLoYzSWQkMKD2WkG8gdPMf
 4Tjrx47hn1RpEleaaw9ukPeIPmM05LxvV9M4pLqKuJWKWvKIPfKodVl7QGKkUV3oVob5
 L+sDp3B0KSmBIU3nvKfVvNjC2nIG9UA3w2Oij4fe/arEgtSCW9r64TcWt2AdVE84hY7T
 IAbbmDmRID1VWJnsPxZOXJ36PqgoGOhhlmBZJYn+z3v06gQfPK3/X3hBXo0yGdy+s4e9
 kwoySGFcdy/3SV2/Omm3uCrpmRuW94MJIjRTBa+AVRuL3OuM2PcjauVpeFxncrN4GNZ/
 YKew==
X-Gm-Message-State: AGi0Pua8Ry0NUzFbYXtZ1ePu5S6DfpZvRq6G36G/BxaWVhFS8BlkXJKo
 aWPiJJ6YO0rrY3DI8avM8sYW8Q==
X-Google-Smtp-Source: APiQypJx7E4+GSzc/77OGnxoI4XuIbUstaIsftZ+TRzVjzHs+hgtNb6KovPmKD4Pj3wjrWGJONPmuw==
X-Received: by 2002:a17:90a:734b:: with SMTP id
 j11mr3082377pjs.108.1588318803469; 
 Fri, 01 May 2020 00:40:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 w12sm1557841pfq.133.2020.05.01.00.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 00:40:03 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 1/4] devicetree: bindings: Add linux,
 cma-heap tag for reserved memory
Date: Fri,  1 May 2020 07:39:46 +0000
Message-Id: <20200501073949.120396-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501073949.120396-1-john.stultz@linaro.org>
References: <20200501073949.120396-1-john.stultz@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sandeep Patil <sspatil@google.com>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm@kvack.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a linux,cma-heap property for CMA reserved memory
regions, which will be used to allow the region to be exposed via
the DMA-BUF Heaps interface

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Chenbo Feng <fengc@google.com>
Cc: Alistair Strachan <astrachan@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mm@kvack.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../devicetree/bindings/reserved-memory/reserved-memory.txt    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index bac4afa3b197..e97b6a4c3bc0 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -68,6 +68,9 @@ Linux implementation note:
 - If a "linux,cma-default" property is present, then Linux will use the
   region for the default pool of the contiguous memory allocator.
 
+- If a "linux,cma-heap" property is present, then Linux will expose the
+  the CMA region via the DMA-BUF Heaps interface.
+
 - If a "linux,dma-default" property is present, then Linux will use the
   region for the default pool of the consistent DMA allocator.
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
