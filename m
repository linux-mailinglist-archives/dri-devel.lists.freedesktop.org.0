Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C39204B9D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAB56E964;
	Tue, 23 Jun 2020 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0036E045
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 13:45:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d15so13652594edm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZbos3NrYHqLWNkYJ46LBHL5KpqJlXJ9Np1rp6xePmw=;
 b=GFIS2uWkX+087N7mo++k6B5hgP7kNDwmKzPETXxx7ooi1xT/bxT/6CqOwqCTWwS3eJ
 zVOVcSLfku1JuJFrSWenbpM/G0IL3hyjLzoeoDk3g6SFHqMeyeavvw3T/QbmC2+v1jSJ
 DLAcDdAxbubMJ5qHQAmYA6MF2vnju9YEREZaKylkGRNZ5+awnDxTtwUgd2h6yfiQKcZ+
 KFRemDKfhzhp3t//GJMGCrzOIp46hk11/n6l43aMnacWDBP9AIsmG8caO8ls1uuULaq+
 VcE+caNW5K2fAsYyhu2RPNfFb70J012ogQOSbd3SRTsdrjo5u8Z9ldQv8R0XXdDVeYEj
 kxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZbos3NrYHqLWNkYJ46LBHL5KpqJlXJ9Np1rp6xePmw=;
 b=L+vJtUbUQcsj/mMyS+m9IwCP63aIYtYD+UFnSNCWe9cPt0tJt05wISmgeu2yivqKjO
 YxwO3ej7b/qIm1KoyOJ2WfMSY3qnVilBuxDRv87ITF5JYPQxRfq7+YOK/0B3ORjz+8dd
 ZrHwaoCKVK80pG4hcAvzpkUfQdx1P12WGO42RbCtxg0SY3ImTCVrd1zfB0SQMtQGt/qc
 alifHH8eMugXpAESto4yMOXiWHILLKBKp5UkOlZwRz4fRCsmoI0gyrjD3pMDbVgwf8gC
 p0VFzlkPTRq3Mki+uPPo9wPXvNo5zdi/wCOCVC0sgm+nN/5FwZHwwhZ7N+ihojIlwU/6
 9+CA==
X-Gm-Message-State: AOAM532pVeQswdvayEN1WHvpNVXJBbjYbcQv/Cw4FljpVy5I53c/23rS
 KS3GTXp9hhzF2d4um7jvmN+e4iL0kMmgbw==
X-Google-Smtp-Source: ABdhPJxUHthDWWEawHl1G9BwZq9u4W8fxCB7yI+4PLH0veH9uKYklMZ3cZkowc6eyMSg3K2z8GgxAQ==
X-Received: by 2002:aa7:d64b:: with SMTP id v11mr6990100edr.381.1592833548904; 
 Mon, 22 Jun 2020 06:45:48 -0700 (PDT)
Received: from test-machine.fritz.box (pd9567980.dip0.t-ipconnect.de.
 [217.86.121.128])
 by smtp.gmail.com with ESMTPSA id 23sm6287017edw.63.2020.06.22.06.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 06:45:48 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/mm/selftests: fix wrong return type casting
Date: Mon, 22 Jun 2020 15:45:33 +0200
Message-Id: <20200622134533.15759-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <21094d57-c64e-ea7e-426e-997cd45d4635@amd.com>
References: <21094d57-c64e-ea7e-426e-997cd45d4635@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: colin.king@canonical.com, Nirmoy Das <nirmoy.das@amd.com>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function prepare_igt_frag() and get_insert_time() were casting
signed value to unsigned value before returning error.
So error check in igt_frag() would not work with unsigned
return value from get_insert_time() compared against negative
value.

Addresses-Coverity: ("Unsigned compared against 0, no effect")
Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reported-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/selftests/test-drm_mm.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index 3846b0f5bae3..3306d8bd0544 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -1041,13 +1041,12 @@ static int prepare_igt_frag(struct drm_mm *mm,
 {
 	unsigned int size = 4096;
 	unsigned int i;
-	u64 ret = -EINVAL;

 	for (i = 0; i < num_insert; i++) {
 		if (!expect_insert(mm, &nodes[i], size, 0, i,
 				   mode) != 0) {
 			pr_err("%s insert failed\n", mode->name);
-			goto out;
+			return -EINVAL;
 		}
 	}

@@ -1057,8 +1056,7 @@ static int prepare_igt_frag(struct drm_mm *mm,
 			drm_mm_remove_node(&nodes[i]);
 	}

-out:
-	return ret;
+	return 0;

 }

@@ -1070,21 +1068,16 @@ static u64 get_insert_time(struct drm_mm *mm,
 	unsigned int size = 8192;
 	ktime_t start;
 	unsigned int i;
-	u64 ret = -EINVAL;

 	start = ktime_get();
 	for (i = 0; i < num_insert; i++) {
 		if (!expect_insert(mm, &nodes[i], size, 0, i, mode) != 0) {
 			pr_err("%s insert failed\n", mode->name);
-			goto out;
+			return 0;
 		}
 	}

-	ret = ktime_to_ns(ktime_sub(ktime_get(), start));
-
-out:
-	return ret;
-
+	return ktime_to_ns(ktime_sub(ktime_get(), start));
 }

 static int igt_frag(void *ignored)
@@ -1119,17 +1112,17 @@ static int igt_frag(void *ignored)
 			continue;

 		ret = prepare_igt_frag(&mm, nodes, insert_size, mode);
-		if (!ret)
+		if (ret)
 			goto err;

 		insert_time1 = get_insert_time(&mm, insert_size,
 					       nodes + insert_size, mode);
-		if (insert_time1 < 0)
+		if (insert_time1 == 0)
 			goto err;

 		insert_time2 = get_insert_time(&mm, (insert_size * 2),
 					       nodes + insert_size * 2, mode);
-		if (insert_time2 < 0)
+		if (insert_time2 == 0)
 			goto err;

 		pr_info("%s fragmented insert of %u and %u insertions took %llu and %llu nsecs\n",
--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
