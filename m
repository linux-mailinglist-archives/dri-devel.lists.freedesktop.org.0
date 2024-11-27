Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304CB9DAF49
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 23:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EBA10E42A;
	Wed, 27 Nov 2024 22:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="KFqokzSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1737 seconds by postgrey-1.36 at gabe;
 Wed, 27 Nov 2024 11:00:02 UTC
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DD810E227
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GlNV48MQ4G7U/3atikXtOonokPebd5St2HI4ngxfLBg=; b=KFqokzSyu7Wye4UwKlHRqnQi9i
 6ZC8cOeLuFtStrRftgOX36FHc1iImeukZen/FfW7RBwdZh3Feiy/AhX16Ka5oZG+H9EkJvy7pq2HD
 WbVBbLQ9dzwID4YX0E8zxySjBas/gMQO6H3YB2dVGoixXvA0qSDf9rKLGZplQOaOt4hogfMNXasCm
 3VR57T1TyTsGz86aBnQeCrke1t3laTmFOT7oL7IDCdEUpKuBk7P1jkpaNqBetVGaGIiaaS/G2KCWS
 s0xOCZeT6cRjDUHbEFnkwMWeAXAAowDFmeBH3jPYkQIpiyMSyatNZ0w+c80HIlqECgRryAlkcehsP
 PrShsijw==;
Received: from [89.212.21.243] (port=49750 helo=and-HP-Z4..)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <andrej.picej@norik.com>) id 1tGFK3-007Rx6-1d;
 Wed, 27 Nov 2024 11:31:03 +0100
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
Subject: [PATCH 0/3] sn65dsi83: Add LVDS_VCOM option in device-tree
Date: Wed, 27 Nov 2024 11:30:28 +0100
Message-Id: <20241127103031.1007893-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

This patch series depends on the patch
"[PATCH 11/15] arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10"
(https://lore.kernel.org/linux-arm-kernel/20241125081814.397352-12-andrej.picej@norik.com/)
which is currently under review. Please apply the dependent series first before
applying this one.

Best regards,
Andrej

Andrej Picej (1):
  arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set custom lvds_vcom

Janine Hagemann (2):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add optional property
    ti,lvds-vcom
  drm/bridge: ti-sn65dsi83: Add ti,lvds-vcom as optional property

 .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              | 10 +++++++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.34.1

