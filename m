Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC21B422B4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2650410E89F;
	Wed,  3 Sep 2025 13:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiQUHPMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAE310E89D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 13:58:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Ba9B4025182
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 13:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MVkE7pic+AjgsrJue6GbGhHU
 Q9x1JH8BDEQU2GuSGtw=; b=JiQUHPMIZ1amb3LmdAGVRwan/onxU07FjGXjPdtW
 cNxHn+V3hA+FkdtJyEdKoHaK8NdL+727EcxpzkHqp+f8dUD9LvDNDwD2FWbMogVR
 LTN+lIQhVDYNKM+SbXQgb43Iu8PuIErNavhOMQVs45uRyxJszpZNS4sS/Z+OgzP0
 P3boBMO5sU0t5ZfyM4v8EdQZZw2nfw/+guwGFJkSCFiFrrRcO6B+u+ONgsZUd3Vz
 eIKYv4Nkty0xMA3gyISMno2+JEvimM/mdLFGYYOuwT/jq0SV4c0Mc5KmW52BPfuG
 MPWKou82NFEY4RYM+lIEccMp7FPHbWreVjzleEodtYPRsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj0eq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 13:58:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b49715fdfbso12766831cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 06:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756907914; x=1757512714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVkE7pic+AjgsrJue6GbGhHUQ9x1JH8BDEQU2GuSGtw=;
 b=iY9JdDaWGtanWGgEXFX4R612Rf36v2ddh72iT5QiNhst8XHXsHlxabq2Kp/zmdCbFi
 t2OOIZZed3eIsbSrhuTM6Px1Uyr/dLfu5vI94TBjv/CcQbH04eqGAaVvqRPNLmIe//G9
 E1y4xxLUhXzsZ7qnK4SxfZrGv8Z+nMyroVM0QvT3FhluGcTyNnLFm6ZEbG6Yg7YaN/hM
 Xi6AELUaX3pUcOgOBDAIjxhV6yZZ5/gHdwLqa1hILGYQAhzfOsfsXjVj6q2ROeT2hJ7S
 +W6ruADp79hAFDg3YJpyj79a6BEwBbNQndlo25bPZD99p1mOQ/nCs7VH3jLAERVBrI8J
 /HgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdaZ0MKQ2t2XqFKEy/62gPXPnGCosG+TLyURhIjSj7bMDBHnVSxTXkjD19ye1fP1PlJhp/Ip02csU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrS7dqF9nGPEkvTaEXT+JBeBtORPqnP3np/TJj0k4Ymi7RrClp
 1N2VQNOMIcZm4EwSN1Pg7BFNmuri9KXBffnuXn0kztXKLwc6mWgoYD5OotgexIYpestjPIVE1Se
 Kcz5KUDqxXB0DpS+LUEhWT+NOsu2kfMktq1H5IixfVF487aKkY4h/qkckiGC0yKw4JjpjgFk=
X-Gm-Gg: ASbGncs6HHH+9tOT2lb1YuGku7IZYp9qBY18jRzPO4MY4Av/Z1V1sBxNsuggsrHjTUU
 HZ85GnkROVP3erQy1LZvGVsFJjwwmfQ4QeFGWXdFkr7jS3AVe3tRHIc3GfLbywC3bQQYInnAhGZ
 sU3UrCCCt1xXhhflpjhahgLwyidBSV9+gokxSylp7MACI8rPiwi2NwqbTkj0gmCoRPlJh13IHTj
 Boc9vk2srFtnjKUNRPRGiKvDqmjIhONZRwN7+LJwubZf8p/wSAE/3E5066ta2kcrW8OeK6aPOMl
 jUjWQoKB6T8grjzis6/fEWsJ8h6erQ3Ail4NIF2Fp7Ssd0XTdEgf3sUnWLjf3W+FMuP1MZBEoUU
 /SHaH/5GfjcXtGvfm6XxjGAhfXy2QFWz1Z3J3+pJ+a3mPCoDwEB2v
X-Received: by 2002:a05:622a:1306:b0:4b3:81b:c5b0 with SMTP id
 d75a77b69052e-4b31d547993mr175559041cf.0.1756907913703; 
 Wed, 03 Sep 2025 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhtC2LX93cq9JwucMfrRhPpM+u3XQlKXseCZc/zm0UTkPE9L8QBLFctB4NBw13tUK4hQVEEA==
X-Received: by 2002:a05:622a:1306:b0:4b3:81b:c5b0 with SMTP id
 d75a77b69052e-4b31d547993mr175558381cf.0.1756907913057; 
 Wed, 03 Sep 2025 06:58:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad4cd7bsm546787e87.144.2025.09.03.06.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 06:58:32 -0700 (PDT)
Date: Wed, 3 Sep 2025 16:58:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
Message-ID: <rfhqfbx4q3kl35ktzaexjjshzosv4a2tkjthtvo24aoisrdvj7@i63a55qx4mnn>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
 <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX5QyEtr+DpAEB
 K/EBkUtLf9an6p/EyMte9CVBM0fIvM0MRy1lz3k9YCJ8rbp1vNkYQrFU7lnpZbvg/0p6tYHRGg9
 52VFOBYkW4CVCyUORj6RDFi2Nge/1tjVSYVp6HjEi79pveES4T80qrv045iJZmQJq0m5u1MEYr8
 9y2nwfFPa/fDqrTynNElfZP7NNTY9LFfScrwnYF08ilEExL0+H4g5+hVsZ0WSAe42/Kcg4aoMPs
 AI9tsYcKlgLgvnmumrvGrvD0EpygbIjcgjqUCBiD8yMVudPnibQdOQAgVMqg3P67eAHDBIAPcts
 ug0L4RCqREQ7OcfFKlpv5+OsjvauWffu1pTYD8sxS4dSFC5tYgXhr8nlBxVayLSi7AddQAnRPGs
 UX1Wnmqi
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b8498b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3kmh57S2fnx10ZXIFTUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: e5R7EsrM5vZGYnTb2dIlNepwMP4UuQMS
X-Proofpoint-ORIG-GUID: e5R7EsrM5vZGYnTb2dIlNepwMP4UuQMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
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

On Wed, Sep 03, 2025 at 03:41:45PM +0200, Konrad Dybcio wrote:
> On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Update Qualcomm DT files in order to declare extra stream pixel clocks
> > and extra register resources used on these platforms to support
> > DisplayPort MST.
> > 
> > The driver will continue to work with the old DTS files as even after
> > adding MST support the driver will have to support old DTS files which
> > didn't have MST clocks.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> > index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> > @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
> >  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> > -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> >  				clock-names = "core_iface",
> >  					      "core_aux",
> >  					      "ctrl_link",
> >  					      "ctrl_link_iface",
> > -					      "stream_pixel";
> > +					      "stream_pixel",
> > +					      "stream_1_pixel";
> >  
> >  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> > -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> >  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
> >  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> >  
> >  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
> > @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
> >  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
> >  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
> > -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> >  				clock-names = "core_iface",
> >  					      "core_aux",
> >  					      "ctrl_link",
> >  					      "ctrl_link_iface",
> > -					      "stream_pixel";
> > +					      "stream_pixel",
> > +					      "stream_1_pixel";
> >  
> >  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
> > -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> >  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
> >  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> 
> Something's not right here

No, it's correct as far as I understand. On this platform INTF3 / PIXEL1
is shared between INTF0 / PIXEL and INTF4 / PIXEL2. So it is
counterintuitive, but seems to be correct.

-- 
With best wishes
Dmitry
