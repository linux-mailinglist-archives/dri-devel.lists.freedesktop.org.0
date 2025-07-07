Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD83AFB8F5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D50710E4E7;
	Mon,  7 Jul 2025 16:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="yWuK4Eyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60D210E4E9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=z3oo4jp/mWDXJM4loc/Z9mF5O/3QC0Xa5p4jSoWlt2w=; b=yWuK4Eyl5vZRgqKAYAhhf5a2V2
 YlX0Lw/Wa+sVwk/B4wvKfqvE8w+bOUD34xSSmYZuyU8sOqi5nRT+hINz0n1t8yzFGR0MqP3z/7HNu
 e9R8o3Fno1t8YK6atx1BeLyYAX60Dd/5oLfDwuPATN7z2bXqHI/sfs3ayd+uhPiMDWII9ySdIOhi9
 9o1yw4343jaz2Ww6Ls3Adlbn42d3HnYgofQc2mCB6VB6xa0c8BPEi6+FbvIjGiw+COVFiEv9n1Str
 iFMwmDlj5hlBO57U8/27o98u3pFzWrl0vamF83rE9yPF0ItjoFVCAC/qPyuJV1I8D5jzWxKEhsW2/
 So/tIGJw==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1s-0004yl-Ea; Mon, 07 Jul 2025 18:49:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 05/13] dt-bindings: display: ili9881c: Add Bestar
 BSD1218-A101KL68 LCD panel
Date: Mon,  7 Jul 2025 18:48:58 +0200
Message-ID: <20250707164906.1445288-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Document the compatible value for Bestar BSD1218-A101KL68 LCD panels
that are based around the ili9881c controller.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5eb..79064f9dde23 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - ampire,am8001280g
           - bananapi,lhr050h41
+          - bestar,bsd1218-a101kl68
           - feixin,k101-im2byl02
           - startek,kd050hdfia020
           - tdo,tl050hdv35
-- 
2.47.2

