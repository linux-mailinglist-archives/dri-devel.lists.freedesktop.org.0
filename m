Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIvmHKWAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6EF106CF1
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9016610E2A0;
	Sat,  7 Feb 2026 18:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="T18FM7MY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49235.qiye.163.com (mail-m49235.qiye.163.com
 [45.254.49.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8112510E034
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 07:33:47 +0000 (UTC)
Received: from [127.0.1.1] (unknown [113.235.123.225])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3372cf673;
 Sat, 7 Feb 2026 15:33:43 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sat, 07 Feb 2026 15:32:56 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI
 Port B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-rubikpi-next-20260116-v3-3-23b9aa189a3a@thundersoft.com>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449616; l=1237;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=fu44a5Nrxbaq/3c0j5h6mH4JXqEVTeb6HUHM1eNJgRw=;
 b=6qEdGRUjpCqCxVgstf+KZM5Uoe1GS1Woa/pKvR1KbJ4154JVS1V4zrzCUm1hynVcyv7hz91Qt
 hBsdjSiYJ/FBcL//q1YotBFuUFiE9r//VkUimUKPYnGpNW7qvYJl0fb
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9c37055a9309d5kunm3723250e7f3099
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhhIVh4YH0geSk9NTENDTFYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJSFVJSU5ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
 tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=T18FM7MYhSpJCc2lBBDqfKUsDq+3tK+Mt0vkQ3CafLPRoQNENHjyBQvQpQvVhkziOLtAXmXxLVUErakQ7UvtlSfVDMT+yq9HS66yLVFzinf3U9C5NyS54vNaYUCXw1p/njRpdwtLzthj0IDb9T8tcN5T+frMrW8JpUm10ZeRg1Q=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=rNJm1pw1MJ+tDs+OiCb0O6LZDD2uJo+8H3bMNDp7wN0=;
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
	NEURAL_HAM(-0.00)[-0.930];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.1:email,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 1B6EF106CF1
X-Rspamd-Action: no action

The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
Port B. Update the devicetree to use port@1 which corresponds to
Port B input on the LT9611.

Fixes: f055a39f6874 ("arm64: dts: qcom: Add qcs6490-rubikpi3 board dts")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 0b64a0b91202..f47efca42d48 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -755,10 +755,10 @@ ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			port@0 {
-				reg = <0>;
+			port@1 {
+				reg = <1>;
 
-				lt9611_a: endpoint {
+				lt9611_b: endpoint {
 					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
@@ -801,7 +801,7 @@ &mdss_dsi {
 };
 
 &mdss_dsi0_out {
-	remote-endpoint = <&lt9611_a>;
+	remote-endpoint = <&lt9611_b>;
 	data-lanes = <0 1 2 3>;
 };
 

-- 
2.43.0

