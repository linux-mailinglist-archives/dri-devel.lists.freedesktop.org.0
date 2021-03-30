Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA4334DEC1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C48F6E823;
	Tue, 30 Mar 2021 02:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447E96E823
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:06 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so562854pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TcXAfPKa+Tcs9m08emwoREb3+u87BPiPwkXmewbCSKM=;
 b=PYRlolbxkd9TiHB1PoLA1tTvNQtWjiMSVuapm4tc4c/3Cw3kU22e41yyfvS7GrhTeD
 pvSMf0sZb4cNX6SBnm2+0kzt5ZlJkW6VC/BpP+KWxQ1+INxTNVYlTGtpdONMwEHHEWsw
 3G06wk9pwKuuWCSWQWggeX+7vLwVHzxXeLkGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TcXAfPKa+Tcs9m08emwoREb3+u87BPiPwkXmewbCSKM=;
 b=glBIr17aFzHmIlv5PEmE1PpZuQLRggYyDlpFNjMWELgDa5YIkHj0L+00B+tNXyYEh9
 h+lyn9rZkW98StjUu6aTJBkfQ9zy6kYEFpd1f0I9AQFH88mgcCpPAQaMwRfRxzYq3atb
 w1zXc8wR0/Oft8nIQo1fsDw3/h6bSG/2YmM0BAbC/cl0sww8gDfGtH9Rt6xdupEd0Ch/
 VFWnzNzAIw/qNLCYHefk8ozjsEZl9fcL8vYUTLOmeFSEZ3AMQSmij/Mf6a7pH1mUP0mZ
 72Z/N7PWqWYYCzjebWk/rwcEIWeQB71259mFhUFIG0tLwq5MfJCwPh3gTGZ9s1KGpsGf
 S6yg==
X-Gm-Message-State: AOAM530GLnKtyGRgaYDIaoPwu5DtRmKbd18+/DY5WVA0eOrvSRs67hsi
 2OfldqusjrdkJ29i88HbROxBJg==
X-Google-Smtp-Source: ABdhPJw7wjhR3bYBB6XuXoFKaK/PAbcUoH2xgh0Za5Qj0NYFEPc9Uc9V94+9eeGBo8/VwNei/h7VmA==
X-Received: by 2002:a17:90a:a88d:: with SMTP id
 h13mr2030265pjq.61.1617072845929; 
 Mon, 29 Mar 2021 19:54:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 03/14] drm/bridge: ti-sn65dsi86: Remove incorrectly tagged
 kerneldoc comment
Date: Mon, 29 Mar 2021 19:53:34 -0700
Message-Id: <20210329195255.v2.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
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
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
