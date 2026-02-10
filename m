Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAkmJq7ZimnrOAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:09:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D993117AEA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B6610E056;
	Tue, 10 Feb 2026 07:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="KlPHzmmY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A8D10E056
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 07:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FM
 bxibEYFrMDGfFtWBcP6R/RVAYLwcSBo/wvYjozpgk=; b=KlPHzmmY2Ni/BsU6Tt
 a+rKaPeSVcXeDsYi1dhY46iK0daePfa2OxOjiggVi7itB6rsRHZFAYzpSQv0Lkkq
 LQf7WD3UUs17f1rOMcfVpnEzLen0olF6Z0h+8KMuXb0yoZQ0c0R2ons+Wu7LXGig
 JDpVPlbxzi+ERUH9pY8FyHDyo=
Received: from ProDesk-480.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgBnPvpm2YppQ47COg--.67S2;
 Tue, 10 Feb 2026 15:08:28 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: andrzej.hajda@intel.com, airlied@gmail.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: Andy Yan <andyshrk@163.com>
Subject: [PATCH] drm/bridge: lt9611: Remove DRM_BRIDGE_OP_MODES flag
Date: Tue, 10 Feb 2026 15:08:05 +0800
Message-ID: <20260210070821.570062-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgBnPvpm2YppQ47COg--.67S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww15Kw4rJryxGr4UJrWrKrg_yoW8Jw48pF
 47Xa1S9F1UZF17KrWDAryDta17Ca1DKFW7uFyDW3ZYvr15uFWUurWqya45uFykWay3trnY
 yF10krW7J3Z2y37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRn0ePUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxg2O7GmK2W1RlAAA37
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
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:andyshrk@163.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[163.com:+];
	FREEMAIL_CC(0.00)[163.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1D993117AEA
X-Rspamd-Action: no action

According to the documentation: Bridges that set this flag shall
implement the &drm_bridge_funcs->get_modes callback.

But the lt9611 driver does not implement the get_modes callback,
so remove this flag.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 0628d8e737ab..d916784af1ea 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1149,9 +1149,8 @@ static int lt9611_probe(struct i2c_client *client)
 
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
-			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
-			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO |
-			     DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
+			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_HDMI |
+			     DRM_BRIDGE_OP_HDMI_AUDIO | DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
-- 
2.43.0

base-commit: 310326bb7df4bba094a3fc60364c641c547fd923
branch: drm-misc-next

