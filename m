Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E795185CC3
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CB96E14A;
	Sun, 15 Mar 2020 13:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC916E14A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so15631413ljh.5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y6y7w72g+Cq8oT80ntLwf96HEc6G6Y/Vju8nRGzAuEo=;
 b=ANUSW+3u+SuGM9UXV2es/7MT1Uc3BwyOEFlsaTmK0WjPxTWX27uNcG2u+f4p0IMoad
 ByjwGbbn8Ri2aWCgsEhBQWTlDMcEL7ahdpiIhI5b0ts5o+2ZhMFA/H7k173B9CIrmu1n
 1DoTctjSo+exg0MsWYC3JV+kNhoqIqiiN4uwsqw8WnzswkwozsyYtUdnCBdzFpp65c7m
 iL6ip9Ig/XdpcA2YDbdh+mpMNZs8/21j+G7hsYpXbIJDeh6G3Pzy64G9DFUigs/Okxuj
 1zKTH/sYLC9BO2f1nO3OO2puydjXvoSrq3d5UsE5GmGE3S+aZGXj2wu9H7UTbkMdAx3d
 M/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y6y7w72g+Cq8oT80ntLwf96HEc6G6Y/Vju8nRGzAuEo=;
 b=U00rOmpSx6X5tYBDpCpGfcRm1eGgYzaT2jsTtkmI6sRJJDTiE2qL4FFsUEBXQ0mTQV
 mlTb5yXc+WJ5K0LFugZVySOIofJSpYWz+w545wcQCSIKidVx09pnFK8NV4q+FC29zoyI
 YurO9N6VF6Ox0jnXK9aHDiY53G1SOfX3wfTM89X1kuf7PowgBp9pWott+6L8c7eK5naI
 naSbxIjmG8JPPIgUnE1IhfVzPm1kGR6DzOuyyoYzpzJpBSAWnMdpZwfXf3WdsPYNyS4z
 0Wo1B1s/uJeXyiY8kxoPfbmIIsA6PvQOvQfLjjDoZakhGB4dgcEOP6Ko3rh10JOFUTTi
 mPHw==
X-Gm-Message-State: ANhLgQ3gVZY+fn9QTKGEiRlHmiedx1bf+gfIrUOTxFiTIguFZXVffVSl
 1smJDSL3J77e5UaqA8fs9T3gesG352c=
X-Google-Smtp-Source: ADFU+vv5S65a34d23EanLaBzQqCrNpHn3Xas3yN5pTWxPkEHw7rVyOFZnlfIzuRStDhvy79YdRAEPA==
X-Received: by 2002:a2e:730b:: with SMTP id o11mr13381783ljc.228.1584279870867; 
 Sun, 15 Mar 2020 06:44:30 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 01/36] dt-bindings: display: add te-gpios to panel-common
Date: Sun, 15 Mar 2020 14:43:41 +0100
Message-Id: <20200315134416.16527-2-sam@ravnborg.org>
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

Several bindings specifies a "te-gpios" for tearing effect signal.
Add this to panel-common so we have a shared definition.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-common.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ed051ba12084..463bc06bd538 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -124,6 +124,13 @@ properties:
       while active. Active high reset signals can be supported by inverting the
       GPIO specifier polarity flag.
 
+  te-gpios:
+    maxItems: 1
+    description:
+      GPIO spec for the tearing effect synchronization signal.
+      The tearing effect signal is active high. Active low signals can be
+      supported by inverting the GPIO specifier polarity flag.
+
   # Power
   power-supply:
     description:
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
