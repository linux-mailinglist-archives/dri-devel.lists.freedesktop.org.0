Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C12A3539
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93A36E334;
	Mon,  2 Nov 2020 20:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70736E328
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:37:00 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id j7so15986819oie.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBkyOameG65gPdI9hP/LB1y9VakkF5I8ME127+VZVqc=;
 b=uiwg/F1oPlt7L+fCI5ZYpQAzc/8FQ/PKEVCR7n8IDxhOZqAkMSALSYtwCl9aw/cXnY
 OK2rzzH7EOEImkVd7OMMOobdgybzFOWOYiiY3dK5G3+WuL8DpxOf5EAIwHuDEXLTPf4K
 yMujmzl01SAdikhKqsG3QuxfXyCSdYlnG+RQ08s0HfshFwu5hLVwt2xb9CawXQZw13Mt
 VHJbGU+6iWRBB9A1GfIM7cOqLe4z8sgGiiRQbM2nPva0kW/b0Z3KObbie6DYSZZRXQUE
 4VOOwqrnWg4Z5qq4XZf9oePYHzdcTrwamCcAm6XqFwJP/yu56vUJ0ffzNVVE1uc+QHkt
 8nAA==
X-Gm-Message-State: AOAM5320/pv0/Yrop+gKSHhtxaYWhy+CzsFM0YxVnaGAWrLQxZeieouj
 3DYoUXxfD92Jco1eHzFkOA==
X-Google-Smtp-Source: ABdhPJza4LmMMzpz+0LH9Gpao9906cuonotrypVydZeajYy0mOHdV3RtSRdJvM/cXR+aDA22TFg5EA==
X-Received: by 2002:aca:1012:: with SMTP id 18mr11289075oiq.30.1604349420093; 
 Mon, 02 Nov 2020 12:37:00 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z8sm3839151otm.45.2020.11.02.12.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 12:36:59 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 2/3] dt-bindings: usb-connector: Add reference to graph
 schema
Date: Mon,  2 Nov 2020 14:36:55 -0600
Message-Id: <20201102203656.220187-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102203656.220187-1-robh@kernel.org>
References: <20201102203656.220187-1-robh@kernel.org>
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
Cc: kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a graph schema, reference it from the usb-connector
schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v3: new patch

 .../devicetree/bindings/connector/usb-connector.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 728f82db073d..64f2e1246ddb 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -125,11 +125,13 @@ properties:
       power dual role.

   ports:
-    description: OF graph bindings (specified in bindings/graph.txt) that model
-      any data bus to the connector unless the bus is between parent node and
-      the connector. Since a single connector can have multiple data buses every
-      bus has an assigned OF graph port number as described below.
+    $ref: /schemas/graph.yaml#/properties/ports
     type: object
+    description: OF graph bindings modeling any data bus to the connector
+      unless the bus is between parent node and the connector. Since a single
+      connector can have multiple data buses every bus has an assigned OF graph
+      port number as described below.
+
     properties:
       port@0:
         type: object
--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
