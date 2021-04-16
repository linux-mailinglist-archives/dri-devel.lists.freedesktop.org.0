Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F4362B45
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B466E1D2;
	Fri, 16 Apr 2021 22:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECC56E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:40:56 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id z16so20129390pga.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvcTL0RsbG+N8ibrkzli2K1A+rE+ZrcYjKP9wz2z40I=;
 b=AufOpWxiDS8cPPrP7xzjOHsIoN36eKpOCxEXl12PAo2J/qdSsF4bqxhnWAoHrmPdgi
 jdSwBdRJc9Q5vDcJV0vvreL74oFh6+Anm/o8pvPb8DW+i5Aelp9ZDP1HNTZ0Rp2OrdyZ
 XPBg766uOfY2dHhRsLvb38FAjAcOn8oh7WNLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvcTL0RsbG+N8ibrkzli2K1A+rE+ZrcYjKP9wz2z40I=;
 b=oHTe8FZx19SBVixGf45iylqbvHz4hW4skjMi3QPkmJZZHm4B+A9Teo6vIB2aYeTzno
 p/ge4nfPNnfxQ1ZaspTSDa8u5WQjyanxes6BMBH/nW7QhnWZwCeT4GIxHlpqnfvq+SK3
 WnDiuhUlO/n6KJe5ILqSuET8FDILzi35R7Jh51mwYQ1p2UKtNndwKgaBPF187IStXFRQ
 YL5PoajdB42+vGQIPVzn41j9LZVuGnw371UKSp1hoJ2V59FUdFGkjFoZH+8OowhUrINq
 MORATdPUqvF5CduHCFZYomBtk6TB9xZ9k0iB/v3u4YFQ9cIgkoxSkxQdymAErRuxGeS5
 NpGg==
X-Gm-Message-State: AOAM5327B3aYR7RW/PF84D5O65pmz2fT3OULSjNH/ink7A09+QVyFoxN
 2OjLakSzyFNFBWG/Ih/2PD0/cg==
X-Google-Smtp-Source: ABdhPJzNUiYzRYYbvZn//8wjS/CeqlBImBF5oNQlkkD5V/lJHOiw3ppDJgVHdWGhvCqC6g4Hpy9jag==
X-Received: by 2002:aa7:9791:0:b029:25c:38de:aa6b with SMTP id
 o17-20020aa797910000b029025c38deaa6bmr522788pfp.19.1618612856582; 
 Fri, 16 Apr 2021 15:40:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:40:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 03/27] drm/bridge: ti-sn65dsi86: Remove incorrectly tagged
 kerneldoc comment
Date: Fri, 16 Apr 2021 15:39:26 -0700
Message-Id: <20210416153909.v4.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A random comment inside a function had "/**" in front of it. That
doesn't make sense. Remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 96fe8f2c0ea9..76f43af6735d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -788,7 +788,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	/* set dsi clk frequency value */
 	ti_sn_bridge_set_dsi_rate(pdata);
 
-	/**
+	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
 	 * this method is enabled by default. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
