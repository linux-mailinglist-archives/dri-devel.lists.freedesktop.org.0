Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14C657CF0E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 17:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCC210E601;
	Thu, 21 Jul 2022 15:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D460810E2C1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 15:32:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u13so3372362lfn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 08:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSAEKIvtye5jS07a7SCopVWWSkQdxtLbeG/Qb/jLxOk=;
 b=Rvdze6Ay/jzmEJuWKHz6d8GONFosd5gpWdYWi/JRN1OjKN2i1Jk8wdvsduQ4H8k8JL
 UdwErw84gZ4T/ZzSfJ5NynfzzrkFsWvRk7AQLb9rYAPas3wqT0gUiMpE9V1wXzOAsmHF
 7EXEizMpX5vmdqwD6YyQM96dzP5GLBGnrBDS1/XmKVJk143W6ioev/IgPkh1VLk2Wzvz
 /oNmvFAOYhtfbU0Cy1XasqHa9Dek8OUzjDtO10bNzcSElFT/9iZWpMTF0hdbY2dMa4En
 sAR44Y7lA86ATER7P2GVmQOnk/BllCZ1FFLpXhxAkOtjuJVpIUurtPbYYw/BlC/KIOGq
 IdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zSAEKIvtye5jS07a7SCopVWWSkQdxtLbeG/Qb/jLxOk=;
 b=tWPoNReQDoj7vjngNrdoC4Qh5hXSvr28ti0j/hf14FGuo/zmjMWjoFZM4nCAH1V7us
 GXgyxeSo9Rm3Vq/672Ploi9O88ZykqVZzj0Ifqfci/T6WCuAZObmPZ8bmlC6d1pL1IMQ
 nX/EbPrpSzmlFneFVxGVpJ8xs2Gq7LrDhoxhCHv5idI3tv6Tyue1ZTuMUPVUNYaLqjra
 OzMr1xOHKraVOxaPYsiTP0ByhJ8Y43iti8OYtgH9YULwh3+3daIHTQl6NlQWCoYSBxmQ
 pKAIX0xrhHMaGz7N/jehj35tvu01Gh9TpcTz6SaXN4phDNmW0Bkef5MTixAkPf0hInLs
 +4kg==
X-Gm-Message-State: AJIora+Ni/yh9mW6D4OujYOvYg9yZDdGVcH+gKDK4Db1vwYSEsOdf3TS
 Os7oD5CGZ/FFdDHKQGXnq/qjVw==
X-Google-Smtp-Source: AGRyM1t1GsMxf5C4K7kyBGZWAKDxo4V4V9DKDdnTuEaHQtbYw9EAmvVhKT4eVr1iIzVSWR6scvBZrQ==
X-Received: by 2002:ac2:47f6:0:b0:488:b649:9f77 with SMTP id
 b22-20020ac247f6000000b00488b6499f77mr24197373lfp.559.1658417542316; 
 Thu, 21 Jul 2022 08:32:22 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
 by smtp.gmail.com with ESMTPSA id
 a27-20020ac25e7b000000b0048a2995772asm504604lfr.73.2022.07.21.08.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:32:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Tomislav Denis <tomislav.denis@avl.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>, Nuno Sa <nuno.sa@analog.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Mark Brown <broonie@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Marek Belisko <marek@goldelico.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Christian Eggers <ceggers@arri.de>, Beniamin Bia <beniamin.bia@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Oskar Andero <oskar.andero@gmail.com>,
 =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli@axis.com>,
 Dan Murphy <dmurphy@ti.com>, Sean Nyekjaer <sean@geanix.com>,
 Cristian Pop <cristian.pop@analog.com>, Lukas Wunner <lukas@wunner.de>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Matheus Tavares <matheus.bernardino@usp.br>,
 Sankar Velliangiri <navin@linumiz.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Stefan Wahren <stefan.wahren@in-tech.com>, Pratyush Yadav <p.yadav@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, netdev@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: [PATCH 6/6] spi: dt-bindings: drop CPHA and CPOL from common
 properties
Date: Thu, 21 Jul 2022 17:31:55 +0200
Message-Id: <20220721153155.245336-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The spi-cpha and spi-cpol properties are device specific and should be
accepted only if device really needs them.  Drop them from common
spi-peripheral-props.yaml schema (each device schema will list them
instead).

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 9d63a58b46a0..ce048e782e80 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -34,16 +34,6 @@ properties:
     description:
       The device requires 3-wire mode.
 
-  spi-cpha:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The device requires shifted clock phase (CPHA) mode.
-
-  spi-cpol:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The device requires inverse clock polarity (CPOL) mode.
-
   spi-cs-high:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.34.1

