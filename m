Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3D80DBCE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 21:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A7410E0CD;
	Mon, 11 Dec 2023 20:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934E310E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 20:41:46 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-286f3e0d010so1485735a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702327306; x=1702932106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=StSaVFlGCo/Vj/verM8F+5UMgXGzA29ZE2bsPlt2dRM=;
 b=KSm0vIly9dVAYOMI3x8rtgboVGB55yLnPRD6gv836VCcfLD10bkMc/zphu6E1exuJ/
 aKlPZzce/ko9e3VK1s9A0qL54XhPkipV8eihqDLTP928hTG3TAXDho/lWItxCTE7/CAW
 z7k8bBQXMBMyWVMAnEVbO3cFmBUVqZazAcDORAjpKbr35bKXK51te7OWy8svGOrlnZYN
 3vQMtxf8x9xDmB6dliLxBG5uZe8ME7MUCQgWoUi4eDStvlZrGz2W+ZOSd0K6QhT24xhl
 AIfFoxuEgBhsEonIoXzbIg3J8bAtDYf61K5mI8wN4hjMDoCsxN8nWnUsWXD2BkZ9MdCe
 DPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702327306; x=1702932106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StSaVFlGCo/Vj/verM8F+5UMgXGzA29ZE2bsPlt2dRM=;
 b=sFilsUGoKoqSAp0FvhJhDsKIEEI5st/17eVDJ0eIs7KaX5dbldwnF7tIMnZocXLmEl
 lHwfA3LiYbMGxU107OyufF6pwKq5npKDRMHzzemjY0HVk76R5YVWNWVNxA+6ZIdo9yxJ
 DGA4oqSwKlPoS6lhGAvlLZlDlOZhbYSm5DdQnkaNG77z9rmHK9WKmM32QnZwJCiN16A+
 GCyL4Vx0IjmrXo6tubs3m5F3GXIVejB62hH/iJ4rRzOHUBFJuiHLR4M4U4f5RiBLX6hO
 abSMsDnZKMmEslaB7E1dRA+nJ59J9B1cv7hdabgRNue8fUoFNdG86MGWYzV+YBxLsPgu
 MMpA==
X-Gm-Message-State: AOJu0YztNYz3uSIqTcFJmnlZ7IiHFqbxRxeh0w5CIriJCPICKJGz8exC
 PK9SvOX0BGVlCSTHdmfK9jTuRAPVl1s=
X-Google-Smtp-Source: AGHT+IGOh8Sn6IwFAIyLL33Ud8dcdOeXPZF9GpbVfASspw8GJ/jw2ilY9XZtNp9p2nIzJINTomJ29Q==
X-Received: by 2002:a17:90a:c285:b0:286:bf9e:a6 with SMTP id
 f5-20020a17090ac28500b00286bf9e00a6mr8687075pjt.4.1702327306123; 
 Mon, 11 Dec 2023 12:41:46 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1d51:eaf7:9aaa:d7c])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a1709027b8e00b001cfc4d8ede5sm7124809pll.301.2023.12.11.12.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 12:41:45 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: marex@denx.de
Subject: [PATCH 1/3] drm/mxsfb: Add an entry for "fsl,imx8mq-lcdif"
Date: Mon, 11 Dec 2023 17:41:36 -0300
Message-Id: <20231211204138.553141-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, martink@posteo.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

On i.MX6SX, the LCDIF has an associated power domain.

However, i.MX8MQ does not have an LCDIF power domain.

imx8mq.dtsi has the following compatible string:

compatible = "fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif";

which causes the following dt-schema warning:

imx8mq-evk.dtb: lcd-controller@30320000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

To prevent this problem, add a specific fsl,imx8mq-lcdif entry in
the driver to properly handle such a power-domain requirement difference.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index b483ef48216a..ac9ce3b45b38 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -340,6 +340,7 @@ static const struct of_device_id mxsfb_dt_ids[] = {
 	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devdata[MXSFB_V3], },
 	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
 	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devdata[MXSFB_V6], },
+	{ .compatible = "fsl,imx8mq-lcdif", .data = &mxsfb_devdata[MXSFB_V6], },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);
-- 
2.34.1

