Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKeCJ5iGrWnZ3wEAu9opvQ:T3
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB56230AD5
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299E10E3AE;
	Sun,  8 Mar 2026 14:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="LqKj8Duw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC5510E062
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 06:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1772949806; x=1773209006;
 bh=NFz/ADbf6pESwwM27NmyYlJClVBpWvvDg479laeIfdU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=LqKj8Duww0BqsqZK5wq4gj7+rfZH7UYnlKJ8gaJ7wdGwA77xQHqPIUABgZWMctExN
 o0p3GKtha7OHpUxAfVWEZ3GR/oB/2Zda1ZBdxTAxl7WyfgEorFqB2zUOF316L0sxpD
 yKnNH97XRwsebzI4je3bioax3CGC4Ey3I18GYhQJDYtOVshKOn2EHESUHaZsLUXJx4
 3ovRkcB9GxGBadVaE24LWY/l0n2CcyvWMJOU9zgcTJhLYuIN16JyRTCQeibRIyzNa9
 UgiMckh+mQpIFxbcRhpdKpJOTHtO//4YxwOjLrrNXgI+sAzHXC8Sz4swi8qSs3gcxq
 vhiVuK7m7HmDQ==
Date: Sun, 08 Mar 2026 06:03:22 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] Add support for Tianma TA066VVHM03 DSI panel
Message-ID: <20260308-tianma-ta066vvhm03-v1-0-869fac443b20@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ec8bcfedb72faacdb2594220ccb0e3698349f9d4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 9FB56230AD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akoskovich@pm.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

Add dt-binding and driver for the Tianma TA066VVHM03 6.59" 1080x2340
AMOLED DSI panel with DSC compression, found in the ASUS ROG Phone 3.

This panel depends on slice_per_pkt support currently being reviewed:
https://lore.kernel.org/linux-arm-msm/20251001135914.13754-3-caojunjie650@g=
mail.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: display: panel: Document Tianma TA066VVHM03
      drm/panel: Add support for Tianma TA066VVHM03 panel

 .../bindings/display/panel/tianma,ta066vvhm03.yaml |  67 ++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c   | 387 +++++++++++++++++=
++++
 5 files changed, 472 insertions(+)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260308-tianma-ta066vvhm03-a72bd18f2b3f

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


