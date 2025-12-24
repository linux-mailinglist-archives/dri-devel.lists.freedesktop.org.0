Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4766CDC4E7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 14:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1610F184;
	Wed, 24 Dec 2025 13:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUkJZvQx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7r4yIwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B870710F184
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 13:03:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO9RsSW1530450
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CoMLQ3A+FSqHoq7wci+EuOku
 pFXnNaASmggKwByogQw=; b=LUkJZvQxGCXyxxq7p8ATp89C8XN+5L0H83SU3qcB
 SF2G24XZlM+8S4yZO3lXR1AKx1HspfDA1P7/aFhU02tQD6B1aAM78h0NWwaCX7cy
 pl1rVvpSpVQ63ogkC7qdyyV5iulFm5X75sm1xniOHXFq5Zm8NODWqpFSL4R3Rjj1
 2FQ1SlOm+fMbATJFjpCOWm2v2j94+BxwKEHpgogGGHGFX+PcKisuL6ZZRHVkvDZ9
 OY7BxnmnVIyMRJtsS+Zlq4cF1UUo+P+VSgi3Y1EG4VKCQLyGMhGRRvFsZXSihph0
 GRIuRp82y4MgxBnE8B1rR5QWSdRguzyBlfuGRKhf7UqBuA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu7js-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 13:03:21 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7c75663feaeso6238461a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 05:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766581401; x=1767186201;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CoMLQ3A+FSqHoq7wci+EuOkupFXnNaASmggKwByogQw=;
 b=W7r4yIwDRyWHf0SGJYL9n6FwBldlKtwZEisPhOmghYrLEShDX2v7/Oq+PlJTmjlO0/
 sqG0KqpO1WV/w4ltJYdnVVjEXrtURlzxYcG8CZLFflVDm5tegA8G+I58KnXBFMPJad1r
 tvJfQP8V6Op/qXLI7U1fL2opNQJuABuwrYL6KtfQ4kFRIlms7njCvhYIoZycc7qF0rZT
 AFe0FLXhOQdiRAMapkOMg3VikGHIVOcaKqBUQn9WzYMLkWS2xU5UP1piYHnbiCAzvkr0
 0msyB0mI8RB6NecYBpXzNmOvMlcu6tjVLKurMTy3ijlv1yuLUM7lRD6kOmPTJaRujGKd
 yWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766581401; x=1767186201;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoMLQ3A+FSqHoq7wci+EuOkupFXnNaASmggKwByogQw=;
 b=sQyNokxLOHGBUk1wmlc4qdlPJ2BkQ+KSUDSfQVhzgy+yTUEaHsAyBikSHDZxGG/ezP
 pdQ5W2VfE4JjLvXQIs5Efyr2rkjw4ZcVQ3rD3FQ0vgSX9ikKorJQl3hNYiW5DPQbDi92
 cA3yy4APjh+1dKSI24xkKloedRHA26XEuI5QYV4aTH0q4yTpmjvjjUyKeEDkr3PvT42M
 1NISU+vCbexAoHTXtRXp5Zlwpu9lT3IZ6KnbrqfdH3O3ZXmDkpI76VL+ejSD1kGZ5GG+
 h8fif2x0dAO4GTAzgof7VIkHIXfJXRxaGbRJyrQAQoyz9CHOZc+JB1GztB64HK2JFhjL
 MPNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9y3Jbnvh9bH5/+ltFea3oR01Wg3SXBR4yCiIVYb+7AVAld2iT67INmanCVKNs7XK+52Qzo78nqgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC8y2t0H2EvwvESonYr+AYPAHP/yDEF8lkJ02WzCt89+uU40Ww
 0/47cn/RoZLh/LX1qCRjiL3DDfuUN5s/Wlkd5McYdNhlqYK9ngiZk+oIGg/oQx4u+zsf/XJUXHG
 1AKH/CQJQK0MwEPcZxhIIdiLMk8nr4viq0+6aFVOmLrOB7I6LH1+Nh4Ve0YeD6X7UxwVNiK0=
X-Gm-Gg: AY/fxX597rvQjMO637ZFDllPdIvHos/QgqjFn1gC28hKqNr/5AEQ9p2xDFipZhM8oJR
 uHc6yHGlCsde93j9DYWGlO9TLT+XjDmuCAYwafna4xmi1i0dkXQj0RBPvLGt+NGqFXSt2q9vgW8
 +/bk9ldp6Mm1lrrswQAr+mHNP6RxP3L6SywBy0qcKnkdoofO8NGOdBohdlF+idINre57XOnaMyn
 4LNs5yiCJc3dzBYagutX1/dVGQPhitnk73yF99qUaM69uvPUlHVM2lgJNZAUVtkA0zcVbgOgVFo
 tyZk2TISf3xxAjdGjNrmkw4BJ/ITpLKvFP4PpdUtFyuZc6+LDyW+kloXjrag/31M7ID70qAgP77
 GzquYGKwjgN5pHcMbS5g9tQp9AhPkDiGkj827vit7JzQh8F/hccfHLSTbcszRWYucqJ8ulvTo92
 dHde10VCQjpS5o+WzfWo9kmso=
