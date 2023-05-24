Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A470EFC7
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB210E587;
	Wed, 24 May 2023 07:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C04810E587
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:45:25 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso402164b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 00:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684914324; x=1687506324; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ys/SLmJf9ZfMR5xC5B+aVb11E3cqyPInCe2lYcTys6w=;
 b=O9W4mEYJy3RzxDLdJdWLxzqiwP1Ylxa3TIWst/JvA9UPmhtF7kz4LB8Uj+MbWwkmae
 SXSaB7rj/iia708kLLPAIWPyhXKZYTeu+ETv86jb4viym/2+qNYdshXTG0Gl0DsRoneE
 4tIJUo1N2TdRgU/v7KgGHcYjwHrM5/V0NICA0Ak8okFSV8kPffJKvEB41gK15Vtp1asv
 t4teYeNXNQDDYyME4svL88fw2rJ7i3TslXTFF40WKh4wuZ2B8DBcOOe/Jq4kBFZClvz/
 Vgw7k7G51sRrEeaeEglVfpe/5JFAxcWfgIxDiolV75BV1y0CmOrBXhpcalLmMxn5duub
 oG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684914324; x=1687506324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ys/SLmJf9ZfMR5xC5B+aVb11E3cqyPInCe2lYcTys6w=;
 b=b8917KuzSg9jslmOl7/rtlJU3r1vgx2oHXxMP1MufhC6d2SEofBx0o5tgwniM+GYSR
 +wE2NC4/WwHGJaIjRo1v0Hb69jy9VOlKy9q4tmPIRYjf6uMvInsDfLGBQlJ0tbv3RUQv
 lDMnLZ5Qn65l91jTHQMw3LrfhFphqYjvIdJ2+I6LupQVeEAaHMKLxGQ0BzFpjiFwv1a1
 mEIFv9aTcmowTgytilBrr0c0CJTGOeCT9rhTNRa4SAqZ+ie3JRheZJf/EzFHCxxfcimb
 Q6538/dyroDxpAVvla5m2al3F4VqT9Nv1SlJqBm8NSgLzmj+fhcLN7CDy/SgziVmnivy
 pNRA==
X-Gm-Message-State: AC+VfDzV+QIHszciR9UfmDZpdCvur7QBLSaN+L5sOMzBhxelWsORR1V3
 i5hzy/Lm/a680LbL/+EjkMkDgw==
X-Google-Smtp-Source: ACHHUZ772BXLvv9iSKgRv0OHi1NApJDkZ266P3N+Twh6YGcaDgZs91atcx6DS8NTIqtu4xWPgBZR/w==
X-Received: by 2002:a05:6a00:4294:b0:64d:2a87:2596 with SMTP id
 bx20-20020a056a00429400b0064d2a872596mr1534767pfb.10.1684914324665; 
 Wed, 24 May 2023 00:45:24 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a62e906000000b0063d29df1589sm6801336pfh.136.2023.05.24.00.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 00:45:24 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Subject: [v2 4/4] dt-bindings: display: panel: Add compatible for Starry
 ili9882t
Date: Wed, 24 May 2023 15:44:55 +0800
Message-Id: <20230524074455.1172064-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
 <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STARRY ili9882t is a 10.51" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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

