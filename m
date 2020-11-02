Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7D2A353A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5270C6E328;
	Mon,  2 Nov 2020 20:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BA16E328
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:37:01 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id x1so15984977oic.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eSe0Eyg4T+VVxvIrbRKcVjoJlAgtXIYs2ZOG69Hyme4=;
 b=jmmM08e7+2WJT1XHOc4zpbulUK7xm6FbcNOeDzrzMKGrxOweV477hvBVyqJ11+r7D/
 SqQgI4F/HW14a571RBJoMj03hDQfjy5b2A1looRel+W20qxSQkLuZIfKx3fobS65klH3
 amwyKbP1wQ4Bm6Dk9WiKL0rs3QU2SO9vG4N/Mb5xuzu74UTucUoMlIbWuvSiZ5KjKiD9
 KqJuGnmIARAh47utGV+jPU6P5cCybugujIDaU3LtvfTReuKIvFWih7SE+CTCLoPdW8wH
 iQyHyX2Nk58ohkip2p/uKHCQoMOZanQzmw8It4zbpxodaV/BzWncbtsd06EzljpSppDs
 7i5g==
X-Gm-Message-State: AOAM530ebR7wwn4mAH2TsKUhDvXWf3o6AyWIzvNOOjXhRlaXwO2lA2Dl
 6WH9CcW//qzleQ+CWGDu6g==
X-Google-Smtp-Source: ABdhPJx6uroqdLoV5D8UzKlIH+axYRNJV35FHtiXCCA2TytPvvByeT1flj+DmvIAJWnKLmiKDTEkiA==
X-Received: by 2002:aca:3a46:: with SMTP id h67mr11418122oia.21.1604349421291; 
 Mon, 02 Nov 2020 12:37:01 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z8sm3839151otm.45.2020.11.02.12.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 12:37:00 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 3/3] dt-bindings: panel: common: Add reference to graph
 schema
Date: Mon,  2 Nov 2020 14:36:56 -0600
Message-Id: <20201102203656.220187-4-robh@kernel.org>
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

Now that we have a graph schema, reference it from the common panel
schema.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v3: new patch

 .../devicetree/bindings/display/panel/panel-common.yaml    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index cd6dc5461721..a3a72c574213 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -68,16 +68,15 @@ properties:

   # Connectivity
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port

   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
     description:
       Panels receive video data through one or multiple connections. While
       the nature of those connections is specific to the panel type, the
       connectivity is expressed in a standard fashion using ports as specified
-      in the device graph bindings defined in
-      Documentation/devicetree/bindings/graph.txt.
+      in the device graph bindings.

   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
