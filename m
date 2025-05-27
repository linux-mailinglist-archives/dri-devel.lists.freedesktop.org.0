Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF6AC48BD
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7860010E421;
	Tue, 27 May 2025 06:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy64nr5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4848410E417
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QMUHpP020171
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZtC+JQtO3gxDVAYbGb6Nhx3602teWQouLuAXr4MKzq4=; b=Uy64nr5HFEFTcqsT
 qlaxzxJ/o8pIouB/jOE0FGyB4oLs45KTCP7MjA9etAg5pnC9oYEdG3Q/LWBjIel3
 WihkVx0WPJdeJRUbW/Xb943MZ69CpKk6UVoVtooWfiNbmRfF5959m19NZSJwZJ+Y
 NhLYg1MWfIlb1LVn8WuDsk5ln7fHO/LmzqKvoi03f0j6r+Co2HcJTaRtSJ6Ytb9/
 YPFRGZ0/WEZ4OwIvzlTevSmtIT6jUC07iF8FPiESt0zImaCj5ngN/SmYYx2qG1DU
 JOYMijtBnDjNFfYzmUm6V8nTNiaz0vZF1+sxZtriBoKKph4RpH3E/vVx5hlAW/30
 GjEqBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq643u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74089884644so2618656b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 23:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748329044; x=1748933844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtC+JQtO3gxDVAYbGb6Nhx3602teWQouLuAXr4MKzq4=;
 b=U5JJZaU+K6GF0y5kX5we7oYHQah74jYW3hMHVKl5HJ2jqp4HztPeHKCw5NiAaV5WQy
 T5pCKu+yn4dR5qr3yZ6RevCGWnNLeWA/sBPVY4AmFTOXRDYRBwW8RqCeO0iaCqB5uxrz
 wWeVB7g8BCXP1HdQ36R19HOL3VA9M2M/S9nKxM4MSsqa820npxLqEKpQQLJae2SiDF4j
 5Bj12EEmwyFzj40RRAGxbXWW8NwUrSgCceGlkIzvyTZsI34Lw3Gd+o1pMLodaHnd8dRp
 ZN71mbhYbCxNKlG9aBCPWH3tf50AAgF7+Qfgu7Yc1dQe3KAu8ZZlac3GMEPdpl16t5bS
 ecNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxGVh7bYQ2+/HJhNzUjaXBlSbEBEbQajaPX8sgdk2IkvqiYagbj4pVrMY2lNakCKPR6dSvQI2XWz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9+nGDoPTs/mwVmyCTLo9A/ecDkjmTymPYap+FATll1AOpN0nF
 wCdZJnuJgeyIJttM9xNfyqw3fHHx9T9tX0vJNQRItNIn/AjdpBjKwPvHn0CNGOt8g6ndBYiifXM
 yHeXWmnVCrJBb5YC+heAlpLW07Ti+zFWBf8JwvvHOxORFQbw1+TwS2qJpfc0x2x3URQNOcw==
X-Gm-Gg: ASbGnctZ+oiAirNm02vBHtvGbF5XME9mtHMn9K5j+EsNi9K12suOMOr9Lb+/NJuQYmu
 sABhAkpdRyqeaXpZlbtTgaVhzgwZ8NPeDD4qYJUDDcv8h8Bahu/RCKitaXCZLejIag9rSJA0DFU
 uncbzCLXpzUZbQu6eDjar1yD2nwFrZt8SQO9wggXP7TVDQPBlRtjYYaYuY/yVawGFuOrkR9KBPP
 RmYLA7J2SpwK8PXzeMwoOtnnSWnhGw3yxQCUTUqIWbLdNKRULF1oYxDI79yw3ehL28grjpUtgNi
 55NoxnEZETu9lqVqMQMR/gk8XMmIX5NwJJk12fpjfnKHRKkeiaYPVpcdJL4BcyC055pbASs=
X-Received: by 2002:a05:6a00:22c2:b0:740:6630:633f with SMTP id
 d2e1a72fcca58-745fde9e86bmr17925590b3a.8.1748329043704; 
 Mon, 26 May 2025 23:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuJK0Qw8sB9Ij2uNOo2Tek3D/ke3eqsRNl8h7Kgqs57y3/v4DiAHeFdr24Fp7zbHoUEgQ4Fw==
X-Received: by 2002:a05:6a00:22c2:b0:740:6630:633f with SMTP id
 d2e1a72fcca58-745fde9e86bmr17925560b3a.8.1748329043282; 
 Mon, 26 May 2025 23:57:23 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 23:57:22 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:50 -0700
Subject: [PATCH v5 05/12] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-5-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: vmG1aGas6HQwRILKmTdRNZuShUWk7o6E
X-Proofpoint-ORIG-GUID: vmG1aGas6HQwRILKmTdRNZuShUWk7o6E
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68356255 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JCP0Puskdh6qvuzBaLcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfXwv43Ctsn0ieK
 s8MIzUFfMX4DohMcyKgDfp/wxI0bMsl3jm1XNnvxiV9q5jA9M9uDN7ZD6nNAR/JeUVIp57myuV/
 ZAdDIMDvwu2WG1/Afy1CVDZpOt6JDASbTuSTIAIOS615sWJSVXmQW6gNtZ13MWbDG3yzo2ZjfVT
 aXNzihdp5/lMIUfPhChTEqJzhnKIJI/8eijhD+WltP7cMTXrhbs14hGJgb06j1BvqnkjF9ey/PR
 i677qh5juArmaQZQCizvPg20OKFklE0qOAkyQiVb1xegTvJN0DnUEJT16h4TI1FpDq7TcNpoQPZ
 ZW03AJvS9EWKnufLtck1bz0xHwVTPS8J4SE+SbX5HQ944V4J1rXOiXIO82WeuhKNnW6q2laszQw
 GodiolDqlhoY1kBrT0dqAOBmfDb2KvDAWrzwLr3ygZYhZ6h3V7HOc+hl5vppvhTxgBSuevIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270054
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

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 441d97add53f..71a365afb89b 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1

