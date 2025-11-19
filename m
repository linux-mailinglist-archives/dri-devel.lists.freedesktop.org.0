Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF026C6D3B2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1410E10E59B;
	Wed, 19 Nov 2025 07:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSqJ5OjQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu3HHtrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8B10E59B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:50:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ7ZcuN717578
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JN0/6uytMZfFdGgqFRKuCML3
 Urcs2u6XoPqb2CVpooo=; b=pSqJ5OjQ2LoHRPNAn6sxDYUlxkhY+0iVGHf2d9GY
 U/ZoodeT7UT6Qi8ku0bN/PkSvJWEfxDbdQKnsF9B5e2eXu/3EdWlJnK/xDR1wbGD
 qcwqDUxqRiRPYu/twy0agb9IrwFRSXVtVsEHSWBbgCWvcAGacXJmk5xMZiG03oJo
 YYpiq5JnYN3OkNsHJMZxeB5qn8OZJ0fu0R0z5PveNIFls3xo7Wlf/93mUYU87cE3
 V4NeoGDmRf7Ld9JzqW946clLibPivJEbGZCy31XC65+psSzWEt6A/PQpFRZm9JJl
 vAgS4gCouA6f3doF9semuUL+8FX5KwSUPmPgJfH++8SY3w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0r16v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:50:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8805c2acd64so198836916d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763538616; x=1764143416;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JN0/6uytMZfFdGgqFRKuCML3Urcs2u6XoPqb2CVpooo=;
 b=Qu3HHtrH5qhiuLn2/AIhLRGHdOKYxef1Kbd4pV5tKPNdt7f8KZrKb0XEqbSGzrpDQR
 0N82tLMhi/gmzFcdsnquX3Q45Pxw+k2Rh+cizUNzMshBMpDNoTBM7xQ/+JtakV+CWmT3
 eVCAEKIrqeWFvRqU3LIa1/Vn9X5aOnq+Fs7CDfFpf2bX+/pP6a2U3yuxEm7hh/jV664d
 F7K469lyQIsSLPfj0GHTNOf+dnTjCDvy3XQBiTEyg/r3D5QZz5HsM9b6G3mMZPC0AtFJ
 mJm6r37GGAx959zkDwte9a4RIJZol7cDR9h/g6Y6b6gTbBP7BLnrTOJCJWZYVgwTRgiY
 RVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763538616; x=1764143416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JN0/6uytMZfFdGgqFRKuCML3Urcs2u6XoPqb2CVpooo=;
 b=bcHs9fy9ijWX/FWrjBn/E6/yLvU/fD36YgCCTlKw3y3zyFTY10j6dn/0cnCO/uZxSN
 yn0Yi+x23vHy8pknzmq9jqfh3ryab9oqMfvgxyQTqxDwSKPaVVl8PZ2Zdr4p8RhrpwZe
 U5qIUyk/TlpHOBUANO3LEH+DASswGgdpe6hVZXpKozP4y5Xxb76Dyaf3Ss59zg5ECXer
 L5nTogovW23t+IScHtrf4f23Te22u98fWIRh5OYn2dkfTtlommEIJkemA2PIWbjAP8xP
 6GUnXqajaiRFk6EUFFQYdgwfbXKqFuhKs4LrsOeoYbBIn3J48+DOH+4PmVaOekkgatsf
 Bf6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJBKLDrxalcWDLwIvPfyeAu7fcoG3jalDnQPBriuXpetrKNahZZ3xYHvLZTsC7s7hB/SsKP2IEt2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH/QYa+5PrdM4lf7Jags7ePIshZtNDJUDZzK+j/fx+DCvX/3yQ
 gbc5/hIqsUL87QY5ZnA1NY8zuQh+ldpHjXL+7zRJeduSMRgI6P+kqG/FTdlqC+hO3hd0XwdYtwm
 PzOi7lqfa3SfM12MHdVsNLoj5LrHxtgInXqv8gVgfRhgWRljdkYFFx4KzgpSdzKeKKaxR+g8=
