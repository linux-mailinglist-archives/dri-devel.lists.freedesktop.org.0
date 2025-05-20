Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E0ABE610
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 23:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4A10E094;
	Tue, 20 May 2025 21:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHCzveXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4AC10E094
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:30:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0eG000753
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yp6gS6fiXRKVst4i/0JwkECc
 tK+Yj9KUJFbKtK5dEDM=; b=iHCzveXQmDV0zvg6HWoiNu4PI3BCnn+CyijSFMCQ
 yNR/imF0BhjPSk0zRXtsfmizj7CEQAQbGFlmN2GjfZkultGsPHkOIVLRq5sKRENK
 Z033bEmvEd0HyU9MPwBQoZfbQkzovi/Q8buD+TODgWteQszKgIbepDHDZgvn37Zi
 uL0ay/XuT5Q6CTah/7Hvx5FmI/rjIczKWlb0OWLbrnAqJOYliMUaAjSliv8d/hLy
 dL9Bbmj0XG5rtD8ZKz7YXcKgBP3VhR3w1EG4Jn4pI1QXDWvVu5p/dYvHCEeqURR+
 0AP5POt/Z36iTLDI0Y4u1w0o2zE/7xgJJmyCDo04g/xO8A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4rnaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 21:30:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8dbab898cso54183556d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747776602; x=1748381402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yp6gS6fiXRKVst4i/0JwkECctK+Yj9KUJFbKtK5dEDM=;
 b=iy35KdqKAdOOdbyibXjLc5cMvM5sjvnXWmPUsvVsgeuElUWyboSEXkLHOCDpW6JgUb
 Hx4Y0AzXVjF5kfBAPuWDtQk4RcPbeE40yEw+goeObzRuiw/oBfXCdpmHSsn8BUByeDBw
 MsVqYnbxMQNNfjlDaTZd8S8QzKQSZPv74wMEWpUANFzI6v4hhxPeZqpzl9ZF8ltIpMcn
 ogBXqsfs1DgzVlM5H1+M36OOZY+9KeAXWVOxnap8KXhJjt0gCcsp8cI6//Ff2F6dHKBA
 +NE6YWPrK7yCMaebx9R2E2KxcFQpo9y47Rjvgl3/gSNDQq2C+tWOodRnwfwPBIT4gLPD
 EJGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXATP5GJ13xw48gv6/dvboXWUDyAeNRr9Ezps5nUV2mmPuXzdxKMW4r5z4AdC26M4QAULlmBSLcA7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMmWP5GpSJpjasPm6HnShisVRoQJ7DWmzITbsdNA1Qb1J+X/DH
 lp+HofFWaNVUJ8KzOh+suw+/vt5mUkXdquipg2CeG544jnuDFNqtxQfdldV6ZhuEzHVEg/eJpBp
 dS5hKXkrFZw3R6+X2XnGxnvO2Uk8cyQdcCJVs05xE5RTYeruTHgh/QQtNl5JLIY3u+MhKL/nyux
 44wNwZjA==
X-Gm-Gg: ASbGncuNbonSS19hTco4LXEYb2t6CKQEupA6k4IRUFI/mGvffwHkdOPikq6pBGyZ6q0
 oWD9hK//1y/Z+IBX15vP7BKLlnKzDU/E6FphrWzMJZ4hTGYqAFQcaa33o+gkxu9/Jhm6ZftRPod
 XDa+MFVV1E8BznE0uYTV6WoCkOYsAxqgRuY+Su3B1g/6UV9qj84gdyxszcM3VPeMjIZBdzE9cei
 3ZZMmXUkifMhmnXbqJ7VGexqbbMtHuJ16CyyJRgM6PFNKWgldmMcnLccI0uP5A+JcQ4tHMr3o1Z
 +VoJAk88f+iyrS8bDlu68qEdhzKYhsF12Sc/VOVVR5OaDtNpRjZQFtrdFv5TYWMWY08+rlzLesc
 =
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id
 6a1803df08f44-6f8b2d0fcf6mr190470506d6.30.1747776602230; 
 Tue, 20 May 2025 14:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRHg3BPZjY/B10Mp1qFG51/Xus8QH5zLJpu0aZ2V7CVv1GX6G3h/VmPHQU5N4wG981wP+NUA==
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id
 6a1803df08f44-6f8b2d0fcf6mr190470206d6.30.1747776601801; 
 Tue, 20 May 2025 14:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-551fc7d8a77sm582050e87.186.2025.05.20.14.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 14:30:00 -0700 (PDT)
Date: Wed, 21 May 2025 00:29:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
X-Proofpoint-GUID: L4EtHz6rVqx194nEE7jnlcVs9grLp8pd
X-Proofpoint-ORIG-GUID: L4EtHz6rVqx194nEE7jnlcVs9grLp8pd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfXy3dfbYVWGZPa
 h79R24/p5c9H7fUDk3Nk0tDdqPEnbshQAjotmJxeVkqq9MKUnegwchc7t1Sh7LF7JXwujcHlWrL
 XxfHZ96XEUVForwtzxxEwds3xGBxEUWJ2TSVbLc8tF+UGG+OLeOBSbXq7EaWEpP2JkTWi4JQhZR
 Qf1XvnPW27EIXvk5qhgen1+kSFxxn1WQ0L2Ewfg+Z8XbdX2JqFBVtTYt5Zxy+BKOOO1aKP0dq+K
 7ubR3uTdblNiHl/ClXRT2g1SLFUstjCdbEpfz14j0/fT6bS2nsFS/S0JgxbiL0greDRGK2XN+Gz
 nbnhdhXL8lNEEjk9SZHOrcAu676nTXDEW+ja3vV3c6XWxNbpxSPcqktTBzP39kxFUyUFbZ+8kRV
 xi+zFWZ/5zwPiGgAHIUhPvl0b1FNmnWc2AP4JAYpGqpMN39m7zJmh8247vVrrpPicSER+XiD
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682cf45b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=2NsQiy_ISMybaogD8ncA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200173
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

On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> >   17 files changed, 6 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   	/* setup which pp blk will connect to this intf */
> > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> 
> Why did you drop the version test here ?

bind_pingpong_blk is only available since DPU 5.x, the same set of
hardware as the DPU having DPU_CTL_ACTIVE_CFG.


-- 
With best wishes
Dmitry
