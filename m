Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544CFB9F0EE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF9E10E2BB;
	Thu, 25 Sep 2025 12:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofo94ddN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B79C10E2BB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:01:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9VOYx024230
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IcQRAOQdZqK
 M5AAtXRvgWEwEH/H9DHPEDvxp2DSgWr0=; b=ofo94ddNFVgvb9Xr0nweiMXmFz+
 4+GYBuXkhtS+9zcH43zYqtSFPkPEOqrDg+3/GY2jcsTMVl6+rfm73jV4/reNfQL3
 W6O66xNNhekYiSuyRVnuuBLRJCXFRiVcE+LXy9UYIJYVErtixh7g+97PNFReBBvi
 AYcJpdsw31W+/rOEDA46CCUhnbJLWSdGVgLTt5N1QY7akautuFp24+o39ve15R+i
 FFME/V9iLOoKAKl3lDUsvZkf7cE+l1mpEljpG/sNhIpbg54w/jXz4l/wdukZF0Py
 9qVNuBGG5EpHw073FSpaPnPjfbeU6S0Vn/MR7CKBuW2WefND9M8ouFMg40g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0f0qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:00:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-269880a7bd9so10390505ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 05:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758801658; x=1759406458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IcQRAOQdZqKM5AAtXRvgWEwEH/H9DHPEDvxp2DSgWr0=;
 b=Au+/YfZ8XXM/iQCQwPkoCP1vapM6ksFK3FHiEsJTlRzafT8BmXas8VF9fOZhFVJnXV
 426ekuXUy7AuZRbUrvd8NmbxjyT6liF2h46tDupPsykdY5SQ8cSX+nmIjzK3UAKdg0N/
 8ncm7DttTPvDzjnWqgYi3Gb8TAg8ovXtGJKBpEUKefoGx7cLiCmKxl7jg5VwdYdtdw9l
 8QqGrErBeG/mQaH1VSxonNf/j/MmcdkKry/WxDiQQtawNPE080FQfwVMyBe5IU69I/tu
 vywHXAactcqAp21pi0Yyp8K4PfXgabHaUKwOSOnselYj5VpggjvlBLtv6bNa2i11osHF
 1SDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVozGt8U6dILP9lLTr1dIoc8RidVrxKlnOY2kbju4iJwzKEbZGmvUhyZoDf2NYT+v2f6FJlEu14HK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3O9jTmguKoH3TC8hUTrPK7ATl7XJz+HyXx/sqMrksO0jpmyCI
 3Ad1vjyWChXXsePf4rjkO0/GfEQAY8mYBjU5TFPDpevsVTXcFNGIX2UPTkgoMmKG0VRRwtLTMCw
 LaydxuXfJSN+j8bGWfaw3YBTzsBt5OYcGChVyAEy6bYwIxwwqGNV95zYb9u2E4V5sU7la0LY=
X-Gm-Gg: ASbGncu5hBTaCBsWoqg7o+o6d1k2Mt35IFOUvsV1sVdEpv2BhWDuCSbyhqGRxe6PwN9
 ByZz1/Av6IWZoNqlVNp43WdA0Q+bHzXjXE4ou3TgXXis7wpGbh0jt8T8NOZC/e/WAWJXZ+T3Di/
 aajgJzWqofB5byXUAUTOwrMauEZw/NMhcO+asTffQ6IgeVOK92FoW6uj+sym19FjMNU95fkNHYR
 B9+OONjdEaUJCJC3aMFV7RRfpcnpjZf0f8whuMJZQA+sv81qKN/7iNNKsz3jjCxiwFi6nXVOmgV
 2ZxjPZ0TetCoyKZq2pIC9S+SlXsyS5ioRc/R52ERmWqZ03bln49YI4Yd/KMTsCVmqznD6aK6XzA
 =
X-Received: by 2002:a17:902:c40b:b0:27b:472e:3a23 with SMTP id
 d9443c01a7336-27ed4a3e0bamr37683195ad.14.1758801658314; 
 Thu, 25 Sep 2025 05:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7fGumgQ6JOPyH/fSwTAK6EGGHDGgY01Kvp+O07ZDrk9v36JqaRmQzhWX1MAjvJ0hmce/VeQ==
X-Received: by 2002:a17:902:c40b:b0:27b:472e:3a23 with SMTP id
 d9443c01a7336-27ed4a3e0bamr37682445ad.14.1758801657390; 
 Thu, 25 Sep 2025 05:00:57 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed69a9668sm22266585ad.112.2025.09.25.05.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 05:00:56 -0700 (PDT)
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
Subject: [PATCH v8 1/2] dmaengine: qcom: gpi: Add GPI Block event interrupt
 support
Date: Thu, 25 Sep 2025 17:30:34 +0530
Message-Id: <20250925120035.2844283-2-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d52efb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=hwQltXbWhlPaccoBuB4A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lyfIcHG0DbmLZETW64C48OPxLUK88nqN
X-Proofpoint-ORIG-GUID: lyfIcHG0DbmLZETW64C48OPxLUK88nqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX6yhYIonfn7ti
 IJ/XxsaAaWSVyKo90XUwlSy3yVD/LzFZoDlBEvGrDZBBWajiASvpC1o+0MXc+ls6TO92GWmjx3D
 X0pbiNreIQFK6YH7P4aOVpJj3OfCMxM9GUUJ+lL6jexwZSK9nVu8LuH84Fwk8AtNY9LRnxXB8Wb
 SaBeRMMRoE0+LR3cDyqQfBJgvIeWaPf1vOKD0AMB2XOg81n6qkb0uOKEu+sDjcVnz33WSHlhsW0
 +u2aWz2ooBE9dWW5sryug+MgOmbf042IalFGMXwlCHluLFX3FxOccFb77RL+aGRMySfmvvmXSgU
 ktFYWkKybuJagMwV9nG60HaAUWsr078hIM4BBGu2ubo+aGn7TMeotehS162VAIQFXGPC5yg4Z3a
 kWyIul3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
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

