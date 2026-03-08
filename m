Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CzwEkXsrmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147B023C139
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBFA10E555;
	Mon,  9 Mar 2026 15:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="AJ7QOsxI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 54332 seconds by postgrey-1.36 at gabe;
 Sun, 08 Mar 2026 21:09:00 UTC
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6986B10E031
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1773004138; x=1773263338;
 bh=ZvbO2mKkFd2WPwXszQZjSCCrSJB0lBt+ZKoqwzQGlqc=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=AJ7QOsxIMsYxuP7ximH5lReAzsPliI1xPxxFlLDTuHrQCcaUA3FWtocnZMcg2IWHP
 Yt0TrXWgqBmPGQVKBV/43750o+P6vEj/d+fxYG9/mGnDqbOM2IJ21Ip87pFFBV55Zb
 TT9RRMcB2pwuSbeXPtnib56qsyKhYBeYsOVHtY8xPJMwbCYPoCC3m7knM5TWugAT8B
 drpvaA9dF03MxzUqu922aId1V0bGxlKSEsj7hECJ31M55RJlSGgw5wR2FrDaC+/Wuf
 BgRb64nsSC8XO0eNfGq6FeUxMXXhCBerHZ3mmE3clHxqwfo810oUIktTfAAs/r/ux5
 oOi9IcKT/kL7w==
Date: Sun, 08 Mar 2026 21:08:54 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add support for Tianma TA066VVHM03 DSI panel
Message-ID: <20260308-tianma-ta066vvhm03-v2-0-5f2344685133@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8bcc0548fb21c8015f383be9d4775c96812b6412
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Mar 2026 15:50:13 +0000
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
X-Rspamd-Queue-Id: 147B023C139
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
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akoskovich@pm.me,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.990];
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
Changes in v2:
- Move additionalProperties after required block in bindings
- Link to v1: https://lore.kernel.org/r/20260308-tianma-ta066vvhm03-v1-0-86=
9fac443b20@pm.me

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


