Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FCEB9F0EA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFFD10E2B6;
	Thu, 25 Sep 2025 12:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9KKXRdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2917510E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:00:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9jkNU023773
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnY
 dDBg+Vjw=; b=i9KKXRdI58COK8vJctc3V1u2NMDiPYXT/9aK84O7uzmmbrZW7+u
 I0HdUNw274w8+Hae2C+FWKbMlHMhFf7hrXRxNu7mzdcbUQtq7tmoxrDPcqe5iig0
 azgg2YxMyUDw3+7vrl/k0tcQac2fmgT+H0zrxKw45GAM/FKStn+CFBx2zItqmsNS
 37bbWBK0YzqCNkPXDm1CJoDT12pJOlrc6nZoA1fazHzv9wmcAlmPYkWbEA7sz9sv
 ujslBadeGgcRq9OorZZUDgVBskSJHL2YQohthCtEwEFrocnU4Ubm/EO5i7cuhHC2
 XkthclIt4srpiby65SNo7RjZwqBi5xRDg6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0f0qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:00:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-277f0ea6fbaso11099275ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 05:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758801655; x=1759406455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnYdDBg+Vjw=;
 b=fLefnzo2ikhlasZ5BUz6idn7FKI39lGgEYVkA63V33JqjHieijBBn2k7Lom8IYcLtF
 MHJgg3sB+5BltVwYJfme3FO0cZ0z67Ef+3AEwJ4t0/7yxAgDWvVuLn0WdrF0q9s6nlxh
 pn2ADfzP1jn8+e9WBzDITE6yy7zUK0ssYIXQ1lvC4DENMYpRtvSqyvOjvOwS8iZFp1HU
 WXgnp1pu6lrNlm0UEOX4krE8MPkqz78zpJO90icXpoU9b0cXsAd12iv9npjsCkjNq/E3
 RG2OEw3KWdU0LYd1usxy+o5Dhaia10t8UEYdRSy/v3pFayJIaXrfdjtCzTrDRWfYujlo
 8ffg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzQuFzvrlNls8ft0XO6ManXU2fwgpvlR8b3M/IwIJhaOxuFkzEeheUtdBXTpORKbZiQcT17XSGQIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYjnEtPMMQhuDyPZX7KNF5djhjKB2dUq8gVXa/JdBL6Pc84BV5
 7vwT98Cz8TBQcAupOZMFDJLhJhJlVZuP7gRvSXU5L6sNPAnlxA0pkDJs7116FiYAhCGNT6jJnMM
 kBwVtvMvVzj9vKobzv+xdCCo124d94ilJ0VF7g7CDiyoZaPQYnLqJW1VSBw2QKdgtNbFjBpnjwm
 LKM4w=
X-Gm-Gg: ASbGnctSHmHlsyA9z5EdKDF2k9bCN5yHIB2HvQZldhuwA6i0N6wasHq3CHThF3xhT3z
 AMVfTK4Ww1aoodEDutOHdj1zAXRKFT0a4AuIwTcLZyvCZxk7+g558YPwdIu+H5jT1eAkBbWYNh0
 Rsc7Xg9zIkZMsOtHEb9VrL9HZVEiEd+Oc89EN6j84B37J0xEwtTLc0xWtTBDa3bPG+NGaQOU3cV
 mnnVK0Ai1wn/+9rZRTHzjN1UyTx9AGnybaZGK21JidMt4bAB/uGC3gnivWnap+DHaEkmJr6ymKh
 +jNlyXkLy7VOcgEnzernxdKj9/NXlMQTPv8lc/xMKxhOBfwDDbzsa0oAcY2YCRQxGM0knwh+NSc
 =
X-Received: by 2002:a17:902:ecc3:b0:269:4759:904b with SMTP id
 d9443c01a7336-27ed4ade041mr36647765ad.58.1758801654956; 
 Thu, 25 Sep 2025 05:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnXD2mZAewf9zy3BLbepfrjU+YGJ4Cp4RyCyDnMr5leVblOCnWiw4Ra971I5AdyuLPIQ+vrw==
X-Received: by 2002:a17:902:ecc3:b0:269:4759:904b with SMTP id
 d9443c01a7336-27ed4ade041mr36646315ad.58.1758801653319; 
 Thu, 25 Sep 2025 05:00:53 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed69a9668sm22266585ad.112.2025.09.25.05.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 05:00:53 -0700 (PDT)
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
Subject: [PATCH v8 0/2] i2c: i2c-qcom-geni: Add Block event interrupt support
Date: Thu, 25 Sep 2025 17:30:33 +0530
Message-Id: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d52ef8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=AcHsLZsjNhMhd8_3HEgA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IZ1L4LcYx4ZyS8zUCZ7pt7d-xbjfuQoJ
X-Proofpoint-ORIG-GUID: IZ1L4LcYx4ZyS8zUCZ7pt7d-xbjfuQoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXyRHm2g8he8t5
 YsFx2Ftx2BZ4Lzvg3F2ZBCNujq99bjYmQyk6MJIMaQ0/1fqz0Ca4C3OErlxJ2a8xCJEa/ZoHWsx
 6Dr++vZr9fPzbkfTUk/Ua1VZA0P2LEId618pBg2E8JUffxMRPrYmdfIDc9WCsV/1x85rBPC7K7S
 ffuM+S7rTOYLmJcabwrYD+cJQhvlblPZHLQszti8jprSTDHrodaDIqurgfYEy9EtT08BpAvqps3
 wss1sg/W/QM8jZbOZOfR/rgW0mRoNotanCEX5fHqbHMmTiVRkSrOVobLcevCw3ATfBttfCpp7Ba
 Z1//oLCWBJBruxJU3HFUeeqW6ox0EEKErmuqLzFaUupSwwk1j3XIpKu95gQwNkWA09qbEiesTaQ
 WwL1iOQM
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

