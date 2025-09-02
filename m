Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FEB3FE65
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D7B10E680;
	Tue,  2 Sep 2025 11:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7gJ/s/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B595C10E67F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:43 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AiKc8015191
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=eAziRhwZITCfoOpKyth9/b
 vxKnzQJ9GiVsebHG4acH0=; b=l7gJ/s/FrO9c7rOdBehQ3lDEsDcToCsA1jWapn
 88nbf7UWia8GInbSmzFkce7rS4ZVXTGcGSCMasazMiWbaozXIisgUo+XjclOUEVh
 tzpokthFISXxtv4ygsS3uJPIS3GqGZ9n64exYXw2ZEictZHS9kDpE+uYkydxuq9C
 RSW3d0OBvi4b4g4YfXulRRYDp9FhbWpipH6bZqkWkHzILKeo/EaZ+4VuYIfG8KAL
 X7kH96ZuxMBjPft0/LIwwvcLaU4DMZmFAyOrr2FWUDLHxFtwmdip00LU8/3tV17O
 GqWFEqkb1grGvGK35EBuWbZ/n9nZWcyX7q+gc17WQg9bA38g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyynae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3276af4de80so7629278a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813841; x=1757418641;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eAziRhwZITCfoOpKyth9/bvxKnzQJ9GiVsebHG4acH0=;
 b=qaOrlgSvVjf6aHijQdG+Yr0vu1YSqebBhhbe09OU3bWa7lEzeNDgKsEWkawwuRr4aw
 DCCsEuwCY6zx4QW3InviZCaAAYr23RSoGe8xTMre3paxxdSfjCuQp/Bp4v4GNWQW7x8L
 b9X58psLsQ9u5x3uLycC5awBFgGKkqmoTj+SkKqoptpVEgLaxjBTQmxX1rTiRWrpEf3K
 mqiR7UmGC0VJmYTJuyPj9H57rC0Q7wM2PhPUx13MO5CIpbafkUHqqo887dejcDerUc4M
 yYfoQdMds2v1r4nW34OLkcxRyAV1tiO79fTa3/GBsKv2TlC7y62AzvIsmKAtNnWZHnfd
 hnIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp6iNJ9seQZD+Kk1plo+DcBHHmJsmnEiRqXqMJuyJ9SSzCPUqkW8v0lAM14SvUXc57bReEhwbEIXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu0ZYao7ndU/AD8wBuE6ccSANyQVOfcu3f5x51IGIdsvsOWUMx
 yyg79deSCrZkDNAZBPEyRGeQC0ZfUrXROJDdMEG7LWnfYSVYeLoGKJmy3HcOsE55AzII9pZj+CB
 nKtyBOJ0Qpg5mOYhr2M2zGECjcD4jQXzXcUo/zRfYvDE0bNAWr6IFC5HdBhRjB7PYkw5mOTw=
X-Gm-Gg: ASbGncubBqOtE/RI2qKfVW9SUTKKwn9m5NClvTydGwCdji/hEm8EEED6hP9vdGFq+sT
 TBn7jJFTpYyy5r4Ms+KwMvoXojZ4MtjwU76+u7EFOuYm2gWnolWaLYf3C+hNShmX3L+2zJXpXEY
 xd6XAkmtxM/LUQuK9hluZhJo0AJ4Gyb/RcjcG52Uvi5N3pTuqri2ixhmDqeqDPFhn9gx0sdN7UW
 Jq7tLsBDL6kD3e1BQ6YvzQj1vTY8hHVTDxWLCCZniDK+3JZwi+z9l2Wwv8mt/1JxHv4YQNaEzmx
 hw6ukX/ZBZQQQxcwl/wlYt918cBszHg6uEqvXZXDTomNuNZ3ZG8sPcVrFox3czL2
X-Received: by 2002:a17:90b:4b90:b0:328:116f:b124 with SMTP id
 98e67ed59e1d1-3281543c7admr18577441a91.12.1756813841061; 
 Tue, 02 Sep 2025 04:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ZMH+Vzg0wlRp9EAopZVWtcIW8yWlVtbtcynxk3++LYhebYu1Ii2WgJTBzPGGOljv90GvhQ==
X-Received: by 2002:a17:90b:4b90:b0:328:116f:b124 with SMTP id
 98e67ed59e1d1-3281543c7admr18577399a91.12.1756813840345; 
 Tue, 02 Sep 2025 04:50:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:40 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm: Assorted fixes and changes
Date: Tue, 02 Sep 2025 17:19:59 +0530
Message-Id: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfZtmgC/yXMQQ6CMBCF4as0s3ZMW21VrmJYlDJoF1CYqcSEc
 HcbWX4vef8GQpxIoFEbMK1JUp4qzElBfIfpRZj6arDaOv3QBoNI5kI9Cs0FDTrn/GCcvfjuDvU
 1Mw3p+y8+28NMy6eGyzFCF4Qw5nFMpVGrP5sbcrxCu+8/0LJHyo4AAAA=
X-Change-ID: 20250901-assorted-sept-1-5556f15236b8
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=749;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oRUzrfj+bFbJZIfg9yUPlnyYWmPonREj6xzhaQwtGK4=;
 b=pRDSyxIvQu+ZNc+l0Lj15nZLcXhUN3GxU8l2stlbBCWCl5j/py1iUWsNgeO9XH3jOXpi7EK9S
 8LyuQX/ThMbAwqDH5rW97j7IgK9O7FPneBCVzTIkV6Ia4Ulhw9t8LRG
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ny9-qb0LFNgruVlbV3cXKxst0B6VkSNr
X-Proofpoint-ORIG-GUID: ny9-qb0LFNgruVlbV3cXKxst0B6VkSNr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX8IdOUT6i8TwQ
 UMn+7cyAHhem9NUDnoIeMssDFWfLS6GZxivcEHzNLf/4oyBQp28nMv7HhF801aMXz5A7MsMSaSg
 K9HGcdHWqXiK3hdmjGmgAde0nSF+Dwop/Xl6KyOswVVQxPMN9dgGUws/4KZwAUQS4ZkLQKBiTZd
 Aykcox7kQ/EzZB/VRmzEBHmw3gaA6QfuOAypq74VAY4TYvZQ5j2WMSaXnzUaQGz7bxHZbsMoKi1
 5giKh60Q7ufAuUSqQRNZ2c68Q76NtrZQPdwyM5TnmnjYd+AddWvSxKvsCWNnqitFNXQxgG0j2Mo
 5NpzVmX8qd8pxWGuz339PWKCRf8M8uRj3bcQvjZrx43wFe60PrmT01LNF8lR1cEWyYSdhvpfc/h
 mieO2QQa
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6da12 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dW-ANKit55rmDTnjG6YA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

A few changes and fixes that were lying in my stack.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (4):
      drm/msm: Fix bootup splat with separate_gpu_drm modparam
      drm/msm/a6xx: Fix GMU firmware parser
      drm/msm/adreno: Add a modparam to skip GPU
      drm/msm/a6xx: Add a comment to acd_probe()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
change-id: 20250901-assorted-sept-1-5556f15236b8

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

