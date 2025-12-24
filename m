Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FDFCDCBDE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187110FEF1;
	Wed, 24 Dec 2025 15:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYfg8sD5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsOiPKdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1908610FEEF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO7IlYc678224
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9rZNuVa8CnntvIrXxV61Xq
 wtGpE082gcQ4QmaNOPH+g=; b=jYfg8sD5Ibj2ZDyYlUToEEvUn58NT+ISHl/PLw
 fMDQcgCW18hH4KBPNHOKK7fmruG8MtCBoPd4HIE44mFhl7tjyEptt60+e6lEVGjf
 M1psKMH5YBXS2WYY9rmwtqCTP85PIq4A8fr5YnAVg+DwFheNTKQu2fWz6lmWqxw9
 w+yKRpPQ/8a7jhQ8nsHTqAQw6fORC6UVhuFQiKYB3z+iY5TQynKH8wGBHpy1jIvY
 7LDGZQ5EZ/afw2uWpj0h+5ybv/lvy4XofZ6ORQKpKPSpaBSPVAOUjgUZBGeA9ZQ8
 rRfvtfRQk1WgfAnM5fFERdWSFubKVndiDnS/KAc1RtR5CESQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq310h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so152193341cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590953; x=1767195753;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9rZNuVa8CnntvIrXxV61XqwtGpE082gcQ4QmaNOPH+g=;
 b=HsOiPKdzFucyeNJ5QFbETUAHVMeY10GtuK92PiBEAUQ/mnebLm7cnR0kug5arxg9Zl
 oQIORVDg75OS+scSz37NDnuu5ead7GytdTugp1skWJBem3bXZddVYzAs+JnOkFJI7+iZ
 O9a/XI/zgFHg0yX2sQ5gE7LYdJguysBsQ8ydA1qgDzBuIP8QK8EDeYhXzM4wSJlrEfRO
 pWeqeMUyMXDKffM+gflDQf47H+ezQwGw9cxDvm/6KYGHPjgiDY7jwMgv8gvG0WYD04BY
 ph0EH+VkciVY7GFRklcErjpyZrnELEienVxqvxCoY+t8EXjQih7nPdhhW7uVMEpaJDnN
 JMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590953; x=1767195753;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9rZNuVa8CnntvIrXxV61XqwtGpE082gcQ4QmaNOPH+g=;
 b=OcL7z+NAYDSOR6iYCGBOHNGkmTmlW9epx2lIrxoYJwBHk+dfheWeLUcFdh1gG8RAU1
 jkh4FhGDowxbVy8lZxEmCloCQ3r2v5beIplMj1VjEAl1yv0dL7IeNxjeDarF4Rlgawr1
 LZsl12GYRKDtcQG4Jl6xqQAGGq0ikmVeQM8kzUDrmbMCaO1A3qvWJitlAlfR/aw00Kg+
 gDuM6gIKB3zZljOq+QXuNQmTPhmsKRufvlkpBHwCrwZFMzSLvYbQZYzrQjfq5ohrO5cV
 edhv0JTcqkpru/wHb7a/nRneukG7VwWdou3DbWhfV8AVtfnGLkzirZQabtp4NEp7icG7
 r1NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQUJCgC+WczkekkpDaRznpmV+DSWDgKi0HzfT49iWTkxJKXEvOiDAErG3JeM4wfi5OySYVUHeSiC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9jBXlPyHWBR0owjDXhnCek9o43GMNnDoIJ88VTR4XH0cVKYu2
 36cmdVyLKxk9BVOPtkOueo9f8y9ZNZnjNxhn8w8z+5jxrWGJET8L1dSPYdz9LuxbatJbrAOWsen
 twoBH+WnbL9JhRdfGISaVGG0I4N5BBgwslkT4Qfzc5p2EmqmV3IPlj/hMzuNoa9Cn2q1XbuU=
