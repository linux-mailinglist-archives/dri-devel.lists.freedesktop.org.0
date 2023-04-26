Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC86EFA5A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284610E9F0;
	Wed, 26 Apr 2023 18:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A3B10E9EF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:54:47 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b70f0b320so9564912b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682535286; x=1685127286;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q784dRdh+8ACGApvx46jbzabaa2j0b2l3E8XdTi/8wo=;
 b=oIYURqv1jVNXT99Qi6fsTFAHY8GIo3cwKtczIegWkLkUAMJkf3GWAHiirPcTvab0TS
 UPoe6a8acjRht8c2ljDwUxK3ERRvYTVYuODe26NXVZlVI9m5zb1ogA5PGzydwJECT9Jz
 csdOHs7eS/6s4g2RgaJzCbHTcwhX7PeD36/MRVzXbzyBhUZ3Hv9N+1fcWr8ECLwz/b/X
 NMoUpMemCWX9yWeDB2wLu3y+QPWiiJm1Iu4lDDutVGPJjf4PYzp9/huF12wPUob7CH7t
 YNjKMDWEYCMLoPnBel+P80wGOxwiNgBGgY9HV3Q9au51N6nBjKj6HaxgZ0CAHfy2UZRO
 PxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682535286; x=1685127286;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q784dRdh+8ACGApvx46jbzabaa2j0b2l3E8XdTi/8wo=;
 b=dMqVHKXtxNWCPRiElkWkVJxDGm9dAChjowtWPwaEmOtZBeeK8jiGaPLZYtIXKQnrgX
 8j9HPoMXRrHQsuwRVlnGZm3K2X1P5I1AwVL768Q9lQjnune7fnoIRVyRBmo9zfvIAGf4
 mb+CSoV5BhV2tmgUBGoBxvQUe63/rXENigOvffx4Gfu8XDWKPIF3Mvvvh+eu0bQIPslD
 R/FnQog3zy1I79YZKFgOF28qtAtezuUZUiob2vppqxoc8obtH0fYnhoM+66TnWkTKJJ+
 eSz6+5M8oJk+QQ/lmob5LEw3K4RW7xH1n6enR3ylnaBEhjDaFqtR1fWzQc3MkevU9N50
 f7hg==
X-Gm-Message-State: AAQBX9fyNPjm1a6AEteQGeKHbsKwYIsFesUo1h7l6tCW3n9OzvjrTjgl
 uWfLSznygR3o6cCCH/u7gQM=
X-Google-Smtp-Source: AKy350YGk/4ih/AlG+kILS2fTRctjWUttCVdHx5+Kz4oTUR8FKm58UXiWGzU1ccpTQvUB5TkCh3Ltg==
X-Received: by 2002:a05:6a00:15d1:b0:63f:2b56:5e2f with SMTP id
 o17-20020a056a0015d100b0063f2b565e2fmr22246463pfu.4.1682535286287; 
 Wed, 26 Apr 2023 11:54:46 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 y72-20020a62644b000000b006372791d708sm11639254pfb.104.2023.04.26.11.54.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:54:45 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v2 net-next 1/6] dt-bindings: net: brcm,
 unimac-mdio: Add asp-v2.0
Date: Wed, 26 Apr 2023 11:54:27 -0700
Message-Id: <1682535272-32249-2-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ASP 2.0 Ethernet controller uses a brcm unimac.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justinpopo6@gmail.com>
---
 Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
index 0be426ee1e44..6684810fcbf0 100644
--- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
@@ -22,6 +22,8 @@ properties:
       - brcm,genet-mdio-v3
       - brcm,genet-mdio-v4
       - brcm,genet-mdio-v5
+      - brcm,asp-v2.0-mdio
+      - brcm,asp-v2.1-mdio
       - brcm,unimac-mdio
 
   reg:
-- 
2.7.4

