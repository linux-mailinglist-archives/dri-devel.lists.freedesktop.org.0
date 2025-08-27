Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFEEB38501
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 16:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4166710E814;
	Wed, 27 Aug 2025 14:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="daTFYMGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8272210E814
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 14:31:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kBBv029068
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 14:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q0lt8Alc0eadGnQMpiWDAGtF8IcvB+wKd8Bpg0uTVog=; b=daTFYMGP9Mk8g61z
 LDzBGao1EZeoj4fn8cyOkWYcYi6w3RqveMI7c7wSJJ6oF/ZwMdw8NqIX8pnQJnl3
 mm/aOEnR3XNURV504Vz7W2Eb8nE5zj5QsAcLhPbskmjtOQ+KkjSZSN9iAz9IOH+a
 Di4R0OVdn2S59QHrJ5qStdl5sTPFbS57QO2ZPDIR8jsQKEdpNCsmkqDPM1KSWAS/
 ZCTiAf6sKCbPc/Ez361+ornmJMf5qT2p6wjf3s+uUq/YM0w/iYQpxx+gbCaSVjMw
 iBsG8PGOQiLXvCOrY90eY8NYPKH9pn1gNmhE3E8heb2dMUDSTutsg1JcWzesgdhE
 qpGbbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umd1kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 14:31:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bc103bso155364821cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 07:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756305076; x=1756909876;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0lt8Alc0eadGnQMpiWDAGtF8IcvB+wKd8Bpg0uTVog=;
 b=Zrxug/sIT3CAJSK5BMYi7CSeMFje0Zj6DUlZp9fHyTP6g22hJ+0xeRW0IFHSSNmRmx
 lvibu0WTO8MFuFvflbhoAQIys3R96iCHmx+GY8M5ep+civv7ZZpvYSSy330vK9ZB+QbC
 gVEhbt/SuS7Y5nvwqmj8WwGoCdvYhk16qA4qrqCjfEryI8NSViXQUkyaIxeGQroR5jSa
 306P4LaVuL9DGiQM0wjkVG3LN8Pgkk6jYt16T+Eywjov3lXA4tivzf1mi7DZxldL13gq
 YefZvl2raa9L6ylXZFRAVZHyZ8JxWkzT2gKaJjy/kKdPozjB8salhMD9NbyluERJ6xld
 xmSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlkiPOm9D9jyOdBFxCcCNAJI4UX3RqnIdY7LqBYlI+I9rutElRuRuXOB/xI946o0a/a+NXf6qO7zA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOsScAYD2QktmWqts9qk6wzyQZJAkGzVnGH7T9N1N95hwa2kN9
 epS0Q4miKDYdpYWEqRXEuszHDk+kY7q+szElVaTwdlW7mWuCsbGn5vN3/V+3Cxr7WKUuiv59qbm
 THSQFnQyOmmlbqkaX7GnSXePI0WOoJcjnN4INQv1IW8cJGWzoJrTdtBQX8LWFJPh2LQRbiok=
X-Gm-Gg: ASbGncujCeRKdxSjITmul4kQhHRT62BzK+bWk/9eqtt+cNGFWrzTvcFuB90ifD2WZ0O
 0tqNqOnCxn8OfyhYtky/az7NNNThUJ23NwBjvqCJFYr85+krueW6gfUxf3Xe7Sfovit0NnH1XAR
 mStUOgcQOkQha9KSvsiGdqJJdglcABI4B4ygdIAQcQqF4TNX+ciOBTF2JbJ8VFEbbSpar9ZhsBk
 FFG95Qg+ZWDKTCrDoerbMVK+ddOzVIuBxNcdEeGTa5INsTnbGeb5f+4CggqXCpHjj5WTWOP+68b
 hmV6vhVl63dzjzU7vUk2e5vj+B4gp4jH/C9PMDDPa80vDDkNbv3NqUR4k7YjiQCRWs3TMbAK7eK
 iAg43QedSrRplABYRMC6gYih/AL+LSFwkSZ/CA62QIM29joasWz6H
X-Received: by 2002:a05:622a:3c8:b0:4b1:2783:ab99 with SMTP id
 d75a77b69052e-4b2aaacf013mr240586451cf.39.1756305076118; 
 Wed, 27 Aug 2025 07:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFovrqRv2sivDnbTsFQFcberelJyZtK09JvAw7fJdBbeVxPt0vDz1SXP+xHSgKWaxjA8FBaBw==
X-Received: by 2002:a05:622a:3c8:b0:4b1:2783:ab99 with SMTP id
 d75a77b69052e-4b2aaacf013mr240585511cf.39.1756305075350; 
 Wed, 27 Aug 2025 07:31:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35ca8c35sm2833513e87.143.2025.08.27.07.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 07:31:13 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:31:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
