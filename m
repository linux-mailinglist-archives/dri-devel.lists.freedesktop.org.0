Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D672EC88
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 22:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1014210E112;
	Tue, 13 Jun 2023 20:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98D010E112
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 20:10:39 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so237663239f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 13:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686687038; x=1689279038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OrFKDv64C3D/mFI/tKzX33+FI46+VP2OrxXGEXnBBaY=;
 b=LJnGBR4I2wGc2mOv6Wtoa4hsuG0i06HeDpMevsUDZIa+JbA+sjp4z+YIjvRtDx26fo
 FHdibJIrnZbpyH5lFtwogxJ2AE8j4nKWVYEdfJZgkIko9wF/XVkX63akRmhqzh56oezw
 cI5yCMZ7riejEpPc6quZFr6TO0VkhxaT8CvyH9z9ykCDhRKh8TXSpPI6s/5y8AqesjNH
 bjOEULQFIS97DwK1aM8Nxpyd+aZRYzcYdOLiyjBM9cItjvy65xhks2RHacDY6H+1aMvO
 aafRpOEPREPJe8yQNDCRLVEmOTT4nEi04I7/ow3/GoSikXJlQINFkW4HT/VF9ZiRN+1Y
 LwDA==
X-Gm-Message-State: AC+VfDzwFNE0E8FRHAgAA70cCfyO7rFuyMR7e7vo7e1NVKY7Q4IUtCxZ
 ROUlITeGjHirPd/n+Fyl3Q==
X-Google-Smtp-Source: ACHHUZ4p4QXVC7+UoDw8SyyPdFsQCfC744w0znfg77T5EBiSJu0WhmplR1C5kCPCXOPO4NIaOWK7yQ==
X-Received: by 2002:a6b:e614:0:b0:777:b364:bab9 with SMTP id
 g20-20020a6be614000000b00777b364bab9mr12043059ioh.6.1686687038727; 
 Tue, 13 Jun 2023 13:10:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056638060100b0040b671bcf15sm3516700jar.30.2023.06.13.13.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:10:37 -0700 (PDT)
Received: (nullmailer pid 2823717 invoked by uid 1000);
 Tue, 13 Jun 2023 20:10:36 -0000
From: Rob Herring <robh@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] dt-bindings: backlight: kinetic,
 ktz8866: Add missing type for "current-num-sinks"
Date: Tue, 13 Jun 2023 14:10:22 -0600
Message-Id: <20230613201022.2823392-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"current-num-sinks" is missing a type, add it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
index e1191453c2f0..11b6fc36183d 100644
--- a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -33,6 +33,7 @@ properties:
 
   current-num-sinks:
     description: number of the LED current sinks' channels.
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 3, 4, 5, 6]
 
   kinetic,current-ramp-delay-ms:
-- 
2.39.2

