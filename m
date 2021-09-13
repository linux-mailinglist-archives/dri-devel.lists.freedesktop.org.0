Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FA24089B3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0276E162;
	Mon, 13 Sep 2021 10:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9726E165
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:59:49 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id 5so5532943plo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PU6rpzmAIF3MmTwuCR+v+KeUhrwSAWjubDLHIrtCxY=;
 b=Ss+BIxCkMQlL1cgr7i1797ijRqMGE1AOCv2s9LJHpFO7W6Zmcy4yh0ufxohK3IKZqW
 rxCCqepgePJILA3Dw5lwGHVZxqJmTxqIrrxOJ/Xv6vlbKuTrihPclRmhtqu/FINNZDOU
 kAbkWcPRRCMqYwwqRs1e5nseq5+HdwGPUTAvyeSOLKtpP3ImSRxtkWDz2B1Z2mGC7h1c
 fhC+MkuqiFSOoebYUs3Snf3fPKpm2RiziCajYz9bMhC5fR4R7vtGPlYNhwx+TN++f8hf
 ytXoxX0pj1srlNA0tJcFf3jXQtfwVGm4AuuO83P8MRL9dXEo3zLs0oCcqxdK9hdYe0dh
 48sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PU6rpzmAIF3MmTwuCR+v+KeUhrwSAWjubDLHIrtCxY=;
 b=LGydpHPLN1owXzvlFeIRrAaBZ37+t0AHZi6GzHaVW6HPQJMdMkB4nBEaxqCmjE7+tC
 77OI6iRkEUIf10aNOdGBLnkuB0ESV37Hx4NuiGphXwIbLAmtF7L9LQUIP5kXCInYG/MG
 G52GB++CyYOuHbifGp6huqUIJGJMGBcPDxDceJhAHR5raZdRMeGLXQzhCllpla0/WTNi
 1fC0yBOFij5k70/5z6AweI8K6PoQ87TXs6omyuEC7djum0w+TxhiwWdqwx3hDoIFhnjb
 vLQiW8MLwchL3NSzW1aHR3T7J8w0aoeNs50CDX1Uu1n1YOF7iVG7T3P7TvYwgHUHaFXM
 Q9Zw==
X-Gm-Message-State: AOAM532hHP0CIyd16y7QqODh7toRtpO0MIX2DE8lF583IZR+aLcczcY6
 ZanHKknCAtoHSIV0XxvDJcAO9g==
X-Google-Smtp-Source: ABdhPJzoG/wn03SrwPzbDGmAr3qausM37Tz+CqGb4to6LPLxMAmkbVUxFUD+RaSCbo/4xnujDcSVSQ==
X-Received: by 2002:a17:902:bb0f:b0:13a:5359:d566 with SMTP id
 im15-20020a170902bb0f00b0013a5359d566mr9868190plb.60.1631530788873; 
 Mon, 13 Sep 2021 03:59:48 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id l22sm8279641pgo.45.2021.09.13.03.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:59:48 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [v5 4/5] dt-bindings: boe,
 tv101wum-n16: Add compatible for boe tv110c9m-ll3 and inx hj110iz-01a
Date: Mon, 13 Sep 2021 18:59:19 +0800
Message-Id: <20210913105920.3719525-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
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

