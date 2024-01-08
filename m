Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A308278FF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 21:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F1E10E2A0;
	Mon,  8 Jan 2024 20:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B69010E2A0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 20:16:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-557dcb0f870so910565a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704744988; x=1705349788;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPj6dK4Y6vsktwHdkLF/o85MNUXF5Ogkk69ytI2SuLg=;
 b=boU2SYmBNjYkdVvSFWNStTBxj+rzEZ18DYMfF8C/p2jImnfSnAzOWEU69+gQq+IqIh
 MxoMQz+r+QQxrb7zNFZuLq4O2kFhF/bgw/wM5vmSNBo8SiQ58UWgEGosOTSgximCKIp+
 S46Lb2PMSscEPfUG6qAw7xCqplyXiY5I/bVDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704744988; x=1705349788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uPj6dK4Y6vsktwHdkLF/o85MNUXF5Ogkk69ytI2SuLg=;
 b=ZmgGTjzzNvaWRJmbdsjuKj2mznAKcsAEXe6jFW2bNs/3Zzof/kvJibxJ5Ej6YfVOeu
 RL+e1L0YtWrDLH5rHNeL0GI5rXQHMAaGQ0AgclEm0PQLhxx/XdF7X9s8aZSMWOhzs59W
 XgGTM1maaJ9WcezyTc3/thTDG/7PhnRz4TZsLULyq3lqmgiuCn0Fotld7Kk+bjTX0fsP
 d64cDSd6l7/LUNsRuYQJy+BiBQNaA8cUy4rPtIDlAuvz5rmWlOFscRljVzuhVTNpGOk+
 Ox7GdlGbV7KeKs1h6oWWx8Oudxzh++CX1pTPzBDw8g0KkbmbgRbTwv+XrAWVsaoqAcb9
 Bwiw==
X-Gm-Message-State: AOJu0YxIfEg6S/7/Bh9DMhK2HboPRyN59riiaIWQaigM7Z8b86oHh3ZO
 5EZCmt7CmtMSqevyveWu9qXRoMsKtElqrQ==
X-Google-Smtp-Source: AGHT+IGrVO/mj2lDXlfdaxVxV7Vk6MkhS7TNruVIj2gBo7vMSKctLqbruq6TfuxXv46NP1kfhsXTgQ==
X-Received: by 2002:a50:d55b:0:b0:557:6401:e7c with SMTP id
 f27-20020a50d55b000000b0055764010e7cmr2320287edj.18.1704744988646; 
 Mon, 08 Jan 2024 12:16:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-2-38-81.retail.telecomitalia.it. [87.2.38.81])
 by smtp.gmail.com with ESMTPSA id
 by26-20020a0564021b1a00b00555fd008741sm173699edb.95.2024.01.08.12.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 12:16:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
Date: Mon,  8 Jan 2024 21:15:50 +0100
Message-ID: <20240108201618.2798649-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
References: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
Novatek NT35510-based panel family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---

Changes in v5:
- Add Acked-by tag of Krzysztof Kozlowski
- Add Reviewed-by tag of Linus Walleij

Changes in v4:
- Put the "enum" list in alphabetical order

Changes in v3:
- Use "enum" to have less code changed

Changes in v2:
- Add a dash in front of each "items:"

 .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index bc92928c805b..a4afaff483b7 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: hydis,hva40wv1
+      - enum:
+          - frida,frd400b25025
+          - hydis,hva40wv1
       - const: novatek,nt35510
     description: This indicates the panel manufacturer of the panel
       that is in turn using the NT35510 panel driver. The compatible
-- 
2.43.0

