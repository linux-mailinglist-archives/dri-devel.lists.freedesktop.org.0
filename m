Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF5B426CF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA5788E45;
	Wed,  3 Sep 2025 16:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3YTi+Qd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B9D88E45
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:24:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dwslm029895
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 16:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oaSQ7ufpcQxDCN6LeJ8N1WOp
 u8FF+bQ6qW1sUI4ZhrA=; b=U3YTi+QdWuUX6xrpJChhPKGVdgWdgIARcjbvblBT
 qamK+ggMtYl37hsI1tJlXSl+d/va9TdSDSwHgmlQekYpl7xOR8mtk4h8kwhytOGH
 2HPBW9/SNcImjWYG4xy6poWMIHDJQoxgYJOFtj9G/ccK4PnKbFj+OvkMnFNSNpis
 R4stUfQAcu5ruXK4iBWIYFYCwNhXgzNx3Ylq0Q+ICS4xNnyqExlYmQQtGd+LL5al
 dLErmDRJVMrAVV3AFOscM29IKIUjGpotMxpHN9NERa7bOJpBxPUa9eL/VxG8NX8n
 hetVFDcGFhN3lI7zFbjTt2cgDiGYyXRrcLhAlgMr3efk8A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpchy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 16:24:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7224cb09e84so272756d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756916676; x=1757521476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaSQ7ufpcQxDCN6LeJ8N1WOpu8FF+bQ6qW1sUI4ZhrA=;
 b=tSzKsVMfPYm9I7TRffH9wlaWLQNvHydEdbAh1RcVUb+0OTIN+65fHz5Rxgv3v8qhTD
 NyZ7LWNFIhHa6ccHqyqOtJBQnQoDZoMLIlvOFT7cwhtPOMQ9u2WBSAKJtWJ6Ulkl0ncW
 AURO1jDnc7djHtZJsES4BdD2UU4RtzCpsHH3+PcwK7iBLHJsGti9fwTnwG/ZvrTiuNSD
 hoH+Rb94u1o1vQnOOiC4j8M1d0IwP5qU9tNdCH3dB9SloYXFTSkiDbne7GA9A7Y0SKBR
 1vcqsOT62FQqO2stgvrVBdERxcBPowWKDR9taAeC/k45iA11zrrFW1jDKzvyzaP3AE3l
 CuUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPrvPOq52cXGJTxJ8pb616HXdh3u3Bg6/w2pgzXQCQtejmroRb7rAzLEekVKsdF0/6qe/doA6rbVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK3Am2szYXnk+hpIjhY/AztjSOz3Su3q01fCJC5W7EBqcmfQ6s
 FpBhDKi29qPhM2RMddvMjP/Bd2ZcnCmhnCIuLC88/pYdlG65Vzis0a40FCibhiZ+gJCDgV/tyFz
 8FHoG9/pGF/+d0FP/sqHPWmEbHu86MHhE7Fd+HvE4iPP6ypEFBWncjDfLq9oGqjuOFiUVtjQ=
X-Gm-Gg: ASbGnctT3x5/QRr/hWxo08fieVRsROtOA3cGu2IMgRRS0HgVL+LFJYP0HuPW01DfGu0
 iyy4nlkbQ/ty68Vqd0hUPbIm2xYgF1tjasdbWYBbDxhoA/WT6BBe8SpiscA6Igc++mQxp2OVnCD
 6j1cwB1e/QjuUO69EjMUw0Sx8FTiSYzCmJPDY8aZffFFBNkFKB1wQcthZiMu93xBbvpej4UbM1/
 CDb9sQ4LkRzwKT6tyMcfxSpAYsUM5TZiuGsiC+QSLFX+PW45OKdw4xlI+i72wxZzzkLnnzY3CSj
 fn6Pk7CSnMctX/NI63thwfubfHz4O7jgaTP6AA8H+T5/mgjxzjeyN9sS7nobdXfPNXKweJE5yuW
 Yt8WiYsq4TJA18WRM1agJ7O9me+TSuJgrdSu28xFm9NtLLsstlV/k
X-Received: by 2002:a05:6214:5184:b0:722:2301:2fb with SMTP id
 6a1803df08f44-7222301132amr60988636d6.11.1756916675732; 
 Wed, 03 Sep 2025 09:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqWc24oF91JK1xSjy48sxY9KXX6E+0IZbkKERnqkOK9N88EtXTxpEWAmWnHEeRkqQNVqpfIg==
