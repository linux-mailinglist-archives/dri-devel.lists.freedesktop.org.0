Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8F357E729
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 21:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169859144A;
	Fri, 22 Jul 2022 19:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ACE8D874
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 19:15:58 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id z25so9156350lfr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 12:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lDcr6lA6wTvJ7xcFBXD+24WTV1qMn/yJTavRAkd9iGE=;
 b=ilbCTarj/wnEjMbDmJxl2o954q9xKRhNUNea+2SMOboq81M/BCRCKqvsXSGxHPV57V
 SbAc0oUcrCWqqzr9eASqxwsnsmws+q0MsNSLz4sEsNko2MdraFVAiC7gOnj9oVR2SdLK
 5bg24FVpqNRAJA3hfRhtNnTX+9qMd1Swy2jcnXqzePcNeFzkaYH1DkA7yvRoZsysKt7J
 Diwl3mNT9PiIN3FbyxUdr31X10ji5CPz4cOhGH0s1467mMZ2i3b4OOG7sMMKRcMQHUk0
 W3xNGdFxYZwcel5RddsqfleFFqbJaU6ivvv9hkTp0wS7aO2JTVpthlZtqI7FePGWwZbz
 yiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lDcr6lA6wTvJ7xcFBXD+24WTV1qMn/yJTavRAkd9iGE=;
 b=EjNjD1XFZMKAYoqJh4Je45ofMViKTX6Q6UG1RAfXZUKAxaivD4eJyg886mE3uygBlf
 HHpoY+bgDkZWh52NGAPnQ/LUsh3TZa3CKJl+JupxUy4WqucYfjN3brEhwpCN/u6C12pi
 Y6c6GJC+VGKEf8PsCu5D+uLkljOILwWwLoMm6Ili31BwBDsz6hGwqvBaM7SUn4GwXXSd
 xJ2aCH5rfOwl4Ig6graj0P/kv4FLdgSmB3VySfxUjg/EIu5jN4FzEQXvLr3IC/sunY9U
 Teq4AS9y3QhrcbI+Sqn2LKS2kfauq8PGlZZk2+89TC+6V9Lz75leyRGT52bXOYAJ2qdP
 a6AA==
X-Gm-Message-State: AJIora+NoUgjlbFw0X51KyRCphpHeTv4OYmvf/whtXvQY+MQrb9fxn/e
 f7EvKymRNNFWJZ69WvDFvMd93Q==
X-Google-Smtp-Source: AGRyM1uljkuyb3A0AYTb0jGs5xTpnu6p3SPVNgMDaAZRVeBWKSRW0DeDhK1nbzG+uCmXUAw7q4zhxw==
X-Received: by 2002:a19:6745:0:b0:48a:76be:ef7a with SMTP id
 e5-20020a196745000000b0048a76beef7amr541545lfj.220.1658517356553; 
 Fri, 22 Jul 2022 12:15:56 -0700 (PDT)
Received: from krzk-bin.home (93.81-167-86.customer.lyse.net. [81.167.86.93])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a0565123b0700b0047255d211d7sm287484lfv.262.2022.07.22.12.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 12:15:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Marek Belisko <marek@goldelico.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Pratyush Yadav <p.yadav@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: [PATCH v2 0/1] dt-bindings: spi/display/panel: drop SPI CPHA and CPOL
Date: Fri, 22 Jul 2022 21:15:38 +0200
Message-Id: <20220722191539.90641-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

Rebased on Linus' master

Changes since v1
================
1. Rework patchset as Rob suggested, so there is only one patch - changing spi
   and display/panel.
v1: https://lore.kernel.org/all/20220721153155.245336-2-krzysztof.kozlowski@linaro.org/

Merging
=======
I guess via DT or SPI tree. I don't expect conflicts with display/panel tree
(at least nothing visible now in linux-next).

Description
===========
The spi-cpha and spi-cpol properties are device specific and should be
accepted only if device really needs them.  Inspired by [1].

[1] https://lore.kernel.org/all/20220718220012.GA3625497-robh@kernel.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (1):
  spi/panel: dt-bindings: drop CPHA and CPOL from common properties

 .../bindings/display/panel/lgphilips,lb035q02.yaml    |  3 +++
 .../bindings/display/panel/samsung,ld9040.yaml        |  3 +++
 .../bindings/display/panel/sitronix,st7789v.yaml      |  3 +++
 .../devicetree/bindings/display/panel/tpo,td.yaml     |  3 +++
 .../devicetree/bindings/spi/spi-controller.yaml       | 11 +++++++++++
 .../devicetree/bindings/spi/spi-peripheral-props.yaml | 10 ----------
 6 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.34.1

