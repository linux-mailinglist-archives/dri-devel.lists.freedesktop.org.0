Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6B2BFE656
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009EA10E85A;
	Wed, 22 Oct 2025 22:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEkMV+VT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B9B10E860
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIencl014667
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ojPDymiYZTBLdr/wyRVgSgbdNLO5BGbhwnh
 T/pYk/5k=; b=XEkMV+VT0Vncnb4O8C33110XM73b8qxAXFOmWykCvCJVcT1/Qg9
 XAHAez+tRla3HOj7g7zHbK6LyZV1P76src9J0CqU3pa5hUg9yf/uQzARdqNi2qjU
 sgnPKIucpFNLncrNNnR0Un2Wyj794wd52GTHb15SI9T0DdFj3eMtrAhCp5vEq94l
 UQAbQBuY6td+QZscz4cRMufFjBuDIVPAIC65vErFx0EVnLAmsxyAjka9ro/1Gunb
 LVdiEVcIQkWSjP3p164VQA7n0srzvHy6FhOwFe2bqv2emGj26oqZ9Y7M2mwHGHfq
 /Ze6q8qtTYrHuYhE27eg/7g7OBIjoPsPKLA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0m48s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7a26485fc5dso88556b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761171643; x=1761776443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojPDymiYZTBLdr/wyRVgSgbdNLO5BGbhwnhT/pYk/5k=;
 b=voq1wNPnK1FbJzRAbPzc9Esa9I9pNFbFr1a/jIZEjBUXEz4N5umz3e9VkNe2fTajnt
 FpQ2N9wGmCTIi8GPMl8z4RFh87jnJ/bNm3RpcbNXSRLyM7rffFHU0/sJOuhopkSQlHw0
 xFqx5/lpVqan+8Vqk3e9KfBWsF54nLpy9V8ZAdEw2xjXGEsPgOKXHl26IPDrKN/JV+KP
 GbIUJZao4rIU5RUQsFYOPXBKNp66+oZQsDicrWcnjg2aZt+Acy9e77eo6p5TI7m4Y6IL
 IpKV+Stz0HoMyW5qYqFdmjBvInfnEUT6dx4Z+mT8tt3z1ls2Ii4WLl6If4AKMbY8mRiB
 Rddw==
X-Gm-Message-State: AOJu0YwypYgoFElJMs4nysCuHHupfEHgASefjao2gO0rPX13svmQXG9w
 3TTnQ/8ObV40NPjTdYaZFu0cguH782vc/y9GjRXQoiC5cYVGKyt5X+yd7re2K2BMzsnxMuMqoly
 /67VMo378HRJrl3sHAfTtxqFgiQ3GXmP4FaVV1QgUvntYhKJhEjTjNjWseXpZKZ6RlFT4V8gvys
 G4hLI=
X-Gm-Gg: ASbGncuOGQKqlaaPKhI+s4C7hHEm7ylUXcU/I+I/TmP8iXLZAXjhLWoFgOwIpCijqiV
 MEyDbeSrWOa4EARB9jgIWVBhfutxMDzzLguIiy1T5mbMZC0GOvmhB8wRJDy2TN3V83/1e0D0rGb
 i/Z9ht8xPtBCq5sW9rmczcoBeNiFAjPWRSTlZhyZE2U1Pgyhd1Tolbm6PJhDxXsI1yF9hD19BiQ
 9tqe1ckhGAOTlQdtrwvSwNauKLKnvTJ5JxFz/BytaWCdOInWPKdZdTbu0Y9iA98sbTitOnwdGf+
 +qbYEZzv+43IHBHOqtAFR7xRCwz7jRvD4nezXLGftHh56ULKt8r8hYrrcKnKZBFBM7Ny621XtTU
 eQbeINt2nvw==
X-Received: by 2002:a05:6a00:94ce:b0:771:fa65:ae6e with SMTP id
 d2e1a72fcca58-7a220a99177mr31804777b3a.17.1761171642686; 
 Wed, 22 Oct 2025 15:20:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP3Xt+fiS6/lvXldmXrI/Xmz9rKgUz8Br5D+seLdPQbhnS8ioRXSjubRta++0jtoklDejZTA==
X-Received: by 2002:a05:6a00:94ce:b0:771:fa65:ae6e with SMTP id
 d2e1a72fcca58-7a220a99177mr31804731b3a.17.1761171642157; 
 Wed, 22 Oct 2025 15:20:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274bb0c93sm284889b3a.59.2025.10.22.15.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 15:20:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Ensure vm is created in VM_BIND ioctl
Date: Wed, 22 Oct 2025 15:20:38 -0700
Message-ID: <20251022222039.9937-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX0ABrkyiGsMeY
 cJsh6whr6FkZGlA1kt2O/qnFmIvScg+xxYPqjOXykw+UURALC6GguNQDNk7Pb7yUGho/ejV3thW
 0CUyrYpCTlPsontI+94QMh72yEdd1MoSJ6yWPPPKmCBqGZIPaRArv4Lwsq9WgH+5Ag8S0KP4Fgr
 An1TwNJfgTl6zy/XcJbZ/BXcrLtCcEZZE1ZPBBFwECu9GZEHKrWf5h/n6DzX9nrmQvjVHE+NUbf
 ENH0qvXQ1NmVMDKPufAW+JCyYej+/isA8fxLHzRWBO0zww1EqRrwDkcCuTAWm1ki05Psx8MtawL
 5o978JrnerqpGp8w2FFiC+vjHlGYMRGn3agdyw5GYsP/JiKzMuIvVkJW0V/0psxQkIZoxFaB37d
 LyhGVyjOYMCmzpTV2+23ouxMpasGiw==
X-Proofpoint-ORIG-GUID: fN7r2uUNs7myIsEzW3WiIvP3GGzIIKWL
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f958bc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3QSsbYrYwaFkjnnp2pkA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: fN7r2uUNs7myIsEzW3WiIvP3GGzIIKWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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

Since the vm is lazily created, to allow userspace to opt-in to a
VM_BIND context, we can't assume it is already created.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..90712586faac 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1382,7 +1382,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
 	 * immediately close the device file and all will be torn down.
 	 */
-	if (to_msm_vm(ctx->vm)->unusable)
+	if (to_msm_vm(msm_context_vm(dev, ctx))->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/*
-- 
2.51.0

