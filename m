Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFAEB5099D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 02:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881AE10E291;
	Wed, 10 Sep 2025 00:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCVqCmA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3827A10E288
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HgNMv003647
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=; b=VCVqCmA8LvzaKotB
 Rx5VH0HyTtER9gxW8+rfTKV8Vhide5TTImYb2eJrVZybrk5g0Ab88G3L6VIbXb5p
 vE6byxfDUybcZSRxNzXYLBqqzwq0JSVTEA0+q/1hB2CGmrS4phl6XjLjKEoNOQBA
 wmkOeILxqY2ZEnYkqy25toXvVDEvOfRyAFynqSUGBzvrYUJkjHYL82IQfbgw361D
 A9f+UAImCIJE1ne1BTgRplOk8YvZ4TukxdNhW2yw7eUOLR/Ca3seStKo3TCEibkf
 xS+wvu6V5p7jMhewLGVEVmGXJuTxMiMny64/3+DdM+NI/9AghnOTPlc1eNZMiFqd
 nMhL3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapjag9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-329ccb59ef6so7158114a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 17:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757463081; x=1758067881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=;
 b=gU7sY9YYm8ajm94csgQjwgUTs67Zi6UuvCU7KJITS8Kw3sZA1c0FW+ipfiE4sZjwym
 FwDH8k2P0w282TptNDB/Moqr6poka6+XtihpafGGk0tbtVSuGpsOqyoitiO/1P4Ol1A7
 KA+4tKZqSNB0rZBZVqMUxBiEG8B8J4qB2wclNelxAVUDkQiGyo9g9WXUUVMRdaq+OB9X
 ZJ/3VwwyXGqXiS8DNMk84+cGcM50hOh2uNw+Je8fo3/Sd5PBFaOPE60hO2UMItF5Eh8c
 zwZ9q0zu2AEpeYtCZAUaTf9Kr6736dn8iLcUjUXvhuin13gwtTUdL/D9BBTAmvavS5Ex
 nPfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGzxt0NHAWG9R9vZIbCEm4e4pVtzwtpc+JP7cmqjqpgL1sI8lyRsiTCI4LaTroGFlwq/2mDKpSHj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2SB9JM5HM3x263rjHX9lGQm5YD1o36iE7A/NyyjI+paLBsARS
 k8lxpr8xnITnCNTomXE0G+xmdJLfUJS/t9XS0jTIXnnM4zlm0uTRy2IZm+VvyCJ8zOvYT2SGVyt
 wtthdnAyBm1xc+obwKN5TLKNG1u1ntxQLM0ZP5nUe3gS6VfB6jPXeQKD79GbFdxCAGn+2xZck/l
 oZdkpf
X-Gm-Gg: ASbGncvKvoQUviEOaIDGpeUWJt4gEQbaH2+KKc5STVIpRCPLJAs+HncCzYNnT7AIjbZ
 njPgdTTgrKxCMqR2PP0qm/ZhR9OPere/POE0bmoAKKGKsmGAuQ58PgWPtb4of648StlrbKmIUWa
 WM3dt2w7NTVvNqJ56koyOssxCNA5xzkaGHMy1Gmx/A/4o2hHrn96kFmE/lXbcoNwNmTor1keljm
 b/MpTYK85A7aZUPbbdTQ/DLpMNpcidNTuUaJ1wVr4m7FLddroaIUWs6CvMyabBFX3NpDloq10m7
 O9cGKJmF0JDEGUrnUzUCVlxCK0K8jIXEbOgOhXFKy0gcTML0zNB6MM4Ee3koza+rs3mmfAVPcqI
 rIpig/4agr+JR+njdvNiwfho=
X-Received: by 2002:a17:90b:384a:b0:327:c417:fec with SMTP id
 98e67ed59e1d1-32d43f1780amr21188035a91.15.1757463081468; 
 Tue, 09 Sep 2025 17:11:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPpB0vwyPXFQbNkrO3QbiG84lkfE6zB7czKy4X83WNMEMJNSWAA5xUsqNEV9v/dfKVZkRwvw==
X-Received: by 2002:a17:90b:384a:b0:327:c417:fec with SMTP id
 98e67ed59e1d1-32d43f1780amr21187999a91.15.1757463081017; 
 Tue, 09 Sep 2025 17:11:21 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 17:11:20 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:05 -0700
Subject: [PATCH v10 03/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-3-20b17855ef31@oss.qualcomm.com>
References: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
In-Reply-To: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c0c22b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: zfLdDg3MdJ5w5c2UJypU-u4YBY4txO3p
X-Proofpoint-ORIG-GUID: zfLdDg3MdJ5w5c2UJypU-u4YBY4txO3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX+Ymh8sx8+Cup
 AJ4agKiX4JlF3Ke2seCADzRjN3hPNnOgb9lD3+4ZUOEEdMxNnti+ZEBmWVPcHCXjWBFz9WmGxwM
 oTyQZ3GV2UC6+3gZqOa78rAaW536kdlcqfR+pQv2jI+xHNMSZ6MmhkHVyzkSEABpiQRp+Alh94O
 vqA2jnZHZgGEkSVoReSzB+maWhRxJq77OimzdyAmm7xAwsjIDu1JZ03FGeGRB8HtQlnNtxVGV4K
 G6aLYClIvmJ8bjQFMwEQuHt7Q+aH1hlcjwqEpQf/K5HC0ZSzUsBPRZxBSu/GFoyEoGs3vqef3CS
 w2gy4HCsumeWVjkXbotW4FOBPtNQn7HeWosTTJeY9uVZ7YhAht5A6rUQcpAPJkWRsVjh737636G
 sYDr+HDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

