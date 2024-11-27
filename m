Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104C9DA715
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 12:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705110EAA8;
	Wed, 27 Nov 2024 11:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lTv2R8kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D290310EAA7;
 Wed, 27 Nov 2024 11:47:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-212884028a3so5071045ad.0; 
 Wed, 27 Nov 2024 03:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732708033; x=1733312833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MuylmfZA3oDT64r9NGCB6xYFcj/Ra9P9EYBkVyg6c3M=;
 b=lTv2R8knJvBZQ7TJPrftiqy5+8kKZEpoLhAcKIb3YsMXwyqB3iQjCW639KaDjn7+kL
 PYKoGUuWLt6ZCslfTrsIhq00wUp5YpQVVqWcVLl2n69h7HASDcLKUllMkPxkloZnuY82
 yEHsrpGg668uqOMLVXhrk98hMFobygHgfqXzGXZvIjERTiqvKE+H7omJV49cQz9RJkRZ
 J0R5+LKuk5MS01NuWzMUi5zwS0rT68opiXTc2YmHgpsFBJFJPsUj50+saIh5Fo3tI1vM
 LrsAw+xJHUwrNdZNUgPo/hjqS/elN4nWTXlhazhw7YwoSlIvj9DSceurnqf2VxikOqiX
 f3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732708033; x=1733312833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MuylmfZA3oDT64r9NGCB6xYFcj/Ra9P9EYBkVyg6c3M=;
 b=oyb9Ki3yq4fuYayOk2UDZS8WvvRsZS90k1jS1kac1rivXjm7YIvlxBOS38t7sJBVAt
 ZE3cKndnpLffab6svClR5pLeM0TFuk8Asdq2knKz8zlfAaE2cuLlVBp3u9LcNoN0CjI2
 4zZScUwbnEPH0+cY6ie71qApvrQcklO7rQZcbYUtXlURlPnI3ErFDl5DyMKCMjAtSZlh
 iNVZ6TTVmV9C4EYR5dXyrCxH19iFWPhGYWuVDGxceNuHiQcz8xIPmz0PciXdf3vqs1Nj
 KVZ9L0GQwYgahzmIck5hJSCtmmGpHy3TwccBKHoRFS4DvWClDzwX17BbrWWT5i2SUXsB
 mt3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/y9jVzPvHoV+QSrSJFH7aMQlQ384ju8E3P40D92kc3dzsFF2wLNyJjbuzcKd5k5JQkUV2NE7Z@lists.freedesktop.org,
 AJvYcCWS1HGp8GjzaEHEpZyEZQgGvwNCsougekXgl/c30jsSBvRlyhewvDoYc8mUzvbnWIyMRXzUT3zRHGhs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuhLMFDlwurEqjr1PVuULBYkknN5EAtqypxMAF9r0QjkG+wc2q
 l6KMbTB5SKasek9ITP54PULgc55OA4T9BxKirneK6oTtCClARxZx
X-Gm-Gg: ASbGnctxu2x0R2K9myhajnKih3q7hs8KH+7hqhKCk8of3vfEGPYP7XhqYjO3tsxN1//
 qkjHLvwOX2y0+oT5QXMFOflld2JjlFphSqb+twyL2IUMvP6yel7T5q4Yg8mcQRA7jHhSCa69ePj
 umzn/F60y7hlc9pcug4JnnWeCoSNEvgA+ecdQ/F4ybq/oTG2Q8hIPMF91BLDnShi0VBSkKZ/8zp
 R9IuOPcFM+ZNn3HQBPjM+yA/HMtwUgKntzrzEPmUPfbenJxh21KeVYTB6Xl8rv3ovRMxEGmHUyT
 7A==
X-Google-Smtp-Source: AGHT+IHoX3eDCwwyCInnqKWFs872hvgjGvyI4beYdRcCyyPD9WI1QnVw1OwIhB5AgQuCLd1pLGXWxA==
X-Received: by 2002:a17:903:1c2:b0:20c:b3ea:9006 with SMTP id
 d9443c01a7336-214e6e5b6a2mr90909195ad.6.1732708033193; 
 Wed, 27 Nov 2024 03:47:13 -0800 (PST)
Received: from miley.lan (c-73-162-202-2.hsd1.ca.comcast.net. [73.162.202.2])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2129dbfa834sm100805645ad.117.2024.11.27.03.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 03:47:12 -0800 (PST)
From: Mika Laitio <lamikr@gmail.com>
To: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, sunil.khatri@amd.com,
 lijo.lazar@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lamikr@gmail.com
Subject: [PATCH 1/1] amdgpu fix for gfx1103 queue evict/restore crash
Date: Wed, 27 Nov 2024 03:46:38 -0800
Message-ID: <20241127114638.11216-2-lamikr@gmail.com>
X-Mailer: git-send-email 2.41.1
In-Reply-To: <20241127114638.11216-1-lamikr@gmail.com>
References: <20241127114638.11216-1-lamikr@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMD gfx1103 / M780 iGPU will crash eventually when used for
pytorch ML/AI operations on rocm sdk stack. After kernel error
the application exits on error and linux desktop can itself
sometimes either freeze or reset back to login screen.

