Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A434C00A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EAD89A91;
	Sun, 28 Mar 2021 23:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD989A91
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:42 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 7so10924391qka.7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LY04BDMd0/4O0qv+wuAgYKhd3ly3Ph1K7x5mf2r/G+0=;
 b=a+EXa39bteLFKTrEHlbm1+MouCIyb9cV+yaNKyv8dIyxqTAhvd31XrjXWbvHHzVduL
 1m4DojoIjOfiyRN7xcr0QpSrR6ePbNm3KqRQY1gbCFcbd22bLf2BWnHwe8lfTEqTjY7R
 M98mtiq0Pq4n7XXjDGYxi4qsrFmCNnBlY+2L6xSLFCm2xU4u2hVKUVCMMgz+W48T3z+F
 Be8AcFVNT/rv2XLUJvW++tnlcFMq9Mx/WmUVOYgxFXIoTtuxIjemHAh4IiTbpweWxeP6
 Pt8RHzRZ4DYYvL/cvUU4JdOTyLGN/JBiDRnApwCKetCmX6P86BiK0xXGUEADFFqiSdgJ
 skQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LY04BDMd0/4O0qv+wuAgYKhd3ly3Ph1K7x5mf2r/G+0=;
 b=BQ4v7OJMqSkE1Q0eQqpRi19LF0/MVJU3wDeCBReosjwZlNZtcuwy9bWFeD5aWui0B9
 NKMqwgnJX27N5SlG9Kvbas7u3tQ9wB9l2hf0z7Y7+8FL3T/HdSgWPM3oM4a9UZ5hMrmu
 cEEkgKbJTjrDB0VGl2EtTR2jecENOtlSZaIR0tprcqDK7Rmt3HXM/M3BANnQhRA/MSZ+
 jN+/wAz/zpIM+LafTiiwNmQwpLW3jP8QYjuyBKIq0BKKeG3zZbUAYtnIcAuCTXtEOaIB
 IihPFm6QjONiLqgjUujnyBWOjdNCAqjhTRhYJsWRYDnlids2P97zEd2QOBcTRqRdTmR+
 d5Cg==
X-Gm-Message-State: AOAM530m9wgwqH1mKaApT2M9ICvdYsT7sIeC8Msnjp2y0Y2hrtGI/ooZ
 6aKbPXe4g9ucN3n+XBaWCqw=
X-Google-Smtp-Source: ABdhPJz881qq4XaeZFjTiwc+P8rV7shOVJ9Q+7jnFQ8clBo7myE8qUn50lhxUxxhgg0PUTo5fJ3Apw==
X-Received: by 2002:a05:620a:110a:: with SMTP id
 o10mr23879687qkk.281.1616975861492; 
 Sun, 28 Mar 2021 16:57:41 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:40 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 21/30] owl-dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:17 +0530
Message-Id: <2e2a9f4d62fe36079229480bf6f65cea0f5be494.1616971780.git.unixbhaskar@gmail.com>
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

s/Eventhough/"Even though"/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/owl-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 1f0bbaed4643..3c7283afa443 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1155,7 +1155,7 @@ static int owl_dma_probe(struct platform_device *pdev)
 	}

 	/*
-	 * Eventhough the DMA controller is capable of generating 4
+	 * Even though the DMA controller is capable of generating 4
 	 * IRQ's for DMA priority feature, we only use 1 IRQ for
 	 * simplification.
 	 */
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
