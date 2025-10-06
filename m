Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F05BBE80F
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 17:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6A210E0D1;
	Mon,  6 Oct 2025 15:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ/hNgGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CBD10E243
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 15:35:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FBZ1b024872
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 15:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=1EGpWpK4NHoJ9Tg1BF0bu7jI+O+eiskVCiC
 Ipw0qu/w=; b=MZ/hNgGunh6bHTf0Fp9ezMvGOkK0z3W4BmpROUoCg8lmD76ym8i
 32hv+G1tcYsEqMT639HEA++hpXmPGonYCBgppEbdLMCxtTrgAhFhvT27oL6pJ+Aj
 abP17olIipzpXgnu/UxShXO4ldwiJhmYSlF796bK3P82aDY04qbMjB7wgOsXymVv
 2vxfXpkpsA7RG4G3TeZRpn15iWqojcYjeMJNaNrctew5Xh2jBGpJZEIdQYpafFEM
 e7U0CZfQjpJQgOnHz1YYjFJ1/DOlYvB2LxPwpKHvWlUXlFaWAmTgcvbRCl/M1HuV
 3Uy2R4Wi3uHxuIRtsF1yKZUVPfngHmkx7AQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6a821x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 15:35:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7810af03a63so8520160b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 08:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759764947; x=1760369747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1EGpWpK4NHoJ9Tg1BF0bu7jI+O+eiskVCiCIpw0qu/w=;
 b=Ayf726od5lwtbXdi5EJ0Zt1arsOSBHl2LpiEgGaXOUSDctnG3aM7Mcv6KaYtMrbyDL
 o8m18LURJPqsKI0mUZwkFJMo4sX9F3i+XGZbVjsh3VgTeY1v+MolHvkOr/sb7KFcawbh
 MrZUU4Ik86CqXueCaY5ymciHm4IybjJNHkfP5EWe1NCOkvRTwLQAx1AYSNfBs7jj6CKM
 O1tQyoSHRt71auT07RotN6i2/l3297KsWTUWuoCz4ApD701Ed+shm4o+aHfCPbV04XDo
 MdgKzXIe5JpNz0vFG0EkeBKO+4yCfzW6u1R+FoUV4cC36ZwklotCyNBVnmwl+l6Uresd
 GmxQ==
X-Gm-Message-State: AOJu0Yw2UK4+Bk7iTeh4YDspGbl7kPjLpFLXIhgxz2Z4TEjZFOaKKp0f
 8dPCEp/+0lDBd1czlm2QiAxAiueLlukRHImoWnTrcadN9bvDroW8aIugBhLgatsiiv39tsJaugH
 pUiqWK/ES3wk8Y5QsAbFuF0phM1ajE+f67Y23nUfZWfzWqCBqt75ycuvfIqAX2zVAU9hYlBymd1
 tEqi0=
X-Gm-Gg: ASbGncuPkzBB7zUmL/eEN1A4636gq+2hL+fMybnMM9jf/I3INzv66ADR0Ej02OS4Yu0
 ybMs/iAslCHkp4I15Cu1iLlv3ZVmM1V1DVSVJmPBz5upXRcg/VmA7RWM79yKtbqDfd/zLSrmU4b
 0Emt6eG5L+29gz5wksnROdds/UYUtfqjudTXusp3gtlNxoaJpgpc4Yn+aN5rWQhgQg7G4NVg/yo
 opDDjcxCQCa7datlHSIh+pqBTbi0NpXOQI4bxpIsbTWOGPzbMIPwj3EoEHHAGZz39ggWSiuXb/b
 27R1q/N5XR6wWKDA2hd4rXS9Dyj+tMJKRIKieOaAV5xDyCw5a9Szeo0Y
X-Received: by 2002:aa7:88c1:0:b0:77f:2de7:eef3 with SMTP id
 d2e1a72fcca58-78c98a40b0dmr14020294b3a.5.1759764946769; 
 Mon, 06 Oct 2025 08:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2uImXaxQz/qoRT3/4bU9hASthLMeIP5Ir06Ggb/UDMzwCkpwyXD/nyPc4F87ERjDvfW7ycQ==
X-Received: by 2002:aa7:88c1:0:b0:77f:2de7:eef3 with SMTP id
 d2e1a72fcca58-78c98a40b0dmr14020258b3a.5.1759764946322; 
 Mon, 06 Oct 2025 08:35:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b01f9daffsm12910829b3a.17.2025.10.06.08.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 08:35:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix pgtable prealloc error path
