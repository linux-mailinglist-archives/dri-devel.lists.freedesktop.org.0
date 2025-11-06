Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F134C38CB9
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9184010E7E1;
	Thu,  6 Nov 2025 02:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="YAMzm5Vf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769310E7E1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394821;
 bh=aJfT3al64j89KUZlTband3H4GOH/hk+OuA8dIFJ1TmA=;
 h=From:To:Subject:Date:Message-Id;
 b=YAMzm5Vf+xNv1ToAgP0q47eMYraDXkm6A3a9ioofICo8SCGt9j5uUilHhvT07OmRG
 NnTATt+M59f891jAHtyrGQv81KTp4wmEfK1OdSykiAnzWCbB+ZOYLN4+0UtlnOdp58
 KJHSTvD9QsnOxAkKIcY6uRHqylZu7Y4reQ4DF0n0=
X-QQ-mid: esmtpgz15t1762394819t768674e9
X-QQ-Originating-IP: UM6wceQl0W0g/3PA4zWPUeXO1m1KWpgObbxmmmz1aKA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:06:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5131190821667047602
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
Subject: [PATCH 4/9] dt-bindings: display: rockchip,
 vop: Add compatible for rk3506
Date: Thu,  6 Nov 2025 10:06:27 +0800
Message-Id: <20251106020632.92-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvWsgqCEECOfPYMVn5vCz4J74sJwC9vSpGLaeFiiVJlMZZiS7ytL3P0S
 BqKWhHrwxo1dhdAPR6Tr1Xz9LkRE8uMEQlyawBS5p5MF3dlA+jwurBcCCR/BkzCafsGg6x8
 K0LdYkgv29hvyTAW8txi4iSNAhw8DE4Yq3ccD1MzpuWUwsxE9KV62cBy2LnZoZfc1YZkJnK
 7Fs7fcVGK/oCB8nTOBL+SKvJsk8CmM+Zt3e/xxKQS8Ku3K/mNfwVTsRda74tSkyK0MTvJaY
 0qW0jZ9lX/ux1L8G0nn12NmbmCbLJ/CaUWTg4XR4Llij+k14wvTiDHnosSmYDkI5WnGJkzE
 k6o2e+oCKfvuh+ckXWTbDPSOr+jJbThJuawuwN3VKaJep95Gc7Btyr6n9LjM1es4v1xwpSe
 Jb8H8hxX30Jwy7M2iQaPB/Lv1B39L4sr8XiEo+FMaRaozLQBikxyRURHp7qpUSkJ1nfr5RK
 /mQZ/2n7EJiJErx6xtWWSijyO7dQ2Pshcxq7GiF1419HXZLOR46QnRlAeu2kbNRXNcQ5Mbb
 y2odrpb4nQI3a1KCHn2fROx/1zDpPq6jThXUN3o0HGKDr1VSOWmBAEP7gl7qnlnKRh21ASR
 kYR0rHhizWbU20N0zEQtSGufVI2R9Lf5DbxrlSIeTc9NAplJlo68PgqKBU8TPc/dkAhSg6C
 wR0qRrdtDQ4pGuBvfjTHNBdGibTj/b+K17Cg/V9nGKh8xF2eEXJXKONc5u5IAY5HU7LlxYf
 8+Zi3gxZiThF+CTKF0BkVD9npkf/PXkhwdi/ztbGOmVKuU9HFulEChLW8WiFK5wsJXzcrTd
 Lr0jXUGpAvicGcpGjLchZ4UQ3a38XIrvr/Qn3VkdyKCY3uO4UawOQVeP6bdiRJi6f7j46qW
 3mARXa0aEWVs9j65bnIsLmC8ACXJr+4WZTsxsaEVBooxXcP+YrHd+p9e/MSYnnBu69UrGBn
 hpW5knfqzNOHqnhdxv9gsdvmOM2jUXshJ9iAHu598Z+gpHqx5XDxJkRnHkD5JZ1EGdJY+lZ
 xD3IqmvZ5uG/QRtf/8U9edwBmFnwk=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

The rk3506 VOP has adopted a new implementation.
Add a new compatible string for it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/display/rockchip/rockchip-vop.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index 8b5f58103dda..fdf4b1109da2 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -31,6 +31,7 @@ properties:
       - rockchip,rk3368-vop
       - rockchip,rk3399-vop-big
       - rockchip,rk3399-vop-lit
+      - rockchip,rk3506-vop
       - rockchip,rv1126-vop
 
   reg:
-- 
2.51.1

