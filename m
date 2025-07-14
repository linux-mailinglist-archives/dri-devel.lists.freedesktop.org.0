Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C98B033CC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 02:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD0510E1B9;
	Mon, 14 Jul 2025 00:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOO7aGet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2262910E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMq6D5017291
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=; b=kOO7aGetcaOOn6EB
 Dd7pX87VNVIXtpo/51n/LvG/uFmmmpkLbdVj7S/Y9a9ZhTOK4ld2Bjnjrzl6IUzq
 GmCpxnf/jviR9foVmIJj2CtNvPOOiyv5I36XiuGm5UuuwNghtWV/3KXpP+2bL4I8
 9nMzl2y+YLlDGgywqnKV+fkahjtIaZFOEt5tE8KTNMXuR35hlsBSYQ5t/yo04DrM
 IO7f6N8xUHnQZwZNzJ0ENlYTVkvLYObRtZuZ81+ifVBVv8G145g05Sy6wgiMBU2A
 5KkPqJx7znQLXJUtYZkC+7yKhEB8Nve9jrd704GrpVTfECzhUI1WfjdrDR8ucZpj
 o0+8qQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a1b3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234fedd3e51so35802545ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 17:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752454220; x=1753059020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=;
 b=SvPLBBJIcUDFm7f3J95UG0JSdtrByWVU3vjokcEXAjt3ijo9veUimdYaqY5ulVVIkX
 eULvTfs9Q/Z+S1izFn30MPFWGwdKJSxvexbkN9RlDYdnfBCODs4vkDfoddxcBqrKfpEG
 BJTxgZjZfdtg/VYSxJwybFvqdPBqiqLQH+TSbFEktyEV0eVkW0muVUubcENCROVkcXT0
 J7Byc9MKJ3hLzF3MdFMkzo2jycqceoN6FRR5E6Ww9V6gvIoLsvwzyERx7uyRNpE4Su2j
 tNy/y/Uk54Fd8/9+SOJVhqpB8tjGFnA7KYBMd32yQfl5WHOCyr1uSAE9KszTGvSEH6YK
 tAmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUqD9G6OIVu91JWHF72ptW7jA3n5fN/GjqCdQJrzGb58bewOszcE4bbSwPEpr/hzhxye/PsstF0jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0djEHgZI9HaABTkipM776FQAh477zeP8kp7ZiuxPnwS/zkIwb
 87LpiS43xhSdk+0hqm9bi4Ui3i6opBTgWHLOWu+xJeVIOn6vaLL3slYsGV7RH51uaqGLrx2Azjz
 orF5U8e04yHag5D5bJsxnw6RB1FqazFqmfh6PHjuDQ1w8PrFXVillvPHZSrvoiNbCwJKlEA==
X-Gm-Gg: ASbGncuCwjZ2KpYHcJAGQ1kAw8cvh4qMYTyE9H1RLhSk+r2Y76yjYdqaPUO/6ma5kxX
 eKTmslD8vnDPw9QTwmMOwXpB2rkKCfHQGorPVANNs8HUsgsrdYdDE1lpUtoqKKNBGQjItunBjZy
 gt4vujgzxLVrKEqiEnV77P4MIMwcFCGHRgdGyywnjk2ms98fjTSMpDfD8RskQQIF7AFABdTJmBX
 8AQ72xu8m7GbLa1TzvSx3n6C3kkaJ8B+gKuo3SJVB89katrRLVugEZlpCu65c7EXkAq47Qw5J+8
 IvNFtbPmrXF5yrfO+bxZlHckLXwr+jBq9v1iacypyRsmatSAgGTB3bmDMrQkGrJE5sGfdSELiRA
 u7R+qZBjq0aXzOCiI/63e1p4=
X-Received: by 2002:a17:902:ecc5:b0:229:1619:ab58 with SMTP id
 d9443c01a7336-23dee0d9ac3mr181151825ad.43.1752454219739; 
 Sun, 13 Jul 2025 17:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mJiuun06sM2rMzoQb2znJePjSbapMiG5DW5Qq5P5rJEhFEAxnwJjdWQYDnBpyFcOi0O4OQ==
X-Received: by 2002:a17:902:ecc5:b0:229:1619:ab58 with SMTP id
 d9443c01a7336-23dee0d9ac3mr181151455ad.43.1752454219307; 
 Sun, 13 Jul 2025 17:50:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 17:50:18 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:13 -0700
Subject: [PATCH v6 01/12] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-1-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: OI1d4S4zYp5bqOC-YkNUyZJOOIH2gWVQ
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=6874544c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: OI1d4S4zYp5bqOC-YkNUyZJOOIH2gWVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX1kn5MyAFvdVF
 veP+S0AXgigvep2LTg9ubB8nbkRqtQaSuL4dwiWjSjFv/kHyte0W66AJSYP5Qs+JZ2PsrbYBgTi
 kr1pxRNNK1zaCqYQ8/B3zMkYdqEMtgS8hhpJVfQ/Tj0t+oQFpvaMLd7QuAc9A7tMs/VyVpBYNHm
 XKShFj+ovZZGi+10SP1J5y1lZwUSpCUMi0e/MTN66nW8etdtpBnhNMzH4448U12KyOSsq+Y4e0Z
 3JhfKHKKnb6ByR6J5qIJrr1zPWboaCM9OU6lq68IUw0/VDqZpqdvaAyQHR/DSureBmw0YfEqO5K
 4bxvTkB8mak/5InR99jpTW0ORgdmK1Lv04ok5nhVo3Iwiwy1qs6AFOm8SsPhPRaAWhiDdhu37x+
 OKzKHOguhpaSRkJuUO8GWvk4krbF2aqVcJWJWgEiD19FC6Fr/cNXtXGY/0/2dzW5j6+BxSwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140002
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

