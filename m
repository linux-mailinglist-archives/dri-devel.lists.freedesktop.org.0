Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174B2134E98
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 22:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050A66E8CB;
	Wed,  8 Jan 2020 21:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8766E8C9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 21:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=x3d4O9Awmply7Gb2seTh415j0YsnxIYTmKDTHVNNT2c=;
 b=dAcpmKP7UgPlLeMck1G5y8sTRPP4wEPF7bFoQBH/J07rMy0E94zT4hjLtF41IbCiUgPX
 BgEY2nwdlRYQNuLbrmcrxy1xTIXqbyttzdFpp0NOrLVqpb+Yd2kGX6KvS43Jm33ungyQn8
 Osllpm2FE9dZEUTg6G2jTTyYx4xQS7jJg=
Received: by filterdrecv-p3mdw1-56c97568b5-2vkp8 with SMTP id
 filterdrecv-p3mdw1-56c97568b5-2vkp8-20-5E1644A6-62
 2020-01-08 21:07:50.961205325 +0000 UTC m=+1974284.203795984
Received: from bionic.localdomain (unknown [98.128.173.80])
 by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP id QWVTuMAqSKqZc5uIdTCBpw
 Wed, 08 Jan 2020 21:07:50.764 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 09/14] arm64: dts: rockchip: increase vop clock rate on
 rk3328
Date: Wed, 08 Jan 2020 21:07:51 +0000 (UTC)
Message-Id: <20200108210740.28769-10-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108210740.28769-1-jonas@kwiboo.se>
References: <20200108210740.28769-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hwYU02QfFsqeFLpfX?=
 =?us-ascii?Q?zC=2FPIsIIlZOhCQWMaWStdn4Sgg70tNAgTTH9RVO?=
 =?us-ascii?Q?HaqqultxCHltJE+1pIIzRgEALOD6ueQXWa28UYF?=
 =?us-ascii?Q?RdHSxrYkTM+CVsMnnHQfLdkIr64G5EC6IYFOcIS?=
 =?us-ascii?Q?efXmzOYeVeXh1X+cHEWiF6zJ0ZFAsseNOmA2nnL?=
 =?us-ascii?Q?iKQTcPvbxCNYJVOfohRhA=3D=3D?=
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Zheng Yang <zhengyang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP on RK3328 needs to run at higher rate in order to
produce a proper 3840x2160 signal.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index c9ff1188bd7b..fee896338cc1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -803,8 +803,8 @@
 			<0>, <24000000>,
 			<24000000>, <24000000>,
 			<15000000>, <15000000>,
-			<100000000>, <100000000>,
-			<100000000>, <100000000>,
+			<300000000>, <100000000>,
+			<400000000>, <100000000>,
 			<50000000>, <100000000>,
 			<100000000>, <100000000>,
 			<50000000>, <50000000>,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
