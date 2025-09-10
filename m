Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B4CB52292
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035110E368;
	Wed, 10 Sep 2025 20:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrU8KvlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CAD10E368
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AJ5snr023987
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=nWIoku7RCCmxR6hiLsQeRJ
 gxh4TQgexEWCOmvJvrbBE=; b=XrU8KvlU3vGyH+KjktquJW/5Qdf2u74w5e7fCp
 aeasgqh6UBtPmRY0Pd4JlThpVgJMYBBQKAZP6sNseY2UG3nVeKaunThETKPEE2T/
 GsvAC9/aXv3SUKokTYn24jrK3ZWS9kYfHtAZSt1AxFFmDZrTP7Bq8PvEqg+mGjFE
 hFD8j+G2tj49MfeijhoLY7pXcjOg+kS/SCtJ3S3cRZNheMSz3yzTLsZs8sFJyXcQ
 xKS7wUrdqvxSGJ9Ggi36OuMQ5RIOX5j+rKR7Blfwuvf2JdON8qV6oZjx3nZsAE03
 wWVO/MYe6Dlhs55BNcMFrPwSRZVfAWUsqzlOtewCB6Ae32Vw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h07js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4c949fc524so19159a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537067; x=1758141867;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nWIoku7RCCmxR6hiLsQeRJgxh4TQgexEWCOmvJvrbBE=;
 b=k+Gf5QQMoMJvK8eWN57JmYkjdGdgMzacwJ2D4WDGdEV1Lm37+0UKD9JwK4b4tRNpT9
 e0Cc+C+tQ4bYlTOwKfdstuH3gKWIGVcSeqWmEh2O7+0p07ylQ3+DmRJQKzJajyEqods5
 qDxNrVDoSh8VWBZlboDwncGqeTL+wp6mfcYwK+0pfwGt+D0souCGU+zlCa2vaPquHAgE
 dxjGQhUEp+bwEchkbU85MsTqKabtuM8Gehmdhq0nZh2dD05mzjvshyVFAKZ3fXVFvf+p
 rxbLFpPUOcuVBBZme6oBCPlWw7dZtQ9t/FhDCR9iLOU77l4xoX0qJI388bbloayanCpJ
 ZYSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI385iTRQpBzcckabfI4rs+9uxo8SPxX9HlEWcDCERph7vZWjJ4cYKBnPhMUvw6KQgo/wJW036ZaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy77dOOMB72wejXTU3yzomN/ZOQhpTgzNGoub+gd0VKT6/jVKaE
 Z49y8S1FQwaPoRo3VSjhv0H9sE8crWfFd6lgmOLRwU5qXnqsmFFEtsxltMV9JKPBQvAi1ywxwZo
 +2/Uux0iFSiBUxa+8zDCDDYvjKIbQ5ytCsS3xF+gVRV4gz4HcUUcPfiOnLg0aie3ie47SKnv+lK
 DOQxI=
X-Gm-Gg: ASbGncvwYOGTFz5d12cqAGNYsJaT3hMNQv92DG3GFHrkqB4VoTGe6PfNuyJMY7yiKme
 +G3fK1bWXn7NpXnqR+eDdrJHs76fqits2kFhWwUbQnA9VvqUtEaPUPWPF+nebpKkpsQIXI7cPXM
 k6pUvYeNoAoILQ2QC6rvKbpuQajT3bQxiDqBYTMRkVGI18v/CoPzXAyw38cKbPGvDyqKuYZIktv
 RFB2ymEgIbiIIhTcEcGaYnv5rLrwQatDC+kzf2IyA+NU612Rl5GpKl2MiMi6OU0JBWxzK2LaGnU
 T+5MPZyehSqU0zO+LmQPuSyawkreaaOvV/xdNCWGVigukTmQt1NTqGq/C8khE86a
X-Received: by 2002:a17:90b:3f8c:b0:32b:be68:bb30 with SMTP id
 98e67ed59e1d1-32d440d2749mr22619350a91.37.1757537066914; 
 Wed, 10 Sep 2025 13:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLzBx/C6rpXTx/AbKEdDRvKi+XAeJbA0oSLh+2R4Y6TD77ThmcYAVvMZfgGZ6ZPkjXKl0yyQ==
X-Received: by 2002:a17:90b:3f8c:b0:32b:be68:bb30 with SMTP id
 98e67ed59e1d1-32d440d2749mr22619323a91.37.1757537066397; 
 Wed, 10 Sep 2025 13:44:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm: Assorted fixes and changes
Date: Thu, 11 Sep 2025 02:14:03 +0530
Message-Id: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPjwWgC/2WOwQ6CMAyGX4X0bAkbDpWT72E4DCiyRBisg2gI7
 +4Ab16afM3f7+8CTM4QQx4t4Gg2bGwfQJ4iqFrdPwlNHRhkIlVySwRqZus81cg0eBSolMoaoWS
 alVcIV4Ojxrx346M42NE4BbE/llBqJqxs1xmfR3MWiwu66gxbuDXsrfvs38xiT/+K5V/xLDDBJ
 qXqVmqqlUjvljkeJ/3a3HEYUKzr+gUK+ao84gAAAA==
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
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=1041;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=J+p7EMrTz5Ci3v4cB32sGVNKuiRkVCCBePNgL++HPk0=;
 b=hvl43ly3LC2M/bCZ1O8Ib5iiOmQszyzcHxa1HmifszeN2jgiCGmATP61nlgRwPvXFFV6x013r
 ekqQUg/+U7kDXj8WEFR08JKHtAioiH86Vem1M3D/Cs/IK+d2AWRQ7I8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 84NLnS9ez8VUMa2nf7buxMoKJVt2tULX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX76hkEJr+L2bJ
 d2uxUU5Y5mSYG4mF3nxbhiY58E/NhBSKIlztU8HseuFakhX4NBlVbnqotB9/5jVxlKxTxIiKEs0
 LBmqIy1GP/xlzHc40Kmf1eeo28s2TTqDZDVXcCLGmDrQQy+9VZXoL5q1lo4pat88CcNpo5elXIv
 Hx1CQ3kizCvyEJkPdw6LhHCjMZjsUQ/h5LmmFsN13UBAi+xgOoxNfrSnc3Vr2n604OskEeGTjKC
 5KbLQoei9Et6QRtnefesKLJ+Mh1lROPhQ5jOw5wmJkn6hRzg1DoszITNOBpuZgSPr72B2Z5OBDG
 2w+hU7g1scc/qa9zssYdcQ9WxqDI/I1jmDZ0h2cHAPunqX/7uS6zEPStlZgpi+Snt6k6JtDyOsT
 ijxlGVaE
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c1e32c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vskJOa3sKGgw8GBTMRoA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 84NLnS9ez8VUMa2nf7buxMoKJVt2tULX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com

---
Akhil P Oommen (4):
      drm/msm: Fix bootup splat with separate_gpu_drm modparam
      drm/msm/a6xx: Fix GMU firmware parser
      drm/msm/adreno: Add a modparam to skip GPU
      drm/msm/a6xx: Add a comment to acd_probe()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  9 ++++++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 include/drm/drm_drv.h                      |  3 ++-
 4 files changed, 24 insertions(+), 2 deletions(-)
---
base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
change-id: 20250901-assorted-sept-1-5556f15236b8

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