Error will happen randomly when kernel calls evict_process_queues_cpsch and
restore_process_queues_cpsch methods to remove and restore the queues
that has been created earlier.

The fix is to remove the evict and restore calls when device used is
iGPU. The queues that has been added during the user space application execution
time will still be removed when the application exits

On evety test attempts the crash has always happened on the
same location while removing the 2nd queue of 3 with doorbell id 0x1002.

Below is the trace captured by adding more printouts to problem
location to print message also when the queue is evicted or resrored
succesfully.

[  948.324174] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1202, queue: 2, caller: restore_process_queues_cpsch
[  948.334344] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1002, queue: 1, caller: restore_process_queues_cpsch
[  948.344499] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1000, queue: 0, caller: restore_process_queues_cpsch
[  952.380614] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1202, queue: 2, caller: evict_process_queues_cpsch
[  952.391330] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1002, queue: 1, caller: evict_process_queues_cpsch
[  952.401634] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1000, queue: 0, caller: evict_process_queues_cpsch
[  952.414507] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1202, queue: 2, caller: restore_process_queues_cpsch
[  952.424618] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1002, queue: 1, caller: restore_process_queues_cpsch
[  952.434922] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1000, queue: 0, caller: restore_process_queues_cpsch
[  952.446272] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1202, queue: 2, caller: evict_process_queues_cpsch
[  954.460341] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
[  954.460356] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes failed to remove hardware queue from MES, doorbell=0x1002, queue: 1, caller: evict_process_queues_cpsch
[  954.460360] amdgpu 0000:c4:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
[  954.460366] amdgpu 0000:c4:00.0: amdgpu: Failed to evict queue 1
[  954.460368] amdgpu 0000:c4:00.0: amdgpu: Failed to evict process queues
[  954.460439] amdgpu 0000:c4:00.0: amdgpu: GPU reset begin!
[  954.460464] amdgpu 0000:c4:00.0: amdgpu: remove_all_queues_mes: Failed to remove queue 0 for dev 5257
[  954.460515] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State
[  954.462637] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State Completed
[  955.865591] amdgpu: process_termination_cpsch started
[  955.866432] amdgpu: process_termination_cpsch started
[  955.866445] amdgpu 0000:c4:00.0: amdgpu: Failed to remove queue 0
[  956.503043] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
[  956.503059] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
[  958.507491] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
[  958.507507] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
[  960.512077] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
[  960.512093] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
[  960.785816] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to halt cp gfx

Signed-off-by: Mika Laitio <lamikr@gmail.com>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c79fe9069e22..96088d480e09 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1187,9 +1187,12 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 	struct kfd_process_device *pdd;
 	int retval = 0;
 
+	// gfx1103 APU can fail to remove queue on evict/restore cycle
+	if (dqm->dev->adev->flags & AMD_IS_APU)
+		goto out;
 	dqm_lock(dqm);
 	if (qpd->evicted++ > 0) /* already evicted, do nothing */
-		goto out;
+		goto out_unlock;
 
 	pdd = qpd_to_pdd(qpd);
 
@@ -1198,7 +1201,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 	 * Skip queue eviction on process eviction.
 	 */
 	if (!pdd->drm_priv)
-		goto out;
+		goto out_unlock;
 
 	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
 			    pdd->process->pasid);
@@ -1219,7 +1222,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 			if (retval) {
 				dev_err(dev, "Failed to evict queue %d\n",
 					q->properties.queue_id);
-				goto out;
+				goto out_unlock;
 			}
 		}
 	}
@@ -1231,8 +1234,9 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
 					      USE_DEFAULT_GRACE_PERIOD);
 
-out:
+out_unlock:
 	dqm_unlock(dqm);
+out:
 	return retval;
 }
 
@@ -1326,14 +1330,17 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 	uint64_t eviction_duration;
 	int retval = 0;
 
+	// gfx1103 APU can fail to remove queue on evict/restore cycle
+	if (dqm->dev->adev->flags & AMD_IS_APU)
+		goto out;
 	pdd = qpd_to_pdd(qpd);
 
 	dqm_lock(dqm);
 	if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do nothing */
-		goto out;
+		goto out_unlock;
 	if (qpd->evicted > 1) { /* ref count still > 0, decrement & quit */
 		qpd->evicted--;
-		goto out;
+		goto out_unlock;
 	}
 
 	/* The debugger creates processes that temporarily have not acquired
@@ -1364,7 +1371,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 			if (retval) {
 				dev_err(dev, "Failed to restore queue %d\n",
 					q->properties.queue_id);
-				goto out;
+				goto out_unlock;
 			}
 		}
 	}
@@ -1375,8 +1382,9 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 	atomic64_add(eviction_duration, &pdd->evict_duration_counter);
 vm_not_acquired:
 	qpd->evicted = 0;
-out:
+out_unlock:
 	dqm_unlock(dqm);
+out:
 	return retval;
 }
 
-- 
2.43.0

