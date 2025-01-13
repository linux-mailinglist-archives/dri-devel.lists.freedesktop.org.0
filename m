Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6AA0B1F5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E2710E5CB;
	Mon, 13 Jan 2025 09:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="SstlwXNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF9AD10E5CB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=suvcj
 2YqmKj4ZuCEBei8QvBTqaDNr0b4MgUqN6wdBIQ=; b=SstlwXNcymJ/tkhvGwZZz
 GwWpJnAVaHsW74owXOGtnU5qYH/dRg65FoOKtWHryYwMDS62/lFrQ6E3cET0ZTrd
 3vQo4MNiJ2dde8lpWalvD90DXAw7MiD4oXm+vBGgbhuZ8PN6E3bCAJvv/1bOyrob
 4UXhT7u8CU9NaTqgql31CU=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wDHkgsO1oRnBT4NFw--.41521S2; 
 Mon, 13 Jan 2025 17:00:03 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dianders@chromium.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Yan <andyshrk@163.com>
Subject: [PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
Date: Mon, 13 Jan 2025 16:59:54 +0800
Message-ID: <20250113085956.2150207-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHkgsO1oRnBT4NFw--.41521S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrykCr4UJw1xAw45Cr4DArb_yoW8Gw4kpF
 Wktry7uay8Z3WxK397A3Z8JF4UAan2vayIgF4vkFWkZF17GF17t34kArW5Jw4Fqry5Ja47
 Krn7Jr17tw4UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRQyCdUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBfTXmeEzjvblgAAsp
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

Add an eDP panel entry for BOE NV140FHM-N4Z.

No datasheet found for this panel.

edid:
00 ff ff ff ff ff ff 00 09 e5 09 0b 00 00 00 00
01 20 01 04 a5 1f 11 78 03 9b 75 99 5b 5d 8f 2a
23 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 c8 37 80 cc 70 38 28 40 6c 30
aa 00 35 ae 10 00 00 1a 00 00 00 fd 00 30 3c 43
43 8f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 46 48 4d 2d 4e 34 5a 0a 00 35

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 94a46241dece..a3402b76aa3e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1909,6 +1909,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_p2e200, "NV140FHM-NZ"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
-- 
2.43.0

