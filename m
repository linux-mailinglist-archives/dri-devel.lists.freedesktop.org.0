Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A692770E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 15:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07410E067;
	Thu,  4 Jul 2024 13:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OFjG1iMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973C810E067
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 13:21:50 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7066c799382so412788b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720099310; x=1720704110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zxv4zWBK4FG19nclOzgciDpwXeW+GGBMkHfutZYKU+g=;
 b=OFjG1iMZa2x7rLC3nwPsNXW7vxkkQKaf4bfcvCBd+jH4G/YDTx81EYBluc3immkeYY
 xCf7OZPmbjKYlc7r12eHu1gpfCeCtZdBi8CKmlPcMEBWLzAih8v3rgqLqpLfJnr7cEtK
 QoYO6pk+zZBfaiiCgDGpwa7iCwnO18bpUs9jiq2LX5fy3l4HMey+/rsXwm1ecbt6Cznp
 ZYG3x9AC6rgoXcgnB94nAD/KKypopIjrQzzCXU5GvuRP4hhzJ9n4qcRwie1h0MBd0DK/
 Bowz80Bm8h2mJloix4ofqjoxaAI/ZK0YLM6SSnjWUzNm70vBRAKCgdpEHd4UumBOef9v
 /cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720099310; x=1720704110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zxv4zWBK4FG19nclOzgciDpwXeW+GGBMkHfutZYKU+g=;
 b=T6Jfm5WdoR0+qN9Z2B56BE4TDqhsyiQOlsROLeiMD6UNPNpP2Q1SmA2tZtUDydvXFS
 L1BaYPBh9OVB6yP/v1hIcbfgQKLTCLnNpQxWvXyGV3i9hwN3MwiMv7gmFfE/OVp9SoxS
 s8JUBKfOeKaKjvxALtrdJ29EnkxoJ7Tzsg2j1HlsMsIi7ZJRmUgQ8cOuUU0+mcOo+t6I
 SfVFrOyrhZTh/zWtMj/gLKFl0B9pv9zFnXeDaLtqI3Eem8V0JsMMcrz+EcPSHCNLWEoh
 YHoz+dViNNgFLjwO7Lq951XClTFjbjctkQMQnTcQHqkTLSrrjLGRKhYzGdOA5nZD0tEo
 f8RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6CKaJLfn9IgpS25MQpIMxOYxQlIKQeO02oUqqT3tatYwIwysWcEG7V7TicNhf5/E3hYL2BbY+jFvGlZrNJ6LqCr79dlW6Rwj4QGt1kjgf
X-Gm-Message-State: AOJu0Yw5iYiwxWL10N5zZSsdBnXRoSCN1j71SPKS7mqfXeQqAEF0u2D3
 CB56likpID0y30qkxpjhkR8a+/fsjymYetnmPrl7NcCAHUV/feCA
X-Google-Smtp-Source: AGHT+IG1LfZ/JBubCZYsSHvhki2sszTRErOK4JEkHtWrxAk7vstk3ejVZH+SNcCxdensOuBZaoq2cQ==
X-Received: by 2002:a05:6a00:3cc5:b0:702:65de:19e5 with SMTP id
 d2e1a72fcca58-70b00ae8bc2mr1974332b3a.33.1720099309945; 
 Thu, 04 Jul 2024 06:21:49 -0700 (PDT)
Received: from dev0.. ([49.43.162.39]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6b397c9esm8253522a12.49.2024.07.04.06.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 06:21:49 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 jain.abhinav177@gmail.com, julia.lawall@inria.fr
Subject: [PATCH v2] gpu: ipu-v3: Add cleanup attribute for prg_node for auto
 cleanup
Date: Thu,  4 Jul 2024 13:21:42 +0000
Message-Id: <20240704132142.1003887-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cleanup attribute for device node prg_node.
Remove of_node_put for device node prg_node as it is unnecessary now.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
- PATCH v1:
https://lore.kernel.org/all/20240702150109.1002065-1-jain.abhinav177@gmail.com/

- Changes since v1:
  Enhanced the commit description to better suit the work being done
  as per the feedback in v1
---
 drivers/gpu/ipu-v3/ipu-prg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
index 729605709955..d1f46bc761ec 100644
--- a/drivers/gpu/ipu-v3/ipu-prg.c
+++ b/drivers/gpu/ipu-v3/ipu-prg.c
@@ -84,8 +84,8 @@ static LIST_HEAD(ipu_prg_list);
 struct ipu_prg *
 ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
 {
-	struct device_node *prg_node = of_parse_phandle(dev->of_node,
-							name, 0);
+	struct device_node *prg_node __free(device_node) =
+		of_parse_phandle(dev->of_node, name, 0);
 	struct ipu_prg *prg;
 
 	mutex_lock(&ipu_prg_list_mutex);
@@ -95,14 +95,11 @@ ipu_prg_lookup_by_phandle(struct device *dev, const char *name, int ipu_id)
 			device_link_add(dev, prg->dev,
 					DL_FLAG_AUTOREMOVE_CONSUMER);
 			prg->id = ipu_id;
-			of_node_put(prg_node);
 			return prg;
 		}
 	}
 	mutex_unlock(&ipu_prg_list_mutex);
 
-	of_node_put(prg_node);
-
 	return NULL;
 }
 
-- 
2.34.1

