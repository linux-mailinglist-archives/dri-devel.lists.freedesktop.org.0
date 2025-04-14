Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F4A87F32
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3092710E067;
	Mon, 14 Apr 2025 11:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBlrnFEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BEC10E067
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:37:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99v5j001845
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=m+XZ5UGJ/cw2rjUWCkVkP2GZ
 xzsxlJK/WCISXUsWDgk=; b=FBlrnFEBEUZZeLsBrt4qkNM8rnE0w0y81jObOsym
 2jr5tnCrgDgIFWI5rb+uWYIIeYsCicDsYMZ+Hp8EgXn3D2e2M6wDu7sVJM33UMhO
 0hWOMuerdNbmkIBCHn4fACvefH4VyTrhG0L0Le3qp5EScsUc8Xof4A3qpv+SaNeu
 JSoJpz90WjscpEXaAydj3azBFH1Mey0Q1xqehv9N6yeDrMCWdT1B66UU18XzQyK2
 t/BXe//WjZvzo5H1s1qlSdReVWr6KbzwA7fTXK3G0B+ZhMl+qvgAiZlcm95gdWXh
 WDBBkOgUQJWJ1cIo3zd4+Mk+nx/MC1tEJMqlfqrFsUaDRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq4m1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:37:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c77aff78so1293364985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 04:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744630641; x=1745235441;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+XZ5UGJ/cw2rjUWCkVkP2GZxzsxlJK/WCISXUsWDgk=;
 b=Lh9+aUERuzHlDgd8CKcLiVeYS0wOzAWj69PyjAk7SPn7fF5/hZ9VFeMiCTR6u8KEvI
 VrizGNxgoJIRU+acGtlV0NE38C40KV3qRnUGaKGQYug4/0rJnKiRbTOSx8dIVTYi7rsS
 rkVq5/HNGFqRWDVtZB6sFtCXszBFHkZHFMWSg3FzO2ZjxgobQ+k5aH2u7hugJG+cveBN
 8+8TJ3eZ0QoWrXzPyXERoLV0A2C7hyuaMlazMXOWhrJkjaa5/eNFBjQb+GZi+gdK7eHs
 4p7E+frGm/6hvORG9oHd4QhU5U/ioDXubszU2nI8K37qt+mC1rkoBLoV8hepXLI51muG
 iNeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOJHWg55LVrNKrCMXyVvHKqhOZHjUJ8S0mutuf1Uhm7q8b0Fzuf4ehdyGSM4jLo8TP8bxuLq0wh9M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL3qo/MDfPyLpy3c+X+1BYpuO0ZS7hg5GaKY+QYk1/0vYIjIjI
 qsJp0K0+fAtz1OA+9EXSMlR7XzVVVd9P4StM+d6q9NTL1C7VnYlXRXJ63VRKHdwDp9Cra4OZ9Cb
 0sj0rotOhTYeKHvk2FPUGOEUYL2Ib5L3zcn+VZDwNtX8FAkPbg9pVlLUlqCSyHuzpeZo=
X-Gm-Gg: ASbGncvWf4N0EpsqjDret266hKO+/ByxHZi449omVe0B4f1PJOE8btmczQMUllIFMOl
 4SWNrelta4MdDNTrNeJOCkyLqUBjvgnyXslUqTWQkRgz+RnWHXFQJ2EtwJkdyt5s0qzstvRTBbp
 6kaDt/KhFsZQXamoUyiIa/hUilEG1De9nLv+JFRON/ffFClN4KCcUc359bGM3liXNr/WtWAgiQf
 PQagUW1Fi5PlMDyrHRwp0zTnaH7v/FPS9b5ZHPfmDjE7wa4eWc2IcmFZmuIfw67hz5sC5HwUp9O
 z4fb/nOyzv/vrKII8UIJ4Tlt12+ZrHvBvQWZ8xyqeAHbX70/7teQNY19Ka3pmELGIbGs2det1N0
 =
