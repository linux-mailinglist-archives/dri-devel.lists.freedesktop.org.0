Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC96C4304E
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 18:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022F10E1E9;
	Sat,  8 Nov 2025 17:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8zryxwm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzTkGw5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE18B10E1D3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 17:00:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A88PaCZ1246446
 for <dri-devel@lists.freedesktop.org>; Sat, 8 Nov 2025 17:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SymD3woxruHShZlmzgGQ9Ao5
 sdm1n6xaKEBnyNrZI5I=; b=W8zryxwmyyS0uVOxyZdcWyJS7fEeS3r+4YSWjwAH
 0XsaGqv6tzTMZ3Pco9DdQqZSl2SDWFk+/GcF1CEWld8UTkEY7RcdX9bKPUdaI2ik
 MSIKK6If78PXQokl1VbgYqrE5UvCY+1p9ZJBIaWBsgSb6OftqJwRpa9N+iuLz5vB
 avPoz9QgcFuCQL2t785LjXPrOr1AK8mCQqaSlh1MolBFH71HQZrkAHq1hHm+/gCU
 I0F8y/Nkh2WkGUffdAXDrjwTEUKkD8SFX3r0sqWdBpsRrZ9yPnS5lTYruEkH1hSU
 eYtSU1MHNq9GN6+HMgz5HbHRaH0yn9NpB+Hwr5A+7khPgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y56runc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 17:00:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so55021261cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762621250; x=1763226050;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
 b=NzTkGw5LqsizL6ssv3i86nmILDQ95960u1JZqF/rTg47inBLvXPjcpboWIOtuLcHAQ
 4XMgPyuugaafTwRcM+cHDKDrpQmjy+fHFxhtfCblvO4BS1T22Erm/73PeQRNXi/l6Kry
 tEYaJIK30IsoQMX1uKkaC3F/QDDUPmD9Mcv7+e9qboHznr2EdFLkEbQ/CX0Y4yspARDV
 O4jeM2Mc7TERQgLKl1dMJXmeIy21qtL97azKYkKAn/tlW5yNKFJFh4pzDslevT3+qaaP
 qIcjf6ffb/AndCRFKZRaM4JlxTviEVw3MekfuaV/7Bxw9IOvNULaFhqFR6d+nXJQMp9d
 YlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762621250; x=1763226050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
 b=NwG4N0SpeU08TN0eGSX521vG2syBUs9pUgpP8uLb4w0X/UOrsuJ2Uy/o+mbaGdSsKb
 Ftd0dzThL9/Pfb+4zUJ/YNh6i7Z1CYSZoQoh5LNMZb+eI5qnCwYpcYFkLEfjMyEW5ok6
 4db3/A9B0MgB+mk9DTTzXD/RZTiHfw81nD137tjoFTg6BZH3Cnp/aODs7HSKbJf5s14N
 FFAJXnY/AtN2QRZCWIH0/JeYeSpzbC2jU+0rbWRrXpxMa9XEasTBx7GqWX3aGQcv0M7m
 hadfJ9cKFlWT+O6YbqDX5IzIShrb6TXhtjNbxMV57a0U3e8iJFyx93WyWwoYuZXWEMBe
 BU7A==
X-Gm-Message-State: AOJu0Yz7HxEcvCO1Anz3x9Ihk23C6XXO3sldOB3ihnU0Dbj7i1ZHYz7M
 Gsk2DRCifokLNdM9/ud5c+0fSLlUGuF/D3f6ZA0F6SHFMGdAflAzUezF+YeNNNRnhgx/2mwdK4E
 SqbqpK01u9w6cJIySkk+Z1KySYggR3hid4EdULFLk3mmol26CL+ufQYz2E6EdCeXeafc1ZjE=
X-Gm-Gg: ASbGncswHwzsAjIGskWr7/oEzc9QlWRCXKfR5Xt8tiFOdZIffSCxOdMC4Pv+/APPOp9
 kdiGZjLq5m8M6GfEC/Xkt5mXNGAXIafgXGp62c5isu/4L7xDeUJqyysjyj53JyUCgjfMFgULEga
 KGpvZLMknvDoYBkN4iKnUjw2lLfaKUYdedigv/sTzM5AdakEugolDcJbBstTcL0nMH0GjvvPoio
 Hzwm2GlVmRzxK07eoYk2XdOCFXDYzkw67N1qOHUkQYP+iETrT/+cOW3B+gE9gPXTY+O6Dh3w2Af
 pxOQ1+L/NIaqth9vlu6si5d4mC9+71u2rALMu1yAfrpxjGoKLzWBJNetlBDUcu2mNcLNZ85q1Bm
 NA7t9rAjjiuJ47apBqDH3gRI1mj8XPOuJnI9F6ft43RUE6LoSDoSq6WSnqJmuoyuXvC+WEM3MoS
 mbC8QowpNYW3hq
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id
 d75a77b69052e-4eda4e7bf1cmr44278711cf.12.1762621250277; 
 Sat, 08 Nov 2025 09:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1ot36r/5empkRXCspZfcIecbvIzABkFl724CS94Vw2gQkEMA6LYJRcTmCK9inn074sbu6tw==
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id
 d75a77b69052e-4eda4e7bf1cmr44277961cf.12.1762621249762; 
 Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a01a67asm2305233e87.38.2025.11.08.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Date: Sat, 8 Nov 2025 19:00:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/msm: use drm_crtc_vblank_waitqueue()
Message-ID: <hvbwatl37zseui27epzns5btxdzrjehamtua34ja6flenjxz3q@ac57pl6niv62>
References: <cover.1762513240.git.jani.nikula@intel.com>
 <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
X-Proofpoint-GUID: -_hLtKIsjrKGeeDIf6A8xZXrJRTvhn8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDEzNiBTYWx0ZWRfXxMPacQHK+Nlj
 /+ipl+u7Fw98UJvTYGCNZywSW83hWdmuLqe5vNrww2aExPOMTl617o/wvwVonnJXutN/8z3p13y
 86zepmpgyZc6oXEwb+8U8lP+choA52UTH+shiQW1UQOo1DGhGMTTUTaTPXF0VOCT8WrzQw2t9Eu
 WoNMca+NAJh17w1OVDzqZpjwzae0/E4P8TesRBPOeTkBj972Kt9PWsB/WPSNRQe/b4NdRbsB/D4
 Aiq3hS1qzlCCYqXxr+IhFEl8AsZw5eM17wuuUeedQNyLR7KpLdTjJIaOefQQlF6IM4BPcxXyixu
 feqBXdjp7TqLtSC2VR4cf7Lo0NEMdolEYCvkr56WZYkF3YYpwSPgWBAZ/uoVuzbCEYxn1i+fu/m
 yb+5nl2mB6U5RS0JKxzHWAhjJ8ki+A==
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=690f7743 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=32IxprGEISmnaGXNLfEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: -_hLtKIsjrKGeeDIf6A8xZXrJRTvhn8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080136
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

On Fri, Nov 07, 2025 at 01:04:57PM +0200, Jani Nikula wrote:
> We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
> for a vblank. Use it instead of poking at dev->vblank[] directly.
> 
> Due to the macro maze of wait_event_timeout() that uses the address-of
> operator on the argument, we have to pass it in with the indirection
> operator.
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
