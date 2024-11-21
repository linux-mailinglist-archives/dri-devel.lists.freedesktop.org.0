Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE829D53A5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 20:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDFE10EA54;
	Thu, 21 Nov 2024 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZWIapVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069E910EA54;
 Thu, 21 Nov 2024 19:54:24 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-21288ce11d7so10768985ad.2; 
 Thu, 21 Nov 2024 11:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732218863; x=1732823663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=wp6l7XhsmrdMnTO0WKGfVcLhA31d906veXwj9w1//x4=;
 b=UZWIapVx6dEv8H12zH5JNi3YDCPcBk/GvldoA5DwVVKGNxRS+SjxU8MeXGFykyAZC0
 ++SAASs7jxKKkpWeT7zCaZWGgn8j21UZ5VNj/K39ZPcif3kHdd7NdoWZ101VS5fqY7+u
 iqW/301CayCc6WM/YGIfojCkfGzWxDHQnGVH915QICJ5vqlIjWFOqH4bW+QfJbbYXgxd
 Tm4TAWqUwQfvBJXATuzNDQsBowOCwpgtZ21ihIVIY3juvmonmJOtyFaukiCMlQilbfXR
 p91E9os9xdMmlaed0uYOr/fbFBfPhp/K4aYm+smCmzmdnvrVp8fpSwVeO+V8Pw48FVv7
 7lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732218863; x=1732823663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wp6l7XhsmrdMnTO0WKGfVcLhA31d906veXwj9w1//x4=;
 b=qyacphiRReCAxKZsV5QswAfECiDv0A6ME4nOn/YW9GguLBWhHJ1Cz3HV1tafJIsrLQ
 tFSk75OF2lJSAMKiUP9kOhvYiJVcQOSGsXI9xfOKqDYvUh2+0o14axTlUwX5fvMGXQ0O
 zNcj1uXRrHbF+r5g/TxWjFnUUrLMb7Nv9Qq2lKGBvVbFU+YZuWaxeidKyTdUrHzZvouY
 wHfIfEerF4G1SK9r56MY1jsRe1/iF5ud2bqwaZEn3qUAXuFGzfsCFDDs7DWfm+OKC6ov
 pslH6av0d4bHMTXQJ6TwEhirjxmWX6XoeS18EnueKvltt0b3vv2TbirhUaZdT0fwJzSR
 j2Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX32thEnvfS1b5vK/KfN10CFGiu1zB/hhO2ajfa9jTTzIm1IxK/vVg0y2chuhvX0Y+Hd+Iv0tnM@lists.freedesktop.org,
 AJvYcCXQ9C/BnzwrjlwnwUPt6DXIAuus9c4Hqr5bFsiuI8es9GM7u/ziXy7jlpVZlru6baHfZu7SepZK6LaZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDY18BoF87RIKeodbmSBSytr+afl/5odZ3qE/pgsH5zkAtYB5A
 x8YqtA8axrL+wt26LvwWYtPuNy1X39Zz902H1yqBnS0aBvd9LYbN
X-Gm-Gg: ASbGncsxnM3gjrRqD+JDqVMps3Uo55j0KDUmPtBxx0OV79xjps65FmofxxugTNl915h
 DQxEwSf74Ou8MmYy6+lE0cUnWL3t51kUteMJMM7ehXo3bldI3Q0fnNMWkFncjRSLBN07Ny251Yb
 oOWJEVNJvUHmiWYHUKAuujsxw5Tw7CDm5wn1b0XU8U9orldhtEAxmAh2fakXtm/wxGPYC55vsGX
 KqaER7LBL82LIyS6hbG36y+wzMr76Exlc8l1R7ufPuBsVkYITqP0v7zmxIK
X-Google-Smtp-Source: AGHT+IGf/s3igp1qa5nwVQ3UdLZG958xwoVDCENF4/Gy7tOWTIVSR+2U/Yx0Ve/MsXWa6Y/f888KRQ==
X-Received: by 2002:a17:902:f711:b0:20c:dbff:b9d8 with SMTP id
 d9443c01a7336-2129f28a632mr5051985ad.37.1732218863209; 
 Thu, 21 Nov 2024 11:54:23 -0800 (PST)