X-Received: by 2002:a05:6214:5184:b0:722:2301:2fb with SMTP id
 6a1803df08f44-7222301132amr60988016d6.11.1756916675062; 
 Wed, 03 Sep 2025 09:24:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad2c222sm600452e87.130.2025.09.03.09.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:24:34 -0700 (PDT)
Date: Wed, 3 Sep 2025 19:24:32 +0300
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
Message-ID: <bbqtiazy2wvz2oj2h4dadslu2qaveaqcwtgyqs6wuyzye4zmtf@fj2ysdoyf2nm>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
 <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
 <rfhqfbx4q3kl35ktzaexjjshzosv4a2tkjthtvo24aoisrdvj7@i63a55qx4mnn>
 <f34c72ee-971b-47e8-8d49-6355b2660925@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34c72ee-971b-47e8-8d49-6355b2660925@oss.qualcomm.com>
X-Proofpoint-GUID: vfZpgW3Tgrl1ZQZjgBSq67Cu45JA1DhB
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b86bc4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wpHHmcXYIatjU_FVFasA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vfZpgW3Tgrl1ZQZjgBSq67Cu45JA1DhB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX2gFDw8CQ+h2P
 71t7EBJhaVNauGTDCsKYD8+V5Xd8BqJyJTndQL3ohdP0+eCv8EVSTrxKQEbKJMJ5Ja6rOfLXoTQ
 XJypxUTb4uW5Q2Wql00EzyBakAi4ZDtuCoRZghvjV5cYBsp+OlfpFM+0RJOhFcjhQ7xg+8a0OJZ
 dx9RCWRG/CKuGQSq5n6PtZvbSwXij1XhAroRyAiQIP6M2tGY2AXB1+1/pPJKNeGy1H70mj5/xA5
 wgIt3IJfDz0OvTOfMXy8gLdRSaTpnDzu4zWvHy1BheEyWCG0fvq9wAPEzzXoWI9d+F7d6qAs2It
 Nz2SqP3KCxf5GDqee4zu5gqmWbBWXeEIB1Lv865PB0S3cPaNvBi5mjEBZ8B3qQeQc5FzD38M5LW
 g7/VcY8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On Wed, Sep 03, 2025 at 05:33:41PM +0200, Konrad Dybcio wrote:
> On 9/3/25 3:58 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 03:41:45PM +0200, Konrad Dybcio wrote:
> >> On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
> >>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> >>>
> >>> Update Qualcomm DT files in order to declare extra stream pixel clocks
> >>> and extra register resources used on these platforms to support
> >>> DisplayPort MST.
> >>>
> >>> The driver will continue to work with the old DTS files as even after
> >>> adding MST support the driver will have to support old DTS files which
> >>> didn't have MST clocks.
> >>>
> >>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> >>> index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> >>> @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
> >>>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> >>>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> >>>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> >>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> >>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> >>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> >>>  				clock-names = "core_iface",
> >>>  					      "core_aux",
> >>>  					      "ctrl_link",
> >>>  					      "ctrl_link_iface",
> >>> -					      "stream_pixel";
> >>> +					      "stream_pixel",
> >>> +					      "stream_1_pixel";
> >>>  
> >>>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> >>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> >>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> >>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> >>>  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> >>> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
> >>>  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> >>>  
> >>>  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
> >>> @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
> >>>  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
> >>>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
> >>>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
> >>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
> >>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
> >>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
> >>>  				clock-names = "core_iface",
> >>>  					      "core_aux",
> >>>  					      "ctrl_link",
> >>>  					      "ctrl_link_iface",
> >>> -					      "stream_pixel";
> >>> +					      "stream_pixel",
> >>> +					      "stream_1_pixel";
> >>>  
> >>>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
> >>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
> >>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
> >>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
> >>>  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> >>> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
> >>>  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> >>
> >> Something's not right here
> > 
> > No, it's correct as far as I understand. On this platform INTF3 / PIXEL1
> > is shared between INTF0 / PIXEL and INTF4 / PIXEL2. So it is
> > counterintuitive, but seems to be correct.
> 
> Eh, I unfortunately found confirmation for what you said. Hopefully this
> doesn't cause too much extra pain on the driver side

It will, at a certain point. IIUC, during the first submission we are
going to handle only the INTF0+INTF3 for those platforms.

-- 
With best wishes
Dmitry
