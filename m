Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E54369135
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 13:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F256E0D4;
	Fri, 23 Apr 2021 11:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EBB6E0D4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 11:38:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r20so23679864ejo.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 04:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfwQKZxXdDYllkxh+HP2o7b8Xma124w7u9YX5ihdThk=;
 b=B0suzuxifCcOfPo/dFqrCu+ZPlTvcWsFMBQ3qhXvoW30sjRxdGR3uDnk/8bKkUgmVp
 buVA60RHa7KMqBACHOi6zaxbTshOmcTRfmMPt/piPoz7R+qrvjdSxzFG+G35R/nZ4w4f
 VnYgbrGVEJdI8+FtAJ0H4kjzb5QQb3erUWGy7jo39EfgtBo3/wT4K0hejCrl325etzB2
 2GZE10id4/elX95fiEsvqTzyWWWECUSIJstXZWnQKBbTbf3lOGmHILZDTQyHS2kLGHK2
 ieYXAE63EEkMTgHVR4XzNSUYguPHBJjsoeJPG791p+N64ZMW/pMHBdpFVPB3R7j2GRUV
 UAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfwQKZxXdDYllkxh+HP2o7b8Xma124w7u9YX5ihdThk=;
 b=eoRBg2/wHadsJDg7hvN8OXlYKLj+caFgx94H++ECgkPyUhMbodmG8cW8Rh6amRJtrO
 dEO8Vp8rL4mJl2nYF+7+xLkE9cmk7gK+QbWEnexqrEg4ty+4QGqj5dK9g7vwtk39kAoU
 Crcf/GdRj50RwMGu88aw2d36zWkvYBRUwXgI2KrekO2GMXL6EZVOF6SjBAmK+Xi+TN6e
 DFJlLslmUKbkTqQQQsdOlLBxSZhTXRXxv0uREF0v9YQCxhLApk2wo5jjprOeHgvv46Sv
 Re4ZQYeGeqMrH6T4EKHXLJwjdmsusd1mzzZewbYbjoHO1eq9gH1C0/RGqlp8ReH1zW/t
 epzQ==
X-Gm-Message-State: AOAM530dBBzzEs/C2jxHptaFSGAPoQV5ZhXj+NQsRjpEbsaCHTD2r8oU
 SGeihlw5eGgCmyheTAC6qVU=
X-Google-Smtp-Source: ABdhPJzH545joyry0k/7hTklhyZPWuXssioV+PCVrPHxjHBczU9IqrubsxlPdlzQYMgfZb8vZiJJpA==
X-Received: by 2002:a17:907:2662:: with SMTP id
 ci2mr3628395ejc.467.1619177931579; 
 Fri, 23 Apr 2021 04:38:51 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id bm26sm3804553ejb.82.2021.04.23.04.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 04:38:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/amdgpu: Fix errors in documentation of function
 parameters
Date: Fri, 23 Apr 2021 13:38:46 +0200
Message-Id: <20210423113846.29651-1-fmdefrancesco@gmail.com>
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

In the function documentation, I removed the excess parameters,
described the undocumented ones, and fixed the syntax errors.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  8 ++++----
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 2e9b16fb3fcd..bf2939b6eb43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -76,7 +76,7 @@ struct amdgpu_atif {
 /**
  * amdgpu_atif_call - call an ATIF method
  *
- * @handle: acpi handle
+ * @atif: acpi handle
  * @function: the ATIF function to execute
  * @params: ATIF function params
  *
@@ -166,7 +166,6 @@ static void amdgpu_atif_parse_functions(struct amdgpu_atif_functions *f, u32 mas
 /**
  * amdgpu_atif_verify_interface - verify ATIF
  *
- * @handle: acpi handle
  * @atif: amdgpu atif struct
  *
  * Execute the ATIF_FUNCTION_VERIFY_INTERFACE ATIF function
@@ -240,8 +239,7 @@ static acpi_handle amdgpu_atif_probe_handle(acpi_handle dhandle)
 /**
  * amdgpu_atif_get_notification_params - determine notify configuration
  *
- * @handle: acpi handle
- * @n: atif notification configuration struct
+ * @atif: acpi handle
  *
  * Execute the ATIF_FUNCTION_GET_SYSTEM_PARAMETERS ATIF function
  * to determine if a notifier is used and if so which one
@@ -304,7 +302,7 @@ static int amdgpu_atif_get_notification_params(struct amdgpu_atif *atif)
 /**
  * amdgpu_atif_query_backlight_caps - get min and max backlight input signal
  *
- * @handle: acpi handle
+ * @atif: acpi handle
  *
  * Execute the QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS ATIF function
  * to determine the acceptable range of backlight values
@@ -363,7 +361,7 @@ static int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
 /**
  * amdgpu_atif_get_sbios_requests - get requested sbios event
  *
- * @handle: acpi handle
+ * @atif: acpi handle
  * @req: atif sbios request struct
  *
  * Execute the ATIF_FUNCTION_GET_SYSTEM_BIOS_REQUESTS ATIF function
@@ -899,6 +897,8 @@ void amdgpu_acpi_fini(struct amdgpu_device *adev)
 /**
  * amdgpu_acpi_is_s0ix_supported
  *
+ * @adev: amdgpu_device_pointer
+ *
  * returns true if supported, false if not.
  */
 bool amdgpu_acpi_is_s0ix_supported(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 5af464933976..98d31ebad9ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -111,6 +111,8 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
  *  a KFD BO and schedules a job to move the BO.
  *  If fence is already signaled return true.
  *  If fence is not signaled schedule a evict KFD process work item.
+ *
+ *  @f: dma_fence
  */
 static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
@@ -131,7 +133,7 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 /**
  * amdkfd_fence_release - callback that fence can be freed
  *
- * @fence: fence
+ * @f: dma_fence
  *
  * This function is called when the reference count becomes zero.
  * Drops the mm_struct reference and RCU schedules freeing up the fence.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index b43e68fc1378..ed3014fbb563 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -719,7 +719,7 @@ static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
 }
 
 /**
- * @get_wave_count: Read device registers to get number of waves in flight for
+ * get_wave_count: Read device registers to get number of waves in flight for
  * a particular queue. The method also returns the VMID associated with the
  * queue.
  *
@@ -755,19 +755,19 @@ static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
 }
 
 /**
- * @kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
+ * kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
  * shader engine and aggregates the number of waves that are in flight for the
  * process whose pasid is provided as a parameter. The process could have ZERO
  * or more queues running and submitting waves to compute units.
  *
  * @kgd: Handle of device from which to get number of waves in flight
  * @pasid: Identifies the process for which this query call is invoked
- * @wave_cnt: Output parameter updated with number of waves in flight that
+ * @pasid_wave_cnt: Output parameter updated with number of waves in flight that
  * belong to process with given pasid
  * @max_waves_per_cu: Output parameter updated with maximum number of waves
  * possible per Compute Unit
  *
- * @note: It's possible that the device has too many queues (oversubscription)
+ * Note: It's possible that the device has too many queues (oversubscription)
  * in which case a VMID could be remapped to a different PASID. This could lead
  * to an iaccurate wave count. Following is a high-level sequence:
  *    Time T1: vmid = getVmid(); vmid is associated with Pasid P1
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
