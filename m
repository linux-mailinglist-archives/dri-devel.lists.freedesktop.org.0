Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECC64D8247
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 13:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FF210E5CB;
	Mon, 14 Mar 2022 12:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BF610E38C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hx/o3sUmjfaB0QS0sBoTV1A1xLaFjk7pvkOF4evSYgo=;
 b=Qic/F0v68Rvktz0feHj/1yYFO5ESBbuh8nZm6Nh+x/En/If3rnHwB+Z+
 1+dxponU+nxApNDnXdclRlBijjpqoQg4YJGi2xXE3TkdBI2jMTfFzqRzJ
 +rmRmb1beAj6GEYKfMj7jPxlY9M7MDZ50aBzziV3zdRNEv3jsscw4lB6K g=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,180,1643670000"; d="scan'208";a="25997338"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:53:59 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 06/30] drm/bridge: analogix_dp: fix typos in comments
Date: Mon, 14 Mar 2022 12:53:30 +0100
Message-Id: <20220314115354.144023-7-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index eb590fb8e8d0..c719cd5fba77 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -567,7 +567,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 	analogix_dp_get_adjust_training_lane(dp, adjust_request);
 
 	if (!analogix_dp_channel_eq_ok(link_status, link_align, lane_count)) {
-		/* traing pattern Set to Normal */
+		/* training pattern Set to Normal */
 		retval = analogix_dp_training_pattern_dis(dp);
 		if (retval < 0)
 			return retval;
@@ -1254,7 +1254,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 	/*
 	 * NOTE: the connector registration is implemented in analogix
 	 * platform driver, that to say connector would be exist after
-	 * plat_data->attch return, that's why we record the connector
+	 * plat_data->attach return, that's why we record the connector
 	 * point after plat attached.
 	 */
 	if (dp->plat_data->attach) {

