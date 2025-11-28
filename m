Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486AC90DCD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 06:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1CA10E0BB;
	Fri, 28 Nov 2025 05:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNyAr8uO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUGjuSgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B819A10E0BB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS53kWC2698757
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=44twYS2j8pu
 ef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=; b=bNyAr8uO7bts12AzHYKQ8z/cNfl
 z5T6xsO4+YmfTg/HZ0048u/vEk73rflpzjqeyZ9vX4XHSYlnJlZJqgEYCsBGlT7e
 XSbbqLcZb2FtKVTfef8U02Z3eaIoSfagEUpK3OV7q0t3uE7x33/jEfxU+4IIGcpp
 3ymZe5MPTx+Q5lZYaNWNM9B94tnt1U26IazZmrUs3neMe04OEi+E5Hk8dvGeO6p4
 dWIGorrhRF7bvnW0mAY5TT7fq+0Ho+g5rzpkPO26Q+JMjYXUmUyofzwF3sA1odcB
 aOrSj6dc+5u/9e9VQ/xCkZJFgl5TzWeFvlWY+6PbuOFoQ2tQpQRIfoIE+4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58ug051-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:05:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297fbfb4e53so23051335ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 21:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764306347; x=1764911147;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
 b=MUGjuSgrc8Kr4mqEJgtveu7jKV9eylRiDtCzBX08MQL1Kk//vek6gvKQ69aTIc3E8Y
 Lr1ElFBRtTd/wcS/0QHmAZC+nzFlsfydQElcx9cuE8W+ACpKlU4UBH7jlQ9SnZzbmQlY
 d0iFzo314dsFqOVjWbeSffOhp8aQ4bTICOZqPXYrQ5ONPJ3/tq7FmbkTUMmZKy977n4z
 70jRRTpR1LPYhe7+8FMD2csmja3A4k6r5+QCPJOv727dGgHn9r/i5byKM4npB6VJ3YQ0
 +M0j/f+zfbr6V17TEv7d+0tN39bLX8ktoV0lIWgoNzCxwLquP4X6TMqWvwos7G9xgsV7
 P9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764306347; x=1764911147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
 b=nFd5km7/MwdlmLZDw+Loakdhod5KuU3rTyOQMRhg4u78tonCuqaCjzEEH7wxrm2a+t
 0vL7oUZbJ1qZolOyssraXhfuuZq8Hf5rwl4UNBBL2zWIMIwQKTk0v0kVZr4zgOi/aqs9
 t2oNjIxniGz2aEC+dUcfMejP9epeuLo7HaJTrQ70Q6XkeuMHXosvxUehzpTbuuperVtK
 nUto3yRqQINBBGNIwu7wk1IjjktHcu01zugzP3mQTFNC3hRb2wy0a/g9QflaQZdyLoqo
 UzK2nqSv+2t76V+4sjVXkX/hQ3mtijB8XMZ4y4ZOQe9GUjObMRqa2wPGsBzOlXUjTegJ
 C4+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGYET0ikEGvCkd5jP2ZdPj/oKJ5SvJHK5Gu//iseGJ2vlWMr0r3GxskANLqaxEhxedaMERMmuuTj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxctCVEMSBAdn7FoRJrxBb2pA5UsDHCazLJMe75COq91QQuhcug
 iubdG7sCs8w8PexlU6KyRU5xvP+rtBrG4OoE4rnZfME9Jnm6fCOm2BoSU1yzQkYbuJJ6Hu53rg3
 yA88VNdCPLiR0traOH4WM9X2LQ4GEJrCUIsX/hMRiXdXK5B30NGYPU3iorERqaz4/a/d6mAg=
X-Gm-Gg: ASbGncsOkH8uQysI0oiOYb91WvFwZMnjEptW0c0uQmZZ6s/kOXdHL7Q2MULLLEnPhTE
 PBkc/Sz8obqyUWEdLk+sb8KaIevnv0VAVhcy/fz4rLjlKnuhF4ltzCzcCIznfRwIgfPKfzx0/5v
 K8dFjiJXO9By21C/XrMOtNoIUJjsVRb58TEfuTFsC4jG88M5rmxMJezw0U+P3Bt07QcO5qqWT8p
 cAd4g5iLFGSThAfREDdOzxb40eCeByZydNZSEjvF/9edv4T06YMxmlnYe/9oBo14XEtkuRM/jDL
 BLOyjOKifB8KGaDL/y0rdrqIbHijNXw4IDaIv9cC/5e+oTUC91Rx0X2BOaefozYgrrTuweX4pm8
 QgzmL9CfQ3MxrKgyIVI6D8AOecAosAMQChw32KQiGyw==
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id
 d9443c01a7336-29bab30b2c3mr152791215ad.61.1764306346586; 
 Thu, 27 Nov 2025 21:05:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5vU/dXx4v3KW0plfFY8OrOYCD0CU/vAR1V5h3oXplPI2SFfGWsGEiYMb5j54hJMtNg3yK0w==
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id
 d9443c01a7336-29bab30b2c3mr152790925ad.61.1764306346126; 
 Thu, 27 Nov 2025 21:05:46 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 21:05:45 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
Date: Fri, 28 Nov 2025 10:35:32 +0530
Message-Id: <20251128050534.437755-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7Z8OxClc_9Tdia4yg57NX-t8Vi9a0iyF
X-Authority-Analysis: v=2.4 cv=UKvQ3Sfy c=1 sm=1 tr=0 ts=69292dab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mhgHPu3uRlbtNExDwEMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNCBTYWx0ZWRfX9vzg8IIKkfY6
 sBB2RjZek9hgvBzuaZRgOGDaVaQoHdOmw2fpHS+rH+qCbERFOKfqkWeTiZh+dKyTLInnanPpivr
 amLMEwjUBPpC8DSmqe0asAwZ9zrPrBFnl3av3E/S+ELGf21iQD43CnyBo4cPQltoefGT/kTAxD+
 nCfM5aPjySQIUN301gVJlOrGf+iZU9cXDGaHOPtme1uEfDcyAgfeOKCZuC33ORal5LZlgi53sR1
 tc7XiXcAdiOQs9EvrvI2nzpTOvIBN+oCNdxxQolBBAVhmPGTVdTsCIcyfx5ohdxfSMMrqH0a9NT
 wWc4idwL7iZg+pdOWqvTZvZtW9dKzvh3UMCre+qCZcOdE5Lquq4LfglVci6an3PHQakWV+YfYtT
 PukFORTZR29z0su5QilD2bqEmBcl2w==
X-Proofpoint-ORIG-GUID: 7Z8OxClc_9Tdia4yg57NX-t8Vi9a0iyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280034
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

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 679cd8997a00..f7fb44a8e9c0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/bitfield.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -37,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK GENMASK(11, 4)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1

