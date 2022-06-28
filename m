Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D155EC5A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD7910FDFA;
	Tue, 28 Jun 2022 18:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D062411250F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 18:19:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id g26so27476543ejb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCqC8GW9HKHpFH4wlDQrjFsLE8xAOLT85EC6wVnCbqE=;
 b=oQPMOr1hl7nMjOGc021ayJnlDHmo0YsdtCqmr12Q+NJnCBe3TtOuMP7ZP2QWsWgZOS
 PM++Gv4Z2N+KZ/KMDnUUZPv4BIaSVuCiTER94aNfvJTVno7FaOMmzWU+M1h2HYKWOyuB
 lCEnleDaxrk8uR/TN9qlgSaCVW6x4XQRhFsuMMHLAEPJSt4JWC1yBGHH/cRAKg/zHdrK
 t7CWgzOaWLR+1F08DigV6cFlQS/7OaZzu3QimOeI4DbSvpFRjBjb6jvgIKSKc/S6H8hX
 kpFjKwFnWuDQ1sVVpsmiWPGxdo2YmCyrTF3DhOnyUKNibpEHzgiuwldS9LO4czF3Ty78
 +DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCqC8GW9HKHpFH4wlDQrjFsLE8xAOLT85EC6wVnCbqE=;
 b=JoqorM0OQX1VWIEKF/xT6lvKlCsRoA5NgOnOhd7Euw6mX1F2ew535ax4saM6/A+9vW
 Hf7vuM5rI8D7q98dOMkcSxn/YqWFlUaAoM9oUNcx5dVM8DyFVspjYuRZ5oDazQrMNkfO
 Q0N/gctQKB1SJeEu4Atjr91H6wAPxEFyf9gpcMsN0+GFMQNoPxY7PZDK3W6ykFSJ7Hj+
 F2IAO3ki6UY88fx2z/2YxqEMn6yQJJWboLyMZZw4WPZheG0A142AmUT3RJos6saryxgw
 xOiOazypGfhCHk9Pjx77AhGlAfdGrlHKb0LClidkb68ab/rrM8EUqj4NB8lixCZkTA3W
 XiTw==
X-Gm-Message-State: AJIora/dYFgj4x4eK+VTxqzgIKv2PJcSD6CA0tNaKLbZv6PY1M054Hos
 5qvcl3Ik1p1/qYWyxc6/8Mc=
X-Google-Smtp-Source: AGRyM1sSqfRLsI0RsDDkEx/dMXLezB/q0XsKNxmge2U196i4Gi1R19bmaPHDDrtVUGfpn8tDCQYSVA==
X-Received: by 2002:a17:907:2d2b:b0:726:a628:d1ae with SMTP id
 gs43-20020a1709072d2b00b00726a628d1aemr11401718ejc.336.1656440360397; 
 Tue, 28 Jun 2022 11:19:20 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090638c100b007219c20dcd8sm6730824ejd.196.2022.06.28.11.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:19:19 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v3 1/4] dt-bindings: display: panel-common: allow for
 additional port node properties
Date: Tue, 28 Jun 2022 20:18:35 +0200
Message-Id: <20220628181838.2031-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220628181838.2031-1-max.oss.09@gmail.com>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>

Allow bindings which reference panel-common.yaml to add additional
properties under the port node.
I.e. 'panel-dpi' needs to add a new property to 'port/endpoint'.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

Changes in v3:
- New commit to allow for additional port node properties

 .../devicetree/bindings/display/panel/panel-common.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index 5b38dc89cb21..ff8dc07ef3b5 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -68,7 +68,7 @@ properties:
 
   # Connectivity
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
 
   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.20.1