Received: from miley.wireless.pacific.edu ([138.9.3.75])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2129dbfb2fdsm2122555ad.156.2024.11.21.11.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 11:54:22 -0800 (PST)
From: Mika Laitio <lamikr@gmail.com>
To: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, sunil.khatri@amd.com,
 lijo.lazar@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lamikr@gmail.com
Subject: [PATCH] ammdgpu fix for gfx1103 queue evict/restore crash
Date: Thu, 21 Nov 2024 11:51:49 -0800
Message-ID: <20241121195233.10679-1-lamikr@gmail.com>
X-Mailer: git-send-email 2.41.1
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

AMD gfx1103/M780 iGPU will crash eventually while performing
pytorch ML/AI operations on rocm sdk stack. Crash causes linux
desktop randomly either to recover after killing the app,
freeze the desktop or reset back to login screen.

Easy way to trigger the problem is to build the the
ML/AI support for gfx1103 M780 iGPU with the
rocm sdk builder and then running the test application in loop.

Additional trace messages helped to found out that error happens
always on same location when kernel ends up peridiocally
calling evict_process_queues_cpsch and restore_process_queues_cpsch
methods and calls MES to restore the queues in loop.

Crash requires small but random amount calls to these evict and restore
calls. (usually around 10-50) before the error happens on kernel. On
gfx1103 case, there seems to be 3 queues that are evicted and restored
and errors happens always when restoring the second one from the list
with the doorbell 0x1002.

Adding delays to either to test application between calls (1 second)
or to loop inside kernel which removes the queues one by one (mdelay(10))
does not help to avoid the crash.

I tested multiple other GPUs and similar error could not be triggered
gfx1010 (rx 5900), gfx1030 (rx 6800) and gfx1035 (M680 iGPU) or gfx1102
(RX 7700S). From these devices only the gfx1102 uses same codepath for
calling mes firmware.

I tested that the problem could not be avoidded either by adding delay
to user space pytorch app via delays between calls (1 sec) or by adding
delay to loop inside the kernel which removes/restores the queues.
(tested with mdelay(10))

Testing has mostly been done on 6.12rcs and 6.12 final kernels but same
problem can been triggered also at least on 6.08 and 6.11 kernels.
After the fix I have run the application on loop multiple times over
1000 loop without seeing the error to happen again.

Original bug and test case was made by jrl290 on rocm sdk builder bug issue 141.

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
 .../drm/amd/amdkfd/kfd_device_queue_manager.c  | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 648f40091aa3..027c8b4010c2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1156,9 +1156,12 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 	struct kfd_process_device *pdd;
 	int retval = 0;
 
+	// gfx1103 APU fails to remove the queue usually after 10-50 attempts
+	if (dqm->dev->adev->flags & AMD_IS_APU)
+		goto out;
 	dqm_lock(dqm);
 	if (qpd->evicted++ > 0) /* already evicted, do nothing */
-		goto out;
+		goto out_unlock;
 
 	pdd = qpd_to_pdd(qpd);
 
@@ -1167,7 +1170,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 	 * Skip queue eviction on process eviction.
 	 */
 	if (!pdd->drm_priv)
-		goto out;
+		goto out_unlock;
 
 	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
 			    pdd->process->pasid);
@@ -1188,7 +1191,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 			if (retval) {
 				dev_err(dev, "Failed to evict queue %d\n",
 					q->properties.queue_id);
-				goto out;
+				goto out_unlock;
 			}
 		}
 	}
@@ -1200,8 +1203,9 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
 					      USE_DEFAULT_GRACE_PERIOD);
 
-out:
+out_unlock:
 	dqm_unlock(dqm);
+out:
 	return retval;
 }
 
@@ -1295,6 +1299,9 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 	uint64_t eviction_duration;
 	int retval = 0;
 
+	// gfx1103 APU fails to remove the queue usually after 10-50 attempts
+	if (dqm->dev->adev->flags & AMD_IS_APU)
+		goto out;
 	pdd = qpd_to_pdd(qpd);
 
 	dqm_lock(dqm);
@@ -1344,8 +1351,9 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
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
2.41.1

