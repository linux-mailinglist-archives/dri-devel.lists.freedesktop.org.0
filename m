Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPmUCO50eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87A90FF1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3166E10E4D3;
	Tue, 27 Jan 2026 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="FvIG/ctt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 27 Jan 2026 07:03:54 UTC
Received: from mail-m3271.qiye.163.com (mail-m3271.qiye.163.com
 [220.197.32.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3381810E149
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 07:03:53 +0000 (UTC)
Received: from [127.0.1.1] (unknown [36.129.139.90])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3219cb6b6;
 Tue, 27 Jan 2026 14:58:48 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 27 Jan 2026 14:58:13 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use DSI port B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rubikpi-next-20260116-v1-3-0286c75150c5@thundersoft.com>
References: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
In-Reply-To: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769497120; l=874;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=iQeFSl9uFu9SYuWhe7ZE7oDkxvwKxI56/SIHXX7NCS4=;
 b=ozw6cgKjPRMaM15YTqNlVX9fhXev9DaKUhHTwkof7jfprQP79CWQ/ZxLzlz5WNeRgxXvug3aO
 n5W2t2jqgiEBbneHqb2wKoJ0un3WiUYnnl1/UOB/PZlqqNuhi63LZk7
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9bfe3f6c9109d5kunm45ebbc0d840bb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCThkZVk5JTx1LSx9IGExMH1YVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
 VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
 b=FvIG/cttWrhzrnN1h3yTjMFKzMlmKLQem1GXwjpJQVWydLGZLxztQW1MD8ZJIVuaNhYG6TLQUgRAQjlZOT1tKpVnCX5v1YuGE79YYqykSXgVAuAN7+ActZnxYTb4DlKc1Tsv/DCPmY9frQMWb5nFP7nzLSOWK+JebyD47qpEreA=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=hHtMcV8iObgzkyDHvyhdHK0yD4OWru5iEfX7HVh66Uk=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.39:email]
X-Rspamd-Queue-Id: AD87A90FF1
X-Rspamd-Action: no action

The LT9611 HDMI bridge on RubikPi3 is connected to DSI port B. Add
lontium,dsi-port-b property to configure the correct input port.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 0b64a0b91202..0b27c5343271 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -751,6 +751,8 @@ lt9611_codec: hdmi-bridge@39 {
 			    <&lt9611_rst_pin>;
 		pinctrl-names = "default";
 
+		lontium,dsi-port-b;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.43.0

