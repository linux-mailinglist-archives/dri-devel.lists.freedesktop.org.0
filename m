Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D7AE1DAD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 16:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CF210EB7A;
	Fri, 20 Jun 2025 14:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl3GmeIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03610EB73
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7HENj010240
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
 uErvpeQ4=; b=Zl3GmeIuf0dgfyvT0aSr9VnNCZ/6LpbW5f9OlDK4aCKSHamBuJz
 uPMG4E/kYChX8HWWeUK4RdZwyZdp16pbU9ZqiVF3ZO8p5oOSLCYli7BqmPl5A89Z
 n+WvQpRnjPXFmJvQeawf1PEwUxD2Qc+Thy/HsfOqWhOwjf/yMv3UWDEbjs3owgz6
 ua0YL+WHP7uD6us0YZHYgbrszrukHrC1Nz1eiDI2qpbSC1sHp8Gqm8H1wrLSilYr
 q6iaeu91vOIZi8CkaI7SE5rD9jucllprKZ6mowldd3+nRBPwIED8TlTY8uQe7NzG
 kvYifR59cDNOP+Qoaq/4V3mUii4UFLMXLAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d3401701-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235dd77d11fso19676335ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430601; x=1751035401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
 b=nPf6yMyiXo0gV7SprGU0Qk9mduz7uWaISrLaI52izdTLDojKlkwvw5kYaFBADK/Rjw
 HOaGu3/0suh6hBM1v6DufvLZ2ruLPbzpqwB+Lo5fZf8gGU8c+9BKmP0ssseNOshr6Vgm
 uFIok9wbiIHVeWz8976kFFFJk4Zs0mE8pPuNnrvgCfkfNckTo8kXPuJiMeR24+jVb3pl
 6gopKuWJUXrVh/dhuPy8deTqA14Sqr7/3LIPnyKcJ5ZkRQULPAPptpO74/SvxhvzFSV+
 YBgsqgCoi8j1Xoz0KaFrTRCp1SyEobfUjwCNJ62f3ksVTi4/ksB9w6xCuTx39ipNbfiO
 0Knw==
X-Gm-Message-State: AOJu0YzERkbss7NcmDO+bi19BYCyHf0IIawkasIRPKtyyGfz+tQTztRF
 gnu7TPG//B4q8kb4TofQUkukKtLSOp7/B/7lwk/NxfYaQCQCgP4fpcV6zVyed1dFMkys0/lUZNU
 vpsdF3omk4xWFn3BC4cbx5tqE4vs1HYjkVdJ/PMmdXP8qq0bvrHFbE+VUWNsxRnY7pLO7yqa8jM
 Yy+RM=
X-Gm-Gg: ASbGncu/4bm/mDz46I+JOAJJwyi8n633sIlCo3/+hEck5B2mBGfNVFwX2KJF/lptHlZ
 rXaeWmT0wr+Yobe7bnpIf6wLyTbHTH08bSN/Tm/OFatm3zb9jpkC0+maotXGcZqAUFfnkaoJmXJ
 m9AVCKKdP0q/NXQZcuXZh/lw7/EM4DNXRDYKSBFlB3ITo04juVO9e/9hFvRgJeKflJbscVCkRLX
 lkogCM89CoWAVmmC53z/9vKJ3z2xfb0vB/1gzjG6yFRPIpxttKVHbCw/63/3jTLMmjoZftjh02Q
 c7Jh2ai3Ukw/BaQCekjBHrvFvVS0K4/s
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id
 d9443c01a7336-237d997f3eamr46312895ad.37.1750430601407; 
 Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKsJtreskCbpXvBM14rVJruFPEilAe5QcPvqswZYUDdmFWdwF5fK+Gys5jp5oB13njFvevOQ==
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id
 d9443c01a7336-237d997f3eamr46312525ad.37.1750430601017; 
 Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83fc120sm19865865ad.87.2025.06.20.07.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:43:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/fourcc: Add additional float formats
Date: Fri, 20 Jun 2025 07:43:07 -0700
Message-ID: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q1ExJFTUjfuXuDlHcAwj6rEZsR5NHsQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfXzo5IkygLS/tK
 onRQ4M9fmhiG73c0Waq+prZKeL1COZcjTW61pyaO6dCHEuS0eh1CEjQtqXyO0yxgvDVjKUVYCHT
 3gJEyXxWLXyWgFMJ7o0nNCWs2weGvBFnExGZyjoDcjmMW7IzSrPTzMDW9KM1ksZMc0gjs+GQJGS
 QeFPVFk44IYZ0tpieAmT4tPJaZbvGXMfpVKmBLMEc3PqtY/E0Ytgc/DgF/4EqNwXEeEIi4XTOKC
 6QCCIjTUJQ3SQegeCouqzd92PF1e05BCcbZavozt2bEnKLBX3F79bV5r/QafcEQqaBp7DoTV3YQ
 UUVqAiy8C/+G2TXcE/A7txYz7fApVMf64usOMibFbDRmFMEiFo/GKRYjln10Vz+Lc7R8xq5e4RK
 QTKUNDYIpRlMGq8J3V3MeVB8JMOVVM3fHHxjI81brZ3rKaR0DlqRkkCUn65Uf7wA+fQ99fHl
X-Authority-Analysis: v=2.4 cv=JLE7s9Kb c=1 sm=1 tr=0 ts=6855738a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Q1ExJFTUjfuXuDlHcAwj6rEZsR5NHsQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=965 adultscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200104
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

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0

