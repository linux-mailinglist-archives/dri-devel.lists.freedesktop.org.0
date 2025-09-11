Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CBDB52729
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 05:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88E810EA0E;
	Thu, 11 Sep 2025 03:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O88QfUT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F9A10EA07
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J33j000689
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=; b=O88QfUT9GmAis5Ps
 Rd3Etve6sOMnGsOB1PoKeD8JHjerLUfP2tnBbArzZBPIyEuWUNXDvA90enzHZYIM
 jMDje6iPstBEmlMOQI0rDe8TGPMgSQ66X/hLrnByK0zob7QCeJHlUHP9PVPKnzPa
 RcC3Kvr248vdGcBYGqIDecQvOTyole3a9jungNRYUt4VFw+5F8QTQ82+JovIV5pY
 Q35cY677ctHy0L3+qubkkYTiZmCVZGMj9qJzY3hk0rLj6eOLDtL7r96VEgfcCR7M
 NMOtOdB5Fw0DLtcxbWyCJXKdIZuppx/BaG4rEIlxKmTIeUcbY8MEURsYwd/HohAH
 F8hwkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb1nks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24ced7cfa07so3043435ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757562089; x=1758166889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=;
 b=FcFSeckQTyO57VoVEVo7WlM5uZnyC6NVSB6AdNjU+OS98B9FuUzxEWY6Ys+IC9rJHJ
 RtjJyA0p/q5ukaXg/+tfec9oj9sP0LYhdDeZNQSae4CXQXecIHWDEasikOK7eGZBqql6
 OlgMHPprKLZV9pw3YwUfZQq6AmP4+ZJZDR4V4AYC1AKwISaBBrPBd4QUc0m4hDj38TQX
 HryVAiflOO/eFO/n7bx3tLOS1WmssgXcYJ+y1mXcT9arUHXQILBbTXPvq88b4HZhZfzi
 uul7v6cInUI85Er+QUlsXLFBAOFrWxA4+JzwwBKka2nEdDqNbaFRnn84qYbUDiPh+/Y4
 QLTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB0ntSU97dGH6HlF9IzG10ctzDlHyI6lmrCwNn32uyLl/bL7PT683Q9VJCI/H52BsEVx2fWOV7gTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1pvkyuiqJuwdSj1Aa7/y79nZCQC8RMQZStm2qA6C7PMUxlT1Z
 pEtkzz8Y1yK2lUtXxy53k/nhw7F7jWetPrGZGKnWRqBZRTdlGNtiK/G1LebDPKCcF4i9o0I7Jgv
 mZ7rHBc1F3sfzVNpdaua7frJSXSt96vhtNM5IB+j1PP2NAUTQXAvrIP5gtfKMPOMNLvfjWw==
X-Gm-Gg: ASbGnct8i+L2vLKj34nvqHBsiltmrZwoGRVY0QLRSC6JhBgDAfp38WS9vEZjnZ8g9J9
 kqbcKadL3w1H8OW3G7JjrmYCOY0cog3w7XrFexhgZmxlsrRdUfSlQjfU66NPjCwFWbn60+lNqvN
 FZCG/GPQPZDAs+G4fkXH4WvQvuIBiKXtEXJ5ETWbneCoawBPM2IbBhTWGGjxVW7+kh+8F97+6Nd
 jHLPortPtg1ZpoDSsesgEMdb6LbeA+pwr7JhyzKIKLbkN7FFFH3AzhSo1yFUl7TwBwgYNW5Vo3o
 Ngqjohwl8nAi62mpzKBp1hoowS9kb1Z8AaqXzwEfEcBRMOXNU75IA5qUnJq1pckRZW2DV5jTP/a
 9MWRTEEunpBeTLYhMB5peZdI=
X-Received: by 2002:a17:903:2b04:b0:24e:13f6:22d with SMTP id
 d9443c01a7336-251722929d4mr290434635ad.36.1757562088992; 
 Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKhpZZ7QQ2u4bajGkkm1KKWLUYyswJaL/iiPppE3MndRE8NjcBrWi4HRB5LTZP40i4NipFKg==
X-Received: by 2002:a17:903:2b04:b0:24e:13f6:22d with SMTP id
 d9443c01a7336-251722929d4mr290434315ad.36.1757562088589; 
 Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 20:41:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:16 -0700
Subject: [PATCH v11 03/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-3-520e867b3d74@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfX0eH2EWmnl0ob
 Aha0vj5YRyx59MtqTg/Uwq4I8GIBHxsOD6ZXVTw9AynTAa7A+A5XzpNC3nuTwoeHAtLnIUdqBYD
 3sI9j07BSFxwODwzgvU7nhl/Pty8MgwbLcywAVbElbvPzSHy2Y38sZgTdoQ64+uqe6gBaN6WdAs
 Di6ieIm1Ez0sMo/ELlUWiW6CqIE004LUscdkrc7WWZqy+Ll2uuy+GA/M7/TwSy2mzJgBRViSBRA
 DmWPC2AOpIuhQDaomIgSIsdwzBO4a168IGZyAaeYBpW2PhBZnh6Rr/DLpXDTCjYNKf3t3pIp4VS
 p53EXjPHF2JtWKJp7PG1+DPCKLk5HwU1xubMwhIapUDt9Hrs8jCp8BSpxyLhAAirf4Fk/QSwGzW
 /p2pE96d
X-Proofpoint-ORIG-GUID: 3f3hhL4NKwyPAeX5oSh_0GkBKUuJZtO6
X-Proofpoint-GUID: 3f3hhL4NKwyPAeX5oSh_0GkBKUuJZtO6
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c244ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150
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
index 807317d7b3c5..9fa042d80622 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -926,7 +926,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

