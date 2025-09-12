Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D2B5416B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 06:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AC810E419;
	Fri, 12 Sep 2025 04:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="myK/rdMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B594310E419
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:07:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BItC2j016853
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=; b=myK/rdMl99YEWJ+9
 xmp2+5NdqcR+Mu+5y0d5ntrTJX9/3MebyNDBN6k2hK86ki46zaHW748n/KtCBdeD
 E7qghvpX0ci8pjksyjhbtkX+LtEM5Gt1MZcYZtDy5JafX2Khhg7DaqXXzsANT7xe
 DivRXSpi6QsdkYn0hI3Osyenpa1JFJHDpZQHErgoOrUjSxa63457nU2i06IqMgAw
 zE/Vzu1O0sX6KCtTHFnWxXY6ji6a9apjzErEzNhHq1r1DvPPAAfNx/A/bNvvC+KY
 aF1b1ZNKfjQIJ+Y8/VfNenfusgpvFdpATG0XArnnzpTg8ooKN9Ke01LjlaSqpCEU
 fQo7aw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t386jx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:07:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724688833bso1388242b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 21:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757650078; x=1758254878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=;
 b=PX1ykL3G9YD+hQJDjZEyVEullgJRSpU+PL2Dv0TlwMXfBg2V50YPN6FGlkprO8eTIV
 0Ch2LZpflC8QW/R47d4XKvvXI8gsprASsGoptjQcrXb+LN5ys7cxjP+J2BygqUPxHNCL
 Wt///MeEADtcm+LUsD8qpVVNDFNSvG6wXLJCT9K+RQeXuj92fp4BR3DBuHAshYnDTHRZ
 2yzt7BAK9th8pc9s0eLm69rdG6Lpq/3DxPqw69zjbq1vapFndFFK3RD3QTq4hAoOwnb8
 X+ctCIxFeDU71OCz+FsOyelQL6tovV9ORy16t3Ad0TLq9K5aDldHhzQ2qlznhzMHC3c4
 EAbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQs+AVj9pp78odkSxWDNw7V+fmbJ3UM6ocjo2fWgj81JNFJQ7MvRLGPZFaPXUYCvRNbu548skf0tE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwncLDAviO9bLkspphh8MBZbXj8ZIkDtcChiPj+On6d0KOrW0IF
 5IWMPfskvYWA6TF9oRV6oAJ4BdLAVrsZ1otCjoHDPx0zh3sKwc8E7YZQ7S65kesmWDz78tHuEYV
 7Myyrs16iORKyWmwhf7ey+xveGwk0FKSA3NVtUO5h1PKgungiAU8Im2FN9EdniCRrNjKoSA==
X-Gm-Gg: ASbGncuIc56IQ8LYsAre4CqqHaiGBS0rLDXBusRG5xTAmumtrGxtDGHnjraaMvzTNbX
 io/7xL5Py8ItrnzGde/CoHQvA+jKx1cA146OFLsnFyssWq8w1DGyQN+3FSMboREKbaEa6Tlqikq
 KarVtBvuL9xdIn4nCL2gceUhWjidAozEpnyQ1RcV0rvVQ2EacZ9+V39v1ELubFAK9nsnCkhhuB7
 8lJ5vwhDAb6PzqnOe2ZmfHFXmGLQPfupJLmTQzZQKqsZwdVh6igJ+w5onTwYbdv+w8YqdCQCGsj
 twN1wL9W77Muti/lzmXeqWrumn/VoLwm/H1BS7MeroSNyC70lOq5n5ZGUEIdifbNGkTtwuqaNJ7
 2cJahBiJCk8u0vwUw40/7EgE=
X-Received: by 2002:a05:6a21:32a7:b0:251:e4b4:7a37 with SMTP id
 adf61e73a8af0-2602a894843mr2108804637.19.1757650078386; 
 Thu, 11 Sep 2025 21:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ46PSyhK+l4ntr3olYRusLBfLu7HsNfzRgfw3MxvnYkVZfq0w6ancyu/i44/JHqDSTmkaxg==
X-Received: by 2002:a05:6a21:32a7:b0:251:e4b4:7a37 with SMTP id
 adf61e73a8af0-2602a894843mr2108762637.19.1757650077930; 
 Thu, 11 Sep 2025 21:07:57 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 21:07:57 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:46 -0700
Subject: [PATCH v12 07/11] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-7-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: je7e8-ae66ra-rG1WwMudzAGnbn7Zavn
X-Proofpoint-GUID: je7e8-ae66ra-rG1WwMudzAGnbn7Zavn
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c39c9f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX3UDoaEtW9DiD
 cQR+tGwDhA9aMU9kIy1TzDpdknmK8PLejs4sI1crCvGHoH3Jt9YHCUwAAy2WulUL2eZAkImQpoi
 EzJUA/f6ql6xxCLVB4vFxO/+w3cMMre8PcuMJ8z/wWnb7CKPmMsAbFiT1+2kwP5pbSLPP7iF96U
 JRdCY8GiCByjM2JDwGO8SZlnqnhOTktAdLuh90L3pTzsuVH3m0zctuNZGZlV6kkYRgsHJ3atsO3
 DWno0XOqBHIiAq8hX1HffMpYGVoiCDa51EdPZ8RGpyeSa3WRFjYkrQNIvC1048ec0DubnvslARq
 PRVcdZoUSA3PTvW4sLTuuuq+VadzzwQ1KyzK1YtJia7MdoyI7/II30PGGDLzSwrRY3gRfu5QX9s
 kXSOz9FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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
index 9abb0f299549..a5466b503bfe 100644
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

