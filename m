Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF87439A13
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD586E0D2;
	Mon, 25 Oct 2021 15:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94B46E0AC;
 Mon, 25 Oct 2021 15:15:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F2D455806AD;
 Mon, 25 Oct 2021 11:15:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 25 Oct 2021 11:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pV3hE2oY3D0Ef
 gDyvbcrui+MkjjAnltQDBA8ecItqP8=; b=ZyK1ioN4IL8f2BmwLpO2+tud8OOk2
 OfWR41dxXG2ajd1GhagyDC64NWz+ZerEIOPUJ8S7BZbL2hr1BpveZbsOlTaPuLbu
 yjjTOa2lRSMhj5h3ekMymrmxtq5WhC6/zHJaMFhjNJ1eAYy+ApobGxHrS2x0Bc1U
 GI06QLtrg5wuJdRK/ZU+D9XLEmfd5AFzphYNy5RfC2dmaOylVwDbvJiaI0ktif36
 f4oKshLAawJ4BPRSGFwFYwSKz+ACrzxFtWhJcUvOKA043j7AskvHe6qowPU7D5Jk
 pKoNUFFWGjf5VMFza5N2rCwm4ZG62tM8DVqYX0Zp6vj8Wq6w4SrHXq43w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pV3hE2oY3D0EfgDyvbcrui+MkjjAnltQDBA8ecItqP8=; b=SGcbgmbC
 MLuxtQdS1+z2Zhrvk55FK3DDoedPCMwjXvnJ829BbP/959644FYgp0yXd+J7/ku9
 flB451XqmXKD8yahLT9NEPN7mEr15rI7Tp8a1jj6p94Kf4iiTRTym1uI15s3OT+8
 xtnRFd01L5beClRsjMTKl0UuUYn0or/tn2sDyj+3iUL+c/hZZrc+vkuAo06apTum
 l6InerLmtq+vds6T3mQLSFaX0cZRv3g0uZapKYjaEHLWfcIF56ci4u+nSKYnYuPb
 OvcOudQstolf0MklWhWnwKyqG1UTKTe2/7cqyVyqrh62Ge0YgIQSO+kAxYMdqh3T
 adlHysTXtKuYjA==
X-ME-Sender: <xms:Lsp2YY20h4MhoMA5-TvW8EMQn2uRB4uTFW4i9Vxd-05lyXVazeUOJA>
 <xme:Lsp2YTGq8Oxz1ggNayBAUtoYC6NzZxb701XAb-Tb1intTKsOjGSu_DCno2TfwPzyL
 JxDVCbhHYNEayLOlEI>
X-ME-Received: <xmr:Lsp2YQ7V7HUOq46_2yZ4Stg-0JfVcCSOjkAIjNKBQdSEX3GHfCmdBQV3yaxph44yCwuuew7MAadQ_MMtVHtyeMwv4p1rBOEngkucAzul>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Lsp2YR23DM-tMckuCoLxIyAoRGQoqpbUP-hyzENn_6W6IoIZGcCLAg>
 <xmx:Lsp2YbHJ7cXRJmJvXnSS_1qXJGOkcwxwxNkM_7M1NNC6y3jrbSqS9w>
 <xmx:Lsp2Ya-ChtdikIK5Bu_aH0o4lB62ISyeGm41SeQbrzPVF98GyfyGTA>
 <xmx:Lsp2YfWywgGwM74UyNX--Bw34_U-aEmI_wLB1BpL3YDHKz5itAuRVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:15:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Subject: [PATCH v6 06/21] drm/bridge: lt8912b: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:21 +0200
Message-Id: <20211025151536.1048186-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-1-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
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
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index cc968d65936b..c642d1e02b2f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -544,10 +544,6 @@ static int lt8912_bridge_attach(struct drm_bridge *bridge,
 	if (ret)
 		goto error;
 
-	ret = lt8912_attach_dsi(lt);
-	if (ret)
-		goto error;
-
 	lt->is_attached = true;
 
 	return 0;
@@ -706,8 +702,15 @@ static int lt8912_probe(struct i2c_client *client,
 
 	drm_bridge_add(&lt->bridge);
 
+	ret = lt8912_attach_dsi(lt);
+	if (ret)
+		goto err_attach;
+
 	return 0;
 
+err_attach:
+	drm_bridge_remove(&lt->bridge);
+	lt8912_free_i2c(lt);
 err_i2c:
 	lt8912_put_dt(lt);
 err_dt_parse:
-- 
2.31.1

