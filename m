Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3F52B93C
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084E410E2C5;
	Wed, 18 May 2022 11:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933910E298
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 11:56:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id m20so3293947ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDVhsYhcH84aV3iRdTGGmIFJ0IE7KSrLpx2SeKM1fdE=;
 b=lH9VMsyVl8qTRJwQvmr3mFQlz3jrJ3x40HwM5yg7Pta0C5oBdhVDXKcw6gWcXZkXVT
 wfQk/CbUTB2/rlsKyJlTDFhF/WE1M1nnUVeDmMReRXIfWmuy8QLD+nn86GHVrseWLkqH
 VGUwTtdA/wMHQk3kO+B3VGKLtO9taH1NkqijqBC9aKSYcJ5dI9jChu5zm2GzbnwfO9ra
 z31S+FZKexYikA9yKw28U+OOjyz6EucQL+J3tWlwnns0ss5FNaESXB70/ZM9eCGGkIfH
 OtObyA1fPXzluO2G/b8UlByYFjmmhdwkkpzdnGG5/HY+jmJN/z0OqKhlvKcjM/w1HXnu
 JFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDVhsYhcH84aV3iRdTGGmIFJ0IE7KSrLpx2SeKM1fdE=;
 b=NOxm+7Ix6AA4n+sNv76wNC0m35qQAo6XSpoVHlc9YqJe0ryou0VKAMxgje716jROUg
 w70mBtiaEvLSGYLASb8mcdy25ignvJnMftgpDfm9k29zPec2UbqsxN4zv6MlkSaaEd5J
 vHOKQia8M8rt3nmSwPsku5Rdwo6Ipn2bws2O2EbbUHFqIsoHJiOUSwpZ+UzM/AM6wRdp
 33sNUeSw3/+bzsZF8fkxF6K7rXGuNuav++LgML49A7hGOlVd932IEUbkL9xjXC1Mbhbs
 RLOJrmwCSJJRWYylrSTGev1TnzTODhsvCw6zEMcah9ofywbv4A/48e/ewjPDIAqp6o/i
 63RA==
X-Gm-Message-State: AOAM530ISdY0ogp7SQysP0uJpbfZNulX1XcCihQtzQdBCVZbKHX/xOE0
 lJQzH31GJR+Zk+hkdVL+H+E=
X-Google-Smtp-Source: ABdhPJzzkEqdp3Q+ON2NhyqKQVUmBjrQFHhrDta4Qq8v8UNA5ECXxP9dmsraf+dBf51ngGrUihZCpA==
X-Received: by 2002:a17:907:1c8e:b0:6f4:e24f:20e0 with SMTP id
 nb14-20020a1709071c8e00b006f4e24f20e0mr23516272ejc.227.1652874975853; 
 Wed, 18 May 2022 04:56:15 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 dq20-20020a170907735400b006f5294986besm873999ejc.111.2022.05.18.04.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 04:56:15 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v2 2/3] dt-bindings: display: startek,
 startek-kd050c: allow bus-format property
Date: Wed, 18 May 2022 13:55:39 +0200
Message-Id: <20220518115541.38407-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220518115541.38407-1-max.oss.09@gmail.com>
References: <20220518115541.38407-1-max.oss.09@gmail.com>
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
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>

Allow to specify the optional bus-format property newly added to
panel-dpi.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

Changes in v2:
- New commit

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

