Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA43260C8E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF716E18E;
	Tue,  8 Sep 2020 07:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB0E6E18E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:54:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so16308862wmj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=tCb7Xyjyf1pbyOxpVBg4F0iVcyXBpfcmtbaHZdYb60cttT+CeyHT6RB+AwUBtq2Vf1
 RdYIVREjuQImrCPeIQahoOFtc6cSUYC2q20fncg2NMlKVTVhbJ4mPXkydSj7AOgcC49n
 U7YPR9aFYv9Csqy6oOmfqK+ps590dJ8SsHDVA3QfK/8O41Zr0MK4lVvfsFSmAH6d4Kdm
 uRdElAGxaVHyKlgDX3xN/3jx0DV1HvK/dMAVAm/TKIdx4+1lgk+oHix0dZMGJ+z8TdPt
 rNpdfI0UJLbU6FJ7OcMjjAz5FCC5Ew5b1m8/tX1RLMRlfWSCIzhcj1wQhnHzLmaSTRsJ
 hW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=ggZnacjien+2vD5YWLrQ4vukF3OVb3Qhwp146DcMou+GiBEGx4dOuj2f6PFgaUHNGz
 klNrAMhHxhl5ywJHf1jv0SQoSeI+Ur+X/kWDM9X1t2oNa2iW+wcBjzUE7nL13W+7l6A7
 h76FV+YEADS7TuBudzhEOJOqXcxvDAG5kuinJoEiY9ItGL3fpwAzL2CUYagUKCh5BYmS
 1nn2O0Dga6oKd+hzhADCJmiZpudK+41vziP2NRjzfzw2O4YzpzwtA1KVfS7uzN4uq3VN
 TgLtZeNbU5OkXhFxYpluE7liYa2te9cf+OQb2i8JiXrs833eNcMDCt6g8h/DtEBsJkGt
 lxxg==
X-Gm-Message-State: AOAM532oadX9fCNYWhQuhNl8vL3rScNP+Ag5gh4TA7q6RONrXC1sxRJF
 KrKxo27Zgdk9sFVqWHqqO9jxg4aKhm0D9Wmi
X-Google-Smtp-Source: ABdhPJy8k9dRtwiSz7EuBFI6BBdW9mwejGQ/bhYXctxJ64XJ3GDkHhArqskhdpzLqbmeozv+wzk4Eg==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr3027307wme.11.1599551670992; 
 Tue, 08 Sep 2020 00:54:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: display: panel-simple-dsi: add TDO
 TL070WSH30 DSI panel bindings
Date: Tue,  8 Sep 2020 09:54:20 +0200
Message-Id: <20200908075421.17344-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908075421.17344-1-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
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
