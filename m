Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDADF16F92D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598BE6E22A;
	Wed, 26 Feb 2020 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAA56E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 08:10:45 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id j7so994430plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 00:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEnVySXBYfW3b1su9MemqgqPSinDbCdHAw5n+ZVHXKA=;
 b=ZqFr2XdedoNMMzSdc2eWipJbPoWCSoIWOaxz1zsBu+w5FRw0nlJVp7B9aMcVR/ECrM
 fWpYYrpUhtSvO1rGsvHH3i7x8JxpD2QgM4DK0weubmj2twGyNSOa9Gvtg6KWDj0oARIV
 ossJG+QlPSs1QhoRE2faVAv1lrRd7/LwUBqX6m+LwRkGl9SmUJ5qeccTbXxGKO/jke+J
 hejsi+GJu4wBCG1LLI2Rb9i3hLwtSZ88dY/P2BygJXrOuCX1Xh6+4AO3P044cgvoby3X
 oVgYppEgNor2/7HskWoAIOtOe2teNJqCPhYgfnRcBTVY+U0Ce7WQEZmjOKtWi3whIYeH
 uQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEnVySXBYfW3b1su9MemqgqPSinDbCdHAw5n+ZVHXKA=;
 b=ZL5Beqa9D0UEBWekqcwXF5sVnT0MA54gnBaG9rrhhS3wpLxg1gWrqXAbXqFkixPoPr
 oyZ23DKtY6qW52kYvhLFhlHJOHxnJKGe5qulLSwdNetKrXGM1+GNR5P1XfeSlx+V/D8P
 U1S/yIzsMdDXaOx8nvOmpyaszr6vBrh+V/RbsZjR78EK+jdIvbDpvOQoBCHH+R9nk45P
 wE6seVY1yvH/nGWZJ9JMAn2H04sfnFm2e44w2w0j4Oz//D/DwYZuTxgt9R9XT1CrOcl2
 gmfqpuWDw9/I7LD/2Q4JRtopuwbtes4C5dcTwQzsoBwn/CrGSkDaQNSgrLwpyV9usnu4
 yJew==
X-Gm-Message-State: APjAAAWjkWqB7LpsJEXd2LkQrSspamCVW1XoF06yHj990cHoRXP0oBaM
 bcCkLVPkxrqRLO80SZ4x7RU=
X-Google-Smtp-Source: APXvYqySsTMpSDO1lKEob5Z3qPaMibUnculbDtGi+2b/LHKNJPcUDEb49L+OdYHplPurgC0YCZJGNA==
X-Received: by 2002:a17:90a:32e4:: with SMTP id
 l91mr3675046pjb.23.1582704645464; 
 Wed, 26 Feb 2020 00:10:45 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id v7sm1679230pfn.61.2020.02.26.00.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 00:10:44 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Torsten Duwe <duwe@suse.de>, Icenowy Zheng <icenowy@aosc.io>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/6] dt-bindings: Add Guangdong Neweast Optoelectronics CO.
 LTD vendor prefix
Date: Wed, 26 Feb 2020 00:10:08 -0800
Message-Id: <20200226081011.1347245-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226081011.1347245-1-anarsoul@gmail.com>
References: <20200226081011.1347245-1-anarsoul@gmail.com>
MIME-Version: 1.0
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor prefix for Guangdong Neweast Optoelectronics CO. LTD

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6456a6dfd83d..5dfbad67aa81 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -661,6 +661,8 @@ patternProperties:
     description: Netron DY
   "^netxeon,.*":
     description: Shenzhen Netxeon Technology CO., LTD
+  "^neweast,.*":
+    description: Guangdong Neweast Optoelectronics CO., LTD
   "^nexbox,.*":
     description: Nexbox
   "^nextthing,.*":
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
