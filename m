Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A0B23D19
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 02:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2240710E684;
	Wed, 13 Aug 2025 00:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpBhiATq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B90510E680
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CJjb0P012358
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=hpBhiATq/lYNQoNl
 JU0LE67zXI73ccU1PvZFZjE6yyrHd6m+Rex7gpWZXVjKmVucI0LExqgRMNhd0J98
 9LH0ei/1XvHw7Bjhh90eu6VvCtoJ2dnUsaGkCTQs+sXNwK8JudT7rxMIcpW9t54d
 KWyPtiMr1bEO9bWZanKSUoeqx3C7bs46ZQ9e7TEIYovgNoDN3M4/BrpqIsDnZ2gE
 CC9qnem/iRSbNs15mScprIvuAeZSl/Yoj/TAq8IQoxpi9J2bPjDiFm+lteTwdnCz
 P7+grhIauu1rR6yPuSwvZO1FLPfM7Ee1lqPxDahF437iZV+vk563+0j+eJZVv2vK
 eYKKOg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv1vkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b46e799ffc7so2163658a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755045427; x=1755650227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
 b=RozQr7HKJt9zkNmcyfrv9RDcDy5QEN5XpatVR4nbSJN+KkrOY43CZeC8fNVbibkng1
 YgPBREdbfc7Sqn+U6CL8t+0V1cYlE8ge48/H4TI0/RHwuOP50hxKPKS6sG2vWLUM9gZy
 cagyXoaRgNMd4yEBnILE4fXxbdlQouWVB8UO+9wjzlVzQY/YbQbDdtMG2Ur2peYhtIl+
 AR7OHM3Ugcjy2NMQ0u1IWrwiQ6yiJqbSP36AmdXjWilOS3xa45qUYItYNXAAqjP5vhdX
 DNOkWwWhCIyWSYz1/p2pieCI1IkEiOwtNFQ2LPIlUrkgSmnqe1lFuBMF2GBSX4oLgPn2
 iJKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJIGUIEpKMAFR0D1xLL8kPNuo9Nu+B7TNGzwYbsGEp+OM0AqLIDAuKzoY+3qz4iFPqX3ZKDHcpiy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW9VkvNkcgLXA7PIPMrKIdZL6BaQ2+v3WYkCCaKqqn1aLKSMRr
 z5k2mDmvE/LBEFVChlhANlV9pakVmK4YwZWB15lla6yeOrXlAn7/Cyt8s3pKGXbRfqF0JsqEU3B
 LOp1ieYkPMgEj4fS100UhDSvjWTB7DoYoyq4Dae8NdEa8uCSI2HozMEUKsiB1bWHz9cT/fA==
X-Gm-Gg: ASbGncvvNK9McuOQ/YlvoEuzn52tH75Vnzo2K/7Ta6laWOt9oeRwzEFN5BkZ5ScSfE6
 E20Ri6Ryb0JM4xk26RxHxBDxro1TK48IJucAWp6LNv7qrrumZvUKMa2sJyQBXNQPnkCRya24Vfn
 JDtSgJIwjLmujv0Ehh6fWShVLUQxB3PxOhAxCCsWwehehCqp4nTpTobS/IB12BBclhrk2nAQk/P
 Z9uACq648gmRx/0m1Ds4x9VxmlvtNzeFn7nT+aLS5BW+z9sOXx9VAXZUQiLKrPif8WB8LCZIfWD
 FeKfxYajdwh21PT0DTrMNrEMcb1jDMmS/5MCnfudpAwN8aUqmGGqXW0qw2Ty7+P8JW7FKprT+QJ
 mtN6NfbtdgCzS0IKZc0l/Uws=
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id
 d9443c01a7336-2430d0dc1c7mr17668485ad.3.1755045426963; 
 Tue, 12 Aug 2025 17:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq1Kn7j1C7ztFuBwXBgmFYHdC9nyMf6zyzl32DpAdGpojtxsRNAvOz4Khl5wCYv7bj+v3xFw==
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id
 d9443c01a7336-2430d0dc1c7mr17668205ad.3.1755045426556; 
 Tue, 12 Aug 2025 17:37:06 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 17:37:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:34 -0700
Subject: [PATCH v7 05/11] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-5-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
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
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689bde34 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7r-CuFnMcOQwhzdogdtygzatb5C1sB5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXx04VYLjjQ/H8
 8nssl5sraQMcu7sHJ7YN9pLPuC+ZT75sbRTjXJX4w6EYEZaXSJNslOOgw6HLYWkpyJsHVDCYKuz
 Oug4bteUBj3UYcto0wB1GMIbNhnqoVrwc0Pq+Fc5ZSCODpjxomdBpOmBgRjKmzbMkjSfkFMMn3K
 2VR9NGhpJHb04XYF2inLf7Ieyk2KL1/7Kiy1Uctxpf6dv5LaToLuCuJJSIoqVUNGXG+mTcwoS63
 64GxSiw7O4ky7o9e2OZLGDI2fQJZ8zB4SlJO9wTbaxsYhs6HNCd0jSyhsQNigu3DSf2zxpsG4W/
 lVeJvAgbmVWXDeKUZN/CCIS3F4+JlCEzJ69K7IQYCXsKfmm50Lte5JnmYB/8sBWFIPca1U7eIIt
 Qy2gONui
X-Proofpoint-GUID: 7r-CuFnMcOQwhzdogdtygzatb5C1sB5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
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

