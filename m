Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D7FB24E97
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 18:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2195510E774;
	Wed, 13 Aug 2025 16:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="aA7BafZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D426910E774
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 16:02:45 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2401b855635so52857515ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1755100965; x=1755705765;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vU1iojt0gD3FI1ZhQ2ngoLEMSZI8uX8uMw4yAJKUm0w=;
 b=aA7BafZvQLUpvVFHvlxPqIjT+Uc+JInHgA2K90P/FpkwUibXQYZ1vQo2sSBF4YMZkH
 rRiKfQDhw6m/bTSSjCxUrIxKnD4D91EMgab+Zj98xfFk9qIaZqtHiiIUx+FuyBc6RPKX
 JZMmNMJ5af5KmG/HGwGhkKSqweYAJfFiYmWxrurfo7ftQoYcFhWlhpoWHN7aiCsbxQfu
 TqO7zFmjShNpz0OLxdAhzYedMqCVL2cqmOPe3uwGaY9wYFtsn+c8MaTPS6KX7BIfe1tr
 qUcRiMDcVuOtHXtxZaP86HBXn/PT16vOCZV1OzD8EF9VkbJL7COEvV59E+7AD17XAonw
 i/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100965; x=1755705765;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vU1iojt0gD3FI1ZhQ2ngoLEMSZI8uX8uMw4yAJKUm0w=;
 b=DFp7RGdSJV8M/qRkUx0YUVxj2ww4LzkvK26YOGAMOdQgAGXP8PxVS9uEwojVU5rjJV
 63aAyH9calnkE5bKwnsGYgdQ4jYHO0jGZlUJhbdIBegNPg1FKymfCBZYKAC1OUyLg88o
 u8wyw+me1FCkmxNX6/iWyaNm2RmQsEXgd7ENOZh+hvctsF7MpZSIqL28VXVRJqZZ5mjj
 Tqtz/8ZSMWxsKgg/nfdwR/aZ8jVIkQTlZ6o2wNmHKUHKgRYu2ZQuPIUdq/K5LNz0jM7+
 hw7/qnNzB82TTo/C4rSDuv0sAez3+HnlS+NCpbThdtaiX6nSd+rbCAnoTO6zaDGdhru5
 oBOQ==
X-Gm-Message-State: AOJu0YzurPBtGf5fzfT9YHYDPNkik49yVcMburUrS3N+Hba87OUWCOqw
 SQ4oVERSVQ44vDsv80r1THniTgxgNKJCXqDVGFDyRM6tasV+4X8uo81sMgCgyOWxme8=
X-Gm-Gg: ASbGnctq/4uwTJfmJYjMjcO+ibeMUIwEoxKCMEs/5Spg5sJ4KVhy0GdwCqL1vjKFQ/c
 I/jdZ+loowrDZ1zudatORutJoNEf2zKeBo0/2Xa4/6zUe+UsbjbZuDIOaiyedrbxtRFm/zS/Puf
 /I7uWcz3QpeuG489wIJ+mraQc1g6E8BsvHWyj7rIJyMOM31nL1lTZiLW3neyVZvFvHgDQWB1GeE
 FRhQjvll5y8dCJswSZv5l8yaJlWIep44wW9AwTSuky1XZMYss0wosc6f+TtL4Zabp2GcPwSmLn5
 yi3GAZVH85zWpzAA3Ptpb1wzNcnEQEvhvRujVIRWKn79MOzuUM01xcXdOKDCCZFBMCQOSf7T10M
 WCsKEErLIsdSPln7W2YykYFoteqI9Ei2hrDhuMdRxXw==
X-Google-Smtp-Source: AGHT+IHckUEfl6Sm+2L9KD4HithUZ+Iig/EWOybXb8wce/skeyx454O7qL/9XNBxODe4Za4Yq2h7OQ==
X-Received: by 2002:a17:903:2d1:b0:242:fc4f:9fe3 with SMTP id
 d9443c01a7336-2430d2243d0mr56569415ad.37.1755100965055; 
 Wed, 13 Aug 2025 09:02:45 -0700 (PDT)
Received: from [192.168.1.100] ([2605:fb40:0:c09:323a:5679:3782:80b8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976a06sm329750985ad.81.2025.08.13.09.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 09:02:44 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Date: Wed, 13 Aug 2025 10:02:37 -0600
Subject: [PATCH] accel/rocket: Fix usages of kfree() and sizeof()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-rocket-free-fix-v1-1-51f00a7a1271@brighamcampbell.com>
X-B4-Tracking: v=1; b=H4sIAB23nGgC/x2MWwqAIBAArxL73YIp9rpK9CG21hJUrBGBePekz
 xmYSRBJmCKMVQKhhyOfR4GmrsBv7lgJeSkMWmmr+sagnH6nG4MQYeAXjXet6+zg9KCgVJdQ0f9
 xmnP+AEYAqHFhAAAA
X-Change-ID: 20250813-rocket-free-fix-3ca6a759a290
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>, 
 Brigham Campbell <me@brighamcampbell.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090;
 i=me@brighamcampbell.com; h=from:subject:message-id;
 bh=zkeMszwcEY2/Nw1AqB8rOo2CFjNX+nyhvu/+Et85Vww=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ8ac7crzGIQYNx/WXxTx4oKswQm3/zJrfZfPmv4w3cj2M
 YOyeZxyRykLgxgXg6yYIovKrVnqFydbPzoYwT8BZg4rE8gQBi5OAZiI7klGhs4lqezaUk/enbv0
 p9rwWWNAKSNr9oKHjnvMYrNXnClwM2H4K7jwFa9erMPXAqNZmffbvLr85/82Oada9r3TO9ZhToY
 GIwA=
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449
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

Replace usages of kfree() with kvfree() for pointers which were
allocated using kvmalloc(), as required by the kernel memory management
API.

Use sizeof() on the type that a pointer references instead of the
pointer itself. In this case, scheds and *scheds both happen to be
pointers, so sizeof() will expand to the same value in either case, but
using *scheds is more technically correct since scheds is an array of
drm_gpu_scheduler *.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202508120730.PLbjlKbI-lkp@intel.com/
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/accel/rocket/rocket_job.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 5d4afd69230623215e3105da7153d2d010636d52..f6fe1a6d9264b7508a3adc03248e5a704c68c4f0 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -222,7 +222,7 @@ static int rocket_job_push(struct rocket_job *job)
 err_unlock:
 	drm_gem_unlock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
 err:
-	kfree(bos);
+	kvfree(bos);
 
 	return ret;
 }
@@ -496,7 +496,8 @@ void rocket_job_fini(struct rocket_core *core)
 int rocket_job_open(struct rocket_file_priv *rocket_priv)
 {
 	struct rocket_device *rdev = rocket_priv->rdev;
-	struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->num_cores, sizeof(scheds),
+	struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->num_cores,
+							  sizeof(*scheds),
 							  GFP_KERNEL);
 	unsigned int core;
 	int ret;
@@ -630,7 +631,7 @@ int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *fil
 		rocket_ioctl_submit_job(dev, file, &jobs[i]);
 
 exit:
-	kfree(jobs);
+	kvfree(jobs);
 
 	return ret;
 }

---
base-commit: a3daf184bd85d7c08ce948a79bb0e4cac2203923
change-id: 20250813-rocket-free-fix-3ca6a759a290

Thanks!
Brigham Campbell <me@brighamcampbell.com>

