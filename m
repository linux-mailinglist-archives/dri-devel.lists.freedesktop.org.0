Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2434C007
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC918987C;
	Sun, 28 Mar 2021 23:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA2689819
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:27 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id o5so10967614qkb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/yLPPo841dOFvgXTquZIbBYSrAfKw7ph65+PVkCETM=;
 b=kqSj7aCUIqDznfRqoW0QgxanHBokTPho/STAgy/fC8CA3oXoCgHhFZhBx0bJLndhc8
 wZXHyS8nNnyL4m3H41Q5sXrJUArJwb4e3uvpRO6ZiiPmvqonD2DdrFEfo3DQvOZ5GNLc
 saLjVc0lRUjJtgagE8u6Yu8CITfDcO85EeHQWIC6qGIwBV9GPuHXwhP71WdYcSnqksrV
 FNU26qKEnM5rl5JDN5FsqwYdmveQ1Fh4viKid8oVbsEdm6o45iKO9Hgzr7Yxaox21zzb
 ww77wgJoQflTxFMPJgrI3Y4ozqFjMr9xfHfwriPaNfSlEl7FNt79jmEG4sqtEa2Qq+uS
 lsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/yLPPo841dOFvgXTquZIbBYSrAfKw7ph65+PVkCETM=;
 b=ke2nWjxkrUu2pEaGGjpalc/gOsJT38CTJ4w3HwEBL/g/kKdPHZaecAagvOuXnXoXoT
 lq2SwgdVDOrmoYOdF5iukKzZWMfKL7dwLDhKnRt4FZAXLDIw4882q+AQnvZ2huk/FOoV
 aQjlnObqDhQNNIZRSlgvDVk1lpT7mgIbxkUSIUr/ZXXDmNodCjPDQPKjGa4aQxJgFYCd
 ySZ9EruT+zIEQvvIhdLRa3WZwAvwJSN397Kkx5THCoJ9U+adNdZJVsGTtqB1ZlxK3mkp
 6QZj2As9jEKLGZwpWuT4GoyExxB86qiSfTVBVD9jwkmnsha+8G9QOzqdEk5sMklEfyxz
 vfoQ==
X-Gm-Message-State: AOAM5336sEVpKZf6uthUlNBIFHFkbX/yfHIV21jpGFJTIn+blQVC2q5/
 gpsAxMooIwnQurrKEXbf7Vo=
X-Google-Smtp-Source: ABdhPJzlIJVsP1+e9L67X5sWl3v37tzXkq6IkG/ls+Iz+DhefXkxs3HuwQvPjNj/yaULuKiNhdk4uA==
X-Received: by 2002:a05:620a:1650:: with SMTP id
 c16mr23014988qko.477.1616975846867; 
 Sun, 28 Mar 2021 16:57:26 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:26 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 18/30] tegra20-apb-dma.c: Fixed a typo
Date: Mon, 29 Mar 2021 05:23:14 +0530
Message-Id: <58f465e8c502b9f5cb07a2174a8103133defcbb9.1616971780.git.unixbhaskar@gmail.com>
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

s/programing/programming/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 71827d9b0aa1..e64789432587 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -475,7 +475,7 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,

 	/*
 	 * If interrupt is pending then do nothing as the ISR will handle
-	 * the programing for new request.
+	 * the programming for new request.
 	 */
 	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
 		dev_err(tdc2dev(tdc),
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
