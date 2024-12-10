Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52359EAECA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 11:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ECF10E390;
	Tue, 10 Dec 2024 10:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EQUb12JY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF7C10E390
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 10:57:17 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-216585cbe1eso17535525ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733828236; x=1734433036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zgUCdWpblI3F1DgOMBM4UZ2prMSNQGxKSsUtwrt9A+E=;
 b=EQUb12JYLOnI+tSt1LIPPau3HgFuKNkpGHqHT7+npmwFl/nqkEpkwlOmrfhNdP4pha
 D9TtBLTd89pioj+AU54+T42qiTdysBWuXLqcANmDBtRa4QTXjPmQP0GyFGl95NKYmrYm
 Ctq23RQB+RoSDkO/D2EA6qAIYcN16CYzXBdczBdfxuhZYGGxClVcKFEfSVd+IJDK6AMk
 0NM4h64A1fG2PCbu2dceltQbv5qSw94re7X61tOq0p2Ooe7t8ogusBb3GOOfD0Hoofwz
 TqnLvqd3sCiVvJCsN77ELaEFyTAwb3juSHfag4sBBgc03RQZTWqRl4I1i1sdbtzWCrGq
 Fvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733828236; x=1734433036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgUCdWpblI3F1DgOMBM4UZ2prMSNQGxKSsUtwrt9A+E=;
 b=CxtF6f5I5PmR2AGywS2nQ8g/6FJRdIYngFVe3iDOa4AKQMJUuig4JGM2mkv4WiNdu1
 4+Fvu+wekZnBWPOoumwEwI6NCToVS+pr9p4iZ5d2vcNTvr2P0MNk2/rpL9FCkqcD7+dt
 tIJ6Lfhcy1KzLoKg46sPDzXaTo8eTB+LrVma1T53AaBjH8vQaX670mnFE6KZ0CB1lJt+
 5Bqecvt4DqvyZ3KusOQgIBHLJ31GFra3B+s8DKzt+AaFltgw2nF860QvROjpdtjzQ0OL
 j98WMVJDsrPpStsaeXjGvR7B6cIv1v6wqIk8qk4xcnqeKSCOXuNf6nYhKkwf1box04qK
 GOzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfwRGe/vsIHOWjiMcIVg93KwCZql00HxJxtRmZ38gZtHzH1jkjGK3nGfsUiP8KrL705Y5QXQN2DSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi7kYtAb6G/g56R5hY22HtCWE7ml6X7TYDdvqNsmBBjKBSmFEJ
 Lk1FIJ3vsXRQIal2mZxH22rQPoGqxPdHE+IJrQcU2sh9IQdU0vN2
X-Gm-Gg: ASbGncvfbM9O5IC3gp3HWRVvAlDLBqM/+LrT2UgWLKEeFppd6Vuvk6ZjXONjxWiKFGG
 fthUrQ0G+GGegokA2pSV1aL4jS8lpBHU7XycIzqQn0QG6+q/tePWJ8fvEtgr76lmjFDbrC9onio
 cwZuvj2AtqgNGnicuRZkrylJ5Hoylq/Kjd/bWSle4nfSensMzOpXfMiWkqm5t5dnKYklbzz2ftg
 H1wARf5hk/eTlKvRBga1/6AOeharhUwTZM9T5DLhKS3jBx7MrDEwjjkK9ZAdBTX2qmH
X-Google-Smtp-Source: AGHT+IFZS+CwL6DlemunV0X7hNvE9zPcFuht9fokHFareRkZRku0/80LFiQQ4eLAdXdtO7akoWhD/A==
X-Received: by 2002:a17:902:e809:b0:215:8dd3:536a with SMTP id
 d9443c01a7336-21669f9985emr60165085ad.4.1733828236463; 
 Tue, 10 Dec 2024 02:57:16 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:23ed:f795:ef82:746f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21615b1e6d6sm71068955ad.104.2024.12.10.02.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 02:57:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible for
 AUO G084SN05 V9
Date: Tue, 10 Dec 2024 07:57:04 -0300
Message-Id: <20241210105705.116116-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.

Add a compatible entry for this LVDS display model.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Added devicetree@vger.kernel.org on Cc.

 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 5af2d6930075..fcb5834f799a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -42,6 +42,8 @@ properties:
           # Admatec 9904379 10.1" 1024x600 LVDS panel
           - admatec,9904379
           - auo,b101ew05
+          # AUO G084SN05 V9 8.4" 800x600 LVDS panel
+          - auo,g084sn05
           # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
           - chunghwa,claa070wp03xg
           # EDT ETML0700Z9NDHA 7.0" WSVGA (1024x600) color TFT LCD LVDS panel
-- 
2.34.1

