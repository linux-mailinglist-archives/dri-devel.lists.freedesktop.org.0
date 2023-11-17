Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2AC7EF8A9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 21:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF6110E783;
	Fri, 17 Nov 2023 20:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952E610E029
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 20:25:42 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1f573a9ee2fso1285474fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 12:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700252741; x=1700857541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdohJSSxu6R2IQkqngPHjD/jgRugE1Q5UgLSO6dMmUE=;
 b=mZXvCJApTHvDUP4pLBiEZUi9aj3J0p2edUF+S1HCdMNn16C1nXTgvUMjMqddptkRWx
 pXetO1prsIY8pVwF86BAIsUXUdj3wl6TWgCJPTXBv4rvYh+r1hK/bRDzE9JI7ynxJILD
 RTbDk12Yz1fn96OsNzg/mBPn/dUiAeFIe5Knv2ouvEjoMJvFv2aeCF9er2+tRfZZf2QM
 B60G78a8dbzHVnziQ2FWD4x+3SzS5EHBdfBsMpb3hTQc8hFu63N6svJIjH7TXxyV2fx8
 7hrEkeE0NTjCmdaxrsA+D3U7Ub237EFcyAQq4Z/+WIqIB1xWJxNVz6ZWuqVO/RTIxg7w
 d/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700252741; x=1700857541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdohJSSxu6R2IQkqngPHjD/jgRugE1Q5UgLSO6dMmUE=;
 b=scYMJAVdfqu5/RkaXoZpXEK3OoIeCYrPs1U9QjxcoJ/6ykk3Z2ybHj9yXHHsLjAMVm
 3mx7LoD0cW8ZvTiwPJjFoXQ6yljC95234djSfmkZFx804YNEL5V98IdcmnDWv6FO6+Yk
 frYaSKe2GLfH9/GhK/izJy1S2k8+yrHpk8yCt4arxwRrATLXc0QOEwP4GSs01xMjlLPE
 z0RO+TN9CtDVQLwgxxWB6OuXG9lZFDEBsQyF+3oMDh3ABODHt7mwipU3nrSW6u1uBLhm
 9zyDoJt/9bQcrWfXXS/L7sY6bxthfdi07ApwtoR8lR9+I0J7hjuPxAInn74rC+Ikw69d
 G8mQ==
X-Gm-Message-State: AOJu0Yzp7NUb3MJV+0X7+TYXIbUuVyqxBUcu/ktbUyhT8Hxjcigu/JWA
 Xw5eNXsYt78J4dYuiElDqx0=
X-Google-Smtp-Source: AGHT+IF/yt9dEaZWhi4mZicImR1N5hTEhB+CzKcWKeOzEjkanoOQZ9pV2ESy2ImEevPX82DHfviYSw==
X-Received: by 2002:a05:6870:9c8a:b0:1dd:4271:3a88 with SMTP id
 pq10-20020a0568709c8a00b001dd42713a88mr267739oab.58.1700252741658; 
 Fri, 17 Nov 2023 12:25:41 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 zf15-20020a0568716a8f00b001f224cbbde1sm390543oab.41.2023.11.17.12.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 12:25:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 1/6] dt-bindings: display: nv3051d: Update NewVision
 NV3051D compatibles
Date: Fri, 17 Nov 2023 14:25:31 -0600
Message-Id: <20231117202536.1387815-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117202536.1387815-1-macroalpha82@gmail.com>
References: <20231117202536.1387815-1-macroalpha82@gmail.com>
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Update the NewVision NV3051D compatible strings by adding a new panel,
the powkiddy,rk2023-panel, and removing another entry, the
anbernic,rg353v-panel.

The rk2023-panel is similar to the rg353p-panel but has slightly
different timings so it needs a new string.

The rg353v-panel is duplicate to the rg353p-panel, so remove it. No
current devices use it and changes to the driver mean it is no longer
valid as a compatible string.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/newvision,nv3051d.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index cce775a87f87..7a634fbc465e 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -21,7 +21,7 @@ properties:
       - enum:
           - anbernic,rg351v-panel
           - anbernic,rg353p-panel
-          - anbernic,rg353v-panel
+          - powkiddy,rk2023-panel
       - const: newvision,nv3051d
 
   reg: true
-- 
2.34.1

