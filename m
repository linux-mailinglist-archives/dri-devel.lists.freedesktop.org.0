Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C52C6BC8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D407E6EE9B;
	Fri, 27 Nov 2020 19:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238006EE9B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606503919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=P4J8EBWPnBVFoHBHwgQRXiVw93w2If7dqdzr9ZCw24E=;
 b=Lrl3SVkwz09rxmFmoz88Z//jYaOIT/RHdEUn5ZT1TEC6dE8nUyzibu+SaFvVZG8SaWPoMn
 87we0cqMMNUk8k282+VvbNUshiBu5gPqLN/+HoOvMpSjvOm2emuCC+LSQ8VE3tnUeMYXOc
 wQgrdu6RadAhvAM5TIiiYcYSZhkDAfE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-LKqHt0xAMK2wSZ6iXX-X8Q-1; Fri, 27 Nov 2020 14:05:17 -0500
X-MC-Unique: LKqHt0xAMK2wSZ6iXX-X8Q-1
Received: by mail-qk1-f197.google.com with SMTP id v134so4218046qka.19
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P4J8EBWPnBVFoHBHwgQRXiVw93w2If7dqdzr9ZCw24E=;
 b=QiWBqSXlXXU266B4pmOROEvdFzDgeAgjA2Nx5BiGwbfH1dTn3y9Hzga5tJyORVGp1Q
 C5jzEjsX4els7Kaf7w7+78mxIc9hOldSPWRJXycgS3Pmswcb8CWMoPPEHL5YJ4GdbwYe
 hv3gloAYHJ3UlQWW78dZG2NnEtJmaYe6YE8E49r6F8HJ2xh08438YX0Uj7JmdXRdZ+tW
 q9131eFG2Zx4NbhDzuf4Fhq23eW3E6ifOuBcVCNcBYUUcgV/MpmF8T/B13J96CZCK7iU
 AieSr0KPoIY0UenWoxYweuUrYQUm2yZsxlUoV2cJVe6jFHAR+9Equ2yMveNzoxo0rFe/
 NrpQ==
X-Gm-Message-State: AOAM532DATxKSEpelbNSz6etCQE361nyLnBjTL574sz9QVEsBgRqqXH/
 lSK6/zVY8nn4YwEPoCmiM/NW3vn8B8JLHFUVikwdkn3aLAV2fLloBB19E9sIamxlhCfkVzgrKyW
 TAx7Zl2IvfJCTZk4WLa93btUYbZui
X-Received: by 2002:a05:620a:22eb:: with SMTP id
 p11mr10254698qki.224.1606503916860; 
 Fri, 27 Nov 2020 11:05:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlHMd5iGgdFcDE7TXlKessUY1X4ETN8EOl5uRxiIteKlzhnCF61nP8e6tAtR4EIGlPYbb+vw==
X-Received: by 2002:a05:620a:22eb:: with SMTP id
 p11mr10254684qki.224.1606503916681; 
 Fri, 27 Nov 2020 11:05:16 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id k128sm6806898qkd.48.2020.11.27.11.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:05:16 -0800 (PST)
From: trix@redhat.com
To: b.zolnierkie@samsung.com,
	pakki001@umn.edu
Subject: [PATCH] omapfb: fbcon: remove trailing semicolon in macro definition
Date: Fri, 27 Nov 2020 11:05:08 -0800
Message-Id: <20201127190508.2842786-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
index 3417618310ff..cc2ad787d493 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
@@ -75,7 +75,7 @@ static void dispc_dump_irqs(struct seq_file *s)
 
 	seq_printf(s, "irqs %d\n", stats.irq_count);
 #define PIS(x) \
-	seq_printf(s, "%-20s %10d\n", #x, stats.irqs[ffs(DISPC_IRQ_##x)-1]);
+	seq_printf(s, "%-20s %10d\n", #x, stats.irqs[ffs(DISPC_IRQ_##x)-1])
 
 	PIS(FRAMEDONE);
 	PIS(VSYNC);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index 6f9c25fec994..101fa66f9b58 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -1554,7 +1554,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
 
 	seq_printf(s, "irqs %d\n", stats.irq_count);
 #define PIS(x) \
-	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1]);
+	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1])
 
 	seq_printf(s, "-- DSI%d interrupts --\n", dsi->module_id + 1);
 	PIS(VC0);
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
