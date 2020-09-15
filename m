Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE526A4ED
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 14:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5486E284;
	Tue, 15 Sep 2020 12:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A446E284
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:19:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y15so3249577wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 05:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=Lq9x8PS6ikykudXTzqmiSjlkw1Mv5Fjj4FKyQyXpGeeAWDF9A9ovPyTjb3Da4qoZun
 0Qo8bZXk2A2lRtM0JArOOu82jnPkup70fFXg/EEeL7/tGd/sSGimI8b8CSJ6Epc8heO/
 dW0IioLCpj/OBwmHmNCYc1TXGLCqSD/6EomeJWbxHNdQNcf0QWyxXRG/UfSnTIS9REVD
 yXDRxOzEUYAIpyaO4xRjQxrFnS+f11Gin6cKWKlip0nSwAXkI4tIdX9PcL3AgppY8tmR
 aKdTsPcHucEfk28DnxBE+2jvIqN7Nzx+Ti8b1c1mjBtsjgDQPZns2rU9G9yALoi1dnnt
 pLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=H+6apb6XuarqLgWuuyMzM0uwQ4oN99F6sNLJSL/QI+0bNPG8X+kYi+2s7COOCIPnoY
 jkeRagRseAB+IXgMy4bJQldBEp3WjWcVQUHYNS/1H08kCfLPkXV/wwUAm5EW0ZPIH90P
 tVePJnA9rh3AIgs8ynMQmy4J/c7cSoNmOxElB28113oRRDT1hS7IxwpiqzfqeeZ78C4E
 asjYSbpuSB9Gtv1HY6vVc67+Hh6juUr+p/qdrcVlV/tQt2NRoB+3ZMUTyOFy6FD9dS81
 xs5CP5GmlX3uIStTsoet8viZ2EFbraZdDpVNwoPjvRE/19BOenRCNwNxMU0/PeBI2TJ0
 zbEA==
X-Gm-Message-State: AOAM531T6NGbtHQFoBWKt3l5oRTlkhMjlzXdH3pCnvhB5+7K0MCv74Ek
 7SBVyDqi8RfrftPtOGq9wkwfIw==
X-Google-Smtp-Source: ABdhPJzfh8abje87LbHn4Yy3eXAdcq+orthOqFQV/rOJWuOe4E/5vFnXxQuTIYJlbMLLAVPJWsKNWQ==
X-Received: by 2002:a7b:c5cf:: with SMTP id n15mr4395014wmk.93.1600172360770; 
 Tue, 15 Sep 2020 05:19:20 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/4] dt-bindings: display: panel-simple-dsi: add TDO
 TL070WSH30 DSI panel bindings
Date: Tue, 15 Sep 2020 14:19:11 +0200
Message-Id: <20200915121912.4347-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915121912.4347-1-narmstrong@baylibre.com>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add the bindings for the 1024x600 TFT LCD TL070WSH30 DSI panel to panel-simple-dsi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 4d08e746cb21..a29ab65507f0 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -47,6 +47,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
+      - tdo,tl070wsh30
 
   reg:
     maxItems: 1
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
