Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8217935A7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E98B10E573;
	Wed,  6 Sep 2023 06:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FED10E56E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 06:51:30 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89632DE2;
 Wed,  6 Sep 2023 08:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693983002;
 bh=0xduDbqnx0tQ7Ml5WdtnYLM59pTP/iuxx2arAhXTDzM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nQTQh3KzO7HOwu2N4d3HjQZ3skRySbR4G/SwW++A/hdTM1Kn5uzLJPXGMZrKR6F7o
 IET6THfR+JnCLYjBLJuRCNFd+i0jOi1BIyWmtwfN4NoEGf4d/YxKlo+EPOuXo3GzjS
 76YlRRc/ZY5XmnYayfmJDWAZrYDrWIRG1ZPZj+SI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Sep 2023 09:50:50 +0300
Subject: [PATCH v4 03/12] drm/bridge: tc358768: Default to positive h/v syncs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-tc358768-v4-3-31725f008a50@ideasonboard.com>
References: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
In-Reply-To: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0xduDbqnx0tQ7Ml5WdtnYLM59pTP/iuxx2arAhXTDzM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk+CFokCXbfJdHZDvl9tf6vIEwA2FzslAGoBKPp
 Oc1K6xGmLaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZPghaAAKCRD6PaqMvJYe
 9T5/EACdhK6JQxfvpEuxJvCJUGMLGH0HmTkskjXKOHSu8GP+jWWaX6Wej7OL3lseP+mgwsZ1rdF
 czvSpl6T/wz4jsi33q/DulRFdRhRBoWZC9aHb04aVly0Bw56yacSLTopc5IxhAg3WRELRIp/cG9
 d3DUSZqmM/mUK06NA3NJBA3DtTpjP1/YLTx8mJZSayb8PO+4twOup9j0KcLMnxgquPQazCZ6+qU
 uXbkVKsbV63W9bN90wKsi41j4GodGZBFKo99CPkNrnjcdmd3RZlGD/Pb69dHxiomrvqusgXgeXG
 smef56FS8G64Wj1pkiuKtGMyAD44dXH3u9tsR6hc6egs0DSX6pTmbp9U/XwLMH874UIaDLFxFAe
 FPII5ZCB6Xi6CVIdbzkQU74vRa1g8YHmWihp10IXFOAbZhPCvb4JMHBsSc9czzaDnTfEO67c7QY
 vM1kBkoooBGaLhrhMUpX2XWyud3zr0lH2ozTR2s0lVwYhwuZ0ACVT0ud83MUsu49zN4LDsHFnBO
 NA2qzL/2UiE3vBNIwlcATcptVccoquc1hsicBIFlkC55Afxag8b4rhF3y3/ekmsLRIq9OTjVaHC
 zTobQgqB4s6kTNfi4xxRU0cXg/kCilnvcZ8hNNKok3mRG2DdFLOD+CTKHSePuWA0ildpvr+pueM
 t2NpBxft2oi3W5Q==
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the TC358768 is a DPI to DSI bridge, the DSI side does not need to
define h/v sync polarities. This means that sometimes we have a mode
without defined sync polarities, which does not work on the DPI side.

Add a mode_fixup hook to default to positive sync polarities.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index bc97a837955b..963ac550509b 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -963,9 +963,27 @@ tc358768_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static bool tc358768_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	/* Default to positive sync */
+
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PHSYNC;
+
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PVSYNC;
+
+	return true;
+}
+
 static const struct drm_bridge_funcs tc358768_bridge_funcs = {
 	.attach = tc358768_bridge_attach,
 	.mode_valid = tc358768_bridge_mode_valid,
+	.mode_fixup = tc358768_mode_fixup,
 	.pre_enable = tc358768_bridge_pre_enable,
 	.enable = tc358768_bridge_enable,
 	.disable = tc358768_bridge_disable,

-- 
2.34.1

