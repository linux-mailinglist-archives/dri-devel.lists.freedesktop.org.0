Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E992FC07610
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B44B10EB15;
	Fri, 24 Oct 2025 16:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="creqccD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A0B10EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:46:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OBtPiH022678
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=R/+J0Z7Q44h8QQSeR6zzByUNCi1g1AO74X7
 6qOhV0Mo=; b=creqccD+DhkzVsGiJZNHFiVXzsmOPWTJ33ogwb7H1H8e8BIpp94
 J187nTdxo0FwO8r3Nbq0PVfPWA172lcfffqJE/OgD91l74+YcI5OkdR9O6AktTmp
 Al7uls5GKmA6MiI8UKNLSlrqP5PoZvCYZffhohf55amBM/5/YsMW/ZHVQ7Jepi96
 Ok0sjGX2s+h3DS4/fYKniu070NIelrZfTJPKQ+oZS3rgdVOEc3BmL5mMeaTClHBg
 WBKvpVxNOj98NQ+QxCZSaILQVsq/d0PiakdCgcGJ2Zmh+rpwHjTxJg8XXvMAx3lR
 +K/W7rqdOPgTCSwnMWRSwdTDmYyeamSTo1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8pv7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:46:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e892acc0b3so64659021cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761324392; x=1761929192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R/+J0Z7Q44h8QQSeR6zzByUNCi1g1AO74X76qOhV0Mo=;
 b=Xl+OyGF9zfNjeeY4TV6pXI8rJhkOoJY6RbUTRtYlKwq5rWmV1xzON2Up/B/mItiJWZ
 tDNoDiNZ5D7QVd8NmRw0az/gIHtFoHELno4rZunO9XZCxhUeRZBu8sVVKQ1geBS8YoUH
 1D7x9dvHbF7/cSGd9UhHJTrPxD7OXq+VWo4Rp4q+qD5ePy7rbbKYuA7OgIp9ZNlmYCJL
 PdD2jCrx4DqOflbTaMNGqhmtEp8OSTVqfblkPBWC2wHvMVibijImTkKiY31O/shpnXch
 Z8DlRaiT99DRZCSsKcFlQv4sCnDRLX/9livhZ7OPhq4tTPTGdF4GEvYyChoPDkc2bUgn
 /lSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBLEvmiKzjr8L+n/lxFwPLF6XKfguMYhUQ/lyRE0Vo+ZiLTQ7g7cjxWPr/nxQFeB5RsA4XGlvrTMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAvCrtPxJSOweRNDEVCReXhKXa/vEczgrZXPyZ8x+Z/b5s7lLE
 fVi5fqmceD9aZJW6r9WqH8OUzkV+rHYsxLkBtqsCVwDL2FqWsvLHQiFkxYG5FC8Z/PtRUvuRoK1
 9Wf6Du+tG0Zs65G9bGXUYxaVsSJx05Egmkndir/uSRwY3ExN3M+XrsPhkMIb+Qsf7gDdNYL4=
X-Gm-Gg: ASbGncuZzhHIEWShYdatj3awPacGta9AJW0EeuaHVg1Ux5BEshqLNeAAZvpuVznUeg2
 b6YdUGdFaAem9YFu2YpsWi9m+eWj4iUKtQ8evmvR8ER4ouGvRUg68YKgw3hat9mmeeBDfM1OrcI
 S98jZ6/109g4CybSqN2tLCM8UW25b3PjmIm9SIQZbOMxLqpVTEkrxzrYDifFPCZ3KVBpHhsMpX2
 UWWpzh3W27VaWNwV3nf721KPjszdM1yd5/rqi6mpszfWzqfpXIVcz/lclxI+bK2I9h5evlOboHY
 suTQ4eE4+bzsTLqH8JkyAmw6WxIf7U6uRLsBShVMIxbSU5kxrYURr/KubvBbXPyWlyE2RADQQ/D
 /QY0zmQDyv+8a7QwMteA4mgWD6otlzRxFTs6Zt24=
