Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC48A7045
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C86310F191;
	Tue, 16 Apr 2024 15:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hgxgalph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95810F191
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:30 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a554afec54eso51268766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282809; x=1713887609;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SlEeWD9RdnsW9I9f2pYuDWO+bMLMc/qQZCTcLBo8+zE=;
 b=hgxgalphCDx/7hJdemFvt67UaSOYorsI8ko0Y3lJKIbH5Zaq7N8aujA9oai8Jr2ONf
 NObn3FbMdgRwiPlvHQdQ/re8BNWANAqpiqc9fdYTWjOLX70fRAGXPo0/7krB/6F3qAmz
 222IsJnHPurP2b/drHKdbT1q18YavoE8il8CNUrvK9CC2gbQcVqisjgyxvbgcdTx9qgO
 Iv1Nb4X/RSvNg/3viOOU3evdHVL3aKqtta+s3HCR9lgRdjqg8wftt7XFFu5Ps/0tw8EQ
 L68LgNWf98R1voZDp6+5z6tLzdFJ2AA7SJSXMdRVw9/zceh5gP7CQyOUEq/0m+pVi7DS
 TzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282809; x=1713887609;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlEeWD9RdnsW9I9f2pYuDWO+bMLMc/qQZCTcLBo8+zE=;
 b=Y8uXpB8oJuufc7IW3UMvix68Sz/Q+2qxr2zht8LMUi9zWV79cEwXs7uzFO2hvKT7pG
 DDe9xJxq9G0Xn9i/JJeNQ3Z/feqwlAH9NTpQB9iBf1d7/K2OgV/s3hrJ9tckxyPM17p9
 LQtCaZYEZlj9WCCwdbHtRUBo3LJiKH8RFIKnSfrBD5XBL7uEw7MPi+KIlP4g+p2D8waj
 ujEFSsaz/egO5buhHdq8hu3vpf6YiIz43+QsmzDzuMUAQIfsI3klfRW66YInu8bBeAvR
 wFnfj0vjKonPWJDoVcRFFIVqaz1hjHuJcDojOZuEBc48KHqHizUy8yLVFcLfMuT6eXB8
 Ourw==
X-Gm-Message-State: AOJu0YwNdzYKYrNDzH3byCBBz1S8rYLBNbEupFBaqoffuQqcbY/rm4BE
 zh+wQUrEJWG5K3Ndx4T5DmQJBDAWw7E/H4Cc5Dpb4Dew6NfiSbA5Dl3Gqv+CHTY=
X-Google-Smtp-Source: AGHT+IGMWP9H9D4wzeHmwqDmsjpmBqo8fF0N4Tb8Pg/HmubZGeYeU7yYfzmd9JEPX/7zZD0PHDYCpQ==
X-Received: by 2002:a17:907:7295:b0:a46:bfe2:521f with SMTP id
 dt21-20020a170907729500b00a46bfe2521fmr11781457ejc.24.1713282809191; 
 Tue, 16 Apr 2024 08:53:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:08 +0200
Subject: [PATCH v2 07/18] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-7-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=851; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=YWP6Shg60EA2OeIESWvWTK3n/fUHPgAwJXUBa6PIbUc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qJwFj8bEMicWa1Bd+Yv6HZMqP10hORk70wmm9
 Ht3VxpOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURcT2EA
 CQ9k4lzES7KrQb47lreloJoMbPkvR8BDltlnR9VGr1Y3rPz/eF0yVklAOkRZkQgmivBuogIC2/FMW3
 3Mqpb2eIx+lAQ10nRe+izPrsgV1mRX2WnDQa2lRtyzHLhBLPg45ZHYCDvB8qAoFfKbc8ynT/rnsZAV
 9wGHe8w/DqyrVOfNu1M9wmJ5h46WJbQme2Ou+kGRWQZsDi+IbixOTgy7LzkMzkrf4eSrPjH2uyn1gt
 4H3ioqP4qOoXM+As4EGwF4x53sUiArvvyEW2D4M283Ozf+n3x7q4H/Bei+yc+Ip//Xja5v8l+2uFXy
 r9LTcfa4vMDDM7xAYZkKKTf3vy4HvrJbJKnD7T4itpL0ZD865d2dJM+ZvOaEXGke0eeQFYGLMccBpP
 n7NWDxz88lZZEjYrx/0nGR+fQmfjFRlknZJ2eFFwfIKvUtiBf0yKsNAL7/5k5yQx0KxtB8saq829hK
 mQUjGL4ZKGe/dGV7OMR1QRcFKKRMHBya93+5TrmW+D49qOGVGvzmiPysmJiOxXhySbyUsQsBDdrPme
 xdG/CnNLMBc5VEpKF/wVF9/dZgrURBCwWJCRySXAAptdcd52ED6yYKjjNlsF8zpdi5veP+b22s2owS
 hLBf9RV7LIM56p4qEDNzzg7TXLX/CEHbXzR9GdetcCOZ9n8wi/QYDGrF8BMg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-binding documentation of dpi for MediaTek MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index e126486e8eac..ebb61bc4eab7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-dp-intf
           - mediatek,mt8192-dpi
           - mediatek,mt8195-dp-intf
+          - mediatek,mt8365-dpi
       - items:
           - enum:
               - mediatek,mt6795-dpi

-- 
2.25.1

