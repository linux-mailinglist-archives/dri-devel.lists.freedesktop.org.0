Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C323D1A725
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C2D10E518;
	Tue, 13 Jan 2026 16:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl70m0mn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2m8001R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA0210E518
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DBDX6v4164854
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=; b=Bl70m0mnIlE3PPiH
 xlZWgYuYfe3yQGbXCaJHGFprZEdXuDhiWbfEADlSsQSfeMKD0bwzFiXFnHgx/Cc4
 AVJ6nXpTaXAoK+VwLUPpEWR9pJ/RlOWqpXxqSfphEOpORj73NaZ5P/mT5hu1qDYD
 mam1bKmJPDSKGlI8gKF0jErs6HWIirJsPdpNdSPfkmo07yuX02mBXNce+aXOkWAd
 M68CXgvpH5KW73UyI5Ctm3M70MAK/msQmO+Om14m3X6rqcqs9a+CEw/cDfzLnR6p
 Y4JzZHp8dhOUBxyDxQDlCLY+9TdtANtbgkTBDzBAFQOGDNgPKwripZBC7qoIyL7i
 83mR9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06s4j4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2e235d4d2so3028923985a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323448; x=1768928248;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=;
 b=j2m8001RO2ZsLeIy7TA4+IrODoVlhMSkDJmuhFWpel8uyqwEMUd9I3+64H+CSqActI
 kUiH3Heg1CuPfbxzebxl8sg3xwRRBeZgIYGNX3nvDv7IK37vABojSGY6z6XQ8ka1j9BP
 Z98coAediR3Uz6x0DCTEllA9GW+kwzs8EzYHXGPVvIp5aNDkDispG3KSOoWPiU+Uem2S
 qQJNrWTnDvfo6V/R2mu39G+s+mF0w3IAb3W56dHEqyKtp2rGFKA8HNPWwKHhvmDrVfkU
 brdoBCP6GueF4KrpI5foHYOdNjan5yjygo2d28qUoRkZwqDqRgXz1iIY4ElbqSeEHEik
 O7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323448; x=1768928248;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=;
 b=qUxAskINrbL7h8VFPn88JtybIISJnoiQE6UKFGpM7UxWrLBvgkqAWgXdmXBw8VvR8V
 2YHdyXKZxwsrF3YNwuQeDzCVjxZLpFGxzeHPGeG1FIKS4YP3stTVU7CvnZTWOFhNa2kY
 1ymz7FtjTvmVyFgmkHhnx9rh4Yj1Z7Tij4BX1ldCe7zVn6lxc88+myULP63M7WFCGv8E
 42XoXNaVxzgnT2iYXzE68X5G9cqvYcXpdC3BVwa/R8yJBM+k0ra0hLKphKMB0S05ceKs
 9QcX6ytsMHXhcGoXa83O4DxrQb1uDFeVINN0sJYv+fEIgJ4YAc1vZ4vrO+w5ZquGlwYh
 abhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLuPDIiaQRL0olfle1Wz8uOS+HOdLqyi8WXPNjfalRovEbqrNQsFjTP892ARgdePbxYodzkRi0UqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGirJqpgCMURY8gwWYV0WzaISP2CoLgu90XWN3gg8hcEUjxkYn
 qe/fb2JLWT9Fwip8aoQFTM1GxBhQUWFqRC9j/gsjQkVUUA07xhLzNrQDf5XP3sNePkuPBDHvFrN
 vEPsQhxVnSk/uFAV4bKVHrXa6+5q04Z077URcjWHTkvZllLmEn1xK4wGvHgSdcMUUXCaEPRg=
