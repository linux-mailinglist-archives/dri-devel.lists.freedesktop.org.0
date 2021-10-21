Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE6435BFB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C11D6EBFE;
	Thu, 21 Oct 2021 07:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D39A6EBFE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 61AB42B01344;
 Thu, 21 Oct 2021 03:40:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 21 Oct 2021 03:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=V2ECKODejaAuL
 jYVZGAyrUq9Ivh4nxZakGL2AQusnM8=; b=f7M/Yoi+B44CPGuKeKO21MHz1NxJC
 TAuwB27fI6oWQBlyIc+jTL7V4bVxRaw+1jrq8rwJfa9KAmigKSgjjG8Wj7k10cYo
 Kqnq1SqNJSlIX8i0JFOOdEjq7U9Vfvv8m/iL9EqN+vLpRRNzmnjDG+fMaG4EaGEw
 Rj8m9FpwFT5VXoR8Mi2MoBrfyqWF0xkWfk4uRXrx9hcZVuKXUch1QUo8gHuGDwNi
 2axOZbZwpIlYqi8q+wIHudir/ey6tzERvSMEsv9kxGAHgo8Dl8uMJWxgLY2nN8RU
 UosbG9KpqKTklPqjbXD7RETxPa3ydGQTPRP7fmW76hNCgctw85y+BwOWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=V2ECKODejaAuLjYVZGAyrUq9Ivh4nxZakGL2AQusnM8=; b=iwrVMsUd
 1xyikiPls12Yxwm5YO5GVEdtYszhnKvWrSge8ZOmio1LMgFP4MlRziksVkH11oeN
 8T4k8L2HGZgpA78oBB88+YFB1lPaOu5xHI7AETl+OG6LNQq48mTUfCDRjVo/Hl+T
 cVN7dFAPcp6V81wARL1vVa40EjY5OOd2tiwD79QxU2yaJHsYpBfFQH9PwcZnnVK8
 A+SH3kk9dUa0I5+vkbTs71qTJB31JNcahsPRyDjc5w2GwfYrVfodtVTClzS6r45Y
 ljtzPssHO7vFWUTLGEsB72LbnDfJP2RT2BUhkgmQe1MO9BE8qCOd7IOPomvzPHkb
 DNxK1bCEtaohuQ==
X-ME-Sender: <xms:dxlxYWSPbE42x89xF71hTjHUhsxIKkKg0D8bRKgRI4mpLnfeplkRjw>
 <xme:dxlxYbwBMx1VG4-SIMo0sQ80p0-6d6BEN-On1HU1iZgsQDt8flKjSHv2Rv6SjPlzJ
 T154ow-wMS_CrQQl08>
X-ME-Received: <xmr:dxlxYT399tpNyHVY-69bdMS1u3oPqhXMV-HzXpIN8GybSsgxJYBHSegmOWLfIslaVMqe413WKB41-t70KCB5ccO-BIK1XVkd1SFfrGMb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dxlxYSANzsG9r9_95vbIiYcEA7nxiPQ4ES8C-RRh4fo8Zo9PqWxBew>
 <xmx:dxlxYfgaSrodwj8S1ZBD9pkVpE4pjIdr1ChdxMGXdST0UzinAuX40Q>
 <xmx:dxlxYernTlMZuhPx036MPH7bb0-_OaVYi6U46IFE783k4NEo75HG0Q>
 <xmx:eBlxYbBRRU8re9pf5D1eASRPkCTdLd-w-JE5jq8Elk5QKcfJed9kl-cxaG0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/21] drm/bridge: lt9611uxc: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:36 +0200
Message-Id: <20211021073947.499373-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021073947.499373-1-maxime@cerno.tech>
References: <20211021073947.499373-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time. Let's do this.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 31 +++++++++++++---------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index ab1a0c00aad8..33f9716da0ee 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -367,18 +367,6 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	/* Attach primary DSI */
-	lt9611uxc->dsi0 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi0_node);
-	if (IS_ERR(lt9611uxc->dsi0))
-		return PTR_ERR(lt9611uxc->dsi0);
-
-	/* Attach secondary DSI, if specified */
-	if (lt9611uxc->dsi1_node) {
-		lt9611uxc->dsi1 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi1_node);
-		if (IS_ERR(lt9611uxc->dsi1))
-			return PTR_ERR(lt9611uxc->dsi1);
-	}
-
 	return 0;
 }
 
@@ -958,8 +946,27 @@ static int lt9611uxc_probe(struct i2c_client *client,
 
 	drm_bridge_add(&lt9611uxc->bridge);
 
+	/* Attach primary DSI */
+	lt9611uxc->dsi0 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi0_node);
+	if (IS_ERR(lt9611uxc->dsi0)) {
+		ret = PTR_ERR(lt9611uxc->dsi0);
+		goto err_remove_bridge;
+	}
+
+	/* Attach secondary DSI, if specified */
+	if (lt9611uxc->dsi1_node) {
+		lt9611uxc->dsi1 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi1_node);
+		if (IS_ERR(lt9611uxc->dsi1)) {
+			ret = PTR_ERR(lt9611uxc->dsi1);
+			goto err_remove_bridge;
+		}
+	}
+
 	return lt9611uxc_audio_init(dev, lt9611uxc);
 
+err_remove_bridge:
+	drm_bridge_remove(&lt9611uxc->bridge);
+
 err_disable_regulators:
 	regulator_bulk_disable(ARRAY_SIZE(lt9611uxc->supplies), lt9611uxc->supplies);
 
-- 
2.31.1

