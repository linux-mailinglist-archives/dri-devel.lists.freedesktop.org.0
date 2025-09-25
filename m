Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96EB9F038
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D628C10E8D9;
	Thu, 25 Sep 2025 11:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrgsvBkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F4B10E8E7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:54:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PAKSQs002652
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IcQRAOQdZqK
 M5AAtXRvgWEwEH/H9DHPEDvxp2DSgWr0=; b=QrgsvBkZkXweqgEzKz8xzjo9lgS
 I4Cghic1LlrUsLqMIP8m7p7zPQ3MgN9s/WliDzuNgDOEZ0pj3ViDdMBXWMQK3dwL
 FnVBHQ6qBhtw6K5ygFitmI0ljz72D1FGORKkrTLXRQsct7Nj11u8Ki/Y95SD6Xnt
 1tAuSqs9DqteamJvRCwJnzX1H0LVFGeJ85CGlKfiAPKrdsLTXl0V7kWPKfnKHP+v
 DP2BIR76fE1UUGpnFXhlYtdc6m1tsXXFbOkwd2fofWXsUXvf5e2yrWqFPK4b8W17
 zXnvnOcS9lqOM+G0pcBtMSoINzruztAWlcyIbAyChKAlvR/98V5pBtAV4xA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf2ghk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:54:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4f86568434so630465a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758801266; x=1759406066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IcQRAOQdZqKM5AAtXRvgWEwEH/H9DHPEDvxp2DSgWr0=;
 b=BLftVq4drwRiFy2czlxoh8k0jdCnx72QK9FQQc1nNmJ63ja6Cyur1DwnL7Q9fWBNbv
 3IYdK5vFJh7g+TFfWEmxTSLkrVw+I7B+aZOHFgMZSEMtf6/NNUBgW4hZaIP8yG9WTxmy
 CXM6Q+BUxvnYR3ZUrm1oznUnEj/8/Gy2WKRwEZaVpi/u15RqW9ySoNMizf+XZ/nUPDOx
 PvOKKZMKek/PS3arZguOdOZOyzENouZRKdo+bebi1y/XmJY/hyBsNPx8rKVJs5/Fh4R3
 /MZXmzFJB1x4bRGNOVrqFLrHc9rG7FguXOMGEn/F3MoBk6Ir0n5qFnzBHDIVgzXaW+6q
 OsRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3wZ+u75Wk8m+9MlcX4/Be5jJauEcJVcPAkh6PWlifiX308QH4/Dz2S3xH4P+N5gpA1wTHlUX6cAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgfQHOWtSA5fL0//iTHU/+FUhBPY8MeToKug/hy0QRkQuBFu60
 xwaRrlOD4mJBLuUUA9YRpB+HVkNB0ZYRkKqGpGU+VPj809BdB2XSdEjJSmMO2oP7biXfMuS5+Vg
 JDjQK3hh9hjIuz/vEJcGXmhrcKHLQVXZwnlpCDT8msRkgeAwIfOFmSWUNmy75AGdDTjE+RJM=
X-Gm-Gg: ASbGncvbGXJjwP+PKN9b5s+DTDIFuH4B0qHm99JmZ0hEMMIx7YFu3Cf2Gxj+dFmh57j
 iDFzBsxHlt7I7Drl6xCLmH5BA9mNyi9DYNMjwJs9yHYu1S7eNleDH7YJebxdEqrvuYzIZhfJN/j
 /GCCPec9YZLNo0HBeJsUBNu/bo4FbZKaCV4QMQ3Rxh6r3fiOYMUsIr+qlp4er61hxDeHybQ8qBy
 plQJr8urMIGXikzXheSbDsUQ9noJBmUj/nc6ewcWBirNgyW/qL13wtzBIne0vOzBn1kQ9RgHOPG
 IYaNri1vhI1IRb0Yz56KZ9dm4DtSV/t/Rd9uKTEoHR1k/ju4anOCuoXfNE1LaUDeq2KjH5iE3uw
 =
X-Received: by 2002:a17:903:3884:b0:274:3e52:4d2d with SMTP id
 d9443c01a7336-27ed4a76e00mr32337955ad.37.1758801265285; 
 Thu, 25 Sep 2025 04:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ckvMkGt+IFhS7y1WdXrjnERoOor8+C8TXNTMEGz1eO6XtWc6VahcrWBEIiWDA6gEc4+jIw==
