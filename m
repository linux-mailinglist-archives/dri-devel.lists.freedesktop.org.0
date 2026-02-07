Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJzrM6aAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E31106CF8
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C7610E29F;
	Sat,  7 Feb 2026 18:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="No0SgX4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731115.qiye.163.com (mail-m19731115.qiye.163.com
 [220.197.31.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648AC10E034
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 07:33:41 +0000 (UTC)
Received: from [127.0.1.1] (unknown [113.235.123.225])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3372cf65d;
 Sat, 7 Feb 2026 15:33:36 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v3 0/3] Add DSI Port B input support for LT9611 HDMI bridge
Date: Sat, 07 Feb 2026 15:32:53 +0800
Message-Id: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKXqhmkC/4XNTQ7CIBCG4as0rMXAKP1x5T2MiwJTS4zQACU1T
 e8urRsTY1y+XzLPzCSgNxjIqZiJx2SCcTbHYVcQ1bf2htTo3AQYlIxDRf0ozX0w1OIU6XvlJW0
 axbXEVjA8knw7eOzMtLmXa+7ehOj8c3uT+Lr+ExOnjDKoS1UJLpgS59iPVqMProt75R5kdRN8W
 vUvC7IlW8EV1hqkhm9rWZYX8790qQwBAAA=
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
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449616; l=1956;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=bDP3hx0259pprjh+K2o5PYpEoQCe2saFDVKumA7/C9A=;
 b=eetxF5m3iGkUNwCp/TkyTHsix9a8PMxhFPpOO5nYZ6xEAGzyAZ4KwkCh1z7NA1joPPXGOWPPZ
 HyS9SwA32JqCMiP3Y7cLkfzAf0l57CaxawWkh3qz7rGxUBty/oSjdnQ
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9c37053cb009d5kunm3723250e7f3055
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh1OVhpNQhlMGUNOGhkaGVYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJSFVJSU5ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
 tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=No0SgX4SD3TvjSIs1OmDLkBosQ9BsOhjElWSp1RpBWyjnaP7DswSaACfl0Vcevl28l9hzAXIiAbPCxnrNpHP5VmHwj5vfHEmuuXJDjIhqzRtHn8v459jU7/Dtsv0D0PABoGzFWE5whYGYyJ+UCWxXIOgqB5/dvjKOTd5jkt9lNM=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=/A8bo6qfto91b4n9cieuLRsSkhHM9gJRuxTe8hTLdC8=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Sat, 07 Feb 2026 18:12:44 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:christopher.obbard@linaro.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:konrad.dybcio@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,0.0.0.1:email,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 39E31106CF8
X-Rspamd-Action: no action

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
Changes in v3:
- v2 incorporates significant changes based on Neil's review of v1,
  so remove Roger’s Reviewed-by tag from the v2 commit message.
- Link to v2: https://patch.msgid.link/20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com

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

