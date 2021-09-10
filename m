Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E14069B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFAE6E9C4;
	Fri, 10 Sep 2021 10:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ED66E9C4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:13:26 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 6E0D12B01392;
 Fri, 10 Sep 2021 06:13:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 06:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=P7cU40IhZTYoO
 YNa5/nd9QxWPDSEFDxg4X7N2VIhtgY=; b=oQYxdWA6wyHUYUkwp2jphxcLM8mUH
 akXw3ouzs8kiQKQH4m3DPuNeut2mTdd87Xcq/LZAeEXh08i57uEoxtdWWi/1TMnC
 2hu3EoAzgNw8UhhCFYKTdFzkzbnZYZ/xGOmNSjbbExnYsYv1AjlCfopdxDHoszrT
 K8UtbgFxP8GeTHhNwS9tv1rBA305eIzZEHTBpPXJiaYiZXbjyVeTjT1Na7qgta1j
 A4Fa0C/HUQoi/8QzqlXoD/cpD7CbpFehtyLe++mSeYOeMF+/BosRPsBiiPLgJH3q
 VyUUvKmSgNgRNK/ynl21UMN5jptoUKdYpO5l0NhJz1UONBMGGct5wgi3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=P7cU40IhZTYoOYNa5/nd9QxWPDSEFDxg4X7N2VIhtgY=; b=bkDw+5z0
 R8G0tNQIJRhm0BT5jSrVhaut0+zvXy35hxDJP7ypx+fVTvMbighH6w8WmOANiGsC
 F9qwZ6nZRJgBUUP5ARMhQW5QcQkEhFY9TBSNADItTLmt25QWTjL4JCnt7teWXKwW
 v1bQ2ZIUPUtwtAEu9w/WDL8cXwVCCR24t6GFkciNjvxXGjhmZZ76AEUkvdiPlUhe
 kc3ywCzBwKx/+PaQsRr3SI7A0GTB8bRjg/uR6CPojayiUUaJP90p1YoRXe+Y5bB6
 cQjSwRPw1pKfxU92LYI3XeS14Ej3wQ1t3QsziFZ5XfCLjuZ7OwNGYM7EjPvQ21RF
 Nfldr1pRx9ryIA==
X-ME-Sender: <xms:wi87YbOb1yw6YgBYthfE0fSSNbytcCyN1nVQ0YLwWaMs1utgHdiBKA>
 <xme:wi87YV85qtibzofmYbB2kr5M5jjNWgjhmDqpJUZCU33M_3xPoeB_lx39_fd63nobz
 KHj_NyjNxPBSlQOLzU>
X-ME-Received: <xmr:wi87YaQf-myqpEAjpUXJXAvgAopoUIyQrHQxyE4F72Hf6HNjtk1v6v4F0M8UrWa2bShEiixiOo5ZD4G4l0sNl0jGoLmmOwYtykbW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wi87Yfs8AMfPvUsuWNXJq1NG_6X7ieLlnLq2uZPHpu0NtqdWLYCNWw>
 <xmx:wi87YTc9iw94zBuDZQMnm3SrdiBWEoWD0v6XIp9_kNe2CUL7EBKbuQ>
 <xmx:wi87Yb0W41hX7T15HgnKmQDZ0wBA6wcjC79N_2z2sAaewB89LhtVKg>
 <xmx:wy87YQNm8Il38ujceIZGBg7p_T1FKfVwOOD-9Buo54Tt_rlKYscAR4rw4pE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:13:22 -0400 (EDT)
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
Subject: [PATCH v4 10/24] drm/bridge: lt8912b: Register and attach our DSI
 device at probe
Date: Fri, 10 Sep 2021 12:12:04 +0200
Message-Id: <20210910101218.1632297-11-maxime@cerno.tech>
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

