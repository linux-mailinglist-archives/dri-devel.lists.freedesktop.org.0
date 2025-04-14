Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5736EA87EB0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48110E336;
	Mon, 14 Apr 2025 11:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMH8o4Ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D2310E336
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:13:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99t9j001829
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0EbZ/7NYSQIH2cjZdJu66a5YVTDn2d6A3WWziI79Ht0=; b=EMH8o4UiuC80ePp5
 bTfw+V5gsrNTJyr5ErSeCcejqaOEE7efz0FI6/+TJd+hSUi/Pn7oqsw9/uPrNrIK
 01F3VCO5qtsWnNBoxrPHR7/BukU6wQLZFdSiC0o/j9pZinVPSWOEIvflzJ+uEmw9
 KwdDovqji/+ymjp0OGqYdu5+ZQhICieELp6b3yKBQWwf62Tk/WlF7R+H35SiYYd5
 EXg0oprAgxfHyfCpzm+ksPBnh6RMSTkbgP+2tqQ9wZYBZE8JqxivdiVU+WqWiN/n
 AaFT744056+93JgbBUuSKrGcnxw5dG8NANk2LIAhxvqhI1oNXPG+AMKNqButGZHf
 LrDcvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq4j34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:13:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-476786e50d9so8939831cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 04:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744629214; x=1745234014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0EbZ/7NYSQIH2cjZdJu66a5YVTDn2d6A3WWziI79Ht0=;
 b=MEysE7UqH+EPfEG/m0nfJqqg+NbYEBhcwvvfwAC8hr3KjknhOgWByiV82b0mA2CyMK
 t5Gl96kMXRj0O9vn/PKEAUoxeDp0PZG3UMmHNVOL6Pi/b48WXzReWCBABnah6XcxI6Al
 mSluEY0q4xalZlas9boty+ztP3KBWXFMKG9PI1JT780W04AytfnI2V/9W464IHzrirkz
 ZbBdmiZmFMGYPkTmHeFgBz+Zvc/vEsrn5WXV7Fkm9ToDA+tlU7EODelmH9elrzZDj1/l
 6SW7404UaTZ2vKcSna0XTg5Q34rDrPh4LxsPcsk5lGgo84SPc/L2EcigwZCjzYtd6v4R
 Ry4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP3jD/PllbuHc9PWWgOR3I8S5BJF9rAwBtoK7VbYI3JCQ+CFkWFSS5XF1U9qWE+ecFforDrRV8tl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqIuOdJ8gVH7Pc/emgiLAGz6G4suzE73drAcdrVYgCjmECEmyu
 R0G8GjWLHoMNqW+CWZG4OAGHPRvO9BZNcBeF5NWei7RcoDL+qx6kyiCsYYhdRZJgovSiS8we8vH
 PopeD6351DAWY1NyjGY8w3sA0XPwhn4Zm50rmAyaD8+U2NJea7FZVEN09+503xQH6W4k=
X-Gm-Gg: ASbGncviGZknzpp3G14YCjqs1d1lQz1fRNg2LoqUiXR5rmsHkjpHyHYqcjtqj+Lvi3k
 GBmnGbjwP56/iotL6R435McaRUApmrFryQIG7YU0/WJRUUB6STbFFRWaB82ZXrQffePKd/7TKM0
 0v1/vYWhSsh+r5dAqsyAZAhvXhhtRhSitgI6QMsvsVZllAd07K53+ExuKHdxJ9w2k7TJXNSdC3T
 SrvUd3vqUyVWMpppfAmfzd5+/Xkqj/eCQR6u+x3aG+mvLqV4jcjCsR1A7/qEsqpH2VEYRmbzpkV
 lGa48CxBmdqWToGiI7iaHSNhhoL/tEgjX0tudqD8DxX83uE3EX4vwRGcF22JwCh2Zw==
X-Received: by 2002:a05:6214:f0b:b0:6d8:a091:4f52 with SMTP id
 6a1803df08f44-6f230ed2d8emr52865136d6.7.1744629214023; 
 Mon, 14 Apr 2025 04:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1Jbmw7xqykDTZc49xLzKxc4E3Rb3zQy24sMs1xRcp71xMPft8CUZbEMdUMS6+juIPQDVqtw==
X-Received: by 2002:a05:6214:f0b:b0:6d8:a091:4f52 with SMTP id
 6a1803df08f44-6f230ed2d8emr52864726d6.7.1744629213585; 
 Mon, 14 Apr 2025 04:13:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ce81c5sm880990966b.184.2025.04.14.04.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:13:32 -0700 (PDT)
Message-ID: <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YhkjuWc5rqswB8ErWWV1ztl_ahbi0fXv
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fcedde cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=M9PBs-WKjKzZjRsr6pgA:9
 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YhkjuWc5rqswB8ErWWV1ztl_ahbi0fXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=761
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140081
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

On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> controller. Link DP to the QMP Combo PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sar2130p-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;

size = 0x3000

[...]

> +
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sar2130p-dp",
> +					     "qcom,sm8350-dp";
> +				reg = <0x0 0xae90000 0x0 0x200>,
> +				      <0x0 0xae90200 0x0 0x200>,
> +				      <0x0 0xae90400 0x0 0xc00>,
> +				      <0x0 0xae91000 0x0 0x400>,
> +				      <0x0 0xae91400 0x0 0x400>;
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp0_out: endpoint {
> +							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-162000000 {
> +						opp-hz = /bits/ 64 <162000000>;
> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> +					};

> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
Weirdly enough the 540 rate isn't in the clock plan for the pclk
and so isn't 162

> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};

[...]

> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> +							 <&mdss_dsi0_phy 1>;

Krzysztof recently introduced defines for these

Konrad