X-Gm-Gg: ASbGncsWt3wdCrCgg/fxaNsHOvrwvjQKAirgFb9PLysi6NW0em3LfGG4e9X99zo2bc3
 xGIA81i85J0BIptwzAKgOIIAHiA6xaCEEEZ0HaiRL9ZNLKLF6GblHDRE7IL15jHlQcttDRp7fi7
 zvHSCeIbgB4oCLWAHQRMTiy5YS9zRAY/FBiBagme9pphPf+Rid95ygOa6wHU08zr5IwSV3v/Fok
 odU1d8yHJLX2nm5RPEgFJzZ7VjyHzw/2FHG0ql5Ivt32J5gPAuW0rpU0rmtN63Zi0jrYJA6SoHA
 Al8cDMrBgEW4PfNPIH482WQUMA9jK8Gsl/hxKa032ecLqVPUM/5jacOt/8wWYDp0YdyqHUXYIjS
 mH/DBzwWY3tL/+shH26CSSplcrZeuUm0rakUkEjmcyH4dgn4uavbwRtB1G5EDGJ93MX18+9wr+f
 +ct6WDacxgMl6tzurlej+AhD0=
X-Received: by 2002:a05:6214:2aad:b0:882:4a80:92e with SMTP id
 6a1803df08f44-8829269e11amr264944486d6.31.1763538616337; 
 Tue, 18 Nov 2025 23:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhbzOHjM3pJ5oG9/YnHMk/5wiOCbLKCs9ygWrmLCux4YPpy1FxFLwoYztR9nqKADF4nodujA==
X-Received: by 2002:a05:6214:2aad:b0:882:4a80:92e with SMTP id
 6a1803df08f44-8829269e11amr264944256d6.31.1763538615896; 
 Tue, 18 Nov 2025 23:50:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0b36sm38666081fa.38.2025.11.18.23.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:50:14 -0800 (PST)
Date: Wed, 19 Nov 2025 09:50:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
Message-ID: <ogiiqha5ak5z4atck7ykyvbzw4juegsn4z7nazkkstiep3duwe@6qc5ag3kobj3>
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
 <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfXyggkkKBAH/0j
 usLhNS6GxTAW9d/czTAuytVafhkoUbcostDWdXGeY8iJFJqMaJJWpuG0aVvwscOolifHcF5Q0Xa
 mMG8GBh+NiEK17quIFqk/mVdoUwSCD1hMFZrua958/u1er9myycbjNVnKmnopAnsWanI1I4OuG/
 WHLp6t7qYQa3LEoI/cn/R0ePAV1TSrvr71cWADd6xbcYModlCnPYSJ0/JKz5iCwzW1DhHKUWXkI
 RCT8jf6YZyOSvbLJBSZiwJP5G/uujpNGsmj+bEfISIJLdWY4OjcJYjLmfec+lDOAo/UxFi9Myx3
 +YCOLi66Pf1pYoNY2mN9XCtzCexZ7nfrMErA8WdQTGE9n/RptJDazFoZXjXEMQUCCZu3qERFbu4
 HoTypY/3Lq/XAn3SpWWRa7Khd+l45w==
X-Proofpoint-GUID: ubcZKmcukuyVkD7MuDmAfV8saKZOau-9
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691d76b9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ux6_d4rlt1bcc9Q1bkUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: ubcZKmcukuyVkD7MuDmAfV8saKZOau-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190060
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

On Tue, Nov 18, 2025 at 04:02:03PM +0100, Konrad Dybcio wrote:
> On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
> > Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
> > callbacks embed knowledge about platform's alpha range (8-bit or
> > 10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
> > alpha and reduce alpha only in DPU-specific callbacks.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
> > +	const_alpha = ((bg_alpha >> 8) & 0xff) |
> > +		(((fg_alpha >> 8) & 0xff) << 16);
> 
> This begs for some bitfield.h

Which one(s) would you recommend? Ideally it should be something like
'get N top bits', but I don't see one.

> Konrad
> 
> >  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
> >  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> >  }
> > @@ -160,7 +161,8 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
> >  	if (WARN_ON(stage_off < 0))
> >  		return;
> >  
> > -	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
> > +	const_alpha = ((bg_alpha >> 6) & 0x3ff) |
> > +		(((fg_alpha >> 6) & 0x3ff) << 16);
> >  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
> >  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> >  }
> > @@ -178,8 +180,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
> >  	if (WARN_ON(stage_off < 0))
> >  		return;
> >  
> > -	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
> > -	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
> > +	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
> > +	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
> >  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> >  }
> >  
> > 

-- 
With best wishes
Dmitry
