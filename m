Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9E57A85A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 22:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506B414BADB;
	Tue, 19 Jul 2022 20:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685D414BB1C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 20:39:05 +0000 (UTC)
Received: from notapiano.myfiosgateway.com
 (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 103456601A84;
 Tue, 19 Jul 2022 21:39:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658263144;
 bh=Q9hbBExLg9KRq/+2g8AAYdSvZTNWhYZ3sqhbn9GUO4U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bJc2CVF0j3Hr9olq489QoZAziNW0K9b/f23Vt0Xco0mAzvb4gXMXKCQg018jNwbiB
 SldxbD16dyaHBACmBXrM5VA3dsIlIJ+2koFnUN7SCeYiMuuuLxy4ZhDmPhs91/tKDu
 IO22fXmLAfYJ0hiiEo43YhrTkaoAkLLaAHo2fETEl97+RwzVIsFeb+V6R/1RXy1zHg
 UIQeU+HqmjSrEPlMPKhdtrVEEIszybQkiGStEig9Xbqc3g9pTsaDUWVJ0+crD2h0sa
 wBQZWe+iJ9TeL9kLjSbKJ8OUvky4+K7Bah+sGpvIwBaZmZOqDJHgz77uE15Wouv27O
 oC3sIU9RlyUuQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] drm/panel-edp: Add panel entry for B120XAN01.0
Date: Tue, 19 Jul 2022 16:38:55 -0400
Message-Id: <20220719203857.1488831-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220719203857.1488831-1-nfraprado@collabora.com>
References: <20220719203857.1488831-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add panel identification entry for the AUO B120XAN01.0 (product ID:
0x1062) panel.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 675d793d925e..152e00eb846f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1879,6 +1879,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
-- 
2.37.0

