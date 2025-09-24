Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93FB9CB4A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 01:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF4710E25F;
	Wed, 24 Sep 2025 23:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6F5zZiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2F10E25F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCYChN017470
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d+QcUnwPoU8KIc/SQDuBGNhNOG1Bw7UbC8jOgEUWCMo=; b=N6F5zZiSIkqJzRWt
 A/LaRsykqpstVZ3XsPrMX08CDVxWYvkcjnguA0vWFJrDRkyQE48m13UT13mz72o2
 HYCH9bt+SZDcPGiInpjRNY8M3JqmNqhJo+zi+FsmTpvG2GAxGvt95YidwrBRBJ+A
 o+fgVxmIYwinETNk9aeNG0CU4xpBsjfnz+PBrSctMzcNJE2s+LubSZNigpQ5nA+5
 cBQWakdfRK6IeC5SyCWj1IY7s0uTF9cEOINHqGaoFUJJB5xWYYcquojlfWtoPe+P
 IYC3vrF0QNjnnQpRQf+RkYIMbuZdfWAND8cy85aDO+7Rc1zZBIwOrcmU/XMZ0hHI
 Fnq91A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjydhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:46:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24458274406so7069625ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 16:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758757605; x=1759362405;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+QcUnwPoU8KIc/SQDuBGNhNOG1Bw7UbC8jOgEUWCMo=;
 b=k3aKN39HIqNVRyoorSIy4tP6Ah4ilKsKOkdOfN5Bq4udtOdU/M9v23A6VLTZAPCtaq
 ArTjL5js/D1m/UB1OfVVifLJltSMSW4cfRbjLQ4fsqy6yrW1xpgWZpKYSRDTt6DqKP3F
 9Otg7wsg+vrYXAFv62eCxPFp95+Nti7cfpDRR0QWS69VUwt+GfsWypDyrz9ORSHD32s5
 nLyJK7ZUvGzvAAhlCFQeY1tTZq1qj1J+byApJXK+dGN1jMf/aiXj37HOlcaoRZLg2cuA
 +yTmWQdVOwjqNz/N3JPEQRxR5jGU5U+6DNaPhj6DH7/SYtA87f3N/rjEP2Iol0QCTL0F
 CReA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIIjazyud8yw/JyBhmzncPLQpOnEwLg8fFLP3YWdWPy2BnJxomKLAZAS42YxISXATYGM5RqPylCDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwggmVuy/By0YGzB/ItiLKBIklD35PhZUNViIGpn1ZqKDcs7PYs
 pQImOlVah34l8sQM3k4CweYCtXVnSX9Q8JqaJk8BRml+YRwTW7EPeGWL1IgkAcg+ul17Tp0pdx/
 3dMSyccZY1zmCktlgV0Hw5qXAkqAxPutbbN8NG4Y4DBOUmjM7UBbyR6RzW3oho2emTxmbFLY=
X-Gm-Gg: ASbGncvNxpcqf89NJ412bbKcbOz9HlwLKJYIviWvHvz9nXVEl7Qb2GuUaS/e/CSBTle
 9fMqYG5z6mGmlMXR5C5zjKVRcgrvoPBVjXMJufkFL8vZo9w8HuUNScupzQHbw7CL1fMPS7XfPgA
 Kwh/2yTSGeQwbSH5RtxErazT3J9Urn57zw1joPRc4vaY6vdlf1uXheyuiCWx1pGgqXHXRtQ3SO+
 d9ScPOBfMCT3/DA/UNKfpDj/t+bWXz1UIJqdeoWaTE6PZVk6jNKfzw6frVggBSTa5+K+ku7ucTY
 BSo1EquB7vsrF9yzvG1uOPaeXwzqbWjML4wvzqUU8k+Nptjanrp+GiSiRj+8cN3j4tFjcAP9jon
 FIApOuX0Dhcfdqp4=
X-Received: by 2002:a17:903:2b0c:b0:275:6baa:d9 with SMTP id
 d9443c01a7336-27ed4a56b08mr14021455ad.40.1758757605304; 
 Wed, 24 Sep 2025 16:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsZkCilV3B1P9UXHL4Cpdv9AoCXLxr71gZLjA1+Y/7WWXoQtNBIflcG5OnRE5Cpm3vDOfvAg==
X-Received: by 2002:a17:903:2b0c:b0:275:6baa:d9 with SMTP id
 d9443c01a7336-27ed4a56b08mr14021195ad.40.1758757604846; 
 Wed, 24 Sep 2025 16:46:44 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed69959e1sm4318405ad.103.2025.09.24.16.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:46:44 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:46:37 -0700
