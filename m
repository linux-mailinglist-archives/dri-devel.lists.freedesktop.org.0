Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9602397DF6A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 00:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873E310E33C;
	Sat, 21 Sep 2024 22:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="0w4hDkC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1FE10E2DF
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1726957889;
 bh=vW3Ue0teLF7LHwhAhdpVjB9NkznQc9ED1YULlXDH87A=;
 b=0w4hDkC1ml5k1aFqqbX5G+KcOoBa93nj4zwUsLUPsmSYtIEK9FqjEhmBqnID7vobvCimpYlYM
 Owl1OSmWZHdri9xywJiqDkd9IiVOoyfmko+fyRXjyyQ7JCL4P5zuSmGZeTaXC6qKCeQZMU8lmKy
 9W35MFZtBhN6nnwtlYM8TTyCF74Kr5zRiuZY47HI4xX93W1IHmLC+fSEeFDaWOw3whMOzVYLsyZ
 xyCyen5kuDA+xwEfGXvO0SxPmwSPtM/1TnLCWdTgroDh9GMLLE7JdSJWKpFpra6E2WcYTyalS76
 e2ud2tzXYqDn9jQnSlEOI5jFiLo82bKI9oTyxk2aJNHA==
From: Jonas Karlman <jonas@kwiboo.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/3] rockchip: Split rk3288-vop compatible into big and lit
Date: Sat, 21 Sep 2024 22:20:00 +0000
Message-ID: <20240921222007.2301868-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ef46b118c10b4d4a165cf1
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

The Rockchip RK3288 SoC contain two different Visual Output Processor
(VOP) blocks, VOP_BIG and VOP_LIT. The VOP blocks support different max
output resolution, 3840x2160 and 2560x1600.

This series add compatible to differentiate between the two VOP blocks,
backward and forward compatibility is kept for older and newer DTs.

Jonas Karlman (3):
  dt-bindings: display: rockchip-vop: Split rk3288-vop into big and lit
  ARM: dts: rockchip: Split rk3288-vop into big and lit
  drm/rockchip: vop: Split rk3288-vop into big and lit

 .../display/rockchip/rockchip-vop.yaml        | 36 +++++++++++--------
 arch/arm/boot/dts/rockchip/rk3288.dtsi        |  4 +--
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   | 27 ++++++++++----
 3 files changed, 43 insertions(+), 24 deletions(-)

-- 
2.46.1

