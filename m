Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C7B09F28
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FC810E927;
	Fri, 18 Jul 2025 09:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHXEjKjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8C10E339
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:20:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I00s5s015972
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xP5/Ju7BT7Kyo8TEuoPLdEqx
 ZTvQzo3IKw07UT+ma2M=; b=BHXEjKjnG9KpifeOUWsE+Cvq+I3Yp3bpY+twbrjV
 44BreJ1H3050jboyZCBQeqhnqw0Z3Q99HKmALb5VidIv6r8bLn2SIfZwbUZUnVfb
 jD1aeY9m99MF2+IMjqUTUwJ+25lMG1Z7DzATAv5uzR44WaPglYqTn6rVAqULEkfQ
 wHkQ67tVUqQa1Holh0rzXXy1VSUwIM37wuAuNLsoRuyJ1wjHOlio3sbMoIMOCG2V
 XAJSDFr0YB6ZgH73TEGPqLvhFnhHE4ZoOd+aKcQKNJkYhLDPTLl+xWtBjvxvoR3H
 5RUsae1XTDA3ZplDm8fQj/vqQRWTngn8rad9soQgUCE2hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc2spq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:20:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e347b1a6c7so424762185a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830437; x=1753435237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xP5/Ju7BT7Kyo8TEuoPLdEqxZTvQzo3IKw07UT+ma2M=;
 b=lnkQyNZn8LjCiC+N4kEHRdZiWCNX3rmO4zA4I59TDIdgKxemsrx3shFgm94AsM0Nqh
 +SOzIHBKUdrGX0Y4wbjQzsjJvh0CBtHxcgr0u23PfF1R+e6LBUADJm2UpFOl4lcpRj0i
 hpEi+Z3UXA0KcgEFJwHTXkZ1QZ1DZ2rcLdQhNCFaSgCNa2eS/jHx5S2f9Zsqc56GS47i
 hUBugkp2WXEWjYUAQe4dJLYyAVtVikC4pOqP3sIxizpC/SCcMU+bEZuDbMABEku6lAeZ
 WMhKQqK6x1OEKbniDeEMi5wg1QyfKyhVPgbWOpzd5P/QG2IdhpnVDb9eTAZHd1wftbLL
 kOlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpN7+ZGEtuFXdq/nDctUYLv2HEIwepuZgd9bYOR8zy7SOw/5HK5vBi7dan4ZzY/WS3RsaVm1d/EoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr0UYzBFQUJ1ImaB9r4jN85hq+3B79ISA8SrRd+tzJudR4f1lz
 JyljG2CDGk2HerD+L11Z4h6VYv0pejo2tZWk0/SyHPa9XxhA5wFYf4uYGBzrOG/Cft+hrZS1HDD
 RurDHcgKJjU3uWz1yCe0IrfttvzJ3SjS7fid/tSugFxHKrwU7D0vJIdnM1RQO0rYpo4Jgeg0=
X-Gm-Gg: ASbGncsfV/ioNtLMlaK7yy6bxrdj1dzxB+L7redzUCoisoXdwBvHtC6QdAcB23zUuWs
 JGXLJRFSKXKCit0vtOF2RcVhWe0gPgrfxScmudPLB0oxScPGi9AgSvz5z1zUOUXDsA5d7gbdu8u
 HNZbCsn/uXhWY6whcezf0Sfqc2ZO2HbOmcZZOuKhtk4sgK6+ahK4ccDAR6yVyOHohoWMVXMDRrl
 8qmJr/67fX828DfDiMpB1lXocofsuqk4H+a43kcbXd8EnBdl1nSHnov62JnebtW6Z+ZxNRn967T
 vu4W+yz8cGW8gPJWiFuCPPv27rl8scwfzlmsNS+K/tWr5URC7DKWO07Zv505tLLzg2XpwnaOKc5
 cNgJ0y0gGaRevEmZdS/0DZ/rTiju/WdDYDIuQCkmkbMnR82Ph8lze
X-Received: by 2002:a05:620a:4113:b0:7e1:5efc:704 with SMTP id
 af79cd13be357-7e34358aa8cmr1493487885a.24.1752830436604; 
 Fri, 18 Jul 2025 02:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHZG2cd1Lk5nnPdRYiI+JFDjEZSiAdIFfQQO0ju7gEy9eL8hZAZmxfBxT3n3OY0DoA43ZKcg==
X-Received: by 2002:a05:620a:4113:b0:7e1:5efc:704 with SMTP id
 af79cd13be357-7e34358aa8cmr1493483885a.24.1752830435988; 
 Fri, 18 Jul 2025 02:20:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91eb927sm1384221fa.90.2025.07.18.02.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:20:34 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:20:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
