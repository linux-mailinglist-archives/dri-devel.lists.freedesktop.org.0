Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9831A5EBA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 15:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEEC89402;
	Sun, 12 Apr 2020 13:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7AF6E409
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 13:21:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q19so6269811ljp.9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCfFjrfv4+Ar3EwCkCD8HCK0f6hsu+EXSm+czE6taUw=;
 b=f6OTx9B8k+HT3i+ADgQ2rpwq5bFL9vzShwvpvXkXGSHFSEfL5mEHb5hiGJ6n6pDMRJ
 wLE3RCDcrqGhQRnMCJZ/XrSLNjN35VZzWpocZppMNxf9VKWrXXGIe2Y2C2p2NAF90lvo
 JzPP+33YuUzYsQ3KSmcC75ttQMVf9VI8gF8+JyEkFuagEM2bio9K5izlh7BbiPfrAlOc
 oW3GY21ntO/yq6Pi5jsKte5n+gM0o5gB7HZOje60k7ib5OD3Dh3p14AmON2AQE7pdCLr
 jvfKMHIvLUXjPsXZ6besg0xB36BkFiySOy0cSS1zveahlW4zVZEq6ZuH9LM2gAPNfjop
 T/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CCfFjrfv4+Ar3EwCkCD8HCK0f6hsu+EXSm+czE6taUw=;
 b=Ea0dktFSrPRrEnkGCML42W43rGi6EK4/CMCSI/fDWrpVIBIH/OVi5UhDEASMUX3/n8
 eLT2tTNz4QB5lcuyN91H16Pke6CT6nW1V5nTqvw1TTJYrxfWIiG0uNIoVtiJZ3MuicFu
 M6ZTawYxiWm46JZvoPD6Eosz6XdE7vqW7K5Up9/TQoUX0VrdG3s9o6yxpfWK43Xi9ahs
 o7+XHb4G2SuTXLcca1dCEn5ffOkiIdVWNmnkRVgPYVdwuGRrV247VKPQ4On0bx0xu8cL
 kADiT9Rw/zNw8jBEIPvMPseyAWsNMvQd677TwaZQvWxN+AM4vCsdBfxacxjBdX+A5pd5
 XqMw==
X-Gm-Message-State: AGi0PuYznjbeNdvWzw7dgGY1MraC500s5BLurEQAd1eF7nDbPD7Et+nE
 ejbItbJMVy7FmzrgvpxznaNV9qf1K7k=
X-Google-Smtp-Source: APiQypJIE14WO7g2+GNChhp2sUQDAyxwxhxYTCsdSgq2BtVGozEmwOsm1ek/iTHfmS0IO5lO4mZRcw==
X-Received: by 2002:a2e:b5d1:: with SMTP id g17mr7795429ljn.139.1586697707893; 
 Sun, 12 Apr 2020 06:21:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 y29sm5330801ljd.26.2020.04.12.06.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 06:21:47 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: display: allow port and ports in
 panel-lvds
Date: Sun, 12 Apr 2020 15:21:39 +0200
Message-Id: <20200412132139.11418-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200412132139.11418-1-sam@ravnborg.org>
References: <20200412132139.11418-1-sam@ravnborg.org>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both port and ports names may be used in a panel-lvds binding
  port - for a single port
  ports - if there is more than one port in sub-nodes

Fixes the following warning:
advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property

advantech,idk-2121wr.yaml needs several ports, so uses a ports node.

v2:
  - Use oneOf - makes the logic more obvious (Rob)
  - Added Fixes tag
  - Added port: true, ports:true

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Fixes: 8efef33eff50 ("dt-bindings: display: Add idk-2121wr binding")
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/lvds.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index d0083301acbe..a5587c4f5ad0 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -96,12 +96,20 @@ properties:
       If set, reverse the bit order described in the data mappings below on all
       data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
 
+  port: true
+  ports: true
+
 required:
   - compatible
   - data-mapping
   - width-mm
   - height-mm
   - panel-timing
-  - port
+
+oneOf:
+  - required:
+    - port
+  - required:
+    - ports
 
 ...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
