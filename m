Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23933479E6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 14:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7EE6EB89;
	Wed, 24 Mar 2021 13:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C339E6E9FC;
 Wed, 24 Mar 2021 13:48:47 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id y18so17993290qky.11;
 Wed, 24 Mar 2021 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/iyE9OqAjQZg/OzYxknxNdb9tDwATqAe8JxpLJvUVtw=;
 b=BcgI9394uPGMaOnLshwgOzLKCyg1UQgyona4sTBOljxtro6giwVYeoYVfucB6WeGrE
 ueEO2nr4BT7j73Mf8Oj1hbnQbYWdy/5hw3fN4segKfZ9i1ilN7PzqIVFR0cqWmZ9d3CS
 lleqAu5YZKOHe5ahkvSgyaBk+fz3YGCaXtgAj8tLjShzcgvC4awHI8wXQ4XvUHHby02C
 gmGaxzNR4Qslga8xBfsfU6S5ARnty5VItgr56mtG725GX+kjEpXfJY9Glkm9NO3Bn/+d
 KdhqhuDeKyxaCimhBB8qdT0zva/MVqUGQK3gCnJY/dRUjXH240GCM2Acmmw95wSstc6h
 aZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/iyE9OqAjQZg/OzYxknxNdb9tDwATqAe8JxpLJvUVtw=;
 b=d2aera0k4/rVYi+EpN8AGeBJ4FNqzLs4J67BMhwU4l6i6JgeU1LRiRqlVvfdUASK6Q
 PUdb9hrNrAFKhmPIZLIgvbk4XdYQc8hDVhmjTZAePwFYCLaPiJ5vuVqe38uqLNjdbF2s
 QTIh56E0I4ffhz4e8y6odBKTeklqYW63UV566YdI5be3TPnpHjHbU4H00DI+JL8lVZgh
 gF9kxsIr6j8Q/geCWS5uuZ3HTtQhkj4VRjUOYO+lkXOR6JfPeAI6nVQ1Ju7bxknz3+0+
 QG8DK4nGgVVojeTTq76Mhd+AKxb3Wv13ZOUgMUtst3RU6Tg/hx6BWK5V+IBTOet+IeV1
 9kOg==
X-Gm-Message-State: AOAM531xPkBjozQfPKrOxM24RapaMn1kfjtI0ilvPFGNk4H9NfypbSR2
 iBVe21fcoM2ksAlSOno6PSg=
X-Google-Smtp-Source: ABdhPJwmWigcrxAN4YFNnDUNCapP3mlwg7uTwWBcNkPMJT3NLKnoQoRpFLP1JTLi4vJ/bIvre85Vag==
X-Received: by 2002:a37:46c5:: with SMTP id t188mr3219408qka.47.1616593726965; 
 Wed, 24 Mar 2021 06:48:46 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.36.138])
 by smtp.gmail.com with ESMTPSA id a14sm1746068qkc.47.2021.03.24.06.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 06:48:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon/r600_cs: Couple of typo fixes
Date: Wed, 24 Mar 2021 19:20:26 +0530
Message-Id: <20210324135026.3540-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/miror/mirror/
s/needind/needing/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index 34b7c6f16479..aded1f2264e0 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -38,7 +38,7 @@ extern void r600_cs_legacy_get_tiling_conf(struct drm_device *dev, u32 *npipes,


 struct r600_cs_track {
-	/* configuration we miror so that we use same code btw kms/ums */
+	/* configuration we mirror so that we use same code btw kms/ums */
 	u32			group_size;
 	u32			nbanks;
 	u32			npipes;
@@ -963,7 +963,7 @@ static int r600_cs_parse_packet0(struct radeon_cs_parser *p,
  *
  * This function will test against r600_reg_safe_bm and return 0
  * if register is safe. If register is not flag as safe this function
- * will test it against a list of register needind special handling.
+ * will test it against a list of register needing special handling.
  */
 static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 {
--
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
