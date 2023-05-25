Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49177710312
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 04:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7288B10E626;
	Thu, 25 May 2023 02:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4710E626
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 02:50:48 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so957630a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 19:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684983048; x=1687575048; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEBP16jDdKfZXyVFFhpDGWBgOGBnuO/n8Kvdd4MlHEQ=;
 b=wXCi/TRKvMtzbjDGaWKOKeQXcGf2XiOm9fRspq5kk19SJ+7DgxjloFXfsRQWVERmOy
 lWv1DSveaakkvFL3nbuaUiMBvvDG1Ja1MeWwPq8ftuK2618qtLHsKj6rKeqA9ZhqiXct
 Sl2i1rORnzO/l2mwletBdLFLLaH4XlT6PxN3r6V7PE73dLMpUFBZLGb9yjalpyGgX4Rf
 2k2pnHcSxdGhgzOFjGMgo2cjxwc0vnHT93lV2365I1CQyDCHlkkQIqBqBLzcIZVdZDOy
 Wf+CnWCU2qASt9O/COEbPEKNjeURBoFICed8qBMhpzE/gvd5WqK3PJLTJXJ/Tz/px+Sf
 v+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684983048; x=1687575048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEBP16jDdKfZXyVFFhpDGWBgOGBnuO/n8Kvdd4MlHEQ=;
 b=FLRZNXE35lXbFbrEb5DdKhSlS2DxmsNScgTObkQbxcQAoJizGRu+9zUrHwdjcAss0D
 Ns+fVTr0kKo++tDbhUf1e1fJhPYeJjeBPsdd9n03gZgdPEe542fZdAUYW4KcUn1c9mwT
 vhBk6y8QS1YB+p+xxbs7YSmBMaGIHZsg2ZytutqAsawvpUBK1lGWOMH7IzzfnqdW/e+5
 N4RtSuFUDAzXO2eQ0lZmmMTJWh00LRHoDBTymRKsyhjcy7zXmmTbvWK1hFTN74DEvOXt
 /wkgvTU8x3/jkx74/OMNW9S6xwZyZv4BuIHx3jdMVFvRDPqSPoM1e+EUsi4SNuXQ4ZJN
 gz8A==
X-Gm-Message-State: AC+VfDzZYlTVv0wtn7GvJ72YBLgoSwIqGlfm7f/cbcnii/QYCpJFjDEp
 h7MijmsbEnfyTpCfhbU7ZyUzvw==
X-Google-Smtp-Source: ACHHUZ46Ks8ON/dKygzdKENi8wUoeHdEYjocv/L6LED/yPfARc0TnBardJYDQamt6YsLc/o9PwNGdw==
X-Received: by 2002:a17:90b:fc9:b0:253:9478:5da6 with SMTP id
 gd9-20020a17090b0fc900b0025394785da6mr108527pjb.15.1684983048151; 
 Wed, 24 May 2023 19:50:48 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090a734600b00253239144c5sm171815pjs.42.2023.05.24.19.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 19:50:47 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@chromium.org
Subject: [v3 3/4] dt-bindings: display: panel: Add compatible for Starry
 ili9882t
Date: Thu, 25 May 2023 10:49:59 +0800
Message-Id: <20230525025000.3692510-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
References: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
 <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STARRY ili9882t is a 10.51" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 28a7beeb8f92..906ef62709b8 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -34,6 +34,8 @@ properties:
       - starry,2081101qfh032011-53g
         # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
       - starry,himax83102-j02
+        # STARRY ili9882t 10.51" WUXGA TFT LCD panel
+      - starry,ili9882t
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