X-Received: by 2002:a05:622a:a0c:b0:4e8:9e67:92af with SMTP id
 d75a77b69052e-4e89e679379mr360421091cf.20.1761324391625; 
 Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgHy2mmdfYga2+tuySnmD8eHvI48/SndNl24bMfMqUwALDOnDfcHcqfh6kUBMvWDUucnZdHg==
X-Received: by 2002:a05:622a:a0c:b0:4e8:9e67:92af with SMTP id
 d75a77b69052e-4e89e679379mr360420631cf.20.1761324391083; 
 Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51472215sm563568466b.74.2025.10.24.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 09:46:30 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] accel/qaic: Add Sub-system restart (SSR)
Date: Fri, 24 Oct 2025 18:46:27 +0200
Message-ID: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2DKkSVp6PqK5zMLXF86rp53qmAA65uBr
X-Proofpoint-GUID: 2DKkSVp6PqK5zMLXF86rp53qmAA65uBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfXxvUuVjUWSKmt
 IKo9e+ZQ5sE9skvf3dUncVcwl36GJum1dldk6Q/lj20fbfYWzaGBpUwlEnN2aM84Q3y6DhpDQqU
 /bdxcEKifPtJIv3EkXXYcMKnDlsqjJidA2jBDPmsLkOVnM6RdDEOXkNYR8VOnExyR2lc4UxixHP
 wWLeEm4rfPhLfIoJrer97ZEtQpF+RCTvfyidwNjqPbXdqwX0JBzgR7ya5TaPNbfe/qdNpOKVN1l
 DVO33m9IXvzCoSeD6I3gHfUYiYE4xzAbXzvYV+CdgWzeM6qlyY5fuC1x0TrcmPhsYmoW8IAR4WJ
 5fHLSMEUJi/CCy7fm/X275Onr0exSpRtW9iQU9+KZ2ZhDzogni+dvrvTQNyf5oVlcOYE/UkcUJP
 FVv0mNyx0vA3+UqhKknV6K6dP0Gw3g==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fbad68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vm6HeESPmvYr7rZll5gA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
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

SSR is a feature that mitigates a crash in device sub-system. Usually,
after a workload (using a sub-system) has crashed on the device, the
entire device crashes affecting all the workloads on device.
SSR is used to limit the damage only to that particular workload and
releases the resources used by it, leaving the decision to the user.
Applications are informed when SSR starts and ends via udev notifications.
All ongoing requests for that particular workload will be lost.

During SSR the affected DBC changes state as follows:
DBC_STATE_BEFORE_SHUTDOWN
DBC_STATE_AFTER_SHUTDOWN
DBC_STATE_BEFORE_POWER_UP
DBC_STATE_AFTER_POWER_UP

In addition to supporting the sub-system to recover from a crash, the
device can optionally use SSR to send a crashdump.

---
Changes in v2:
- Use scnprintf() in qaic_sysfs.c to fix openrisc build error with -Wformat-truncation
- Link to v1: https://lore.kernel.org/all/20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com
---
Jeff Hugo (1):
  accel/qaic: Implement basic SSR handling

Pranjal Ramajor Asha Kanojiya (2):
  accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
  accel/qaic: Collect crashdump from SSR channel

 Documentation/ABI/stable/sysfs-driver-qaic |  16 +
 Documentation/accel/qaic/aic100.rst        |  24 +-
 drivers/accel/qaic/Kconfig                 |   1 +
 drivers/accel/qaic/Makefile                |   2 +
 drivers/accel/qaic/qaic.h                  |  36 +
 drivers/accel/qaic/qaic_control.c          |   2 +
 drivers/accel/qaic/qaic_data.c             |  61 +-
 drivers/accel/qaic/qaic_drv.c              |  25 +
 drivers/accel/qaic/qaic_ssr.c              | 819 +++++++++++++++++++++
 drivers/accel/qaic/qaic_ssr.h              |  16 +
 drivers/accel/qaic/qaic_sysfs.c            | 109 +++
 11 files changed, 1102 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_ssr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.h
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c

-- 
2.43.0