X-Received: by 2002:a17:903:3884:b0:274:3e52:4d2d with SMTP id
 d9443c01a7336-27ed4a76e00mr32337705ad.37.1758801264692; 
 Thu, 25 Sep 2025 04:54:24 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed69bb502sm22087935ad.118.2025.09.25.04.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 04:54:24 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: [PATCH v7 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Date: Thu, 25 Sep 2025 17:24:11 +0530
Message-Id: <20250925115412.2843659-2-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925115412.2843659-1-jyothi.seerapu@oss.qualcomm.com>
References: <20250925115412.2843659-1-jyothi.seerapu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PrFplVO41t-hoFz0IoqHlSO6xIoeofpB
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d52d72 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=hwQltXbWhlPaccoBuB4A:9
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX977ngFKqO/KK
 0RMEmavd+0bmbyw43Z/7QxsGO5vwt8ORp1iDc4KlvEOcs1LcNfHk2U7wjOPb9tw5rhBEjJEnLSi
 9AUz6x1POcr2PN5UwzsIKTBoUKBKE/HhV6og7VcJzs3ZKtF5nuQvLAceBkwVmKfm/WgJx73sUzs
 nhVA3mh6Zm/tvxfi3PWlitM9tp7O01PzArLGToHMUhAVAXXr8XFqR0Y4zgpqCTqQDWpBfYNa9vW
 Qyq+D4h+dE5t98g4LJy1TaA+oWvIhj6AsN3H7VqKkqB66IJaAj/F7+KR26zUIlrNgBh4Vxdl/Wk
 ds/pZrPjKoevDcdYMhlgZ0z5Htk1ex9cQfcGq22fxRlmTp0KfzWOxWEqFw6lsVqd3DBCpRhn610
 kamEqdTl
X-Proofpoint-ORIG-GUID: PrFplVO41t-hoFz0IoqHlSO6xIoeofpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168
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

From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

GSI hardware generates an interrupt for each transfer completion.
For multiple messages within a single transfer, this results in
N interrupts for N messages, leading to significant software
interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
Enabling BEI instructs the GSI hardware to prevent interrupt generation
and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of messages internally.
Interrupts are not expected for the messages for which BEI bit set,
only the last message triggers an interrupt, indicating the completion of
N messages. This BEI mechanism enhances overall transfer efficiency.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---

v7 -> v8:
   - Removed duplicate sentence in commit description

v6 -> v7:
   - The design has been modified to configure BEI for interrupt
     generation either:
     After the last I2C message, if sufficient TREs are available, or
     After a specific I2C message, when no further TREs are available.
   - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function
     and so avoided using external variables for DMA_PREP_INTERRUPT status.

v5 ->v6:
  - For updating the block event interrupt bit, instead of relying on
    bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.

v4 -> v5:
  - BEI flag naming changed from flags to bei_flag.
  - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
    file, and Block event interrupt support is checked with bei_flag.

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support for
    I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.

v2-> v3:
   - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
   - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
   - Added documentation for newly added changes in "qcom-gpi-dma.h" file
   - Updated commit description.

v1 -> v2:
   - Changed dma_addr type from array of pointers to array.
   - To support BEI functionality with the TRE size of 64 defined in GPI driver,
     updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.

 drivers/dma/qcom/gpi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 8e87738086b2..66bfea1f156d 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1619,7 +1619,8 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
 }
 
 static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
-			      struct scatterlist *sgl, enum dma_transfer_direction direction)
+			      struct scatterlist *sgl, enum dma_transfer_direction direction,
+			      unsigned long flags)
 {
 	struct gpi_i2c_config *i2c = chan->config;
 	struct device *dev = chan->gpii->gpi_dev->dev;
@@ -1684,6 +1685,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+
+		if (!(flags & DMA_PREP_INTERRUPT))
+			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
 	for (i = 0; i < tre_idx; i++)
@@ -1827,6 +1831,9 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		return NULL;
 	}
 
+	if (!(flags & DMA_PREP_INTERRUPT) && (nr - nr_tre < 2))
+		return NULL;
+
 	gpi_desc = kzalloc(sizeof(*gpi_desc), GFP_NOWAIT);
 	if (!gpi_desc)
 		return NULL;
@@ -1835,7 +1842,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	if (gchan->protocol == QCOM_GPI_SPI) {
 		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
 	} else if (gchan->protocol == QCOM_GPI_I2C) {
-		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction);
+		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
 	} else {
 		dev_err(dev, "invalid peripheral: %d\n", gchan->protocol);
 		kfree(gpi_desc);
-- 
2.34.1

