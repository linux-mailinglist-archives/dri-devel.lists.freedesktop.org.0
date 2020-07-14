Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8021E74D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 07:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62B6E8BF;
	Tue, 14 Jul 2020 05:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF3D6E892;
 Tue, 14 Jul 2020 05:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxxREK1mJ2EhhNDuGYDPESwro0KhYxTS6GZn/Qan3d4X/JDGpRkb4Ku8hxCIamBk7wxNORUVam9I74qJjNUs7bxi36BTIVWU5FQZVdZuIQJY1JJGnSIZSDfTl+uImSlI1YTNnBzi7NMVjt/WpJIq1XD5cqHcIJGOEr2KWw8zyJUzxSvR+2VzkQ0xWMOjl9B9QHrN2V4XFLn4UBvUUPmIJEqx1jV0u7EdcFxSKFwYa/Ub3yT+eS+ERiYEdb1DAnpvxMPX9bzrH12jKCBG+eRygvxQonsC/W4LdLVKEufpfw/3vs7/UhIeknbqr3AD1PgpN9LGiEpxv2IjNxPwmu/TXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ4XebT7QYALUYFMzpD2ymyQb5yG6m89XJDXODE0uzA=;
 b=ChHqg/BjOdeOCT5Kn1vLOr2eKwmDfR/LdNSmiDOrgr80p6fmychmqRA/ENYU/XrNoL6kwLH3O2/hoqMkZfTk5eXYZkH5e4OFnT8/RmFfDsVd6KQnrM8mbvpXlUM97tAsMmT/d7Vm/hILo5+TQLJJArBznacCuXi4DJEE1Zekp4BngrzoPu2km7vLYKTl8YO5FBpl3rzkHDoMvDvmv7cIiimsvs1kWAHT+Hqm0wry299PWgQnkxKP5GWcfHJD5IWpPufEXLC3lQQ88DBvui5E7ioLrjr/eRtQixXFkz4CA6SxLAbRHjgbkMaMK9Tiz0+1eSfAcatC5skB1wRYd89QAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ4XebT7QYALUYFMzpD2ymyQb5yG6m89XJDXODE0uzA=;
 b=SQLloZmHE6Cbha6lyD5NIuOz6KKvVND4Y9avvTFO8LthnDSoBqTDKdY6wL4cyRAcWOzFbVJCa9bdyngYB2U2yGMLU6VeVV6TlYBKAhs7Tjg0z58rRaCqtB9nCEK+sHpKoVdJdPMu9Zoj7eX3lc4zqjWYVPTVUquU/dISocgbHL4=
Received: from DM5PR12MB2533.namprd12.prod.outlook.com (2603:10b6:4:b0::10) by
 DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22; Tue, 14 Jul 2020 05:05:38 +0000
