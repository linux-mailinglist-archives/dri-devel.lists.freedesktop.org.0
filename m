Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CEEAE21D7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 20:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5BF10EBAB;
	Fri, 20 Jun 2025 18:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkdN/irB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EE310EBAB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHdU0i029799
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jG+tT6iYc7a6QUyEAhUjHjnsvAkz1ye2EdBIx/ExqFk=; b=UkdN/irB8eMnJ2NO
 0jKqzAQYkjVmkjPwzGLnd2yjmhC6ai+LAD0gYtUrCOK8BEwRvqqoZR/ugLxYiVuX
 9k9jLWr44aC3OHxETeTlhAm5+i8CiiOz8ZilzWSUj7Q4JnCemiVtWuStq45Huipk
 A2+GSGi0whhqnkJ4UEP5TzN7Q/5w/1yuxrrFt/OdGIICQ5+CmHrvfC6J0/KF+aSS
 0YloyFiwf30ppri10MrRtHrzhqKNyO8yu9zt9UQBThQGIkh4AnV5NWIsl3e7YfQ9
 MsdHh5fl5Yox+G5VF2uNNL4og0XshRfyaWglpdIwx/PjnaavMahQY9VnybmUaRgI
 ERE2Ng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dc72r26y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d3d3f64739so468170885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443240; x=1751048040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jG+tT6iYc7a6QUyEAhUjHjnsvAkz1ye2EdBIx/ExqFk=;
 b=hWyk285L/9oXWEDyjUTPbwkpJRH5DatV792lQMDk4wqnVGTpX/2szkuZAUWcWSYZwp
 yY4RXYpWcLvhl+9mwDPnXqe3ZE0SO/lt0tsj6jchP8M4F9gpQcoC0CziqZ0fcgtLzf4Y
 dibWUEAmF5tR+0bpCh1X14PqzNH0OagPoBs/rvkhHaP6wdIp4NMSxo/LowONjjbNoNyM
 Ys8VaRO/+q4y/bWghuwznE70LYMxf+g4b6Lxf8YIOVxgT+BwQ2Bac+/8MaFz/oy2HN2K
 +CwffVM5rqWm2Fu0yf9dcOc5a+T1oPziIjCJc/z+w8Atgtw/1/ylfAVk0ujKEGWseygi
 EMRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPOhsa5FbfzXhNZ6TqpduXvBgiaI2B2Rxx7cr9FhRLHm7Rl0hh/nY0E3NwK6X3lPdKAtsm3mA+5zM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf6lbiAKgqHj8MO7Iz8gBAz/z1oojT/RmtplynS8m/nTTzPBV3
 pKc5aOJ4FgmMnkgA33p+AIhMDZ2ZJ1BgA9Hspm4qWmxZPEF8Ei26iMOG5BnHIYJQj2U7CF3Cj4e
 adcb+FWRGnGyfD2Ed0kAf3a1ekuX9Bq8XjCXqbdj0woJTOmdu6fNqhF01prClHyNwoaU2iQ4=
X-Gm-Gg: ASbGncsU2sFO2Y5bDiI8yNToKIiCvAhKzA+Js2QAv+SVpbxb3GVmv3p1k+AnYr/8Lpe
 /nbmL/n+r2vcMdg4WD7iMWo7gDGdKCnzuG+vKKFRbBnO48Jg6gqE93hWXxAB/L+6YFkhQyGaPjM
 xP02YkVVCgllt1T0KawD/x+ML+RRq/MH+AApUJLZmnj9T7VT3zS8KYeOwYSV3LB/X1pKWRVQ0GF
 BWikF+7tHosgT6UuN0/nw9qHLlUAIaXUusYV0eAD3Ge4ZksPVvf1OPv6RoySIJ5IfkLi2sYJzO2
 kR+8adsUB39qCH+4P0tqNSq4rBndn8jxllWfplaL8WEw1/HwAFO3PkvVxwaaYxFksOeskmgeY86
 SN/XnDThz/J44qjq/wQLI+2eWvJEqs6qZKoA=
X-Received: by 2002:a05:620a:f12:b0:7d0:a25b:d04c with SMTP id
 af79cd13be357-7d3f98c5721mr607832485a.9.1750443239573; 
 Fri, 20 Jun 2025 11:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrRvs8vYgSxtHBNL8Gik6EafDnQeb6cUhaJFFn4yZST6SpGSMyqxM73JI0IZzDqbtPeAIlXg==
