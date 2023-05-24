Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1070EFC1
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4CC10E58A;
	Wed, 24 May 2023 07:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4EA10E583
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:45:08 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64d30ab1ef2so429071b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684914307; x=1687506307; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XcvZIGJdFMrCWPf6vbR4FP3VGTx+Sg81oee61Qyy4FY=;
 b=a6ymZgcQ68mWVErWlm3JSIwEUV4yrM9n4Oyt1TNQHZZXikodQmdoIC/fYxMWFYI9ti
 Sc50MNeIbHjvX/Tsy8AZe1RXOILO+LAYIkT6oQIaRmIGwtQaZTQUGSiphIQpetl68tGZ
 1F3T0zntb+BQ6FE82KoNFDZdG0OMoweo9xHit/m28dnmQbVJ21Go03e5GWTXspGSVhCG
 WfwgHWV3uBuYj8/B8Cl1Utb99LHBc3/QO3iHBPyXUfCbUCX2Vmrj+XPb8zwWYu/5WLFS
 e7UJEJytrpvxLYInjo7ddZpvRGdDiGALfniwkszUIM/fR+T5Rw+Elk2GEIhcCRisu9n2
 p5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684914307; x=1687506307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XcvZIGJdFMrCWPf6vbR4FP3VGTx+Sg81oee61Qyy4FY=;
 b=G4qPQKHBHeop+O5ELP5WsYZ6+Cz6u9Pe4E47T9w+9UBfnhkf/no4gizb+1VDatPe57
 I9vLkOmZid8rHPjdZ4KUQpP1+PFckDcislKCfvBJ54OBJGFQYIICeN+nq3TgAgAdn1B0
 +Skt7FJaqvQ2+B8XGJXbVZrE70FjSe3nGTocqFS3hsbrQMYBlDVlo7p1J5iZHzjCptSD
 YXtnCDfHXkumX2y14XShhXObXRSEoEiZNRpYc60CkpF2rtmEVLo0zbc0edqmYaYDEPmJ
 JliVKDISp9x/449Uspx6Op8GuLcq3CihTHIgvbWC+KHmpNjr/i9TV5lETbqDyPIHcYCs
 tOuA==
X-Gm-Message-State: AC+VfDx+SQy+pDsNIcMkguggEi/RpOyZUzX7lSQLOT/pp//evm5VJc1I
 FgpV2SLfJv3ZHkxwW6EeM29oqA==
X-Google-Smtp-Source: ACHHUZ6k+sUhyKEZAV3qBA7O7TPMGVoC2tx9dOmF1yFyZ9sAvW1pFXnSidJsHEO5fgbQBrlW/ZP9yg==
X-Received: by 2002:a05:6a21:329a:b0:10b:4f58:3fef with SMTP id
 yt26-20020a056a21329a00b0010b4f583fefmr11847954pzb.2.1684914307412; 
 Wed, 24 May 2023 00:45:07 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a62e906000000b0063d29df1589sm6801336pfh.136.2023.05.24.00.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 00:45:06 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Subject: [v2 2/4] dt-bindings: display: panel: Add compatible for Starry
 himax83102-j02
Date: Wed, 24 May 2023 15:44:53 +0800
Message-Id: <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
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

The STARRY himax83102-j02 is a 10.51" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index aed55608ebf6..28a7beeb8f92 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -32,6 +32,8 @@ properties:
       - innolux,hj110iz-01a
         # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
       - starry,2081101qfh032011-53g
+        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
+      - starry,himax83102-j02
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

