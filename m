Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344E7720E5C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 09:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E8B10E20C;
	Sat,  3 Jun 2023 07:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD2910E646
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:21:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5149390b20aso2752646a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685701299; x=1688293299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+N6ncdPhuJx70XZ6yjaTOtXW/wJdhXZgpqu86CyLnmg=;
 b=FN+wcbGOSq0oaAGO68O3XS3iH/IcziIzYBzGbvG0X5hp7SCpf4EJJNAg1ZHmseAnew
 VPCMtcRQpkV5+FX+hVA0hl3xoaUG8TEfI/J/HgK+jzruhXOyLLGtoLcSSQIjLRIjohII
 VKnbARjYi/zDstgJJ4cvJWtQugRvzYaC5omoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701299; x=1688293299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+N6ncdPhuJx70XZ6yjaTOtXW/wJdhXZgpqu86CyLnmg=;
 b=La0/O/L+ivQ/pdgk1w2Gu5/grACAvr9YRhODhy+Xc5g/K2wPTw33pPSZjpVPtAKS5v
 W1tWCP+ORhLSTbIuckI0/4v0gBfcrHqyCcwVcHW2YE6v2d8RsTVYSnQObbdz2ZFB3QD3
 8dJMh9BFPJBeX/Atz2r9xZJ2kXsDI7WL3CFKUa+Ib5AOLZ+AVY1thkmiW5Ma9Yizoxnj
 UWo4ymaesASnJWhiGEkZ4p54X4PcUYoS7EdkOvlUC9vAL6Av7qWuCc/GMMjWPkC0FEHb
 /zxpFNZkWSMJGcW9r0xWQElqvrM/9gARSaK3kgApDMl38r1iFoz4E+l5irpnrtLYIAaM
 Ft8Q==
X-Gm-Message-State: AC+VfDzBuZpfWZo8YVNQdkh2JffUBu73guVqufyLfZq9SVo1qIyjmxvq
 Jaiohuk0JtNmTgdvTF5o5PeNJA==
X-Google-Smtp-Source: ACHHUZ4cxTRC+aOD1sVygvyNLnQtq32ncqv67n9fRQJ5jpcnMNundXDEtA2HWACi2ZfzZnSq8+CJvw==
X-Received: by 2002:aa7:d817:0:b0:514:9d17:d6e8 with SMTP id
 v23-20020aa7d817000000b005149d17d6e8mr1521068edq.26.1685701299310; 
 Fri, 02 Jun 2023 03:21:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 x24-20020aa7d398000000b0051499320435sm528887edq.14.2023.06.02.03.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:21:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
Date: Fri,  2 Jun 2023 12:21:20 +0200
Message-Id: <20230602102123.3345587-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
References: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Jun 2023 07:02:50 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible to panel-simple for Rocktech Displays Limited
RK043FN48H 4.3" 480x272 LCD-TFT panel.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v2:
- Add 'Acked-by' tag of Conor Dooley.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 01560fe226dd..bd6a92d2b41c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -280,6 +280,8 @@ properties:
       - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
       - rocktech,rk070er9427
+        # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
+      - rocktech,rk043fn48h
         # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
       - samsung,atna33xc20
         # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
-- 
2.32.0

