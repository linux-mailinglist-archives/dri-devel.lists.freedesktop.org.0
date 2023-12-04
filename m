Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31909803DD6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA84D10E3DE;
	Mon,  4 Dec 2023 18:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D266910E3D0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:30 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-58d3c9badf5so3298842eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716250; x=1702321050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tt7p+s16vSie2KNcwqFmTas/nYdcYXt7AtlDl/GxmQU=;
 b=Qkje4mISqJyMPdQLxxAkIsVyE2FX+S3MhadCIviD5X1we2YKodBapFRGKg9W8NKl75
 OLWxshDZuK4UPR8C17ylBn5YNa64NvHpO2W6uaItc5KXABMnHxUO+tqb51iltz61YxSY
 iDOAIkGXSIDoEanVrS6W9ksYpbUWGm6lSUqcifQj0j1wlvoBQojZswbQLGuLHC2d3v6J
 T3iuVfvJOqGW3P2+YaxNGwoDzhAFhnj3mYqYCc8H+N30WAEwrXk+8QPt/DcvSwm5s/K4
 PnYq7bxspTCbGieNxl7KeufCaXrDVsjijoSEkXrD52MlIOWLDKD/NGHDkY2ON3bRwLWm
 nhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716250; x=1702321050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tt7p+s16vSie2KNcwqFmTas/nYdcYXt7AtlDl/GxmQU=;
 b=vbBvgCbP0jkEwYJ2NO5aXrTyvFMl1S2LM8JJmibYpw0kgkjm06zP+FcsZAgHBH/UN3
 3URukbI+JEbGD3ORWtR5JBSJr1e1EtVsHb8pTIEViV69v2j7sm0KOVgMsq36HnDeZy8B
 vWYQgY4F5Tt7CnhUYPrmONoqmfiqAWbbsiGb+5Wwvm8bw9w5ggjA6d8EaooaOVkcSeUa
 Dn1xa26OBF16DcmBS6n9Ul5/Q7683Jc5dr4sQZvuHATKuAsGjTj4myr9XZF7ITEgoKCB
 X8tqMCfSzwrJV8XtFBRXmnGm5bx2kDO35217hotrD06I9O2Zb7v8j+DqrhXUGHBbNQ3I
 c9cA==
X-Gm-Message-State: AOJu0Yx43pbu7k0AROocfBJV6P5UU5oyVAMvGlRiQvb3jcERxPuCqvrR
 2P0J1jF8s9hBVUKFdG/T/4w=
X-Google-Smtp-Source: AGHT+IEg3mnRFteODCShcmaGK0xSbPP4p55IbSbjlLspWPM6wpaoisrb+f0sfc/+J6PPBDDH5g12Sg==
X-Received: by 2002:a4a:a308:0:b0:58e:1c47:8db2 with SMTP id
 q8-20020a4aa308000000b0058e1c478db2mr3008122ool.12.1701716250102; 
 Mon, 04 Dec 2023 10:57:30 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:29 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 05/10] dt-bindings: display: himax-hx8394: Add Powkiddy X55
 panel
Date: Mon,  4 Dec 2023 12:57:14 -0600
Message-Id: <20231204185719.569021-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Powkiddy X55 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 3096debca55c..916bb7f94206 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - hannstar,hsd060bhw4
+          - powkiddy,x55-panel
       - const: himax,hx8394
 
   reg: true
-- 
2.34.1

