Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5952539C0A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 06:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBD6112D20;
	Wed,  1 Jun 2022 04:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3D0112D20
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 04:18:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id f9so1305587ejc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 21:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=RSw8k1d0PMD6wj66n+1hU8B9FRDPkW1CFpjiF9rIWpo=;
 b=TrjwgnTl3ploNX8zp6ORq5aPD3FqDvLo44Q/ZISeWjgM9LzKROEkGRYve2Aw1eG9i0
 bSsVkwTt3Q/6UxVCLBY3LvzMdzxs7gGQBwE8zZx4/g5BcYgS1tZNun5uhrmI+J/rGAsY
 Hpgcezyg6qs7qwlyvuf5l8c0UaJdiN9e+YItj1Z7MvD1UOVjQY1ZQbTqk5YlFvMulQai
 cQRtbuvXCwZZTYBpJ8cpL24BqRqj2flVyj6FgcEjJdpoyam20SSW0WqWT4RXOxsOGqsi
 gfYoTo45CiLzohoTeFnVcEzE9/YlcnSjis36EqgKLPvQmgDzXKtYGPDGg2w48IlD9OGq
 CvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RSw8k1d0PMD6wj66n+1hU8B9FRDPkW1CFpjiF9rIWpo=;
 b=bwRxoapZBh3AOKijOXqBfJ3kgJG+XEfaAJljbOP2w1WsYZMXoyqejX55Cn9k5zDOM/
 ufyxlr5nGA2aoUt2IpZJNvDPrnp5tMWcgK9v0HzwvZczS/vIDmbe9dvyugmktfFBX/k8
 bQ/hxnuvAgGHr+TYxAmehPtll+On6cwEDdIdOUpe5tnYUT+mgFWODuhKAbJcIR0xkRrM
 IS/yPL6ZcYIQgAQbQtpWCsG+FeBDCNYkO+qnpCbVaQpT2U777vJ0Xv+plOIz+q1ozWhg
 4m/8GO77M6M9xBJ6Sj0Sb4oEwN8uq7kcT9aUUHF/uWez3x657hzfiGNXmD9b9CxGjZ6Q
 xAfA==
X-Gm-Message-State: AOAM531jme1sSnRNZ21KZRCaVBLqMxBx1LddWO2ajW6JPJ1sp8nvEQjL
 BBedgvr3a5fllE+jDOitH+M=
X-Google-Smtp-Source: ABdhPJwgyhU+ZXDOZckYUwEphewTltQH7fIGAK729jV57SMSjG84XZZdUm4VashgG42xtDimZYYf/A==
X-Received: by 2002:a17:906:9749:b0:6f5:38d:d4d8 with SMTP id
 o9-20020a170906974900b006f5038dd4d8mr57000119ejy.405.1654057106397; 
 Tue, 31 May 2022 21:18:26 -0700 (PDT)
Received: from felia.fritz.box
 (200116b82620c00028af88788fa7d286.dip.versatel-1u1.de.
 [2001:16b8:2620:c000:28af:8878:8fa7:d286])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a056402020400b0042ab1735552sm279952edv.66.2022.05.31.21.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 21:18:25 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] MAINTAINERS: rectify entries for ARM DRM DRIVERS after dt
 conversion
Date: Wed,  1 Jun 2022 06:17:46 +0200
Message-Id: <20220601041746.22986-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 malidp@foss.arm.com, Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The three commits:

  36fd2a65bcaf ("dt-bindings: display: convert Arm HDLCD to DT schema")
  0f6983509ea1 ("dt-bindings: display: convert Arm Komeda to DT schema")
  2c8b082a3ab1 ("dt-bindings: display: convert Arm Mali-DP to DT schema")

convert the arm display dt-bindings, arm,*.txt to arm,*.yaml, but miss to
adjust its reference in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
broken references.

Repair these file references in ARM HDLCD DRM DRIVER, ARM KOMEDA DRM-KMS
DRIVER and ARM MALI-DP DRM DRIVER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Andre, please ack.
Rob, Krzysztof, please pick this minor non-urgent clean-up patch in
your -next dt tree.

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ae685aaf8850..58e751b9346e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1510,7 +1510,7 @@ F:	drivers/clocksource/arm_arch_timer.c
 ARM HDLCD DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/display/arm,hdlcd.txt
+F:	Documentation/devicetree/bindings/display/arm,hdlcd.yaml
 F:	drivers/gpu/drm/arm/hdlcd_*
 
 ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT
@@ -1545,7 +1545,7 @@ M:	Mihail Atanassov <mihail.atanassov@arm.com>
 L:	Mali DP Maintainers <malidp@foss.arm.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/arm,komeda.txt
+F:	Documentation/devicetree/bindings/display/arm,komeda.yaml
 F:	Documentation/gpu/komeda-kms.rst
 F:	drivers/gpu/drm/arm/display/include/
 F:	drivers/gpu/drm/arm/display/komeda/
@@ -1567,7 +1567,7 @@ M:	Brian Starkey <brian.starkey@arm.com>
 L:	Mali DP Maintainers <malidp@foss.arm.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/arm,malidp.txt
+F:	Documentation/devicetree/bindings/display/arm,malidp.yaml
 F:	Documentation/gpu/afbc.rst
 F:	drivers/gpu/drm/arm/
 
-- 
2.17.1

