Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9916594D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492E489168;
	Thu, 20 Feb 2020 08:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27CF89B12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:35:56 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id q39so585219pjc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6yNbKzpeTLMCoypRqoVy0w4NUhztDzPf4ESyfJztWiY=;
 b=Xs6bb2CzAuqxLioQuMk3z0BoJURSkm/VFyMgk9MekRXbneDMAJLoLqZESX5gWejMsr
 Cu7uvtcGmvwcOVjgLW4vs2M/GRrVL+l7AfAYWZ/0Xpni1Z+vJn5DH72vdIhcfRiv98CM
 a0CUL5GVb9Mi1Ef9jPNFdQY7D5wyTTq0Ac42FR4kmum21oWkHRf4YVMGzG7T6ul1IEqW
 ZvKcVueUE7XXr7/C5jY6QTZZEBHSEw7TUfxdKoNmytHRRWBfGSmb/wUrF9hMiFY5fzBH
 Gcr++v6mKxXTsQ4RW6kPbt0XoggG3huxZOk6c/KuE/jt3PawEPB26YBYomLeWiw0zIdw
 ghAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6yNbKzpeTLMCoypRqoVy0w4NUhztDzPf4ESyfJztWiY=;
 b=RMF5Xg4gvmk9gxQ5OSWVRpc1QyBMgmqIoLc7eSUVnKBpTbIbvq8FIpYJeWnjOguEQu
 Ho9sO/N0bSER0O7yKqFQmxnwbktZ2wphujAN4NqVkOQIp0HDE0V4N8PxJCFTImvhx7QM
 hEx8ZSartqGK7mnAgcC5LahEBnFhUc4btt+bxpAXNPXJBrzloOh9zGMNw4k1os5g17Zs
 0rAcvS5DLvYYda/lR2TSCNJpttTwO7HCLwKFXWVUPPo7iGdpK+j9wiAib8/R4M6EhyaF
 5EfaAYFOb8aNKCZ8Wev/Jx0PWPmQh/onS1EZpltTTgqeEFumrDOna2M0y/mJQ39riAYt
 AQAA==
X-Gm-Message-State: APjAAAUA0kvPiAHouQs8noxVRpmgtSpeu3fGW0ijYLiB6EPTZ0pa2dVw
 AdhD+rl+xBETRKFSX7+qCBA=
X-Google-Smtp-Source: APXvYqwKXY5bZ3GJFQYNZpSue+9Mt0J+NmUuqTaB2YessGYgmYwqmvpscnAZijk3U3VpNUJFWCzGNw==
X-Received: by 2002:a17:90a:ba91:: with SMTP id
 t17mr2349862pjr.74.1582187756393; 
 Thu, 20 Feb 2020 00:35:56 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id l13sm2319038pjq.23.2020.02.20.00.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:35:55 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Icenowy Zheng <icenowy@aosc.io>, Torsten Duwe <duwe@suse.de>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] dt-bindings: Add Guangdong Neweast Optoelectronics CO.
 LTD vendor prefix
Date: Thu, 20 Feb 2020 00:35:05 -0800
Message-Id: <20200220083508.792071-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220083508.792071-1-anarsoul@gmail.com>
References: <20200220083508.792071-1-anarsoul@gmail.com>
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
index 6456a6dfd83d..a390a793422b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -665,6 +665,8 @@ patternProperties:
     description: Nexbox
   "^nextthing,.*":
     description: Next Thing Co.
+  "^neweast,.*":
+    description: Guangdong Neweast Optoelectronics CO., LT
   "^newhaven,.*":
     description: Newhaven Display International
   "^ni,.*":
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
