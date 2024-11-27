Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF39DAF4A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 23:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E9A10EBF8;
	Wed, 27 Nov 2024 22:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="ApVr8M+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C4510E227
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rpRTZD3rQ6fcXSI3x3w5V3GlJGBpXq/aq88YWpZoftc=; b=ApVr8M+KE8vU+gn1q1aC7Yityx
 sc2dSDSVljqDpPiLxEuKKjC56nYdwV+6qQEr77t98vVZDzEMonvqIViilqBtQ7SPHE+R5qA/4aGn1
 FCz2gvHkJPXDbhhz3O1mjgBZVKTByGb/Lsyk5vheI/OZlMFxMP2slbvwgAG2icK7io4ZmQJKVjCt2
 9jpkHkEhbYTkueW9W0aZLCuZQFbXaHtm1EJds5gVT+66khGh8PLc/BHaG79e0LcCuVwQy3wFzMM+s
 raW1Kme0Yw+IKP3nCRg5VMcmOxsncUJH3kg2J41NtT0VZKFztl3VqZMP9e1OW2794Y/opJTmNk+cT
 OuW3tWDw==;
Received: from [89.212.21.243] (port=49750 helo=and-HP-Z4..)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <andrej.picej@norik.com>) id 1tGFK9-007Rx6-0K;
 Wed, 27 Nov 2024 11:31:08 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, marex@denx.de
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set custom
 lvds_vcom
Date: Wed, 27 Nov 2024 11:30:31 +0100
Message-Id: <20241127103031.1007893-4-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127103031.1007893-1-andrej.picej@norik.com>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Wed, 27 Nov 2024 22:47:27 +0000
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

Set custom differential output voltage for LVDS, to fulfill requirements
of the connected display. LVDS diferential voltage for data-lanes and
clock output has to be between 200 mV and 600 mV.
Driver sets 200 Ohm near-end termination by default and since
LVDS_VCOM_CHA_LVDS_VOD_SWING (0x19) [3:2] sets both data-lane and clock
output voltage we have to set the register to the value of 0x0C (0b11 <<
2):
- Steady-state differential output voltage for LVDS data-lanes:
  min: 300 mV, typ: 402 mV, max: 511 mV
- Steady-state differential output voltage for LVDS clock lane:
  min: 234 mV, typ: 314 mV, max: 399 mV

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 .../boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index a9de42cf14be..709b555ca753 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -179,6 +179,7 @@ port@0 {
 			bridge_in: endpoint {
 				remote-endpoint = <&dsi_out>;
 				data-lanes = <1 2 3 4>;
+				ti,lvds-vcom = <0x0C>;
 			};
 		};
 
-- 
2.34.1

