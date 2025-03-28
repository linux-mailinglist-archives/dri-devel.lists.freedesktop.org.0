Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E8A7426B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048C710E96A;
	Fri, 28 Mar 2025 02:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsCoTPVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1FF10E968
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REuc0Q023075
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Sjobw0Qvu+HD2r6/N5ib6f1zTdWIPLIs8HbgKzd8qfw=; b=MsCoTPVmUHmW0pVm
 5dAQq56G9qxHbB6CphNSZkK+5GifZp4Uyp9Y27F7gyixsjEbFOACY5MIUZkHqO+A
 IwM4fw3Fy84wuHeZK9RD4gyigIG2TAuqzTOGCAy8BASqxLyVUJyPTMp9qAJq+V/l
 5ZP9Y41xIhtlC+tL1KnLupGLKpFA7gG1KEi0/tqdDdVU8cX0jrhRSAclmUIWhtAk
 CpWepYh7lGxa77g9a9EaQOGuWqpkH8z5xh2mJJyQ2kHdkZ6HWg+DMjtgnd5aM4AT
 LGNlCkWpV4ocWVGkiOnEuJ8VLNtnwcZX9oAlu+d1+Me89YsvZg4tpy/1vpaMsFPg
 HC9BWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mxp2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff7cf599beso2991764a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743130100; x=1743734900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sjobw0Qvu+HD2r6/N5ib6f1zTdWIPLIs8HbgKzd8qfw=;
 b=ePR2pfLh3UQ0Wr0mLPuf8RtvIf1Evv9kSy4ScNqYWw+W5G7T1CI2DDHgKrYDvD7ah1
 vxE/xPArhz6zCtD8wBhzb6g3YTyDLht1WjEaJvHrdOzX9OgAvbnKCOWMKrQFkkxZrlEh
 niSpu/pwxhZRjrTUsUOFfMYmUZmeOFAIGk7eCD83hjtHu8cY7FtVMX+ZtHVh+IWAvM9o
 umatK8siA9uJbQlj6Fu6AD/Nf68LN3Urvnbzgp2K+W7V2507/0yhxUukrLMewt5/vPX7
 8Oyo8W0UyD143tcAhjlEP+9SqpUm0aCTD2BpsgO8wEznXmtC3PHDCYbChEFI2NksVSzT
 CXsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRBcnTrgIOS0qoVlq81NY0YqGx7cpGMqYDL8ZDQGTytZUL8w2YbaawNcBGkeFagJrN0rlrU5KPA4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUSnNrlxGLKRBMj6mETkE4rJiyw+zAA6LZOTJf0UC6VNqHls0a
 9v9knT313hOAfk3SkatGr+QsX5KUAgVd117UQB/pgtuRTbSbZHzsiOV+CoQO2N8tQhbt+srZ9lI
 jBQEyIRZ+0EuBr4dqAnX98n7VyQT8GICfd58DQavUNl/fUUucQiUAcV1qx41HAqXGYw==
X-Gm-Gg: ASbGncviVpc79YK/tvd6vj87RB9mcf9dMrR4+YHjV8kVhlTQwsVHFS8beBzzIV/3tAQ
 WGoVqtwyafFjo/MM5yiypgWA2aib2+GPIYq2vOcetajFSxKd5SSZq2eAfxt5U672TTSmLF+f/rl
 ssCEKBFHHScR7YGBDiHFrfYU/Qvuk+xDnrRc3S4de++MwUftVBZ7f4ZTgYw8vr3XG3syCCPnXRI
 7J47eFxeuTU5xD476djPaOX04bM3UzTGMP0IqsUKK9tRviUpu2/+5B3asFry8Achw7NwkIlAvTz
 tPM6YW9FesWsQT9zT6JlxUHPNamIVYM/PgrpfJ4FkZGsRftWmi+T3al2ajgCXaIURfMpUbIkEZE
 =
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-303a7d6a7ffmr9395588a91.10.1743130099768; 
 Thu, 27 Mar 2025 19:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfuggGkq4jSTgbcoTzgRuHjPVKkGNdwncF5LgoWm+8c97edaKwNQFJPvOaF357TftOkkfmkw==
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-303a7d6a7ffmr9395547a91.10.1743130099182; 
 Thu, 27 Mar 2025 19:48:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 19:48:18 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:23 -0700
Subject: [PATCH v3 01/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-1-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e60df5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0HhBk8_K_-Xq5A8yc5lZERJ5GM5t2kV_
X-Proofpoint-ORIG-GUID: 0HhBk8_K_-Xq5A8yc5lZERJ5GM5t2kV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017
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

