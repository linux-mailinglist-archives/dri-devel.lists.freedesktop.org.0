Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBC677FD7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA5510E4CC;
	Mon, 23 Jan 2023 15:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8810E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:33:27 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-15f64f2791dso14314715fac.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vauVSP++ugyn5fGJJedmL7nUBg3JKQVZaXGEjtQiFYU=;
 b=WF0XUue2aFDq25zhodlWd3r35wvnnQdajKGzc6spVzuY9LWsMKEJsCjOmXRI7QzFHZ
 vN7SjNDhGTbzjGecGlyixnbrWwpB8XD+284WiSr3e6wBZZl3TrCLpRBwN9Mv/G/Bo0vH
 0HfaujGnt4hLG7mnpA9W+MN6FrLhfophwK8vGw3xwqVBeusoqeDff8Pg5SHNTZDyLOD8
 yxWgD6vyBYrO/nFtDd0KemDVptxZ/U2KHfoGiNxKPiDAE2DBvB20CFsgh3ycsiYYETPD
 xA591q9ZIEiYYUUnxjYU5UOEql5xTe4DbAW0i0UehUXI4kDQDD29+ZfxsV4XhQqF0LVp
 D7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vauVSP++ugyn5fGJJedmL7nUBg3JKQVZaXGEjtQiFYU=;
 b=mjYZ/Zxo7+FuwCJhBdSjlkmTMKkChQ/Vk0dsNk2IGsvaGzn5wChaMPNMODNhCv5dk2
 u1xYK7hjYGRQyWa5rsvt1ZIAkrWKKgx0qjgUVFAoBa070okp65Yeo/APBoT+/u13R7zh
 ewA5iw7irU+gYgnzUO+hEmTroIyG4j4upn+5PnEjKp6vyBVzziTGE2tIBfiWC/fNUXEb
 wZQmCYVxKiN8cAzulLEAsY/B93ThknuLer6ieZABYHRtjkjtCZ+Bv3dwR5wlw6sQwGO3
 LgxMN+Wftuy/kBdbTS1p2F+7lEqRRrLBIZKGnq0IlRvlWEZuQDoWYTwaYBxXQtAEsRow
 BZZg==
X-Gm-Message-State: AFqh2kr9DzFl0lrUZ0BNGYhUx73tobb6TSujY8mQGwps1NcHW6HJP5nH
 oZlnk7aZprp5SouT025swoWb3X2SKnQ=
X-Google-Smtp-Source: AMrXdXs8D04h1EPugqFnagYbyJEvqRLkvRoE56HdrUF2u6xKzjAObVATNLkGhzDtz8MYHtXhxolU3w==
X-Received: by 2002:a05:6870:4c14:b0:14b:bdda:7754 with SMTP id
 pk20-20020a0568704c1400b0014bbdda7754mr13651635oab.37.1674488006960; 
 Mon, 23 Jan 2023 07:33:26 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a056870708100b0013b9ee734dcsm25459182oae.35.2023.01.23.07.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:33:26 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/3] dt-bindings: panel: Add compatible for Anbernic
 RG353V-V2 panel
Date: Mon, 23 Jan 2023 09:33:19 -0600
Message-Id: <20230123153321.1314350-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123153321.1314350-1-macroalpha82@gmail.com>
References: <20230123153321.1314350-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG353V-V2 panel is a 5 inch 640x480 MIPI-DSI LCD panel.
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

