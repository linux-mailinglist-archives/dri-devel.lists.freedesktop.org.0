Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68DAC13BB
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 20:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E95E10E0FF;
	Thu, 22 May 2025 18:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDQoB3fz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92CA10E0FF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 18:53:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI8tK0023439
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 18:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=38zWe9upC0kBIerry3BI5xcS
 uLu49jVZpKxNE+7H2Gc=; b=gDQoB3fzYeck8hySEXpuPXHZAMvgvA7riLL1hXWs
 /IPFZOsLRBkF9HGzDOnFOitNGNkq1yG2phnD4IqmUfQATu6X4zu8NmavV9rPSIND
 30B1r4eyrVmtOEDFZK51yrEpzYrov14I2MolkbbwnkgRr9Fvz8aPeWwpZi4+o8NP
 pPs/idv2pRqQU3XUEN9chari3H+/5RM1cHoObLaMM4WbDNYRluqVwJA+G9feSUcQ
 EaL4G32kOKFW+770fK3/M6P4etVho4n/yJCAmdM+YMKG8RmRMY3gBOcWNpUKPG8R
 JmXCzKWg9uNTVyDMBAhRUB70eUdLHd1AKBCJ1EeTTgidWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6yaq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 18:53:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54e7922a1so1759930085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 11:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940032; x=1748544832;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38zWe9upC0kBIerry3BI5xcSuLu49jVZpKxNE+7H2Gc=;
 b=AhKCTPyYHQvryaBqmZeLQNCfcKyksjkrHKiVm1ipfC19lK8ZscG7xKD7p0GMkA+dLz
 hhXOvThoiskZOdXfkf6YiFKuX9UP1pV3wOkOef74og6caKX8R6uqsXGi7+BvQDl2vw4h
 hgzoi7ABVMIn8a2R/Cv5J04HJcf9p79MFLfvHAr8K+4n0APTExloZ+kfALTe2fengP4f
 xHuZU7UkPfHdSA7dtmC0xpa0KN/h/sLT/iMASZ8cdRITSy+ZpcnaxC4TRnyuOv14jsiR
 A1RNDhRogOtXUh1jdxVJtV4DHCG/oU31rri49vxv/r3O6iALygQSASaewRSRFoZrHQgQ
 HRvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCrf4p17+4cTNV55IFEvnTWgkpowCmic65afGKOP+q/0h5RdCBA89kXpwVkJXNPbSU6msfbBsi3ZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwBfrPnlksKhfCsfm1JAGqLY8HQ8T8GjxsV5Rq0YOBsB5ruwUr
 d/nMcWxgpCT1m+Qv95N8avZD7lGX7vxDLhMqXgZ0IjVe1/Ysn3N5tIacext77mN9NnQBKMEDz8e
 cARdzUb24LJEbUs2rhcSWc8CttkLnwb1cvSEQrounpowyVBGgneinJqgGpz9otzfrLQZIL0M=
X-Gm-Gg: ASbGncv2D/z54ndxs0duvBVRAWlfxWPrKr2Zn4l1Dz9px4OC6E+FtA8JsPwqhw448tc
 8JsOn/wZa6UVEvfX7JuA47F2MsUmsP6Cb7xnALcy+E66Sxb+J4yl9YYY7D14UJW7D4b7uJFH54g
 7ZFuND1sPXYATft2yj9z+Kwj7nGu+mIxIVUSCRJduBGQczo01YykJjD5IaDgB9dIkAZ3tSy6BCF
 2qJxLlPsVpKqsqyePzjqr6Pa6MNCK363v9Dg1aUSEX38yNasQ31XaVP4uh9Frbnv1uVxd19NtKq
 fsr7peN683YIqwiFX0yWLP2bXJAIhoobkkmZjyZoh2HOfEDq9so9GybDXsmIV0mpX5oPkuXSJp4
 =
X-Received: by 2002:a05:620a:25d4:b0:7c5:562d:ccfa with SMTP id
 af79cd13be357-7cd47facb7dmr4080954285a.36.1747940032052; 
 Thu, 22 May 2025 11:53:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2WfwBOxC54aOuWPMmC2+V1YOrtw5z5DzwfXMuy+nfcNwlEf/jKVEhD0ub9XPNyNJJ11nUSQ==
X-Received: by 2002:a05:620a:25d4:b0:7c5:562d:ccfa with SMTP id
 af79cd13be357-7cd47facb7dmr4080949185a.36.1747940031641; 
 Thu, 22 May 2025 11:53:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f351a6sm3508823e87.88.2025.05.22.11.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 11:53:50 -0700 (PDT)
Date: Thu, 22 May 2025 21:53:49 +0300
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
Message-ID: <uetcrmujwpv5jzaov667z7u267oyn7wqpz2i5etxjk672c47nq@wtddlcqubysi>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
 <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
 <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
X-Proofpoint-GUID: 6hUODj364ujlJvaV7hqlZSZbsex1pKww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MCBTYWx0ZWRfX9XRO5bJ+A6Ya
 nE/XP5w4DhMX3fAOmHS/naLkkaYxLFaxUoNCed3kWllg41lY4A9SVIyG8W4nI+F2jLbk0NyOEVt
 t0knNpVjK6oHPbQtZskUwzzTubkffdr26g/DrZa6ZErLCODT4f+c4xSWXji1QNHV5oc6RSHNu1t
 fTvo077GinJH1y2eNpYWAnFhdkULhvXeho1W5sUy/yv6Ct23cFzK0QAPhkzrGOggOir2WF6FUD7
 D83uctJ4463zzXWgV/gcipdhQQB+iH3xdzV9FWE4s1pMCLErsqx3Xd4eeyfglwoi8cjECrpGVXA
 17g7VHbKiWQcXKRdASI6XyNRNqWi2Xwk1Yz41ZiUDqqx+C0fa1wj2BXTngOB3OLzWtHn5qq1Aw2
 pYkfVxZAiXV8/s3UNY3LpOoLkJT8gtkU6kmtZLIUm0dOsr/IqlKTZuYVYrsYwx0sgspgC8Ls
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f72c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Aotn53-9w846ZEucy3YA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6hUODj364ujlJvaV7hqlZSZbsex1pKww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220190
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

On Wed, May 21, 2025 at 02:51:22PM +0200, Neil Armstrong wrote:
> On 20/05/2025 23:29, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
> > > On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Continue migration to the MDSS-revision based checks and replace
> > > > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> > > >    17 files changed, 6 insertions(+), 57 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> > > >    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> > > >    	/* setup which pp blk will connect to this intf */
> > > > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > > > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> > > 
> > > Why did you drop the version test here ?
> > 
> > bind_pingpong_blk is only available since DPU 5.x, the same set of
> > hardware as the DPU having DPU_CTL_ACTIVE_CFG.
> > 
> 
> I think it deserves a comment in the code or the commit msg.

Ack

-- 
With best wishes
Dmitry
