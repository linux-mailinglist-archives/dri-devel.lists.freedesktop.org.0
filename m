Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB10B9F032
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474FA10E8ED;
	Thu, 25 Sep 2025 11:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7qW1Q7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244F510E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:54:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9C3t3021569
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnY
 dDBg+Vjw=; b=k7qW1Q7/SptebFxWY3QJgijbjb8kx1guveuj61ZnjJ70SxrHSW+
 f/VugZaQ3HWw2ZT2ZS6sc4FnUoU+GuOzNJRe0M2lsvohTQObbRUjW8lI07u2F0C/
 giMUSgAWEAoaJXSP7lYSJfsS30efuoGi/87V8OuMMiwUoCAy5cB8Z4WBJo0p1TA7
 lNjK0WfXeyg3tQhDO52kp8x2pf0gXnnQyFS0UhkRQ+ajz4eLDv0ellFi7io2DmCx
 R1Uu5DVRCGHJqcH1pZFekAlEJGpJjhpq/F7rD7aFrklQOvryXADtEu0LhOuUENxu
 xf9Z6s33PlONOK7lZPF1n6gp4+zj/Zi2nfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budafhd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:54:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-269af520712so11681075ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758801261; x=1759406061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnYdDBg+Vjw=;
 b=mvVletrg0l+hFWqf3zbnFrBI3ZGmvdzI6prCO5ha1z68kKB+ldTyCskWV8Wd6OGyVw
 s2wsmjpryMxSAD1G8baHoCfPRd2SUPeWsWRscHU5P09egSJvtmUBaGAkVshTyzvLW21m
 Hpku65NLNatovaa6fHLGSZM+nMAN5lfrxtSSBdKaDuz3FiNMptdwqZShYiEcGPka4lPG
 OJOVpiwEAKGYeySCGO/AKmQ23g31h9w/PVpfkAzJRjgmMINyQg4nQgpt5Jfi0CGiKmNz
 KfjBBB1bOfr4WX0av4dFsqM10h2MbKT1p0q4y6/qr1K6LoE5g0+ZtEQh5Q9CHRYxxkqG
 A29g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn4Qm7qx2Jw8zI3HCIImvcY8xHDU02q/KVBlBBWtN29mgVDdw113MxseGnIhjTCoYC6aSun6wxuys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxicdOfMb8fDn6vHkq8A6KZw0qwtLyYy+8jHa/5JsHnn8QrVYTD
 AAqegEA6ElSRo099Dzfg5vPdMon1GpIcAdNDm5xCVwHensrw5gFLUkgj1jU5EYVZoccSZItnIr0
 IStzNfDEabY2gAdzaZF3Ly6PWiktk+Kk6bWeRovce1XgP3nYr2zBLv6GzuRe2UqetCb2lzPs=
X-Gm-Gg: ASbGncup7nfBPf4rf3NklMBWU8prskShmQ1N+aBPbPv1+BQ59O8E0lvWPjxBL4jZ4/R
 vwU6ASwZ2g2bV1VNrIxE41xnDgQGrpRZch1Fb+C5tj+SrAb6Oz3QuID+detTyuRAIZMUt7peFi6
 3w+jdEVZKr0w/lRqzVesK6NkrKGd+hD0zcrW++jA16a21MpSuBoAc3rlCxpNpyERpAtG9oyvbNS
 ZZg0g5WXhc3zMYby6LsRtDS4bclxUkC3MNqsg+TDKE0+yFH15E6UxYoe9jfTyKjV6M4Rj/OaT8Y
 g5yOlRCGw/ir5AOS2vujXq28PI9Em9fyvV23F/PBMx26dFpVBGoEwc8X472acgAeSneN8BjztQc
 =
X-Received: by 2002:a17:903:2c06:b0:269:ed31:6c50 with SMTP id
 d9443c01a7336-27ed4a091e8mr37880525ad.10.1758801260814; 
 Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuENIT7uqE/PhFHkktSwABTjczamPHUaUnB2zTV5WRthAd1QMusVFWwc0an+6Xwk23xxnGrw==
