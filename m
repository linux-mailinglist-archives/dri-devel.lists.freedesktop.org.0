Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42A297D93
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEC16E8B7;
	Sat, 24 Oct 2020 17:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733776E105
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 13:31:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e2so1579526wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEIQEN0FiX78PtyGPLU6UM8Z2jaXBw6a+LxRvgLs6c0=;
 b=K/0t+tb4Wog9jbcWVMxLS+5RCOWuTowML4Yhf8SUgfVAQaKXXPIJ1KwIOrJlUwYqxb
 WkSynxXMb8x8hbXWJPNxxI+6ehjbVApy+BPpsR93Obz46GgBgtwfhv6QddDGUo59xfcV
 8VPKf0A3hqGTfidaD6+sxboQ9qfaJ/oMmf2v2M9t+UqEBj/bSDGOKPjwE6z5x/Yco93j
 aUeKJPNYvRmSAoiEq1oGdmlNsKT2jIpvF2gT66z3ngcpr8RcX5xalNI7MfQr/uXdK99X
 n9Uknh0ci0hhlNrFwq+EKxnFwmuoz9X8X3u2tySUbYKkVjdqeDwnadO8P2d9vZC7ab9Y
 wGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEIQEN0FiX78PtyGPLU6UM8Z2jaXBw6a+LxRvgLs6c0=;
 b=YGKEaak4T6G+KKiHZcESjpj0PlNRpKC2klHQf2cPOBraLAeAJcCljsfwAJAA4y4fnB
 ezOrJWBSlyTM8bLunBVkdcajCFF/06suAZXGdpfBl0QKkbaeeEuKhMXxXgQtf+cbVbRY
 d++wXQtYasJ2ZtWBjYALdJBr0j9M+C7YkDTlbc8JGInIfqdwg1nRAFyQZqJeQLbdNjxj
 lDsK0GhmU0SscMRmsHsHYA6WEECnWQO/tvVEBASvKAGhucNXZiesPswY41RmhsDZa+xb
 SX3X33f9ONKyuQZoL7gvSxDJO0RUEP32/1CSCa3aBwG1nCQ6mljhkdDaZsPcWBopIMSE
 2HQw==
X-Gm-Message-State: AOAM533Rd1DZO++iu/wyNknfkMWuQcj/v00fTjvZqpnqY3ON/ZjZ6Er5
 Cyz+jmUAayO8ldU6MBjIpwTr6g==
X-Google-Smtp-Source: ABdhPJyfkaJrUDUwQgeF3HxVQWlJt1iTJtu5s+b5Rq1uR/Z8v+wI/Knb1pA8CmTrO1TaadRdqa+kOg==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr2316512wmb.124.1603459898104; 
 Fri, 23 Oct 2020 06:31:38 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/5] dt-bindings: display: mediatek: dsi: add documentation
 for MT8167 SoC
Date: Fri, 23 Oct 2020 15:31:27 +0200
Message-Id: <20201023133130.194140-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023133130.194140-1-fparent@baylibre.com>
References: <20201023133130.194140-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding documentation for the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

Changelog:

V2: removed part that added a new clock

 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index f06f24d405a5..6a10de812158 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,7 +7,7 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-- the supported chips are mt2701, mt7623, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
 Required properties:
 - compatible: "mediatek,<chip>-mipi-tx"
-- the supported chips are mt2701, 7623, mt8173 and mt8183.
+- the supported chips are mt2701, 7623, mt8167, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - clocks: PLL reference clock
 - clock-output-names: name of the output clock line to the DSI encoder
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
