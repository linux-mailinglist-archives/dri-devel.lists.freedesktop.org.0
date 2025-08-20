Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA31B2E8BF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 01:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114C910E810;
	Wed, 20 Aug 2025 23:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+aSTJlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D4B10E80B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFCapU007320
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=; b=l+aSTJlpcqgFB47O
 XttTZfcw5KAmMiF4b6ifSUAAqIkzDy8gWM+qyIseFIQJsuRHF3Wp+hMQig1S/1V6
 tAjEOYDFxWdMbCD6fhpE6N/02Litm6JmFE5Tg4DOHz59S5216XsvTNcmCgrUQiOD
 qulZlIwmt7shhq7fD9btxdjYnsxEwk67PwI03fWFLWSYf8e9AFCHXj/6SHxyjvyi
 JsWVHGUIz1IfVHzbj49X15EQFPPyou+F5TGsiR1TH3jtMJXtP1tGhhAwH9CbMtBE
 aBJOFdc0kw+6kgQ0zqq1qZNnmrHkHDIkTFdMgPBu9pyuMt3qzxRJJQu6Zegw1JDP
 UawdiQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt89684-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32326e46a20so689420a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755733145; x=1756337945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=;
 b=CjpEp0OJ+oJbRPTmUEtjds132CtuC32ktthKv+8DBFCMcg1NaKxIyqxTeP8uafEHyi
 DlOkPN/rSI+en73f1EOL3dJYuZ9H7MF7nbi5AokNs8TQt5+VaXXhP4Qfu6QFedd4I3P4
 AB33ekSPNuQ4flcKAXDIxwGIXaGerWIHs1Ay/yq2th/Z1R2ztKWnYzzr+sWeUa12mMy3
 W2D3X/MbPD10TlRmhZr5qWBhKPFVUqTKQlqwsb+GTtqHCzQbJu9KtktCRcpvCU/cBlK+
 +9gnhSaFvCdQVU85+QCHjx+EU5hWcemRFFK7sqZzQa+5lfIX2hDKpZT0TSsC9oR9xdu6
 q6Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRon2DdEgkrgMTY8ywLpxvvAZUfuzD0U09igLEZ8IlO0B6ZAwcPbMX+voaHeEh5CKoYyyqIzcMbhQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBjp+qDkvST1GN01QVQqteRkPn4b5kgQjNfu77Xp6rT/qepdkI
 Ygm3jyDE0L8AFwmyPalBuFzxXiLeUqLMNiSSSt7sbNt37ySxnkq2kApypXOewTh+5GDH+oz18XM
 nqfUCqk1rX0xGvy8xsXCKOc3DFv2DlNYKXQ4aruT45iOfoR5nhe9aFyAslp1zPXacEL/Cv2d0O1
 ZnpgS5
X-Gm-Gg: ASbGncsXf5fVtP2wOcgKLih7wJosw0k/363PLOb4aam0kUwCca88F/SYQFzjPHfCJEX
 q0MJjskJH6C1ZZevDUdJyyJRaPs8riEOeKiQ1CLldmX5IEedzAVf9EPh9vTlrVBgoXBw12A15LH
 y83UxY5YupRMYYfibO6QC/g7OTvO4SUKkuxF6M8NCYvWu9S6tI0JUCjObsYepn5r5xnNiINtQVw
 VBf2FpccoKyXeGo1sO+NBmiNNXtzxLX8a7Q34qcjp2F6UmgbWZ0CM7GAUtdpsx+oLLqWs0zaLK6
 +G+mgUv70LppNpRwpB8rGWsSRNVQxuhBfqZHbMxPge3Cjlhj7u0t8Vr3EfJu1OZ9ewx0YsUmTmu
 cGnqQHS05r19hA/cL3IYo46w=
X-Received: by 2002:a17:90b:33c5:b0:31e:7410:a4d7 with SMTP id
 98e67ed59e1d1-324ed17a46amr814672a91.33.1755733144761; 
 Wed, 20 Aug 2025 16:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXK18UdIY44KcNM7aaFlARIr1CMW3Y1H8zVdLrdvIntoDG55CLQtOdtAX1cQDdnrcWsR0qBw==
X-Received: by 2002:a17:90b:33c5:b0:31e:7410:a4d7 with SMTP id
 98e67ed59e1d1-324ed17a46amr814631a91.33.1755733144241; 
 Wed, 20 Aug 2025 16:39:04 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 16:39:03 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:48 -0700
Subject: [PATCH v8 01/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-1-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX/mJwPUWytNYl
 5RIvMoCrDRxyHJlql2zGRMmxbEaPokN893EW/EdBvvM/rZeHaS3OeFXGQUhBJw2vOg4/OejHDux
 8WP1ZJlHmelUvE7oEh0Arbk9oPYByWzGzwOYuDJWdX8lRU02wNotoUDYZGrePjIRZx5yvhIsoPS
 4N+MhmlaqtlmTH0Fzm8DK/Ilvw1KEcU7hnOjy9v+qMYkvH0DWqZEvK1JGZkfVijtaRg+a3m8Xbb
 dWzF6GhPiFVc181COGl61gVD0WQ3YS3naF1xi3xExqtRJftZ6IEmgzsVTOET5f+vmNhKfkxDRPR
 wzYTPmhptAIkY1CV02boGm5G4oO/7QE3hMLYJJyUFPI4nloHio9F3pJLQJd5d26m033ZWHfThdR
 9yDOOmeuL0S8wYb5TupiCCG+shyWew==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a65c9a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: a39ubI03foI1Dz_n0BFH3pjI9IJrZTu2
X-Proofpoint-ORIG-GUID: a39ubI03foI1Dz_n0BFH3pjI9IJrZTu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
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

