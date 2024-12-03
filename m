Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6449E1A21
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 12:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC75610E34E;
	Tue,  3 Dec 2024 11:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="PyBlv3iJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F4D10E34E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UIdVnNJSlrdN/ogBMzjqJdURidk/0O2I0Sqfpx7mr7k=; b=PyBlv3iJrSscFR4dBdCULuy/v3
 HXc0CADvC4HzyWuCelZMrRis5Ub8/wU2gWFjZlDKrZxT6DMgOtkDlyzwLlW0LdAk2sy+0+wrZ2mMV
 vfpNF9X2YwfuY7w3YdRM9g44+vJIsbs12GsOi8UB0g9U/57o3aKID5W5zUGwXIAqGNtNpuy4rDYrp
 UwivnJgEZre0hUL9f0L6L6kyeXxKcGio9jon/bxuvJyYbUJ5qVw5ZR0M78YhXkDInHXqVi3n/yFf4
 ilEksGwnNsieNDe7TOLAI4rtqDiCCvVWbncYQRERGX4MiFNastbRWn75dZw2BYwYnHmOMd1Orc09w
 8wZttabw==;
Received: from [89.212.21.243] (port=52296 helo=and-HP-Z4..)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <andrej.picej@norik.com>) id 1tIQeR-00Bd83-2F;
 Tue, 03 Dec 2024 12:01:07 +0100
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
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: [PATCH v3 0/3] SN65DSI83/4 lvds_vod_swing properties
Date: Tue,  3 Dec 2024 12:00:51 +0100
Message-Id: <20241203110054.2506123-1-andrej.picej@norik.com>
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

this is a v3, which has only a minor change in a second patch.

The LVDS differential voltage swing can be specified as arrays of min, max
in microvolts. Two arrays, one for data-lanes and one for clock-lane can
be specified. Additionally, because LVDS voltage swing depends on near-end
termination this can now also be specified with separate property.

Driver goes through the tables, taken from datasheet [1] and selects the
appropriate configuration. If appropriate configuration can not be found
the probe fails. If these properties are not defined default values are
used as before.

This patch series depends on the patch
"[PATCH v2 11/15] arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10"
(https://lore.kernel.org/all/20241202072052.2195283-12-andrej.picej@norik.com/)
which is currently under review. Please apply the dependent series first before
applying this one.

v1 is at: https://lore.kernel.org/all/20241127103031.1007893-1-andrej.picej@norik.com/
v2 is at: https://lore.kernel.org/all/20241203085822.2475138-1-andrej.picej@norik.com/

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F

Best regards,
Andrej

Andrej Picej (3):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for
    ti,lvds-vod-swing
  drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
  arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing

 .../bindings/display/bridge/ti,sn65dsi83.yaml |  36 ++++-
 .../imx8mm-phyboard-polis-peb-av-10.dtso      |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 144 +++++++++++++++++-
 3 files changed, 176 insertions(+), 6 deletions(-)

-- 
2.34.1

