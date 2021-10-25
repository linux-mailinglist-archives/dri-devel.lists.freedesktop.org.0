Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04545439A04
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46E76E0EF;
	Mon, 25 Oct 2021 15:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881D76E0CD;
 Mon, 25 Oct 2021 15:16:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id D0A2E5806B4;
 Mon, 25 Oct 2021 11:16:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 11:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pwgSELP5dT/2C
 DHLV12oEtfj6zG5D1L9hu7xC1kNBUc=; b=OfICKeGVucyhLZnQJEM3jO3t44LDW
 gERuRj0Fw/KSf4vE7yspJOIAfhUTYoG2Y6fyiJww17m3CuR+U7OlYIlaAr9GI0/v
 voGZzlOnjbRbnjlDir79gWo5sITtV38waHC96FzxfGZGr+J5STY5IzYMkZ+pFYz3
 YZjFfCuIIbVXWIC3L+nqcbOASGoDhHXxwfw+Q1Ft0V2EiFITANUWuNorUWoTh8j0
 dgk6sQbAgkhCPfiR+ohI3+AVMX8mtja10yZ976eZRCYWiRNA4UVObPRaGeweqj9l
 vYBvqCYyn6bXvG/JLp+eL8woC2bO0793KA//05WGPV9+41VSGnEpWAQUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pwgSELP5dT/2CDHLV12oEtfj6zG5D1L9hu7xC1kNBUc=; b=EZiplbVY
 GChkavqnfRlD5zLlM0m+r7vh4rScKrcwdTer4U4lLU1owmpl3+csIQrm+Ge+GR9P
 nLb88vq2zgM8+zjjvsJz+YFNhvl8on596JDZEtdMrXOt+S30Fd1Wyhr3AcTlKHiN
 iz8LwEVMh6l2Um10skGI16k3LHN99E6W3QX8e771GI5jgzb/0Qq3VWd6T+BM1Ofy
 WcqhkkCrOUC5i0eY78RKwj3Fw0/GxZHi5ll12/iXtH6+AEiJWH+c0VwhpwkOIvf/
 hB//7jNXbZq5h+ZjBPmM+0nQV5M860HKnpAXt2fZQsChULzVOKbLRhIaLNuShWqF
 GMxOvnOdeQWptw==
X-ME-Sender: <xms:Msp2YbQw9Hlc4LicchLl6B67JkJ7YTO3WG0tCXNyJIKg0ZEKQscd7g>
 <xme:Msp2YcyQoJbNvZvnwbdkgPNPA5vlaHFnEAObCHmQt4BX3AzbNt8Gk2aFHYxGziIK9
 lEUbLoP56CrdPLFH5Y>
X-ME-Received: <xmr:Msp2YQ1H5b_X0xjyE99vTA6nzqZOEzYxmASF9Fym5ryMJJbHyMppvVIBirwYV44JJAq-mMR4zZkNBBKKuOlKpq9jnvV6fo2kOTpA3zzp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Msp2YbBaVL1GKdIDGxGkYCdjqU_2f_zSO24qDSFl-7DTsHd8K3fTYQ>
 <xmx:Msp2YUiB6NxIjV9BTtdSyyVDFN06_GEGhu8mFdNbcYmjT7_ow19YOQ>
 <xmx:Msp2YfpXbBIyETDZaHzv5sQbsX5y3uqjNO58K2aZlT-1kW8IvXEslQ>
 <xmx:M8p2YcAJrEicmHqkNiDb2klaY_JMZoMHZjTfvf4P2O0dyOJmNWeSjg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:02 -0400 (EDT)
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
Subject: [PATCH v6 08/21] drm/bridge: lt9611: Register and attach our DSI
 device at probe
Date: Mon, 25 Oct 2021 17:15:23 +0200
Message-Id: <20211025151536.1048186-9-maxime@cerno.tech>
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
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 38 ++++++++++++-------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 654131aca5ed..d2f45a0f79c8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -825,26 +825,7 @@ static int lt9611_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	/* Attach primary DSI */
-	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
-	if (IS_ERR(lt9611->dsi0))
-		return PTR_ERR(lt9611->dsi0);
-
-	/* Attach secondary DSI, if specified */
-	if (lt9611->dsi1_node) {
-		lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
-		if (IS_ERR(lt9611->dsi1)) {
-			ret = PTR_ERR(lt9611->dsi1);
-			goto err_unregister_dsi0;
-		}
-	}
-
 	return 0;
-
-err_unregister_dsi0:
-	drm_connector_cleanup(&lt9611->connector);
-
-	return ret;
 }
 
 static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
@@ -1165,10 +1146,29 @@ static int lt9611_probe(struct i2c_client *client,
 
 	drm_bridge_add(&lt9611->bridge);
 
+	/* Attach primary DSI */
+	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
+	if (IS_ERR(lt9611->dsi0)) {
+		ret = PTR_ERR(lt9611->dsi0);
+		goto err_remove_bridge;
+	}
+
+	/* Attach secondary DSI, if specified */
+	if (lt9611->dsi1_node) {
+		lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
+		if (IS_ERR(lt9611->dsi1)) {
+			ret = PTR_ERR(lt9611->dsi1);
+			goto err_remove_bridge;
+		}
+	}
+
 	lt9611_enable_hpd_interrupts(lt9611);
 
 	return lt9611_audio_init(dev, lt9611);
 
+err_remove_bridge:
+	drm_bridge_remove(&lt9611->bridge);
+
 err_disable_regulators:
 	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);
 
-- 
2.31.1

