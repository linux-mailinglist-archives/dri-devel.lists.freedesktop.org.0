Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D117E73DE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 22:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0BF10E928;
	Thu,  9 Nov 2023 21:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8D310E92A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 21:50:17 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1f4a9dd83d6so71856fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 13:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699566616; x=1700171416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOIInztUelC8mrrk/uWmLptClIvVfVoKK3NnyJG316E=;
 b=OyhWfq039aPSr66eoqjjSvV2jFExa63GEvBC7Xlv6DEbb8nq2YNKI9CWF0Lvt5YlPL
 2d1H/wL2doiOEuFi0PZ2yEFZey8Ds1fTJ12CkaCMXIkd3JQBwnOFLX6sF+nbJ8pZZL8F
 EA1o/XYQD053ykue0c7MV1kqcxAUCs7EXS01toYWeB2HcoRgJi95yu85OugXkEJR01By
 AfVadvRj5zgTtaKvCUoJLzQWlvL2vGP/1QrPRNsI3fPOhGhe7myDWhBPPevGzxqzfDY4
 TWmZISjcMUeNXaMAPAhEQozmOxEgefSmNBAxJVUK61/XuLPhUssBSjxKxHGgscLG1yuS
 94bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699566616; x=1700171416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qOIInztUelC8mrrk/uWmLptClIvVfVoKK3NnyJG316E=;
 b=DAznIFt9/N4wCNKm4pFea/Z2gmaL5LFnSOiP5lo/tqLBL00m3VkpxV7soioF9s3WUE
 FE8l2oh4DB+1PtRJcVAeYYFqjem86U74iEffncJWPZbq5zWrvbZVuHflyPy1XN0OEHjg
 KDn9aNdj5byJqhvftzZDKhXKYv0W9dhGMNiOkzp6sxEMho7y/JAYIQeaqePTuiSDMWI4
 zVXrq0ojlnqN8ARhUdj3AHclb64pdl7FsiWruVzuEfoYuVUma5l5UwcpViNjtxXBn2IW
 doW6jLZih3b3rrZDlaQ3oKp1vfsr1P0N+YBD8WIOIOyFNUoH9QjGgvj6oPL59ZKUn3wR
 BDIw==
X-Gm-Message-State: AOJu0YzpM5VAbUAkyEafjqMTOPUeNsNtzwGVOfr97VZKtMYLGOg7X2/x
 F0icqjVLdP2Yvbm+w/GecK0=
X-Google-Smtp-Source: AGHT+IHkwhRJa6UQv0a+N/kr01xqCaRwiUsLDnT12DrqEx72ojhNPbns7tXYrlhU6YlgyYlLVsA/qQ==
X-Received: by 2002:a05:6870:72d1:b0:1e9:bd5c:ae38 with SMTP id
 o17-20020a05687072d100b001e9bd5cae38mr6871083oak.2.1699566616706; 
 Thu, 09 Nov 2023 13:50:16 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 tp22-20020a0568718b9600b001d4d8efa7f9sm864003oab.4.2023.11.09.13.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 13:50:16 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 3/4] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date: Thu,  9 Nov 2023 15:50:06 -0600
Message-Id: <20231109215007.66826-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109215007.66826-1-macroalpha82@gmail.com>
References: <20231109215007.66826-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC. Group the Powkiddy RK3566 based
devices together as they are both extremely similar.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5f7c6c4aad8f..5b015c4ed775 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -674,9 +674,11 @@ properties:
           - const: pine64,soquartz
           - const: rockchip,rk3566
 
-      - description: Powkiddy RGB30
+      - description: Powkiddy RK3566 Handheld Gaming Console
         items:
-          - const: powkiddy,rgb30
+          - enum:
+              - powkiddy,rgb30
+              - powkiddy,rk2023
           - const: rockchip,rk3566
 
       - description: Radxa Compute Module 3(CM3)
-- 
2.34.1

