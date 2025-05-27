Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E28AC48B6
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637AD10E3E8;
	Tue, 27 May 2025 06:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XffPuxZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411C810E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QMUGtQ016126
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=; b=XffPuxZXV5ikZ74Y
 FE0lmCxHjo5s/ON9M906LHyjYA91qSos6chagS5LD9bgRB62zl3yWYtEcImewnz/
 S4wlFc/vLAnvfOVapph/himlXO/RPYFV4xg00rsR8xX9nFAK0yA6u6jCNKdwkYbX
 Yhp7AR3r/ijo4s7UNRRWSiCTi92E1iNwcAVtTgC9k6o4fseGGBVXhggt43xCn2or
 xrg2hSAQBwBmWXkJ4SwxkLqUF51hEJ4m9k7nQ4EnhpP9vQrrKYJGaGmCASfVmume
 QaHERKsVyXxFNQVJW49QLABQFu4wlSb2Z2w4MjHj4SyBZO5RV2JVtudl5MY1K5Le
 UqcMog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5p0q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7394772635dso2079676b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 23:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748329037; x=1748933837;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=;
 b=gwBWWqiwHNbECroJsVobOZW9h7RkbUWZ3zr0hV0sI8hqm0fqZ4a+Sjs1/R/L5TG/27
 aM0+Nh3GfYpGdnVrB3fs8Pg8q0CZNW6pem2veLbwegDoC5C+2SMOKpL0VKmUAtEnE4jw
 UVjH2iB2gkmTsw4gxdvI9+PliPoyt8ksFDANN9BvHaYxU07E19pbrT5BDg1JkhomI6+b
 591ko4XyEiopAgq6nmKDvuFMvvDJEgNHccidL4CqrTxQiLWY5U2s6sOYotQVJ94lmCWL
 U895K95RVhGXL26FkUx5cXQv/EFhV5BZQl2ntxYmxZH7My43EcZ15NfzKfYIww+iCinL
 3enw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyA+B29cRHEs0TNZbCoafhBCGFBaESqHxQu5oVn+2c17tZu/b1thnECUezxUjlWpRWgyx5ADxeOUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoG4t4bArhV8sSaiJNtxx2PRlj4ikqSzzrWNocGD1Qccle1ktY
 0BoMW/u3y2a+tn/9jBteOnhdPOk2TEJ5N0VCSaSS5FokkUrISAcgSkdkY9s22b9tLPq0AVy4VR/
 4TDo0TOSN9IU/HASiNpyi0nhn8EUeNsNN2TgrkYf6IadNWtJgKwe6/SrLnuUZmcWypOgEZA==
X-Gm-Gg: ASbGncsh7v5MhHa2G9yfgQGNS3ybmgZTDftXo/fFUF5qP//03eBzqPX23e7Junk0c1+
 iza5Ba26v6emzq3KmMcJO3fmLCYnHzv97EVtBOjYgF+OzXFZV2XmNx0roz1n/IwL8PzNdlK3MP/
 oznAR7Hs2we9CkS58Cz6ERTSV6Lx2riYTONOvWnhe9VxVtvMRjyff1EVNmsXGJSmxBYtWCxVQKx
 5Oxj0DiKKJau/a1ILW+VnyaN/lXqyJpuNzYGVyPpL7pGmSpxE4RVCWI+xyzQWJDo0ueBqlr0clH
 oUbKFPzPeThKQuOWUwsVsDHt8dZTzWO20tfZr6CDli56D5xEEsqi5Ro4XMCkciRWDghKL7M=
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id
 d2e1a72fcca58-745fe0589e6mr14944417b3a.22.1748329036970; 
 Mon, 26 May 2025 23:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuN5nvo50ha0rqfJNyLS1nF/5MRTlYqa+OqS281BYZkxySrFxKujXSx05vTLcA79D9Jnj30g==
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id
 d2e1a72fcca58-745fe0589e6mr14944391b3a.22.1748329036568; 
 Mon, 26 May 2025 23:57:16 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 23:57:15 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:46 -0700
Subject: [PATCH v5 01/12] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-1-024e3221b0b9@oss.qualcomm.com>
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
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6835624d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX8OHbrGTRX1Mx
 bY0SlVwZVjEBaaIFcGUBnI8lS2J5teGQbPenMyX/r3k6mbD/FlsB+TjEYqB/FUiiPztYFfVxs2l
 6YMmI7miDGO/R9Vro+0bjGtvAC48AxGNKiEVZc2Sj55rmRbN67cN56StS1RntzVO313u7l1LIzh
 +mFyLElYvyWrX1pPGWA51Ij5f5D3DuxJz3l98YZ2MfEybQW0f2G47kZuIua7RD3SZ0Pq+LREjRD
 g+/EYYbpa+ueSpwaYnBF/8vdrMCIuWNjdeJfxuqs0ZiDtKcBddmj5Vtg+lPegQOjJvNq1UPmfN0
 tZ0sg92Sc840vFa+e4Tt7XH5qo1eA4pOsUlwl2QYr1klTGTewmQqJsyyPgpJLS6Qdt21IX/uVbX
 Ri4it7RYmujVAHVF7diwNp9hbBCTZl4qVs2EB/K+Y9K4DVYeobwoIFAiHFwaDUTQUnKdnPbX
X-Proofpoint-GUID: ojmF9c08IF_jOsibctT31bjrwm9RIuqz
X-Proofpoint-ORIG-GUID: ojmF9c08IF_jOsibctT31bjrwm9RIuqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054
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
index acc7998758ad..133447f25065 100644
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

