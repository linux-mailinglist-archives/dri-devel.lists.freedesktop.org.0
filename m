Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04041BD8BAC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 12:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083C810E5AB;
	Tue, 14 Oct 2025 10:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOcEkjAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3490910E5AA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:21:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Tm2016917
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iNSQ6LRQ1Cbo1PkY0QhX/x6y
 YGsX22LMPrXlD4eZXtY=; b=VOcEkjAAYW3HxoXQJrAPoPRS1H0DpnKc1Ejl+suy
 45hI7iAXC+r1GPylGOksA/FHWeCB0X6xmINdZ2VDenqZooLgzv52c7zTi5xbWKoG
 cvbTgYI1NbSH4c5HkutAUJObwdEh+t5n/de+j+Xv8YaRjw0MvjDGOBjuHgw92uc9
 e6iDemj0fcTYqQw0lvNJfzoMYZDQELlqJ9Vqj+v95QJhasgsjK9luQjqsNhBBcB1
 9RxYv8WuhGvQ8HF4SllFM9pof2CaviPX+GHRZkPdhG5xtmFkK9hHPBf1sZwVQ2B9
 UrjDBDwLuHIFM9g8wVHZFCtFGCkSxg6ruESGA7LHVb0jTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd90561-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:21:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-871614ad3efso2520053285a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 03:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760437314; x=1761042114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNSQ6LRQ1Cbo1PkY0QhX/x6yYGsX22LMPrXlD4eZXtY=;
 b=TDq5g582QBW/YblTJ2idt15vv9J4U4r6sZ5njFZTDVOaShf2+Aqi7eIp5yfPrDGhgM
 Su5hmuHYMpePtdXyrSYbPtWh3z7LNNT3DSQft616eZzFMwhM+XHXf7morW596+EbdyPw
 Hv9VvCRYD1ZfAECoo/j1GKtU6DUZ5lNPKkcCAe32SeHltE/ims7UA/dXSAdG2/euZKC/
 f4v+5b5WzwOkHTH5K4F1rsKy6zcnkpAQTfbU1Rm1uMr6BdTNejIlMG6/zwG0lOAuSXOm
 1zlng4BALqExa559GKyPUctMWQw/PgKMY1LlDlcNuOpgvxM/Fv2u8EiRfTeQkPecmczM
 1u2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIh1yHonV+TDBllgzCAnS0AUHUYmIzNFZZ5mBZo0iBk8TvxAbA1G/3CiOzv9c7ImzmL8IKdtmw3fU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy52+2pWkWfm6Zad0c1NQ8Jl9rMb9YAInSuoayHQ+CWXE4hhdSG
 aCzLZspl3v+29r/PrMjoTxSOg6FcFkrjhTkI7GELvpSEpYtnyKu0gqfxPA/no+qg1ftuhjYjmQ1
 iMxApRfkYISNB4i6ZJMyVeyqwahNeWCoRM0kwlTU2mDrbK2AL08lmm9+ZT+V2OO3oyfL+nUM=
X-Gm-Gg: ASbGncvP3qOfvbsCF1red7uQOq4ZphuPver1D8L+pMGf7PnlODd9n2zsUdjlCNSN3Eb
 /I8zKDAuomJ+vIa6Kv/zDQDm/DzcIs28ly3Qv8KzPVcPJoO0FK9jp5ToN/mmHj66SM6fhTmM7el
 ojSBOM7cdSoXhWWT09BdJ+HTPXxBDaZqp8oTh1Qlfv1eSgOMx2a0AZF8HJ26RcWBKJd8zw3wc9j
 YdYA3CLCO5Vlv8vHQg9hQCVJKaBY/RiUPW/idrhqU/vYSJT2vc0B8JvznNwbiePyzk2J9qdbZFG
 CbXiVBCKL6G2AKnzznde442NpCIpaDyqrVn/SOCdTH03VupbrXkGQNxI6Te6ltXl+GBAOt385M/
 +zeOa51FloFkHiel9JXt3YElSdimi/3+tW/V5mbuoMSW6mJkzHysP
X-Received: by 2002:a05:620a:2981:b0:84a:f7cc:1eaf with SMTP id
 af79cd13be357-88350f575a5mr3980330785a.35.1760437314177; 
 Tue, 14 Oct 2025 03:21:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDMRw6EyVXSGprMYoPwa1DMLzUKICAtaPYbkxU2KjxKpjARAfamItqNhipppks0GQVOsrWYg==
X-Received: by 2002:a05:620a:2981:b0:84a:f7cc:1eaf with SMTP id
 af79cd13be357-88350f575a5mr3980327285a.35.1760437313692; 
 Tue, 14 Oct 2025 03:21:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908856e301sm5095511e87.93.2025.10.14.03.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 03:21:52 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:21:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
Message-ID: <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QncG0M86IeKS5tPyronoskf1R0JYpLx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3y6KyP0VMrPj
 lsHPbe+bBIv0VpkmCVmISMWNCzzw3RJhy0eV+SwpD58eozcOLc/TvAz2a/9g9d8uScusbyFLotk
 2uGPO7a8k2gQm2dp+COicYS032Ar0h0zcp7uwY7UVU0B2QNvfXg9lWXBAJJve8XuUtfVEiyAUwD
 xiUgIVTN7aqXyfvm0BzV2ZXZU9RrNi9+ICProFVrwRl0RXCJ5NmrJUgSUgpE+ydZnGEmHuEhos/
 RF8Bb+AJsL5vGWt28oWDZWfwq/dis3cgRFcpudN7OdQ0khNzpG6pXFPSa2nQ1Nl7j949gqbLGDF
 A2k38xEQNO1mummRXO9UrLWKZn+krangQvtf/obrc488xJ8DwFXo1O08wuk0ZXJeSZwtne3U3pB
 dVByUkZqQXGjoA2mauHeWmeUlRrShQ==
X-Proofpoint-GUID: QncG0M86IeKS5tPyronoskf1R0JYpLx9
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee2443 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=552JS0bYzuNWtSTagGgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Tue, Oct 14, 2025 at 05:42:12PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings
> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 9ac1dd3483b56f9d1652f8a38f62d759efa92b6a..0b8bcabdd90a0820b1f9c85e43b78e40eb8a9a38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -39,6 +39,20 @@ xo_board_clk: xo-board-clk {
>  		};
>  	};
>  
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "mini";
> +
> +		hpd-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;

Not the gpio102/ 103 / 104? Interesting.

> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
> +
>  	dp-dsi0-connector {
>  		compatible = "dp-connector";
>  		label = "DSI0";
> @@ -423,6 +437,16 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <3 2 0 1>;

It's not a board peculiarity. All QCS615 / SM6150 devices are affected
by this twist. Please move this to the SoC DT file.

> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp0_connector_in>;
> +};
> +
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l11a>;
>  	status = "okay";
> @@ -623,6 +647,13 @@ &usb_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
