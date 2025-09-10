Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F2B5229C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0C910E9E3;
	Wed, 10 Sep 2025 20:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBP3A2xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA8510E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgLbD023751
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4zEFniw19gi8VanifAvhqImkhPqqb16gAdVe5GvYgBk=; b=pBP3A2xhm/9Vc7b7
 5XvUZa38nD1PWzIpkMiggd2k3I4H5/dUjVXSHb/Csi+n5GghLhFxRIf9yJFj2Pgm
 dDVzvSmugP6DC6MjPHamzvuHwEqKXVROzU0rgxULgwGVgdOCxa8yAGaQHDgtfI4w
 /IPzr41fwgT/BK02tW5cMZKoJ45x+szN1rVh/Itb6VZMWGRSyWW3sXDRBppKwMW3
 5QjdelzzVWzWzAqUM6tKBxq7qVWCqQ4QJ8A1yJer/L6z1Zi9eEKtOGcCkGzi9QNR
 4qZVdoOZxB+46vtJPPodVPeeMYy8tn8reprRI6w9TQeJjXWQzbkD7z4+hP5Zezkl
 4twIoA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m5573-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32b58dd475eso7366280a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537088; x=1758141888;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zEFniw19gi8VanifAvhqImkhPqqb16gAdVe5GvYgBk=;
 b=MTnBtI0l+7P/S3EuK38q9k9liPsvUjgKxFO9qTw+062nrdS5PxeEZtw16ea2WvCgti
 HCWd9BNieDRwUhq9WR7sLkGEGO49u4DczBVJuHtFg+aflqYFX9qg0SgX2fws2rORc0eU
 aO2l/lWde0RitKmY8pA7qMho4FdOHqYYsQQBHEQOTud/MRy753aCweKO3JR8rL2Pcmpq
 yaWCh9Uxx/gwCs1/VbD382VEkFUSct4i7Bc31967UTWkF9JD2rdx1k8zn2fEQrvqtrkv
 rWHba56PkI60YXMc//jfuAyv2M88luwu22Y4/s0CvELgI0FPa/Lv6wZnVSfPkuf8/pa3
 1gzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbFVN/2cDNQB//3yu22A0AwRHquSGg39yumij5v9Axja3e34gTE/1pOixKBkZASXrO2U9YWRnnELw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtHs5RzBXwYLXEvrrBB3Lkwnw6W7FZRCWlI9HCoWTqTjEABz+U
 927Dw2qPN3Z3ZlBQVfyHdUKHRK+6n8KFBrFH5VG1umT18qzmie00SDW3JDRwWgLmoXmwVK5YZPj
 1xapySRF8HOh8iDav1qhkTOygz9fHYEjIbao1hRa4LUy8jwQYzLBY7RbNSSjYE0zlOH6a40tlcX
 DToaQ=
X-Gm-Gg: ASbGncsSK9u4hnnlPmDKfOZZ/PeDhxEak+fv4UiQoPKrqh5h6tkQbcVHJKfkawtEZMa
 IQx30GwAPwdbAv4VfQ+yuq/2DdlHD/N7eTHcPsfU/7OAz938yVP2tdAZB0LD+zKY5HYXmxNjSqx
 SNyuxbWE6o1RCevAoVxdQDpejUsrGf6aChFQuW55ED5MvdJWoEdsyOZoKq7m4w0ggCHHIszcMjI
 Oat/cIgmdVX1uqdXZB0Q0D799thw+pnhTI5J95UbUFGIvLlV2IEVBJfNjLt0J5CMICymI6zdFnI
 wjM4dvvIj8azdNU1xuvxdX5EG/6n7E6Utr0jD6Jnjb3eDF8PsWFRKd/+QigqYU8a
X-Received: by 2002:a17:90a:da88:b0:32b:97ff:c941 with SMTP id
 98e67ed59e1d1-32d43eff6b4mr23734450a91.12.1757537087778; 
 Wed, 10 Sep 2025 13:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5JeaHP78+QQF8BxRzGsrY0698vqlF2QsnYTCp+u1b2tpPw9ban79zLcuyfYHCSYie5Erv5Q==
X-Received: by 2002:a17:90a:da88:b0:32b:97ff:c941 with SMTP id
 98e67ed59e1d1-32d43eff6b4mr23734421a91.12.1757537087342; 
 Wed, 10 Sep 2025 13:44:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:14:07 +0530
Subject: [PATCH v2 4/4] drm/msm/a6xx: Add a comment to acd_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-assorted-sept-1-v2-4-a8bf1ee20792@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=989;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Cc+w7MVJQJo0DUQb98BGTv/aakQ6gRVawbdf+TbmC+Y=;
 b=xWRPiIINeFvdpTfSw32jFQ/B9ZRSd9C0TetdrhgEBC7bIXtv5wFHq55xcGfI/ke/rZBcT3KGu
 bc7geSlPkQwCgsmEfhFN1DFSV8/fZ/hsq4a7zWaKlTfbN2ZoQJ+3FtQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX9nevs6Pr2/84
 ptMKvh/7YRbWlXuWMq7ygPg6/+uhYP73Iz3CMYAFnQf600luM/zHjhMinoapJQwn1vSN6AtJzaR
 M2c3pFWKDC8zdo3MmEfNpz9yOBuyYrRDDY+/liCaoIDU9QN6qdQrNKtyKv0Cc8L2ZRtHsg1W9i9
 hbBb+Rqp5J8pBWrzfZooFrSdNk+ke1+mySCvhtEfDcUR3kT8pn58aKsJf1NlXU3Rp+O4rW63k/y
 Z4u2Pb60FqeJprwPT4cISwijqbAbMg6kR+MJVbn1KJ/kGsZCMZkjKDEd7sS7OLq0QEIK13cW6VW
 GZX+GgE5apachL2LamLatpceH77Z0roT2LhjpzdaWgnx9kZHOAMdDwuyizOIFNhZkvX0zmVfZKx
 kbgFPtjq
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c1e340 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=p01HAiXOVyKYB5BxCaMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: u-Gy_GN-XwX7IdCvydl0aUf_CyZu-Ehl
X-Proofpoint-ORIG-GUID: u-Gy_GN-XwX7IdCvydl0aUf_CyZu-Ehl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

It is not obvious why we can skip error checking of
dev_pm_opp_find_freq_exact() API. Add a comment explaining it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4c0510cc784864da990af8cad086176a5d92ae8a..f81e28fb6f2ac4b1ac15fe50cfb488572009003d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1695,6 +1695,10 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
 		u32 val;
 
 		freq = gmu->gpu_freqs[i];
+		/*
+		 * This is not expected to fail because we are passing back a
+		 * frequency which was retrieved just a bit earlier
+		 */
 		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
 		np = dev_pm_opp_get_of_node(opp);
 

-- 
2.50.1

