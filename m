Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00588A9A7BB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FCB10E788;
	Thu, 24 Apr 2025 09:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MH9YFkf2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D397410E788
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9md005869
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mdFKARTvqJRU85VFGASTX/
 BrjRGA7KGz7eyZkROJh74=; b=MH9YFkf2PNBe1nCT64lYHUMC94AgftSO+8aaz5
 ysRVGD9YRrBvM89V/7o5eiGq0CWxJmwQARgAgdMO9Gx/slZUP3iiEQAvSQ00bCZk
 gJXOSoh5h2qvRA5trcj8OQT/jM151RQB3u+9plb6S+06J30Zez5ilSrPT8xn/NEG
 REsKn+by/DDB4TC1/HiWnID+XChlxKXwy9RN8iQ2Tz1LO8Xxf2c3JSuZa1Jb3dkr
 0gLLCwhEUV3b1AajpyrrQ7nD6/tQRmrg3LA+VpWekKkpC/SX26RujJPbX/DJZIeV
 yobjD6GSLKltH5CZtuPM9rOv2UgCKZxrWPLkNaKEb34hSdwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0501p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso357337185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487027; x=1746091827;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mdFKARTvqJRU85VFGASTX/BrjRGA7KGz7eyZkROJh74=;
 b=gthVwzeL95/2Bsm6fzYnPkp43YExLrr1EUMehp07j6wuEhB4PdBTNCKssV/gFOcPlE
 E6/BLpHemPWi+S1phZgFgOAMdA7uNf6urQ1lP7egXEPsrQgfpv3L/6wgnCGig+mnAGiH
 5E8XplVwPNUe29yUDGNKBAUBKY1LRiKgNlLOhpLxXVo/WQVXJx32/T8KpldE7vU6TWYP
 WlOKhUpthOhq1Pq7K5vY/AB4R36nS1st6pxeHq68VhxV0+/hSZFcQEQuF2IlwGediI+C
 KQTjHvjAY+Y3kBt+K1TcNFBXvhEphdmyTYttjTyO4S7E1Ezo7j7NW7WRyJKLX8hkCIi3
 YTSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKXfDdcOaKGbbaK9aNiGgXcKQPSf4hDSmgrRIe8HXjFDHNaDWwQljNlaTpRjAK04+v3Oy2J3PhdIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNK7VhtN1oDXlJaG7r6w4FTUYsvIZRwCAb3hDstnP50dUbr3SM
 9nRHfa55wzGqlNf+MuED4R/tJFlcgfAxwlHQPXsBSKT6aTr5j+w4kOaplsAf/aG68Ptuj1ewtUv
 GLIwPXTy1LsZxlUE6RggFXkUaUi+tIGqgRRHUlVoJYoYPlzGnheZaQQYHta7ADJBWLv4=
X-Gm-Gg: ASbGncspH9cREAtDo7QoypSOo8r8lQ4NfW5i/CoOnsDreHWcQSZL7h8Pg0rKtTmZJSc
 hS1QOYwFyBRVXrahROZj7lzhjl+jLBYKHk2TScHscoQHB9T/o7kfutRLjmJ5MBxaGggdy9ak3Li
 9VbYs3X5fqELcF7+uZ5T5W5t5Ct2akmhPtunQQx28VS4hYOv400tHWdBa6gLfA4IrFXfKWEZPfW
 1LqZSFNJcpX4Sf5JYdbt+pRTnXvwQSkRRfHPa1wX3KWzWSqR72dGviul21NiACK9/9L0waUy1H1
 Lr0o75DcuAzhnrH2TDkTPGdDvbp5BzK0ozB4et1pf5Y6nyeyx6GEDrmQPnbTnlGEZk4HTBexCfG
 xvLGZhC6Lhbfi6oR9d2Nh3sDo
X-Received: by 2002:a05:620a:d8d:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c9585c3627mr231813385a.8.1745487026891; 
 Thu, 24 Apr 2025 02:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi+hIk13tP7X3JFysQYRZL9wzlB0PYuK3MY4tcZkB00aOZ+nhueoTS5+WGo2UG0/XyfGtNZw==
X-Received: by 2002:a05:620a:d8d:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c9585c3627mr231808085a.8.1745487026402; 
 Thu, 24 Apr 2025 02:30:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/33] drm/msm/dpu: rework HW block feature handling