X-Received: by 2002:a17:903:2c06:b0:269:ed31:6c50 with SMTP id
 d9443c01a7336-27ed4a091e8mr37880135ad.10.1758801260297; 
 Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed69bb502sm22087935ad.118.2025.09.25.04.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
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
Subject: [PATCH v8] i2c: i2c-qcom-geni: Add Block event interrupt support
Date: Thu, 25 Sep 2025 17:24:10 +0530
Message-Id: <20250925115412.2843659-1-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YFncoI3vEiDCJ0T6UiaEBKZ5uSoZT9bw
X-Proofpoint-ORIG-GUID: YFncoI3vEiDCJ0T6UiaEBKZ5uSoZT9bw
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d52d6e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=AcHsLZsjNhMhd8_3HEgA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX0oq680sNVCXL
 7IZID7uKdGrv4wxQVNz0ROKlyaf+uCKgIajSfR/8ZWe0JhvGZ+uQxXlUtPaLsacEJQypI/esDas
 GzsFwdLL/ReB1/Ii0fioGEK1Iunom60a3960PQy6f6H3FuEDv++4i12nkjvAV1dGnQl6+a+Ervi
 Y2bvCeFfqZ0xRCsuX/kkIOPr2V+6c85JmLjvIsgL0aJ3iVVi24fLmRGGRsr1vLhZ/79s+pHFiS/
 yy+sAUUI5bBnFF1ChyQQtjJYYqxqP3ykC/h3b6KmcJUWHmn+ZHbQFiZMD+B6U9IZVO31G4T0TmP
 h+Va3lvE8WCyRevGFQ13siHGy/UhnMabqDpKwo/pi69YbhIOvPEtIF4YFdVySBbc9jVKx5XzM13
 F3MnPlE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
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

The I2C driver gets an interrupt upon transfer completion.
When handling multiple messages in a single transfer, this
results in N interrupts for N messages, leading to significant
software interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI)
mechanism. Enabling BEI instructs the hardware to prevent interrupt
generation and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of messages internally.
Interrupts are not expected for the messages for which BEI bit set,
only the last message triggers an interrupt, indicating the completion of
N messages. This BEI mechanism enhances overall transfer efficiency.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

v7 -> v8:
   - Removed duplicate sentence in patch1 commit description
   - Updated with proper types when calling geni_i2c_gpi_unmap() inside
     geni_i2c_gpi_multi_desc_unmap().

v6 -> v7:
   - The design has been modified to configure BEI for interrupt
     generation either:
     After the last I2C message, if sufficient TREs are available, or
     After a specific I2C message, when no further TREs are available.
   - dma_buf and dma_addr for multi descriptor support is changed from
     static allocation to dynmic allocation.
   - In i2c_gpi_cb_result function, for multi descriptor case, instead of invoking
     complete for everry 8 messages completions, changed the logic to Invoke 'complete'
     for every I2C callback (for submitted I2C messages).
   - For I2C multi descriptor case, updated 'gi2c_gpi_xfer->dma_buf' and
     'gi2c_gpi_xfer->dma_addr' for unmappping in geni_i2c_gpi_multi_desc_unmap.
   - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function and
     so avoided using external variables for DMA_PREP_INTERRUPT status.
   - Updated documentation removed for "struct geni_i2c_dev" as per the review comments.

v5 -> v6:
   - Instead of using bei_flag, moved the logic to use with DMA
     supported flags like DMA_PREP_INTERRUPT.
   - Additional parameter comments removed from geni_i2c_gpi_multi_desc_unmap
     function documentation.

v4 -> v5:
   -  BEI flag naming changed from flags to bei_flag.
   -  QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
      file, and Block event support is checked with bei_flag.
   -  Documentation added for "struct geni_i2c_dev".

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support is
    moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.
  - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
    struct geni_i2c_dev.
  - Removed the changes of making I2C driver is dependent on GPI driver.

v2 -> v3:
  - Updated commit description
  - In I2C GENI driver, for i2c_gpi_cb_result moved the logic of
    "!is_tx_multi_xfer" to else part.
  - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
  - Changes of I2C GENI driver to depend on the GPI driver moved
    to patch3.
  - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
  - Added description for newly added changes in "qcom-gpi-dma.h" file.

v1 -> v2:
  - DT changes are reverted for adding dma channel size as a new arg of
    dma-cells property.
  - DT binding change reveted for dma channel size as a new arg of
    dma-cells property.
  - In GPI driver, reverted the changes to parse the channel TRE size
    from device tree.
  - Made the changes in QCOM I2C geni driver to support the BEI
    functionality with the existing TRE size of 64.
  - Made changes in QCOM I2C geni driver as per the review comments.
  - Fixed Kernel test robot reported compiltion issues.

Jyothi Kumar Seerapu (2):
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: i2c-qcom-geni: Add Block event interrupt support

 drivers/dma/qcom/gpi.c             |  11 +-
 drivers/i2c/busses/i2c-qcom-geni.c | 248 ++++++++++++++++++++++++++---
 2 files changed, 233 insertions(+), 26 deletions(-)

-- 
2.34.1