Received: from DM5PR12MB2533.namprd12.prod.outlook.com
 ([fe80::2d85:c08d:4782:e3a]) by DM5PR12MB2533.namprd12.prod.outlook.com
 ([fe80::2d85:c08d:4782:e3a%7]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 05:05:38 +0000
From: "Li, Dennis" <Dennis.Li@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] drm/amdkfd: Add IPC API
Thread-Topic: [PATCH 1/1] drm/amdkfd: Add IPC API
Thread-Index: AQHWWYz42RrG3mXe/Eem0N7smiKFzqkGg6ig
Date: Tue, 14 Jul 2020 05:05:38 +0000
Message-ID: <DM5PR12MB25339F7F2F9EE50AF9DB5736ED610@DM5PR12MB2533.namprd12.prod.outlook.com>
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
In-Reply-To: <20200714031435.13362-2-Felix.Kuehling@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-07-14T05:05:33Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=e83d56d3-ecd6-4e48-b69a-f238555c99e6;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0df4306-1e7c-461b-7a52-08d827b38cc0
x-ms-traffictypediagnostic: DM6PR12MB4331:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4331C7C620EFC3F280C9F9F0ED610@DM6PR12MB4331.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KTR/Jk1CSM37y4tj7JbfHP3oR+mHWBsZqiVhj0bdmAxJgZbIMKItTOaPwjHNgB2HQoLc6jOdr37K6TbcB2ae7POnlCJ5ktJM6Zrm8tJTuMbGVZYymzzVJMi+3s123OnWbhKtaQ9W9P2QWFvzr2SWip5dNC/ewMjtTFk02593dTGPtiQludFfmDpjUJNGipB0Oz4oQsdkuwUDpzekuTzfM8Y7HbrATdgz/+uFAFbZCDzM+Ka/0pOO2uoX+kd7TzNraHSyYHoa2yoFGL9kmnXF/eOsqyx9CedZLMtP8sRWpA4KCNHKP0lCkKA14l6UBYcfOXYZAat03mEp7DzsgCxzlKuibdN1uWkzgBptrrNN89A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2533.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(8936002)(83380400001)(52536014)(4326008)(8676002)(2906002)(33656002)(30864003)(5660300002)(66556008)(66446008)(66476007)(76116006)(64756008)(66946007)(86362001)(45080400002)(26005)(186003)(54906003)(7696005)(71200400001)(966005)(478600001)(55016002)(6506007)(110136005)(316002)(53546011)(9686003)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: whpDG2wI83W7AiTBAcosVIo67MBQbyZZ9o51qOuP0YMC4Eya/ShassDM/od0PsO6McgSLuoWYs2tgKpeUCusSIytuCk+9BddwrjA9dhRO8lvQ3SpOXw5Tq1DW0lm0nzJ2OoxQvhhz9og/AD5zNJ43LdRk/aWEcR6P5PSD7oM4dkpExu/yyamPifvlE4d9APVgd/mu7g40rt9shJPloOAz1xR/YxRTEooqpcyyPkKi3XW3xUYgkeezcgiLkpAwSJsLIzviApHWPM04BkCJWzwgFFFERzK4/QD/QIEooGr1TMJ4yZ11LMR5k7S13gen8x1hhlOv531P1z8lsl4+1oSai/wJx6+BdaiJ+Coni5CfqcqEB0FLtX3Wo6L7F84G4s8ivw/tBumItm8/POYHKs1Kvy2QWhLO+TT7J2bfbjCDUEfQViU/BP3FUFVxj5GZj6745VbcrHiYT9odSgkQxZYUVhJSownhf7c8Z5RSlpyxLzVZmDizjrFeZyEJ0mT3AS4
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2533.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0df4306-1e7c-461b-7a52-08d827b38cc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 05:05:38.6229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mde+dMDCnJuCbxBlDke5qtVaG/8+/WjaXdaOOxqtSWmDHGp150nGYJy0P2c64RaZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Hi, Felix,
      amdgpu_gem_prime_export has different define in the old driver. I added some comment in the below codes. 

Best Regards
Dennis Li
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Felix Kuehling
Sent: Tuesday, July 14, 2020 11:15 AM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; daniel.vetter@ffwll.ch; airlied@gmail.com
Subject: [PATCH 1/1] drm/amdkfd: Add IPC API