X-Received: by 2002:a05:620a:f12:b0:7d0:a25b:d04c with SMTP id
 af79cd13be357-7d3f98c5721mr607826485a.9.1750443238988; 
 Fri, 20 Jun 2025 11:13:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:13:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 00/30] drm/msm/dpu: rework HW block feature handling
Date: Fri, 20 Jun 2025 21:13:51 +0300
Message-Id: <175044313810.2014621.9717827153141285782.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GNgIEvNK c=1 sm=1 tr=0 ts=6855a4e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=KLh1uqfzAhr9BImysYoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: niPDXRUc53jKDe3lKtSP2evWksl26PN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX9En/db7xD7pQ
 HlsD6oSijHkMGzflY8ik9zxYTmANc0kG6OgR6z+sk5tpLh+YiDaFS4ogcexb+V0NzjKAsN9aKff
 wL7izTGZ2low0w4cnFMPMBJlmLz6WYi811UfnIYbHfNdvu5OBmwbR37w407mz8d/XgdrpNfYf/P
 w8piiZnd4kBBWW6it2KxEfEculG7BzByW4hY6CEF++qaUgNP9c9tnzo7LdxJVqtA7JlIDXQ8U6b
 RZ5DU6wzQJEaiUpHQc7TBWY0LCnwEJ5tjL6LVZ/NTeGMMSTUUgtyPJBdX+q+nTsNpB1k+ikcumo
 mD2Qno3IAqpkfyVYQyp/GEgE8+8s927zVPSP/nnA0HLR630H+0fl9dp2U4k/mUNPXTDfYqCT4zH
 YFTT9KGSCUIAaygA6L+NX+34HjzkZMw1r4oyPJdN+8eIGslSdDkL21l4SleBo6XePdubayXV
X-Proofpoint-GUID: niPDXRUc53jKDe3lKtSP2evWksl26PN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=897 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200127
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


On Thu, 22 May 2025 22:03:19 +0300, Dmitry Baryshkov wrote:
> Some time ago we started the process of converting HW blocks to use
> revision-based checks instead of having feature bits (which are easy to
> miss or to set incorrectly). Then the process of such a conversion was
> postponed. (Mostly) finish the conversion. The only blocks which still
> have feature bits are SSPP, WB and VBIF. In the rare cases where
> behaviour actually differs from platform to platform (or from block to
> block) use unsigned long bitfields, they have simpler syntax to be
> checked and don't involve test_bit() invocation.
> 
> [...]

Applied, thanks!

[01/30] drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d25efaaa327
[02/30] drm/msm/dpu: drop INTF_SC7280_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/768d87108f24
[03/30] drm/msm/dpu: inline _setup_ctl_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cc34e7f8d8a3
[04/30] drm/msm/dpu: inline _setup_dsc_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/155e4d05136b
[05/30] drm/msm/dpu: inline _setup_dspp_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cfc1dbe27f63
[06/30] drm/msm/dpu: inline _setup_mixer_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d01d027a6ae1
[07/30] drm/msm/dpu: remove DSPP_SC7180_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/64558d6ec1dc
[08/30] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
        https://gitlab.freedesktop.org/lumag/msm/-/commit/40b7aa8fb641
[09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a1c5eafeab9b
[10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a22c33cb4ccc
[11/30] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
        https://gitlab.freedesktop.org/lumag/msm/-/commit/91003d9f8fb6
[12/30] drm/msm/dpu: get rid of DPU_CTL_VM_CFG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e479fb02dc72
[13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
        https://gitlab.freedesktop.org/lumag/msm/-/commit/39890da06970
[14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e7da245a3402
[15/30] drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9db68425f24c
[16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d521c4200c94
[17/30] drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bbd131f1e095
[18/30] drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5094aa5474a2
[19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/820405f6e2e6
[20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b14f7c55b079
[21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b14c003781b
[22/30] drm/msm/dpu: get rid of DPU_DIM_LAYER
        https://gitlab.freedesktop.org/lumag/msm/-/commit/36beee41c4c3
[23/30] drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
        https://gitlab.freedesktop.org/lumag/msm/-/commit/27b1a01fcdb8
[24/30] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a88c80ecb442
[25/30] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fa811f768713
[26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0709ec21abcf
[27/30] drm/msm/dpu: drop unused MDP TOP features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0ea9f990c352
[28/30] drm/msm/dpu: drop ununused PINGPONG features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a1e42a921dee
[29/30] drm/msm/dpu: drop ununused MIXER features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1f783bf4f8f9
[30/30] drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c70c860fb00c

Best regards,
-- 
With best wishes
Dmitry