X-Received: by 2002:a05:6830:2e05:b0:7c7:2df4:faa3 with SMTP id
 46e09a7af769-7cc66aa23fdmr8356415a34.33.1766581401127; 
 Wed, 24 Dec 2025 05:03:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFci56BqdajGnWbClbkiviThpt3xVm3rf78bzux61dK3ALULPOf/isq+eEuZE9ShzSWosGYHw==
X-Received: by 2002:a05:6830:2e05:b0:7c7:2df4:faa3 with SMTP id
 46e09a7af769-7cc66aa23fdmr8356385a34.33.1766581400633; 
 Wed, 24 Dec 2025 05:03:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b391sm41256101fa.29.2025.12.24.05.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 05:03:19 -0800 (PST)
Date: Wed, 24 Dec 2025 15:03:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Teguh Sobirin <teguh@sobir.in>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <un2arvxos2kuyrqej4p4fs3jfd3kzpa4r5txoitoctfwl7hair@i2a5lu3p3iem>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <aUu5vZdr9RJ-VML8@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUu5vZdr9RJ-VML8@SoMainline.org>
X-Proofpoint-GUID: lxLoI_IyxM8ipjr6NubcUv9p2HwDI_lA
X-Proofpoint-ORIG-GUID: lxLoI_IyxM8ipjr6NubcUv9p2HwDI_lA
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694be49a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EZJLH4LHemoWMIo9gjsA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExNCBTYWx0ZWRfX6xrRTMZarJjQ
 z8bWlBoct8BCasTWEceKJBeVfvt+XD+Tp+m0qzyCPPd9zJx2H216QIhj+J3uyEcFH/PJj60qex7
 ueMajUPQpPJ0XhpChMQp07XkNMgczj43T1EQiKdVXpZORXRKMB8XymbUJ3m0X5n7KXu5NXR7RYW
 x0dpaPxb9/9t8wwFHtvUcO2Cin7zviKm8Xf5ztz3F5s4d1OJo8+dNfBXkDFsi2g9hbGq2DVZDLM
 pWf5gQWgnLq2cq0W4wwVVEdj5IcnA4/JIqJwoXXNsZiYQgVc2gInPf8xy9s7h2fqqalTibRSBTM
 oDuS9xCbZigGy3feyVyBTiTvOofBww6O4/5kMLcOPRjsBJhcfuglWd+oGesqncfr0YPHcFvrMrG
 +w/8lE8CYSa9NhiqMhth20eLEz40RB+k76qdVsRbDGt27Cunb4kNHDDg3SrylpzaotFGyIPog4E
 BVY3/+TZv6MJo6u5aRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240114
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

On Wed, Dec 24, 2025 at 11:10:35AM +0100, Marijn Suijten wrote:
> On 2025-11-21 14:02:08, Teguh Sobirin wrote:
> > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > INTF blocks.  Currently all code to setup vsync_source is only exectued
> 
> typo: executed.
> 
> > if MDP TOP implements the setup_vsync_source() callback. However on
> > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > vsync setup. Move the INTF part out of this condition, letting DPU
> > driver to setup TE vsync selection on all new DPU devices.
> > 
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > ---
> > Changes in v2:
> > - Corrected commit message suggested by Dmitry Baryshkov.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d1cfe81a3373..f468d054f5bd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -774,24 +774,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		return;
> >  	}
> >  
> > +	/* Set vsync source irrespective of mdp top support */
> 
> Unnecessary comment, it's clear from the code flow that vsync_cfg.vsync_source
> is passed down into both functions.
> 
> Perhaps we should pass disp_info->vsync_source directly into
> hw_intf->ops.vsync_sel() and only initialize vsync_cfg when hw_mdptop has the
> function, to make this clear.

No, because on DPU 8.0+ WD is also setup per intf.

> 
> > +	vsync_cfg.vsync_source = disp_info->vsync_source;
> > +
> >  	if (hw_mdptop->ops.setup_vsync_source) {
> >  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
> >  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> > +	}
> >  
> > -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> 
> This change is not mentioned in the commit description.  While true that
> pp_count is only used by dpu_hw_setup_vsync_sel(), that is still a valid
> function to be called on DPU < 5; it denotes the amount of ppnumber[i] array
> entries are used above.
> 
> > -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> 
> Same, also not mentioned in the commit description.  frame_rate
> is used by dpu_hw_setup_wd_timer() on DPU < 8.
> 
> > -
> > -		vsync_cfg.vsync_source = disp_info->vsync_source;
> > -
> > -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> 
> But all of the above comments don't matter if the call to setup_vsync_source()
> is removed entirely - it didn't move anywhere else.  This is not described in
> the commit message.

Fun, I missed it earlier. Thanks for pointing it out.

Teguh, since we need to fix watchdog on MDP 8.0+, I'll send v3 on my
own, if you don't mind.

> 
> - Marijn
> 
> > -
> > -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > -			phys_enc = dpu_enc->phys_encs[i];
> > +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > +		phys_enc = dpu_enc->phys_encs[i];
> >  
> > -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> > -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > -						vsync_cfg.vsync_source);
> > -		}
> > +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> > +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > +					vsync_cfg.vsync_source);
> >  	}
> >  }
> >  
> > -- 
> > 2.34.1
> > 

-- 
With best wishes
Dmitry