X-Gm-Gg: AY/fxX67NMy2vrWp5sHL2uq1frW1YOFliT2Jx7t9dglXzYHEmdiQiU0OqZyRk/bcnFe
 S9fZ1bY6goryZuNG1YE50cvz3TpeQ5s/42KOgRNb1KQW2ExA/1Gu5PweB2v56x7Arr2wJl3CNjp
 Biwb8xWSnClUFMUKzNWYmfM+EkOl7K1sfrjqBaBT619Tfpp0xRKaZu5vvoqjvKbVNfzdQK/A4qb
 tZ75Fmpz+o3OQMgGTK8EZaVbvMiLPSB54N+cqMj79GvoStQVB7sYWZqIOYKf6L95tSWkaFtwziU
 1RTWl23KjTqRyO4I66WQnX92uteGf4N/qidVwxSrjlJbaV6gn65nwYsIwUv8LyabFMrp5vFDoVu
 cFtURBQMWF5YQiKiyKZ9ECsZ5YGHj+s54HBhiVkHp12UknXvqXtFOly6YU43BjBU/qtYvW6hB2u
 LONlve+glNZWcOX0Z5qh7ug7o=
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id
 af79cd13be357-8c38942eb97mr3003665185a.89.1768323448376; 
 Tue, 13 Jan 2026 08:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/AmuzhGdeXGb9IMgcYMTT/QFul/YgNecvob9Z4X2y8Ir09IUQq8baUg6jojH31xE/m7+iNQ==
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id
 af79cd13be357-8c38942eb97mr3003661285a.89.1768323447925; 
 Tue, 13 Jan 2026 08:57:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:16 +0200
Subject: [PATCH v2 01/11] soc: qcom: ubwc: add missing include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-1-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=htP3Z9truSrb0C/f6zBgHeYgKgcZBATzt8YmI0trXfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyX+mRV4ra4qO0k58wxnrmUYqzjwCmx66iL
 BixaHexCTSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1XTHB/9jF+1UmwmCL8Abj1wTPKQwTjOSMKu6jxaBgqrHCKE6UxKbVVBKzZIVwfVdgEpPK4bJX1V
 Al1LMZOXT1R/4+nvtR89oNI9IjoQHm9V7VN19DULx6VgiTDf+XvDPHpOAMaW4gsZM3K5s4F2Qg8
 703xTjLcG6gJlNgQT6iozLZ4MfV4UIve5RBkxscPBuFTooHSC9klrNJ+LnOZcCQ0LJo9SgRVqz2
 /aydN9DfyYEdDTQ490hOFIoJTzMu8G32KfdTgnZT6nAZH2wdUwPvzfnHDxnGG9AK+HQe0qTIIZL
 ocD1X6Tbmg+JEpK+CG1ZUyg6O8tDRDPKBzSs1aW26UKO1vjQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mOnm-6xuAh2uMCOqkS5t0oE61ML37Y-Y
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69667979 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ALiPkwqszP5KJWpCD6MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mOnm-6xuAh2uMCOqkS5t0oE61ML37Y-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX0T8CTkuJYug+
 3wMlLjjf8jqjO0xZ/t6/YM7klOslibFDLx4lh2rARSCkDhPTvipNA4Bun3S0EJ7tBPsNIKuzICr
 2fJ3wH155r0RxUQ+DQziVSUow6vR4N6Y9ech5Fv7w1DUbVDpZJ64GHSel/5REE8vPw5xbEZfFUF
 wLFSBp5RBP2vEfhlmjmcvVZsRp1rU6h4m38eXNuHQok9IdRUXnZyFvNB7Qc9HlcgSTyZTfPVsXw
 xG+ZhQFKdkd+M+A9zeLGGRV/kMVNdckvAx1xR1ZLZKJDu4y+DAplOSZATQ2+aiHGDph00g0YvmC
 sANddcf99ciObI1ONfml7+1ZZulxTPeviqFj7R4hObGHhpgMcuF3Z+L9uypOyojsre4z/W2f0JD
 aLB35670L+2Th/97Fe5xwkMW2KrCMtYWcHq9batFMv/A5jek75DjQGtVUTfi2Z9a58D98RVU3XB
 oRa+k1NMIxglONryBeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

The header has a function which calls pr_err(). Don't require users of
the header to include <linux/printk.h> and include it here.

Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..f052e241736c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 
 struct qcom_ubwc_cfg_data {

-- 
2.47.3

