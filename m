Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6CC38CB3
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1121D10E7E0;
	Thu,  6 Nov 2025 02:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="dm555Ud/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9341C10E7E0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394817;
 bh=9yCjsaoFkOvmC3WJaoawYLPivucq321KJsantBtPkYE=;
 h=From:To:Subject:Date:Message-Id;
 b=dm555Ud/bmZKwapq4//dn1xIkHHF3D84kxzgaebaKQ1otml/PdW2NUY8xmywXeJfZ
 cX+kBgd+Y3Tm45dJdTzAVWbBN7bLv+IWFoNZe2QAWvnO0rtOfdRVRBkP5JsFgbPN4U
 J3dEuUWPzfFP/VyPkBil5FyHNtua3unIxxzao3fY=
X-QQ-mid: esmtpgz15t1762394815tba64791d
X-QQ-Originating-IP: xOTzFY12cbSb/MFbDxpiyuQb1pU09c+X3VAD/uHNlBU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:06:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6204674981207334838
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 3/9] dt-bindings: display: rockchip,
 dw-mipi-dsi: Add compatible for rk3506
Date: Thu,  6 Nov 2025 10:06:26 +0800
Message-Id: <20251106020632.92-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OVdyvDaZFkszlfAdqQIKMczp6crbpwZOUDN0fThezjR5l+O+KepqWIxp
 FxALUlukqNb5b8wQc9j9AkcwCwwlMj7at9SeyILcZMaeufuKGya6TrpsktV2X2pZHiL8abr
 EdknnfdVLdrUFLzVgC8HvFJ/CNZ6zE8iVfiJGcymGm8hIHsjuH3E0JO+RhqJbFoGS8R3Zmt
 AT0Gz2etjHJuub2BRLc6UxEMHMls8i8g1cnH4BgKko7aF8yM7cXtmVk0VuI8BWhstg86nH5
 M3P7oKqpjnHCFB4NJOydDXCEWMqiLLkuvySUV+tWAD59zPXYZImSJMX4w6mwEpXWldQfv4f
 sHFVTpYtziLNbgM1bm5WLgn56yPqUMUDTic7vWsRk+vEfLux+4Jf6intW6hBbC19+UCzoOO
 g847JCXcKF++jNuGmmCRSabVL2Z3I4LyH8Pu+QJmdcxyWkU09b4wcs7UhZxsQMBes2e29dk
 Slc27aes+6Dyk0vOXhQM4c0go7kcL4//L20XW5dpbbBVDgF+WtxxEkGMk8w3oxGQkOO6NA6
 EDY6TU+4cXNTrMIU/3ugtEoA6yxCmijEHJRiqWFCdOQWkMISal5/IQoAV5X0cffY84OANY1
 28uxGhMHY1yhphZTm/Fpp7lpyDIAkNlzxHEIIYHMit+n2d26COPYCFHlrHp3FB7BizvnTRe
 FtVnFzZ92GkFBn0GWfduUxADOACppENEc0goQp+Y6CoYEnRjgZ/DznuypJ5V9LC+ETCa2AF
 yx/y42+fUwn2vp5GNqOqWxsZMQugJX9tbmF5tFjZiheIjdXzP8HB7a1xhAbAtc+T85czbem
 kcB7bK8DJBUU6Tf43Fjw4Y+t67KLuKPrHYmZODV1tHyB6gLRU8pJ8mIHHypUp2IFRm7tRV8
 SsQc/pRnjEKyPi2MOkecHm2vm3ZcT1mff9P+s+yJq9jbTy7p23JLCrGknAnYlOwjOzlVgCg
 JjdBbq+mZVfgUPqyAOwosxzd3A/NtD9tSTQdCwQFf1LI9dvEQKz8RF4cDz0Y7/M/JCb5jZL
 88/VNVKc70Rky5bVOlXBizoDmcd+g=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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

Document a compatible string for the rk3506 mipi-dsi.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index c59df3c1a3f7..d949750a3afd 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -73,6 +73,7 @@ allOf:
             enum:
               - rockchip,px30-mipi-dsi
               - rockchip,rk3128-mipi-dsi
+              - rockchip,rk3506-mipi-dsi
               - rockchip,rk3568-mipi-dsi
               - rockchip,rv1126-mipi-dsi
 
-- 
2.51.1

