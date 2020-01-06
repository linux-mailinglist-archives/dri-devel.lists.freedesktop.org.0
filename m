Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01E1314A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3FB6E48D;
	Mon,  6 Jan 2020 15:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A15C6E48D;
 Mon,  6 Jan 2020 15:17:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q6so49920141wro.9;
 Mon, 06 Jan 2020 07:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QTATKa1I/brNCXy5ctrzq/kPifJjU9NvH+Rz1RlC3aY=;
 b=f/IKZyl31LfJrVY5YXqZ05+9WggKo9IvavhNUEF3sn2p9ifbHP+sHHltb0/vhMx03d
 +Hyg9f5TdWLmTloyEtb0XDHBLeNsf5Pg4/wEyusGE+DkfI9/1qc8uTy3IDZeiYBjIKSw
 p1X0tDS2ywc6HfqxZS7zTiXond0ArEScI94dvXa+uwexiefD8cOzqaQMeDfdPHQbBmNr
 uV2/AjaGDa9/gBNAgseF2i5QjfF6ReIaJODeDgs66OUm8SgPWA+coo/NjK/hOqVlbn7j
 1j3VyC0fkWrhQZeByjZWRymR2eaUTn2Zafqu7kI1qm4IIxpeDtTX3dfBhf5YJRXaaSSb
 +kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QTATKa1I/brNCXy5ctrzq/kPifJjU9NvH+Rz1RlC3aY=;
 b=JXX0z4wwmBFdMzmRUNwo2KAjhkfZeXNynFbCf3Q6g5ekodwGsqav1/3Aukqty42glt
 Z1ybtC+ISb4O4cFUgKjH4YMCk/broTv1Udd3o84HMgwj5Yb0G3b2OtT7eqsdAm7aiuyg
 rAWbJbjv2KnfWSF3Kjnl6mwoZP7Xz/391j5w7IKv82C8fuA2jUpgdpQ5bcRQWIfzOJD2
 nJsjfiRbXZQjRFFelTHZauOAVh/ILFoYIpz/VurXenTWvy48KYzS4uTJAgVdlht6B2Vg
 QZqGb29lFUfDdMH9emtYtYb9uQQrcmhc4Ycd/BoD5vfKZbSnqHfdI+EHC4YhNghagULz
 meog==
X-Gm-Message-State: APjAAAWAH9goF/NDpBxuQiPB/4gZoecSyh/4UC7bt7epcoF1nRl3ZWpv
 4cxe52cGdlo5E9L0QELtzTD42wthfdI5pQ==
X-Google-Smtp-Source: APXvYqwOfDIXvuUaoerrXnYtTZ+//ZcXM5cJgHB0dNnbhq/StXLT19K7hNjaZNl0VgAAc85dhTA7lw==
X-Received: by 2002:a5d:4281:: with SMTP id k1mr107260578wrq.72.1578323830130; 
 Mon, 06 Jan 2020 07:17:10 -0800 (PST)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id l3sm72122463wrt.29.2020.01.06.07.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 07:17:09 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] drm/etnaviv: show identity information in debugfs
Date: Mon,  6 Jan 2020 16:16:48 +0100
Message-Id: <20200106151655.311413-4-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106151655.311413-1-christian.gmeiner@gmail.com>
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7ee67e12141d..151033d58bfb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -860,6 +860,13 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 	verify_dma(gpu, &debug);
 
+	seq_puts(m, "\tidentity\n");
+	seq_printf(m, "\t model: 0x%x\n", gpu->identity.model);
+	seq_printf(m, "\t revision: 0x%x\n", gpu->identity.revision);
+	seq_printf(m, "\t product_id: 0x%x\n", gpu->identity.product_id);
+	seq_printf(m, "\t customer_id: 0x%x\n", gpu->identity.customer_id);
+	seq_printf(m, "\t eco_id: 0x%x\n", gpu->identity.eco_id);
+
 	seq_puts(m, "\tfeatures\n");
 	seq_printf(m, "\t major_features: 0x%08x\n",
 		   gpu->identity.features);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