X-Gm-Gg: AY/fxX78j4b4IVbcH+qbxfn26VspeE9pdaHOzy7QnktjfQfmIue1KJMjlCKah91JmHP
 sdrvj45cznlQ/NB/8R40vxOCCcf34D217HWVm6kMujKsD02vUliH0MoXLf8BLm4ALub5I+3I5zm
 i0HKBHUBh1GHd+AttUPgv8LpHnPZUQmRBs0kXy5pzn5emiBR+w5kfsnHWy4IUcqeE90FxfvJru9
 y4+GEnBTAzKoAUFsPzdpLeZM0eS4aST7Qqwii1mz8OS0hWIlWpfR6+D3AmDYuXDbC6yv/Eqbpkf
 K3ggOQMJQ9n5nCyp8Oy1VdPoZkUU3cjsJHR2hh5zYsw1C5lGLbc9/tZZTlNiuyiIYHlmN/epdTg
 ZdYFzT6EbEEs20KCNeqWg/sNuNQu7VZbT7nwT9ElqNSvoyDw/OvMlqogx7j9VLV+xoYL61EJSpp
 uuWpIuHUkESAO2WOFURK8lCuE=
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id
 d75a77b69052e-4f35f3a046emr290626371cf.8.1766590953469; 
 Wed, 24 Dec 2025 07:42:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9tUizjNjvN5kFwIndSIXJLx9sAh9ZAO5ojG0j4Kg2S8mfGTxGd1zM7LXKlT3ZP+d5kvRqoA==
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id
 d75a77b69052e-4f35f3a046emr290626051cf.8.1766590953047; 
 Wed, 24 Dec 2025 07:42:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:42:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Wed, 24 Dec 2025 17:42:29 +0200
Message-Id: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUJTGkC/23MTQ6CMBCG4auYrh3SmfJXV97DuEBapInQ2kqjI
 dzdwsqom0neSb5nZkF7owM77GbmdTTB2DGF2O9Y2zfjVYNRqRlxKrikEgblClDeOlBuEiDqS8t
 zlefIBUsj53Vnnht4OqfuTXhY/9r8iOt3o5AQv6mIgMAbjnWpJFVFdbQhZPepubV2GLJ02CpG+
 lTqH4WAAyJJ2aGUUtEfZVmWN7k2uxz5AAAA
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ta/qYs32Jwfwx4ESth9/S8fiyMW+OEkbVDgftlKxaeM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAnnJcVsXVPewZihIE79PolVWhyQTJgV7Uofv
 3a+G7DuZKaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwJ5wAKCRCLPIo+Aiko
 1bYKB/9lkEHVrxnRw7uVQnqcVVNaqvUiHsIhfA9BC9YrGvHrRwkup9Tp6YbFZBeR4Fe7KUaNu2q
 e1JOapizAM10fdn5B3BlkOgciFQBbcuHlP1DoXq+OyUKpH2whijciN06mFOR1zmr2ZNIL4HOm6i
 /YkxrQNwWD/nl0UNnRmFkhpef2/ytgp82ArvkDQFrajhhOKWS5PPne5jBVdTj0XV1HDcwf+nfQa
 pcEnYKkG6GkXbv32l/cYneTqn/00Z/8fz75yLpQEGj5Z5+t9sLP19Gpw2KhNT07lNHt4I8wGftI
 FA3+5VrpTg+ZeNcwGtanHg7l9li7nJxNvL2jpu2ho4r95b+i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SDQhn9qCu2u4Gn65OHJzj8_-W3z-fxdi
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694c09ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mGs35Nl9CTEAThm_-rEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SDQhn9qCu2u4Gn65OHJzj8_-W3z-fxdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX3rg+CaGNTVmw
 Mhyr0vcSBRaTeahnQIIuRWCfAKqR4WGx2k6yITszc4/4XWTDZAD8Lgc9n+9rVpUCAn8hrwOvMtC
 zqdeeD9Sulw89xbowmSeQkDOfqUv20uuOfU7ZVEnRMg9pGWqC7pdCMJjSb/VHBu08s8OaRhGeKq
 xNv5yD2Nze3ITXoMNYnPodpQd7XoM4VODrWPV79i0PZSpTdCQiMWXemrNH8chGg50NvfQGFVAbp
 XiXy+uFD0bNLdy3EMANn3deO4LG1jSrHmall1qkAq+ZFs4i2OgQUTQmWap/8g1E55oz2V/eS7pE
 NLv4hCIBj4AfdVRiozRrs2HaTlXq9z4MYOl9GzUjgfmTuRQ77tvnvkLunCWCBLZYpo0FIwI72pQ
 zmGut8GskLvAaKSVBq7tAl+3jK+4hLv/VgGLYYodQMFb1K3DIsGKmGrTpT1dQNrM7mLR3VJf7zj
 +0FJrOsc6Sx0SdAG5JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240138
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

Fix commands pannels support on DPU 3.x platforms and drop support for
those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed commit message (Marijn)
- Reordered CTL_START checks to be more logical (Marijn)
- Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com

Changes in v2:
- Fixed CTL_START interrupt handling on DPU 3.x
- Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
 drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
 6 files changed, 15 insertions(+), 333 deletions(-)
---
base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry

