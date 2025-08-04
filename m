Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884BB1AA78
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 23:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4457610E5BD;
	Mon,  4 Aug 2025 21:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+YzSNwr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE7B10E5B8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 21:43:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574Khibr013332
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 21:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=nwBcV4Oemt5
 w740AAje6mIColtrmwRWXKq31FSAZZI4=; b=J+YzSNwrVx5QkBv3++Hw3EluqR1
 qWxOSWwL9oqpkBTSOLSuhyMAVAiSqYlze1z29tUONI+9grkO9n9vVIy5wHLNaPBL
 cFx7xN3QSwN4nJDjBppse3DrOLfn0S8lKBpceSQwJI/9V0n3dd1PG56TgfT5KDe4
 7j1uHhvQB2VcvcYeBzo8KrlbxFvdJDUqcObF1s2WHWiOOUkDTvkcvTou4uHWx39R
 uuMpxbt4YId8LIROoJSwDiaEQDxrFnA0bKserOJ2WggiK3MHIau8jX2OYumKmPDN
 gOV8f30JLwQYwAov1Rl9rAYQZgkSDFErp1j4acnbHX56KAvOuzDdgg3jxEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3r6c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 21:43:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2425364e0b2so26233295ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 14:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754343803; x=1754948603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwBcV4Oemt5w740AAje6mIColtrmwRWXKq31FSAZZI4=;
 b=GktICi8Ioc42HipEyz/QlBjzslCanFQjKEW1SMoN7UVvrKXE3E7R6M989O+AgZ72tO
 jiL8PPUqI0eqcD1vOhYKnwe5lbzdLff8dm0krkhEzsGtl54H1PDLZkSogryOyVEzzKHb
 J0Xa58WhCf1KPXy3JBgbf5xYo+UM2Dqhplb1PIs0xiuO8RWS+fvnR2x177NL0QDu0SDP
 JpBTe3PxTF6tzuB+F7wPqDIjorafvOJxp7FKncjTSlhyeSHOGywPlDdSQnH4/CRJNqOp
 XWZjLUdWUmkh4S8xQKI3e6iQOXnybf0nUg48V+tqShphKzy10se+JaCvK8uCePfCbgyt
 8wYA==
X-Gm-Message-State: AOJu0Yz2pb4nVus2gpWMk8e3Yy42xNPgWBkZVdypaLbtZOqK84kQ6X4R
 UDwM4ukubnOXGcjtgqiCdM7gBjdEAKsNNv0vUQZu8NnuaOqYtjNBIBsr2RO0QUYKKykPJ4yGu41
 3o/6Hzhz/WrukwK4FLpLxDgb6tttuzYDBFauUzfCyB8ehE8LrhmGfRpsgPjv1ggiGQJNABDbIUk
 D6Gjk=
X-Gm-Gg: ASbGncvY3EVKqG+tGFRuHreG2eQbTDP25l1kx7OUzyyV+7i1cAFnhZ9esJnFX3kJvC7
 f0LSLTm/3/vmyev40sZFNpDo45yp2XxOb+z+8UgOCCt2YC6XTEbt1XxOsvODQmiOwYKSyXRGefV
 WOwctFXcqByaYm+c8uVsQ8pMhTXjeh0Z8D48D5h2+gYfn5cC+KwE0UPe+C4CrFNhRTG63trhti5
 haCEZxQhdXkf6rfwY8YfYhus8LFalLAluhlANCOviDNdAfiliMhl0i5k5kdlHdk7dashQ2OGLtF
 5iHVx3vY0UTIwdZ+YdGIzVN0WPMhHsT6WtzaNjwbi7WjVTIU4UQ=
X-Received: by 2002:a17:902:e0d2:b0:240:49e8:1d3c with SMTP id
 d9443c01a7336-24246fef44cmr85653375ad.35.1754343802680; 
 Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6a9/8RPndKLMzz5ytDiVTCVnElsJWsamSeHzO2/TAvn6vk7dklmlUiRe8K/yjPhIcb3dkYg==
X-Received: by 2002:a17:902:e0d2:b0:240:49e8:1d3c with SMTP id
 d9443c01a7336-24246fef44cmr85653175ad.35.1754343802269; 
 Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef5fbdsm116628865ad.27.2025.08.04.14.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:43:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND 2/2] drm/msm: Handle in-place remaps
Date: Mon,  4 Aug 2025 14:43:16 -0700
Message-ID: <20250804214317.658704-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Em9tulHizn2qI3dfjbYpXYKueEV0U0XO
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=6891297b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMiBTYWx0ZWRfX3smqTbBHjKRC
 HklCUkg+6RY4n8J+OxwxMklNHhpWJcCTpCAQegDuC4PDSfTJzLsplqzkO8SQl6LF257NXCMO3xf
 P6kZbgZAFi+qv5eDkvXr+iiNtpdIGj+6iV1+5yPiUfUsUf3OCXoOHlgaF6lNAGykXL19ui5WKBJ
 zpTAMk0Nui7AEO3pANQdbJi3PBCu+/XDkZjFd7u+GbWPCa9HdxhZspA2qxHSm1/qXoYNAb73ewa
 rWLWocWWzgzRgUHa5X7+6ksR8b1yTb3obrLJV7/b9O3smlAwsTEUkbFzpoc/yO/ZCNQFb6GllqJ
 d9XJbOR7vMZYthfhWNrpcj7oiV2d/iJhKldd7BmlTDQhR9BYvAach3fWSrSkzey4xQcQQWcA3yr
 RhBFDxj3pGPR07ixrWjujf1khXq5x900v2dI8ShUAcdsP2KCuow+spPENnmeu1YpnfI8RmGb
X-Proofpoint-ORIG-GUID: Em9tulHizn2qI3dfjbYpXYKueEV0U0XO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040132
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

Handle the special case of a MAP op simply updating the va flags by
detecting the special case, and skip pgtable updates.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index dc54c693b28d..d4b1cfb3aa03 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -519,9 +519,10 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
 }
 
 static int
-msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuvm *vm = job->vm;
 	struct drm_gpuva *orig_vma = op->remap.unmap->va;
 	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
@@ -529,6 +530,18 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	bool mapped = to_msm_vma(orig_vma)->mapped;
 	unsigned flags;
 
+	/* Special case for in-place updates: */
+	if (op->remap.unmap->keep && arg->flags &&
+	    op->remap.next && !op->remap.prev &&
+	    (orig_vma->gem.obj == op->remap.next->gem.obj) &&
+	    (orig_vma->gem.offset == op->remap.next->gem.offset) &&
+	    (orig_vma->va.addr == op->remap.next->va.addr) &&
+	    (orig_vma->va.range == op->remap.next->va.range)) {
+		/* Only flags are changing, so update that in-place: */
+		unsigned orig_flags = orig_vma->flags & (DRM_GPUVA_USERBITS - 1);
+		orig_vma->flags |= orig_flags | arg->flags;
+	}
+
 	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
 	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
 
-- 
2.50.1

