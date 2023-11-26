Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9847F9382
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 16:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542010E11F;
	Sun, 26 Nov 2023 15:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F157E10E10C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 15:46:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a03a900956dso654602066b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701013615; x=1701618415;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9ZptptuvFLM3UckOpdhtM6b2Gb9AhuhmBdl+FUGxy4=;
 b=rGuXAV+TWDUSR6mKySABNblP5gyk5sDwvPfxpMel5M66Ckl0heXfgfykKBiR8wMOBK
 cki4pvh3VMsWu0a4aLyf9bJ77RDhVBd9XXdZJuV4EU45xTppH5EaDtFwuDooMnL+EY+T
 gXjUig0K/z8lKs78gCw4DR0417xkPmsGy47U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701013615; x=1701618415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9ZptptuvFLM3UckOpdhtM6b2Gb9AhuhmBdl+FUGxy4=;
 b=qi4n9PsHHAWhanTj2vK+/+MVUDd4d97QzOLJYrLUlcu5rHIEEQaA+g4/OZIMjlbZab
 F1Nx/ySO5I5TgmLsK4t6FR5S1b9+W7FW2EbDS2J6geLCh5tsgmYvbCUgjurXsyKYxQBk
 HCOwRCn6ccZZr3n9EMHFfk8Okmd4Yd5QfRNH5ziYR0c907a09xA4FhwhQ011bDb5EC8E
 K092ugZm0pZRd2j/UOBo0OV+mqBfZjfDgf3YBFNdcFWBEpR7+Tp5W4QgL3ImsEYUewch
 RixZlyEY7z7qRH7uHtDup7wpIQ7ueJIKGc1JRPsbi33SsQH2iiMWqp7Ib7EbhKCnkvJr
 t1TA==
X-Gm-Message-State: AOJu0YyO9qZIivxdGHz21nvlBdHY8mSwvG40UmDor0CT6Qhn+OqUDi+t
 vVUme0fsVW/y5921ZBZdoNt9EA==
X-Google-Smtp-Source: AGHT+IEfT4doHnOsbz6gudgEBQhP/ws0s3F9AB/JOga8mqtwKh+rmACr2W6jdNBb1rt3mTUHfeVG4Q==
X-Received: by 2002:a17:907:7b94:b0:9b2:be2f:e31a with SMTP id
 ne20-20020a1709077b9400b009b2be2fe31amr9616483ejc.31.1701013615439; 
 Sun, 26 Nov 2023 07:46:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a170906591800b009fdc684a79esm4656158ejq.124.2023.11.26.07.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 07:46:54 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] dt-bindings: ili9805: add compatible string for
 Tianma TM041XDHG01
Date: Sun, 26 Nov 2023 16:45:01 +0100
Message-ID: <20231126154605.15767-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
References: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
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
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

Add Tianma TM041XDHG01 that utilizes an Ilitek ILI9805 controller chip,
so its compatible string should be added to ilitek,ili9805 file.

Add the compatible string for it.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../devicetree/bindings/display/panel/ilitek,ili9805.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
index e08af5f0b2e9..1b5bf42df7d6 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - giantplus,gpm1790a0
+          - tianma,tm041xdhg01
       - const: ilitek,ili9805
 
   avdd-supply: true
-- 
2.42.0

