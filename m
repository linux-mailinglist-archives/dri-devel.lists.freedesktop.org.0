Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C440182A85
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CF76EA46;
	Thu, 12 Mar 2020 08:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29C89D56
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 12:51:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so1972050wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7TEk00KRvrt3fqESY+Dr/uhZ8TDjILzLnA4sir1MLYk=;
 b=gT7A+bxiCh0yWVbJWXiDUKwtCeWGDafJ5mchK3a6+Goc5k1FbamDZ57ozfvwr/M8j4
 A4r864OherYK7wWqw0tR3tQaGRMkiShA1mgt2EFYAYz7iiDL4KGhgXuevS4Ea7lOky/K
 h3RVntwIqgeaxJYgcsgaORFKlV1/6W3tY43Ly0zRg978gFxqTvMrx0/gZQ/h+wyKbx2J
 heaSSXGQ3w6YJGElmryIF8beBobOItlQNGx2z10Vrae7Iov/sCgPWFu/3hFmEAoWY8sO
 yL3Lzz18MUdIk2/oCd/MVCn3/7mBvNWlrbgR/pQFyLBwOoi+Zvpbkk4PNuQx/12+ORf4
 0KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7TEk00KRvrt3fqESY+Dr/uhZ8TDjILzLnA4sir1MLYk=;
 b=gyWQvwydwqPUaeGjTckRvU4xQApKbAydgkCDWqyclFfveHFyVrxFgO2ia/7RIUkHhh
 HTUpnzNzM84xvAZYPXlkwHjj+yLNhMa7Jif+smtZGeXjQY0lSta2xgjH2zRX4WNr50c0
 ULzCXkDUTC8Xjss3D2m82IoFmWY6WKLJUsHdlAU6vVc1F4hqXP1X3ILR41p3ptQ8R9XW
 m5Gm6usAcoDyRtFVuQB1yODNPdJWUbWZMoE+pjNNYY4o5ap9ULbpUdth6gBxWLU0Smbs
 HQ23ldiazN9u12uehcKKd8tS6sqNpg86xCepChB/QokKnRzN4gSHuipm+20UXLVswJvj
 rCkg==
X-Gm-Message-State: ANhLgQ1M1AU1Pe76Wc88SKW12oheE0jnQMa9DSVSpDh9vyGjbnTsII5+
 d/SYOHuYoHaVGddfC2NYctrAaQ==
X-Google-Smtp-Source: ADFU+vulHpARqePVWhIZW1U/urxTnIw/zeRXfvdwAMhWGWKcYtaPGBAL3+zQX9ckUN8yquvV06X5Bg==
X-Received: by 2002:a1c:59c6:: with SMTP id n189mr3614794wmb.178.1583931103706; 
 Wed, 11 Mar 2020 05:51:43 -0700 (PDT)
Received: from robin.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm8843538wme.36.2020.03.11.05.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 05:51:43 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com
Subject: [PATCH v2 1/4] dt-bindings: add ITE vendor
Date: Wed, 11 Mar 2020 13:51:32 +0100
Message-Id: <20200311125135.30832-2-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311125135.30832-1-ple@baylibre.com>
References: <20200311125135.30832-1-ple@baylibre.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
 heiko.stuebner@theobroma-systems.com, Jonathan.Cameron@huawei.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
 mchehab+samsung@kernel.org, andriy.shevchenko@linux.intel.com,
 sam@ravnborg.org, davem@davemloft.net, icenowy@aosc.io
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add ITE Tech Inc. prefix "ite" in vendor-prefixes. More information on:
http://www.ite.com.tw/

Signed-off-by: Phong LE <ple@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a2da166df1bc..c2fb444e1900 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -475,6 +475,8 @@ patternProperties:
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
