Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPRcGMEkemkO3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AFA36B4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21BA10E713;
	Wed, 28 Jan 2026 15:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="MFYCfZUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com
 [220.197.32.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9612810E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:16:20 +0000 (UTC)
Received: from [127.0.1.1] (unknown [36.129.139.90])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3248e5331;
 Wed, 28 Jan 2026 19:16:14 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v2 0/3] Add DSI Port B input support for LT9611 HDMI bridge
Date: Wed, 28 Jan 2026 19:15:44 +0800
Message-Id: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODveWkC/4WNQQ6CMBBFr0Jm7Zi2sSCuuIdhAWWQibElbWkwh
 Ltb8QAu30v++xsE8kwBbsUGnhIHdjaDOhVgps4+CHnIDEqoUkhVoV96fs6MltaIPytLrGsjh54
 6LegCeTt7Gnk9uvc288QhOv8+bpL82n/FJFGgUNfSVFpqYXQTp8UO5IMb49m4F7T7vn8A+lgnY
 sAAAAA=
X-Change-ID: 20260127-rubikpi-next-20260116-99c1dbea50e4
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769598974; l=1696;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=G1tLy3X0pwUTp+0XP3NmSu8ewIiqb6AxewUvTdt+hJM=;
 b=vf2MSsYcsOxNjRStcrpHi98KqMLbB2Faz4kdRCa1x6yey/Btdox/izOle3IoH6Q54zMqQg0y1
 jcCqor0GfeYDyqKT+iaUQ/P3zs0jOn80BFoKMlaQHX2z1FqmigGKqWq
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9c0451790409d5kunm18b1b2c5170b8b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR0eVhpKSR9CSkwaQkIfSFYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
 VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
 b=MFYCfZUiC6KzcaSy3J2EJCsGDhNkSjSpJfCiwHWr24eZbHi6McB6cobj4YU+idEXc6EXV2WgpGrFIyzItfDjE967kzzyD7JBnx3NEgHgKj0o+Ta5/brrWUz6oARL7favi5sWQZ7W4YdS/dwVt+x1XCVjkFK6616a6P1iA0LVsCk=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=pwZ05mi6UL/CMOflFU3AdlhoHrzqDcS6IyaCree00ZE=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Wed, 28 Jan 2026 15:01:07 +0000
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
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	RSPAMD_URIBL_FAIL(0.00)[thundersoft.com:query timed out];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[3];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[thundersoft.com:s=default];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DMARC_POLICY_ALLOW(0.00)[thundersoft.com,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.1:email,0.0.0.0:email]
X-Rspamd-Queue-Id: D26AFA36B4
X-Rspamd-Action: add header
X-Spam: Yes

The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
The current driver only supports Port A or dual-port (A+B) mode, but
some boards like RubikPi3 connect DSI to Port B only.

This series adds support for using DSI Port B as the input source by
utilizing the existing ports mechanism in devicetree:

- port@0 corresponds to LT9611 DSI Port A input
- port@1 corresponds to LT9611 DSI Port B input

The driver detects which ports are populated and configures the hardware
accordingly. When only port@1 is present, it configures port swap
(register 0x8303 bit 6) and byte_clk source (register 0x8250 bit 3:2)
for Port B operation.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Changes in v2:
- Use ports mechanism instead of boolean property
- port@0 corresponds to LT9611 Port A, port@1 to Port B
- Driver detects which port is populated and configures accordingly
- Link to v1: https://lore.kernel.org/r/20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com

---
Hongyang Zhao (3):
      dt-bindings: display: lt9611: Support single Port B input
      drm/bridge: lt9611: Add support for single Port B input
      arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B

 .../bindings/display/bridge/lontium,lt9611.yaml    | 15 +++++--
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  8 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 46 +++++++++++++++-------
 3 files changed, 47 insertions(+), 22 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260127-rubikpi-next-20260116-99c1dbea50e4

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

