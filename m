Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DF48CA32A
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 22:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E7110E3BC;
	Mon, 20 May 2024 20:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=craftyguy.net header.i=@craftyguy.net header.b="k3OWUPG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 404 seconds by postgrey-1.36 at gabe;
 Mon, 20 May 2024 20:13:02 UTC
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87E10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 20:13:02 +0000 (UTC)
X-Envelope-To: dmitry.baryshkov@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
 s=key1; t=1716235575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pgb9HpMlYja56AtV4h4FfdFHjqmjLlGePeCHySyRgs=;
 b=k3OWUPG62K5PcGfXbMY/qnJ8bn7v/VPSZRGb3+XQu3WQjqiRDfRtDP3/nXP4nQvX3tHayS
 qySE5pK/1DvMl8MpfdXcSP4aC6e0fkKav9rOpAaHHzL8oIiGxzDbGvgXl3gOpQ/ZB3sEu6
 KJC9Kns9GijIOUJNb813PD3m+eINJpimMDVgQRJft74AjFKWL2j/q1Y68iXd8dIFWPVH0r
 oWprdyI083ll6bX5VltbUl+Cuzrqz2rIn2xDR/xfF7ZQJyswnFcsXfmBjrcyOalZOg2JPZ
 3GzII0zcb5ISg0LzStX97Za2DMaEaUhsEnx1sKROiPv1Vi/g2V/jr8BANeuIog==
X-Envelope-To: clayton@craftyguy.net
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Clayton Craft <clayton@craftyguy.net>
To: dmitry.baryshkov@linaro.org
Cc: clayton@craftyguy.net,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel-edp: Add entry for BOE NV133WUM-N63 panel
Date: Mon, 20 May 2024 13:06:00 -0700
Message-ID: <20240520200611.6279-1-clayton@craftyguy.net>
In-Reply-To: <CAA8EJpoobfosRMMNm2uDY3dNXgCU+LauRvg9-2MrQBwHO0q1Cg@mail.gmail.com>
References: <CAA8EJpoobfosRMMNm2uDY3dNXgCU+LauRvg9-2MrQBwHO0q1Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

This panel is found on some laptops e.g., variants of the Thinkpad X13s.

Signed-off-by: Clayton Craft <clayton@craftyguy.net>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6db277efcbb7..f75db9917667 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2047,6 +2047,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
-- 
2.45.1

