Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354C40A45D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 05:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC26E33F;
	Tue, 14 Sep 2021 03:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605426E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 03:23:25 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g14so10839565pfm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 20:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PU6rpzmAIF3MmTwuCR+v+KeUhrwSAWjubDLHIrtCxY=;
 b=wJQGT8RAjHG5DIUGjAhUK1TX7rW2wxQFdBzVd3921pRl8YzicvOtRBHVwshLYTwCec
 bVHXEhJvWK5ugGTUuU84mqOOi3iEvT9cktDvycj/YVHo8VpxC+MgjjovfuHaAjaJWckg
 oj4ad3sy1tkStkQOAPZN7SN6I3SXqSdSBFN7no0LFLFJNj06cS0ejfNTUbnVUxf0r/ln
 fg0ij5s63EXaeCgIr7B0fJwk94bxBNkNwbuTnCODvdD1FbHyPOGHe5UXzJNdSWz7OEtW
 EX76gpwpPq9ZdE6pq4MZJuqDJkOY1ZU1Oov8c8fTG3CqsJZemHhMGmm82VV8uUkrv18a
 QTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PU6rpzmAIF3MmTwuCR+v+KeUhrwSAWjubDLHIrtCxY=;
 b=6SlB69mUdMpQzJr/LY90s2C4+ecsPSZ5cZhl4zHRGlgisUM1ZEQN7QD/UaDWDMmv21
 rGvWxfR5ITfuK5diDvD/U9dgXcgVGhpiaGI+hUm892qa5t068eEt2xxsgqkjl8Uph5XX
 eWanfH3AzdSEY/5mToTAfOpLS3/TtH96Ttwkjx5KRHVtmoPB6IVHyAeop0niV4+bezwz
 zjKmSXDgbmwb/y4R2WlP/Ry3hr0JMtBPjtEBo38bjMgsTD2UrKMZXDLTE+AGrdJatxug
 lhsmsQ8QVs7GAHMY4bS6MxhpY92drBCWxuADQrJaGERjHY3UcobakyweVPI1suhkAQkA
 1mcg==
X-Gm-Message-State: AOAM532ylTSETZk4sEP/ChWYjLcWPnB5h+pGhQRGB0/aztHegxoFJyIO
 RcTg7N9SG1kAlocleLhG96ufdA==
X-Google-Smtp-Source: ABdhPJyVQDJrNV7MinubH+RyBfDVNPkJneyQGBSgzJBc7N1wfYKan9qqxLoqqYx6l1M4/ugaPPWWqA==
X-Received: by 2002:a65:6398:: with SMTP id h24mr13594046pgv.367.1631589804965; 
 Mon, 13 Sep 2021 20:23:24 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id x15sm9354101pgt.34.2021.09.13.20.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 20:23:24 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [v6 4/4] dt-bindings: boe,
 tv101wum-n16: Add compatible for boe tv110c9m-ll3 and inx hj110iz-01a
Date: Tue, 14 Sep 2021 11:22:52 +0800
Message-Id: <20210914032252.3770756-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings documentation for boe tv110c9m-ll3, inx hj110iz-01a panel.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index a7091ae0f791..45bd82931805 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -26,6 +26,10 @@ properties:
       - auo,b101uan08.3
         # BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel
       - boe,tv105wum-nw0
+        # BOE TV110C9M-LL3 10.95" WUXGA TFT LCD panel
+      - boe,tv110c9m-ll3
+        # INX HJ110IZ-01A 10.95" WUXGA TFT LCD panel
+      - inx,hj110iz-01a
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

