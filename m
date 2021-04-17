Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060736311D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 18:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09186E05A;
	Sat, 17 Apr 2021 16:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D36E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 16:15:57 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id w23so30690253ejb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rII0d846oZPnYt8lUpSHq80aP9OZVYxwXuXqYd7H9dI=;
 b=ugh/YuLIlRa4QkJYH1V9ULc2IeHhw5yslHslaraYRnjH8NziKGNZBUL2ypAUG3sDoI
 gHtcVi2WEs2tCJ3EabLZaQP9kjSQnFTe9pArK44Q+HqBnSeHEOdyLP/orS4UCPietmdh
 OARzMD9CSbUwAgCqtLlkO79BqqE6wdYzRHbUizH1pWzgfesr1uGYrZZjpqcYBIT3OrgU
 iZcYvKHB0CKZbkXgw/xStIGfMEO3TUK5wbeDKa21Z7m1YrIU2Y5ABiEgwUvkzqkKF8Am
 f1dl+lUos439De7XkuP1r2wZiEocXQdFyBE1NzyMrzjp54h/cT7P6qa3nwjV1TzZNLWH
 RI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rII0d846oZPnYt8lUpSHq80aP9OZVYxwXuXqYd7H9dI=;
 b=fHWYubDp0wujtv88Ojozmb1Gio6gzzcc5ld7bjPCICepKuFakPfOsRz7XcIa3Dqv/j
 AG2dWUaIAoeWUArrcU4AUTTAkkHASyqXnLztf5cha19k/BLqBb6HtTfMNcC5IyjLo9tc
 nHqpr5j6qUXt+5ozxh/qKcOvTuv3lhtTDXNp8gY6GU49m/xuVxAFq1gbskQ8TTbdatDc
 3YQd2E1gA1s3Hl0kZuTt+rFiRItMiG8ZRuaXD9AC57yFjrJtAXl0CJx7sjWpeal0Zyiz
 ExeP9rpJuYny5isZiJdRPgTuO2xSUhhAMA7q1myh3EuWQASjzMJHkxvTN1RZA49LT7wG
 PomA==
X-Gm-Message-State: AOAM532JH7jMdriS9VAouPlpz7qV3+tDfv8X/k6lyU5+lGX2RUxm3HfJ
 Tv+Zkzrn6zorc1MqIbvgnnY=
X-Google-Smtp-Source: ABdhPJwZsI8ipD/fUQfaRL0J4YMM2f658BTuNimPiAOSSZO5rBvnXEEcCIcmjxL8xh/ILDeokqPJ0Q==
X-Received: by 2002:a17:906:944c:: with SMTP id
 z12mr13377636ejx.398.1618676156296; 
 Sat, 17 Apr 2021 09:15:56 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id bs10sm8514830edb.8.2021.04.17.09.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 09:15:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/drm_bufs.c: In switch, add break in default case
Date: Sat, 17 Apr 2021 18:15:52 +0200
Message-Id: <20210417161552.6571-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added a "break" in the default case of a switch select statement.
GCC complains, although this "break" is not strictly necessary 
for the code to work as expected.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Added the reason why of this change in the log.

 drivers/gpu/drm/drm_bufs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index e3d77dfefb0a..fc40aa0adf73 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -79,7 +79,7 @@ static struct drm_map_list *drm_find_matching_map(struct drm_device *dev,
 				return entry;
 			break;
 		default: /* Make gcc happy */
-			;
+			break;
 		}
 		if (entry->map->offset == map->offset)
 			return entry;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
