Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EEAB1AA77
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 23:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CA510E465;
	Mon,  4 Aug 2025 21:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIvPB8cF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1812710E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 21:43:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574FTbWd019944
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 21:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4iMQZAqx3JH
 WA1prynQ+6hJlCX8ujFNqsZgwdOw+rDs=; b=gIvPB8cFPv1IRFNTmqYWqEWuixR
 Rwv7bmlaMzqpBylwNtRi/TG3UiM5k84mwatQE10PeUBNVzoEhsZC/kEPjRmRctDC
 +4ryya9XDg//UPR17UUtiH/UY+Becav0ePCMrFVJlEzmhGQalUXJG9cFtGnElobB
 qlSlHwe5N9O8RqWjBAnqJ8u1dxf87h6e8PXE5AZAC8ytxEBqBzKaeLCFYkRG+iXS
 ZPKaXijDwUfqLCd6gmGJkhRVPcGNg/6HUPKEFA9trUtMYvvoMAgwYgrrRcN7XsLw
 7GLN1tfWws+oetwv6VI5XGTLxVbDC8BxqoxJmILgFmZRwmtdCQzjbkQWuKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqpb2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 21:43:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24249098fd0so30288925ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754343801; x=1754948601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4iMQZAqx3JHWA1prynQ+6hJlCX8ujFNqsZgwdOw+rDs=;
 b=usYh3eiSHuSjaaYAnb9nMRFLNAiTr3MdOZOTJgAWlXmahITFgZh/1HqtxUrhSTPrTX
 SiOzamSufnTYoVGLtftb49FZLKOZqyu54xPkKWyjNi27d/9TEB/tvNWJOVqVmvPkayeX
 3dzkNk4oo1Xq2JpO/utqw62BUOacPF96Q0VlYHYltxEEJd+5D75ATT9yGw6vQQQKM3PB
 DBgKCmJbCR3h1VIo81LCQnnrEAaP5vHKYB6XdlL4fT/MYayLtQDAG+Ugjeru2iisQBTy
 e4kdCrVyEeZd+9xf+1U1qI6horMzLHN3kl+k5sl35UZKj+VkFaSkDeQuOvb+ydpjuezW
 Aqtg==
X-Gm-Message-State: AOJu0Yzaod5oo21WPPbXKM5JGrxnucOui7cBtnhB3wN6Y2aYj3zeh/+h
 kcV9BwNZNZihqe56scxFhydZjV07QN8oqxtV3vAW+8QhRGJoXq6+r5kOVFeIy3t8MAZm1rXABUZ
 TqQvD2H+epcF9kc2sDvr9W9Lu1ofbQTRwKFZT3HA6gOSkl/EV2dC3ivBQzWYqITBP7mvsxeR9zA
 oqYYg=
X-Gm-Gg: ASbGncuNpwMd52fJWhpH5xA/GHRKwqgUXAtOBsWqD6JWZevehsZhU5b7yVl9Z4cDHHR
 Gxke8BmtnKZAVtZzlZ6n49CQZjiBJByTMxUvkgTWt5Vg3qtVJktlIFilWKS0rcqDdKQwzqcvOsa
 X3aRTi4YbUWm0hrr2C7NTycd+8rL61SQJh7iF0XSu6jLVP6VxiFQJjZt2NH2apkh002uyuDTS4k
 +r3sVtqQk9fo7UMCXe/iMfKC+g591vjVzjfyETiXxigHcTcLY6WOi2HF3Rz/sRHdiekwJHc67b8
 TDN+IGjjExKf1scuA7yHl0tls7FbYn350tV9Xb28v7D3J1eCLBQ=
X-Received: by 2002:a17:902:c951:b0:240:25f3:2115 with SMTP id
 d9443c01a7336-24246f66529mr161881515ad.12.1754343801266; 
 Mon, 04 Aug 2025 14:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ42SvcJgCxFfQN88b9q64GCmdPYqi/gv07LLosxuO/N73EtGwR8zNcDRPko1iT53bOia+0w==
X-Received: by 2002:a17:902:c951:b0:240:25f3:2115 with SMTP id
 d9443c01a7336-24246f66529mr161881165ad.12.1754343800876; 
 Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da57b4sm15506076a91.5.2025.08.04.14.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS)
Subject: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the driver as
 remap
Date: Mon,  4 Aug 2025 14:43:15 -0700
Message-ID: <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lzURMlpAJ8jG-dV9szt6Y2axCzteprB5
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=6891297a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=-LggB1lm2EvgG5rjBn0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMCBTYWx0ZWRfX6XCDAdXjsq9Z
 8lg+uVBvpJbhu1gks04wBaW4AMt3BkMdKgxvOlMrsapq3Gft861Kv7k7l64VABhJ12fcDhQ4s0u
 sWJz8Wm0LEt2dZ+Y+2eNhjNVNoGH/i6l3byCeOZwQ3fy54hADMYRdtkmZ+iO3MTdeYYNOCdhL6u
 Ot+GgA8CxLh4eRq/VMn4D5uTa2tk840tWeR20oe3aXCoJfGEATEWfAHWQ97wzpO9X8lfZUXJ4+S
 vz4zrKg/Mqy+iPclqe3JSImXBDIY7/XZrZzlHvC3sR5NJkZh2VdPr238Rwt/lZmED+piphhDpX1
 yUXdtXBfW/tAFcQxSnm9QwG0D4p4SsWzBHF+qtVLWH9Gvd0iClfQt5C3407H9NUbPtXVeTCksTf
 fNrTARw41mEKIyq8rH5a64e+fKLWG70488VR+Gnp0FHIKyqJjToHUGNr3HuLQ8S7ZzZHPG3T
X-Proofpoint-ORIG-GUID: lzURMlpAJ8jG-dV9szt6Y2axCzteprB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040130
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

The 'keep' hint on the unmap is only half useful, without being able to
link it to a map cb.  Instead combine the two ops into a remap op to
give the driver a chance to figure things out.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..e21782a97fbe 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				 offset == req_offset;
 
 			if (end == req_end) {
+				if (merge) {
+					/*
+					 * This is an exact remap of the existing
+					 * VA (potentially flags change)?  Pass
+					 * this to the driver as a remap so it can
+					 * do an in-place update:
+					 */
+					struct drm_gpuva_op_map n = {
+						.va.addr = va->va.addr,
+						.va.range = va->va.range,
+						.gem.obj = va->gem.obj,
+						.gem.offset = va->gem.offset,
+					};
+					struct drm_gpuva_op_unmap u = {
+						.va = va,
+						.keep = true,
+					};
+
+					return op_remap_cb(ops, priv, NULL, &n, &u);
+				}
+
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..c3e3a15eb3c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -820,7 +820,8 @@ op_remap(struct drm_gpuva_op_remap *r,
 	if (r->next)
 		end = r->next->va.addr;
 
-	op_unmap_range(u, addr, end - addr);
+	if (!u->keep)
+		op_unmap_range(u, addr, end - addr);
 }
 
 static int
-- 
2.50.1

