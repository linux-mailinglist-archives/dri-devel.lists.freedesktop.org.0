Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D07B23D16
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 02:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716E710E67B;
	Wed, 13 Aug 2025 00:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5JbHF57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BEC10E18D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:03 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKd3gK012602
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aOcaZQdsCvBu0o12Lc511EeGDT2I7mkwnOLM4V2+Xso=; b=a5JbHF57vjtIG3Y+
 W9ifcik6dLYxdmud4XMvyhpXMtAJgEnVfwGGmbO0UtupfpoDEts8WtUNyKtyMU7M
 1xnLjB5lAP5sdW2bPRkFPZiEyZtjmPSfggk6B1Lv5bZIoBcgodGg19V8hsJgN3am
 0y4pxUNbeJJZDZS4DIWqA4D0MV2OCrxOX355vPVIHcyMB1dKNpiPt7xfNLBZpe0t
 40yumk4FYi8PvHDmEgDJ8khzdpJmnOVVU+OKEQb4VH8bWIPp4XpobsMotIl8tMEh
 4BKi6qJfQATmehkWHM16/CEY/kxVwkXsS7Zoqv+2idXUi6VkptW8BluOXGMqaDyt
 7qTQzA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv1vkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b42bcfe9c89so8659008a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755045421; x=1755650221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aOcaZQdsCvBu0o12Lc511EeGDT2I7mkwnOLM4V2+Xso=;
 b=VTORuvOCW3tPyRLfaVqwrjGjdDyoOrUPoe3WSkOb7x9n+cOaQAOPpTOrp7ViM8+PsF
 kWtr4BV8RE9BXxbO0tt6MDAiCQPBA9t0kb0ocdlR25YzGC8kWLIAShNkbufZFStv+Mv5
 2IFWcLb2w/8CUxDFKUS8soQFRT+xCZ6IH2njSdXf4t1wcmaL5DHA5zJY+KnjIZEGskr2
 6ekxMpFAUoLi2j3LO7F7kEyL8oEUu5OJOD+cSMn2Y/kk4iGQAW1zB1aKy6Yw6Y6/JNzl
 Zu85y5B9kOH76LM6velGLgQWbBV3JIA1UFMLsdT5kL2L1eRXWoyJ65pKP5w9tMy9K9/c
 GrPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5TeGUrJcHJkYgP6j4mcS8P/qoZ2uDA2C27fz6nuZrwVJ5dlHEQJX7Fz8Uti4VgGyV6yLu0z07zmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeYZFj9k4pA2YRfU1xm582hNG54LP3AkfMeBLwQPNklE3LgagT
 4PreMx+xXoOXePsGGkBqlJzV7Vclo0TGA3o1Mo7Me269ZE7igs4liYAa9ldtIO2dQTwIV6q3Jy9
 Fifjaoz+WTJ3W+MbNpoT11jIRHbSkUyR/jAOeP4PK4uOOOqnz41XBKc6IxEf0Isdw+rmzT/9WUP
 HeRbYr
X-Gm-Gg: ASbGnctz4eg5q7UIlsx7dIgH+5d7PbBernGw+rnwzHV45mPTvTcysjFNrDCO5ErRLYW
 0sC5ICgT/3YHPUJT33JoeIzE5W/nygFSV14oeOrbj9SOKrsB3zbRJRViF9gRdS66Lhvjb5nHFdl
 lBr4mAe2Q2ewG0shvybI182lFbc2WFwBVNMo/L2H4+7tS8u/kfS28S8dYN2Xc6gVPLT3/E45nEI
 GSyKCyozsqWWY2MXr9Os41x1uHpLt8FwJNVeK59PDpLgN8T8WA5xu8+yZb8ruWN/l17P4JVY2bn
 rETJohsWS9ZsLH5TrMpnom8ZPJxarKuidasjAO7qj9AJdINlPq811Ar66vsxmljthHlijrYr8ay
 5mtdGByczew4a/cR0yA3v/i0=
X-Received: by 2002:a17:903:2290:b0:243:3c4:ccaa with SMTP id
 d9443c01a7336-2430d0d4d45mr18426375ad.19.1755045420809; 
 Tue, 12 Aug 2025 17:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF98zX42RSwWdppbMzosqG0TdHr9UoXTpkldnh54KBhgrVV7+MPU1d8WuN43VIfE3fGM3u3QA==
X-Received: by 2002:a17:903:2290:b0:243:3c4:ccaa with SMTP id
 d9443c01a7336-2430d0d4d45mr18426035ad.19.1755045420387; 
 Tue, 12 Aug 2025 17:37:00 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 17:36:59 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:30 -0700
Subject: [PATCH v7 01/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-1-ce7a1a774803@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689bde2e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: OiNxFAlG-GX_iNhoS6_LO-2SKLjSzNYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX3AUqUlbMLSID
 C/mNRV+p4XfM5Da0fqR5BL32+sYWiX4NU5mTkgnF5t9sHhs75KbFxaEhLKR74pSVwmej3KLjQkS
 T/KyHUfc3rMXO4s8qAmYydbzSYz+XUGEdouHx16P5n4owp18ldSq9mhOpGnwr5uxzVaE6ztzt7Y
 8DPlrmqOkww71RW9xA78RJ/8hmMm8UTPfsjbPL4NPDUbl2JhuQ79vpO7+G+lPLtjFHwGhLJUoGj
 +rJ1NYksoJ9t50wHbLbibq2T1Zx06S32vBvI0GDVsAylrVWiCcbiwaMMyaA4O3vDjGWHDIMm+kf
 TUQClcOsUbh3YuEUHlhuno2JoJaSYZ2r0QR5VpjD81iWhtJlVQlor+KYX88yNQxi4gPO2BXn/sw
 QuaHm6k7
X-Proofpoint-GUID: OiNxFAlG-GX_iNhoS6_LO-2SKLjSzNYC
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

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 944f913f8592..e47a68d337b4 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -889,7 +889,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

