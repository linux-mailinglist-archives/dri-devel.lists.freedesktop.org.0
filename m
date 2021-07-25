Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1D3D5061
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 00:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A3B6E4CD;
	Sun, 25 Jul 2021 22:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173C66E4CF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 22:16:06 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a7so9018647ljq.11
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgL0jl+mGyF6SSLvs6k02lrCaESH25yjasdaW3GUG0o=;
 b=XVJjTIPxvnEWl4SG7Nf+hPCcxTuaZPN5sl9Z6oIY8QhhteqMKX1+81uH4TmUjWkiRb
 Hl6eGd/Udy8KUC+68+8Um7NMvBJ23Ir/LSmflE6RmiZXHOXc3OPkT0vQ6vk506PmJbXk
 oz9TkdfMBQ/RWkWoik78kXGRtMneGJrPpTaKxxc4xLI9FK17PGXs7WnMCrngIvjrted/
 zPk84qETZLDO46YFmjPQXsbVkoWAWVB+hx9Jfahi3Avjq98DlopGN4ooOqLm72Mxscle
 m/fhTuHyBM4Gk8fb1sCFAIY7Lxyk2Qmn1mTytNifevzXYwWK2nfnrrXGNARYH4eKZAwG
 Xmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgL0jl+mGyF6SSLvs6k02lrCaESH25yjasdaW3GUG0o=;
 b=VYyxbjWqeb8/b/bJjqztBPGwkE9s+mxmz8dc0Z4lZYMlgqZmSDE9ZTc6ssjIqG33+7
 TbyVHj6W33jQntBrhoWvlMM8Y42t56ClbbvgeQK2G/BmwzU+ODgpfZRKgt/OqtxgYp8l
 XmfmUaP0JIPJ4NyZMa1P5K2dyo0dMrTyceMCCuMloTwOO3iMTCSR3RsT1V8fzqgy4Aef
 oixV2c6mIBtfk04F0gfEjTtS6+ctBt94g5ubvdeNqMW6/Huw+X1hdl7Wp+KFmYFuHHZr
 sIc69CqXveTXbpNb6sQ1PBwwFfIXLfDeNPsCHYiKUJUZICydWxprehUf/h0EJniBI7zP
 vsJQ==
X-Gm-Message-State: AOAM533ZPZMR2ofLl2VPVUWfpdjY7qEGOrHnLVX/1e7z4CZSObXNkY0O
 ElWrlKTsbzETsaLCEIHlQf0=
X-Google-Smtp-Source: ABdhPJwBU2jxUb/QN5CBkad1DB5Az/HhP0LQMBNTgpBFw3PXObxa8LTzkcmGR0JvZdp/GsVaigtQUw==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr10370354ljj.495.1627251364569; 
 Sun, 25 Jul 2021 15:16:04 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id z12sm2862647lfu.53.2021.07.25.15.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 15:16:04 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH v3 2/3] dt-bindings: Add DT bindings for QiShenglong Gopher 2b
 panel
Date: Mon, 26 Jul 2021 01:15:26 +0300
Message-Id: <20210725221527.1771892-3-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725221527.1771892-1-akawolf0@gmail.com>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, akawolf0@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT bindings for QiShenglong Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3624363938dd..e7f3db118c5d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -244,6 +244,8 @@ properties:
       - powertip,ph800480t013-idf02
         # QiaoDian XianShi Corporation 4"3 TFT LCD panel
       - qiaodian,qd43003c0-40
+        # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel
+      - qishenglong,gopher2b-lcd-panel
         # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
       - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-- 
2.32.0