Message-ID: <osav4kwxytfuxvnf26ugdw2qasd753smywsux5punuegbkxqgq@fp3r4esqiqyq>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
 <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
 <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
 <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
 <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68af16b6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LvOJhfRPg24KsvUfCm0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX21Ne2+7fDKor
 gKr2Q1kqOdYf5uxdUVgKPMoO3jz3HoiHUQYTXqrXe6LimSmd8TdNFV7l5VP3WHF6g0vmOOo3C7S
 Vser0vnLJzb1aj7JeoTW9BDwR8GlfxqZDZzJycaONGNT/Hk09iu6BWL+zIEWaL4cXzKDbGa/AfA
 E0uSIaZo2LAqHctrMhT4HSX+kFu/8ESar7azgRMZH3+bjy4Xifre3v5Po907RiFyogEBJZf4L8B
 SDFlD44tpZ2Xhio6XewtS/CXmTAtgjVskpkO2wxWv7Xjp4mSGptOlm9XMq8wUHZwhL9QBNcb9dH
 kWEJzUBWAOzEEOjtZpp1kf7AWhEiTRaEvioU3a576030pq5Pzu/xSenNmB1OsMUlGCCvRqrEYjm
 dmyrB4K6
X-Proofpoint-GUID: J7u2qhjH12hjPDpHhop_0V8SHpSnmxDE
X-Proofpoint-ORIG-GUID: J7u2qhjH12hjPDpHhop_0V8SHpSnmxDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Wed, Aug 27, 2025 at 09:28:00PM +0800, Xiangxu Yin wrote:
> 
> On 8/22/2025 6:08 PM, Dmitry Baryshkov wrote:
> > On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
> >> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
> >>>> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
> >>>> instead of hardcoded lists. This enables per-PHY customization and
> >>>> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
> >>> Please split into two patches in order to simplify reviewing.
> >>
> >> Ok, will split reset and regulator part.
> >>
> >>
> >>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
> >>>>  1 file changed, 53 insertions(+), 55 deletions(-)
> >>>>
> >>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
> >>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
> >>>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
> >>>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
> >>>>  
> >>>> -	/* regulators to be requested */
> >>>> -	const char * const *vreg_list;
> >>>> +	const char * const *reset_list;
> >>>> +	int num_resets;
> >>>> +	const struct regulator_bulk_data *vreg_list;
> >>>>  	int num_vregs;
> >>>>  
> >>>>  	/* array of registers with different offsets */
> >>>> @@ -453,7 +454,6 @@ struct qmp_usbc {
> >>>>  	struct clk_hw dp_pixel_hw;
> >>>>  	struct clk_bulk_data *clks;
> >>>>  	int num_clks;
> >>>> -	int num_resets;
> >>>>  	struct reset_control_bulk_data *resets;
> >>>>  	struct regulator_bulk_data *vregs;
> >>>>  
> >>>> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
> >>>>  	"phy_phy", "phy",
> >>>>  };
> >>>>  
> >>>> -/* list of regulators */
> >>>> -static const char * const qmp_phy_vreg_l[] = {
> >>>> -	"vdda-phy", "vdda-pll",
> >>>> +static const char * const usb3dpphy_reset_l[] = {
> >>>> +	"phy_phy", "dp_phy",
> >>>> +};
> >>>> +
> >>>> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
> >>>> +	{ .supply = "vdda-phy" },
> >>>> +	{ .supply = "vdda-pll" },
> >>> Please fill in the values for all platforms. It well might be that they
> >>> all share the same current requirements.
> >>
> >> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.
> > No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
> > 12.560 mA for 1.8 V supply.
> >
> >> However, I didn’t find USB load configs in downstream and from SoC related power grids:
> > Please check the actual HW documentation for those platforms.
> >
> >> QCS615
> >> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>
> >> sm6150
> >> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>
> >> SM6115
> >> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>
> >> QCM2290
> >> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>
> >> sdm660
> >> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
> >> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
> >>
> >> msm8998
> >> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
> >> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
> >>
> >> It seems the USB power requirements vary across platforms, and the
> >> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.
> > Ipk being ?
> 
> 
> IPK: Instantaneous Peak Current
> 
> 
> >> I also tested removing the load settings for USB+DP PHY, and DP still works fine.
> > It mostly works either because we don't allow mode switching on older
> > platforms (yet) or because somebody else has already voted and that vote
> > keeps the required mode.
> >
> > As you've started looking on specifying proper current load, please
> > finish the work.
> 
> 
> Discussed with chip validation and power SW teams.
> 
> The power grid tables are primarily used to ensure each module receives 
> the correct voltage, and they define the Ipk for each submodule. 
> 
> While they don’t specify recommended regulator load values, the Ipk values
> reflect the expected power domain strength and can help estimate the voting
> strength needed for each supply.
> 
> Since regulator load is mainly used for voting, I’ll define init_load_uA in
> the next patch based on each SoC’s Ipk values to better align with hardware expectations.

If the Ipk is defined per module, then it's fine.

-- 
With best wishes
Dmitry
