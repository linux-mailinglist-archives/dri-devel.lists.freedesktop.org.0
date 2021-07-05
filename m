Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CF3BBD07
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866DD89C9C;
	Mon,  5 Jul 2021 12:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DD789862
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A186D22620;
 Mon,  5 Jul 2021 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EkUuBpPf6hMYxmxVgOlcgbsyAkbc3Aw1mQN+hY/ZkVk=;
 b=fH2A09igjHahjGjtAaA6cwXeJnpvyfyVRlngru96QebH/roUVHoOkfhh+IsZxnyn3f0DZa
 zq1S9u6VsnwAaSKPfgGuYlv4h2dg329/nNR6FfFtOLvWdeoC3TMERfxiJ5rLR+TjGZXt0/
 SBaaaGXaIv8L/kxyNRzDkIeaeqz39bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EkUuBpPf6hMYxmxVgOlcgbsyAkbc3Aw1mQN+hY/ZkVk=;
 b=GY2MJqFJswEb0m1SVMMaPHX0HgntTjSio+66tXo3dZ8jbXaTL3gJ5ypQorMaWBfU//DRSZ
 Cu6ZXjtLbqbcAvDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F7DD13A7E;
 Mon,  5 Jul 2021 12:45:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iK5ZGt3+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 03/12] drm/mgag200: Remove P_ARRAY_SIZE
Date: Mon,  5 Jul 2021 14:45:06 +0200
Message-Id: <20210705124515.27253-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705124515.27253-1-tzimmermann@suse.de>
References: <20210705124515.27253-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace P_ARRAY_SIZE by array pre-initializing and ARRAY_SIZE(). No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 045a20055515..fa06f1994d68 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -187,17 +187,16 @@ static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
 	return 0;
 }
 
-#define P_ARRAY_SIZE 9
-
 static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 {
+	static const unsigned int pvalues_e4[] = {16, 14, 12, 10, 8, 6, 4, 2, 1};
+
 	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta, permitteddelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n;
 	unsigned int computed;
-	unsigned int pvalues_e4[P_ARRAY_SIZE] = {16, 14, 12, 10, 8, 6, 4, 2, 1};
 	unsigned int fvv;
 	unsigned int i;
 	u8 misc;
@@ -252,7 +251,7 @@ static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 		/* Permited delta is 0.5% as VESA Specification */
 		permitteddelta = clock * 5 / 1000;
 
-		for (i = 0 ; i < P_ARRAY_SIZE ; i++) {
+		for (i = 0 ; i < ARRAY_SIZE(pvalues_e4); i++) {
 			testp = pvalues_e4[i];
 
 			if ((clock * testp) > vcomax)
-- 
2.32.0

