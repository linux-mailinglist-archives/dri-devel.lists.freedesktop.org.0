Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37896B3F3E0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34810E191;
	Tue,  2 Sep 2025 04:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqOKYmKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A46810E191
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:56:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5DI010333
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 04:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=; b=QqOKYmKe0XQ+cJer
 S7yxq/GR/a8nz2SpXqpPS7AHVNwRYITkRQoGmkfvB/adUqPOkFq+yQCKXN/giXly
 8ExalnQXrlVApG7T/ZJ+3YQl9jeCmpe0EEx4pUZkjk9uAIexpTBlq2IW05Ld27GU
 7GEHAfKwBSnzfaOd0hofr9x7tam5xHVceVvAaEBO/aDzXc/QxR7qkLjQkYCrv1cu
 wd6xto8mmM1dLy9UV9y+ZNpS7meuP5zX2gKpulzdYyXWAsz4UQLPl+f+bFRIiJtF
 QnVcOIAXlZwX5QpuYE+a04Od7X/cexzX/sN94rYVgs+HNDv4IB7+bauLgSw1OnIv
 +Htl1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjehnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:56:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24a9de13b7eso26547095ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 21:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756788973; x=1757393773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=;
 b=nfbuGYmVsmjPgUPtXtj3fFmzf9SWQVEYKILhlFn8kMgxlI5m29OeRLnheQl5eRsOwW
 MwfS2Ob8WT9rmwkJKplcgdtdOlJbj3VHTPKnPixhm+fJn9bFhNvzp5qxpUFJ3s8aDI6m
 s0C/KmRka5DsrOiO63CcZKb4bf9HAwDRDofscwsIhl6jQvVXpAum0F+8tKE/LfX3g29k
 +bzDjdnglF+eCTjumHAyyDkKPAN4ShS92VvhGzjiUeaofcP8qfk6tNua8qAJ82ebdIVm
 uFLIl/Pc/dBrvr7lkXh2ojaaHCE9SlV9a10I9iafln0UdeOO4gEYBG20k11KrUnXgPxz
 0bYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg/GK3dC/pSJLUnNfGAYg6t7YbSCOM/B9e/4OGoVpJDZDwNS82eNXpzwKHoXQ0KGmdfKQUjAnbIDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy13kn3B1sOVK6Z8eIKUbmYTxNdhYja/daA6eXH0zHh2ZZJ9pRQ
 FFb7zGwwLE6XkvE4bvePhqTAMyyhIZpGAmkcqJDiA5JdOKqnQNdOILyyD7NH9GiLp5Pl/A9Px5J
 KjzMlfFs9QXXKjd8CAv48aNFro5a5E7i7p8tQ20clLG2O7QZP0BnwqtsOrfDZ3ALlu1CoPg==
X-Gm-Gg: ASbGncu+Uh0ut6NVaTm2t40SXpMGou2fJcLjsC3anzjtzrI5TgmqBDHGny5bC46NiDs
 HQEUTpBhpN39W51cKbmyC9Us5dY8uwTqhCoEHw5+zEiSexQiSkYSlkEpppfb90TYcmG0iOvAHK6
 oj1rFp/U2zPAUKCwbQ7gXt7LQriLAa87/qCfFlTw5u6Qio4AWiT+E6zBlcWVyPJIbJdcBcyI55M
 Bzg+3zrN5nuVOQ9zRsK17Q/A6BkMGDfcs3W9CzGlx30z5IbwNSlUM+bs6reSsp3t1tMvneW7xmH
 PH7mA4p6Cm2VracyVvTNuj2gJDOPpP8dIAcCtuQMH2k9tANTwJls0j1/iHHP1U+AVqxpt7WxtUz
 v/hzuWOeWV1w1F0MfYP2SX6g=
X-Received: by 2002:a17:903:384b:b0:245:f7f3:6760 with SMTP id
 d9443c01a7336-24944b20cbdmr121474745ad.55.1756788972835; 
 Mon, 01 Sep 2025 21:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvJn27s/WB6VKXSdt4GGDpr0OsZic3u0pMEKyv76QDPWFnyOWUl96Fri/gUJz77+TBs2FX6w==
X-Received: by 2002:a17:903:384b:b0:245:f7f3:6760 with SMTP id
 d9443c01a7336-24944b20cbdmr121474415ad.55.1756788972346; 
 Mon, 01 Sep 2025 21:56:12 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:56:11 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:48 -0700
Subject: [PATCH v9 01/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-1-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b678ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: EJRApualFsHHQIRJqYrKRQMioyd-Ov4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX1mb8BuG39Xo9
 A5TdAFfb6gwCXetToFwDqAjUOw2LTwqvpUpVsvbmLJ2/KWuuxBjUfcHXGennTn/vwScQ8hVVEhl
 ZMLOe0ibrXE8D4BZlN26VyaIykOFyr0yGM7S7jUjrEOemP/UELOpeqcndjla01nKpX1XwKsxXeP
 zMbsQdGzyfEUJtpEmYtoROejLZC+wNgYzenPebnjSGjHSRCFqbLyL1erNbyLDwgnLn4THRF9FCt
 PQdK22YgIlR9zfJDL4WA0NLCEIuiiYMmKT0X7mFrIZdZusxsVCvwY6vgO0Elrcj2MQTNzMYaopY
 lGNcXBoY7wM8l1u4h5qG7q4exWZW10eiV0dqmBIWF7xlw+aOtxKSroLSPx+Rmg8nuTlOtLVC5P+
 YX0+1RU7
X-Proofpoint-ORIG-GUID: EJRApualFsHHQIRJqYrKRQMioyd-Ov4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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
index dcd40c26a538..33091aa21be0 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -852,7 +852,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

