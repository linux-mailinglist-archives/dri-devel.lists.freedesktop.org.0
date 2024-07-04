Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B4192709C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7DC10E9FC;
	Thu,  4 Jul 2024 07:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Zl8kDZEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1D310E9FA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 07:30:34 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7034d975f18so11310a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720078233; x=1720683033; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gez+/xg5x89cHTUJX/6pSwjlIxkC+n3eo9Js8x2Grp8=;
 b=Zl8kDZEkRHoSe6T7F6z9NV900gysqOzMk+IGgNPrYYL0GoHrSU8+Sn2i0J0BKbu4y9
 EQDZeWCGnhgaeoMw4kQyv/75in4blVrd+H/7v0X+a0wiZEK30trkl9Yq3bqSXZOxdSYy
 HN8MUvoz2Rl7JOjAKKwMLINtCzg5sCkAQCuKpgs4cRuQBcAw2vIqYYV50tkm53i3bsOj
 lvd4yGTjUFI+HpZ9WejO0b/2jFlVHJs6BOavZn3pguEhMA1KNYpcHThHGul21J/NOjLK
 s/PXyfksVumnqMveg9+4t0EMnQzclRyjkIzs03grsEb0kRO8I3x2Q8lNEDGfb+EHRH5l
 pvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720078233; x=1720683033;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gez+/xg5x89cHTUJX/6pSwjlIxkC+n3eo9Js8x2Grp8=;
 b=OrXQrfy79Mmb07Jc6pYngzdSugORYvILa57kGcDBJp+mHTQHlSzMoMTwljT6z8QsdB
 RBCy0SCf01fTZWqaDmm7slOuj+uxUHMBZ44ZhcWvLCIFaxpTLNkYHYb4c8LNi7qiC6GC
 JoFNhrYEkBs8uopF5z0k/2AsnFPt+e34pFH1w7zrVDI4nljJCCTReDDG5Xh4+oVCCjIv
 gJKn9I6H+RJkViv4A/coFO8f2rQ0VS6vIMHvHum+vlP1XJUJl54NmcmkPxLdMyRIyl/D
 kiSwXZbxdMKYJPCZvL6f8vH9gMdEpruQAczqYqz6sWGv/jrtswzJJAthmrADj3jM70sr
 s5cg==
X-Gm-Message-State: AOJu0YyNpQ7yBFQ4e/MIESlqhKiSW4uc3bKksyToaORtp8ErjOaebtRN
 3v6ouNasNWpHw76ma6FnjNDxz+vUTj19g8bKmyH8wF1W0k+QmERbbp2Y5C56wCw=
X-Google-Smtp-Source: AGHT+IE9oc9mef5bJzitlz52gI6K7JpWaoYTJglYjkfbp+OKpC6f75RXlbWHBIi2Dk2L4x950xIz1A==
X-Received: by 2002:a9d:3e02:0:b0:700:d550:5c50 with SMTP id
 46e09a7af769-7034a7f79e6mr809555a34.24.1720078233014; 
 Thu, 04 Jul 2024 00:30:33 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6a8dbb2fsm7735699a12.31.2024.07.04.00.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 00:30:32 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 4/5] dt-bindings: display: panel: Add compatible for
 starry-er88577
Date: Thu,  4 Jul 2024 15:29:57 +0800
Message-Id: <20240704072958.27876-5-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The starry-er88577 is a 10.1" WXGA TFT-LCD panel. Hence, we 
add a new compatible with panel specific config.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V5 and V4:
-  1. We are compatible with starry-er88577 panels in the boe-th101mb31ig002
-     driver, so add it to the "boe,th101mb31ig002-28a.yaml".

v4: https://lore.kernel.org/all/20240620115245.31540-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
-  1. Move positions to keep the list sorted.

v3: https://lore.kernel.org/all/20240614145609.25432-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1. Separate the Starry bindings from kingdisplay, and add it to panel-simple-dsi.yaml

v2: https://lore.kernel.org/all/20240601084528.22502-4-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1. Add compatible for Starry er88577 in Kingdisplay kd101ne3 dt-bindings.
---
 .../bindings/display/panel/boe,th101mb31ig002-28a.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
index 32df26cbfeed..2f251703a121 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-28a.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
         # BOE TH101MB31IG002-28A 10.1" WXGA TFT LCD panel
       - boe,th101mb31ig002-28a
+        # The Starry-er88577 is a 10.1" WXGA TFT-LCD panel
+      - starry,er88577
 
   reg: true
   backlight: true
-- 
2.17.1

