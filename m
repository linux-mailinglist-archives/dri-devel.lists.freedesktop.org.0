Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C26B0FB90
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 22:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0C710E1A0;
	Wed, 23 Jul 2025 20:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4pcGcy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC8910E1A0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:35:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHc8sN024667
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Jg8G8kDUfiO
 0QN87d8Nmg8E9KepNpwzJOvRP22Q1Yow=; b=b4pcGcy2lrUKAQy2I10T3RvGn2b
 t+63HpxKZk9yhrSZUeuy2/3TlSqrKg2F+1OnALf1oGJQITkXVbZqIHDxbPCwySwv
 UmDVq7/oRsg08WoBQe80b18z2Jr/jVYvcgFVPnQeAGhljqhUK/B1eIsO/FKAfWvA
 0mYzny++ay/+Npx4rD0mGYKnlXoBJym3CYwlRgzXuhcWmxSU+pqlggkzM+k5bd3U
 AVxtjyZ4eyzypCIivqoymC51gqJc98wv0UZrnV2EekeDlRxA1nNdxIysNB6yf7RD
 JypbIqfiJajwQRnbQ4DnRP9ZekRrrm8Cvgha9DdMKH6REYNVOhH10ZjZ6yg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dp9fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:35:34 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-41b2182bc54so565057b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753302934; x=1753907734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jg8G8kDUfiO0QN87d8Nmg8E9KepNpwzJOvRP22Q1Yow=;
 b=jYLNqGmdsdtIb7HiSAhzHGgZYyEna4P9rQGBsMNtQUMuDKAyT1aZGD+z8Y+O9VDCy1
 payPR+yucIlk7dae8gfckC2h0NdnHT7w1z1Z3lY7lnuGYFqfUbs035plbclcWBaTDAtn
 iSDdqlvt61ebmTRk4y/DBORPcPRkuWCmcx87Ay/CTSTbbO4naY8mIOGYuWN0/yQlP1tq
 3mWoyv2SXxXJeqNxsCZBFnj3yl1ICH1EToYJmGOzKHvkNtynqK+RjurKPykqLgRhbTOW
 O1oyyEv1swhD21dTxNFqCUhsgDVx2RFb9QarPsEX0wrKupm3P86jvc1bq2ZF3lOAI9m1
 k4ng==
X-Gm-Message-State: AOJu0YxLMp0h4x6ajXe/kvgcjH00ZMCQg2iu6FOR/0V5QDUgzGOljXpw
 Bs1hulJG8+WJXmyltfPi1tWX7IiFSmcOXjiRBMblI1KwxT4cMU1JmPNeVeVbLUUrM2ILvnFdMsx
 Hs7PB8cHv97RSupIMRnlagO8Fc2q99iZhASR6TDC1X4ZYoezb27YbKSdxLyrKMsPlWfF5ivn0rY
 MSGM0=
X-Gm-Gg: ASbGncsxrn+pBhFvDiVjowQvuOCEXBowGfr8OjNN1kC2w7Y2FQeY1v0vXLf31IjZpta
 Mqlk9ez1HHuv/YoKv1pwNq2MQTWyRDITGy3jQ0ug1fXJJAUL5sC/yNhtIHfvmbknLb5k39hU3Cd
 YPoJkeZ2TOUyaSKmelYCRifa+xeUWEy2GfOMM+BtraECaS8sgMfswky1mx861swIOwTj4CigQG4
 fDuv5ReOhjkhWqxfudRiG+0c39qYW5ow9ysgz75pg+PhuPpJ2mB2wJ+6WFMyWkalvwGvYoLoXjW
 hZyNtCZvOgEMiy65jgRRM3dDAZhA326Xd3pVqFvsrkNgnGOldIo=
X-Received: by 2002:a05:6808:1b2c:b0:41b:51c4:3db0 with SMTP id
 5614622812f47-426bcaba91fmr3867375b6e.1.1753302933719; 
 Wed, 23 Jul 2025 13:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK5Ovk21o1hIxl/7WYP8zrKYd43nYxItlCMNkL0IAMZTWY2Xcbzi2QZeu1m8gPG607xMRIxg==
X-Received: by 2002:a17:90b:35c7:b0:312:e6f1:c05d with SMTP id
 98e67ed59e1d1-31e5073f550mr6078124a91.2.1753302513335; 
 Wed, 23 Jul 2025 13:28:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e6249fe9esm80462a91.23.2025.07.23.13.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 13:28:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Defer fd_install in VM_BIND ioctl
Date: Wed, 23 Jul 2025 13:28:23 -0700
Message-ID: <20250723202825.18902-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
References: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68814796 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=p_L9ESIXKxyW_a9_XK8A:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: EkBSARv0_2IqhZGQ52-IMA2VNnaoIz5m
X-Proofpoint-ORIG-GUID: EkBSARv0_2IqhZGQ52-IMA2VNnaoIz5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NSBTYWx0ZWRfX/CzgIQEAlcz4
 36DI4YusF4XJuSp4lMMq59WCCZgQcTUZje4hoIShEQNJ4XdZT7crxyqVekzkWeHnjqZwo/N0n/b
 8b8GQF2ihRUv62EjFbdaXWojFNtvU0zo5bvxs0IvsgqQq7cv7gEwXy7VBIjnwTykt1ZLXw+eLmr
 dcYmqgOhpSOM9I47ntFTWlm4Sr3Ma57kidm26KsEzCdR/NZcaGFVYmjM0NddK6LRbx4BfUJN/Js
 Xg64//qC5jgsbfAbdr2c5ATy+EdZ+5wxLlq9KLi+8gIB9t9jC6mCUjGkBj9Kmqld4Jmk+JU6bFR
 0ZwqfHDi6dfv/cJmBsWQuYU4qRKFdhBACgT2H8xuwtlGN/VMVFlhnfUf23exuZ2FmrPH6h3OekW
 pHPqJp+UKWhLJc3o5K8fV7W7Le7V3esWk+ITDuvp8hqEyYrYFlM4lrqwchnejthb3E0UuxFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230175
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

Avoid fd_install() until there are no more potential error paths, to
avoid put_unused_fd() after the fd is made visible to userspace.

Fixes: 03b6becb03c8 ("Merge tag 'drm-msm-next-2025-07-05' into HEAD")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index e5162db436a6..d4b1cfb3aa03 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1473,12 +1473,8 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
 		sync_file = sync_file_create(job->fence);
-		if (!sync_file) {
+		if (!sync_file)
 			ret = -ENOMEM;
-		} else {
-			fd_install(out_fence_fd, sync_file->file);
-			args->fence_fd = out_fence_fd;
-		}
 	}
 
 	if (ret)
@@ -1507,10 +1503,14 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0)) {
-		put_unused_fd(out_fence_fd);
+	if (ret) {
+		if (out_fence_fd >= 0)
+			put_unused_fd(out_fence_fd);
 		if (sync_file)
 			fput(sync_file->file);
+	} else if (sync_file) {
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	if (!IS_ERR_OR_NULL(job)) {
-- 
2.50.1