X-Received: by 2002:a05:620a:4614:b0:7c5:4de8:bf65 with SMTP id
 af79cd13be357-7c7af11fe6dmr2323419985a.36.1744630640819; 
 Mon, 14 Apr 2025 04:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbw+g6u8oZDQ91VXBKSLoF7oGbpWST7/9WsxZFJCG+ePEvjN0CGI7O5W9I4H6AJsXJ84jRzg==
X-Received: by 2002:a05:620a:4614:b0:7c5:4de8:bf65 with SMTP id
 af79cd13be357-7c7af11fe6dmr2323412585a.36.1744630640230; 
 Mon, 14 Apr 2025 04:37:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d510b43sm1082671e87.201.2025.04.14.04.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:37:18 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:37:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
Message-ID: <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lZxzb6nQvPujD8E9_7gJ5gFXc1WaCa_k
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fcf371 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Dsw0btoO4blozC8r0tUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lZxzb6nQvPujD8E9_7gJ5gFXc1WaCa_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=696
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140085
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

On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Add display controller, two DSI hosts, two DSI PHYs and a single DP
> > controller. Link DP to the QMP Combo PHY.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> [...]
> 
> > +			mdss_mdp: display-controller@ae01000 {
> > +				compatible = "qcom,sar2130p-dpu";
> > +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> > +				      <0x0 0x0aeb0000 0x0 0x2008>;
> 
> size = 0x3000

Existing platforms (including SM8650) use 0x2008 here. Would you like to
change all the platforms and why?

> 
> [...]
> 
> > +
> > +			mdss_dp0: displayport-controller@ae90000 {
> > +				compatible = "qcom,sar2130p-dp",
> > +					     "qcom,sm8350-dp";
> > +				reg = <0x0 0xae90000 0x0 0x200>,
> > +				      <0x0 0xae90200 0x0 0x200>,
> > +				      <0x0 0xae90400 0x0 0xc00>,
> > +				      <0x0 0xae91000 0x0 0x400>,
> > +				      <0x0 0xae91400 0x0 0x400>;
> > +				interrupt-parent = <&mdss>;
> > +				interrupts = <12>;
> > +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> > +				clock-names = "core_iface",
> > +					      "core_aux",
> > +					      "ctrl_link",
> > +					      "ctrl_link_iface",
> > +					      "stream_pixel";
> > +
> > +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> > +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> > +
> > +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> > +				phy-names = "dp";
> > +
> > +				#sound-dai-cells = <0>;
> > +
> > +				operating-points-v2 = <&dp_opp_table>;
> > +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> > +
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +
> > +						mdss_dp0_in: endpoint {
> > +							remote-endpoint = <&dpu_intf0_out>;
> > +						};
> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +
> > +						mdss_dp0_out: endpoint {
> > +							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> > +						};
> > +					};
> > +				};
> > +
> > +				dp_opp_table: opp-table {
> > +					compatible = "operating-points-v2";
> > +
> > +					opp-162000000 {
> > +						opp-hz = /bits/ 64 <162000000>;
> > +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> > +					};
> 
> > +
> > +					opp-270000000 {
> > +						opp-hz = /bits/ 64 <270000000>;
> > +						required-opps = <&rpmhpd_opp_low_svs>;
> > +					};
> > +
> > +					opp-540000000 {
> > +						opp-hz = /bits/ 64 <540000000>;
> > +						required-opps = <&rpmhpd_opp_svs_l1>;
> > +					};
> Weirdly enough the 540 rate isn't in the clock plan for the pclk
> and so isn't 162

Nevertheless we need them for the DP to work.

> 
> > +
> > +					opp-810000000 {
> > +						opp-hz = /bits/ 64 <810000000>;
> > +						required-opps = <&rpmhpd_opp_nom>;
> > +					};
> > +				};
> > +			};
> 
> [...]
> 
> > +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> > +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> > +							 <&mdss_dsi0_phy 1>;
> 
> Krzysztof recently introduced defines for these

Ack, I will update once we resolve two remaining points.

> 
> Konrad

-- 
With best wishes
Dmitry