Date: Mon,  6 Oct 2025 08:35:41 -0700
Message-ID: <20251006153542.419998-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e3e1d4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3gNcQKlXg_cTF-Q75aoA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: mhB8VXfRie_jW02Xei0t1bNSEmJD4Ks6
X-Proofpoint-GUID: mhB8VXfRie_jW02Xei0t1bNSEmJD4Ks6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX6OLLPqFWrMlH
 Vm05dTzzt4lgmwEPJRLt6xvYDYrD268hmYvHDvfe+AJSR68fzKxpJlnGN9nkj37UnhWUPw34FHm
 gLAvpjno7nrDNois0yMJqbCmOs+QMa/x77GP1Kn66LV3rQvXXIf+w8WuzRebm8BVyJW+YZ1iZsB
 8amJRassktoRNV3QQPKthTbQWy/uoh4cfi23nkuQh/LLDhYQ9JLLBVLDbHRQOSe7m25RPr84gPX
 IP0FEDdPWjRWb1jnLXnvPdbKX69CasAbtYdnicXCwZ4HvJcDJC0mYkyvAxzROiptE+hAtQxZqr0
 DGCu8Z/IRXJsIOQveegg2DyflvQhBMN2PefRxeVLY00j84jQG7wYXaY5qsFgTn7LsfrW2IHw42v
 kAjoIUnlth1yWOoF4CYK8/IlD+uqQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121
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

The following splat was reported:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    user pgtable: 4k pages, 48-bit VAs, pgdp=00000008d0fd8000
    [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 5 UID: 1000 PID: 149076 Comm: Xwayland Tainted: G S                  6.16.0-rc2-00809-g0b6974bb4134-dirty #367 PREEMPT
    Tainted: [S]=CPU_OUT_OF_SPEC
    Hardware name: Qualcomm Technologies, Inc. SM8650 HDK (DT)
    pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
    pc : build_detached_freelist+0x28/0x224
    lr : kmem_cache_free_bulk.part.0+0x38/0x244
    sp : ffff000a508c7a20
    x29: ffff000a508c7a20 x28: ffff000a508c7d50 x27: ffffc4e49d16f350
    x26: 0000000000000058 x25: 00000000fffffffc x24: 0000000000000000
    x23: ffff00098c4e1450 x22: 00000000fffffffc x21: 0000000000000000
    x20: ffff000a508c7af8 x19: 0000000000000002 x18: 00000000000003e8
    x17: ffff000809523850 x16: ffff000809523820 x15: 0000000000401640
    x14: ffff000809371140 x13: 0000000000000130 x12: ffff0008b5711e30
    x11: 00000000001058fa x10: 0000000000000a80 x9 : ffff000a508c7940
    x8 : ffff000809371ba0 x7 : 781fffe033087fff x6 : 0000000000000000
    x5 : ffff0008003cd000 x4 : 781fffe033083fff x3 : ffff000a508c7af8
    x2 : fffffdffc0000000 x1 : 0001000000000000 x0 : ffff0008001a6a00
    Call trace:
     build_detached_freelist+0x28/0x224 (P)
     kmem_cache_free_bulk.part.0+0x38/0x244
     kmem_cache_free_bulk+0x10/0x1c
     msm_iommu_pagetable_prealloc_cleanup+0x3c/0xd0
     msm_vma_job_free+0x30/0x240
     msm_ioctl_vm_bind+0x1d0/0x9a0
     drm_ioctl_kernel+0x84/0x104
     drm_ioctl+0x358/0x4d4
     __arm64_sys_ioctl+0x8c/0xe0
     invoke_syscall+0x44/0x100
     el0_svc_common.constprop.0+0x3c/0xe0
     do_el0_svc+0x18/0x20
     el0_svc+0x30/0x100
     el0t_64_sync_handler+0x104/0x130
     el0t_64_sync+0x170/0x174
    Code: aa0203f5 b26287e2 f2dfbfe2 aa0303f4 (f8737ab6)
    ---[ end trace 0000000000000000 ]---

Since msm_vma_job_free() is called directly from the ioctl, this looks
like an error path cleanup issue.  Which I think results from
prealloc_cleanup() called without a preceding successful
prealloc_allocate() call.  So handle that case better.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 76cdd5ea06a0..10ef47ffb787 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -338,6 +338,8 @@ msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_preall
 
 	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, p->count, p->pages);
 	if (ret != p->count) {
+		kfree(p->pages);
+		p->pages = NULL;
 		p->count = ret;
 		return -ENOMEM;
 	}
@@ -351,6 +353,9 @@ msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_preallo
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	uint32_t remaining_pt_count = p->count - p->ptr;
 
+	if (!p->pages)
+		return;
+
 	if (p->count > 0)
 		trace_msm_mmu_prealloc_cleanup(p->count, remaining_pt_count);
 
-- 
2.51.0

