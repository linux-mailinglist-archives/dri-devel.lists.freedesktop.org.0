Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7BB7CE28C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8D410E184;
	Wed, 18 Oct 2023 16:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C7810E184
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:18:56 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3b2b1af964dso3943405b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697645935; x=1698250735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uw/QwKMXqJsA0ZfWa9ge2ddn0yKUbipF+wTdf3W2lOs=;
 b=QH3MvGDJB4Z7XmaOeHPvqjSJ3qC51EAAashpfh3xHC/wE55NEfEVaQHAr9HTKxUy2I
 ng/rx7q30mwS1gVspHdR/j0dSpRgU/vpomGweLcl/A9H0gS6Tpsk/lV1lYRNeprwsQ9a
 P8IPFxXh+ku5bdcCOL7fuPuJMKYhQ6953sSBV0WRjiYOJMX+nY+sm6EBrCOPcktX/w5J
 IvMH9iAq8iKXGUJyuI5zE5GgtnlfMh45yXwjxF+sk4n1xJosOGXWAQPtf4PkI39iUVnR
 GKP1XKPKsz60czdUoVPHhnPsNgR/OS2UmuZdVvMlEky35w/TkdNYB9yEIGwgcxydOs4U
 HOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645935; x=1698250735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uw/QwKMXqJsA0ZfWa9ge2ddn0yKUbipF+wTdf3W2lOs=;
 b=JiHlDSvT4E2WYHl7qkwh2JdGMny7c8/VaFt55wcuubi5DPTdUeiDQTdJgCw9bUglI+
 1Ul1PE6So7Cn4/V3BiPVr40A51WcO0/tlRYtyf/adqZl4QygrTj9544EflhWeN1J2GG/
 bp08julfSODp3uT857KTcVD5EIx34wxSgqz4YUxG28ipEIhcXh2kMnB9Xxo8RzmBqncb
 ql2aUcDs7I6uoxHXTyzgc7L8GeNOkI0BxfTnoHDhdbriNrV6/ZX4WYbjuRFo3EhLNN+C
 TDq4xDG4kCla5zJUG+JGAqOpha0AHscnTG9TzSssl5jgEZNC1XTzI/sCkY10WitjlOhx
 0OdQ==
X-Gm-Message-State: AOJu0YyMpp1D0Yd0x80CMyrSNHL8EIM5IAs7EBXhHT8tnBGeLYuKj4XA
 mlXg0NYrEnqdc8+qM21YHlY=
X-Google-Smtp-Source: AGHT+IGVxblw+gFyde5QrjeYaigc+JDYVf1IHKc5ZSKgn/8HMCQzxvwUYh6/y+BU9OoipN7Tggfmsg==
X-Received: by 2002:a05:6808:2197:b0:3a8:6b4d:6b78 with SMTP id
 be23-20020a056808219700b003a86b4d6b78mr6659182oib.35.1697645935531; 
 Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: display: panel: Update NewVision NV3051D
 compatibles
Date: Wed, 18 Oct 2023 11:18:44 -0500
Message-Id: <20231018161848.346947-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Update the NewVision NV3051D compatible strings by adding a new panel,
the powkiddy,rk2023-panel, and removing another entry, the
anbernic,rg353v-panel. The rg353v-panel is exactly identical to the
rg353p-panel and is not currently in use by any existing device tree.
The rk2023-panel is similar to the rg353p-panel but has slightly
different timings.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/newvision,nv3051d.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index cce775a87f87..7a634fbc465e 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -21,7 +21,7 @@ properties:
       - enum:
           - anbernic,rg351v-panel
           - anbernic,rg353p-panel
-          - anbernic,rg353v-panel
+          - powkiddy,rk2023-panel
       - const: newvision,nv3051d
 
   reg: true
-- 
2.34.1

