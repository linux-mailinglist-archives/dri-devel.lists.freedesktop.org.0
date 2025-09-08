Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B913B499ED
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5DE10E104;
	Mon,  8 Sep 2025 19:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bD2KKydy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96F010E0FD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:30:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588DGdmV004820
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=DBYI1s0Kwcsc+/IUwfNSLMfLO+qO59pSIyk
 O91Hb1MA=; b=bD2KKydy0P6KX/3DNWpba6zELRUdSd7WvClpkUSAmJg/sT/0d2i
 9SUxhFAcksIG1o93lwlbVwxNU/SX0CGDd1i6WRmeWeNLfpS354JjMFQGuC6ejBsV
 +oa2NbkvX6kFWWuGP0D533F9pRyF+BDAfok9iOZC5FcCqWO39hKamZiauFBaXrzW
 uJ8YKwkignKXrthfIcRiL3Zg8Qi9fHDZioVsr5NNx9rI3cv310b5z35f+FU8QE55
 0dR2jLA4Xnstm1ECuMMdxyU7rH0uOFFNzKQrOVoM3BVhst70cSVnHqFO3p++lbwo
 AIO6GxSrH0yuWSmmfXN8g23cQ2C501arY+A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37t7sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:30:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24456ebed7bso70850785ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757359829; x=1757964629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DBYI1s0Kwcsc+/IUwfNSLMfLO+qO59pSIykO91Hb1MA=;
 b=nDG9ZM3Iobuj06cK7s1RVhk2mFiyI7dbagBPvUgzWkv8F9m70xDkHdtvoEmudI+JOW
 Yu18lQfE1XdDyuAWWo/LvhOGBCK0UeMYd/SLjUojN0doWq6sw1MbUExT5mxApICtG973
 Hi71a1yp1ByXC74mVdz1sQTcRXs4VZgKLA16/ja8TzCXvPv8a3VqW4IzsSP78mlLUyxt
 Y0m1WAiwtkpv7vlUhFpInGxhdnkWv9geMxVjzH3DtL8iayrw2iHsdspTJhv66Lgao3YE
 8OcHRvTF8X324gy04ZI5uw5XAJc/3KEFMiU1m3MzqmVHngZkhJpKcJ2iLY7HOHWOQg1y
 IhjA==
X-Gm-Message-State: AOJu0YwrXPvrC43tpniW6G10UTdmm9hgE1S7SCejjde4+jDMBBE+OLPg
 BvQoscBJUYNzWQj/ohrxCp2Y9/kZfEcdFW6nvRYRkpo1Y/6QSu5nDfKAwZ/84ZIRoi5KvbXvzh5
 W9P6Ah0SjCnnay4Yl3m2TDGrtrDNZJrZGzlmCUm1XEaEFIW7V7r3hzXRhJOwcNePHZ1lHBQ17bH
 07QrY=
X-Gm-Gg: ASbGncsLxWRjc2/VL/+Cx66wqzJc7r55Pmw2B+ALW2UoqVVz+r5AqmvChzWEx0m4ny0
 e+cQlYbJjEQjuieBR5RhsMetVEMDTWBO7db8EqUBmG7TpNAC+GWgqsET0Nyoimr0RNt4J11P/6+
 V48SvQnjhwD0CB6+YZO4oTZmSFBKq0TYKmGySHqzoPyJAnFI/2JBbpNsq+1jYiSWQt/k/wrdY+H
 ApUiOfTbLMmUAiSPxeNo45BWroYO2n08LPlf96I6i0EKoNc3JbqkrRQxnsAEx7EELKusEFVmEn+
 BUHoH8DC4mmAyY8QN3LzIoRSwHUt4cTTyNCP4pzy0EMXi4X9E0Q=
X-Received: by 2002:a17:902:d58a:b0:24b:270e:56d4 with SMTP id
 d9443c01a7336-2517427c78amr113285345ad.4.1757359829210; 
 Mon, 08 Sep 2025 12:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Ni+T7orgU9Tutacd+01JeovMGTrJRiaBNcvzJAbWLaTKOdvcEbz6Jlp0yDTmRpvFr6mVXg==
X-Received: by 2002:a17:902:d58a:b0:24b:270e:56d4 with SMTP id
 d9443c01a7336-2517427c78amr113285065ad.4.1757359828730; 
 Mon, 08 Sep 2025 12:30:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24caffd7beesm136191685ad.121.2025.09.08.12.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:30:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/5] drm/msm/registers: gen_header.py and regs sync
Date: Mon,  8 Sep 2025 12:30:03 -0700
Message-ID: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kYoc7a2kdPmI9SWB22clj9qM7Wt0DsBh
X-Proofpoint-GUID: kYoc7a2kdPmI9SWB22clj9qM7Wt0DsBh
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf2ed6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=E6oEVHbn0fKM42HpNhsA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX2rEMs/ToUOGB
 zjbF3LfbyoZdvRsUBYSXJ3VKob0EbNGumPcWkXb/oq8snTepqq2JXBcFLxp3sWVxyk2hssJK+8j
 XkoV+W4C1aMQ8yh51SOTjeSIpQDbFr7ekEi56ImmiwUSlK9nX2hKof/itJewdBVz/G+GEkdOULq
 itQL64TOLeF5BuWVIqrqESFnQWBGWb3y54b2R63tD+wW8g2sIR0mxaLn8acxvzQ57/xvEe2t+vm
 X0nAgdaHCYGbHUHmDkGgd+Lx4E6WfJdJavEsouX2EPuxjOCRn0THdH834gS8Nta8xRKI7szLzBf
 hcjo09IwYk8c0RUXUrfSGfjfsqxNpbenIQ6oM7ny9dXAVz8/XBxsD+viBIRWL66+3vcZZtek0rc
 Q1XQcxEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

Now that https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37216
has synced kernel side changes back to mesa, this completes the round
trip by syncing mesa side changes back to the kernel.

Rob Clark (5):
  drm/msm/registers: Remove license/etc from generated headers
  drm/msm/registers: Sync gen_header.py from mesa
  drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE an array
  drm/msm/registers: Generate _HI/LO builders for reg64
  drm/msm/registers: Sync GPU registers from mesa

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  18 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   4 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
 .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
 .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
 .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
 drivers/gpu/drm/msm/registers/gen_header.py   | 201 ++---
 8 files changed, 639 insertions(+), 581 deletions(-)

-- 
2.51.0

