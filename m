Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D70C548794A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 15:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCF010EF89;
	Fri,  7 Jan 2022 14:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0196B10EEE7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 14:55:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso3067099wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 06:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47wpJBWQnnL/Yb6rNHbZNchIMuG97gnS58weYyw8g1s=;
 b=oDkoluSypttLPb8Umty2MkLN39zoNn+9O+8uwJHEHGGV530ukbfqnm4b05aPIAWwse
 /2V6s2vxjhUrjAZGU41ncmfN+ghD273nb2lCOlD6KX1CR5RGjjVkypoCBmQOYxnhbxGr
 j29xczS30M6R8PDuiilNYwCKA08PJYH1+/ufSiO6+xC+NrtfjlXlDevRjgguGzpQxey6
 x7b39MeJgsG8uKRUkQpPFg70pMUPxHe5oYg46UIHAhZbu3ZeDHbC3DXYRxIx7b3+Q/fZ
 fdOcqfqaB3CqPoclqeAW7ANd6Cz/7dUyXUxE25RwNSkOFMFulUUBKDXSglnWbiP/suCB
 fhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47wpJBWQnnL/Yb6rNHbZNchIMuG97gnS58weYyw8g1s=;
 b=WoAews8DX4K2vkQCQFyZ57tQxK+Wcvk1PQ32PxyEqsYpR8axFCOnqemZwcsfkX0MKj
 iHxZaoTO0cpvvJxdGQ/YQy9TzUZ0G7+9h7vqzin5Ev7/rJh/cfmyGuDH0cywpGqgDpj7
 Z51bAcz+Vk9V7zYXmqSwu0XF2ysRMMoFdnjZRUqNQX9zj5f4snHNcxb3IAUSg7baDp9M
 gAoboe4J97fyv+FQlyDlpa3v6wXVtfZWfiwWY6hExDkuZBZkiLAnMYKjxu+HntJJH6yX
 KaLoPnaJpfLTG6pZNtI1AliQJW80wIV75dnEGYSUJnzYesLqRliQC91Unpm2VY6Mw7pw
 96pA==
X-Gm-Message-State: AOAM532x3NNVJwR+eKeGN8kPeOiP9Sf1371bf6TEaOSywhfMfT+0hPmJ
 NW52DCPiNWI75p8q4TS18fOla7xhTj5Nog==
X-Google-Smtp-Source: ABdhPJyBKmX/qE3POuKtDj/Gi6P0EsDyoBMPeSdgpd9TbRF+5r9CaPnxZmF+nL27uoClnSD7luMOTQ==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr11484032wmc.118.1641567326252; 
 Fri, 07 Jan 2022 06:55:26 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:25 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: display: meson-vpu: add third DPI output port
Date: Fri,  7 Jan 2022 15:55:11 +0100
Message-Id: <20220107145515.613009-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107145515.613009-1-narmstrong@baylibre.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 851cb0781217..525a01a38568 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -92,6 +92,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 
-- 
2.25.1

