Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AAC3F9603
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67646E0E1;
	Fri, 27 Aug 2021 08:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A294F6E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:24:38 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id x16so1825528pll.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLsLHxbd3S4fLhjqH4jOQcn0e2LX+uyZe1sVTwZGed0=;
 b=kWMrAoKSV+P98zUQj80khcge2kuQuZ9TplBLiiFuxmahSR3sar03XWITz8IRu5NlEg
 2yPEqDlAg4xU40qPy7BDI2010AjkKoZvuMJfDB5Q0PitN31kZ08/08aw/RPCq+LMzIfT
 wdYmCh0Jjg/HmjIbYuUcx5ndcDqUE6vPauBi3jJk6c0l09JDWH7Oh10Hlebi7Urbv/0a
 DedX27D+K2EmKs9LS8TrjNr57xqLpXM7+e8D2SVH0dh5FGb9ujAqABq937MG+s0yv3uH
 to/zh+xcZC0vexcpm3iAyD4E6GHiRLdVB9DzUMTPpSxGrM81H6qogMJ3qZsvhgwEZV8e
 zG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLsLHxbd3S4fLhjqH4jOQcn0e2LX+uyZe1sVTwZGed0=;
 b=T02N6weXswXouRZX6ugMYdJWg0cbDR1FIdKbJypsYAy3otZ66T4YX4oDtlf/bz+U3O
 TncqeAXpR7GJSHlbAcO9BzcGmgY4HTDKgky5US0lkBFGryA2MXGCvKLCjCaK/Ve8DE8r
 KKBixwV/nhltI60oasZJghBx2PhAMmLUS82tM3MTWNplgAUKKc/OhJ2mh+b+k8+jlkIW
 PufOp3rf4YiF8X7rqevSbNydSsFkEvEgjUADIw2qsArqCY3Een7caxDclDZsDV233GZx
 SNUc5CNX6sNNEXRe32ghcjVKHhIY4emNZJ1TTBvMMOBN5iEBUJ7lwL6+AZ6RRAWeiw4c
 fLMw==
X-Gm-Message-State: AOAM533l9uGmRA7Z037ajNTU99dsBTE8DJr2a69DHTxXDiAH3mJ7F01V
 cvbDt6ZxtBTv8SdU1Xioyuc+bTboq+dKBPJC
X-Google-Smtp-Source: ABdhPJyFwInI9upXRx4q+KT8Bp36P/OXbwoFTTpiMb9TyNAh25Zf/DLxOU3ql5iXB18AsaHtfmLj+A==
X-Received: by 2002:a17:902:ba81:b0:132:3a70:c16 with SMTP id
 k1-20020a170902ba8100b001323a700c16mr7538652pls.60.1630052678314; 
 Fri, 27 Aug 2021 01:24:38 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id m18sm5391371pjq.32.2021.08.27.01.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 01:24:38 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v3 4/4] dt-bindngs: display: panel: Add BOE and INX panel bindings
Date: Fri, 27 Aug 2021 16:24:07 +0800
Message-Id: <20210827082407.101053-5-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
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

Add documentation for boe tv110c9m-ll3, inx hj110iz-01a panel.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
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

