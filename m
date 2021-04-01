Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3342350E70
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 07:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55A6E0A8;
	Thu,  1 Apr 2021 05:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D806E0A8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 05:32:07 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id h8so437921plt.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 22:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGCaNYuJs5ysS+G47sBAgFfeBuakOnmZVc6UOW7pnu8=;
 b=H4LMh6naKuD9jE1jgXbD+Y6im6xj6SrczGVRGFyo2QjAV8r/Jzu0IWlYhmxqsaovAe
 POh3cEIv5YtAJ9THgZPkjIual8JLUsh0XWwWlZTlBxVvdFSz5My3Z0YxGhRJUjkaMGuX
 ZN1jamFCfnnYkzUq7QDx8/ngukUjepeiKGEKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGCaNYuJs5ysS+G47sBAgFfeBuakOnmZVc6UOW7pnu8=;
 b=DrJbFiGZGHo40+/QX87+9+rgrRKbcoc1Xo7HTVHdicn2u6lTtWEsFaNBfNfM4w+D3L
 7hcTYfhUcnX1101CVqJ5k7GBXvl4cFT1k9CDWHx4QRxyNBTtRJxh/TSAhgngSHcpP8LV
 zAhHlb9i9cxMiJds23HLwI3JSiNMj1NsmqG1rsbqX8zQo5y6pu1xoSDns2CzhxSv1Xt2
 NHI+ypLgBauvl8wfvqsMQFkbQra/+LyQxNDRhfRt2aRhErXZSkY6ne9H2Hs9EpAoQbgp
 uAUQzcuDCQWNI79JIyzUevaPMAgc/bkM5lpRlQfpwkJnv2g6m+A6FJFC+UlAev+7lJw+
 C4XA==
X-Gm-Message-State: AOAM531mqT2YknWEnwvNQgHmC+N+TBZbprSTkCHR2xNKdj8giAuO0pfm
 sF17ZxWjUp6otTzrwBIMMpFXINhi8kBq/A4+
X-Google-Smtp-Source: ABdhPJze72R8x10Uwimtp/vAMjJ5lbZAFSGzBuvIY68rbCBL5/iz4VkpPs1KdmUR01pqLTvYeVHPSw==
X-Received: by 2002:a17:90a:2e0d:: with SMTP id
 q13mr7361084pjd.225.1617255126907; 
 Wed, 31 Mar 2021 22:32:06 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:8730:fe8e:d1f8:82c])
 by smtp.gmail.com with ESMTPSA id mz11sm3990058pjb.6.2021.03.31.22.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 22:32:06 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v4 1/2] dt-bindings: drm/bridge: anx7625: Add power
 supplies
Date: Thu,  1 Apr 2021 13:32:01 +0800
Message-Id: <20210401053202.159302-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625 requires 3 power supply regulators.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
v3->v4: rebase to drm-misc/for-linux-next
---
 .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index c789784efe306..ab48ab2f4240d 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,15 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  vdd10-supply:
+    description: Regulator that provides the supply 1.0V power.
+
+  vdd18-supply:
+    description: Regulator that provides the supply 1.8V power.
+
+  vdd33-supply:
+    description: Regulator that provides the supply 3.3V power.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -55,6 +64,9 @@ properties:
 required:
   - compatible
   - reg
+  - vdd10-supply
+  - vdd18-supply
+  - vdd33-supply
   - ports
 
 additionalProperties: false
@@ -72,6 +84,9 @@ examples:
             reg = <0x58>;
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
 
             ports {
                 #address-cells = <1>;
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
