Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B3AAF3F9
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 08:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0594D10E8BF;
	Thu,  8 May 2025 06:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="EIBFFjXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 96370 seconds by postgrey-1.36 at gabe;
 Thu, 08 May 2025 06:44:16 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19D510E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 06:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1746686614;
 bh=QyDFhO8OtjpTCJbTfPuoHwFDRMlY45kLnroWzhMw0+o=;
 h=From:To:Subject:Date:Message-Id;
 b=EIBFFjXcS1XhvSE80uXG9ACdOd1Elnc6pazPCFetlfV1srzr2i5Pp2jHvYO85xQ2o
 g2+Gn9I25Sv4trSTf4HSVZosb3BAY08/G5CXxC+71niwt3Vm9WS9Z82NMpiIi9GSDM
 drJA8tOiWy0FQUUgG2XO3ss7g2Or8RoP3k0XRpck=
X-QQ-mid: esmtpsz18t1746686612te3481210
X-QQ-Originating-IP: zbzDiNl3M4Ey2lstqT3s4mpmSf/C2+GYcEOzllnANXk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 08 May 2025 14:43:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 997468467344160860
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: rockchip: Improve coding style for rk3399
 cdn_dp
Date: Thu,  8 May 2025 14:43:03 +0800
Message-Id: <20250508064304.670-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250508064304.670-1-kernel@airkyi.com>
References: <20250508064304.670-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NVonmnRjmRvhk4OsFKw7WpSYgKXhGQbz491Ofm8wDKqRVhLXcKB2Xsld
 U4atBlTofTVism+iTU7osQX0oL9yKD6p2JveJeCfi1xd0oecpbKs2fWSVj7ePNBUk8QmbKE
 jHIEw96lC2OcEljmS3kpskRXoLJvzuo1F+kC7BOsyQHK8gkDmYWPctaid2cUO8Q7eGRucMO
 2KxDn8B267ZS6vMl3RByBH4u8wo++u2xUYcYj4cJzpuuZdm8XSx0ACPx1AYelNMivQIHotm
 w66GIUli/LjYYzYY7SspiX85ulFhVqAYXQsZY/gB9UY4u5OQyg6VwvIwMGkQf6gAdRyYsX/
 3DGGDjQCVT5Dy8F6XcZK8NCfsMmdahPw5VHYSvLi9Sn8qj5LsZ0FGu1gma2vBfUtWFruHPl
 /IxoJYf29GkmsnOp9z0uZsXXRxIWvhfDqVXMN+Tfs4A0vscRGYjpaN603roetxaXiA9cwgC
 rnqXHJzdpO4LNfDmPaKTN9fgSk0YkiKPJPDkYLTMaRLRvMBwK4qnhsyTP88HRWtnTVNMzGs
 0mhciMl7ttyxEcotEVoL87QlTjhtTuYJwk3KAWjKJC+H2lvg/Fkl5n0F9SqiIWFlg4A7XvE
 BQ0T/V1tEqpyQ+PfGOpkPut8LLaBiKcwEEFNqUGNROG24kiAKY3GJ72sjy6Yv6b6XbYISa9
 b09F0zj45gW7Z0hjBSGlM8djRRKJSuNhHNvQ8C7P42kYGdEErc1FoWF9ovtMFp1YxajPRqI
 3LX4YvRNJGUnoDbkLsLbE1Wym+2nEC63Ipk/Vv7PZxjB9JUX0ReKHPYXwf6u6isjrChPwHb
 yngR7mC3QO29rmJ0lcaytxGI0F22TQekVy1/w8xpjr/jdlhZCgdBr6ki1I+QKcLHu/GavVn
 AdaoN9IvXFTb/BtGNqQB5Kws/5nLP+i0paaoYBkm3K9uWMV4jVkJgvxN12AW1StGBFSbNA/
 FHzJIWUfPkUrkV6qbRpzVKJFU
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 9d5f5b083e3c..e340b6df7445 100644
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
2.49.0

