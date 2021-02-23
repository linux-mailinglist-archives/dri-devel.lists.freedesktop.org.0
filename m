Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13652323374
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 22:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5BA6E866;
	Tue, 23 Feb 2021 21:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB376E866
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 21:51:00 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id x20so226954oie.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 13:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AsR9ipt+b1mHYtmLjiSKpblxqFVh4LbdCrUVluojW2Q=;
 b=lCevmjTvtu+km24O7Mvy1OU8SWqfa5P3S0tnAaACzHbVJndOj2BVxbuF1XKf296VKb
 Pu/7n60IRTR/oEzWEU/1p/2Dhl020uQB255u0ocM0jnqYciXFPPciNdGbxrg0oWXziHC
 /aMhc615yC9TFla+v3pyIqxZvVm5+xUqpmiApTK/uoEETaot9CijxxhbNgJdcXiV8v5G
 DGAI/+IqLvpuwZHDVwvc2Pvi+xtYOc6s+5R+skU1LZtu62QyyybsDyWqCCUYFeS9s05a
 QQj7uBznCqCJ2JeVM4mMw+AZf8pYuwUmB5fbb7amk0wlsGjVqeizgB8n2abHvo4LmKqP
 gwmw==
X-Gm-Message-State: AOAM533NEht76Cumj0sI2+xCnKauxbBjh6lADpkViPDael4CE6EV4xNj
 JTi9SRVFZZBeMBb+MDxD3A==
X-Google-Smtp-Source: ABdhPJwy7fsmg2yVC2MxWgcLyRFaNJiQxfoU7ly52FmudKmJznM3YDMN6gBOsgvWng4cpxYEOHkXaQ==
X-Received: by 2002:a05:6808:14d0:: with SMTP id
 f16mr601770oiw.56.1614117059629; 
 Tue, 23 Feb 2021 13:50:59 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id p26sm1444867ota.9.2021.02.23.13.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 13:50:59 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: mediatek,
 dpi: Convert to use graph schema
Date: Tue, 23 Feb 2021 15:50:57 -0600
Message-Id: <20210223215057.125708-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the mediatek,dpi binding to use the graph schema. Missed
this one from the mass conversion since it's not part of drm-misc.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 6cdb734c91a9..eb84b53cabb1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -50,15 +50,10 @@ properties:
       - const: sleep
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
-      Output port node with endpoint definitions as described in
-      Documentation/devicetree/bindings/graph.txt. This port should be connected
-      to the input port of an attached HDMI or LVDS encoder chip.
-
-    properties:
-      endpoint:
-        type: object
+      Output port node. This port should be connected to the input port of an
+      attached HDMI or LVDS encoder chip.
 
 required:
   - compatible
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
