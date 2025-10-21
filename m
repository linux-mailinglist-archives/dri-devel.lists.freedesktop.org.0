Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2FBF6BDB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830DF10E5F2;
	Tue, 21 Oct 2025 13:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SEc0ncK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9664210E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:23:32 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6202E01;
 Tue, 21 Oct 2025 15:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761052907;
 bh=nWvFAvD5AGlGEC9yWkEHzmj/BzvIaks9Klnp2gFRims=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SEc0ncK/Px7LHKPRC5HjahiOZMnp2UOUsW1WNPFmHW1eOin2P5o28QPCwJsRAaHqr
 B5aCJ7cjBUSvuE+mtNxrmIc6L7YAS526nAz+PTtdVO4W1Xn8WNK5gycqOrv+4lRz/c
 uReVOVDZuMGzuYczMpkh8G0DCs7VADVlLpHNX4Dw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 21 Oct 2025 16:22:57 +0300
Subject: [PATCH 1/7] drm/bridge: tc358768: Fix typo in
 TC358768_DSI_CONTROL_DIS_MODE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tc358768-v1-1-d590dc6a1a0c@ideasonboard.com>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
In-Reply-To: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nWvFAvD5AGlGEC9yWkEHzmj/BzvIaks9Klnp2gFRims=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo94lOIXJCeonjgsKVvaBnTwx2Cc0C7I40fThUk
 XMNkOKzkhiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaPeJTgAKCRD6PaqMvJYe
 9dHzD/97oSLT/UXJrVYdPSI3Hoaoe61ujacfWK8E3/xKu5I2sKN0Ib6VhaqUZU6h30ci5UqsVEl
 9aULxfmlH3zWv0pHfW41M5TNL70/gpmUw4NS/Oh9cfrs5JiKwZbiFdtLcuUD1gCKSPwhmBEDKsm
 ps95iHNUtcsvqp5G0srxD3zEZD0Qg28h187PDiO0AjHCL1kRKlm5Pu/t4cDmuBf5GMVln2DB71V
 /Jof5V5YouGa7WyFCtUqHYq3tDAduljJMzio5Zd+IYFE0jR3wXf40lO/Lp1mMAbly4aKfDvmY4C
 2ji43XpGvmYTzYI3OlA3+wj7eULBEGH9uuQaOCVGLOA1mbj967ZNJ0pJa5bNMf2WQuCGhItxH8j
 xD4SDAUor5ALJay+xuLuu02XWyeAdPQW2SiQB9qqwk8B2Om22WmcYlOsFNTZGyU9ZqVCNd6SegB
 SeiZxwVeQLP58+Ar+au4H6gKUPG6307oJ++/yukmlxNNq9VGTtyaouX5Ngz24/rO1mJgAR9crpR
 H6hkBjkZBPrvUOjYwpFq3Mc5XKpOAHBjnVczYYSV3XC2fMHOOIXQcvubXmhMKc28oFJERtUFQcz
 rICQY6btAQMUZdXf03jHvUQLmlqU+DCgukv7P7yNX2GdwRXNxR+ZbookwZbHmUX5aExuwGdE+Od
 tZErzWCg7TCbrjA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

It's "DSI_MODE", not "DIS_MODE".

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index fbdc44e16229..c95d164bd3a0 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -115,7 +115,7 @@
 #define TC358768_DSI_HACT		0x062C
 
 /* TC358768_DSI_CONTROL (0x040C) register */
-#define TC358768_DSI_CONTROL_DIS_MODE	BIT(15)
+#define TC358768_DSI_CONTROL_DSI_MODE	BIT(15)
 #define TC358768_DSI_CONTROL_TXMD	BIT(7)
 #define TC358768_DSI_CONTROL_HSCKMD	BIT(5)
 #define TC358768_DSI_CONTROL_EOTDIS	BIT(0)
@@ -1082,7 +1082,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	tc358768_write(priv, TC358768_DSI_CONFW, val);
 
 	val = TC358768_DSI_CONFW_MODE_CLR | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
-	val |= TC358768_DSI_CONTROL_DIS_MODE; /* DSI mode */
+	val |= TC358768_DSI_CONTROL_DSI_MODE;
 	tc358768_write(priv, TC358768_DSI_CONFW, val);
 
 	ret = tc358768_clear_error(priv);

-- 
2.43.0

