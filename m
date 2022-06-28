Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9849F55EC5E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23610FE11;
	Tue, 28 Jun 2022 18:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9522E10FE11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 18:19:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id u12so27426933eja.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZmdSXyK7MtJsa+B/2L5AP7mAzbY702Ape25QJtokg0=;
 b=VsmkR5qJY0evJ3fm7iM52bgRkE8I9EHXpVN8fHRFZwqPDIm+EbxuoYe1h6fAkoC6/F
 fU/Acpk9fzIEvvuGx2pTJUgQZq+Mxdn81e/xNQbLysGJmJyyJhcGnaAYqBw0IFbI/4oW
 ZBXUj0vxAbyUD5vj4V6xcGqVWCtWnNY4g6VHi+6ny5ckCNUNuD6yN44bqWGq+Yhq9ZPj
 Y+mXPudo+13LbYWaityCt5anaCoSLm02ofIneVlO6tklFAt9vuble+ktxS8eo+ymYLs7
 g5JcgvkSUh2OXOwb3y7ykw3tVOp3kTmwgUPWPfCYRzUaNbgd2F4D+CZKkSKe99jDalbx
 uFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZmdSXyK7MtJsa+B/2L5AP7mAzbY702Ape25QJtokg0=;
 b=dthc9K1arRq0dxRD2EqNTGN2ylWEKlp6FKoj0ehghhcBTtSsvVqWZdghKqtU9zB8bk
 g1o3ZYuNfJBFwdMb3mmpv8PDQsaKM6dOe5aqMRfEHTMIMyHZP5ImLB4Eg4e5whdugJ6i
 AgtUtm5tvZmpTnaadUGu32Y5+BEfO0mNudSUT86Lf1mM3SIOSzJ6dMregU3nbrZ+RUys
 UtyToyoZaxkM/wAEsewXXVYXLCkFXlhld3ua1xxpKCKAbj9HzWfViqMPUmCvOjCfSPSa
 9EIwetjultdAO5KQb0g/kVcDQ73o/QWN1hUimPSdiIJvXy8HZ7ULD+MD5fR7h3d5DT8s
 PyGQ==
X-Gm-Message-State: AJIora9kjdU27VGcSMrYr/t8wsdixGpKxkqTbs5OhXJmlYgFJyFBM7aA
 AuCJfoIPVqq055LeSdEou5w=
X-Google-Smtp-Source: AGRyM1u6+ZHcJMTYJAMJeLySWF0XNIa0o5fEsh08zyXa+XE/G0OH2joLIthF8b9FEB9yiwxGeMcAYg==
X-Received: by 2002:a17:907:608d:b0:722:ebcc:b108 with SMTP id
 ht13-20020a170907608d00b00722ebccb108mr18528050ejc.94.1656440363047; 
 Tue, 28 Jun 2022 11:19:23 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090638c100b007219c20dcd8sm6730824ejd.196.2022.06.28.11.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:19:22 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v3 3/4] dt-bindings: display: startek,
 startek-kd050c: allow bus-format property
Date: Tue, 28 Jun 2022 20:18:37 +0200
Message-Id: <20220628181838.2031-4-max.oss.09@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Nikita Kiryanov <nikita@compulab.co.il>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>

Allow to specify the optional bus-format property newly added to
panel-dpi.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

(no changes since v2)

Changes in v2:
- New commit allowing bus-format property for derived startek yaml

 .../bindings/display/panel/startek,startek-kd050c.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
index fd668640afd1..05306713044e 100644
--- a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
@@ -19,6 +19,7 @@ properties:
       - {} # panel-dpi, but not listed here to avoid false select
 
   backlight: true
+  bus-format: true
   enable-gpios: true
   height-mm: true
   label: true
-- 
2.20.1