Message-ID: <5647urec3xivzw6jbkrcomizkutryte6l4uskiex7ji4tqnmxy@prjrintmtyyk>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a11e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=O5eeDxwl5e8XsXNvIOQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2dJ3w-ohvfeUpBOjxKqb7I0EVUpefKFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX0T6Y1vvUSOM6
 AjEZ+MzNL6h0tJuFGXc9YDNyXZvtoemX3438cTQ7MZpA4aboRWvdyaMY06NgVdUYMDzXKxOQvhC
 osS+xgThe4/PKv7m3v7Q7KTbLDqjeDkJGVHEVOYqLycRC+/2ctJ0Ut1wpbjP/AYZ5Wr8U9yC9+8
 Dr1wUKNPL2JHUs7Q4JT2gjn56cT4qkJNk86gQ06DfWsD5c/xMEJQwKLcMK2DW45hil1LYzeKJWU
 7sxdp2Yn53ot8587DThIgFK0sPvxLaSofTL3qJawLHGlzUny50yKU2K3z/kp/e6dQzSWWAY1bcA
 AnZQGPsxW9+jt5JvSoa5Qf919XZoQ06ZfrEWCvmq9SBi3N6ohoqFW3Rarym5mu0MRYQRtJmQsfd
 8l5BKxn8mIGJxJIKp234TriLjyKJxh4uIcXMm7humd+ciXmTjlIng4OY3gZ5Vzdmpi9Q0a/o
X-Proofpoint-GUID: 2dJ3w-ohvfeUpBOjxKqb7I0EVUpefKFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=632 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072
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

On Thu, Jul 17, 2025 at 04:28:47PM -0700, Jessica Zhang wrote:
> The following chipsets support 2 total pixel streams:
>   - sa8775p (on mdss_dp1)

Uppercase chipset names.

>   - sc8180x
>   - sc8280xp (mdss_dp0-2 only)
>   - sm8150
>   - sm8350

It's very strange that SM8150 and SM8350 support MST, but SM8250
doesn't. Are you sure? Your patch contradicts this.

>   - sm8450
>   - sm8650
>   - x1e80100
> 
> The following chipset also supports 4 total pixel streams:
>   - sa8775p (mdss_dp0 only)
> 
> Add the appropriate amount of pixel stream clocks for their respective

s/amount/number/, it's countable.

