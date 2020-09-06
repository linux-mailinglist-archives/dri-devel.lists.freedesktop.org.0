Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E00025F3DE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991216E228;
	Mon,  7 Sep 2020 07:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dmz.c-home.cz (gw.c-home.cz [89.24.150.100])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74EBD6E075
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Sep 2020 16:33:09 +0000 (UTC)
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
 by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 086GLocv011279;
 Sun, 6 Sep 2020 18:21:59 +0200 (CEST)
From: Martin Cerveny <m.cerveny@computer.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] drm/sun4i: mixer: Extend regmap max_register
Date: Sun,  6 Sep 2020 18:21:40 +0200
Message-Id: <20200906162140.5584-3-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200906162140.5584-1-m.cerveny@computer.org>
References: <20200906162140.5584-1-m.cerveny@computer.org>
X-Mailman-Approved-At: Mon, 07 Sep 2020 07:22:17 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martin Cerveny <m.cerveny@computer.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Better guess. Secondary CSC registers are from 0xF0000.

Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index cc4fb916318f..c3304028e3dc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -307,7 +307,7 @@ static struct regmap_config sun8i_mixer_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= 0xbfffc, /* guessed */
+	.max_register	= 0xffffc, /* guessed */
 };
 
 static int sun8i_mixer_of_get_id(struct device_node *node)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
