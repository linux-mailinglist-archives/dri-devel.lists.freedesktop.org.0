Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72CA6E30D3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC8710E253;
	Sat, 15 Apr 2023 10:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414C210E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:47:06 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id q23so42383591ejz.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555624; x=1684147624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pUd8DFQ/mMGaJuS7CXpgBKGgZF1BMCPB7h8W33HCwg=;
 b=n5tydzgrJ8BvqSB5++nyIu0SF8/YOb1MSjRmH8/IFtW5mQWsPuRdyIOra6V10T6FZV
 hGgTYwMF+lx8KLw1plktt251TOYSkKZ9vv5zpyJ8NQF1MJjbBbQA4mpO6bcHTyRnBRMm
 nS9OooZA+VKqtHhBWUP8wUwCmNH8wJhM/7icFMUGeecgrDfxtMBRJ58l5wAPAU3I3F4v
 T1xy306yEAhHINS82+ZJAiM9qUo2CN03M4jNl7fH2SsfQN8YfnvNJR4nx2PLNSpX4TUK
 g1Aeo04jMyInkcrxEsesYnIRVLdVKQOoC8/C5jvr1FocICGeaq03k4eS7wodptjJP17R
 NSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555624; x=1684147624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pUd8DFQ/mMGaJuS7CXpgBKGgZF1BMCPB7h8W33HCwg=;
 b=B5icL2K2vhQBXE1NzFrSGVTNPgQJpo/c7nFo0PbLEagkUe5zVSYbuohu/9sS1acqZh
 Rj8I/39xtifMoFlyW4LT37TyayqyhZ5mBgA7wHi2lbgMao/kp+2RhvbQHpaG9BG9PD8N
 i2yNeW15dhEsWfA7naB8i2BA9cvQk58JXGwR153mcuaiFBjiTXpr0zqRskaoU68CdSgL
 XgpCDtoY34J3e2cXCM442sGjtWl2dqUo2hB8LI3ai3uitRGGJ0BCKpRi3WN/t1VtiHq+
 W53CMj3j6/sY+ldshuQZe/CtgXdx010YtHKT9UcWLh9F26uKyINK39+h+J1biQ/EHGX2
 cwoQ==
X-Gm-Message-State: AAQBX9dsIrwhTdaXItHPCM4y6LkfF2UoQevxaxEiMQTUH31m0r3ZFtzl
 vJtAeGq95J9szuumu2C1rTw=
X-Google-Smtp-Source: AKy350aJNghSC5CfNyPgKkWXs0FMN8fkENsNCl8unVGCaGJStsvyvk7XtDGK5pCnk/0RAbSApiKWog==
X-Received: by 2002:a17:906:2a45:b0:94f:1a23:2f1b with SMTP id
 k5-20020a1709062a4500b0094f1a232f1bmr1247720eje.24.1681555624222; 
 Sat, 15 Apr 2023 03:47:04 -0700 (PDT)
Received: from localhost.localdomain (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 m15-20020a170906720f00b00947ab65d932sm3607034ejk.83.2023.04.15.03.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:47:03 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 samuel@sholland.org
Subject: [PATCH 1/3] dt-bindings: display: synopsys,
 dw-hdmi: Add property for disabling CEC
Date: Sat, 15 Apr 2023 12:46:11 +0200
Message-Id: <20230415104613.61224-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415104613.61224-1-jernej.skrabec@gmail.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though some DW-HDMI controllers have perfectly usable HDMI-CEC
implementation, some boards might prefer not to use it or even use
software implementation instead.

Add property for disabling CEC so driver doesn't expose unused CEC
interface, if CEC pin isn't connected anywhere.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index 4b7e54a8f037..624d32c024f6 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -48,6 +48,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  snps,disable-cec:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Disable HDMI-CEC.
+
 additionalProperties: true
 
 ...
-- 
2.40.0

