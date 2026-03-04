Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJsYJ7EAqGnynAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:51:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA61FDE91
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C8610E5F6;
	Wed,  4 Mar 2026 09:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="TU/rBlXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FD810E5F6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1772617900;
 bh=6RKYrl9uKKYeoPLwxT7m43ODsBqPn7Ulx0XyJQsA0lM=;
 h=From:To:Subject:Date:Message-Id;
 b=TU/rBlXAqSZoYWhGKECwttye+V8+/1Q72aer6AAryiXGvHsIpOmV4Ya3JNu+apNLu
 HRvZR+nBTXWLI2mFtaALzfEj3N/jDQiUzUgi0BPrkuzODFO9Ev2tl5TbK5L7PnxnEg
 gEydp/z5vuSc+TWZX4RUllCJLTAUg3ql31VvWeuI=
X-QQ-mid: esmtpsz11t1772617388tfeb4e152
X-QQ-Originating-IP: +aJbc9WVF6tbHYn3OXz/sefWHKyzghaWilNXBu+Q7Yo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 04 Mar 2026 17:43:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1682592045439921271
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
Subject: [PATCH v15 8/9] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Wed,  4 Mar 2026 17:41:51 +0800
Message-Id: <20260304094152.92-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NGX5+lQVxpC+QRxO863//DVpeI5nv89T/FXYjg0afjJZMC6KT6S7p0qU
 Lmi1ZeD6Xt6UeMA8FNfHf11RqFJheQJ2zVxHnE2AzdmauzlKzRSlGPDPJPu6o0upGDyL68r
 nUG1mwFQDVaeX2k11qwA9Y04gGd6vWIJxyGeMvJHt7OzMvEqwwA2Mx1MDCr1dA3iPmWkRe2
 5omUGc6lw/DWXAC82SzsL+N9v5gf/PBDGL/LPMvWRVx1LGtJKsl47DCD+MxVN4W4zQT6tkH
 beC2DeITK/UTAayhWLhcoZ7iLmxtZHgy8XOZffSMB3WWM63dL8Rl6dFo+JExA9J0P5vY4/k
 4IodYkFoiCoTmGDD+61ZY9tvo9swjeNJ6vKk6G5HiDyCYs64BscD+xZXKui2lkqfjAh01/m
 f9tU7SjVYy02CtwqzM+nGBagEkp8uwQiqkN3Fd/pNqptDBXznGjrbPIfnhchG3WfVdSRR5K
 LvBG1lioDQwdauLWRHfKsNhE3HEbk1OJyiGTttqeA704hx4gw9FILGFEB3NzoFEghY1PQbW
 GHTQzkht700OVL02xkOyAMxkiaX4aWrUh2zDbYaeru1attpWzO98z7xjG2pcTjZQ/eliqeL
 cBXv5YiZ2p6zufZ21hsDD2m3F/dkyg3YJSz8X2wwnffMMc9e53pW4szv7WiXjtxa/utcqfm
 dFpkx3faNrNWoyjLYRG34hgmRNZyO+qesO9V/KvP33s5OrZKpqtE7pwR24WgeF4EHUW/Y4l
 j+VXGyx73rRr2kAEbQvE7Uk35u5fIdZoeKIS7HbHU28eEW5e9iTXF7oYP2mfG1CgfL3xhQ/
 U+LLWo+yzXWrUMqsxbniewct78ahDOLVeFrLIF12JuZPxzYmFZoPCe/hmUuPCre6ZJ796bB
 l2bUOQkviDbI9XvZjLlSXs0V0JH9hm4wmib/8bDSYCW6xzkLMhXT/fBnFeKUxiOR4Xy2s55
 +c+tTfHkGldf/cZPsPEH60R95mjvg4N15Sc0d157DtXNxyGlfPxsZ/gEg7fhVnF+sRNXKxn
 Qn2a4gyTd7/TrtzmAmXAGPKIuQDGNH3muL+yKHIA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
X-Rspamd-Queue-Id: 15BA61FDE91
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,rock-chips.com:email,0.0.0.1:email,fec00000:email,airkyi.com:dkim,airkyi.com:mid]
X-Rspamd-Action: no action

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)
---

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..93b42820998f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";
 
 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};
 
-- 
2.51.1

