Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E1B8FC6F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 11:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D210E191;
	Mon, 22 Sep 2025 09:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQdCtVh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D93810E194
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:39:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M90qTK007797
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jAx4FwcII6wbkb81OdZIPAi0
 xEvtze7qSPUTGq3+NiI=; b=bQdCtVh/6lGcmYm68OuLAMQHtqjheTJb/MMDTuIX
 knaM7VoUP44mrC3gDXYoNCsEzXPscI1MZ7D7s148GWcdxu8MbQd52HClZyWrVhXx
 mPxQ694jTIsDtrMxgrZ2vCjs0jyqW969j2NmSkqHohKGPjs/ZnYdQ8tmDB9tykzB
 7ZePQjlB33JF3CSz90w8xKrS3jKxF3sBEMcsEnEku9Fm0Dh94yW9t38uEXA2jnxA
 tUp6j/Otyf6HLRHGskP+gM4t/5fTeu+dFYkGl4+foWuRoMGpVj68W9RCMqMYUdwN
 J/T0bVU13J7x5HAOe7J8O56+q/T3+66SB06In7YYNCEjlw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnmh0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:39:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4cf47c9bab2so11669281cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533949; x=1759138749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jAx4FwcII6wbkb81OdZIPAi0xEvtze7qSPUTGq3+NiI=;
 b=Sqf+9tD408gd1W2aFZ06aGiU9D572MbVEhO9WwQHQwgBk6OMMO7o/WOnMT+UYyIds+
 ArJDmTSrIhiFHvCjCYROmnxv1Y6c3x7GrGc36CCxb2e7DR9acvzZjKaT6iS5K60mow4r
 ljXsLEoTYGunKaEL/msSciVs3ewUGvQ90JAEyo0V6ErDyiaChCmopm+s1vibHAgs3fjb
 D2EqTPGqQOBQzR7rRfbdaypks7UwV23A2ali0WJL2EHV5OUYP+RRxT1+EHLuxGxmsoqr
 65Ij+1353YObp8hM4j1BrZE1OSqi669V3DRee3iGLpBXf09nKvFgt6rifoOsyp/mPdkB
 0JEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnx0ilG7c98/3rxe2bSaoVcy8L17F99+ZEWCrR9JtS5w/3U74HPmd77AcL4B/blFGNWhsRGNnc8UU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrtGE7l5yqJpMzR+uq3VvtaPd35xJtfcokG8Q2KlYJm1qet1qm
 YUiLzo7S3Xen4bped/reklIZ4T9HKDZZkRlW+yAqEZX75OusngRdxszZqbB1HfMLMq5R/T9NsJv
 csx7oneY68bwpVNWbVR2VzQxXXdGZw5GynL2r8Aez0YTpxnZQcC2G3H/JS9y0GG4th45dTWM=
X-Gm-Gg: ASbGncsnoeQm4kNq+13fVzoZOMZ6C9DccPvh0JR7KgbTlGqIATAPwibFSkPbRVPsb6U
 EelY47jYvyarumKhhNqp+5/CL6zXHwcXnbWNfLhWUtXHJHqyIvFwv6+Pgqv9O+T6onTfDqS+bZg
 9srjdztvn65ca2oII3aCKvS4Gwepb+HFp7owL/vtYnmqZz+txcIJmpE3PbFDpxttpyxTpNJaoxS
 xJqyrWES6BDqFpfCDZAoHXDOb6fmrT7xZRVFYjrJKBWwac96XeldAuGs5Jhgp8yniMLMipqR925
 3Iy0ADOKcp08iN9jAYgplsTBKytl/A7wD90brjGbHmmgTmmrvUiYktxwW/RaYXbDAtj+5ch6ml7
 3ufxIVWtOOH4i9lSPnF94sOO8y4L7dKkgzpn+zuODZKdV2k4CToPL