> displayport-controllers.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi  | 34 ++++++++++++----
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi | 10 +++--
>  arch/arm64/boot/dts/qcom/sc7280.dtsi   | 10 +++--
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 20 +++++++---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 +++++++++++++++++++++++-----------
>  arch/arm64/boot/dts/qcom/sm8150.dtsi   | 10 +++--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi   | 10 +++--
>  arch/arm64/boot/dts/qcom/sm8350.dtsi   | 10 +++--
>  arch/arm64/boot/dts/qcom/sm8450.dtsi   | 10 +++--
>  arch/arm64/boot/dts/qcom/sm8550.dtsi   | 10 +++--
>  arch/arm64/boot/dts/qcom/sm8650.dtsi   | 10 +++--
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 +++++++++-----
>  12 files changed, 167 insertions(+), 69 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 45f536633f64..2c85eb2fc79a 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4237,15 +4237,28 @@ mdss0_dp0: displayport-controller@af54000 {
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel",
> +					      "stream_2_pixel",
> +					      "stream_3_pixel";
>  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dp0_phy 0>,
> +							 <&mdss0_dp0_phy 1>,
> +							 <&mdss0_dp0_phy 1>,
> +							 <&mdss0_dp0_phy 1>,
> +							 <&mdss0_dp0_phy 1>;
>  				phys = <&mdss0_dp0_phy>;
>  				phy-names = "dp";
>  
> @@ -4316,15 +4329,20 @@ mdss0_dp1: displayport-controller@af5c000 {
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>;
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dp1_phy 0>,
> +							 <&mdss0_dp1_phy 1>,
> +							 <&mdss0_dp1_phy 1>;
>  				phys = <&mdss0_dp1_phy>;
>  				phy-names = "dp";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> index b0e342810ae7..96090a948ade 100644
> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> @@ -2139,16 +2139,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index b1cc3bc1aec8..48b6a17dcea0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5012,15 +5012,19 @@ mdss_dp: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  						"core_aux",
>  						"ctrl_link",
>  						"ctrl_link_iface",
> -						"stream_pixel";
> +						"stream_pixel",
> +						"stream_1_pixel";
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>  				phy-names = "dp";
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index b84e47a461a0..ca188c7f1f26 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -3233,16 +3233,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
> @@ -3311,16 +3315,20 @@ mdss_dp1: displayport-controller@ae98000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_sec_qmpphy QMP_USB43DP_DP_PHY>;
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 87555a119d94..11ea2fa0b853 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4338,15 +4338,19 @@ mdss0_dp0: displayport-controller@ae90000 {
>  					 <&dispcc0 DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface", "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_0_qmpphy QMP_USB43DP_DP_PHY>;
> @@ -4417,14 +4421,18 @@ mdss0_dp1: displayport-controller@ae98000 {
>  					 <&dispcc0 DISP_CC_MDSS_DPTX1_AUX_CLK>,
>  					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK>,
>  					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> -					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
> +					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>  				clock-names = "core_iface", "core_aux",
>  					      "ctrl_link",
> -					      "ctrl_link_iface", "stream_pixel";
> +					      "ctrl_link_iface", "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> -						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
> +						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
> +						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> @@ -4494,10 +4502,12 @@ mdss0_dp2: displayport-controller@ae9a000 {
>  					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
>  					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK>,
>  					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
> -					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>  				clock-names = "core_iface", "core_aux",
>  					      "ctrl_link",
> -					      "ctrl_link_iface", "stream_pixel";
> +					      "ctrl_link_iface", "stream_pixel",
> +					      "stream_1_pixel";
>  				interrupt-parent = <&mdss0>;
>  				interrupts = <14>;
>  				phys = <&mdss0_dp2_phy>;
> @@ -4505,8 +4515,11 @@ mdss0_dp2: displayport-controller@ae9a000 {
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
>  				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
> -						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss0_dp2_phy 0>, <&mdss0_dp2_phy 1>;
> +						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
> +						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dp2_phy 0>,
> +							 <&mdss0_dp2_phy 1>,
> +							 <&mdss0_dp2_phy 1>;
>  				operating-points-v2 = <&mdss0_dp2_opp_table>;
>  
>  				#sound-dai-cells = <0>;
> @@ -5669,10 +5682,12 @@ mdss1_dp0: displayport-controller@22090000 {
>  					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface", "core_aux",
>  					      "ctrl_link",
> -					      "ctrl_link_iface", "stream_pixel";
> +					      "ctrl_link_iface", "stream_pixel",
> +					      "stream_1_pixel";
>  				interrupt-parent = <&mdss1>;
>  				interrupts = <12>;
>  				phys = <&mdss1_dp0_phy>;
> @@ -5680,8 +5695,11 @@ mdss1_dp0: displayport-controller@22090000 {
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
>  				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>;
> +						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss1_dp0_phy 0>,
> +							 <&mdss1_dp0_phy 1>,
> +							 <&mdss1_dp0_phy 1>;
>  				operating-points-v2 = <&mdss1_dp0_opp_table>;
>  
>  				#sound-dai-cells = <0>;
> @@ -5741,10 +5759,12 @@ mdss1_dp1: displayport-controller@22098000 {
>  					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
>  					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK>,
>  					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> -					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>  				clock-names = "core_iface", "core_aux",
>  					      "ctrl_link",
> -					      "ctrl_link_iface", "stream_pixel";
> +					      "ctrl_link_iface", "stream_pixel",
> +					      "stream_1_pixel";
>  				interrupt-parent = <&mdss1>;
>  				interrupts = <13>;
>  				phys = <&mdss1_dp1_phy>;
> @@ -5752,8 +5772,11 @@ mdss1_dp1: displayport-controller@22098000 {
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
>  				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> -						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>;
> +						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
> +						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss1_dp1_phy 0>,
> +							 <&mdss1_dp1_phy 1>,
> +							 <&mdss1_dp1_phy 1>;
>  				operating-points-v2 = <&mdss1_dp1_opp_table>;
>  
>  				#sound-dai-cells = <0>;
> @@ -5813,10 +5836,12 @@ mdss1_dp2: displayport-controller@2209a000 {
>  					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
>  					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK>,
>  					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
> -					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>  				clock-names = "core_iface", "core_aux",
>  					      "ctrl_link",
> -					      "ctrl_link_iface", "stream_pixel";
> +					      "ctrl_link_iface", "stream_pixel",
> +					      "stream_1_pixel";
>  				interrupt-parent = <&mdss1>;
>  				interrupts = <14>;
>  				phys = <&mdss1_dp2_phy>;
> @@ -5824,8 +5849,11 @@ mdss1_dp2: displayport-controller@2209a000 {
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
>  				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
> -						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss1_dp2_phy 0>, <&mdss1_dp2_phy 1>;
> +						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
> +						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss1_dp2_phy 0>,
> +							 <&mdss1_dp2_phy 1>,
> +							 <&mdss1_dp2_phy 1>;
>  				operating-points-v2 = <&mdss1_dp2_opp_table>;
>  
>  				#sound-dai-cells = <0>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index cdb47359c4c8..3a21a2e2c04d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3894,16 +3894,20 @@ mdss_dp: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f0d18fd37aaf..fc7c610c15d2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4774,16 +4774,20 @@ mdss_dp: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 971c828a7555..6a930292edd3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2872,16 +2872,20 @@ mdss_dp: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 54c6d0fdb2af..b0680ef30c1f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3431,16 +3431,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 71a7e3b57ece..226c457338d9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3545,16 +3545,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 495ea9bfd008..72c63afe9029 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5388,16 +5388,20 @@ mdss_dp0: displayport-controller@af54000 {
>  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				operating-points-v2 = <&dp_opp_table>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a8eb4c5fe99f..e86b6cb20096 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5306,16 +5306,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				operating-points-v2 = <&mdss_dp0_opp_table>;
> @@ -5389,16 +5393,20 @@ mdss_dp1: displayport-controller@ae98000 {
>  					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				operating-points-v2 = <&mdss_dp1_opp_table>;
> @@ -5472,16 +5480,20 @@ mdss_dp2: displayport-controller@ae9a000 {
>  					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				operating-points-v2 = <&mdss_dp2_opp_table>;
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
