Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E217CD7D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD166E13B;
	Sat,  7 Mar 2020 10:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241FF6ECC8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:30:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AORpl008903; Fri, 6 Mar 2020 11:29:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=IukcALM/LFo7ZNhzI6tBOK/8vY0XhfAkNL6xF8zqy74=;
 b=Ul/MkeLhpH/q64O3k75Vdqz6ozVq6MZJjG2A7UeOrtjCIz9waVVko9idTMLpfpjusg/J
 UOa/+IlwZ0GlIh5dTy0lzI3lu5B+d7aFo5TYbtJBgJKVRtg8VyawXtPh8G2shSHd7Lpc
 KAUnURftrnyBRwjm21SBUz70eeacDbadq3fVsC5djJ/oXRmhyzy1CEUJYDDCa8TzsBgo
 IjMsSvXhKKU0gt93iv2EpQYaqFSAtzFSSUKgZSdctAuXwbGWi40k2bzjhhCUpuP2ae97
 BbeXCHs3IzwgRmDgICtCSzKnEhWXj1pdSbmFhQWMThjmR1OlrJiQsK3rP0oF/WzlX6xX GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea7ej2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:29:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72D69100038;
 Fri,  6 Mar 2020 11:29:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4781D2A76CB;
 Fri,  6 Mar 2020 11:29:40 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 6 Mar 2020 11:29:39
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <emil.l.velikov@gmail.com>
Subject: [PATCH] drm: vm: Clean up documentation
Date: Fri, 6 Mar 2020 11:29:34 +0100
Message-ID: <20200306102937.4932-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel doc comments to avoid warnings when compiling with W=1.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/gpu/drm/drm_vm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 64619fe90046..aa88911bbc06 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -102,7 +102,7 @@ static pgprot_t drm_dma_prot(uint32_t map_type, struct vm_area_struct *vma)
 	return tmp;
 }
 
-/**
+/*
  * \c fault method for AGP virtual memory.
  *
  * \param vma virtual memory area.
@@ -192,7 +192,7 @@ static vm_fault_t drm_vm_fault(struct vm_fault *vmf)
 }
 #endif
 
-/**
+/*
  * \c nopage method for shared virtual memory.
  *
  * \param vma virtual memory area.
@@ -225,7 +225,7 @@ static vm_fault_t drm_vm_shm_fault(struct vm_fault *vmf)
 	return 0;
 }
 
-/**
+/*
  * \c close method for shared virtual memory.
  *
  * \param vma virtual memory area.
@@ -294,7 +294,7 @@ static void drm_vm_shm_close(struct vm_area_struct *vma)
 	mutex_unlock(&dev->struct_mutex);
 }
 
-/**
+/*
  * \c fault method for DMA virtual memory.
  *
  * \param address access address.
@@ -329,7 +329,7 @@ static vm_fault_t drm_vm_dma_fault(struct vm_fault *vmf)
 	return 0;
 }
 
-/**
+/*
  * \c fault method for scatter-gather virtual memory.
  *
  * \param address access address.
@@ -435,7 +435,7 @@ static void drm_vm_close_locked(struct drm_device *dev,
 	}
 }
 
-/**
+/*
  * \c close method for all virtual memory types.
  *
  * \param vma virtual memory area.
@@ -453,7 +453,7 @@ static void drm_vm_close(struct vm_area_struct *vma)
 	mutex_unlock(&dev->struct_mutex);
 }
 
-/**
+/*
  * mmap DMA memory.
  *
  * \param file_priv DRM file private.
@@ -513,7 +513,7 @@ static resource_size_t drm_core_get_reg_ofs(struct drm_device *dev)
 #endif
 }
 
-/**
+/*
  * mmap DMA memory.
  *
  * \param file_priv DRM file private.
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
