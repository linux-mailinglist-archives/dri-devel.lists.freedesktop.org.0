Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8412D3093
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 18:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DA46E03A;
	Tue,  8 Dec 2020 17:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61546E03A;
 Tue,  8 Dec 2020 17:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si2Yh8/u1CrhDVyypYmIwkvwmIOQuYJZ9Bbh6dzcSeLSGfvHAIFs2xWlKILN6zKdlDAxOO6mNA1vIEgJyJgHonjh9EzFijwcSUeybrGRINm3FC0/fAFLFyjQhrG6B6HAqwbdPPoc26LNXZX0DvF6G3RzZWtnXIpqokYvOj0fCMvZJQm684VbKFJM0FkXSrWDNRAIIC+SLyea9WNe2hze5oHuNFrdWSRTZ6IRyHFpEc81VhHmI0LoRFYPz/nj/BGuZTpvv0tpbwNV3ozluM69YwrbQFqa4x2RtAf10rc7f6CkWQjJP0nHdu4fRcFofJrSHpe/hEvpmOKjUc/JYgwa/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1YtTJUNlCKvgh1MGvLJx7s4PnHa7+hesUgjl4YsPY0=;
 b=iJ7QATAwm5iz+PpZkH13CYxHIarF434w5+aCdAVpnTlPUUoKpFoe6jkCDX75yt2okEY0kKQP3hajCLVYQXMJdW9uKIUkeR5bI3ZS3sb4OCB3MP4YqQHYHc9Kbgzmv4gvMuyp5146EL2rjRwoIq8doCojCwifHgFmeiyVAPDs7uChaCL3vFNuAC5sEJXqezsVdz7EU4x3odwIvNlV9nysEUrpNeJiS9jqNT/sbkFDK/r8vm0V9qVtGpD6MtgV7WDMF77CffjxYlxl11b+x9V3Z8Y2nKQ8xgbHGRTXCXs3aLlt15OhoRfm49uMr7zbz30e91fB1YFVD8S9RQ4Lcn6/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1YtTJUNlCKvgh1MGvLJx7s4PnHa7+hesUgjl4YsPY0=;
 b=wzwHhr3cjUxGtdocvOdLTd4WYffjAMa1ELO8rT+NCf6uhwoobCm8pmGm1XInNzyF+qaByguMIM4fA5NNquHBG3bUCHcuOfCvrWItOoA+iQxMaHNswh1MuEc5cLp/PIFosz+bRGUV0H5s0DRbJis9o2nUy48ysOxAMnNYwK0BAeE=
Received: from BN6PR16CA0017.namprd16.prod.outlook.com (2603:10b6:404:f5::27)
 by DM6PR12MB4779.namprd12.prod.outlook.com (2603:10b6:5:172::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 8 Dec
 2020 17:10:43 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::15) by BN6PR16CA0017.outlook.office365.com
 (2603:10b6:404:f5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 8 Dec 2020 17:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 17:10:43 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 8 Dec 2020
 11:10:43 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Tue, 8 Dec 2020 11:10:43 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs for imported BOs
Date: Tue, 8 Dec 2020 12:10:32 -0500
Message-ID: <1607447432-28982-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70352f76-394d-4897-0020-08d89b9c3297
X-MS-TrafficTypeDiagnostic: DM6PR12MB4779:
X-Microsoft-Antispam-PRVS: <DM6PR12MB47799A78C6689722324E7A5DEACD0@DM6PR12MB4779.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FUjAVqEyCsc2JF2R5B+Lpc+rNJ6DjXIfDF0r/WGVMY8E74k0cvfb49C7SLq0O4Xhjc9/rwoDj8UwhOObPaffibF5y0A8q7kI0KK8CjRixUEOnpkMmA9IIPWyE+fhbDIq+wrKqzq9tVm1131C+K5FA+48U1yVMkJJZV6AqhYQByeWgPYHjiTAZwpM+l1uD4GVqxZ3ZEKV/Xi/qqmJRfTb9EgdeB5VBluP2YzsKRbGleOmIatGHBblc3TBlGn07XyY0v7GuK20eJvoLg5yyhucWjYiUi5jAaa5FPISb7BLXNEhv/W/64y2OcdHlgmnhwjICNOql4A1q6RuUxMj26HjvruGzPLF30/jrkXhO4P3FNsFTiDIZVfET4pTLS2xo2u4emIArT8JxdKIiqB5wCztLQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966005)(478600001)(356005)(8936002)(82740400003)(426003)(4326008)(47076004)(8676002)(70586007)(82310400003)(6916009)(7696005)(5660300002)(2906002)(70206006)(86362001)(44832011)(36756003)(316002)(54906003)(6666004)(81166007)(2616005)(83380400001)(186003)(336012)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 17:10:43.8455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70352f76-394d-4897-0020-08d89b9c3297
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4779
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com,
 tzimmermann@suse.de, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For BOs imported from outside of amdgpu, setting of amdgpu_gem_object_funcs
