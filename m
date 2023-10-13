Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065477C8D21
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9278C10E62D;
	Fri, 13 Oct 2023 18:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631C410E62D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:39:26 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3af609c4dfeso1462946b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697222365; x=1697827165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DL5nx56ml8EwdqvqmpvvdFpkJtuFtwq0M/Gm2EXLElQ=;
 b=PTyLFdscD+SDELyboL9BGRrTA5Yao933iEWdznjOR0ER1kAePnmYdurbeYtb1Gqyw6
 r2ubLk0zMKC3seX6qVYTQreJR09pAdiXKeKXtiHo2xIf7ieAb+4vlaJo5EQvDaZ4yZWq
 Vo2vyIbXWBnWLNlxZJ98WODa5SKe4rGKMBx9KH+zVTgQ4wKF2hiJr1uS6m5bP2f1QlaO
 bbqwQYWbMowlHx8Lh2OC6PA5ZItXcJaUPtI/BXptbgOjmHSD5nRjEwhHV35uL9ZZL54V
 8SqJJd9bYw2UXMvlzOVHLx7wc9PZN7EHgiHl8oaS2gpj4WnTcScf6JYyzCv0aliaB9Eq
 73mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697222365; x=1697827165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DL5nx56ml8EwdqvqmpvvdFpkJtuFtwq0M/Gm2EXLElQ=;
 b=TH6l29bVo3gelWB/Yl0BS8GwvONK6jVr6hQ7kTgZ2kKcyX7D+0qBvgtc4bUEg8M9Jt
 OiYMHIVStcAdTlypdGeAGQPMNUaQMAegqQTMdDQCPKL7CZNOWWfWiplVvNRA9x9p/zkw
 8XYWA2Ab0orgu50j4kITk1DFz0W6jX2uo58yG/lgV8BE0yjOg2M5CnnH7o+rrsYr+OzD
 VtlY4kiwztfsyB+3FCY8WTCQAWxFjH7pPyM+HsIobzxtx5WP84FT0r7wblnycNu39HGC
 DDHDqhNuYiC+GegKs5WrGntg8uqjdOaxcRXfa0HAj6VKN7HPCw1slnJaOROzl/NL1Q9D
 lkRg==
X-Gm-Message-State: AOJu0YwwKS5PS4E5wAZB9eKYU6L9LkmUz2lMpKybfskNnze6dOJ5SxwX
 YBCq8SO8eQFQcyCbozzEVXQ=
X-Google-Smtp-Source: AGHT+IHAQ4slZoIai8CkCpzcohRVPtVa4yKRxIDPVGcNh8vLB3G0lzsMzhjH1ZSyUz9BdmXegQFNMg==
X-Received: by 2002:a05:6808:1b0e:b0:3af:6cb9:ffc7 with SMTP id
 bx14-20020a0568081b0e00b003af6cb9ffc7mr36242744oib.16.1697222365565; 
 Fri, 13 Oct 2023 11:39:25 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a0568081b1300b003afe584ed4fsm842159oib.42.2023.10.13.11.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:39:25 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: document Powkiddy
Date: Fri, 13 Oct 2023 13:39:14 -0500
Message-Id: <20231013183918.225666-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013183918.225666-1-macroalpha82@gmail.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, jagan@edgeble.ai, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Document Powkiddy (https://powkiddy.com/).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..25fd2dc378f5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1081,6 +1081,8 @@ patternProperties:
     description: Powertip Tech. Corp.
   "^powervr,.*":
     description: PowerVR (deprecated, use img)
+  "^powkiddy,.*":
+    description: Powkiddy
   "^primux,.*":
     description: Primux Trading, S.L.
   "^probox2,.*":
-- 
2.34.1

