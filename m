Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A968185D1B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F476E1D2;
	Sun, 15 Mar 2020 13:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBA96E1CD
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f10so15604667ljn.6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6D6qYDVAoDX49O3pqM7t4Fg8LndWENhGAQHVsmY5Z5o=;
 b=Z3lR7wSu95RLPE8X/9z5nbJdYyfKLoqS9TzFiG+Q+tfPehq1P95WyiAlxeU1Nwapxc
 H9CqELCn6hZRSwR74G/qaLM0VjUFPnUq8J8p59WoRsAxYsp8ucqBBfWJaLvl5gcklSR9
 dkH+IkaqkbPBpk9p7ss3gT5eB0IoTUA53nLbo+dv3ZEidt+wDUquCo64Gpsv21lP8R/H
 Bie6HSoex0YSrJldtxZS1RXWaORFX473B99nyzSRDaEKHTpmeY66phILlVWYBHcDSXTq
 lAq6gk1KpbeBHRuNnxGe++oP5rt9a4sEy3Xt7WUU02by3ECEEEyZtRQnCMunLmvFZzzu
 CUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6D6qYDVAoDX49O3pqM7t4Fg8LndWENhGAQHVsmY5Z5o=;
 b=rkuobUXG16dFNb7Pnk7x2XcGAxtxKDccldd84Ben+Vf45lTWs23FIuSy1T3PdWKDl1
 UxdvO1vd7dyQvUIRrnvGu3ilq2kvucnCGKp7ZHjM78iSv9BHVxIUO4Z4T471qd74Eo3t
 AdIvCO317sYIpxbrl4qn/NC8MLD6wKhZQAco6j/jCi9GzMUZOS06q5LImeVpgkTMA9lt
 slLpzMnJLIHDJPQVjX8YtJ/r4q4encFbP6GWsUhhbYn3Ruf1DAGlO/kFMMRvbQGLbOFN
 3nC1W3+7dtXywxu3PT2oFq43QLe7NpAtGgoc6uXIcopHoBWyoXLnEoq6dFC9AGldVtNA
 lBDw==
X-Gm-Message-State: ANhLgQ275NFqQeyU+r0zSMQrCgG9cZrXsLSsFJ1vg4V6u3Y2H8CgIcmA
 MrG69tzIQjfWSLchww/OiaNmeNbTwmE=
X-Google-Smtp-Source: ADFU+vtooqsG2bH83FWIuLOJneXqDQ/gelH/BnjWZx7/xYxCAc4rrgoy5QfSuinhYEu3uCPsVtj9nA==
X-Received: by 2002:a2e:b00c:: with SMTP id y12mr12528704ljk.167.1584279928664; 
 Sun, 15 Mar 2020 06:45:28 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 29/36] dt-bindings: display: drop unused simple-panel.txt
Date: Sun, 15 Mar 2020 14:44:09 +0100
Message-Id: <20200315134416.16527-30-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no more references to simple-panel.txt.
Delete it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/devicetree/bindings/display/panel/simple-panel.txt | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/simple-panel.txt

diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
deleted file mode 100644
index e11208fb7da8..000000000000
--- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
+++ /dev/null
@@ -1 +0,0 @@
-See panel-common.yaml in this directory.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
