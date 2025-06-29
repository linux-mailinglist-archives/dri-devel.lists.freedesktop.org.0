Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032AFAECD5A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1A310E2C2;
	Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZSmCBvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D606610E345
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCs0Ch002765
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
 mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=VZSmCBvGgZjdmydzwZ5DBStUTGQ
 UV9Wqke/L28Nva2w5HQeQ3RLj3WtxSH4mPGU6WroNOAwfG1uLj55alMN/mx4iMXm
 qvFYN3RLYlRlCfYnGVxxWXrd9fGaBDkp7v7Kh1Xyd9PlSN5RAOdM3iU1dgHCD0X+
 Pnk6U09kU0/VB8JRQe/Qq/dQzBBOLTzipDnqWv1jTD0Cn4wExz7pe+R8To0OI9xr
 QMOw51Uw38FgQOHZa4i5qICMDKEdiKn+uDSImuwBabTtDDG9y4R9EVAd0j/d0Oa9
 mS5xLpkclwaY0KidVBIhUAd08jjCo6kueta+FSzce9iPHLitVfP5tXdON3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2eyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b26e33ae9d5so1901193a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206087; x=1751810887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
 b=DY9gKue5fyuqKrCCsS+HYJglBuNNHLIvZcEUdAQv4TqbxZtzfFpNkJg6yYa219nS9w
 nyp92l4Qc5VJJ9fLitDmFbk7O/9vT6Qd0x4iBZZd+HlzA82c6zLC7kTGLMjtOi9dWTU2
 hyo2rK3YSr8fJXD2x0nPdtwXYQP39UUmgq5QObmZkZXE2PtMG4OKcU71CdrRhdGRpeuh
 K8C5gbcxuFtBVB0e2UXJxv788p4yVdd2FFkdRA004jv3kxKqVQdqS+9hWV1AINYA38kO
 XZQVPwu/Ihra81RmYw7oNGa9Zdrjk8bwIbNZ8hYv6V+hMyQROeD0O38Tz75jVlk2EkOo
 hRLw==
X-Gm-Message-State: AOJu0Yx9Um52sHJRQSFYcNETO9EDv+5fhdf8RP6YQ3HSEUrBkUIN322y
 mtdMpJqBLog4yfNuiwcraPC3P2IinYWtPMdKATOnX4x6fVtgzsJ5GyrFye+nIWyvXlrXu+BOIOz
 6CZ3JYGyVIPO3ynI+9FrPLiJKOxIwGDsS9ecBeG9of9l5gLRz6fH5MIFjlsyyPKzoZBpAevhOu6
 A7Yjo=
X-Gm-Gg: ASbGncs0gI2U8syU6bCVboMNcc6TM/UHnGG5ncJyl+58K8Zq4f5hOwkQ14JASFNfh31
 XJEP6rSVguqqsFvkiABAK1T84YvwKl7CyRTibIAEVh6xNqumoYBJqNybZAF5Z8juM77MCWwUfB/
 +3+fRfDaq2GQK3Zy+jt5Vg+Ii1M4jt0IOBi113pvXIQRbzsmv0YhS0d+RnlJBC8uf4XPzXdwEjj
 FSTlUFMsMcASbldTFZNUEPTZ38nnNyaRUk4zPN9qHQv+ykOkMkHdUkxdshlhc9djp/nyuUBsqfJ
 J1bW0OIAP+PuOfykwHNKaWxYY9huEoj3
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id
 98e67ed59e1d1-318c8eed32amr14074253a91.11.1751206087605; 
 Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYkvmCpaWJmCDoX/uhVGt0Pk6ICFtUgsS6BHNOC2nwdb/Xmkyt9dsqSqbLYw4AbYMUQq+a2w==
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id
 98e67ed59e1d1-318c8eed32amr14074204a91.11.1751206087057; 
 Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bc7dsm59102335ad.114.2025.06.29.07.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 07:03:35 -0700
Message-ID: <20250629140537.30850-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bJsgs6tQkV3t939Tt8SNiTQtMpyU0NAK
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148c8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: bJsgs6tQkV3t939Tt8SNiTQtMpyU0NAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX3cIQw+dwkKtp
 /W4RTrDPWAdKFDaPwPWoIvANU4W28JiJ1DABYjiDRlZll2T1MVf7UV4np94UpUJeS9B9dGQW3SV
 +CHEV9gF/ylb9W1Xh9rR7GF13GGJanGavIdZQpGJxHVxYjti5Qm2qfFbTekRn/s7zUkPxfZ/YFG
 mrmf8FO6wxXBbmY9sVofNhUzU+ATbGV34ocvS5s3bqbVm1shVcbgsFaE8DyjMgn69RwuGbXF8Ex
 BtWT5cCafYz/WRC8GO+BCgJaiv7UhnBfEAbslMgEZyINlCQpz7mgGfW0J6qSTC3UUqx6lIqSQ1X
 vilC8kkLqCi895HwCFxD4WKsYKPDgw246iqXvGSCn9+J/jRcfB1McWPteJd0VWYF9MTpeKjg/8/
 XeKAQmO02DckXKn/z4DMpuIRioQ/2hJmn7SjR1Z0e/69hT6xOoJmWtT4gHmKXDaQiJvSL45o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=946 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

From: Rob Clark <robdclark@chromium.org>

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62b5f294a2aa..5e115abe7692 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2280,7 +2280,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a0c74ecdb11b..bd67431cb25f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 9d61999f4d42..04dce0faaa3a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -51,7 +51,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.50.0

