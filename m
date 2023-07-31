Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753A769404
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035110E279;
	Mon, 31 Jul 2023 11:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E1610E264
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 11:00:41 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bbc87ded50so26399255ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1690801241; x=1691406041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/dEqRGg68M4eDYviYv5iZ5FREu+8Zk3M+fIpiipGM8=;
 b=wdpGiFO3eQkg3tLYWeeGQ2FKuFQeB+nMnArDI9HqCYtMCGU9n3Q8I2pJjMiTrUEI4T
 KMV9Xg5eDNKBD1MKfJ6oaudA2EngtHtfq4dtQ1xG0DGeawaOS+0MzeF7LDmUq17cTkPr
 LRoLpQfrpqjM3bVEnLx7e594gSuS9ucgg0ua0gmanggBnARSjZnONFWIBNZdRH7i67lb
 Ll+FYKnNhdfQsLRsdc9pay00UJ3OwfQmUFGMsm9HjCW8S43Q2jTPd8cI0kSEKUZ6p3yf
 BQsumaUkmGfVD21xbI+NLQe8J1BFI/d4kHSWm31UHRB/kMtq1spyJQ20ZdJyiDehSpYn
 DNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690801241; x=1691406041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/dEqRGg68M4eDYviYv5iZ5FREu+8Zk3M+fIpiipGM8=;
 b=Rujj5pkrSJKzlcdYGMEtzSRGJ31DQJNkRroiO3JhRA+L3iCp1az0z8c8pGSosSW2CQ
 5ldDVc3/wAU9+O00SlXGjpf69gApfSgftS5/uWR+7B4jyxcI1eQv/VCtPte0nhSqA1r4
 Fb20n7ZTegoDl0pE9isPSVDDON+zv8T5h+n9eVHDnGWCUm3jrmjMZsze4eue0VSXC/k7
 QVCVorWNwPY274kX4mROHdCNAL1EYd/vq4VgELqDXGrY7EJctai35+RDlsMD9htZyi6S
 W/oRlf1XMNrMUPpzR+DexvZexDSD9PrDk+ED/w1gMlZWhy2R45kmpLnnm2Xe4dMbdwd6
 iLUg==
X-Gm-Message-State: ABy/qLZHLK0p5siCI3gDjk5m9BZd2IRJptRJS8NsQ/7HoOPAzCol0Vdq
 xUzeIgwWyT32v4jX1RWp45jUKA==
X-Google-Smtp-Source: APBJJlGYFd3rzRij7zv9gQDyA93YIQqoTFA5YyhYeAATlxG2yeHK6/pJtE10HCfOFvjSXOZxiMytrA==
X-Received: by 2002:a17:903:22c6:b0:1b8:41d4:89f with SMTP id
 y6-20020a17090322c600b001b841d4089fmr10528440plg.4.1690801240846; 
 Mon, 31 Jul 2023 04:00:40 -0700 (PDT)
Received: from localhost.localdomain ([49.205.243.15])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709028c8e00b001b1a2c14a4asm8281096plo.38.2023.07.31.04.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 04:00:40 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 05/14] dt-bindings: display: rockchip-vop: Document rv1126 vop
Date: Mon, 31 Jul 2023 16:30:03 +0530
Message-Id: <20230731110012.2913742-6-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731110012.2913742-1-jagan@edgeble.ai>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the VOP for Rockchip RV1126.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

 .../devicetree/bindings/display/rockchip/rockchip-vop.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index df61cb5f5c54..b339b7e708c6 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -31,6 +31,7 @@ properties:
       - rockchip,rk3368-vop
       - rockchip,rk3399-vop-big
       - rockchip,rk3399-vop-lit
+      - rockchip,rv1126-vop
 
   reg:
     minItems: 1
-- 
2.25.1