X-Received: by 2002:a05:622a:143:b0:4b5:d60c:2fc8 with SMTP id
 d75a77b69052e-4c0734ea370mr157007701cf.71.1758533948684; 
 Mon, 22 Sep 2025 02:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE35/RYNkp6gQyQPasMu7rVuD0sFyNJP9oENTXh4ze2R7ETd8aNwunTy76/33FRan7WDLixdA==
X-Received: by 2002:a05:622a:143:b0:4b5:d60c:2fc8 with SMTP id
 d75a77b69052e-4c0734ea370mr157007381cf.71.1758533948134; 
 Mon, 22 Sep 2025 02:39:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b78577636sm1624019e87.80.2025.09.22.02.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:39:07 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:39:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <z6x3bwb7izywozeran5aq64uw4tiwlbwx4kekoy3vv3vt7qyip@2ibiat5focw2>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d1193d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RqUhitWEW_Btmly2q4YA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XNNp30LuTg7T9gTT-QzKLsGw00agcQwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX/OfETWB7sWo1
 oV+x7xqNSrI/FkueIN0euQhnjFOWS6u0rY97ybZwLzZt5bZzAd6llbXbR14nsmKANAYM0cMNew5
 fLbDuYgTOzhvWlAlZSQ7jv/+s/DAoZFEl6NFPlh5oPaNdg1SYDJpOe80paahZigEHLf1UEhv6tE
 UxayvWCyxNw8a9cmbaHaWdC3UlOvLTULrE8a2BJypbaMYUVyaByX/IhS9UjaNq5UcXvej/YpIzm
 x0e5uVXdGMEjPAS0BrifUvWlrU2txt1RPo3Jl0ILWlWSFW4qsWZNVb9uVUU+bUJoda73AXDjXUL
 CosUHiML7eU8541sYVgEyLBhvBhUBVxDekxplQvKEXL2792kMxsghvnNvmalDinF0K8b6/S7eew
 cQR3wMoX
X-Proofpoint-GUID: XNNp30LuTg7T9gTT-QzKLsGw00agcQwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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

On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..3d228db9ef0882eb76e7ab9e82f8122fa9cfe314 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -335,7 +335,8 @@ struct qmp_phy_cfg {
>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
>  
> -	/* regulators to be requested */
> +	const char * const *reset_list;
> +	int num_resets;
>  	const struct regulator_bulk_data *vreg_list;
>  	int num_vregs;
>  
> @@ -428,6 +429,10 @@ static const char * const usb3phy_reset_l[] = {
>  	"phy_phy", "phy",
>  };
>  
> +static const char * const usb3dpphy_reset_l[] = {
> +	"phy_phy", "dp_phy",
> +};

This is unused in this patch. It should go to the patch adding QCS615 DP
PHY compatible and the rest of the config data.

> +
>  static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
>  	{ .supply = "vdda-phy", .init_load_uA = 68600 },
>  	{ .supply = "vdda-pll", .init_load_uA = 14200 },
> @@ -464,6 +469,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>  	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
>  	.pcs_tbl                = msm8998_usb3_pcs_tbl,
>  	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
> +	.reset_list		= usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>  	.vreg_list              = qmp_phy_msm8998_vreg_l,
>  	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
>  	.regs                   = qmp_v3_usb3phy_regs_layout,
> @@ -480,6 +487,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> +	.reset_list		= usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>  	.vreg_list		= qmp_phy_sm2290_vreg_l,
>  	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
> @@ -496,6 +505,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>  	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> +	.reset_list		= usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>  	.vreg_list		= qmp_phy_msm8998_vreg_l,
>  	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
> @@ -512,6 +523,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> +	.reset_list		= usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>  	.vreg_list		= qmp_phy_qcs615_vreg_l,
>  	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
> @@ -1051,8 +1064,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
>  				     "failed to get pipe clock\n");
>  	}
>  
> -	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
> -				 ARRAY_SIZE(usb3phy_reset_l));
> +	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
>  	if (ret)
>  		return ret;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
