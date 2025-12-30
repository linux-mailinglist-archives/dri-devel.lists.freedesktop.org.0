Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFB3CE8C92
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 07:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4815C10E824;
	Tue, 30 Dec 2025 06:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o10Q6H+t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0L5YW3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AD610E824
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU3hcDp2546917
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=44twYS2j8pu
 ef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=; b=o10Q6H+tj4bFnL3VN+7vryazyuG
 DuLLblP/BNHZaUg5h4ItaM8YksQLg+POH5mcaFtbahNvfW7dsEJJZkC+3X+ihsDH
 UDBHjJelunByqbUJY6rfnL9kdhcEnkOHFBeZJLTMf3rSfsL4NdoTIB4HYGcaZKy+
 fL6LsFBxk++S9rf4b73kMAmlrbgsQIzBuZKqORU2dYWKGHctsQ+yYKcDevA6phfK
 XLCWwRj9/niTRTXq/LkK7okPUF+1bV+vYT6z9h5NBKDqjv9UWppC8hVT7AIhEhdW
 AtE/9miuioWRjLRZkGjPrXeuIOet1FO16iisfi8es5qXenByC9ozLlu/gRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7398a3t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:28:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34c704d5d15so19113052a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767076124; x=1767680924;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
 b=c0L5YW3E+u9158DX39kSZIDyZuigJBru11g54hSWvuCJZrHY/NiwksM2jkWrOxMTkv
 cy0Io/zRB4fHqm+1v4r+EnYLQKRCVVYQ1l8I/9NKB9/dzQ7yiOa6nBb1xjjM6yrWIuVx
 sm5Ifgm8tMEfyf3Qm9G8L/lo7v5gJpSkv5+pL8JgdxibzIs5HuK4DoH4LVT9Vb0H9PRt
 LT44YHcP/RtzIh2LdHj3xN/ZCUpFnmg+fPmYV4cGYTZjUYDf9j4JvEzrrKH+KrNytsHd
 2UdzZaU77yZRCdutaEIvRs+MiCtUOCkNXIVd7YCQ27I1t3k9ENWOaT2QTLoeBAdGiRfm
 g7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767076124; x=1767680924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
 b=MZ/EqrpOfO4bDrJ6OuJ0aXHEvzAttyRpiLSBgi8ZIXCJ3fr2oJm+mpY2Ta/34JbqGG
 6adOXrp+BsnUVVHAGIuPmo2qD4j59u1HT4in/H3CQbIQ9/CPwtmvPCj0/KaB7MFOqXak
 iTSF6u4rXhEVBQW9Acl6hikObV9qqliUvqGycfiQV65RNmTWkSF3br4VFqxmTeVZL9Jh
 +5ez+X+DuPOQDDWo4mvSV245IidlCCath5IVgPUHVwAPUCx6pr6hvdprz9wmayOM2J2i
 G73++c6P0I6+LCjjD774veZe+CsKlA3m8Q5twP6cGKfwFGjZk5txn7TiCjPtMvq546G0
 mswQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPivbsMhvXkx47NSQ1qJTAlBHzIeOeRjdxEh1mirCnkKMp1FU2mIj5ZV0Y7KFHHgUGGPyGtpYfr6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJkQnRt1DKJbWsZWxdd2U7T6G6m/dM5t/DYF93k2h4iwtlPr9r
 tpbD83O2t1zM6kcnngYiU/gBCbDWDA4tr4OLOAcokzcLa761d8uEjc3WYp+gq39sCezEhi9w1Kw
 ENOEscPd4gaKcPn+9vQPFUfIwJ6LDer8mJRQrALaIo4BL9w/BYue4hUPZIuGfGmwT1UBuCxo=
X-Gm-Gg: AY/fxX4dCOBKPWaqh81xtENdCNsCpmMXQY2h949V4eqD31RL1ZHGvSkYzXamPqNppvX
 kOzqmQZV7QePBnsjk4ZXGgj+5BF/8VoTe8D4zSVQQsch8Z8N7P7felIb8dBkUBIWJYctDF9vpkJ
 19elC4oS+/GXwsivRdFgBwYzguazIN+tOVJ51MCKy+zgdTcu7yLcPmePSsBL1rrBn24gaA0dvha
 k7FINJlyTYKaWNOjEUTXlnaYgXajLphcWiJ4nZaDsZq7c2L/pWmoyeyu+EDdezIoF8Q4mib24K0
 4+9olvB3F8n+hLtMnKD1bKUJE/+y/detKyZwxDFtsjm6QssRCNBPZLpF3m5sew4g1W6Rsw2tGcC
 MNS9EcCOQ2hkV9RFc84VmIfYVN4XjzksvGKJEqQFydA==
X-Received: by 2002:a05:6a20:4325:b0:34f:afaa:125b with SMTP id
 adf61e73a8af0-376a94cb491mr31113754637.50.1767076123574; 
 Mon, 29 Dec 2025 22:28:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa7a36ash2kDsGeHNgvuyMuFBc2a3MlePVxdjQtL2BMh0tEoB3pf2il6edj9DeU0uuo4hGVg==
X-Received: by 2002:a05:6a20:4325:b0:34f:afaa:125b with SMTP id
 adf61e73a8af0-376a94cb491mr31113731637.50.1767076123080; 
 Mon, 29 Dec 2025 22:28:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 22:28:42 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
Date: Tue, 30 Dec 2025 11:58:29 +0530
Message-Id: <20251230062831.1195116-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zEEj68qgBl0vltVK8jPm2YaFM5egjVXu
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=6953711c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mhgHPu3uRlbtNExDwEMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX3JKGEFLqo51D
 3ukRVDfKZcai/h0HAudCwiDv8dH4UyDUABccPYcjAeSMKKpxz57Osf6B8nImCyP97tRVlUGbgXo
 v7SH9D2oUs0kb+T/lJnvAgNTT8gYOH19Bek2GxyUqXb9+iYaRxC+gNwfkoumsLoAylu/6Kri966
 d4XyMO80lSI2xpvTa61EhARMz0xt8Ujg+6CLJ4UDEniRhyTlzt4EIhV3lcZXC4GxSgDxb2oMNeV
 V8FOcM/jrCKdvfzy03lYsW3oeb7nX0skGsBTiiI/UP+S3jZXdOmE2M05HU9QteAAOHBqAyrs3bv
 rUnoj8EUXzmClV0sz07Yo4LeAsDVYLYUERaWbyV0lAZ0qkWgvqa7CjwepMqR3WENXGet90thAwt
 yxM3z8tQDNeU1qlAsm0bIYjG40DS1ABbPKbyVFVhTePnlQk0sLMwykbzrft81JfwZNP6a2mSvVr
 VEGeYUqCXEvtwAFLY1w==
X-Proofpoint-ORIG-GUID: zEEj68qgBl0vltVK8jPm2YaFM5egjVXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300057
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

