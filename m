Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1D120EC2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A2E6E5D1;
	Mon, 16 Dec 2019 16:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9012 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 16:04:29 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBD06E5CE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:04:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGDYGd3071602;
 Mon, 16 Dec 2019 07:34:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576503256;
 bh=dELvI4BAeWfOz6uHqxMu4oF+CyqFiUIeyqmWRfl/yac=;
 h=From:To:CC:Subject:Date;
 b=qpp7vjXyMAjCjO9aSCiEqLD3FKZHIAHxgAQOmW6EJJYEUKNdj4bsAcJqtlwTzSFDk
 XkAtqIhLuCAZZE48GUiTrYE6OI9cb0vv4vlMsNdQXG8wAwxbIj3xuj3tW3cIBLYygL
 tqFM7urkHO1OwjIaIwZCkJPEcyGAJehxYXbb4UN8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGDYGNN015374
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Dec 2019 07:34:16 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 07:34:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 07:34:16 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
 [128.247.22.53])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGDYG6H065514;
 Mon, 16 Dec 2019 07:34:16 -0600
Received: from localhost ([10.250.79.55])
 by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBGDYFu29059; 
 Mon, 16 Dec 2019 07:34:15 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, John Stultz
 <john.stultz@linaro.org>
Subject: [PATCH 0/2] Naming changes for DMA-BUF Heaps in drm-misc-next
Date: Mon, 16 Dec 2019 08:34:03 -0500
Message-ID: <20191216133405.1001-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,

This is a quick series to cleanup some minor naming issues in the new
DMA-BUF Heaps series on next before the names become ABI.

Thanks,
Andrew

Andrew F. Davis (2):
  dma-buf: heaps: Use _IOCTL_ for userspace IOCTL identifier
  dma-buf: heaps: Remove redundant heap identifier from system heap name

 drivers/dma-buf/dma-heap.c                         | 4 ++--
 drivers/dma-buf/heaps/system_heap.c                | 2 +-
 include/uapi/linux/dma-heap.h                      | 4 ++--
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
