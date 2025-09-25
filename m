Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5EB9D1EC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DCA10E26A;
	Thu, 25 Sep 2025 02:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6hbMzC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3436E10E26A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:18:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONqWpC023856
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1tdqO6cd5fS/+0X1NnexIlG3
 ahbTElvONhvf7VCi+6w=; b=I6hbMzC1fh2Scl+TOYopFwKYOj3BNWylHO/zZqGk
 6gfoCqw7pFzO1jOYtskX3JNJB6AGkeoaw2/cipQvzyOQvilwapzlzq3xqNaTOciR
 McMhPo6Oayuq8nkVhnDNaLHUDB0OAwP8XxR76TDUFT3lXBFRdr4BY/hYu2M2qmKh
 s4LWdCErmLCWF9ml0O3EBI4KFK455jNaGvDfjz3vm0SE5q4QtVrNgjwrx1L1r8gE
 y6oW614EMhcKxW42n7a+KjaJayj2CPZSDJjJfWdPlq7qQnOYMMXeKHkfcOVfDETL
 eK4ZAm1JDR/bF/N8hiUyCRrvCBJZAxe295l9ED/uSXyydg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0debp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:18:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4cce66e91e3so15332671cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758766692; x=1759371492;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1tdqO6cd5fS/+0X1NnexIlG3ahbTElvONhvf7VCi+6w=;
 b=UF5WiOo8wEGEePS50aDixDs4EgkP8pc5w5DiCstPSxbaqYQioUk4M+6HS1HCtyGH+y
 Tp4h7KPyo4yxJWP3shzSjcb9pEKkxyhmYHTFniuR2WSmtUnQ0gaMejB+3F26XTCGrH+R
 KGmHW1BtoXIhbfAMrCyR/UWXCd0upjzLJ9AjeyfSyxdGE82aHmDc1ChmydIBrPj1nPHq
 wbR9tfilq5lvnbe/1WU2Nxquly7UHYPKDi7sAX5vfhTkXnszJ90IVbNVMPYcFKXjs9hI
 bpklcRmcX5WV3E461NNwDWk2GNreAlpbUo4iizVl4PLq6XNtx1Xij/H1P9T9VXLwKhD3
 kcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1UsC1Hx5FbN0OhU9I9rVT8xeExBPxqxGYzgqLbvCTtvkwCrsI1LgoErfLTcacgbiZ/wxvHRzvTaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHMpJt+B3oymhj5N3wpTQO8503/LVLNLNkIqZYHQcizmxwvnZs
 Os54GXORiCHwmd8+/uwWZFI7ZB2OMLjrGsN27FFEqdC7DnXfIp7OqHvhfmsRnov/7KtrNEwokeC
 1VftD4HBN7dirWf0B91jrYfYYvutBSBa2FylC9n/rUNM/TWM86qjE8w5G4biXZgbXXT78Ors=
X-Gm-Gg: ASbGncvos+WLfhAJLXsXPPU8q36Dl6OsBOn59TLPcDDK/fTW39IVq2uf2PtbZ2L6Ivy
 pjO9cSQiSsstq1if7j/9vZm0aSi8otJ8H9ZYD2Jl+KgzXuXjqPkR2+ZsZGf4QQlRuXOUVlVq7Iq
 kyrLn+DA0ACnQ/3CmNqvwAd1zY09nFslQJ/NB+A3IS9zO8Cc7NOu2oilw4wLfrVSXkUhwXKaRqp
 jHUvZzXwMqXuVBo6bb/oax60CKjIaH+FP9RhXXMwSLBWGUMUx75up0c5VGX3tzDf4VA8Cxai41F
 IXGlEke7k3U101hu69gE32SOFLRT+0QcMges3yE2nKiUg/EFfQRkWovhCVznh2jtT/Wi39Fl80c
 2K8djrAaLm74QlkKjRPXnUKN/BUAPuuvouqN6o9J0MWWwsiDBrY+T
X-Received: by 2002:a05:622a:1793:b0:4d0:63f2:7f49 with SMTP id
 d75a77b69052e-4da4962f5a5mr25304281cf.33.1758766692080; 
 Wed, 24 Sep 2025 19:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxpvMVwwqQ5NSW2xYygd6P9uBSKUklEXxj6opSTMlhrMfSS6SRxYcwepDRrUJAQRSgxE63IQ==
X-Received: by 2002:a05:622a:1793:b0:4d0:63f2:7f49 with SMTP id
 d75a77b69052e-4da4962f5a5mr25304041cf.33.1758766691461; 
 Wed, 24 Sep 2025 19:18:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313dd5f4bsm242768e87.52.2025.09.24.19.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 19:18:10 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:18:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, quic_abhinavk@quicinc.com, simona@ffwll.ch,
 sophon@radxa.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <6mq5morx4kuwmxa3dhpxf42uqedtveectlbeodl5oj74rqk4gy@oweda3unauqj>
References: <zopgbudg67lygconkv3bl43xogzl6rncif7wdpclbyc4wblan2@n7v75dbnaqqd>
 <20250925015112.19499-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925015112.19499-1-liujianfeng1994@gmail.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4a665 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GGPZM4PYextjLufLVlkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Q7V6qHiQ1gN4PhvL5r17mFgGjmMuxUY8
X-Proofpoint-ORIG-GUID: Q7V6qHiQ1gN4PhvL5r17mFgGjmMuxUY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX5WuR2OPFKPLS
 DwOpaf3LX9/8/muVLWz+KUNQ/Ft7EX2fhdzKSXujF3j22pVWoYw8szNnMj/BkxwsIcODZkB2SE+
 DhasUbLeoNov6kHfV3c+KxayUPixnRXaFrp2cgKrGkNPkn8xNCivA5yTJyUt/JcKCyq24bs8K7D
 ilaU4zMbDgJ3A9QL9QvKXWxl1nmG0B65hL9qHzvSWfVCWan2eDFbKIgB9ISKGnUbUdkEkCn7kCp
 4jfBd6SXjeHVJ/kGVUm6HO28Uu7a7tFjY4ULoL3VjiYApuJJaJKp8VQpZ5UrLr1Xx+fgFO2RUgW
 VSSNSq3lwc2i7fmiibj0dMx6wJOoBeQb/Jfo4GMJO4AcozWk3STKwjMOtTeQy/LcgP46MasCs1/
 bdNQx1oE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
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

On Thu, Sep 25, 2025 at 09:51:12AM +0800, Jianfeng Liu wrote:
> Hi,
> 
> On 2025-09-24 20:17 UTC, Dmitry Baryshkov wrote:
> >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >> and runs hw_params. This commit will add hw_params callback function
> >> same as drm_connector_hdmi_audio_prepare, so that hdmi-codec driver can
> >> work with userspace alsa.
> >
> >I think something is wrong here. The prepare callback also should be
> >called. Is it that the prepare callback is called too late?
> 
> I have added debug log to hdmi_codec_hw_params() and hdmi_codec_prepare(),
> but only logs from hdmi_codec_hw_params() are printed without this patch.
> After applying this patch, hdmi_codec_prepare() is called after
> hdmi_codec_hw_params():

When does q6apm_lpass_dai_prepare() happen?

> 
> [   14.218445] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> [   14.223004] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
> [   14.534614] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a660_gmu.bin from new location
> [   14.535750] [drm] Loaded GMU firmware v3.1.10
> [   15.727443] rfkill: input handler disabled
> [   42.647157] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> [   42.656774] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
> 
> Best regards,
> Jianfeng

-- 
With best wishes
Dmitry
