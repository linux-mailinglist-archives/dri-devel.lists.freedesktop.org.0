Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2405AF30A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E4F10E0D7;
	Tue,  6 Sep 2022 17:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBE610E0D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:48:31 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 d63-20020a4a5242000000b0044880019622so2050279oob.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qnSptJt7AFNWmzxMCkqf7MrpKQxtkc2Z0kVrcaCyyfQ=;
 b=Wer2x+YDFov3Deacn/WiARefcJWmuHOcvu2uP8uH8+YdERSLxscCoKSkGDvR/R/xIz
 y6pjcAsh9vvhPRRma4ObkA5ANV8a2Du/wiEFC97ViE0Xwtco+qwg9xnHSo3R/yStTDCY
 LvpEdpHin/RU7d4o1ZEhrKoFlsKRfQ6iJPN8PdfbBChtz1hKAfOeqXAfHetBQB3nJ41M
 CCH9a4EIkMKsEbOqRjQ0FSqW9Hpv0fLSh31VvFdEBWIvVNRjnTOvdROnTzAz2fgYDXf3
 pfYqLzBahOfYEjtF5+c8vTF+rjlWfxILejZcSjyq1ykvyA3TPVM/fq8LhwXdEabTNFVf
 Qm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qnSptJt7AFNWmzxMCkqf7MrpKQxtkc2Z0kVrcaCyyfQ=;
 b=OHYBvzeFmbQGbqp4Y5ct8F5ZsIfIrCsXkSwnBlVD8I+TNUuTyZQUeOXiDJDM8FZ7RG
 RgwRGe756CGJE+aSMk7n6EUI3c1LrBWpJCAMj2Pdzw6SPExjMR/k362cNpDd4uhUDZr5
 7VJPfnoRi0yhHF56Crflj6Doc8Tg5WIirQlsjNYKa5wB95qNTD6k8bnk5V4Zz35fIpM3
 yu19hQ2qqcFH9o43eDDrLzSwNQ6cJ+m8Kh8JonDJDe/mGavQOfYM7NXERM1ocDxqz7nU
 cRYprJJpYl1D+NT0AeRUEVQXHeDZMrKv2tpYLApWzLx5FYlLd3FWgX12dAHIi79KW7q6
 vDEQ==
X-Gm-Message-State: ACgBeo30SjlDAorWtyjkpdZ7juxomczg7fXiA2gxOGReOyqPVN5TXDW7
 GGjVq9u/NC9p1mVdDE3LTYs=
X-Google-Smtp-Source: AA6agR7QdeMD60yDHlEgNwk83J8km40Qr5XTioo9P1Fu6QVKPdibmHtPFNzCY/x6hkmeQ/qdtBZjug==
X-Received: by 2002:a4a:bb19:0:b0:44a:9cda:56a1 with SMTP id
 f25-20020a4abb19000000b0044a9cda56a1mr18660613oop.14.1662486510547; 
 Tue, 06 Sep 2022 10:48:30 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 o186-20020aca41c3000000b00344afa2b08bsm5568065oia.26.2022.09.06.10.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:48:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH v2 2/5] dt-bindings: phy-rockchip-inno-dsidphy: add compatible
 for rk3568
Date: Tue,  6 Sep 2022 12:48:20 -0500
Message-Id: <20220906174823.28561-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906174823.28561-1-macroalpha82@gmail.com>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, s.hauer@pengutronix.de,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, pgwipeout@gmail.com, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add a compatible string for the rk3568 dsi-dphy.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
index 8a3032a3bd73..5c35e5ceec0b 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
@@ -18,6 +18,7 @@ properties:
       - rockchip,px30-dsi-dphy
       - rockchip,rk3128-dsi-dphy
       - rockchip,rk3368-dsi-dphy
+      - rockchip,rk3568-dsi-dphy
 
   reg:
     maxItems: 1
-- 
2.25.1

