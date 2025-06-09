Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E3EAD2580
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23ED10E3E3;
	Mon,  9 Jun 2025 18:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4EfG6uN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091610E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:24:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559G4uYf026905
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqS
 HdRSlSds=; b=m4EfG6uNLOS3in7c9iB3D9yYaSBHOYE1bNwECfdGZ9rDht/MgGa
 BubiCZDzL3eHEL3wp40+CVWshA+T6MPwauhU1o89c2Aav+SmAb+vV7v2QjGi0kQq
 hbZF2muokddtS+Yt+YBQCymPWgUKnt5Q1YQ+3cvEufdgUSG+xwIBkfbroo7UGZQE
 AsJFQGIqNAaHl7GvgibvzHhnv3hPXPUhd4VZKoDDqDOMyAZWt5MgfiYuSbu7+jyy
 jXB0TUgxxPZoZaA7cAmfUbcMmTYaa5R1IV17OxOgdWADH35bL0glScLXihZP744+
 dS7aNzzfmsxgXSBqjk0L5/AR1geg9r0s/zQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4762tg0ahf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:24:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b2f103f6074so2939373a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493483; x=1750098283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqSHdRSlSds=;
 b=dzZEiSYx9HOfGrYrGDJcAqcqOSm7d+DNuNmXnp8QPm1df9xtB9El/Lb+soz9Ou/wPY
 t3oMJBbMh3Y+mecns29cYQVLx6s5yUpQLpoirUeL43mupQfiLKr1rZqDfNhchP1M6UHv
 prf7He6YYYfbr9kBJ61MqhtrHzcxgCZ63boSd0fcECHD4jddbHF2j9FXRdW9qSEm6uG5
 Of901e0fYcD7xtWWwy+Z++GDgNBzXqvCkgC1A6E26CRq8LE/8TkPsz0TQubmd51Pd7fw
 JckU+hPKphM7iSi3WzjCMcmen5b9IO59d4/JSe1gsLE5cG+9UHp56mHfw1nopziLD0/Z
 O7Ng==
X-Gm-Message-State: AOJu0YwJ+PdCTf5qxEKU6wiweOZBEuK2rmu9ie9HJH0HfpAnbnufW5nV
 oLs/Fzh22RMNU6LorGvjB4wSD4D8/tyAX15QkxKgIQbBIbGDcEgTUcWeWjDS1429Sq8us56e0Hg
 GMGnSYx1/dG+Ki5iXUCsEj9+AfVlVjIweExp7+0L8Wt9aFPT3QSELvNMRwWrBDFbjXVBmpNMdrS
 4LWTA=
X-Gm-Gg: ASbGncvJcgNj0GdygRfsHDBg3Ib1j1cpegahf1MVI0MDMdIJhZ2aRxqiml1uYr0f8rH
 8KSfoMzOYwJki7dA4izA/EmGgYid+Fp3hYeK3Qd71bAKH7Pz19GYaXbmnc7SBQIfrRuzdETh+vT
 sGmpfTz7FZp/tlZUsMWI38DjG/OmvUY/E8ywsoOuGLqOx8+9A5ORhyLrCT1sXGMChSjy9KUa4ks
 4RZ2AMClisJe6Ckfx2yjsAjNEzd/px4W6ez1bs12biTdZkmlpIO8dFd0/IXIbHgNkd9ajUkk4zW
 u5oZP1hc+5cN/SsltuIV2Z0KNKRwfmXI
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-313472eb25cmr23479198a91.14.1749493482787; 
 Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAvo/tjXFuiSwnF2ZVZMq2U5wnwRopkRd0199rUIbodRRW1lfymiGSTQN+R3i5xVj07EsO2g==
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-313472eb25cmr23479155a91.14.1749493482379; 
 Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603092640sm57210175ad.54.2025.06.09.11.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 11:24:34 -0700
Message-ID: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZPyz/t c=1 sm=1 tr=0 ts=684726ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX35dY5sCKiuoH
 V2Cwlb82dLru6Zz7PHvhi0ucxRtxvhP9sL48enW6vxim15csklD55xRQizINOeVPek0vI+xCAiw
 B4pfxVZEmiQbJrPWffhQS4AQE+EutKff0wP6sT0JcTTQAzerqQW6Q+2TGao21F3r9Zu2CEUshLb
 8luDEf49Ee2vmyaCwBKGrMLWKL6TfXIYKvvC3QxgPXGN1xzryqXp//Sn+D2VubgU8DlmwlW0T6U
 lz7cnBi2i4rTZJX9mbfJHzF0svi7d5i0qOvQ1pu3tEReVXfSxu7eEl8K9Ke7SyuxAmAgBaIxzml
 0v5NsvdqjvX01iBweWKlwZsKM57vTDGFuM/w4/dV8HYthYwRxc8EOiyY+DQbcBmpv6PJomxjMWk
 2lwJpzOuiwGL+HU6Ce0kIuo+9OxwCjjy6ENicDt1zCbE1ddstKxFSzLqvRyb/uEkTTTXflD1
X-Proofpoint-ORIG-GUID: o3r3s5D1g0cWUwn7vyZoPx0UburjGGPv
X-Proofpoint-GUID: o3r3s5D1g0cWUwn7vyZoPx0UburjGGPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 mlxlogscore=671 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140
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

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

v2: use %pOF [Dmitry]

Rob Clark (3):
  drm/msm: Rename add_components_mdp()
  drm/msm/adreno: Pass device_node to find_chipid()
  drm/msm/adreno: Check for recognized GPU before bind

 drivers/gpu/drm/msm/adreno/adreno_device.c | 39 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.49.0

