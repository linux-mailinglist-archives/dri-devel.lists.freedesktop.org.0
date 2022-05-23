Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D31115311CF
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 18:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E46C10F823;
	Mon, 23 May 2022 16:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE4C10F823
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:15:29 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c12so19749257eds.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D0DE2jvukRBvDGRLAryG5jNG7HT3mMoLpXG5GPxzDOA=;
 b=NN+LHPvm7dG259hHKGHheoJk5P3cCneDSo6QeJdhAeoRK1+yJ9aSXuRsOgU/REuXGl
 pFeMLX+VC+Vz6lFCZ9LfWQjAgyZgBJ+HX8xdP2LOmhv1fyeNUqwRfNjwrVrryJVverPG
 AMONXAZv/KK/tEjxhtYj/Yp9o1fHvhuTHum4U1xOWM003eVm/5sTCwY3IyqxDOfTHMgR
 ructedW0naLwW8ZbewzH5vQ82jG5LAsdvoCoxXcYUSlc/jc34xfpsH1WcN1WnZp7GLZH
 RACM+zsSUXVa3KF3R5YBBSmHgNinTvmcrxeXa2E0iQENZco1WDd3xjm3uO96kZ94fqk9
 m1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D0DE2jvukRBvDGRLAryG5jNG7HT3mMoLpXG5GPxzDOA=;
 b=BvyzA6CgLLhyNO/VnUaggAnJiKL2qnnC9TsInjV5TA+wEweWdmgm0G61NiUFzauZwu
 +/S4baXG/FhkW/Delyv1G06RJNoERgAMjbDUqlk8dlUanZzaZoQxsTukNPdWpDbIZxVM
 9RBU3X5vsAltTj4YkGKGDIbEq4BnFSJ2DOXyY/5VS0gqwJj+NMSXbVPBzw2luj2+qjmT
 000s7/P4BiqHIr2fnmUA+xifOmup6x11KcB6FimmQrq2jcxBtrVmxnU2/NLgsolRqV0n
 1ixPVDBcQdwK7E7UNqlhDQi7847pcNbOnUWHeL3YmCrNXSh1LyXOXysW2DiUUf+ymYys
 GLgg==
X-Gm-Message-State: AOAM531iKvcNEcDDvExsmj8e5fmNnstkyPA2NXBOqh0tziR9r+mLArl/
 djtZqpEw/f1oOg6z77Gaq3Sc9A==
X-Google-Smtp-Source: ABdhPJwBawxu2oTUO55D818pZJrRZVEugw6Lk23dBka6ZNH8jNqJobFfavhthR59DZ7ba7tVzBiKEg==
X-Received: by 2002:aa7:da83:0:b0:42a:b7c9:1a7b with SMTP id
 q3-20020aa7da83000000b0042ab7c91a7bmr24452951eds.359.1653322528287; 
 Mon, 23 May 2022 09:15:28 -0700 (PDT)
Received: from prec5560.lan ([2001:bf7:830:a7fa:f33e:a35d:7618:8a44])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b006feed212f50sm950591ejc.184.2022.05.23.09.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 09:15:27 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 xji@analogixsemi.com, hsinyi@chromium.org, sam@ravnborg.org,
 maxime@cerno.tech, tzimmermann@suse.de, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] Revert "dt-bindings:drm/bridge:anx7625: add port@0
 property"
Date: Mon, 23 May 2022 18:15:20 +0200
Message-Id: <20220523161520.354687-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523161520.354687-1-robert.foss@linaro.org>
References: <20220523161520.354687-1-robert.foss@linaro.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 7328736d270aa4fa6fcd033ade02acc2874a2db5.

This patch depends on the patches just aplied to the media tree, and will
not build without them, which leaves drm-misc-next in a broken state.
Let's revert the two latter patches until rc1 has been branched,
and rc1 has been backmerged into drm-misc-next.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..35a48515836e 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -94,22 +94,7 @@ properties:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
         description:
-          MIPI DSI/DPI input.
-
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint: true
-
-              bus-type:
-                enum: [7]
-                default: 1
-
-              data-lanes: true
+          Video port for MIPI DSI input.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -158,8 +143,6 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <7>;
-                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.34.1

