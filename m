Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39166EF67F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5575010E96C;
	Wed, 26 Apr 2023 14:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8E10E101
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:32:26 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6a5f9c1200eso2825746a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682519545; x=1685111545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKt31LkUOMOVzbhHQr750NfPuXf5xSa7bbIP5o6iHnY=;
 b=HqJRPRxTaW7AIr+dZKH+gDLLKfN2N9CoFu7K5eZrpfM1aGoJzlA/2DYCSQM/km7PkR
 yK1ReMSJY7nVFRSGqSR+MH6j/Zx0fN2qdugNq8x05U/f/OAncgSAPTmdt7U/Tcxlb7eU
 s2j2IEHpXXsq9WqwWoO2BSnBuf+Ek6aTadkC4UL96LBbL7NwtHTjvN1HRo4umLNlK4f0
 5Kf5vdbwd4/QRsTU84As9Eyn3DnYbpup00XIr+6udt9wZFnM/qGtj9m7HuM7mGzAdkE2
 W3p/a0IFA8jzTiwsbHSS5cxmN9zXmXYp53t1+4CydhzAPU2OlzDeT7rlbSBh0xoi7Hhr
 WVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682519545; x=1685111545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKt31LkUOMOVzbhHQr750NfPuXf5xSa7bbIP5o6iHnY=;
 b=fepoEE3ypYtIbyTrDCN8uXb+uV2RcEw4KNUGRXhja0kantGRJgjuY3zrCGwGiJ7eiL
 vCFBt79ws1Kswc1vEzNZRJl2vjkZRsFJT7l+kHti5XVx8ZyyMT2gmcKPg24CWQ+ITqcu
 vvgdltvlduFzqfp83JW6WiaZaMMuo6R7HyLnyNb4XX+bAkM6SNZctwjTikmz5VY7+LdT
 nsDdpXMjV5bqKMZy+D4CBzDu9wHEmiivOXjs+OHOxNmSNmCHB4np/665Q/4/fyikhM7K
 wxBvF+WF62xE3iQIz+MxInhPBC7EMQe5wtUxqVBQAXUN/ZZvgKd6UZvdLqYW5OCRgHYF
 aTYw==
X-Gm-Message-State: AC+VfDyTcrBoG2c9U1JnRmieVONnEOypHdCmMwmUPoDdzkLNeX4qcD9v
 AhLtYBhosbT5DkllCvmJU3Qwu+MHXBQ=
X-Google-Smtp-Source: AKy350blnrnSkBv4NNaSiw762d0pt+rrX5Fu/nYbFtPQ5+qO+0qlRQCWKLLEAATPvhgA/go9W6wTaA==
X-Received: by 2002:a05:6870:3310:b0:18e:b155:c418 with SMTP id
 x16-20020a056870331000b0018eb155c418mr5554086oae.55.1682519545314; 
 Wed, 26 Apr 2023 07:32:25 -0700 (PDT)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05683010d200b006a32ba92994sm2613502oto.23.2023.04.26.07.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:32:25 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 1/3] dt-bindings: panel: Add Anbernic RG353V-V2 panel
 compatible
Date: Wed, 26 Apr 2023 09:32:11 -0500
Message-Id: <20230426143213.4178586-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426143213.4178586-1-macroalpha82@gmail.com>
References: <20230426143213.4178586-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 sam@ravnborg.org, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG353V-V2 panel is a 3.5 inch 640x480 MIPI-DSI LCD panel.
It's based on the ST7703 LCD controller just like rocktech,jh057n00900.
It's used in a 2nd revision of the Anbernic RG353V handheld gaming
device. Like the first revision of the RG353V the control chip is known
but the panel itself is unknown, so name it for the device.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Guido Günther <agx@sigxcpu.org>
---
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 09b5eb7542f8..150e81090af2 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -20,6 +20,8 @@ allOf:
 properties:
   compatible:
     enum:
+      # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
+      - anbernic,rg353v-panel-v2
       # Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
       - rocktech,jh057n00900
       # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
-- 
2.34.1

