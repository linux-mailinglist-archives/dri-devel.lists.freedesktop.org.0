Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDF6510CB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE9A10E2D9;
	Mon, 19 Dec 2022 16:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EC710E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:56:58 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id t17so23085546eju.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gb1Ci/peDFXem9KQH4YU7Ajcj0W54+LbHk+JTs6pzhc=;
 b=UmDPOgnX9rup6tCIGhloyjt6lRLcVZejtv4yKWpWgWwcK/Hfacc0swYAY457jUkhri
 z5OzYxcIh/efEjrvv6MzGJIbeH6ygsTbO9N0FgEGjJHwnprbJvYQIpjfGO0bpwGPju8y
 MHnKEqKBLVADfiBhuGYf7+R6UCKEmTgbgSaAm3FoxplZlfxonWhg9FgInq5DJtE6awFS
 DIjXQZLg2sm8Tlchzw8JTDqWRQqk3PZ7P8TUoMYpxbHe/bV7M5vcvTYc8TB0E3zeclwp
 41/8670nFhZvHxF94m47MJ8pzhP79gbv5DUfGRKCPs3s9/ltjvaUU89jBNQANKbv3CHF
 eurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gb1Ci/peDFXem9KQH4YU7Ajcj0W54+LbHk+JTs6pzhc=;
 b=SUvYLijqbaqDpReVWnYb2qqXpx7I3KHIW2CSQc7Xs1jO2J/yBzUWJE9fLG+kiHqWyN
 n3QLrBgYxprhG949yRlQrQXqPZV4fFDmQYUdmLPw3m4dfLNeeP1ivHdf6oQ1yQLmkbU6
 5ssLTcVeBTeVAYcDSKWLF8pu1cTI6rS1zirhRBIW86QeHH4SZqSB32lNHUcNRBhrCuUf
 O/zS7JOPRkTidqMANUXaqXrZI/c18gjvo8l4fmsf+NegOll34m9gJU/2QS5OwvrZCP8N
 qUNhggTYzUbPsOIDBMAhFKdmX4mFWB/sG7yAIMhTTBc8JVDc6w4POroTkOELiT89L/WU
 eUFg==
X-Gm-Message-State: ANoB5plWGFwLiEAdHAcFy4ab8SOPD0wG2zT2Sg9FU1lFXNxcJsasWAUo
 D8D4TeBtppRlGY3XHqlOpjA=
X-Google-Smtp-Source: AA0mqf4bqKwTMm/poacEbbnbaz1b85s0kV6pg/w2GLVW64PdSvJIQpi543GO23QSmuWnnclDXJC8+w==
X-Received: by 2002:a17:906:18e2:b0:78d:f455:c381 with SMTP id
 e2-20020a17090618e200b0078df455c381mr37139173ejf.39.1671469016673; 
 Mon, 19 Dec 2022 08:56:56 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a1709062ad200b0073dbaeb50f6sm4605585eje.169.2022.12.19.08.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 08:56:56 -0800 (PST)
Message-ID: <e54f7b52-3530-59c4-90c6-1fb5a17d6491@gmail.com>
Date: Mon, 19 Dec 2022 17:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v4 3/5] dt-bindings: phy: add port node to
 phy-rockchip-inno-usb2.yaml
To: heiko@sntech.de
References: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Rockchip rk3399 a port node with one endpoint can be connected
to a USB Type-C connector node.
Add a port node to the phy-rockchip-inno-usb2.yaml file.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
index f71920082..ffc7e7560 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
@@ -115,6 +115,11 @@ properties:
     required:
       - "#phy-cells"

+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Port node with one endpoint connected to a USB Type-C connector node.
+
 required:
   - compatible
   - reg
--
2.20.1

