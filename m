Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOIqHtQbnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:20:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE55173C90
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C8410E2BF;
	Mon, 23 Feb 2026 09:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pRVKpH20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4144D10E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:20:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 76C156012A;
 Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20CDDC2BCB1;
 Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771838414;
 bh=x5oJC0JF9ahf+RJMA/MKnHMgRb/07hrrsXN30fKx62I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=pRVKpH20yQ81n5c8XY9LOC/rX3GRqMFQ8EqLBGjVcYmxNF55uHTV9+plB3ce5h8Jc
 UKK9UkcuzVwhQjs4FAYbr8DkoGPfDgif5Cc1sd0kSNdKuaEWk7irFXpO7T3F9/xiu8
 2TxJnDEEqeL/rPpSruarRXdINCD3PB5TiJfexIi9o+dpqS4+sg0/uumLh0GGMYL4px
 7C1ljmKn2gLBLAXhmvPlNvDUKVeKdvu08E7/KzZnr62x6Izg2fLziMfBmEj6dT3uZi
 r7aEmnNAwjJBhBai2gfdxUpbE2C9HqU41dx4apL00rQ+5hx8pUVaeQzez4n51T5Jt8
 1uOGKB1A4lxeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0C128E98E0F;
 Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Mon, 23 Feb 2026 17:20:47 +0800
Subject: [PATCH 3/3] MAINTAINERS: Add entry for ITE IT6162 MIPI DSI to HDMI
 bridge driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-upstream-6162-v1-3-ebcc66ccb1fe@ite.com.tw>
References: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
In-Reply-To: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, 
 Hermes Wu <Hermes.Wu@ite.com.tw>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771838463; l=984;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=FdNsL/OMQyTMBlZBr9eAfG0tA5xv05jqhySorqcp6Xs=;
 b=0HzTZgSkEC3qmk/LtTETSg9W2/WoK9wKwZ0hreljJRs1MtiuDSESV58tmJ2Bf/GLMYjpgWdup
 Ex8tPS1RSd5Cs/+4Qpum33A6Me8ieIPAdBXFaDovncdROTYuoWdci9h
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Pet.Weng@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:Hermes.Wu@ite.com.tw,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Hermes.wu@ite.com.tw,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[Hermes.wu.ite.com.tw];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[Hermes.wu@ite.com.tw];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,nxp.com:email,ite.com.tw:mid,ite.com.tw:email,ite.com.tw:replyto]
X-Rspamd-Queue-Id: 4EE55173C90
X-Rspamd-Action: no action

From: Hermes Wu <Hermes.wu@ite.com.tw>

Add a MAINTAINERS entry for the newly introduced ITE IT6162 MIPI DSI
to HDMI bridge driver, covering the driver source file and the
device tree binding document.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6169bd4d7baccc6945363622b42e7286cbec7b88..8a6b5bf3f664247b45c66b37439d3debf6ee18b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13485,6 +13485,14 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/tuners/it913x*
 
+ITE IT6162 MIPI DSI TO HDMI BRIDGE DRIVER
+M:	Hermes Wu <Hermes.wu@ite.com.tw>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/ite,it6162.yaml
+F:	drivers/gpu/drm/bridge/ite-it6162.c
+
+
 ITE IT6263 LVDS TO HDMI BRIDGE DRIVER
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org

-- 
2.34.1


