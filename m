Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416A35310A
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F8B6F395;
	Fri,  2 Apr 2021 22:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452B16F395
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:30 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id w11so3059253ply.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qux1BcXKfGbtkPfbhFH+jwIJdgaEMApMJYvljbzcQac=;
 b=WDsbf4lhRBTZdR+Ed/viXWb7jCiyUvqbtYl+NMkDRlA9aIsoeprHspN5GGG5ZoOIww
 ufFT4Nq1RECpf0IYakhKA4dcWMfyo4X059HXV1UaUh0P/KnsS663C4PzZ03iLIEcoj33
 AP5VnW5xF+JYQlJxpiqogAlXoqvQuQW4t9XTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qux1BcXKfGbtkPfbhFH+jwIJdgaEMApMJYvljbzcQac=;
 b=Ugowe1nxpU70pAq+jJW+UT/DFJmU2Z2THOVYJAf0Ldhrh6Zwvfa8xRLu/J247lGRlV
 DiLsjFD2Zn4RZjO9sJz0DlZgjXG/Tg0UYZIJmHp22wVHIThLGQK+rmJOpWFSepQo0MsB
 TWKbAuBjxhd8rfosmcupUhaErZV67TStW7pmQmaweL+kmoF5xPuWJxCDuJy2Vczqr+ZM
 JKfZwfyLc4ygVhCw2IxQ3bbD3SufthNvt2cUpZDPNoCgo150rBPRAVH2Q3jKZBrOresl
 8bvL925uB6aWvMf2mO6E9Sl13BtgkyfMY9lu96CMsLWPZB0f8AXUxHlake8HrgvH7ItW
 u8mg==
X-Gm-Message-State: AOAM533kaWyP6fQQ9PVlrq7Ps64JVe6M3KpTOv/RPvUnQeNOWoQz/pok
 2MF5dZI5+UgAOWjFUUj1Y93C/w==
X-Google-Smtp-Source: ABdhPJz85KJT/5mvyklmGV27zCWK7g/5WFe1sKszdh7ahKEi36K8AnjDbqPhij1HqBG/Y+24UBiNOw==
X-Received: by 2002:a17:902:9a06:b029:e6:9241:2779 with SMTP id
 v6-20020a1709029a06b02900e692412779mr14282257plp.24.1617402569906; 
 Fri, 02 Apr 2021 15:29:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 03/12] drm/bridge: ti-sn65dsi86: Remove incorrectly tagged
 kerneldoc comment
Date: Fri,  2 Apr 2021 15:28:37 -0700
Message-Id: <20210402152701.v3.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A random comment inside a function had "/**" in front of it. That
doesn't make sense. Remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
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
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