Date: Thu, 24 Apr 2025 12:30:04 +0300
Message-Id: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwECmgC/23NSwqDMBCA4atI1o3kYaN25T2Ki5iMGlBjEw0t4
 t0bBXduBv6B+WZDHpwBj17JhhwE442dYvBHglQvpw6w0bERIyyjjHKs5xVrZ2fcglxWBx7ngnC
 tOAAtShTvZget+Z7mu47dG79Y9ztfBHpsLy270QLFBJdF0RIhmGpyqAYzSWdT6zp0cIFdxJNk7
 JZgkSCylELIvOGSVdb79LPKQdlxTONA9b7vf9f6s/v8AAAA
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6188;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JiostKcDkuFpLVkmdxK7KpMiLzBVDWiqnJ02K1ix9Zw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSpodNnZJlAQgkh/BQjO+u7z3laPoN93JfS0
 8WDe4JNGh2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqQAKCRCLPIo+Aiko
 1dJEB/9AAt/j8uVEKrAglDLjeuHt49Lp/OZwd2I6iRCvII6no5twwQZPXOt8iV3UBbG0EX56+Xw
 tZliLyVS5xQUh81mBdVopL8VpjrWQ/LUI1e+61qm6iHwUh5n1PAVhK89djM1UkMpOjQi0jljdDm
 MgTViTwylecK7eXZtEAdlv2nWhcQ4uucgofk7hnjTybB1Xl0HExsBoUDG729fLTqz1wTfUd23ZS
 5QGcPWfQqbMbmQXr+osTEIbETws7m94p79F84sLLFx2zUaaO49kJhKBNQAfdZzg+an3mZxbzQXC
 fS9Grki2yAjYHHzs2ahEksXgzr6Jv+NV8FeEU+C8P07iFz2z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfXxYM+RbjrlBdt
 LcOy5EPK+scx0eBxaTzzm7qdsp0PyG08BF6Je/RAFzdgxnfT+dT5ioNAYBrzpJJYuMukJYococO
 AwWUJc2QTnkU5gJNeOmWIo19AbC1KoidCbaqhbsMLTg8gP+rc4P37c4p2sOXttBtDNDKaYFcua7
 FuqVQTfe4eXKaKO8gbSDgsuWZ5bOm3jMzPcbdBBz2Yxaz5Juxrh/HXp5CO/M25m3mJvnzLsTcpk
 mRbfNM1Iy1QzPtPPl5RD9yKZ3mOiZZORdWs9gfIxPeFSJ2F88Ze8G1BVyBl1zxXk/W2B/Ku+TYH
 tfHdJjV6pPeK4IrhnRa/H3Rpb86xkPkj8U2X9yURMsBIVM996n4DeH6T85MRVkY/MknSxMce/dL
 KabbViXsOkmCBkUzDKEjdTp3Lsx2BVXjMxyIlhiZWis3sYCOT0gqqc87+G02PKtMDtotYnZw
X-Proofpoint-GUID: dp8Xg-oU-8cbQGccXBic6pkbuLd4V3l1
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=t8tNeZB39Io7CcBQPAcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dp8Xg-oU-8cbQGccXBic6pkbuLd4V3l1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062
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

Some time ago we started the process of converting HW blocks to use
revision-based checks instead of having feature bits (which are easy to
miss or to set incorrectly). Then the process of such a conversion was
postponed. (Mostly) finish the conversion. The only blocks which still
have feature bits are SSPP, WB and VBIF. In the rare cases where
behaviour actually differs from platform to platform (or from block to
block) use unsigned long bitfields, they have simpler syntax to be
checked and don't involve test_bit() invocation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Repost, fixing email/author issues caused by b4 / mailmap interaction
- Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com

Changes in v2:
- Rebased on top of the current msm-next
- Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org

---
Dmitry Baryshkov (33):
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
      drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
      drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  53 +++-----
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  15 +--
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  12 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  21 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  43 ++-----
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  45 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  31 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +--
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  44 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +---
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  50 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  53 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  52 ++------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  51 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 134 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 108 ++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  17 ++-
 51 files changed, 304 insertions(+), 864 deletions(-)
---
base-commit: a4efc119e8149503e5fe9e9f7828b79af2fe77c6
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

