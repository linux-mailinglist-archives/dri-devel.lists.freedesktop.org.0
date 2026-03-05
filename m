Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPW+J2hHqWnw3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:05:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7C20DF76
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB5C10EBC4;
	Thu,  5 Mar 2026 09:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DqJjjIiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F0310EBC2;
 Thu,  5 Mar 2026 09:05:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2C0A41E51;
 Thu,  5 Mar 2026 09:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B351C116C6;
 Thu,  5 Mar 2026 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772701540;
 bh=YVQvpGLZ5wA3mAnHs4fX4YhU+wAN3umweSoHZOXTpbw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DqJjjIiUo7T8edAXBOy6y0f/LpuRACzvTfloTKVQvZ/hiW25Tp6oa+klH4oASgy91
 o7Jld+9r4aPNEGBwcW2D+ctohbwbnJEma8GQrAQGspXp6cWgBeYpY2PCt0W2l3SEiL
 9qUeXThFkRcZF35TPeqfSSi+2kr+Jx1jeJZFvNvgOubTITJYCQhFcz3x8recvCBsL9
 EGWX/674Y9Yg73VV7weFCbgpJOonW0v2IQvCmstHSbq5xEM7FQQdLRwdejXC4Lktnt
 cOmE2v1d4Hr+gjDRsuCfCKMI+y2JI6t0bI0NL7QbjfWf8bE7Pk9TI9Eb4RXZQCdk+l
 gbPB5cxRjEaTg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:05:05 +0100
Subject: [PATCH v3 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YVQvpGLZ5wA3mAnHs4fX4YhU+wAN3umweSoHZOXTpbw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3W12NxfszUkUeOctufRV1teZQrZlhVXHimtM0qbHP
 Pnh2bChYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEcBljrWRd4qTFa1K3rWO0
 CFqkP/XC7Ql2y+7E91/S6DjNbmKen+qxpKU50PP1ZdWUGXfXy7e0MDYcni6qlGbAv+eTZcrcham
 nYrKjCg06nsd+lbgTXFqk/n6Lc2RE0/+T6ypWPbtR+vJflx4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
X-Rspamd-Queue-Id: 50F7C20DF76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,sntech.de,nxp.com,sholland.org,raspberrypi.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Action: no action

Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
the new enum, we can get rid of those defines.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 227f6190438679104f5336be088a73f4529c15fa..562f6da90facdacc98307c50177792e26f2dece6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -722,15 +722,10 @@ struct drm_display_info {
 	/**
 	 * @subpixel_order: Subpixel order of LCD panels.
 	 */
 	enum subpixel_order subpixel_order;
 
-#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
-#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
-#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
-#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
-
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
 	 * indicating the orientation of the panel vs the device's casing.
 	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
 	 * When not UNKNOWN this gets used by the drm_fb_helpers to rotate the

-- 
2.53.0

