Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C13BC16F85
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BF810E672;
	Tue, 28 Oct 2025 21:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OstP8fKM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGpVh3Qf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E4510E672
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJllH92524097
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vb6dVEBF1GsrTqvUi/V9O4Oe
 gNy8kFowkn6bq/8s4Qw=; b=OstP8fKM1OdJjzrC0fYc/V3QRu5HUJQJ6KPqVswF
 ZtdSTSs/dDuwJIrnG+kRESf2fAKb9wWMO2b/XI3bKWanEJTdG8c5bN3w5sZJ/LOH
 E5IWqEuV2AfPsGKvo81T+58eFaL/kfwmbZ+jc2bEZTC/B/fJ9OCwIVL3d0uTsb+1
 /g64V2YyWY1MYpHnwyr6UYLUx2Qt68tqUa9yj/5SirENKyq1jmkWysLOS6HrM7df
 No5LbEWEZsax5CBhwg95Q2911BPQk8LqX6pnVKTESI2ZTaF7Bd3733gwpOnTwx6B
 eW5iHNpmIoMVftAuHVh1a8PzlMfWEGf8BvBdujcjwps4ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1r7w9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ecf8faf8bdso136190971cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686794; x=1762291594;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vb6dVEBF1GsrTqvUi/V9O4OegNy8kFowkn6bq/8s4Qw=;
 b=cGpVh3Qfr0uqsNAEAgIv0NGZAzATOLjYQqPvUXojVWHwqzGo/x/6HYt4vOD347e59L
 ndqEL2LucsRv6ey+CdOIv1+Wn4mMY0ZGqcPJbVAIfp7ggUAw+FiouX3zL/qkLs5M7/WK
 VERmaZyyQ+5YWBikixlCKPWx7GOPvUP0r5oso0f7PAlc4k0ndR9dHwbXLNHAu45HDdav
 O21Rcvm5B6h8p7p27LfFRU0GAQ4clF5sbFUu8h13GJMbKuRoddEBxlGgwxOVeJY8dvqv
 VGQ97uvsy45JtjOWCgnZSLTha+d4izq8Xin2lVDWYZKtZ3rZE9zQLt212fblxjN9KT2x
 oxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686794; x=1762291594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vb6dVEBF1GsrTqvUi/V9O4OegNy8kFowkn6bq/8s4Qw=;
 b=oiLUh+RuRvgW3CfxfVj5GZIOSy09T6EFYBeITAJ/pPKpvwOPsw3ZisnmefwfTuJfFe
 Ik/yt14z5YCnQ160rm9rGNDyh1XtTBtkjLv3YzLV3nyjH4TGhhrrO6wVCgRjy6eWj2v9
 Bv4dJcRF11AsTgUHZWBbM70Jlk6InzkNjbV8gxCdFV9xS+8TjVLJz+ggaAh1NYCkOLq2
 YiJPvwdoibiYb3eWuznta+R4+OCLP3mKy0EUiedjl2X9K7uxKpHZsYgTuNhN3TaA8MPo
 oBuhToeSRq7JgK6i0O7tpcOmO27to3y3BibQg7ZQjQOkxgNJfrCiwrj4IsTfGKpI20+e
 hnxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpVWaHtQnEDWalOOcLMXofm4eySKYk4viOQXstx0wOVJijicp/IMnTc4GSl+mDKUzNhlnDlVp1p0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzchRtPSkZQnYboBK54wjF6slJPZKBdEIlbFU7/lp2UQRGURkRT
 f9q0HjLvBb0lbwaqE2oSN7yyl1EqqOAE0U5Em1P+zO3/oDrVaq7T+gV6wdYlvzbUha72aG7V2vc
 6Oerx8lJ6KekqGKbI0iFCNOxBsjpLOLMI8iz3W3eODYmiG5aVgZpeTsHbYcfXahS17vYoxtI=
