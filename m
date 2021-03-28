Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848BA34C023
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A6A6E3D8;
	Sun, 28 Mar 2021 23:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCF26E3D8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:58:17 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id 30so5685002qva.9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y32tInUapaLYbNEAI6jhNwCPrGHOxbt3T1h9KOpxef0=;
 b=IkSy4D1TkXi7lQMZ6smgafSA8mBcR9dJT0+IXc5N37pT9vxabM+SLMm50H4wvaA2Tp
 lk2+hXnLnaOUCms7sELVhOI/WPyeZdnXsdinIxZIuQnUF61PVACtUXO8CzQJmpUg/8F/
 kd/qUNl45u1Q/Z/y4MVvg7AMaZOTYLhOVHKm6Nt+ekWZZfILUbrp2yYgvZ/PqE0UZkxu
 yfiYNr5lsWA/xZeBftAd/5ys7cnmg2vNyOHsMfAKtVfKra3pkeqYar1Fa02kv/vB8uJB
 v4N4zgVPfp5L/JTA/n+36bVEt3mIlRbpaEf64PY4DjGrJu9ef2ZC8nn+a6/daLkbdFVL
 X/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y32tInUapaLYbNEAI6jhNwCPrGHOxbt3T1h9KOpxef0=;
 b=E4Atoj718bMegPJs5x9em6LUIvs0tXMadZLG1AIRjCNHlQIsqMNqXUd6nYDFjqb0C1
 AqUlMZdi7unmYd9iAPX68pWt1+qOq/CSF5fZ6zFWWfC8qmkjT4wEIHbMKxu5EguMQ7/1
 D/RL/TdtOnWgQrKEfCc+21iSwg/hUWnplOdr7uoEB3kEtnAkdSEv2O412L9yONtqqxQq
 3kL3oYradR/oVSUeex3FiOHxxDZcC9L4OvnHkQcWq80alBTdqNaWrwlDIDkKaWGsXpMw
 g9y83qggsK6wyHypuTxOycCIV7r43KQ2orMtyvd986PTNDvYuIw7BfSH4PghUDyD9FFl
 vdlA==
X-Gm-Message-State: AOAM532zET+feH13ALrZQnjT8B6wqkMa7wfMsmIaqmDA87W13XnpY7zJ
 bM/NJ2pbxfiV+DQrKXPQXAo=
X-Google-Smtp-Source: ABdhPJyWc3zpPzhGmj++XGZnoiKJeId7+5rJvoWlZFi+DgW1DNMSXYY/0RU9k5f3zIa31roOCCmQaw==
X-Received: by 2002:a0c:df02:: with SMTP id g2mr22816522qvl.40.1616975896740; 
 Sun, 28 Mar 2021 16:58:16 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 28/30] usb-dmac.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:24 +0530
Message-Id: <7458e5dc5058076cf2ebe15de57c94927dcffcca.1616971780.git.unixbhaskar@gmail.com>
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

s/descritpor/descriptor/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/sh/usb-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 8f7ceb698226..7092a657932b 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -301,7 +301,7 @@ static struct usb_dmac_desc *usb_dmac_desc_get(struct usb_dmac_chan *chan,
 	struct usb_dmac_desc *desc = NULL;
 	unsigned long flags;

-	/* Get a freed descritpor */
+	/* Get a freed descriptor */
 	spin_lock_irqsave(&chan->vc.lock, flags);
 	list_for_each_entry(desc, &chan->desc_freed, node) {
 		if (sg_len <= desc->sg_allocated_len) {
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
