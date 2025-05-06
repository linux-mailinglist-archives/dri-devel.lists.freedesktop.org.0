Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10336AAC47B
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A19A10E0AE;
	Tue,  6 May 2025 12:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fla+2EY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A4810E686
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 12:46:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468njSL007590
 for <dri-devel@lists.freedesktop.org>; Tue, 6 May 2025 12:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=s8LAgxKHfIowCHbl7fHsltHs
 WVZDZpIwWU6cSSmyqww=; b=Fla+2EY+PqNbfYLWCRaDp2Vvig6v/swcKhM/0j+Z
 HUkVAAxEy3W6RkZYMqbhKad4VYwjYeJng0Mwr4kp/NR8CAKRQZhd4NgigNSN71/G
 n9ev0anIsNBm38sUl0d5zJuybwAhZPyc94mlRN9ppWe75bjzWAoyunDVoy1B9j2i
 7k82wYLkYjd9u9tiusZaeta7TIaM+eoV6Xq0L+hGBwsqSgbODOzK6mFy/Kn8gqVj
 LTYNL3FTTNJE3GgAkTnihJ403S5/GoSRdgHd3unEmGBVuczUEHAk1cJHqejOUyYd
 RxtKqjWFErn9sezC4Q+3/BwXvDY0ZSYdTcphXQOJHBBA3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg286m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 12:46:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so1216667785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 05:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746535609; x=1747140409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8LAgxKHfIowCHbl7fHsltHsWVZDZpIwWU6cSSmyqww=;
 b=fDqoYh3Dg36Tpajt82M3eVgKxSKjc+mBPFCv028kDfYC5XyxdOds5HhpRYok0Oow8m
 NKqD49z8C3WB6GVRwZOa5b46/9B/XLAP1ghMXENIQXNm0iHNs6e1UFuGxuj7fXUYhpVL
 10iNpI8wk1u5bEdBvES7LmcKetwB8Jo1NsUKJrj6G36kmB91+kDun2kzIO8b2u1tKlUI
 VwpU3lGjdFpJLo6GSQ6Y74xMxdhJHIfWrK2JZCcp1LsMjyva9Um69N3YgDEaSY0gPeP7
 17o1ZTEsFs5jthUgC5WpiT4cG5kB3e8hsMz8dA1kWGyUyRi6xWUQkL1LI1SH0WKUVLmp
 xetw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHrD30fBo8XL/Jvs+wOErtF1QmO/bTQfPcYugzb4fTG3WEaQROHdud2WSD26o6orUcgCI9bHp3IfA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHM2XLimKQjNqHP95aJfEUnRNzEX3uWPdnpXqzhGvwAEQ/R4m1
 GaLA0qhxtiagHLZNWiHX5Jj/fBH6BlFF9Ouq7G8CNlmq3OLmlIFtuBFIMy5x849BEI+ZSAPWYzJ
 BO9n+RdOQF7ZO1n7GMezxzS+06fCdcuaL1XknsC7qE8RjHljotaoK0YuqFXBIXP3aqdQ=
X-Gm-Gg: ASbGncv/bARLTQ9zcEzO/6X/+GqJ4I8hXSSlabhzv6BOtHWzjFLQKXGD9THxCAokZDY
 m4C4ruQkocVBmdXZ4SyTjPumLzv2l8241QzrYTdB5GzvzBsVkh77kK2gW/hvFIWRqqrygUe7/mr
 fAS/eZ6Rs3/jD/9kwWnxc4mHuv5xT7XmIxM65DbS667sESNLptlwBVikFYnFZApJHMq5EtA2ppj
 4ov+56x31l7U99e/NdRqOFsYdwPGD1UF3lyPRwcFX+pB6ihtxZOUCU16pgssJe2MIHpUaSLT0ph
 tCpPRpsE8AJO7WgN/xLwTW+6E4+2VLDXuaLZhXOU+YFJlsAMH3FXQFeJQ3XJImDiy+Y0Im7isV8
 =
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cae3af02b7mr1660807985a.43.1746535608903; 
 Tue, 06 May 2025 05:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyWxuua5BKalkEEhM5qbCvvqozj2lmbbu0fVhfw2+KWRFUTmuT0ZnbNYEno4TVgRYgad0fwQ==
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cae3af02b7mr1660801785a.43.1746535608440; 
 Tue, 06 May 2025 05:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202a89ef28sm20222291fa.76.2025.05.06.05.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 05:46:47 -0700 (PDT)
Date: Tue, 6 May 2025 15:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/33] drm/msm/dpu: rework HW block feature handling
Message-ID: <fqozl3yxbq4lxdhdadsuhdbibj4qudungmgu6za37qfkwq7yti@lhfm4gz6r4cs>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
 <342326dd-3739-4a8f-b83d-fe21bb67b46b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342326dd-3739-4a8f-b83d-fe21bb67b46b@quicinc.com>
