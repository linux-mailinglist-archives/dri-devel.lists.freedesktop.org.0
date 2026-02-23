Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJDdNtMbnGlF/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:20:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F49173C87
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D3310E2BB;
	Mon, 23 Feb 2026 09:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M813Eax0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44E010E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F6486011F;
 Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD00CC116C6;
 Mon, 23 Feb 2026 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771838413;
 bh=a8y9ien3dgTnIN1+y6wyUKNJA/hUgzMlmJd31F1z9wM=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=M813Eax046KfvZ3SZYHbdp3BAkbC2VJztwEMp1LA//8HgukqgashDevmHXvdJvciI
 xailhyQasJBZOK/+SsMSrHuFqxjwPsXmFuRIDr/cJIwPIPT0yY1sg/FKYOumhx2KbM
 qbSf9qxtzVMyJ37hhoIqhOcvGXljD3U6KCQDmI6KL2hpHaSHzWGtH22QV5wT/zj/v/
 I8j3NIouHbrvcPnKWgjToGeHASjb7RkDrB+PpkTygt7oo6MdUjTX/2MV53IQWtyOND
 sF42+ezzKw3PsH2bS9SPHgbvAl57GS7SAjUUbxv02En6mAyZYkBkbCJypidGMi9YY2
 YP9iSKWFoBoFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B8DDCE98DFF;
 Mon, 23 Feb 2026 09:20:13 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH 0/3] Add ITE IT6162 MIPI DSI to HDMI bridge driver
Date: Mon, 23 Feb 2026 17:20:44 +0800
Message-Id: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwbnGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3dKC4pKi1MRcXTNDMyNdY3NTw1Rzi5S05MQUJaCegqLUtMwKsHn
 RsbW1AECYdJhfAAAA
X-Change-ID: 20260223-upstream-6162-3751e78dfcad
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771838463; l=1356;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=a8y9ien3dgTnIN1+y6wyUKNJA/hUgzMlmJd31F1z9wM=;
 b=U2VuZKFI4x72JUvV8RdMVHxPXE4vHWpvZ53F3EdDBmVeKoBSHCx8jbAb5XOcfBcyLnY3XVKgR
 /60M7RfPcsHA/cxEjvBct7l3E7YEoHqrt01mHuNvVM+vFTruz8bNOub
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ite.com.tw:mid,ite.com.tw:email,ite.com.tw:replyto]
X-Rspamd-Queue-Id: 91F49173C87
X-Rspamd-Action: no action

This patch series adds support for the ITE IT6162 MIPI DSI to HDMI
bridge chip. The IT6162 is an I2C-controlled bridge that receives MIPI
DSI input and outputs HDMI signals.

The device supports the following configurations:
  - Single MIPI DSI input: up to 4K @ 30Hz
  - Dual MIPI DSI input (combined): up to 4K @ 60Hz

This series introduces:
  - dt-bindings: Add YAML binding document for ITE IT6162
  - drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge driver
  - MAINTAINERS: Add entry for ITE IT6162 bridge driver

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Hermes Wu (3):
      drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge driver
      dt-bindings: display: bridge: Add ITE IT6162 MIPI DSI to HDMI bridge
      MAINTAINERS: Add entry for ITE IT6162 MIPI DSI to HDMI bridge driver

 .../bindings/display/bridge/ite,it6162.yaml        |  156 ++
 MAINTAINERS                                        |    8 +
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it6162.c                | 1876 ++++++++++++++++++++
 5 files changed, 2058 insertions(+)
---
base-commit: 38feb171b3f92d77e8061fafb5ddfffc2c13b672
change-id: 20260223-upstream-6162-3751e78dfcad

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


