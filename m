Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485D5B2CFEE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 01:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FD410E229;
	Tue, 19 Aug 2025 23:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jirj354E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124A510E227
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0tgf019599
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=a+ZaKXx/xL/
 u7Q7T4LDwvQWGaQFWySGiqB6JfEfEJwE=; b=Jirj354E7t9/WYXwpWkvWD4WCn5
 dpa/J7/+4TNVg8H2Lm/r0XJ393CQ8TPYNODaVYKMUxDVyAZjq5CGqRiYjtxBpQnd
 McbHaNFmVX3RVySxqIuihWfl94LBgw41JLqxpGan/r72dTZ4DsB65XSkROp/sEoP
 EKZATlStJRu+O5zmofpSgNBUmmeqVmOXLGkNTy92dtPcIgtay5EuV/FX04GQUZ69
 VdTlijBW+IbtWggczmzhhHJ0d6++C7FsjG6jJDfJXN8I7S4uuDS2qUbN+xowy/gJ
 4ttwVJohJRbttq6r6NTSILxPFJJdON+3uAHauTBZb5R8a0RHZQfDqcAnnzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tgg8ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e7ef21d52so3193611b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 16:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755646153; x=1756250953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+ZaKXx/xL/u7Q7T4LDwvQWGaQFWySGiqB6JfEfEJwE=;
 b=fi0XVbq4zGP92RKZsgAoyn5Y7/EqfGNPdMsWcl4NH7JiBWGnGnUrR0CjjCouA2ytdS
 sffXKe6IcFZwfXzsk7EgR9+EdjCy9RdBO9SdiE5jc/awQoklUe5tluZNpGrNeUm/MFyF
 6y3iNAxe+DAUuyuz6HsB0t6rAM0Nl2JXLaX67EkFW8szeMNB4545sIESEOL36UE6D+iP
 oNS7XRGC92hRFSErtLqglvxH5857O5LZe5oqmbQdKTGZt2tQKvBB7vugz0HBc9EOO4yi
 36BCWGtNL5eeQEsdVV8/Ba4LndNdyio8NSuuKySAunJB87ZGVhXYRF88Yj2bqM7jzVe3
 YE5w==
X-Gm-Message-State: AOJu0Yzz8pKgMs/blbGYwhUr7wdQk4Gl+sNkaVMJaPju76jVHMHsSEAq
 HtlPLr+pujctrW9uoQs8zxqmhzmYZ6xf3PSfXP2F4Z8Z/HunDo+RDWw5AAdZ8RN+dQO3zHBNZ0j
 lSEIy8yV5GkMwPMWqcbrxUAVfBrzVYS/435Kt1/l+24+vEluHoLeccvW02rO2H2OJSDgaDEkWgP
 4lldU=
X-Gm-Gg: ASbGncuS4acv897nZh4OuoBlPY/6Y7qRPqMKsYpnND/H+/XriyAA36MkpjvGtHU9PDx
 AEyPiXYlXKdJrweYYKTa6IhaaRo2P3HEd2CatbID1wHR3zqKucGbSThSkY/uIIfuhamV7g9CTxD
 4o8QR0SowhZ5T4cT+qtvglSRJWjn5DPOACRNgB1Rk+waisLbPhOBRl6FXIKlQ888sb7SRNe+XnT
 L008Gntx6x1Jk+/6uTyAfmYhsFzLzYPBfVNpCdoP1HPw5Ek3GygUFY/sDqd4SVabcouT8/q8Oyn
 B/3LYQkcZanAokE7za2T6DWc526wQW8LtNBXNaxXnPw03mFnAWs=
X-Received: by 2002:a05:6a00:2e92:b0:76b:f0ac:e7b2 with SMTP id
 d2e1a72fcca58-76e8dbac1a1mr1258739b3a.13.1755646152736; 
 Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXuuxWQ9CNWJW9SCXTPxi43/HrmCwC3mMsHGIjwm8ubVSa4o5saby5u8uLerY0CGPltJ3xIw==
X-Received: by 2002:a05:6a00:2e92:b0:76b:f0ac:e7b2 with SMTP id
 d2e1a72fcca58-76e8dbac1a1mr1258702b3a.13.1755646152306; 
 Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7f0b4f60sm3423813b3a.86.2025.08.19.16.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/msm: Fix missing VM_BIND offset/range validation
Date: Tue, 19 Aug 2025 16:29:02 -0700
Message-ID: <20250819232905.207547-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UPLi78nP9BMYNBF0WGGbJT1_i6FauJ-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX46j/CJrVhDTF
 8p256C0w2yZD8VYEMuZKRmVzkNZYER4bhR6vT+W3EKebsbXtDXkK01WhV4S6Dau6FNuDBXtJxsQ
 iZH7GJkeLY/44xpjREZOcOuJf/DFVbbOZhwitJe5FEuN4XvMknLUAiO3S/jFFArOhAEoihHVcUW
 NBHx7WyhegTEexlE2C2ShA5yDnOmu4+No7E695nsO8LXQDkmb29Fdg2nrpnVkhajMSrEl4krAZ/
 AEWl7iv2AbdeJnYttnnx6NEc0IXRemgJcJ2p2tHP9x9LAKDvlrVqyt+1YcdX+W4sOpWKeiAaFmP
 yTHSjRcQmRFPYR7peY4fmLSGAnhRP3szxo+8dNJ5UqJrOj3R3DUWjZU6TRgQ4OTBH6PmsdlXAYg
 gJ/dNdFriow8ONdxa6wzTuuAaJZm8w==
X-Proofpoint-ORIG-GUID: UPLi78nP9BMYNBF0WGGbJT1_i6FauJ-1
X-Authority-Analysis: v=2.4 cv=a7hpNUSF c=1 sm=1 tr=0 ts=68a508ca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xd9qGtD1qYZMgD9OdIwA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196
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

We need to reject the MAP op if offset+range is larger than the BO size.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 209154be5efc..381a0853c05b 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1080,6 +1080,12 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 
 		op->obj = obj;
 		cnt++;
+
+		if ((op->range + op->obj_offset) > obj->size) {
+			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
+				   op->range, op->obj_offset, obj->size);
+			goto out_unlock;
+		}
 	}
 
 	*nr_bos = cnt;
-- 
2.50.1