was missing in amdgpu_dma_buf_create_obj. Fix by refactoring BO creation
and amdgpu_gem_object_funcs setting into single function called
from both code paths.

This fixes null ptr regression casued by commit
d693def drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 13 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 22 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h     |  5 +++++
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index e5919ef..da4d0ab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -405,6 +405,7 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
 	return buf;
 }
 
+
 /**
  * amdgpu_dma_buf_create_obj - create BO for DMA-buf import
  *
@@ -424,7 +425,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_bo *bo;
 	struct amdgpu_bo_param bp;
-	int ret;
+	struct drm_gem_object *obj;
 
 	memset(&bp, 0, sizeof(bp));
 	bp.size = dma_buf->size;
@@ -434,21 +435,19 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	bp.type = ttm_bo_type_sg;
 	bp.resv = resv;
 	dma_resv_lock(resv, NULL);
-	ret = amdgpu_bo_create(adev, &bp, &bo);
-	if (ret)
+	obj = amdgpu_gem_object_create_raw(adev, &bp);
+	if (IS_ERR(obj))
 		goto error;
 
+	bo = gem_to_amdgpu_bo(obj);
 	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
 	if (dma_buf->ops != &amdgpu_dmabuf_ops)
 		bo->prime_shared_count = 1;
 
-	dma_resv_unlock(resv);
-	return &bo->tbo.base;
-
 error:
 	dma_resv_unlock(resv);
-	return ERR_PTR(ret);
+	return obj;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index c9f94fb..5f22ce6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -52,13 +52,26 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
 	}
 }
 
+struct drm_gem_object *amdgpu_gem_object_create_raw(struct amdgpu_device *adev,
+						    struct amdgpu_bo_param *bp)
+{
+	struct amdgpu_bo *bo;
+	int r;
+
+	r = amdgpu_bo_create(adev, bp, &bo);
+	if (r)
+		return ERR_PTR(r);
+
+	bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
+	return &bo->tbo.base;
+}
+
 int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 			     int alignment, u32 initial_domain,
 			     u64 flags, enum ttm_bo_type type,
 			     struct dma_resv *resv,
 			     struct drm_gem_object **obj)
 {
-	struct amdgpu_bo *bo;
 	struct amdgpu_bo_param bp;
 	int r;
 
@@ -73,8 +86,9 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 retry:
 	bp.flags = flags;
 	bp.domain = initial_domain;
-	r = amdgpu_bo_create(adev, &bp, &bo);
-	if (r) {
+	*obj = amdgpu_gem_object_create_raw(adev, &bp);
+	if (IS_ERR(*obj)) {
+		r = PTR_ERR(*obj);
 		if (r != -ERESTARTSYS) {
 			if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
 				flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
@@ -90,8 +104,6 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 		}
 		return r;
 	}
-	*obj = &bo->tbo.base;
-	(*obj)->funcs = &amdgpu_gem_object_funcs;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
index 637bf51..a6b90d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
@@ -38,12 +38,17 @@ unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
 /*
  * GEM objects.
  */
+
+struct amdgpu_bo_param;
+
 void amdgpu_gem_force_release(struct amdgpu_device *adev);
 int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 			     int alignment, u32 initial_domain,
 			     u64 flags, enum ttm_bo_type type,
 			     struct dma_resv *resv,
 			     struct drm_gem_object **obj);
+struct drm_gem_object *amdgpu_gem_object_create_raw(struct amdgpu_device *adev,
+						    struct amdgpu_bo_param *bp);
 
 int amdgpu_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
