Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7393BCABFC
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 22:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2C610E23C;
	Thu,  9 Oct 2025 20:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Fgly/m2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f226.google.com (mail-il1-f226.google.com
 [209.85.166.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9740410E23C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 20:04:04 +0000 (UTC)
Received: by mail-il1-f226.google.com with SMTP id
 e9e14a558f8ab-42e2c336adcso5089765ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 13:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760040244; x=1760645044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCNBgBL2WVmA3j1bvAoebeMJXW0On8rduHfODf5z54o=;
 b=rIWxBLjw2pxh2qnynyPd7sIWBiSwyFLDDiS0kLpiStcvN9fR/0K3SMWXl3zWvpurD6
 xL8oFOLjs8YzC4CgkVzmUz9vN+0Xnsf1HM1MrFkRyI6w/zRCp8diX2QBe/BStg5IahrK
 xcnhDQHIEFTIURWu5Fqr871YgQiUb6W8/M6EgBdL/eWPeUzvIAe9KheBf17P154eVNl8
 Go2HOLBts0wIH1E1pOz4xWSx30wjHMkDROG8NZcJbOlh92StIp15l+oBq7qS2MCscsYW
 NsSYJwHx5d52gnXYgUcIM1n88+MEHXESdfTSOcyfmsuSCq/VA7VgnVcDsUdAVo+sKW5p
 d8mw==
X-Gm-Message-State: AOJu0YxDK7+fjeQxjLO/WVQNBa/Ej74pYGbt7scO2Ja6z775oKPsflTH
 AQ2SHPAzUIr2yzxXu0ab2PXr33YWBgbDsS3MpcNtoKNwxM4uYn7bz+Y6mSuXqc+o26pzCzGmRny
 dBdSUXJsZHW6cSlQhc9PIhn8rgL22cMf3o0v9gJRwy9aisGhM2V1G0JYVGuZBJuuhv/PApjJQ7E
 YAqRPam/njw+9SeWUvSoHC4bC/tkKF07JfRdiZz3yYKEYQVQtH0dSn+7gnMQgPzJLBX7MsD37Oa
 8EedM9BKEpdk4AMUJfD
X-Gm-Gg: ASbGncsRavl60aAWExrG1YiDrPa1yvPKdSRy7YXpwzNpwU9s0X6F2jsIDvbz4wBoK/b
 yOljjLXDmqfvFfoGYipfQ2DZkStE1D12iv9DjFe70ujufDUa2AH79R2KTObAVtxnFh8c0MSk6Dy
 WO0SpxFzQCZeHkcVUws7lfHnj4LS87ABrZuQ2ckIHzkz+M6TLsCviOriceTyMD74rwA4K0Z1dQJ
 d6C601GwHyYI0SLJK4wCvskB60veRCKhOZbhlfxX8EXXZpofjltSp9s1iEm7zoLOg40wZVzBzgo
 UTSZKmLjJkw4VdfhYSQiHTL19UoFgX8tWTtaPz9v6UQhKrQ0DgrvZ/4+GeIpW+HMQ6ZE17sENZC
 0opT0O4PVYUDeTxcbaKTvG/0HK6npDqCViLPFKPAxmKTnIK8XNP5q6BWOEvYJwvfX6byeI6Gbcz
 wyow==
X-Google-Smtp-Source: AGHT+IHU9yr6miy6iex/9Qy5lnWBM8nzl31iwcPHOprpC/KKSfIQh5uHvkDJ1foVckobwcis8QrGPZliWL5F
X-Received: by 2002:a05:6e02:18cc:b0:425:8744:de7d with SMTP id
 e9e14a558f8ab-42f87419a6amr84922235ab.30.1760040243636; 
 Thu, 09 Oct 2025 13:04:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
 by smtp-relay.gmail.com with ESMTPS id
 e9e14a558f8ab-42f9036fb5fsm2370205ab.36.2025.10.09.13.04.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Oct 2025 13:04:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-818bf399f8aso48481126d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1760040241; x=1760645041;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iCNBgBL2WVmA3j1bvAoebeMJXW0On8rduHfODf5z54o=;
 b=Fgly/m2icP7y0Hs6RVAiWXCjvJXVrGW0td5gzEhiVR9J1ePhYv+PdjrFkkvR6G1brI
 dTkoQT/2b3RlOFVoeDqymbIXndpv9KP8e1srukcwS4U6eMoR37dZHm2yPWYXsslis+Ef
 M+BT9NseTdazO62FiPU0o1JEwxbsuta43oCz8=
X-Received: by 2002:a0c:e6cb:0:b0:87b:b6a9:1876 with SMTP id
 6a1803df08f44-87bb6a91ca0mr37205316d6.26.1760040241378; 
 Thu, 09 Oct 2025 13:04:01 -0700 (PDT)
X-Received: by 2002:a0c:e6cb:0:b0:87b:b6a9:1876 with SMTP id
 6a1803df08f44-87bb6a91ca0mr37204696d6.26.1760040240861; 
 Thu, 09 Oct 2025 13:04:00 -0700 (PDT)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87bc35ad05fsm2233096d6.57.2025.10.09.13.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 13:04:00 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/syncobj: [RFC] Propagate fence errors to userspace
Date: Thu,  9 Oct 2025 16:03:54 -0400
Message-ID: <20251009200354.2752095-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Propagate the fence errors from drivers to userspace. Allows userspace to
react to asynchronous errors coming from the drivers.

One of the trickiest bits of drm syncobj interface is that, unexpectedly,
the syncobj doesn't propagate the fence errors on wait. Whenever something
goes wrong in an asynchronous task/job that uses drm syncobj to
communicate with the userspace there's no way to convey that issue
with userspace as drm syncobj wait function will only check whether
a fence has been signaled but not whether it has been signaled without
error.

Instead of assuming that a signaled fence implies success grab the actual
status of the fence and return the first fence error that has been
spotted. Return the first error because all the subsequent errors are
likely to be caused by the initial error in a chain of tasks.

[RFC]: Some drivers (e.g. Xe) do accept drm syncobj's in the vm_bind
and exec interface, they also call dma_fence_set_error when those
operations asynchronously fail, currently those errors will just be
silently ignored (because they don't propagate), I'm not sure how the
userspace written for those drivers will react to actually receiving
those errors, even if silently dropping those driver errors seems
completely wrong to me.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_syncobj.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e1b0fa4000cd..bcd8eff8b59a 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1067,6 +1067,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	struct dma_fence *fence;
 	uint64_t *points;
 	uint32_t signaled_count, i;
+	int fence_status, first_fence_error = 0;
 
 	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
@@ -1170,6 +1171,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 			     dma_fence_add_callback(fence,
 						    &entries[i].fence_cb,
 						    syncobj_wait_fence_func))) {
+				fence_status = dma_fence_get_status(fence);
+				if (fence_status < 0 && !first_fence_error)
+					first_fence_error = fence_status;
 				/* The fence has been signaled */
 				if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL) {
 					signaled_count++;
@@ -1213,6 +1217,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 err_free_points:
 	kfree(points);
 
+	/*
+	 * Propagate the last fence error the code has seen, but
+	 * give precedence to the overall wait error in case one
+	 * was encountered.
+	 */
+	if (first_fence_error < 0 && timeout >= 0)
+		timeout = first_fence_error;
+
 	return timeout;
 }
 
-- 
2.48.1

