Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA22B41C3B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D1710E74C;
	Wed,  3 Sep 2025 10:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaIZcbKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1510E748
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:51:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AXirR012509
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 10:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W+Fa5j+SX+JfM1Vod9bwyFNqvrYwDkttQ9oWzqXY34U=; b=CaIZcbKXWECiS5OQ
 MmeFWv6gFsrU3AVys1QT7S+kvuEomX4yJ5AjI+Tc3p+bVFpcNL4T4JA2zcHeNF/E
 kNorE3Y+kWGNSnDqtq9ena4quKt552GrN5VsM9CJJeBHG2FFJIpHu54dL452NvDh
 LiCh6jBFbCkcNlOa/sDUo35jRwS+TkMT0Wy5vnlsBMM2IMoP3EKtvHJc6MS1uesB
 zXF3YTf7U16yKnRjCAO+Xbczldu1IeA4MxALD9PxEpuXUSTu5h3/YDI/nktyJObt
 MpcvicV7Us+hajupksmw7FhOEcfc/KlKbVoFcWUNBlYpGd29vgDvdCeG+daHJ067
 dmEqaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fk857-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 10:51:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7224cb09e84so15629106d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 03:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896717; x=1757501517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+Fa5j+SX+JfM1Vod9bwyFNqvrYwDkttQ9oWzqXY34U=;
 b=io7TGR6rCOqKwgkzJg7q7Xp1M5yC6JLQbbCKLfwvV+6Ji1bqORTFyDG4D33xxb+IqW
 6oUSGKiYOFWKqFJmWjo4+ZWZua7mM04tbtLhru/9Ab2CKFJbLWJv8wYqTQbGxKblvXA6
 VJtpfsHNv1YP2eNT/2tg516mzDdFA2g+NTXykd+7OM4j4XiePZrWpJdE8142RBYy6I2H
 m+oP/q6U+DUshZHKeI++a9mwtmyC5DueWJz4XysVmJzvqc5F+ozGMxPm6q5RMBx/hSJr
 NeHQdoYuOAiIejkHU+BJKPghkX9I+Bzfm7RH8BExpgCyg+zDBTatuk3afymjMvo/83pl
 2DyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1TqNNIJxaOTHNIbgcTPfJp0/tuOZVmhfWZC2TuQyabveaOEUukdGCtUb1Fk850YtptGBpT5KgOtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhruo8hCqzW3UhMdiUay3I9omOl1k+anOyLoRrEKzolP9p674s
 0YdJaqU+aQ2N2GTStYngLyqrLeeOg8TUY++KzK3MTz4s3tZ8sh6b91xc+JwaYIsv29aZzZ/eqml
 dAOA0fj7Aso3IBC8n2eJhc4DXobhoUOKxZp6qY3nIk9hBTeqFeUeHYjezIED70bZ7oe2kVQisNF
 j7Dw8=
X-Gm-Gg: ASbGncsi1rwwX0HHofNUOWSiOxBP5VDAA8eAbmZvLQ3y4W6hE7jKkmLekbgtv2gbAMh
 Y2J7RBHFweJm3MO60mLCc7fAI6GyQJFRSJu5Ef0KlisxD13R7JG0jSTfKSaZVOfIKU7zb6idBX2
 ImaogtQikiY4Ki9I1K349MATykjPCsX4YtDX1AkkwVN/J/rB5D57P/XmLmEG+77gMlMgIe2f0YG
 7TZuhX8e0usbyZDbDt7doJwvPGWuMoFPvSREkdwqNng/OEMKRa1eMK3DbA8/b6RPgeReOQwB1BW
 czrdfOOfgTZSubxcEMAVVYn8QJXx2tviVeQmX/Pf9N8GNC5BSx0ASuA4epC7YcFH04mHXHKe4lJ
 m5Ie/CTvYYF94SMfoJdEYb8jHHssGP5JczwQAnIo+6GG7XZdgZBfg
X-Received: by 2002:a05:6214:5005:b0:721:93da:1071 with SMTP id
 6a1803df08f44-72193da141amr56362816d6.34.1756896716996; 
 Wed, 03 Sep 2025 03:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExVl9GBAf8uXT9a8bpVa29NuOzWFwU6sdfVsGQld/IevSNRhQnIWf4CLWyosX6NvmXF0Tlaw==
X-Received: by 2002:a05:6214:5005:b0:721:93da:1071 with SMTP id
 6a1803df08f44-72193da141amr56362476d6.34.1756896716456; 
 Wed, 03 Sep 2025 03:51:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:50 +0300
Subject: [PATCH v2 2/4] drm/msm: stop supporting no-IOMMU configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-2-993016250104@oss.qualcomm.com>
References: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
In-Reply-To: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VVcVNBxTp77RP3lwxz41p40biwqdBr8Vq4owPjMXldU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3GdCx4xIfhZaEHEPNvhz+Nhq0FHAFd+JqVM
 hN82WJGwZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxgAKCRCLPIo+Aiko
 1QDjB/4zbCpsE9Fapn0XIU3XUXuutlBGlGPfODt0yYr1IF7hO8FNc+gXhAPhbcemMkO4je6iUqb
 aYGyplYUcCTYuPaGRX3ot14Yksn6QNBF9ljJkoSmhHR9/GGcacndWC7L05c2vqgSE+SRJRfFG2W
 Zn+JG44gcPcJ7Wh0bCL5tXMjCttXjwY5VR/DN1QesdUuAx8ZMlvqdB/INnQc22yZ+0rJ+usDuIK
 tu5/Xivh7lZpD6vLk3G5ojERUsV3k8V0Wr4XWfsZrtG2GKtWa7OoG7j1cQ1ZWxSkMfWTgPPot+p
 GcLUTZOAMGTKDJLemyZzj4bxZC+N37L/0pVsp2wlLN5xVUEe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX0dKvqTIDlTPF
 X5spV5qBQtHJyuHo/Ov3RNUoD6v7+YMKBF4hvcySwOgSu+903syaz9I777bnRHtz7hazprBd/ZQ
 +7P/Ihuz2l532FkFsJtp47T/bwD4LyZzOKRfe85giziCtnvMwYkTuryjvdsJ8X8HhTwPYqFLIY1
 GOGPGTcThn2WypHrCBxXTPbIrLmQQsScbBkuHnCpT/nxUjRkoPJxGneagANhULi3PfMg0zeGRFe
 hnMH3RiUk7VlR2ZFID4AeEmyEdWinUoNCTaNfVqwvQSSnzL93bbhS3isZ8V+rtaKlYb5CcKxZkb
 zWVEyPQzpuJRD9E1h/c4tE2oRhoPrRw0MZdPO15WXVUzT9BOr6miEv9YhsAs7FWs5he0/lepvyO
 hwFz6a6y
X-Proofpoint-ORIG-GUID: JYVP1IP7vRwVh2-tFrMeGj4H0-wett9i
X-Proofpoint-GUID: JYVP1IP7vRwVh2-tFrMeGj4H0-wett9i
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b81dce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Y8FF1qk0yU6lqu3lwJcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 56828d218e88a5fa597755c8ea20da781929386c..4c4dcb095c4df97de42d0673aa2842010a249dca 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -195,14 +195,13 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 		iommu_dev = mdp_dev;
 	else
 		iommu_dev = mdss_dev;
-
 	mmu = msm_iommu_disp_new(iommu_dev, 0);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
 	if (!mmu) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
+		drm_info(dev, "no IOMMU, bailing out\n");
+		return ERR_PTR(-ENODEV);
 	}
 
 	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",

-- 
2.47.2

