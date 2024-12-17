Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321529F4BBB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F82510E2F9;
	Tue, 17 Dec 2024 13:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I6xrl8kr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976F810E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 13:14:40 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-725dc290c00so4847493b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734441280; x=1735046080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=axyAQhPj9nhVil4KAAnIiakdiidmvsJlf9IRfQkGvmI=;
 b=I6xrl8krvf5wXRTNRyKUVYmd7eFrkFj5O3711VZ6E4uSiKsPE/eLgFBmUGA1iKPs4E
 V598XOMj6rjt4uFDFwsGenf0EOC8H3U5nr6gH8w0IaMl61ZZ6m3n+eAKFZXYFcsE3V09
 CGqq8f+OLaYsaXynzswUdVWt/sZdSMeLMKwR0B1VI3RYNzmH0gSF66Y5I3vkEAb1bE5I
 hSo+2UBUOzrDFQee+LTMlu7JT4MDHzP7SB6LGTgpSpVN6gEI74ykXcxlJ5P0pkljA8o5
 u6CddODPSyQyvM5CUuVqj8NMnmalJfZMwfRL8nfbV+2RYdzn7x9568UpQUpXiXCZC31q
 g0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734441280; x=1735046080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=axyAQhPj9nhVil4KAAnIiakdiidmvsJlf9IRfQkGvmI=;
 b=GlofNpUpoWeHjhfDgXnucvTOKKe8X4fXXsMp3NKT3x9fiz97xU73E6r9n4hmdkDe2j
 VxUd0c7/PBKjWtn3AVH4DFuSNem0REL+CecfC78baxQN73zxG12y4niJTgj+DqN4+6I/
 BsSjZqEuLGe5z05uf86vM/p4N3SHboEQkecjw5AHoRgChxx1pHOCrTPPk3UPeXU+Q96F
 OGHpTM6jtkIgCuvdmVX0+KHWZYo7FysueoC/ahU/he2yCOwxjX3MLxIroRo40F+xPtNm
 yTogOkJIR1uN5zxfNmjdtUHGP+/dgDobk91EfCkCB3vbxltai7Sk8MuVSf0LdsLVlYeV
 FuGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR/NAaEBX2lsQWNquE933YGTSmlIQHdy2D9Wj0RMpQV4Y7cbptnvsGek/pANCCQjpZezh78oB9BVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGTj9QCShVgc5LB87ygh9ml1zCBJm3I7y7KctyA7+hFwTGl1xv
 hTsPdkc4Qvpp/8ZT3VVlAw46zyFVJCkWHs/DjlT/lLas7WAu6viSZMEsQQ==
X-Gm-Gg: ASbGncvptZwP7/FSxirneeeULtAR1MlZo5M0a/cxdI32OIkpk5j/epkdl7rJERN1doz
 ceINp8KPgsfjwjhl1z+4+oX/4+SUxD/ChwouPQNvxWITb586mWo23iZEyj0aiAyLbt9lKhoMr0y
 d0ZVRxGCUmkm0C4KHZgXANVOEYX2zBuWqeulk2of/gOXJtRVAgJ1ej+8n8t/i8vex16r1F3wS8g
 zyJbkX2UrrZtQLutEn2YxknnJATOUFsaF9PLn+GN/ECDRBR2pgvf6OeTrfOAoHAY8FZyg==
X-Google-Smtp-Source: AGHT+IGHcV/NHnllfqv7fR/hLPWE8KERD+FbPGD/o3fwg+D3eyN5ic8pO6VhkBpEn8TBSM1LxM5IEg==
X-Received: by 2002:a05:6a21:3398:b0:1e2:5c9:6831 with SMTP id
 adf61e73a8af0-1e4e779760amr5123201637.14.1734441279972; 
 Tue, 17 Dec 2024 05:14:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:2d08:94b1:8dd:a583])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5acf064sm5821625a12.40.2024.12.17.05.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 05:14:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: samsung,mipi-dsim: Document fsl,imx7d-mipi-dsim
Date: Tue, 17 Dec 2024 10:14:31 -0300
Message-Id: <20241217131431.1464983-1-festevam@gmail.com>
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

The i.MX7D MIPI DSIM block is compatible with i.MX8MM.

imx7s.dtsi uses the following compatible string:

compatible = "fsl,imx7d-mipi-dsim", "fsl,imx8mm-mipi-dsim";

Document "fsl,imx7d-mipi-dsim" to fix the following dt-schema warning:

['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 4ed7a799ba26..a036c2dcfd86 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -29,6 +29,10 @@ properties:
       - items:
           - const: fsl,imx8mn-mipi-dsim
           - const: fsl,imx8mm-mipi-dsim
+      - items:
+          - enum:
+              - fsl,imx7d-mipi-dsim
+          - const: fsl,imx8mm-mipi-dsim
 
   reg:
     maxItems: 1
-- 
2.34.1

