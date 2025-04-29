Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E42AA0261
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D2110E148;
	Tue, 29 Apr 2025 06:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVy0cjHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A34510E297
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqNgg012640
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=; b=CVy0cjHPv3Zr2qaf
 Y+ZYOFhfBxNo77Y4SZCjSzR70EWrwd5eMxTNdDvBq72VomkAOI9/s8nTVCqYl+vr
 GKO7tHkNDe08BEqDIFHqg+Jk2INqyc5v1jkuO6ozFw4NrdCC7hv0uuKFINMD6Sk+
 BV9//jH7cenb49NC7bQ21xqtanpg3zLjq705iiHC9GKOMA4XehXsy0pUW9cLreEu
 LNBiJe9dy0iS0gttCSqRcONQ363t6ZrHJYYB8vpo1XTbX/u/VJg+A/KSttpARnnX
 HiNEe8LAWySAkg+ygDmBRA3uldMTSyvvlP17vJ9RbmV3pwc4Rlf/gbB1lbS1EpaW
 J5RZCA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323cqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:06:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-73c205898aaso3895305b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906817; x=1746511617;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=;
 b=uSuP2QSsm5xXeWj0Vn/eomXTtcAABDX2XpIdItQJOo7E138l9ediRLhq1++cGkOtLu
 oUkdO7WjeHXM9CiRVl21azcizPhEpDBmb0otcJtZpUo9WKgu9uorjGrhO9v7GfYTycYb
 yecGcV7TDAgVdx20XAany+SiVl4hrUvy7W9uvTxbiaFKglVtGxzjuj5A7x2bPjXCsMgw
 K5hFPjMYcWtG1hZdmbiQpbsbFHpUzBK/mx9FnDrs1YKrKnDGcPSXaSzJQR+LONoKLYgT
 lv/vcOFX9od0WE9/HVtCZWKFj+B3lA89VUXSHVtz5ZlD7khf6cIQO028LRXqGWMcmjB7
 y2HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMuvoGMLrHZ74ZaNSIjCJydSO/H1DKwosW+8/2UJdWwPhom+L3NTuv4hhd5W0hWI9LmFcYWtd9EmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvZThaUZaFwuLtQVtNNerNgfyRyrUYyEHcVh/CqyUe+dFq0Dul
 PWArbNv/LZTW/s31Oc1Pcz+rucpFaiEMaxqFMNEvM55G8pzeGTFXgmoF36Ob+BRMLuICeuO+jBL
 blMC4on0zid7MVB1nakZaX0L6uI6EvPnfz2/n5mWuqjtvycxYhvQmAB6B22vT7Tz1Bw==
X-Gm-Gg: ASbGncvCutAsQdXEdMw1j4is2c3sfv60wHdjJCcxH4GYS/YtCXTvdfIH7A9eKtkTsYZ
 yyjph1e6MNxfbpLBeijMotBVkcLxC+HmgSzR4L1J186wxzhOtwiTnmrcrsusMVBD/MlO3B3PwhY
 jTM61YrgD9NIabZG/NrPv/AKORSmxHr7IjsOB+NVy9LiWa+8bLhA5xGhSA+/uttEHGgy4dkSLW4
 as0je445VMHo2CRN2HwnZ6SwGKw1E7dHDN7ObHCtYZCPzY3s3YmQr0ZeZU4F5m5CofITtRWI1O2
 7f5uAKe2NuhOIEVm+CqU1A7qTJOgPEPnFOpbYB9kXwT+NQOfDHPyQxeeJQ/OZnCzs0ct7dk=
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id
 d2e1a72fcca58-74029565221mr2187784b3a.22.1745906816677; 
 Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg07otcOVfNPJ8y+U5whY82XEhwy5M5k9eRX8C8wg/VMa0dKjj+wgL5TymAJ0tRCcizjOWNQ==
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id
 d2e1a72fcca58-74029565221mr2187751b3a.22.1745906816303; 
 Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:06:55 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:22 -0700
Subject: [PATCH v4 01/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-1-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=68106c82 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ALoltDAFltbbW_aMC6xPjF2eyNdhbEzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX7buhXEAq6qZm
 7HPfKFZ9rMs/1yyh/47CaCykuUZNGMaz7Vc75rNcK4FyzpDhBRT8oqWNYyVMntvfqj9w7kOPPFd
 ww1urkvhYwxwR+xj3LJHVSRzl9m/IZVbXqK/M4BP03uwk1WpugvPEKfUnIGRCkbmPKPc/6hNedF
 y6sVfOd3zEVE0vdUAw/SOTmH7VsPgB1JlO1J1Wn8DLlngFdElsQDUXsYcltvnIuJZpNbMP7Ba72
 Uw8xosBX7ahrsUKNaLR7x677gHbflfwGUzds6u4iGDx62q8BBaezojShKWS2IMNElQ++YMo8xHY
 mNEXemQ0j+zR0M239d65ek1cAyn7RN5GDBp9XgNaWz7ZDb7MUXDoBST/RoXXPZQL04XyxMU5DQv
 3I/MWLLSYjIruVyEZY8tN9SNKVtFbSNsHIFa4Smw7m/k2octwMb4F9e58HD9hhQU3B0dhpUI
X-Proofpoint-ORIG-GUID: ALoltDAFltbbW_aMC6xPjF2eyNdhbEzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044
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
index d113679b1e2d..24edce4cdbaa 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

