Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260D45A02C2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE0C7D2F;
	Wed, 24 Aug 2022 20:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88872B966
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 10:10:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d8so6614430lfq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ZQTlzZhSz/F6Dyvy8ent1rccjYe8xNJQ3KifGL8COg8=;
 b=xdzD51NB6krEq2oSamBwJSqBmPConyxmXnOPIM2tI2HBKOxUv7620iJReAQX4+6ggD
 BjzkooN73GabBqwLc+zUjIWz2djjaLSR5UB5D0cBZofADRLsDJnMS4C99xqVHKGF7Rdi
 Bu8n5tx/Skd2MItQwGQcStTFSXtU+33U3vOxaLqdEzgiWQKCl+waW4MwyIo4lWeHpVz+
 cirMi9NxZWWm8QbJcRJjbffzrSwpf71cqxPl+MOzKhggBImETjovYgL0GUiwP9N5O7hy
 FStxMNxqnSzQIhg00KU0PdZU/lSNsw4Du4CkazOCKfkl8fT59Oi1obPyTMPVhNnvjnc7
 /eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ZQTlzZhSz/F6Dyvy8ent1rccjYe8xNJQ3KifGL8COg8=;
 b=Rnt03G4eFG1+SsDTVVvPnPdlgBoR6Ixhe8+aPL89AOMOppxL1QorpMPH06ArY/MqUs
 h6qAGQ8mBpkZ8aifXI5PlyL9TrU0+/Dy3Zt9a+52DVNwyq4T1qggmSbYkx8/9JA664Kd
 bIEUtti331aKeD6JZC2cLRbq9wms+aR01UCFYQXezlkk6YmXa2+twOe6OdQ2mwlIuxX/
 z0xMpCDw40oioScRCbLVKK5whYDc0YuN4Zaxw/MKneOvpdBdrpxGQHS4Kj58Iq8f/wmh
 YGAMJxyxxenvjdUIG9ArImFfg3HK/0bCgzamVPfGdLlN98mmyFwLheKOqupszEh1LB1S
 +KyQ==
X-Gm-Message-State: ACgBeo1TUulzoZIKQcLxmQyIoN8TYw7kpfeacoNhPCkfX76MlgvZeySq
 uTPCLpq6Yt8gacS6yVQz0S1oaw==
X-Google-Smtp-Source: AA6agR5fDnH2XcXgR+T6xdK3Nc9HZ8ROsCJIQuD4B0AHH6qkWJfXdbFgMHgnduR4NDjt9ZBTuBdLkQ==
X-Received: by 2002:a05:6512:aca:b0:492:7db6:95f1 with SMTP id
 n10-20020a0565120aca00b004927db695f1mr8993150lfu.433.1661249435995; 
 Tue, 23 Aug 2022 03:10:35 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056512370f00b0048af39ff3edsm2426771lfr.122.2022.08.23.03.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 03:10:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: synopsys,
 dw-hdmi: drop ref from reg-io-width
Date: Tue, 23 Aug 2022 13:10:31 +0300
Message-Id: <20220823101031.387082-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

reg-io-width is a standard property, so no need for defining its type
with $ref.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index b00246faea57..4b7e54a8f037 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -26,7 +26,6 @@ properties:
   reg-io-width:
     description:
       Width (in bytes) of the registers specified by the reg property.
-    $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 4]
     default: 1
 
-- 
2.34.1

