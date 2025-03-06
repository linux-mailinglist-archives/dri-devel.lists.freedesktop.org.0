Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC054A552CB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C92A10EA34;
	Thu,  6 Mar 2025 17:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoKBeOwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA77410EA35
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:20:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526G7kid005358
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Mar 2025 17:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=mabVZF++F/IRRE+DpGcKkrClrfkIYBrazst
 8nqQFCNc=; b=IoKBeOwRPJLjLs/aSuQLn6aQd1A90ve3T5C4D9jLSXTgEMiRe9x
 Cr2Y0H60CMA/ACBaB9zf+8ObarxwViVwz6mDCIJXwUlr8H0cK2jL53Co83GPiE9r
 iWF7VmUcVjRzmHvxjUzMajQcyeLBJAn70585Jam6LkK8vfxZ5UddABRpFE2QmI9f
 DDokHyjgMbkA2gELGK1IIlAOCuNm3+JP1EQcakQqiAMHcf1OP3ZslOX35sOJ0YL4
 F5rI0b2xEvm0qMk6pRVMFp6S7O3yHR3qSkxukHUANqCPj6cxVYv9rjDeI8w5EA1M
 2gkPSNm2m/1ab+x4cDGYvQxJzs8jfOVvObA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx9q15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 17:20:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-223a2770b75so16285875ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741281608; x=1741886408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mabVZF++F/IRRE+DpGcKkrClrfkIYBrazst8nqQFCNc=;
 b=xCkbmMiUn7RShQe8/Vms4D6sozZw+eB20TKc6ReeIELluKYi1LdMALwNBZt5i9UsAS
 PN5eu+So1wFOvLjSqdUYmowtOg4uqqJiE841Aup7Ksdub+Ndi2wtaPoGKlJKIV56iQ9i
 Pte9a+N6I85FZRULt/JQHGYxn4JykfYB1ut3DSwuAzwZf60HDhiS4k6BSto9LlDZw44R
 2gC1iyHiQrpbHCJ4usQXD22ZvuaSFrmUfiaKvuXt2jxhBF/28jEbGl13/Ds/BliT+nnQ
 6LRtvXV2Of2sBuduQMjFdal0au79U4fu4QkziupRlsGu660WRM332SjkyS7E1m441lxA
 Kqfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/V7uekJo4wzLcNva4FMuFiSoCKofTN42ljLSOHpUywG2UQQAm2V8FB0jCl6sSOIFjAZjBhYnwuRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUlCkW2R9uRn+n9Y9M7zh7+RE9wqA+AznMvUNX7+3GJjETNY7w
 V1V7/GWwHEtew8UdgQxCu/NjIQnqRVyp3onppDSl19cG1nLlkb6/pyd/1nY0MEI+lmN+Ol5Rn6R
 3VtMufgOPYkEgi0k0U0lbDKqR0x3OKMJw4tf0dgAhqsKPMPEGBI0DjmiIBtfOuNY1XGs=
X-Gm-Gg: ASbGnctEhu/D2EsLQD3ittcbODuj3ZFg21U56UOINaBLIpPnCQRGUlWitXcrcAUqccn
 wlwZHFCZUEGawd1ZyZr2Nqy03Tc1hUe3IfXcDs1dXqc0wNvKkIggNcYXkWYVf5dziQx4PK72Plc
 gTj5X098DoPnbgi2sIOj1/lWhW1zWNqfDB8aUdWtsT+yVPEK8yFK0taklI7RKG/pHlZg2+tkwSc
 PhYrWkEcmX93A+nJ0lV45w8izNKWuyJmN0M9d3iZbPKQIcGvzpXeCxVkKSIb14YAz6yHHz9/PwO
 /4sAyetV9a7oEALXWlL4dDreobInPurAd1d3foUzYy5ptv6je8FXRuy1O6nubQzp
X-Received: by 2002:a05:6a00:3e29:b0:736:5ee3:64d5 with SMTP id
 d2e1a72fcca58-736aaaed79amr85197b3a.23.1741281607785; 
 Thu, 06 Mar 2025 09:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+tFxjMOU8QYHbNpJWXs7OJQKMk3Ok7HsvwzeRAonVT5P4nLFzbt5g+6v1CWcS27E7pCMP3A==
X-Received: by 2002:a05:6a00:3e29:b0:736:5ee3:64d5 with SMTP id
 d2e1a72fcca58-736aaaed79amr85152b3a.23.1741281607279; 
 Thu, 06 Mar 2025 09:20:07 -0800 (PST)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7369820699fsm1612277b3a.23.2025.03.06.09.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 09:20:06 -0800 (PST)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] accel/qaic: Fix possible data corruption in BOs > 2G
Date: Thu,  6 Mar 2025 10:19:59 -0700
Message-Id: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rxp0AcGPq7_3byT-iWhf9l8JFzL46XwH
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c9d949 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7nXvnx2kSAOllYvKTkUA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rxp0AcGPq7_3byT-iWhf9l8JFzL46XwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060131
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

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

When slicing a BO, we need to iterate through the BO's sgt to find the
right pieces to construct the slice. Some of the data types chosen for
this process are incorrectly too small, and can overflow. This can
result in the incorrect slice construction, which can lead to data
corruption in workload execution.

The device can only handle 32-bit sized transfers, and the scatterlist
struct only supports 32-bit buffer sizes, so our upper limit for an
individual transfer is an unsigned int. Using an int is incorrect due to
the reservation of the sign bit. Upgrade the length of a scatterlist
entry and the offsets into a scatterlist entry to unsigned int for a
correct representation.

While each transfer may be limited to 32-bits, the overall BO may exceed
that size. For counting the total length of the BO, we need a type that
can represent the largest allocation possible on the system. That is the
definition of size_t, so use it.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c20eb63750f5..ffcdf5738d09 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -172,9 +172,10 @@ static void free_slice(struct kref *kref)
 static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_table **sgt_out,
 					struct sg_table *sgt_in, u64 size, u64 offset)
 {
-	int total_len, len, nents, offf = 0, offl = 0;
 	struct scatterlist *sg, *sgn, *sgf, *sgl;
+	unsigned int len, nents, offf, offl;
 	struct sg_table *sgt;
+	size_t total_len;
 	int ret, j;
 
 	/* find out number of relevant nents needed for this mem */
@@ -182,6 +183,8 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
 	sgf = NULL;
 	sgl = NULL;
 	nents = 0;
+	offf = 0;
+	offl = 0;
 
 	size = size ? size : PAGE_SIZE;
 	for_each_sgtable_dma_sg(sgt_in, sg, j) {
-- 
2.34.1

