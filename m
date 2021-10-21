Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF861435C0A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3C6EC0E;
	Thu, 21 Oct 2021 07:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925086EC0E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:41:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7671D2B0042E;
 Thu, 21 Oct 2021 03:41:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 21 Oct 2021 03:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/QMqV2xNvARcz
 7m7ICXmWasIz89maW9VgPKXP0jtMvU=; b=PLx4Mhb9V0yDcsTDRaURj711s5uX6
 htj8S5ID2MAXA1VsjVSJ8457d+YNa/GO5YkiH+5GHCw6T3uUTjiQTh4vvXa7cBcm
 32kIgP1n5x/oeDyxy6ubXBbkdV5Nfh/074WJmOKTJo5WMlBRexaGdcAwTy+0Hfys
 vM2QAyEUrAUTWXy/u7UhwwOLsPd5n839iHb8ODbw4zLIhLtU6XR0IvebjyBUIT6o
 NoO3NSBqgIl7CbjBSMN9gNA/E+9/iutbTUP3a6cYlOl669PMv0rTUZVJF243Ja87
 HEcNDU+zYuD+xfEan0wHqVKnlpQhayeY2jfKJMVTNTO/90+7ayac3ALXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/QMqV2xNvARcz7m7ICXmWasIz89maW9VgPKXP0jtMvU=; b=Uixp2Sc7
 zZnuMw0I3RAGtQ7Ihj9VFlE7dfd2gisFnvia19VFPii+c0MbCY5GaMpNcJbRrDdM
 LpmwtFcsftbhCAFipdqDMLaJetRz6E9qegEScQxVigTudAXA/dUXWTATNbyOnNev
 OEOw7M5PwZoajjMBTrLnQy/QioQijR1tGp7vJwy4Go3GJzI0v8q6fWJZmoM/cZEw
 QyfQRQGdOPPmAq9/wKwdekSgnU9et5hMUH3t5YaoH7K3wGbnwO7wBXiZtzlEnLyZ
 hwMgU5cimOhaPckqiwxgfHdO1Fbjy/aR5LtlKky4pohK3uFSfgHwimYlsOQHLTFQ
 coYTTVXPTzmmug==
X-ME-Sender: <xms:mxlxYavgQXGV4knAqh7kkyPd87tIYUM__42MkcR-42p_2kni65CZWw>
 <xme:mxlxYfdmgBjPibPKBkLNIlvhzlA7dH4fsBx8Jxg9y3K0540vJ-2dFHdHiq0iwpLZB
 -IYaGc45U7xfeyVthE>
X-ME-Received: <xmr:mxlxYVwZQuCahkdL_ZAxbIecDvHBNL92nMfI-u9oD3929zf3ttBqaor1l8rnM3SUHfBzCjFRIBn2xKFkmUI3AyH-K_9uwntYFBl-J2Up>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mxlxYVPgoExu6T1MLtVnjhTWWRybIiaRLHXipBwNhrQgy6NGGlyhQA>
 <xmx:mxlxYa_Z0Sxrv2967ezAmD9H0irftK5np3-EB1NQpcf6Gx6mb4_-Nw>
 <xmx:mxlxYdWFJ4-jjjvLfUyHAeDn-ajOpIgv-WL2zbM-sIf2WzTTriGERA>
 <xmx:mxlxYRtBUgT--ZE6k1Rt32JqOA8ov_maH78ucodCaDoV18mwM6AiajfmcI8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:41:14 -0400 (EDT)
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
Subject: [PATCH v5 18/21] drm/bridge: tc358775: Switch to devm MIPI-DSI helpers
Date: Thu, 21 Oct 2021 09:39:44 +0200
Message-Id: <20211021073947.499373-19-maxime@cerno.tech>
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

Let's switch to the new devm MIPI-DSI function to register and attach
our secondary device. This also avoids leaking the device when we detach
the bridge.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/tc358775.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 2272adcc5b4a..35e66d1b6456 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -610,11 +610,10 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 		return -EPROBE_DEFER;
 	}
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
-		ret = PTR_ERR(dsi);
-		goto err_dsi_device;
+		return PTR_ERR(dsi);
 	}
 
 	tc->dsi = dsi;
@@ -623,19 +622,15 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
 				 &tc->bridge, flags);
-err_dsi_attach:
-	mipi_dsi_device_unregister(dsi);
-err_dsi_device:
-	return ret;
 }
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
-- 
2.31.1

