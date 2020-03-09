Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F9617F1A4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3696E82E;
	Tue, 10 Mar 2020 08:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490FE6E484
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 15:37:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z15so11805105wrl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JO9jA4wej8z6bMbXqjXhIPH6eryZ9XPj06LBS6ZMiaw=;
 b=SJyQyDq1UM/YXSj13kwT6lG3Cw4qlRKIIB5rVBJQJZBk66vcCUV43NSa0mQw998LTW
 3/yFd0eYGzErGlIbsW3W1BRwI5uTvEGf0wVteh1+TzxEoL+XpKlX8K+6pypcRVsR30Bs
 APf3RYYMZMy3KreQjXA+BpkUnieIhrg1+cbQzQMnyXwyhmS0hbnr7vAadq9J9LLeulbF
 JijmXbof3bIN5Ydd/ZME4reRqI8PSgqCzUkYj+sU5eSX9QBt/zF3GMXPIyEfbr8mq29Q
 zfVE+ec/ZTUNt5yL425PhSOe0rAHG1ud7c4iHbbfJ1t8m5An1wGnoyUfyiDXrML+xAnz
 YYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JO9jA4wej8z6bMbXqjXhIPH6eryZ9XPj06LBS6ZMiaw=;
 b=rX7flGNLiEyx3ws6LCjNpEBN7wGG0ekwwmVR8szrKC13NmEcjVxTGqjpMxIYLzT59s
 F1u/KLKExzxaAupZwhC3TzthYOaa+6/tLbZkrof9gB0EUGla2HAn7GwsAbsi44W2I64k
 P4GC7H31Ut7mLE/7Ft6cVGaUen2UI/4drVKExAs9QojM8iB6XbMEoU6aHT7dNTbziN4i
 81ym77ruvB9wxAIBlYcx6Pd6p7d2XFD+Eq1sNe7RvGsyDkK19O64rt9lOSzbfZCdycv9
 3Jsg0CLcQzBLciKe5Vd5rtHU15W3KfBxLU+1EnGkhI0a6cbtqimo0F4I7SMU+79kfxUv
 5DZw==
X-Gm-Message-State: ANhLgQ2CGYoJxt9fwAKsmF/lNTyRMl9nwrpZSi+LgwEawzVn7M8tcCjX
 tFwLWKVwpMnL0D6e156p5JrJYA==
X-Google-Smtp-Source: ADFU+vu7wtHOwNH6jHCcBKAE2TrwI+DBD+gaVAejfY4fo+ZZNqs7U5/kBjDVupFE9ZhVLQNelfT7Og==
X-Received: by 2002:a5d:6150:: with SMTP id y16mr18425625wrt.352.1583768222000; 
 Mon, 09 Mar 2020 08:37:02 -0700 (PDT)
Received: from localhost.localdomain (232.240.140.77.rev.sfr.net.
 [77.140.240.232])
 by smtp.gmail.com with ESMTPSA id h17sm63426792wro.52.2020.03.09.08.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 08:37:01 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com
Subject: [PATCH 1/3] dt-bindings: add ITE vendor
Date: Mon,  9 Mar 2020 16:36:52 +0100
Message-Id: <20200309153654.11481-2-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309153654.11481-1-ple@baylibre.com>
References: <20200309153654.11481-1-ple@baylibre.com>
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, stephan@gerhold.net, jonas@kwiboo.se,
 heiko.stuebner@theobroma-systems.com, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add ITE Tech Inc. prefix "ite" in vendor-prefixes

Signed-off-by: Phong LE <ple@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..16d4c776fdc7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -469,6 +469,8 @@ patternProperties:
     description: Intersil
   "^issi,.*":
     description: Integrated Silicon Solutions Inc.
+  "^ite,.*":
+    description: ITE Tech Inc.
   "^itead,.*":
     description: ITEAD Intelligent Systems Co.Ltd
   "^iwave,.*":
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
