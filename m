Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vDrrHH8Jk2ni1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:11:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3851433D6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2A510E303;
	Mon, 16 Feb 2026 12:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="otmyubET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2BE10E303
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 12:11:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23ED7600B0;
 Mon, 16 Feb 2026 12:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB22C116C6;
 Mon, 16 Feb 2026 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771243897;
 bh=wRq2grofCoWFOhLfprvW5OhmmGODZ2PIdA3cRAlGVnM=;
 h=From:To:Cc:Subject:Date:From;
 b=otmyubET1PAdyDNae/O+P2ZZf04KqdaJNnz3msSLuJaVEcnJphipWUdkb18MXqBZr
 SbB3++Xew3am9qViJRaYweIrPrf0qRFi5WcFFG2JhvGWNRBGWIsGG0nK9EL62FLyff
 95EN6FD5vtLTLzZzEdlBa9gu6BkK7qY2foO7yOP0wnstwtl3KCH7zeCnXTmBG6dUMV
 c3bZSBopAl+lyCunFy3GUCwaqWpETax1vrEmsdVAgd5lNpej2hTXEMFLD0Y5yY70rD
 bURRRHLAFs1qMvyLnkitPSbqeVjlDmiGwcd18z1lq5EslgUVAXN6lzgVIee9Qixu/x
 3NYOK+jPvpeBA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Eric Biggers <ebiggers@kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Joseph Guo <qijian.guo@nxp.com>, Chia-I Wu <olvaffe@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: select
 CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER
Date: Mon, 16 Feb 2026 13:11:25 +0100
Message-Id: <20260216121129.2057091-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:arnd@arndb.de,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:wenst@chromium.org,m:ebiggers@kernel.org,m:andy.yan@rock-chips.com,m:clamor95@gmail.com,m:qijian.guo@nxp.com,m:olvaffe@gmail.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,ideasonboard.com,kwiboo.se,gmail.com,chromium.org,kernel.org,rock-chips.com,nxp.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DE3851433D6
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

The audio helpers are now a dependency, causing the build to fail
when the Kconfig symbol is turned off:

lontium-lt9611uxc.o: in function `lt9611uxc_bridge_hpd_notify':
lontium-lt9611uxc.c:(.text+0x316): undefined reference to `drm_connector_hdmi_audio_plugged_notify'
lontium-lt9611uxc.c:(.text+0x332): undefined reference to `drm_connector_hdmi_audio_plugged_notify'
lontium-lt9611uxc.o: in function `lt9611uxc_bridge_hpd_notify':
lontium-lt9611uxc.c:(.text.lt9611uxc_bridge_hpd_notify+0x24): undefined reference to `drm_connector_hdmi_audio_plugged_notify'

Fixes: c08c123d4cd6 ("drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 39385deafc68..2fc4f0b90443 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -181,6 +181,7 @@ config DRM_LONTIUM_LT9611UXC
 	tristate "Lontium LT9611UXC DSI/HDMI bridge"
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	depends on OF
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
-- 
2.39.5

