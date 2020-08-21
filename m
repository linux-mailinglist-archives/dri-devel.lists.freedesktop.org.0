Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609FC24D8AE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 17:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D76E854;
	Fri, 21 Aug 2020 15:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858F6E854
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 15:35:36 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so970827pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KlcOztWWQPRGdO3GJ4i5K8dX5Ri0O0Yjm2p6XeAjX5c=;
 b=K4xOshzvJr7aCXXwH4DAQRpEXUsdEQHd4W+925408O95RPmPvEx9o1Qfb37SCB1Gho
 oJJeNwvIk992gMb+wjm4aBzLv0AwDdFpQqg6Sx9dh4vQgCXUjAupJMC3PN+v7fFX+V4c
 9ww3RJgSeDEiwb0n5vIcXlfAHk3l6xWnlYojk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KlcOztWWQPRGdO3GJ4i5K8dX5Ri0O0Yjm2p6XeAjX5c=;
 b=UJL2VEsn0fyHIIwVJAr2IMHQM30DShNeFmE+8QNPcMoXEaUuwFUF/UMX03pS8a+A6P
 7TuWX3UnVf1hAGQ870R2ChX31QzHABDRyVB7b0c8gzM6TZhlGsief9msyrEAbw1Yctw/
 NjnoZGmHWjwcWx5PNLxTCAtJzbatnXp2kmq95qEXCYuBWSF0VraGL/qaBt68dGu9Eztr
 cXOo1cyLLafvd7HhgQs0VJJL5dYbWKZlnPprQK6tyA6VEO4QjZLo0JHYH8a1rodeE+h3
 oAeUaeP73Hv5Qr1diB4HTNB85b9ov62yMUNN5dJCWuLBF3XAXPT7k7R3TIJpKu1adO32
 HyZg==
X-Gm-Message-State: AOAM5317XNI6FaJ7E+pqFtgx/P2nlH2OI+rxd/KpKGfdEv0FSj8gEgSF
 5p4birkrGz9QTC9vBnsxrafcdQ==
X-Google-Smtp-Source: ABdhPJwZXxjhNDGxHTeRfEsG36o7sm8xNgtpV6HgMuiEo8kAPWL1TyuKck2o9/PPo4gkANxrXbSxMQ==
X-Received: by 2002:a17:90a:5b:: with SMTP id 27mr2784374pjb.188.1598024135637; 
 Fri, 21 Aug 2020 08:35:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id u8sm2200720pjy.35.2020.08.21.08.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:35:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add KD116N21-30NV-A010
 compatible
Date: Fri, 21 Aug 2020 08:35:14 -0700
Message-Id: <20200821083454.1.I61e6248813d797c9eeebfbb7019c713aa71c4419@changeid>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The KD116N21-30NV-A010 is a pretty standard eDP panel.  Add it to the
list of compatible strings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 47247ace86ac..f2204f17a9dc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -161,6 +161,8 @@ properties:
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
+        # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
+      - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
       - koe,tx14d24vm1bpa
         # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
-- 
2.28.0.297.g1956fa8f8d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
