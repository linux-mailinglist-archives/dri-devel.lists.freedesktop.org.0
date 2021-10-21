Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF4F435BF7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85436EBA5;
	Thu, 21 Oct 2021 07:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955B26EBA5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:40:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7921D2B0131F;
 Thu, 21 Oct 2021 03:40:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 21 Oct 2021 03:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pV3hE2oY3D0Ef
 gDyvbcrui+MkjjAnltQDBA8ecItqP8=; b=PWNcqDeCBK858nlsHvN7/57PCBcqE
 8sDyTiBCzeXuKd+SfXXWBWqLVDmVSWZw89eHVTz7cTCS/5OUfWE15yzqDZbpsf3x
 cqYHirZ2MILW5x9Kh3xEDo/XeZWD3l65SQJOWaACFmjQVLMlKWV7f/XM5oZJdnfc
 qeV+JUaNgTRwy+ecxP/MA91eN1MdZYz4nLHhSIBRIIWQH8OK8SEmdRWqKPULgTb+
 ruzWjAyiIO82ouWOabzjCKwm0hnmd82SvHwnXOOnbOi4TNLIm2hFN/ZvcB5fzBDV
 iSfIYWGn5jPwXOUq7ayyVJdhhP1YFoyVmdQtGmhV6D++8Vnm8iNZlRWPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pV3hE2oY3D0EfgDyvbcrui+MkjjAnltQDBA8ecItqP8=; b=c3qur6nU
 ekbWoCf/rT5KbmFeVux33ea43dXa47pwANCzf7j39Q1qcI8laljTi3PdXXiRbxOL
 g1T1i5pZ2XItM7HGhUw+rDLy4RE+ToIJivWqNFTMww4rp57/mlw1rzT71B9Ychka
 WxwNVmmeoavw24l5F9z6RCXny+Ax+hMXD+nKL5jJwGsYRCfg4GavO5TzIyiZlDK0
 /cj15Hy1QpwVRQAsNjlSNLU3sxEqS737MuGHbROa1BHi86lgS+qTdTjvo31S4DHA
 kerFHEynVdrMIEgf23+FpQM3sG5n6hXbxeHNzd7hToAFYoyZVukKhNJNmz7bv5Ow
 XpC8RoEHz/0ZjQ==
X-ME-Sender: <xms:ZhlxYUvGTFO6pUzJMHvr5ptBklCkMD4NUFfvSSP8y2j1DzZAPL32Ow>
 <xme:ZhlxYRfs8ZDmz88oPs2WVoVro1G-FBWRqsCDbfR33DlAn9kwIL7n-faL-DrPCfSl5
 rArACdSP2c8ZxUq5U4>
X-ME-Received: <xmr:ZhlxYfyHsp_kUsZC3mDDR1aU5tgoLFfATkI3dOv8we0udJhHkUJX2R6fK_JY_hmG1Rg0xR8qR4Bz9aWye_G6r50whdfhyWGHMtsUR_7L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZhlxYXO6Y466PljLKCWKPLmHvkWZBWmdju9apl84nJJnF9lgf8juRw>
 <xmx:ZhlxYU95QRKYK1ot3YMFBSMoaq9T2-JYETqXgheHVZTdpDgeXUEbyw>
 <xmx:ZhlxYfU8mHC_1daRS_Z1Zw8GcNKSrq9XlQZBz_pnN30nv7ber-U0DQ>
 <xmx:ZhlxYTsIDTWs-Zb9KTxplqqaUR1URlrBRVblsXcLi2HQ02lqsuD1NlDmuV4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 03:40:21 -0400 (EDT)
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
Subject: [PATCH v5 06/21] drm/bridge: lt8912b: Register and attach our DSI
 device at probe
Date: Thu, 21 Oct 2021 09:39:32 +0200
Message-Id: <20211021073947.499373-7-maxime@cerno.tech>
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