Subject: [PATCH 2/2] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
In-Reply-To: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757601; l=3165;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eD8yAx/YuKqA7+Hjy0aKSPReaieqfN7YL0zc+4CHM6c=;
 b=/zkxGlXtFzMJUQCd4c/1ySUM3PnK4HaXPCbz5JL74xjuvqJyZ9b1hM66HPlL8U0UGPZM0ezj7
 sofz7Cx6pHwBOjEujFDJaS7Pr1KskcN0mvAxmFk9s//g0LjiHrtrW5W
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: g_NR7q7fYKZGfYDzQjlpcOAhFcznn4b0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX2SbuPoEYWD1b
 JvYywtPgqmPqmWy2Oah/E2+5cWoGvE5b3oUKN/O/LMX9CiKmj1VGfYMbN9jAs2nSjU7wkAy46Sm
 4DccKJ3226hwDmLKJfFD2Diqqi4KgJq1khEIXTuuzQYh6DmjvyiVvgKjnNnIduspBbs4w4sUR9U
 iKfjMxioUIxe64WBikgj+CBkufeFio3UK8mviYXBb+99sTNx0tltiJDAeaPQ4BRt8rzVp4mR90B
 /CoT55rT0kY1OUax+g1pLBD2g6sq49yGO6f85rhFGRlfO2y9p0dm3FqSbeuanH9njSmh6f/2E/u
 wvTmYRrXyYb5bPOId1I5tZT2lyPRENHRjIMEQ6U3lUebVUkpz7Go3m73BoNm5Ct7LCSFk7/laE5
 V+tDNGpu
X-Proofpoint-GUID: g_NR7q7fYKZGfYDzQjlpcOAhFcznn4b0
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d482e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=v5czcFVHhVNKnq2DKJgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
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

From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>

DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access. This is being upgraded to
34-bit PA + 4-bit SID due to a hardware revision in CDSP for
Kaanapali SoC, which expands the DMA addressable range.
Update DMA mask configuration in the driver to support CDSP on
Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
it to 34-bit based on CDSP and SoC-specific compatible string.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index db396241b8ce..e019163eb265 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -275,6 +275,7 @@ struct fastrpc_session_ctx {
 	bool used;
 	bool valid;
 	u32 sid_pos;
+	u32 pa_bits;
 };
 
 struct fastrpc_channel_ctx {
@@ -2179,9 +2180,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
+	sess->pa_bits = cctx->dma_mask;
 	/* Configure where sid will be prepended to pa */
-	sess->sid_pos =
-		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);
+	sess->sid_pos = (cctx->iova_format ? SID_POS_IN_IOVA : sess->pa_bits);
 
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
@@ -2198,9 +2199,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		}
 	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
-	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
+	rc = dma_set_mask(dev, DMA_BIT_MASK(sess->pa_bits));
 	if (rc) {
-		dev_err(dev, "32-bit DMA enable failed\n");
+		dev_err(dev, "%u-bit DMA enable failed\n", sess->pa_bits);
 		return rc;
 	}
 
@@ -2287,10 +2288,12 @@ static int fastrpc_get_domain_id(const char *domain)
 
 struct fastrpc_soc_data {
 	u32 dsp_iova_format;
+	u32 cdsp_dma_mask;
 };
 
 static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.dsp_iova_format = 1,
+	.cdsp_dma_mask = 34,
 };
 
 static const struct of_device_id qcom_soc_match_table[] = {
@@ -2310,6 +2313,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	const struct of_device_id *match;
 	const struct fastrpc_soc_data *soc_data = NULL;
 	u32 iova_format = 0;
+	u32 ubs = DSP_DEFAULT_BUS_WIDTH;
 
 	root = of_find_node_by_path("/");
 	if (!root)
@@ -2322,6 +2326,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	} else {
 		soc_data = match->data;
 		iova_format = soc_data->dsp_iova_format;
+		ubs = soc_data->cdsp_dma_mask;
 	}
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
@@ -2404,6 +2409,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 	/* determine where sid needs to be prepended to pa based on iova_format */
 	data->iova_format = iova_format;
+	data->dma_mask = (domain_id == CDSP_DOMAIN_ID ? ubs : DSP_DEFAULT_BUS_WIDTH);
 	kref_init(&data->refcount);
 
 	dev_set_drvdata(&rpdev->dev, data);

-- 
2.25.1

