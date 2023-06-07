Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75B9725440
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309D610E42F;
	Wed,  7 Jun 2023 06:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3752810E431
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:31:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f70fc4682aso58510335e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 23:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119511; x=1688711511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+N6ncdPhuJx70XZ6yjaTOtXW/wJdhXZgpqu86CyLnmg=;
 b=iSFhC91P61leOakC3ZYDB1vfHeGButTdGDM1hW2MzuCfi7TC+dUY0TPp87E5Gwzxxo
 h1o6UEBegakpxBiWmhOhHQNcKItVaIWq4KsvQsneKZ0iK3g19qU++mCSiiVscT1xka+X
 S7IGHfHgN7WvF22pGm+WjoUgdt42UbaeJaUH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119511; x=1688711511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+N6ncdPhuJx70XZ6yjaTOtXW/wJdhXZgpqu86CyLnmg=;
 b=IYzk9lg/N9EvBTaShsdyyzd8k33zW/i8Pu78LLBVx3/XFSg7mz+aTLdpjjovYnYFhB
 e63n3wNBObiGmz0XN9pYJh2KxdD3iYoUiAl88VXzk9DFElNbSMHWX4kUqRVD/6eKTjWc
 TULRRcJnBWWCnNK34hjjI+9ig4LnWZPZxbOJP7sbQmpA7Sd/5Kwqial1AwpEa2lfRTje
 0gPxt6CCgo6NtodRbkaJqcC7+bNKrwdSFq+OHr/iTWb5ZzwiBn3yWmkPA/t9fjDWFvWo
 phlNdQkxv5aDNNcd+j05DHaPaznxeNgK6gzr67QGFnFJ53KVGHiD+tauaH5wHSSqY2nC
 Mg2w==
X-Gm-Message-State: AC+VfDzc8Q9e64RyBvL06uc1pVZeBspefr1VK2xF+VALgMpr0kOSjS0g
 hmiCl6JSSSNEfZ+pI7nYHco75Q==
X-Google-Smtp-Source: ACHHUZ5a8gfVu2axekyl+99oSLUzWfSPuWuaqcQZYuCkNPZ73b9TII++3uuK7xQc96qqlkKElumaFA==
X-Received: by 2002:adf:e80f:0:b0:30e:59e9:5e1f with SMTP id
 o15-20020adfe80f000000b0030e59e95e1fmr732503wrm.65.1686119511073; 
 Tue, 06 Jun 2023 23:31:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 4/6] dt-bindings: display: simple: add Rocktech
 RK043FN48H
Date: Wed,  7 Jun 2023 08:31:37 +0200
Message-Id: <20230607063139.621351-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

