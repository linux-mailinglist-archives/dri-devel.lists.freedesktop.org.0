Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10A06262F7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4207010E8B9;
	Fri, 11 Nov 2022 20:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6244288284
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 20:31:44 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id b124so5942094oia.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVGg0nA9wNIi0Jewzc4LnXJCRV2Q026/w/hAmHhcOh8=;
 b=Q7UJA0jp6wd6TZZL7SSULID+66etZUFTtTwdlSOL5xvnu48x0MtFFcyDZa65F8AZlo
 9Q3yzyvtbdpN0BjN1vCZqK0yrm/ZoquUjN5mhmhhOfxk/LDfQ8s2BornrRyAVPULpSbv
 HvA5CzIl6+a07/LchAR05cBrEw1bktkYasX0hUjQ+h5oRTudBu7nTeki1L6+XPkvgs2h
 hr27ZD5pdClWUjbylJLzG5nF89Jmyk7D0nHzVl7Aiz1rGHRxkblGCzVqAXRO0jlBwlB5
 6WJEvBNTu8NVgiw5GxLGQm6afikolLnylNEqhPl5/iXjLzx3Z0d7UlNG/g/NywvxamB5
 LOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UVGg0nA9wNIi0Jewzc4LnXJCRV2Q026/w/hAmHhcOh8=;
 b=MDidqLfRoKrS4KOyGf47Jlos3mrZT/y3tpt/d+p4vJxCSt9xqgGoT6Ei1DOw4Knt8q
 TaceboixOZqFBJMxYWSbAp95mU7oj3OBULY9sFxEvYu6XKXMh41czYRv8/YjjnYijVcJ
 9GA3BtsJ0YZZc++6Y8/uWGf7yXvoV0Mvjo/seH/gbRZwvfmjivhxpDAoSMeOUMO87rPJ
 D0n2P8LGWvCOZgPY0RWe6IfLszJylC/hDJPuxbcETOMgwoPXiEk3oAN86KLEDxWB+ihp
 dIyVB68qAxcSf8+5uuoxwWSSn6s+TwfTH3YxldqFC4OY2i9PA4TaI5Dy9uQTDBR3TfoG
 eZPQ==
X-Gm-Message-State: ANoB5pl8QhMqpPFyT3V35Mrfz6/yJhYyKmK4Ks7LWns62p6ms2w5HgPf
 uxri2+A0g7weteJ/ANtFZgnUK2zUjHQ=
X-Google-Smtp-Source: AA0mqf4wcEGFxyBApTMEYOtrMG6ElSUz6Oy0cPR3IbNMEyqpjhHtyoKMDQTWKzb0XvtTdb7aZCeM3g==
X-Received: by 2002:a54:4788:0:b0:359:568c:176 with SMTP id
 o8-20020a544788000000b00359568c0176mr1585531oic.110.1668198703316; 
 Fri, 11 Nov 2022 12:31:43 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a056870558a00b00132f141ef2dsm1734054oao.56.2022.11.11.12.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 12:31:42 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 1/3] dt-bindings: vendor-prefixes: add NewVision vendor
 prefix
Date: Fri, 11 Nov 2022 14:31:28 -0600
Message-Id: <20221111203130.9615-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111203130.9615-1-macroalpha82@gmail.com>
References: <20221111203130.9615-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

NewVision (also sometimes written as New Vision) is a company based in
Shenzen that manufactures ICs for controlling LCD panels.

https://www.newvisiondisplay.com/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6e323a380294..c6aa7b3d1455 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -883,6 +883,8 @@ patternProperties:
     description: Shenzhen Netxeon Technology CO., LTD
   "^neweast,.*":
     description: Guangdong Neweast Optoelectronics CO., LTD
+  "^newvision,.*":
+    description: New Vision Display (Shenzhen) Co., Ltd.
   "^nexbox,.*":
     description: Nexbox
   "^nextthing,.*":
-- 
2.25.1

