Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B72A14738
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 02:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0725010E1E9;
	Fri, 17 Jan 2025 01:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="MCaF5bro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D7BB10E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 01:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=+oX46
 ssjen+grNNelmVBLeYI+2FqYGGFwTbiuIPwd2I=; b=MCaF5broRlIS+RwDo5e+a
 GAbHSBIJiTivutU8zBq3xy/JYFVlAJQiOjR623h9MejtOT9Pj4iT6Z1+IgK3FdD2
 PbPsKjCBTVeQ7t3+PtljaXjigItgxPC9TcrhbJ/A2F+goV4WLi2TEdWrtCcCmW/E
 edLAo2MGcywihSJQuzckk4=
Received: from ProDesk.. (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgC3hKq5q4lnoRZOBA--.30558S2;
 Fri, 17 Jan 2025 09:00:46 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dianders@chromium.org
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Yan <andyshrk@163.com>
Subject: [PATCH v2] drm/panel-edp: Add BOE NV140FHM-NZ panel entry
Date: Fri, 17 Jan 2025 09:00:29 +0800
Message-ID: <20250117010039.1815430-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgC3hKq5q4lnoRZOBA--.30558S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy3GFy7Kw13ArW3Kry5twb_yoW8Cr48pF
 Wftry7ua10v3W7G397A3WDJF4UAan2ka4IgF40kFWkZa17GF13t3sIyr45AwsYqr15Ja47
 Krn3Jr17tw1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRkucXUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h-XXmeJq5oGawAAs2
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

Add an eDP panel entry for BOE NV140FHM-NZ.

No datasheet found for this panel, so the timing
is based on a similar NV140FHM-N41 datasheet that
I can find on internet[0].

edid:
00 ff ff ff ff ff ff 00 09 e5 09 0b 00 00 00 00
01 20 01 04 a5 1f 11 78 03 9b 75 99 5b 5d 8f 2a
23 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 c8 37 80 cc 70 38 28 40 6c 30
aa 00 35 ae 10 00 00 1a 00 00 00 fd 00 30 3c 43
43 8f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 46 48 4d 2d 4e 34 5a 0a 00 35

[0]:http://www.tfinno.com/PIC/PIC/20215121628440.pdf
Signed-off-by: Andy Yan <andyshrk@163.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

---

Changes in v2:
- Fix typo in commit message NV140FHM-N4Z -> NV140FHM-NZ
- Reorder based on the product_id
- use delay_200_500_e50_po2e200 based on NV140FHM-N41

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 94a46241dece..3e3b339b7a7c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1908,6 +1908,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
-- 
2.43.0

