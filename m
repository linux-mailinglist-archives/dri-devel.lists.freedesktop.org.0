Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790CA421E5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7448210E2D2;
	Mon, 24 Feb 2025 13:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dvkeoqHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7474D10E2F1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBA755C6DD8;
 Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD7DFC116C6;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740405065;
 bh=hTPrO7u9vikyA+T0pYfEy9szULQyXPV8+3Ucv3Dz7Aw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=dvkeoqHlB9lYgUKZdTOejRPwtzq6S0NQ+Ii05pTy5Jx7bS+T1vGymNsHjJLkfqC+4
 CZmN8YsLNPi9AqqWFS6Yfn0USHXnC83zlcgoXpLAghuRTb0KPKLqtypsBNHZFMdZ+X
 63oFsUZycayI9rfSvIfNCYr8WLJ70kcL1arJJrFAuQny9EZHeykU08hTmFoFYuiwCx
 REUMgouU+W510AavoXNs32o/rKvmXkN6Kw7jcH0BAZ+10Gn8jo/WlHDgb41jWNjozz
 uHFIIaKNXQhjWFJ79XPJATkIWOvmEM7qUvhc4bTM6U40clOdLrHH8VuCBR7Qe275pg
 eLEH0vQ0No3Ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D17F0C021A4;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:51:00 +0100
Subject: [PATCH 10/14] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-10-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=783;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=z0gueLFcKY7qkz1B8onsTw44Uj3rSydQ9QleSWa8oZk=;
 b=lAU9+MTJ3smyQz3gcyDoGEboLTWpbgUoebuITkTiRp8H/PJvmRbJR/btf5ukRY8Wu3Lu5UwTg
 LPE6zgrlw3EDBUSFGvF/oFRYliLy1A0rdygD1WXk695M6Udt9lsXsZy
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

Add a maintainer for the GOcontroll Moduline series of controllers.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b4c76d7ad890be0f618109918ad89328bc72e8cd..d80688d833322d4dbece34226180875c6b10ae40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9843,6 +9843,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOODIX TOUCHSCREEN
 M:	Bastien Nocera <hadess@hadess.net>
 M:	Hans de Goede <hdegoede@redhat.com>

-- 
2.48.1