This allows exporting and importing buffers. The API generates handles that can be used with the HIP IPC API, i.e. big numbers rather than file descriptors.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  56 +++-
 drivers/gpu/drm/amd/amdkfd/Makefile           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  74 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_ipc.c          | 263 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_ipc.h          |  55 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_module.c       |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +
 include/uapi/linux/kfd_ioctl.h                |  62 ++++-
 9 files changed, 488 insertions(+), 40 deletions(-)  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_ipc.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_ipc.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 3f2b695cf19e..0f8dc4c4f924 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -49,6 +49,7 @@ struct kfd_bo_va_list {  struct kgd_mem {
 	struct mutex lock;
 	struct amdgpu_bo *bo;
+	struct kfd_ipc_obj *ipc_obj;
 	struct list_head bo_va_list;
 	/* protected by amdkfd_process_info.lock */
 	struct ttm_validate_buffer validate_list; @@ -240,9 +241,13 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dmabuf,
+				      struct kfd_ipc_obj *ipc_obj,
 				      uint64_t va, void *vm,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
+int amdgpu_amdkfd_gpuvm_export_ipc_obj(struct kgd_dev *kgd, void *vm,
+				       struct kgd_mem *mem,
+				       struct kfd_ipc_obj **ipc_obj);
 
 void amdgpu_amdkfd_gpuvm_init_mem_limits(void);
 void amdgpu_amdkfd_unreserve_memory_limit(struct amdgpu_bo *bo); diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index c408936e8f98..cd5f23c0c2ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -29,6 +29,7 @@
 #include "amdgpu_vm.h"
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_dma_buf.h"
+#include "kfd_ipc.h"
 #include <uapi/linux/kfd_ioctl.h>
 
 /* BO flag to indicate a KFD userptr BO */ @@ -1353,6 +1354,9 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 			*size = 0;
 	}
 
+	/* Unreference the ipc_obj if applicable */
+	kfd_ipc_obj_put(&mem->ipc_obj);
+
 	/* Free the BO*/
 	drm_gem_object_put_unlocked(&mem->bo->tbo.base);
 	mutex_destroy(&mem->lock);
@@ -1656,6 +1660,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dma_buf,
+				      struct kfd_ipc_obj *ipc_obj,
 				      uint64_t va, void *vm,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset)
@@ -1692,15 +1697,18 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 
 	INIT_LIST_HEAD(&(*mem)->bo_va_list);
 	mutex_init(&(*mem)->lock);
