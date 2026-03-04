Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PSZK7gAqGkRnQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:51:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BF1FDEB1
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7613510E996;
	Wed,  4 Mar 2026 09:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="KcNmD65u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 501 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2026 09:51:48 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712AC10E996
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1772617902;
 bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=;
 h=From:To:Subject:Date:Message-Id;
 b=KcNmD65uWfaBhSC1qEnrT4YCJSeyIWdRY3dH18gcIwTIm0DvrOqmJRGzNLvO6NqdV
 Me6Xra6P2Z0rWi30Xn/B3Hyu83XH9LXI22vA79mQlyWdXyxybV5fbcPtR3WVvCuEQn
 i79p01otBWbsnVSysO9QampkclJ4hJhvNk9Q2o1U=
X-QQ-mid: esmtpsz11t1772617346t06159e3c
X-QQ-Originating-IP: nbNoMgw+sJlbtFbTwzXrCmqsHBTzGYwt94vd+Sw6pgk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 04 Mar 2026 17:42:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5088075739087231184
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 3/9] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode-switch
Date: Wed,  4 Mar 2026 17:41:46 +0800
Message-Id: <20260304094152.92-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NMuAyYK0STFJhJgnwMokaUK4cPitEEj53Z3XQDMvzV+hxjLqS7gJhyQP
 6RO7VMD0QVLLbaALhOqohcbQS7rcOTc5QnOMdqhZ5hwikqt3XlmzNX5zIDhNFMhj1QVEi0N
 ahQsUc5jsngi9IGZ18GerALMHhYEsEuNzfCAZFHTTZiXSeEon1pLVfgzzjr6pec6QVluDjf
 lMAkFp4WUOnHdVogoHi0DEyszJImIUUQsXA06dbRxAfWD71D1l1hFIvhSfVRqJljmU1jEwI
 ti72istEEeTUrAR5Zcjmrq+ZQ9QEVV88lsHa9/L+9vXNlA2eVh9CXDlUnnj9ZTrtr8NlTSC
 jeA5izOr5Y96ijE5brA8QvJ/kg5XRCSyoqUI2+SdIHLhCzQstv22DLq5vtPFomOtwPCqKWJ
 WfcwoZVWISd+UAEcoo/o93eLT44kk1GrK6PmaFBbmEjmEq+zghlLCby3/JZTagPxnZdxvar
 4hFeNUJXGK6vnXyOiXWv4jvtfkwY+5AwI4ia5X/bU1qu3FZ1MyWWYEUy+S0gKtX+hZQYQGh
 9HhhcuTpLMn9OvZfZe7JQVU4PGIBUZUvXX/dLpurJdiTDNHeICIAVgkiAY5iNx2b9NPfbV5
 jqhm3iNR4xUc9sMW3OzPSpFsQvypX9fOcL/A/VtMJeo9LR8dHqHwg+4qjaiG9d51bPm9TIB
 2zBp+9lzqGZjgaCxQ2EXQCyVvX522aimxUyk9+PVWd060o1rs0/go9PHW7qfbtFkqRu4so6
 bSKnSLCkqxwn1Q2FOMVM5JrmYbTyvkfQJ9Elpg6AGppOL0GtrmffNteEC8GHiiCYZFogQNA
 YHGc7i72bFGLc5fl6G0EADjQgWgrWkwbcFkauWR2zrvqJCTo5srYdVP4I2HLRVJ+m2f1j6L
 oYyHFYfIbdJIQL3eABZwzSwDuEcBrr16tYwt3QJyjX7wjF2b5jG9NQ6sXWF0k+zspU/HrpZ
 9QSKeJGZ8UOYfHCcuEShL69v1e5lYntRnPUP+7t9AubCZmhyejiLDuZkniynn7Fkj6Vlz9a
 vbwMuLzL73SNcxGn/0OjGxyfEc/24=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
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
X-Rspamd-Queue-Id: 5F6BF1FDEB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[airkyi.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[airkyi.com:s=altu2504];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:hzpeterchen@gmail.com,m:luca.ceresoli@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:heiko@sntech.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:yubing.zhang@rock-chips.com,m:frank.wang@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:amitsd@google.com,m:dsimic@manjaro.org,m:jbx6244@gmail.com,m:didi.debian@cknow.org,m:pbrobinson@gmail.com,m:sigmaris@gmail.com,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:c
 haoyi.chen@rock-chips.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[kernel@airkyi.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	DKIM_TRACE(0.00)[airkyi.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernel@airkyi.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,airkyi.com:dkim,airkyi.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,rock-chips.com:email]
X-Rspamd-Action: no action

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 SoC integrates two USB/DP combo PHYs, each of which
supports software-configurable pin mapping and DisplayPort lane
assignment. These capabilities enable the PHY itself to handle both
mode switching and orientation switching, based on the Type-C plug
orientation and USB PD negotiation results.

While an external Type-C controller is still required to detect cable
attachment and report USB PD events, the actual mode and orientation
switching is performed internally by the PHY through software
configuration. This allows the PHY to act as a Type-C multiplexer for
both data role and DP altmode configuration.

To reflect this hardware design, this patch introduces a new
"mode-switch" property for the dp-port node in the device tree bindings.
This property indicates that the connected PHY is capable of handling
Type-C mode switching itself.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v5)

Changes in v4:
- Remove "|" in description.

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
---

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..83ebcde096ea 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description:
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.51.1

