Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B0170A702
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 11:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9645710E13C;
	Sat, 20 May 2023 09:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A4B10E078
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 20:05:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30948709b3cso1705289f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1684526735; x=1687118735; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dhk36Zm9kcZS6s/7QkUBwDpZCpJODd1UkmAk+ko7ofs=;
 b=lFddv1Xx7+aPZjnuJK/BNYdmR8nlXfjsnu2AfYrhh7BYshp1lzes5QgQmT8Nhc/gBL
 KCc6xtnn/dDsF6gi7C6YIJROVs7pvOVZnvCZejZ7ey69pbvMzBs0EhpaXbM5AmCGUnb5
 gGH8L5TA3JLdPqgiLlxcIegGfCFQaMOyh3YSCRjWpGi8bmeJ9J7C5rYazwbHsPAQMTtr
 w7Qde26UkLiaeMT93GpPAhIOQ20R39oN+YLgF0h5UYtM/AOcigpxfR8LCo1xVORSNXKI
 2GgcpH9pjx4n4PdWkfJoO8bs8I5D/YPUTpaXrVJRRGHV6ZZRLa1EL8ph1Yhfc9FLOvq0
 w6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684526735; x=1687118735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dhk36Zm9kcZS6s/7QkUBwDpZCpJODd1UkmAk+ko7ofs=;
 b=UArtTHh2NAXuQ09qnWjkWdau5Ci46AbxLHd1tkHVvebS5kcE3lN4pQX9EpcwdLdMi2
 JQ2xIamQbjJki/kC2W0oqUZ+g5rCd532Rt+DUkzcjaadRYcWHsItskpHZT+doExI5Aqz
 vOFLs7OGTIKmHCJIJ2n7bmwL8V8RMyvUDaLIl8qWaAo673ozjfAW6jYX4s+sn8frb6ia
 dIacuEcNFDScDpPfHx2jcA4M8Q0cUF3HC1wIgDWTXM3oFiPoNTihvzBrJLdtbLhgw1t4
 6E9s8p1ZHEDxK0SOFfUGUFRX04lAgq0u6HeXOUO8LIhenvFB2n3Cpg6cQEpXy68xg42t
 K2Zw==
X-Gm-Message-State: AC+VfDwhjZunDrIsd/SIagc8Np7X+usDq9kM6+NA/g60f0QCMlMNmJIu
 tShxKpT6FvsUs3W0+zQwVCrBZAxbPp1Uv3Y8+fSe+g==
X-Google-Smtp-Source: ACHHUZ7/5/41nm0I7TwCks1heDFNmOyLJILcAtVDJl+PWPTeQg8QiNNU9BXxnomI8I+UZzBMfl7Fcg==
X-Received: by 2002:a05:6000:c3:b0:304:6762:2490 with SMTP id
 q3-20020a05600000c300b0030467622490mr2871230wrx.3.1684526735223; 
 Fri, 19 May 2023 13:05:35 -0700 (PDT)
Received: from localhost.localdomain ([188.27.132.2])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adfea03000000b002fe96f0b3acsm6220329wrm.63.2023.05.19.13.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 13:05:34 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: backlight: document new property
 default-brightness-level
Date: Fri, 19 May 2023 23:05:20 +0300
Message-Id: <20230519200520.10657-2-alex@shruggie.ro>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519200520.10657-1-alex@shruggie.ro>
References: <20230519200520.10657-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 May 2023 09:58:49 +0000
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
Cc: daniel.thompson@linaro.org, pavel@ucw.cz, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, conor+dt@kernel.org,
 Alexandru Ardelean <alex@shruggie.ro>, robh+dt@kernel.org,
 Philippe CORNU <philippe.cornu@foss.st.com>, krzysztof.kozlowski+dt@linaro.org,
 Yannick Fertre <yannick.fertre@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@foss.st.com>

Add documentation for new default-brightness-level property.

Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Link to original patch:
  https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98

 .../bindings/leds/backlight/gpio-backlight.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 584030b6b0b9..b96c08cff0f0 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -23,6 +23,15 @@ properties:
     description: enable the backlight at boot.
     type: boolean
 
+  default-brightness-level:
+    description:
+      The default brightness level (index into the array defined by the
+      "brightness-levels" property).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+dependencies:
+  default-brightness-level: [ "brightness-levels" ]
+
 required:
   - compatible
   - gpios
-- 
2.40.1

