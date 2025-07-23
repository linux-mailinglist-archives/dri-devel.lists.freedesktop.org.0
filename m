Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE1B0FB9A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 22:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3E610E858;
	Wed, 23 Jul 2025 20:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWRprqyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D301910E858
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:36:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NIEGdU007918
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=fQlGpsNQCbK1gjPImdLDa8PKdhHdOTCgiKm
 ZdGjhm48=; b=lWRprqykiY3dNoJHCUDUIwgJjbf1PQBoUiRCpySgHHpmhBXAiLq
 nEUHtjsHFTqhcG17+u03DD89DwkcL6OBRQW9qQTzf4Fc4f709XF7nCC1CHWFkn4e
 432y9D52/PQ9zHewR9SrYaJXwKuJIWtazzjK8HjyeaYl7ZE1cqwouS0hrHjcbBtT
 TYIOirFTwKWnCXrAgGKYFCR3ZAg22mt/X/e3M4C3z1mt+FdrhkFsVGG9ZUAYf5VW
 b99JQeqzPRYxXvOFieUhbR+/Wzg3cViQwhB8ulU0H+coEqLERF28n1HkzpvhTuEP
 c9TmQ9VFHKTTfIqtugwNQW+39zKou0BI6Xg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hvgk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:36:40 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-73e732dff33so201426a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753303000; x=1753907800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQlGpsNQCbK1gjPImdLDa8PKdhHdOTCgiKmZdGjhm48=;
 b=vzYwLv3OUIfcLnccJVvwTL89i/fhVSZSsaGWGq73QdeTMer75x5gRWvxeAg+vu511j
 110Voq1AHtEkIGpQOBDl3oh56cyWAWvTsTbJhsB2RLcmko6wXpohzcH0iob2CQA33MXR
 ESW5ZEBioHjjlTi4FiLl/ZeK9TI2MDQWZnBihrU7UTZhydUjGoC9e453xiNURDXkQE1e
 NjBDLsKrAHjWz8cP9ycIBGUMnT0nb22LvpZ7O3dcUmpcnKgFZeI6Yr2F8M0lpbyFJzRq
 m6T9ZZ3wvTZ6VH4NeZUH3C/9PveVbYScN6iT2aI7iIUFVhwzkEEGS5aS3n5ogGQ6RNBF
 wuPw==
X-Gm-Message-State: AOJu0YzK2RzNpKy6CJFQ1k5UHFZAtPzrW2Tm7rhMjisUitW+8pjL3lZs
 Aesh8CLo8SnPakDq+xoN0ESI01QaSOXsu9hGys5PlF1YkAfO5VpfqbkwbK44IbGtxF8fo6oSM7k
 7WI7g4xe+P1dYSrw4MrHQ+xcNYlIqXYHhDwRMx5IFURg7PhkS0MXvqil3afLBoQ62jCOLPpMlyW
 Dhxwc=
X-Gm-Gg: ASbGncspoy5uRQeoMfF05sD9ahxXGXDttDQ0pn604ed9hMnCYK1PKxdSu2BlLOJC9HR
 9PVhQp05XaNP0l/Z3CByAj7r+HIBpCisFJBY6t+/w0Nzey+o2qu9ERaaZ2LozWiHfKQz7xE835J
 nhKMdsVaxWRMYGfCdTKmaenAjSi0jTlC18Js0er+LJUUUOQxtFGVz5gSG1XWiRdsK2W3dT3U/7w
 aWGsdJ0Aw56vdtTxo/wf1LFkJS5QS9tXDUU8pEBdwlEimNeMaaSAArQc+DJZs2ZvUmkFnTawJhc
 rMdYmYCiKrEtdtEFM0Jlk8X73CZztWn8241oyDT4cOg1ciVb3sY=
X-Received: by 2002:a05:6808:1484:b0:408:548:8050 with SMTP id
 5614622812f47-426cdacc026mr3291788b6e.18.1753302999901; 
 Wed, 23 Jul 2025 13:36:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY+35JICM9OLufVbYH7sIKIs/Pmj3SRnQsimqXzP4nhKSKMC/sT77ExrMVchp76VtVysP5aQ==
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-31e506ef502mr5027735a91.5.1753302509999; 
 Wed, 23 Jul 2025 13:28:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e51b93862sm2307868a91.34.2025.07.23.13.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 13:28:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Defer fd_install()
Date: Wed, 23 Jul 2025 13:28:21 -0700
Message-ID: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688147d8 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=jOvuQKYuLspqWEp0sh4A:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NSBTYWx0ZWRfXwmsuykO8ps7U
 TaWXDOZkl+yzQbsXcbGxbIXe0IPpLjv7TCeK0OZ0c69R6ojCBVJzFglKlAxEMYwtMnKXDSw3ZnM
 kwq23XG6t633H3HIfcD4KbJQtm1SDHVBv5zH02NgeuiHpeqbGj/48FrDFskl/QPlzqL8z6/As8f
 XqfyAMlBoPINT5Zm6Q68j/WA/P8Iz3T2o4uopDSmEMeqL+rc5XpRJWSPUCzAZkXzOqK3zgK9QqQ
 EiP8wyz6JJGe76KOEhqWf7a50L2kX+ucniBmMabciPnVQXINxZ/oNl2nxYdL+Me3SHKvWOT8D1I
 VRukdMMT1i3BwSsNV+W33/OyLWH8e9ebe27oqpvdz6jS5/LJB40uQSGvHsdLCnb1Y7CZT/ZSqT1
 mL6Z/BKZedBWAXQ+DLUgVcHqmKwBZ0QXR7qoa5cv0DPgDIY5f2tpR4NplPGajs/2bnb1ebn/
X-Proofpoint-GUID: OQUcs-amG7edzLC6c4iyOIDjoh-hKwNK
X-Proofpoint-ORIG-GUID: OQUcs-amG7edzLC6c4iyOIDjoh-hKwNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230175
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

The first patch fixes an issue that Dan Carpenter reported in
https://lore.kernel.org/all/55953f27-0762-4ef2-8dda-3208b34a5c75@sabinyo.mountain/
and the second fixes the same issue in the more recently introduced
VM_BIND ioctl.

Rob Clark (2):
  drm/msm: Defer fd_install in SUBMIT ioctl
  drm/msm: Defer fd_install in VM_BIND ioctl

 drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++-------
 drivers/gpu/drm/msm/msm_gem_vma.c    | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.50.1

