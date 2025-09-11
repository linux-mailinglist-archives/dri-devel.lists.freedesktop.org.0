Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1FAB52728
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 05:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CAC10EA0D;
	Thu, 11 Sep 2025 03:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD81zjBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766BE10EA0E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IZdT006540
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=; b=lD81zjBUQ40u8W2l
 UmBOznX4JfGe5Uc8w5e1E5ljITBKS7BsvfJadjMBZVNwmuJjs3maPhCIm1VeKuP2
 Ao1EYPK75Vl1bjpsY8ngMmzHKZJMqg/kyUOs/mM1gVHTBPi5vPIv4/Paxkp1ZtxD
 erCgNiZIJKFbKYts0VENwvk1WpXjnCiIhIvm2W8cRSYKTHEOHhy2H6YbiYeorEPc
 mVWJlM2tuNDJD/dNAzbweTL2u4WH/A+eNML53zt6A93mQ/ODNh2m3dFV4BlIZXUV
 vUwZV8xUkxkTnof9CAQsHGV1o6qJFJVmtH1RPcOpFN4jaTpyQGbzTVipJ5SsgssL
 SIU22w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ae3f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25bdf8126ceso4956955ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757562096; x=1758166896;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=;
 b=LsoktJSVTfBmJ6gzBSQkn1JisC6lhB5Juu5FFkKNHZ1kQz3E9VNWa3n9wndIezYtHK
 db6LmOMRRRSO5ZwWxJ90aqCTMWOqWotIXlAT6MqpyrFsrQm5hZjYiQziogaZ9HORnDbq
 mxz9NPeGVfStyEm9Z64CIb6dfFNlrzdsm5WQDwXSXnn+1vOqAlDptHG/4RZ/wp+eWIif
 Fcp9+psIuKIHWIzICH/Co9B4mv9ogC2UQWSUoqa25nWf05ff3MDyz9G7ONMFxlWp5qMv
 LXduOA/9RgORr2y9AByAwiasp1Ut18l2Kteiizbb4iUAN1mffuz7AXRaWE/yzxvSWIqt
 cWOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxyqRqmC/ehFKBbnzYXIpOOuOni8ZiO4Thiwy5LpQKv1Pmgy1zvja3VGTxkia0Bbv7ne1OFoWmULk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr9tx1EFmWAksaUSnKy0miKiv9h5KBSEbJVP/g6uXsIO5PATDE
 fvvzHJRGQdZjTZypugmKR3M/Tv+1FCLu8/W9cKMv0yuDGEZ+gsonzqpAJpCDaAGizB0cu9jGMjz
 8K0fGRYCSXb96o1OK7iVoOCTjLctaV/DwNR5dHb3dum9obvPu4BvaCp1cruAJS9UH5/JiZA==
X-Gm-Gg: ASbGncvX49+kdAW39abMLM0ntxpYwYp5TgZg/IfubkH0ZYchG9yZmI04+dUeQN34+Xr
 iCUaf59vW5i70xx1xNRDvd1LJkPHdC+FXmgPihAeoDqQ/YEfU+ASlOqS33wSuaM8LCkBTBnxrss
 SJY1kJ+1VVdSRZIi4xITJnt24yJ4fpVWd3OlZRSiSUzeb/1cIZ73LWuctBosUZbnLPVf++DC8Nv
 2HwSlsu7FrTqLZrIYTL0odbH3ME7tmO1j21aPrE8A/y/Z1FfpCE51GsthtTzwQYN4G4cz/XDjl+
 J6MKhCOSxXCV21yFOujYSQlNJRxi03UaZIJjQhFuygrRxtk+p5Jz/lh89cLtZVomHh0+mRrDx9r
 5M2vVu8M9LsvXwhg75P6W54M=
X-Received: by 2002:a17:903:2b05:b0:24c:ca55:6d90 with SMTP id
 d9443c01a7336-2517493a0bfmr195669785ad.61.1757562096058; 
 Wed, 10 Sep 2025 20:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvQDQ9uOhNwBYBH4VDpBdDwefv3e3oaJPc/CzBPBFYYZmFclBHQ1LdmEcszkXBkPyeDRPZhw==
X-Received: by 2002:a17:903:2b05:b0:24c:ca55:6d90 with SMTP id
 d9443c01a7336-2517493a0bfmr195669425ad.61.1757562095433; 
 Wed, 10 Sep 2025 20:41:35 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 20:41:34 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:20 -0700
Subject: [PATCH v11 07/11] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-7-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c244f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VMaNTYyYsNeWJ19kG-gBgZjP-us2iVL1
X-Proofpoint-ORIG-GUID: VMaNTYyYsNeWJ19kG-gBgZjP-us2iVL1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXxihdMe4PC+eq
 f0Ja8jkCW/WZGO4LJauBcJjIXel1YKrepw+SlVIM5iWoHEB6YSfPSJ64a7UhlJVwsCVHz+NcHS1
 wlQh+f/bPaKrxN92dUbtRBj0+o41Ktwaq+510YGql/GmFdSEsyvulo94i7oNLQvYlPg5L1AsKqE
 T1cotJowallZKX4sfUMkOkpzauRh0VHm2KBK87IWg4XVaHWMAutOYqgBwWEnIo8xzMxytVLvk8a
 K6aToJQm5UWdpKVC7v9l/xst2NTErz+FPkqaA6lmep5f0Vmi1e7X6zPxmLzaHhe89ScfUjIKUTN
 tJq86PYpT5calcOf/9JCmH+208XNdIIgMJKvfl8lO7x0SZi/qOUS7M5FLpI5uPgNN5V7kMCtvpf
 Z68/EIYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

