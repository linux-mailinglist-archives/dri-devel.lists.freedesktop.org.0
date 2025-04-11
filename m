Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D7A867F4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 23:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB5F10E008;
	Fri, 11 Apr 2025 21:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+3yJCIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262AE10E008
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 21:14:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BEcF0e013878
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 21:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 92JOXCw7GPeB43zeDDjKUc5YArlwlhIU7W0D21HMUYo=; b=k+3yJCIJxlQ5L4az
 10oy2FpvhCQc90Q2zZDq9ka6oNPigQHn8TUI8Gg4gPPZLvxjcC9TL78nCzfJZheN
 VYfRR1n5TnQJ3WbMvgfE2rMbAcuV+10HbyRhrP2WkrGVGxaA36+Ofu2++usb3Fsq
 ywV+gx1//MCqUjciIiqye2cWBq6QIejYocMFpv5LReTJp98k/8y6+qcD8ujSPCSd
 DUo/mYx3gRV9Vz59ZAG8OVTCA6pOn5N1l5mCE6TU1r4oeivBJaZ3SgyFZ3p80XBw
 OaS8C1pSAVXW0EAbaHtcVmdFBvKUAAbfol8YgRL/CsaHVyLpoFW+RKyoqCRfYKY8
 xP24RQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbekqpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 21:14:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f0c089909aso41279446d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 14:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744406053; x=1745010853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92JOXCw7GPeB43zeDDjKUc5YArlwlhIU7W0D21HMUYo=;
 b=TQL5QDrmGCmKNGcbxzSJ9xuCvAxPUr2V/o/k1jxaxO7gQ2VJ81LAAgdiml2DuWO7eT
 00Tcvq+4JLL8GYw4+8sYvzHTo9l2eAT86O+RC0371DvH6fxU7WQKwQ2UZelyBP2yxb2G
 L7nokbsywnOR/5jFdW02yFJ3AgMNFq8taU0CbC+CdTWbXWvhyl6/CnK/yDFf2i99ym4G
 7gCQy7bM3ITtG/Fw90z45HIzMbXBqS144qsmvLXjt2caovJuZXG4pVX50uW9ieq1Qo0T
 kkWvnzo3NiUkfoQmCIKxwVIb66VhSwiAuvfntFWqMPk+310pwGpHv1M139kR1mVWHzAe
 ibhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6LgMIp5aJZULB+D9kE4E8Qqrl1YZXEzu+Nseqgb/+1KtKUHMMH7mZuE3OxpOVB+FUNmzWkikRFH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyeja0FyNX897xdh9q7sSRXGw4+XcC8ADJ0s4Ok5ASmEF0SnIrp
 c4TjdN5Cqeh51DU7kG+zgJzE8FNXryJ0sBi3T34K0EAJBtu/LD8edRdIqvGjAqcz0GzdzNYgtMj
 Wc+8hb7U89gmiufF3rpwwsj8rL7rwzqoeJRzLEKdeJfB7j+dcqTgTo/qrUFwZARllTGs=
X-Gm-Gg: ASbGncvFv2G0Ajq7Lfu871ZhV5fZz1pXmpkZcO1fi5DG4Qvs+DcRMfsHiuKTSnaN/Cz
 cl3WvUqs1uVuCN1VHRRyIkdnZSO9KUzcLZFjDWmgtO60GchkeNPRNDsJa/1YFSMNEhGJHkqsxqo
 QAIOYR3zt/0ffgL7gnUfxYx/7u8at4sTwZpUmXcDfH1DCu4FQJKOamrAz4pyVh3x81iwnOPbcqF
 PxIDiuE7m1e+sASbSkhW1gOlXcoKScuI1n+7tWcwRAervHdVRr6c+uFHbz7malWB6dJsRlrJzMg
 FTYjljZ2dDUVmmJUYzLLaHnUclA75DS1R+nneGfUdVw6RYFm4hn1Qpg97p56AEo=
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id
 af79cd13be357-7c7af20babcmr610962085a.52.1744406053010; 
 Fri, 11 Apr 2025 14:14:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Cts1eb12qp8Qm/XF/8Jlw3D1SD8yryZJ5hAKDoT3xvwdBsPZyvVLM4xIaHOUKgSaKfe89A==
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id
 af79cd13be357-7c7af20babcmr610957885a.52.1744406052639; 
 Fri, 11 Apr 2025 14:14:12 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d51138esm510288e87.205.2025.04.11.14.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 14:14:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, kong.kongxinwei@hisilicon.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Yongbang Shi <shiyongbang@huawei.com>
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 drm-dp 0/9] Add HPD, getting EDID,
 colorbar features in DP function
Date: Sat, 12 Apr 2025 00:14:07 +0300
Message-ID: <174437604934.3805099.10574399938467598929.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250331074212.3370287-1-shiyongbang@huawei.com>
References: <20250331074212.3370287-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BrfmG2In5dvV6WLYM8Bk9RszxBPD7gC0
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f98626 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=4BOo0Jww7fU-brOJr6UA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: BrfmG2In5dvV6WLYM8Bk9RszxBPD7gC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110136
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

On Mon, 31 Mar 2025 15:42:03 +0800, Yongbang Shi wrote:
> To support DP HPD, edid printing, and colorbar display features based on
> the Hisislcon DP devices.
> 

Applied to drm-misc-next, thanks!

[1/9] drm/hisilicon/hibmc: Restructuring the header dp_reg.h
      commit: f9698f802e50fbe696b3ac6f82c0e966574a3edb
[2/9] drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate, voltage and pre-emphasis
      commit: 9e736cd444f49efa2334e405f7a59773ea02155b
[3/9] drm/hisilicon/hibmc: Add dp serdes cfg in dp process
      commit: 5f80fb4d6abd1f7f4007e4bf8dd75a8c71d2f724
[4/9] drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
      commit: 1e7f35512e77dd7276e91ade4e03807f88b97eb3
[5/9] drm/hisilicon/hibmc: Getting connector info and EDID by using AUX channel
      commit: bd1c935811ae6bd112321c50ed83444eca4facc8
[6/9] drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
      commit: 2f6182616cfdb154e2ecfe9554bb814b8a6378e9
[7/9] drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
      commit: 3c7623fb5bb6c319531b941b15b7bfc12455d3d3
[8/9] drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
      commit: b11bc1ae46587f3563c47078e605184f18e7fa57
[9/9] drm/hisilicon/hibmc: Add vga connector detect functions
      commit: 4c962bc929f1734d209a0862359e25fef8f56fa0

Best regards,
-- 
With best wishes
Dmitry

