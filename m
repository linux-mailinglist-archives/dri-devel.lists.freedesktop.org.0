Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51D4069B9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543506E9C7;
	Fri, 10 Sep 2021 10:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D996E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 358B12B013DE;
 Fri, 10 Sep 2021 06:13:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Sep 2021 06:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=GkRqjna7ipAu3
 KazwmecrFmZD8jsRUTUOnF6O23MPAs=; b=yUn9B6ozjXzh3LaFg+FquZtrHRuSf
 f6t8M8vGR0gzM1TdV4GAa+ZDAcnIpWG/HO2FaWJKtZ4Fo1N6AGFnFs+EcD0uZ+Sa
 5f3kRIPDgfg40qhNa/MekB6DMm9Pq6nxDcVdN0ixu17OSGFhOugnzxyzjMgUKgDK
 v0ysFSI2PKpGmIlklUyKCitF93p+pH9UaoCWSDbBwPgVdaaTmKQPwox2KDzAxbjj
 OaSl9CTSovdaiTy05RSmytNQvjhTqX1t1LlKzYkq2abTRIYFdGqcF3JdeWSwsUgj
 Rp/ngLn1kKNnjOLiCFR7QWFdluafv5y4mtYx5FjLn62GM6qfH0EExj39g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=GkRqjna7ipAu3KazwmecrFmZD8jsRUTUOnF6O23MPAs=; b=sE3sJGvD
 bcTrV6Nxq8y2qjsCR80YES6NEEASLW/SxM84mnS/FZtfVe1y9AqMkunjQ+cZoirZ
 cWDHbuGkVdmEgC077OaC5qMzpVSr8uiejZAIHj27K71cd02Hf/Jbq2r2dnt8pQJ6
 qiXM5cS4fkjZaxfKJ+WGe3ZWXmR2W1YKOJmXvcew/EY6KXA8RK/DJrH/JMcsQYCc
 CVwpjk6itHoVbIWadbEqaJ3fsoCLpHoV+3bzj9mUXEZGdDtNMvynWYsTPUYrEGW3
 4i/Q+ob4H7GI0uJBvRMw1j0dXOOBcY3m2nruXg/M9FOy9g/CadXMVTaVJ80Jr9UC
 /GyWim5+bXqaHw==
X-ME-Sender: <xms:zC87YYqyNH-evx4gO74J9XESOBWH9G74VZ_J79FMnvyLtNv54sfYXw>
 <xme:zC87YeocBg0YC7P290ixg1QwGOkJwaF4782unCSf0tp5EFB3HEYgOcWPXMur491sA
 Qk4OKaQmuFNRTO82Qk>
X-ME-Received: <xmr:zC87YdPjrJR5dJTzW7bvYfdAYzUDcs0E8TZhAiy3LcvUOOJzTknmDYkle5Vgz-MdI_7hdGzCceVKSH6mFv6YxBfilgLT-jelH5_J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zC87Yf7-s-cZkPaKTfO4e6TsbZekJOqbw6Uz1Ulo0WWlttTOyWkYlQ>
 <xmx:zC87YX6KJ_ENrc31ABx1pJ_5_ClT0RWH52_Bwqk2HBOlBLlJd0GVpg>
 <xmx:zC87YfjHUaXUzlXZ2zyM2ix71ew-vkufeuTGnF291M563A3skdy0Aw>
 <xmx:zi87Yb5QL1WnSr3ZCUM50hQtQRCGOv44DxSVNK05U4fA-Vq85ObDHwbeW3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 12/24] drm/bridge: lt9611: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:06 +0200
Message-Id: <20210910101218.1632297-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
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