-	
-	(*mem)->alloc_flags =
-		((bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
-		KFD_IOC_ALLOC_MEM_FLAGS_VRAM : KFD_IOC_ALLOC_MEM_FLAGS_GTT)
-		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
-		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
+	if (bo->kfd_bo)
+		(*mem)->alloc_flags = bo->kfd_bo->alloc_flags;
+	else
+		(*mem)->alloc_flags =
+			((bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
+			KFD_IOC_ALLOC_MEM_FLAGS_VRAM : KFD_IOC_ALLOC_MEM_FLAGS_GTT)
+			| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
+			| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
 
 	drm_gem_object_get(&bo->tbo.base);
 	(*mem)->bo = bo;
+	(*mem)->ipc_obj = ipc_obj;
 	(*mem)->va = va;
 	(*mem)->domain = (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
 		AMDGPU_GEM_DOMAIN_VRAM : AMDGPU_GEM_DOMAIN_GTT; @@ -1713,6 +1721,42 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 	return 0;
 }
 
+int amdgpu_amdkfd_gpuvm_export_ipc_obj(struct kgd_dev *kgd, void *vm,
+				       struct kgd_mem *mem,
+				       struct kfd_ipc_obj **ipc_obj) {
+	struct amdgpu_device *adev = NULL;
+	struct dma_buf *dmabuf;
+	int r = 0;
+
+	if (!kgd || !vm || !mem)
+		return -EINVAL;
+
+	adev = get_amdgpu_device(kgd);
+	mutex_lock(&mem->lock);
+
+	if (mem->ipc_obj) {
+		*ipc_obj = mem->ipc_obj;
+		goto unlock_out;
+	}
+
+	dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base, 0);

[Dennis Li] It may be changed as the following to make sure it also work well in old kernel. 
#ifdef HAVE_DRM_DRV_GEM_PRIME_EXPORT_PI
	dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base, 0);
#else
	dmabuf = amdgpu_gem_prime_export(adev->ddev , &mem->bo->tbo.base, 0);
#endif

+	if (IS_ERR(dmabuf)) {
+		r = PTR_ERR(dmabuf);
+		goto unlock_out;
+	}
+
+	r = kfd_ipc_store_insert(dmabuf, &mem->ipc_obj);
+	if (r)
+		dma_buf_put(dmabuf);
+	else
+		*ipc_obj = mem->ipc_obj;
+
+unlock_out:
+	mutex_unlock(&mem->lock);
+	return r;
+}
+
 /* Evict a userptr BO by stopping the queues if necessary
  *
  * Runs in MMU notifier, may be in RECLAIM_FS context. This means it diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index e1e4115dcf78..815d9a9e7a3c 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -54,7 +54,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_dbgdev.o \
 		$(AMDKFD_PATH)/kfd_dbgmgr.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
-		$(AMDKFD_PATH)/kfd_crat.o
+		$(AMDKFD_PATH)/kfd_crat.o \
+		$(AMDKFD_PATH)/kfd_ipc.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e9b96ad3d9a5..e7d15fa02b5e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -38,6 +38,7 @@
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
 #include "kfd_dbgmgr.h"
+#include "kfd_ipc.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
 
@@ -1691,53 +1692,58 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 				   struct kfd_process *p, void *data)  {
 	struct kfd_ioctl_import_dmabuf_args *args = data;
-	struct kfd_process_device *pdd;
-	struct dma_buf *dmabuf;
 	struct kfd_dev *dev;
-	int idr_handle;
-	uint64_t size;
-	void *mem;
 	int r;
 
 	dev = kfd_device_by_id(args->gpu_id);
 	if (!dev)
 		return -EINVAL;
 
-	dmabuf = dma_buf_get(args->dmabuf_fd);
-	if (IS_ERR(dmabuf))
-		return PTR_ERR(dmabuf);
+	r = kfd_ipc_import_dmabuf(dev, p, args->dmabuf_fd,
+				  args->va_addr, &args->handle, NULL);
+	if (r)
+		pr_err("Failed to import dmabuf\n");
 
-	mutex_lock(&p->mutex);
+	return r;
+}
 
-	pdd = kfd_bind_process_to_device(dev, p);
-	if (IS_ERR(pdd)) {
-		r = PTR_ERR(pdd);
-		goto err_unlock;
-	}
+static int kfd_ioctl_ipc_export_handle(struct file *filep,
+				       struct kfd_process *p,
+				       void *data)
+{
+	struct kfd_ioctl_ipc_export_handle_args *args = data;
+	struct kfd_dev *dev;
+	int r;
+
+	dev = kfd_device_by_id(args->gpu_id);
+	if (!dev)
+		return -EINVAL;
 
-	r = amdgpu_amdkfd_gpuvm_import_dmabuf(dev->kgd, dmabuf,
-					      args->va_addr, pdd->vm,
-					      (struct kgd_mem **)&mem, &size,
-					      NULL);
+	r = kfd_ipc_export_as_handle(dev, p, args->handle, 
+args->share_handle);
 	if (r)
-		goto err_unlock;
+		pr_err("Failed to export IPC handle\n");
 
-	idr_handle = kfd_process_device_create_obj_handle(pdd, mem);
-	if (idr_handle < 0) {
-		r = -EFAULT;
-		goto err_free;
-	}
+	return r;
+}
 
-	mutex_unlock(&p->mutex);
+static int kfd_ioctl_ipc_import_handle(struct file *filep,
+				       struct kfd_process *p,
+				       void *data)
+{
+	struct kfd_ioctl_ipc_import_handle_args *args = data;
+	struct kfd_dev *dev = NULL;
+	int r;
 
-	args->handle = MAKE_HANDLE(args->gpu_id, idr_handle);
+	dev = kfd_device_by_id(args->gpu_id);
+	if (!dev)
+		return -EINVAL;
 
-	return 0;
+	r = kfd_ipc_import_handle(p, args->share_handle, args->va_addr,
+				  &args->handle, &args->gpu_id,
+				  &args->mmap_offset);
+	if (r)
+		pr_err("Failed to import IPC handle\n");
 
-err_free:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, (struct kgd_mem *)mem, NULL);
-err_unlock:
-	mutex_unlock(&p->mutex);
 	return r;
 }
 
@@ -1853,6 +1859,12 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SMI_EVENTS,
 			kfd_ioctl_smi_events, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_IPC_IMPORT_HANDLE,
+				kfd_ioctl_ipc_import_handle, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_IPC_EXPORT_HANDLE,
+				kfd_ioctl_ipc_export_handle, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_ipc.c b/drivers/gpu/drm/amd/amdkfd/kfd_ipc.c
new file mode 100644
index 000000000000..3de8d7826f07
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_ipc.c
@@ -0,0 +1,263 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person 
+obtaining a
+ * copy of this software and associated documentation files (the 
+"Software"),
+ * to deal in the Software without restriction, including without 
+limitation
+ * the rights to use, copy, modify, merge, publish, distribute, 
+sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom 
+the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be 
+included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
+EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
+MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
+SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
+DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
+OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE 
+OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/slab.h>
+#include <linux/random.h>
+
+#include "kfd_ipc.h"
+#include "kfd_priv.h"
+#include "amdgpu_amdkfd.h"
+
+#define KFD_IPC_HASH_TABLE_SIZE_SHIFT 4 #define 
+KFD_IPC_HASH_TABLE_SIZE_MASK ((1 << KFD_IPC_HASH_TABLE_SIZE_SHIFT) - 1)
+
+static struct kfd_ipc_handles {
+	DECLARE_HASHTABLE(handles, KFD_IPC_HASH_TABLE_SIZE_SHIFT);
+	struct mutex lock;
+} kfd_ipc_handles;
+
+/* Since, handles are random numbers, it can be used directly as hashing key.
+ * The least 4 bits of the handle are used as key. However, during 
+import all
+ * 128 bits of the handle are checked to prevent handle snooping.
+ */
+#define HANDLE_TO_KEY(sh) ((*(uint64_t *)sh) & 
+KFD_IPC_HASH_TABLE_SIZE_MASK)
+
+int kfd_ipc_store_insert(struct dma_buf *dmabuf, struct kfd_ipc_obj 
+**ipc_obj) {
+	struct kfd_ipc_obj *obj;
+
+	obj = kmalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return -ENOMEM;
+
+	/* The initial ref belongs to the allocator process.
+	 * The IPC object store itself does not hold a ref since
+	 * there is no specific moment in time where that ref should
+	 * be dropped, except "when there are no more userspace processes
+	 * holding a ref to the object". Therefore the removal from IPC
+	 * storage happens at ipc_obj release time.
+	 */
+	kref_init(&obj->ref);
+	obj->dmabuf = dmabuf;
+	get_random_bytes(obj->share_handle, sizeof(obj->share_handle));
+
+	mutex_lock(&kfd_ipc_handles.lock);
+	hlist_add_head(&obj->node,
+		&kfd_ipc_handles.handles[HANDLE_TO_KEY(obj->share_handle)]);
+	mutex_unlock(&kfd_ipc_handles.lock);
+
+	if (ipc_obj)
+		*ipc_obj = obj;
+
+	return 0;
+}
+
+static void ipc_obj_release(struct kref *r) {
+	struct kfd_ipc_obj *obj;
+
+	obj = container_of(r, struct kfd_ipc_obj, ref);
+
+	mutex_lock(&kfd_ipc_handles.lock);
+	hash_del(&obj->node);
+	mutex_unlock(&kfd_ipc_handles.lock);
+
+	dma_buf_put(obj->dmabuf);
+	kfree(obj);
+}
+
+static struct kfd_ipc_obj *ipc_obj_get(struct kfd_ipc_obj *obj) {
+	if (kref_get_unless_zero(&obj->ref))
+		return obj;
+	return NULL;
+}
+
+void kfd_ipc_obj_put(struct kfd_ipc_obj **obj) {
+	if (*obj) {
+		kref_put(&(*obj)->ref, ipc_obj_release);
+		*obj = NULL;
+	}
+}
+
+int kfd_ipc_init(void)
+{
+	mutex_init(&kfd_ipc_handles.lock);
+	hash_init(kfd_ipc_handles.handles);
+	return 0;
+}
+
+static int kfd_import_dmabuf_create_kfd_bo(struct kfd_dev *dev,
+					   struct kfd_process *p,
+					   struct dma_buf *dmabuf,
+					   struct kfd_ipc_obj *ipc_obj,
+					   uint64_t va_addr, uint64_t *handle,
+					   uint64_t *mmap_offset)
+{
+	int r;
+	void *mem;
+	uint64_t size;
+	int idr_handle;
+	struct kfd_process_device *pdd = NULL;
+
+	if (!handle)
+		return -EINVAL;
+
+	if (!dev)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+
+	pdd = kfd_bind_process_to_device(dev, p);
+	if (IS_ERR(pdd)) {
+		r = PTR_ERR(pdd);
+		goto err_unlock;
+	}
+
+	r = amdgpu_amdkfd_gpuvm_import_dmabuf(dev->kgd, dmabuf, ipc_obj,
+					va_addr, pdd->vm,
+					(struct kgd_mem **)&mem, &size,
+					mmap_offset);
+	if (r)
+		goto err_unlock;
+
+	idr_handle = kfd_process_device_create_obj_handle(pdd, mem);
+	if (idr_handle < 0) {
+		r = -EFAULT;
+		goto err_free;
+	}
+
+	mutex_unlock(&p->mutex);
+
+	*handle = MAKE_HANDLE(dev->id, idr_handle);
+
+	return 0;
+
+err_free:
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, (struct kgd_mem *)mem,
+					       NULL);
+err_unlock:
+	mutex_unlock(&p->mutex);
+	return r;
+}
+
+int kfd_ipc_import_dmabuf(struct kfd_dev *dev, struct kfd_process *p,
+			  int dmabuf_fd, uint64_t va_addr,
+			  uint64_t *handle, uint64_t *mmap_offset) {
+	int r;
+	struct dma_buf *dmabuf = dma_buf_get(dmabuf_fd);
+
+	if (!dmabuf)
+		return -EINVAL;
+
+	r = kfd_import_dmabuf_create_kfd_bo(dev, p, dmabuf, NULL,
+					    va_addr, handle, mmap_offset);
+	dma_buf_put(dmabuf);
+	return r;
+}
+
+int kfd_ipc_import_handle(struct kfd_process *p,
+			  uint32_t *share_handle, uint64_t va_addr,
+			  uint64_t *handle, uint32_t *gpu_id,
+			  uint64_t *mmap_offset)
+{
+	struct kfd_dev *dev;
+	int r;
+	struct kfd_ipc_obj *entry, *found = NULL;
+
+	mutex_lock(&kfd_ipc_handles.lock);
+	/* Convert the user provided handle to hash key and search only in that
+	 * bucket
+	 */
+	hlist_for_each_entry(entry,
+		&kfd_ipc_handles.handles[HANDLE_TO_KEY(share_handle)], node) {
+		if (!memcmp(entry->share_handle, share_handle,
+			    sizeof(entry->share_handle))) {
+			found = ipc_obj_get(entry);
+			break;
+		}
+	}
+	mutex_unlock(&kfd_ipc_handles.lock);
+
+	if (!found)
+		return -EINVAL;
+
+	pr_debug("Found ipc_dma_buf: %p\n", found->dmabuf);
+
+	dev = kfd_device_by_id(found->gpu_id);
+	if (!dev)
+		return -ENODEV;
+
+	r = kfd_import_dmabuf_create_kfd_bo(dev, p, found->dmabuf, found,
+					    va_addr, handle, mmap_offset);
+	if (r)
+		goto error_unref;
+
+	*gpu_id = found->gpu_id;
+
+	return r;
+
+error_unref:
+	kfd_ipc_obj_put(&found);
+	return r;
+}
+
+int kfd_ipc_export_as_handle(struct kfd_dev *dev, struct kfd_process *p,
+			     uint64_t handle, uint32_t *ipc_handle) {
+	struct kfd_process_device *pdd = NULL;
+	struct kfd_ipc_obj *ipc_obj;
+	struct kgd_mem *mem;
+	int r;
+
+	if (!dev || !ipc_handle)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+	pdd = kfd_bind_process_to_device(dev, p);
+	if (IS_ERR(pdd)) {
+		mutex_unlock(&p->mutex);
+		pr_err("Failed to get pdd\n");
+		return PTR_ERR(pdd);
+	}
+
+	mem = kfd_process_device_translate_handle(pdd, GET_IDR_HANDLE(handle));
+	mutex_unlock(&p->mutex);
+
+	if (!mem) {
+		pr_err("Failed to get bo");
+		return -EINVAL;
+	}
+
+	r = amdgpu_amdkfd_gpuvm_export_ipc_obj(dev->kgd, pdd->vm, mem,
+					       &ipc_obj);
+	if (r)
+		return r;
+
+	ipc_obj->gpu_id = dev->id;
+	memcpy(ipc_handle, ipc_obj->share_handle,
+	       sizeof(ipc_obj->share_handle));
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_ipc.h b/drivers/gpu/drm/amd/amdkfd/kfd_ipc.h
new file mode 100644
index 000000000000..9450a667918e
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_ipc.h
@@ -0,0 +1,55 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person 
+obtaining a
+ * copy of this software and associated documentation files (the 
+"Software"),
+ * to deal in the Software without restriction, including without 
+limitation
+ * the rights to use, copy, modify, merge, publish, distribute, 
+sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom 
+the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be 
+included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
+EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
+MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
+SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
+DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
+OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE 
+OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef KFD_IPC_H_
+#define KFD_IPC_H_
+
+#include <linux/types.h>
+#include <linux/dma-buf.h>
+
+/* avoid including kfd_priv.h */
+struct kfd_dev;
+struct kfd_process;
+
+struct kfd_ipc_obj {
+	struct hlist_node node;
+	struct kref ref;
+	struct dma_buf *dmabuf;
+	uint32_t share_handle[4];
+	uint32_t gpu_id;
+};
+
+int kfd_ipc_import_handle(struct kfd_process *p,
+			  uint32_t *share_handle, uint64_t va_addr,
+			  uint64_t *handle, uint32_t *gpu_id,
+			  uint64_t *mmap_offset);
+int kfd_ipc_import_dmabuf(struct kfd_dev *kfd, struct kfd_process *p,
+			  int dmabuf_fd, uint64_t va_addr,
+			  uint64_t *handle, uint64_t *mmap_offset); int 
+kfd_ipc_export_as_handle(struct kfd_dev *dev, struct kfd_process *p,
+			     uint64_t handle, uint32_t *ipc_handle);
+
+int kfd_ipc_store_insert(struct dma_buf *dmabuf, struct kfd_ipc_obj 
+**ipc_obj); void kfd_ipc_obj_put(struct kfd_ipc_obj **obj);
+
+#endif /* KFD_IPC_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_module.c b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
index f4b7f7e6c40e..0946d5692692 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_module.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
@@ -52,6 +52,10 @@ static int kfd_init(void)
 	if (err < 0)
 		goto err_topology;
 
+	err = kfd_ipc_init();
+	if (err < 0)
+		goto err_ipc;
+
 	err = kfd_process_create_wq();
 	if (err < 0)
 		goto err_create_wq;
@@ -66,6 +70,7 @@ static int kfd_init(void)
 	return 0;
 
 err_create_wq:
+err_ipc:
 	kfd_topology_shutdown();
 err_topology:
 	kfd_chardev_exit();
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 51ba2020732e..1588b2b45a32 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -321,6 +321,8 @@ struct kfd_dev {
 	spinlock_t smi_lock;
 };
 
+struct kfd_ipc_obj;
+
 enum kfd_mempool {
 	KFD_MEMPOOL_SYSTEM_CACHEABLE = 1,
 	KFD_MEMPOOL_SYSTEM_WRITECOMBINE = 2,
@@ -1087,6 +1089,9 @@ int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p);
 
 bool kfd_is_locked(void);
 
+/* IPC Support */
+int kfd_ipc_init(void);
+
 /* Compute profile */
 void kfd_inc_compute_active(struct kfd_dev *dev);  void kfd_dec_compute_active(struct kfd_dev *dev); diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h index f738c3b53f4e..90ff334e2b5b 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -29,9 +29,10 @@
 /*
  * - 1.1 - initial version
  * - 1.3 - Add SMI events support
+ * - 1.4 - Add IPC export/import
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 3
+#define KFD_IOCTL_MINOR_VERSION 4
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
@@ -464,6 +465,57 @@ enum kfd_mmio_remap {
 	KFD_MMIO_REMAP_HDP_REG_FLUSH_CNTL = 4,  };
 
+/* Export IPC handle
+ *
+ * @handle[in]:         buffer handle of the BO to export
+ * @gpu_id[in]:         GPU ID where @handle was allocated
+ * @share_handle[out]:  share handle that can be used with
+ *                      @kfd_ioctl_ipc_import_handle_args
+ *
+ * @share_handle is a 128 bit random number generated with
+ * @get_random_bytes. This number should be very hard to guess.
+ * Knowledge of the @share_handle implies authorization to access
+ * the shared memory. User mode should treat it like a secret key.
+ * It can be used to import this BO in a different process context
+ * for IPC buffer sharing. The handle will be valid as long as the
+ * underlying BO exists. If the same BO is exported multiple times,
+ * the same handle will be returned.
+ *
+ * Return 0 on success, negative errno on errors.
+ */
+struct kfd_ioctl_ipc_export_handle_args {
+	__u64 handle;		/* to KFD */
+	__u32 share_handle[4];	/* from KFD */
+	__u32 gpu_id;		/* to KFD */
+	__u32 pad;
+};
+
+/* Import IPC handle
+ *
+ * @share_handle[in]:  share handle from @kfd_ioctl_ipc_export_handle_args
+ * @va_addr[in]:       virtual address at which to import the BO
+ * @handle[out]:       buffer handle of the imported BO
+ * @gpu_id[out]:       device in which the shared BO was created
+ * @mmap_offset[out]:  mmap offset for CPU-mapping the BO
+ *
+ * @handle represents a new reference to the shared BO. This reference
+ * must be released with kfd_ioctl_free_memory_of_gpu_args.
+ *
+ * The BO can be mapped for GPU access with @kfd_ioctl_map_memory_to_gpu_args.
+ *
+ * It can be mapped for CPU access using the @mmap_offset.
+ *
+ * Return 0 on success, negative errno on errors.
+ */
+struct kfd_ioctl_ipc_import_handle_args {
+	__u64 handle;		/* from KFD */
+	__u64 va_addr;		/* to KFD */
+	__u64 mmap_offset;	/* from KFD */
+	__u32 share_handle[4];	/* to KFD */
+	__u32 gpu_id;		/* from KFD */
+	__u32 pad;
+};
+
 #define AMDKFD_IOCTL_BASE 'K'
 #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
 #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
@@ -564,7 +616,13 @@ enum kfd_mmio_remap {
 #define AMDKFD_IOC_SMI_EVENTS			\
 		AMDKFD_IOWR(0x1F, struct kfd_ioctl_smi_events_args)
 
+#define AMDKFD_IOC_IPC_IMPORT_HANDLE                                    \
+		AMDKFD_IOWR(0x20, struct kfd_ioctl_ipc_import_handle_args)
+
+#define AMDKFD_IOC_IPC_EXPORT_HANDLE		\
+		AMDKFD_IOWR(0x21, struct kfd_ioctl_ipc_export_handle_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x20
+#define AMDKFD_COMMAND_END		0x22
 
 #endif
--
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7CDennis.Li%40amd.com%7C3c0d831fd7404f9ae71508d827a4191b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637302933043451790&amp;sdata=FxF5FhJK8DZ3RNOmKHMXAFfUNb%2BvQUs3V0LZAwQkC24%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
