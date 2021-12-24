Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B073747ED21
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BEC10E402;
	Fri, 24 Dec 2021 08:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C001610E3E9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 05:23:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bu9so16899665lfb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 21:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+A6R7NBtfUQnLlLDkSBl+KL94Li6QNQFhWmSmSRXFes=;
 b=T+j4o5YtE3hx3HWodazGWr+DMJhdsDMjBjNNr4kfrcKEjB/Y+DnF80FniEAppTSWJZ
 fI2O5+RlOFitBe88RtpukpDWl+6K/rT0/dD8YzPDqH8rooaogqsUe9CMFaDw771YLCSz
 5MzAlJGEHjfDMwMHb0/l82bvl5RXauwU9xBpmhdM4KXf+9A3lAYQIauW2QaZbEvl+Q0B
 4a0a98BtRewN1Zdzkp3Xk6Je0rFf//bGxe1b+wY0KpnxmwOY6LeetVrlPiuBj2tlgyqH
 BE1pWujq2lYxsZglorCeEMdwZHSC3rTvvC2IG5FHrRcPTeENjJV3XU+hlag1ZhIgD2CQ
 MtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+A6R7NBtfUQnLlLDkSBl+KL94Li6QNQFhWmSmSRXFes=;
 b=fiBOm8IAI+AV90B+bgXqik4SicBI6x3h82dwHfWpeS968QP7pY7WqphG3LdU4vNJpX
 a2VdHymi7qvRms73QLLizI2e50jMFZfa80MhiAY1a/TXzWEMyu4/eTn3MAFO8ovdO6UY
 +gT+575aTf3HiG5pfUULnekso4Xr98FSJ3OrfBtIN3nqwCG/3+m5pZmlcrS+SV+x795N
 5lq74hI9LsAY5aQbDARfg/jn9QSvJRbn829w9mSiCjJv3XnHMU3J5bny/fDtDYA/gKQQ
 ro2fE18WG7eR7y7rAXrhEjeZb6Ffl6RkiRniZw6BiPHQHuEX+V5yT9T75sOOe0ORedG2
 jPdA==
X-Gm-Message-State: AOAM531SGaX5FN9qpgNh7X9g8bvF4gh1UbLKMRGju190UTSbvRnF9KzF
 eWbqwSNBPzPPszldPQt/aYDfRA==
X-Google-Smtp-Source: ABdhPJw2hgZNyZhh1NpwjrhB8tKAf5hRDZK9f2T43eAkIbL4fGq35UrtZxCmRf3mIhJTxldmA6SbVQ==
X-Received: by 2002:a05:6512:10d3:: with SMTP id
 k19mr4010796lfg.448.1640323422107; 
 Thu, 23 Dec 2021 21:23:42 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id e13sm702858lfs.306.2021.12.23.21.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 21:23:41 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3] dt-bindings: display: bridge: renesas,
 lvds: Document r8a77961 bindings
Date: Fri, 24 Dec 2021 08:23:09 +0300
Message-Id: <20211224052309.1997096-4-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:14 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the R-Car M3-W+ (R8A77961) SoC in the R-Car LVDS encoder
bindings.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 .../devicetree/bindings/display/bridge/renesas,lvds.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index acfc327f70a7..ca5443e5c2e3 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -27,6 +27,7 @@ properties:
       - renesas,r8a7791-lvds # for R-Car M2-W compatible LVDS encoders
       - renesas,r8a7793-lvds # for R-Car M2-N compatible LVDS encoders
       - renesas,r8a7795-lvds # for R-Car H3 compatible LVDS encoders
+      - renesas,r8a77961-lvds # for R-Car M3-W+ compatible LVDS encoders
       - renesas,r8a7796-lvds # for R-Car M3-W compatible LVDS encoders
       - renesas,r8a77965-lvds # for R-Car M3-N compatible LVDS encoders
       - renesas,r8a77970-lvds # for R-Car V3M compatible LVDS encoders
-- 
2.30.2

