Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E00171FAF1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 09:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6556F10E62E;
	Fri,  2 Jun 2023 07:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105610E585
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 17:03:52 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-97458c97333so29097666b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685639031; x=1688231031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTcjRJtvmJkq+LZbJsn7Ql99XlhQeL7VF1cYGLTbIN0=;
 b=n7Sl+iCP+FVrRNRM+g0Sz9GCNp5AtH9LEbszoEgXP3nux2UZChxRBclTN0TV5Q+8Nj
 HcANmkqpCwpAKoTljNxUqZ/L0V2hRruf8GVkXgRhID9oQx82u1i3j1xk5wUs/Xz6jwhd
 fh4Yw9IOyWDEp8gpS/QhwOnfSJMFnUNspWCDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639031; x=1688231031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTcjRJtvmJkq+LZbJsn7Ql99XlhQeL7VF1cYGLTbIN0=;
 b=HO+NvHRyLD8md+Bzq5XY45WgAu2/I49vkHO6BxZXZfO2NARCyDSQvNl2B42zb5IGGT
 Rpw5/gtuki0aSb4sGwPz8ShuTL9emI0D0HjBJFziZC94fMu4OtZsp15rbEI2dZ2S4XN/
 FXcKedKWwClRpU2nzdpk6kGXYJFMDwhQRcokBVxaM1xMQD73KKPDTZIJqcqp2aSSCSXr
 q1nbzZei1uHSLU8LPn2a4E4AMAT6ZCZ3yQIkUwX2VomqI0OKZQXnyILSLz+F2dLayIRW
 sO4OCnCVPHj4SytwK4x/CMOsNnivF7+BzpTYhTu4WfOFTilAwNPU7hJfxQFjBET57AFw
 7p3Q==
X-Gm-Message-State: AC+VfDxxYqlZOoh0rUrz2JUWE+CN6OW3PM/byi7P5EWTU1QypANPdvMY
 BTvUTYPtex4P7FvKKHgGTJxXgw==
X-Google-Smtp-Source: ACHHUZ4FzuZULxk+9erHkcf26CSBR1lbhOScIjaiZzQRVe4X/4sI5tkBoCLZAbqVQDR0tZeyiWty6A==
X-Received: by 2002:a17:906:ee87:b0:96f:781e:a4d5 with SMTP id
 wt7-20020a170906ee8700b0096f781ea4d5mr7658970ejb.77.1685639031091; 
 Thu, 01 Jun 2023 10:03:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a170906a0d900b0096165b2703asm10658522ejb.110.2023.06.01.10.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:03:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
Date: Thu,  1 Jun 2023 19:03:18 +0200
Message-Id: <20230601170320.2845218-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
References: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Jun 2023 07:26:38 +0000
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
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible to panel-simple for Rocktech Displays Limited
RK043FN48H 4.3" 480x272 LCD-TFT panel.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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

