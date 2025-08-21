Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CCB2E926
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 02:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1DB10E82C;
	Thu, 21 Aug 2025 00:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aw5gBfz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84910E826
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFCasK007309
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=h/QHGAqsGwM2i5MHloplb39qjZWHbgGxp7s
 oSeiPiFw=; b=aw5gBfz9MKN9vJdrpHWypLK6QY5oMczoueFtm64ZjPpgTxdg/Sa
 GC02oGAioQJ/deR2sjjMx3Q0SjvzTjrYudj9s28UZhxeA0UzZb1RdJHIXqOm66yZ
 8wv1ogTsZtiDfIVrspslTr/gTY4frYeFm0QT5okVoaw9tpNucy2CdTELCTYF3i3O
 x09MuGSyYN/M8RtT7R0ewpcA++jSpGWU2sUtpnoNBA1VqWkH6HqIl6ms0FUfbawl
 QE0rnxmjUnMPU50orHI8/0XKkJ0sBxEqzbYxjr704ayXwbfWBS+tFhTZ6a2Fi3Qt
 wllcmo2m6huLXMt1Ujy5yFAbh87rCbMLN4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt897rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-245fd2b644eso7479805ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734673; x=1756339473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/QHGAqsGwM2i5MHloplb39qjZWHbgGxp7soSeiPiFw=;
 b=MrnG5fXKvSzQ3YeEa+wkV+thdpwgTni07KDZ5l+N0ycEHfjXW3iSP3in+rKM/B0dsV
 HPPYwl28SEgLoqCNhFe3Ul97wenViZ67iw1POZZuARPpihLLOCl4jExMaGawaRviAfO9
 wjFI7GZVf780unDT4Mcpzy1DYNG0LjjcQ+KO10EjwDpOBUML340YMetKgqDHNZiNVWXu
 hCocAdSWdEbtVs4V+8+EUV1DVtm6gcyypfk1SrWKapyudcekSCBA2t/5wuep2ngWxbCd
 7L0U5hBPPRr1rSoFWIvoABmkMBNUHXBncAbApG8Is8RThxFfagEqq820pV1YOAoghM8x
 gJbg==
X-Gm-Message-State: AOJu0YxGGhEdkfE8I+IsL7w228Ag0CkoEOcY9htYepHa74U9eMdqzf3n
 s8A6zSynnm0QISn2QuRbMdDAVS/s2/rRpzKYqkifoUE3xqT5u3k6cd+3cxcvPhWqPrBVC/sPd7Y
 fRSeQifLHY95G9fJUZNELWvIoexd1WPTwtki/E+wpzpabQD5sqwafZcuOYmejLCT1cG7CjZFQhP
 Xq2I0=
X-Gm-Gg: ASbGncvmwCir3V3eOQDc+E6X25nGwhTPTZGfXPzt/K5jFV0Gz5IBKjhCfaiQV7wMQfB
 TLpWTQipvQvweR0/V/r667ygIGBoO/kAUmdkGTcCEL5kkl2JcawG2ualKckYhbx3P+Bb1/A2nSK
 +W6EHhObW+CHsXrAXnKsHg4tUco8vSCtNZJPbLv280tIh55oGfYrJnzzAeW55UCNHygkiiKoL9w
 X75VynXEKymmIXqkP/UCqsUNKTX64+Yk31mOiuzHbAZGXUK9I9w/8dNztla3A0jTFJDWNviFbk7
 ztbYv2bSZWGKC277mJRPK1qKTMWXjPiyQbKTjoDOylAk3QieOPE=
X-Received: by 2002:a17:902:d2c1:b0:242:8a7:6a6c with SMTP id
 d9443c01a7336-245febed653mr8861385ad.17.1755734673261; 
 Wed, 20 Aug 2025 17:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK/r8TYTWkV3tyt9AedzmAuktOgPzvmoS7TFw/w6QgXED/i2kMdkuCF/pyGNYjh6kI9D4WCw==
X-Received: by 2002:a17:902:d2c1:b0:242:8a7:6a6c with SMTP id
 d9443c01a7336-245febed653mr8860925ad.17.1755734672663; 
 Wed, 20 Aug 2025 17:04:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c747esm37464835ad.83.2025.08.20.17.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 17:04:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/3] drm/msm: A few GEM/VM_BIND fixes
Date: Wed, 20 Aug 2025 17:04:24 -0700
Message-ID: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfXz2BEuij7ckPk
 05xzP4Fvkf72KD7jjnNL7WMGxFdhlKgJw8MgmOc5nHctH+xtxRVb7ofZGPWzuTeafTo+qpmtImm
 mm7bGB/j5LbrJKnX37yNBUwN3ZdZv8Zyu/tBEmkPwJNdrQwvvE9KWxRpOGFfZU1y30j6tzPRhwb
 evH2nEk+qBHRkIblUw6lqRJm4qi9d/LRHFerX/a+gBFv27LHZavQ7mAfnXoHPH4yLp6g8IpRAWX
 l+KFrkMWNNx5L+fCvKdpPsKMINSIMl/9PwFnthTs+ZBta0FAUu4Hci+FG/xHZKkXqSkRZrkf+AI
 WAXwUuhUA+SIS3AMHJLxNnHSmxUaIl3tXzkTJgwXg92d0EpUvR1iOjK5SgMYdVDkYSwLyshMezf
 x5d0kdxfLd80xUm1WpBoO8cPbeN8UA==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a66292 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=7-57VTQsmsoFMMg7Vz0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VZFBX7z9pzCECLBoAuJZWvmT3rvwHYu_
X-Proofpoint-ORIG-GUID: VZFBX7z9pzCECLBoAuJZWvmT3rvwHYu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
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

Fixes for a few issues found in vkd3d-proton testing.

Rob Clark (3):
  drm/msm: Fix obj leak in VM_BIND error path
  drm/msm: Fix missing VM_BIND offset/range validation
  drm/msm: Fix 32b size truncation

 drivers/gpu/drm/msm/msm_gem.c       | 21 ++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h       |  6 +++---
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c   | 31 +++++++++++++++++++++++------
 4 files changed, 39 insertions(+), 21 deletions(-)

-- 
2.50.1

