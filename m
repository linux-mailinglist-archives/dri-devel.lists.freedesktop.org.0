Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F321ABB2D7
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 03:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82F710E213;
	Mon, 19 May 2025 01:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="JzpXc7yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.73.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E4D10E213
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1747618028;
 bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
 h=From:To:Subject:Date:Message-Id;
 b=JzpXc7yi1gszkPORq5gql/79ac1DCzYJwxj725HfKeq7wizljNyPSA9S/MplXGsCK
 EvIXISMeOjrjWmFA6UEq+A50h99e6DqQeVmKMOoLkxfZ0VEPF14fD03PQB/TNyocsL
 7DTqskwDJnE8yIPza+lOUx9CH6lq+nYIGqwdXFHY=
X-QQ-mid: zesmtpgz7t1747618026t16ca58f6
X-QQ-Originating-IP: j6BCwtD4SfAxd4NPvSFyjN9YnqkjO+XmSHeW003nfGk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 May 2025 09:27:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4218085974804082630
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
Subject: [PATCH v4 1/2] arm64: dts: rockchip: Improve coding style for rk3399
 cdn_dp
Date: Mon, 19 May 2025 09:26:31 +0800
Message-Id: <20250519012632.94-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519012632.94-1-kernel@airkyi.com>
References: <20250519012632.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Mm/8i8/T4yneh0XRCTNyUpt6QI5l8JR9+V0Qcc+RB093jkpsdfTfQwhF
 n8/iTVP9Q1rcckBE+guIr3GUIEVuJanMyiBPqQ9eJtvrXTzVr/T3wQFnkLrqCbTap5N/3sa
 xfudTUK0fatPYF030B65UeFapBFJC2ViKu/bKGyZqoQ7AL6rKWkJvvAAik6DHdd5YWePW2F
 /XjBo1/64MsWUL9Pdu7C3f9JROUcpAh0qdNlBIiBSsSLPjK2vlV0h5YA3t8lN1jpLHThKzX
 fOaunTuZAS8n0LKoxxrb1RCSqib3E4iUBzcMLyTa23jiDtvfN4V90kAhha0/hOm31eJwYCx
 /ZuCMIA1brNs9nmIHc7328YupLlD9F3c9pETuu7dJtZGJLfyvYDVbHZKZ3qkL3lleix5pNj
 ThXkhLsgzb8uy4iS/kmkhTLNdOy47Y/jpzobLyH0TB6fHBy1XWSPocNO0uNLKy+WEBdf25s
 iFcuLwKWmoi3a76MH27LkDqvOv67tml9joppKr3QXtYszMapGNk0F40OCB+gCQYDXS/ptmB
 MOdevkVXhfajcsPgetnIKWxluviGOopzMuaMY/fUiTSwKS0nXeNP0tQQzTPqy+W0aG6wKPM
 NMVBL2NYqGE4onZKunkZsgU8WAYEhYwCESgfHHvAZM7XQz98TIcf8ji+qfimsHVyuz4IFpA
 ZQZ+xRHzuVGp+DNwCou0U5TLc1VG/9wF3GB4qShNd6seJcs/6lP/LIQj8GE5pVO55Y2CZPP
 zs7NKBuJyl2eDWss5wijShbGm+tA99dnk3CJVnYR148OJgSaOfrK7Hx1pAXxcgPdWJg6pq6
 42RWhePNvs4bh54ApPXjCN8gOBM4yIByPlBIPSNTQ4mdMIow5CGu4bYh80vmZNaeW6bt5sc
 qiWfsDEzzRTXpF6nqedkYY5lIa3u/zZxtrFgFPvpEaE/3rsfO90YWb1GysHXWYk3yzmpE44
 0U3EJj84QWPKSlDyyiK4pW6cgZF5x6B2YY2O6hbVvS0clo4uN3bE1FBCc
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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

(no changes since v1)

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