X-Gm-Gg: ASbGncvmuDihVuHMTlxv6e5ff+wDeIIuMIpNy8kaKqrYNbHaffaqyI1lfFqPKW2lE7c
 dCuRtUV0NbuaiWRVGR1cgn8T3Z+9+WUuhV6Q6+pcMVk4Ahib4hkLD6/JE6xdE6GfZqlF/rITarN
 ysWYpP4r2JRQBYezGznfis+LE1+KH4ey2hTbTmNjwJTyQnmFhHUUw7CwwTeScHsPQHB+pLRgYtU
 SEplfj7S5/a2XBc9Pok+OyPyrbBi2RiRisjTuBRHuA4HmZqGjliJhmot9PEgVPXYY82z8aGp9cP
 FiaSVs+V0BkbVXuZT/3/x5LHXfmJXtk5LFiA794GJlKsROD3aD0Xvr3N7h/vt0Zv2s44DrsQSVu
 neUUJphznOTg24Om+J5vpj4RoiHvKFs6x0jVkABrZimrFy3UcgEpX+UKcfnXQzeRoxcdoI0V4wY
 ld4tTG3mEoSiV9
X-Received: by 2002:a05:622a:1105:b0:4eb:7807:1816 with SMTP id
 d75a77b69052e-4ed15b5ab08mr9646201cf.35.1761686794435; 
 Tue, 28 Oct 2025 14:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoc7W3OAdXR6z0ZRmTUyu9evmiDq4dbWddJKVeKeXcDDjGijRuSjVD978ICY7up4qhMEzYew==
X-Received: by 2002:a05:622a:1105:b0:4eb:7807:1816 with SMTP id
 d75a77b69052e-4ed15b5ab08mr9645881cf.35.1761686794002; 
 Tue, 28 Oct 2025 14:26:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f864aasm3284263e87.109.2025.10.28.14.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:26:33 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:26:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/msm/dpu: Require linear modifier for writeback
 framebuffers
Message-ID: <6qev23tgzl3b2nkxgxgjkgd5tjljop37zhfm64unla46angtek@2fychx75wsqy>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-5-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-5-40ce5993eeb6@gmail.com>
X-Proofpoint-GUID: jn88f7CXgMsl2VV13DWGOSkuMsG-jRGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX4PUJixwMTbw9
 7+pU57yK4CjX4SRqRw+6ktPqS8qQv0FT9cFu2q1w0xgBh0ANoaB4UhB9HgRt7BgCG5tI5HkgwTw
 x/elxkX+xsCUxs8xHJCOECLcZl7dzQPgJU53XIXgK1HvEokS9Dg9Cpmgy/tI1PgBCNiKDTVEYYS
 suTzn1Hlfb7cjIUJN5TLF4GZQfZzQJ17juR42JeBwEsVBR0IlsvqYF9QMGo9/30M5b98poPf2es
 NTc+5G1N4wb9UAJTgkZF4sHlqYwNdRoKNtFP0vtxUjbsAs3NClLuvDrMEh/gwDZa7TQknUr5KzL
 P8t5+15Rzpw3pDti6FyWn6p5JMumW08Sd2z+oxBSR/BJ22rUEg20tMjoA6mcXOqDvFuItXht8Up
 rWdGk9aKXe5Vj6yO7MTbgUTn96VpUw==
X-Proofpoint-ORIG-GUID: jn88f7CXgMsl2VV13DWGOSkuMsG-jRGo
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=6901350b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AghEqMNuFSJYpPmXAAYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:39PM +0000, Vladimir Lypak wrote:
> UBWC-related register configuration for writeback is not implemented in
> the driver yet but there aren't any checks for non-linear modifiers in
> atomic_check. Thus when compressed framebuffer is attached to writeback
> connector it will be filled with linear image data. This patch forbids
> non-linear modifiers for writeback framebuffers until UBWC support for
> writeback is properly implemented.
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