X-Proofpoint-ORIG-GUID: Qco9O0SkWRmV6icvZVgDXzjh1Mj8e6T0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMiBTYWx0ZWRfX6yKef5k10cfw
 uguBLo0DfW3SZHHUEtauSmShVyu5sIHhU6H0sMISOX2xbuDE2hQnKanM97DUzY2aOYWeUQifu2R
 SVVJzh4TxHEBYc15/2N9CylqHeUFGA9BwGsgVMDNgHtciwP1Pq2PvvibJDciJ6oNmyAs/tUMwDw
 9I/lq87e877iAV0LpZbS1fYiEYSVHM0Zynz2ZOap6+AnvepGuV5vukd/3J0RcQbXAZjMF/WmZ3/
 zFFeEe8CCf9OpiMT+S1ASnKS/cnKZszpayAn6Uhd+D/yCIrif+GVoR/VUiX6pYn/ofO0jbLoCXo
 2jL3zZuxZXhRIxLvgSCwvB1Lo/LuO7Y8F63YXkVYiouUSlnZsUvKqjJb4zWJWdNDl1HUykVcVRs
 r4ntqF+jhasBG0YbxHScgUjT2mKSI5gMTKFYmbefa9wGaV3G1x9es65r3J75KycmWxfTvj6h
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681a04b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=sMkIdjRUvVsnaBxMjLAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Qco9O0SkWRmV6icvZVgDXzjh1Mj8e6T0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060122
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

On Mon, May 05, 2025 at 04:28:17PM -0700, Jessica Zhang wrote:
> 
> 
> On 4/24/2025 2:30 AM, Dmitry Baryshkov wrote:
> > Some time ago we started the process of converting HW blocks to use
> > revision-based checks instead of having feature bits (which are easy to
> > miss or to set incorrectly). Then the process of such a conversion was
> > postponed. (Mostly) finish the conversion. The only blocks which still
> > have feature bits are SSPP, WB and VBIF. In the rare cases where
> > behaviour actually differs from platform to platform (or from block to
> > block) use unsigned long bitfields, they have simpler syntax to be
> > checked and don't involve test_bit() invocation.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Hi Dmitry,
> 
> I agree that some features like *_HAS_LAYER_EXT4 and INTF_INPUT_CTRL can be
> replaced with a general version check.

Great

> However, for other features (such as DPU_MIXER_SOURCESPLIT -->
> dpu_lm_cfg::sourcesplit), it seems to me, you've just replaced the feature
> bit with an equivalent catalog field.

Let me drop it too then :-)

> So while some features can be dropped from the feature flag list, it seems
> that we would still need feature flags (in some form) for others.

Do you have any other examples?

> Overall though, I think that dropping the feature bits makes it less clear
> exactly what features are supported for which chipsets and makes it harder
> to relegate features to specific chipsets.
> 
> So while I do see where you're coming from here, I'm a bit hesitant of the
> overall move to drop feature flags for the reasons above.

The problem is that we currently have two ways to define features - via
the MDSS version and via feature bits. I'd like to get rid of that
duplication, especially for those features that are really tied to the
MDSS / DPU generation.

As you can see, after the refactoring we had only three feature bits
which require special handling: DPU_MIXER_SOURCESPLIT,
DPU_DSC_NATIVE_42x_EN and DPU_CTL_SPLIT_DISPLAY. With the Active CTL
being merged, I can easily rework the DPU_CTL_SPLIT_DISPLAY. I think
DPU_MIXER_SOURCESPLIT can also easily go away. I think we are left with
only one feature bit - DPU_DSC_NATIVE_42x_EN.

I think I can live with that.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > ---
> > Changes in v3:
> > - Repost, fixing email/author issues caused by b4 / mailmap interaction
> > - Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Rebased on top of the current msm-next
> > - Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org
> > 
> > ---
> > Dmitry Baryshkov (33):
> >        drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
> >        drm/msm/dpu: drop INTF_SC7280_MASK
> >        drm/msm/dpu: inline _setup_ctl_ops()
> >        drm/msm/dpu: inline _setup_dsc_ops()
> >        drm/msm/dpu: inline _setup_dspp_ops()
> >        drm/msm/dpu: inline _setup_mixer_ops()
> >        drm/msm/dpu: remove DSPP_SC7180_MASK
> >        drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
> >        drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
> >        drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
> >        drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
> >        drm/msm/dpu: get rid of DPU_CTL_VM_CFG
> >        drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
> >        drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
> >        drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
> >        drm/msm/dpu: get rid of DPU_PINGPONG_DSC
> >        drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
> >        drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
> >        drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
> >        drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
> >        drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
> >        drm/msm/dpu: get rid of DPU_DIM_LAYER
> >        drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
> >        drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
> >        drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
> >        drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
> >        drm/msm/dpu: drop unused MDP TOP features
> >        drm/msm/dpu: drop ununused PINGPONG features
> >        drm/msm/dpu: drop ununused MIXER features
> >        drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
> >        drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
> >        drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
> >        drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
> > 
> >   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  53 +++-----
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 -
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   4 -
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  15 +--
> >   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  19 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  12 +-
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  21 +---
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +-
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  43 ++-----
> >   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  45 ++-----
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  31 ++---
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 ++-----
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +--
> >   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  44 ++-----
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +---
> >   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  50 ++------
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  47 ++------
> >   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  53 ++------
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  47 ++------
> >   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  52 ++------
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   3 +-
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  51 +-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 134 ++-------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 108 ++++++++---------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 ++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  17 ++-
> >   51 files changed, 304 insertions(+), 864 deletions(-)
> > ---
> > base-commit: a4efc119e8149503e5fe9e9f7828b79af2fe77c6
> > change-id: 20241213-dpu-drop-features-7603dc3ee189
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
