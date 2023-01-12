Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6607667A68
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B6510E2EC;
	Thu, 12 Jan 2023 16:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1200 seconds by postgrey-1.36 at gabe;
 Thu, 12 Jan 2023 16:12:28 UTC
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net
 [46.105.50.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050C010E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 16:12:27 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.20.85])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 0F84E22D69
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 15:33:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nclp8 (unknown [10.110.115.59])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 435361FF2C;
 Thu, 12 Jan 2023 15:33:43 +0000 (UTC)
Received: from armadeus.com ([37.59.142.97])
 by ghost-submission-6684bf9d7b-nclp8 with ESMTPSA
 id Y7zJDVcowGNsBgEA+Oyw8g
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 12 Jan 2023 15:33:43 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0021cff9d63-2bf8-463c-96d1-a03284752c29,
 62BD97EA99DFFB4B62E3774F9F19AD0763AB9DD0)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.140.211.188
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm: panel: Set connector type for Armadeus ST0700 Adapt
 panel
Date: Thu, 12 Jan 2023 16:30:30 +0100
Message-Id: <20230112153030.28567-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2906792088147848171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepffeufffgveeiffelteelgfetjeffueffuefhffeikefhkefghfejjeeufeduteegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
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
Cc: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Armadeus ST0700 Adapt is a DPI panel, set the connector type
accordingly.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8a3b685c2fcc..22c579d79d01 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -843,6 +843,7 @@ static const struct panel_desc armadeus_st0700_adapt = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct drm_display_mode auo_b101aw03_mode = {
-- 
2.38.2

