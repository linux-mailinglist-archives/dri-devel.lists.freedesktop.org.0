Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66388B39DE5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 14:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1088210E98D;
	Thu, 28 Aug 2025 12:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwX/wFBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1B410E98D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:57:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5jgmJ030216
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EgqQAQ4KchFaH1d0/JwOmtXxNXtrGHk+dx87xXF6dec=; b=hwX/wFBmNgyWLANg
 J+UgdxKE1/wlSCUDIo4H0+8ZmZNELyjSV7p1f6DOGU1bXrzUfJgw+DnXNf5ZEZhf
 S60XDAi6ifGlozQX0feDR5JtA4tKVe5gtwHt0VWja4Ao8BnRUdfcfgJfbI5U/baV
 wtptJp9i+OoIQC9VEz19yFIY03jFzIR9Tp6HNWSNDn2X+76qrjDLvUxRt6UQylkI
 QN7b/gPoVEJKQ5gGUM8UkyKyYlGjOmdjpZWayC/uwjcxCBD+ZVvfrNwEtexTSTHv
 ZfRA1nRJWgCZFeVrWltuDBpx6ngdXzLuWk0Bc31jPZIzuZjAKE4mDM4+kGccs0pz
 TQfjEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up034j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:57:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109be41a1so36391791cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 05:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756385826; x=1756990626;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EgqQAQ4KchFaH1d0/JwOmtXxNXtrGHk+dx87xXF6dec=;
 b=p9CeuQJvYCs9m5d8R9GoH3JAmG2F3+vlG+vuaIVg/JJ8bIpkZSKiRA9sePZAEyBQ2n
 ufTZBPKN6ZvrCan26G+zWwAfOsM3CiR4yf+xhj3OGJJROssWwbPt1MTu4CedWrqCGme0
 mivaQOl5kMsy8QeiP/c0X0fiUqHS2nR7AwCxoS/vz1A++B1gsBC/TurSCSgVXOiYVlbq
 aKQ+hmRxZjvm+zXXM7Pr+5cvyPanK7GHTjOZN8hbmqBzEQVRYkGP6LJ8LgTGhil6q8o4
 AA2Aj1HX6aYaY8wC9agBNUFltaYiOkG4BhDeFcF7GZqsfsRTEVNrE3s39UZkaiWb9jIB
 m97Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp+2xvwkFkz/zYbmT2xAa2BNJEg9Nqr5rL/kuBTL3GtE7+nMH11oaakto0Tw1uxNDbIZm3mJFkXdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzYrInYJ7gC6OiuVbdkjQTB3g1yq2q7CRo0oA30rt1scIXbFTF
 nEqtfuB8ZTtVZcHeLQF428NGO24pzMsWlouD+zDWQYpd+8fowJltoYlFic8Bf1R4Gls5rJJS6+o
 XdcenrkD31QSvKxCyd7eAzKYsJTPGA9Q1kV60GpZGJ9kl0FGXVTIXBpJ49biI+jyXP3SyaRM=
X-Gm-Gg: ASbGncu7+o5Qw8pHCmO7/ptsyETLaAwte6EXpTSZC1H/+NWAcYiOzwlhmcTRxbcwP1Z
 o50aPHsgRE/dubWQ98MF53Ot18FRyBHdHOO1WMEbUUDoZMDuWo21e3CEIKbxkMay9KbBCEk0d0n
 ZeTJibRUMGWsVNmZDWxlE8X9iG+aGv/o79m7PLVDq5dPgc7O2cJQtPGHqCsfQNdNVJBsfyvphys
 CsHUh3yoJYsjRu/Qdqr5vMxm0oGUm10D2wJn22aT0iPrajltu+3prCtUWEuSLENAqtBWTEvKuiF
 fi7BoiGC+Dg3L1rJnA0fnNXQdBqIV3MYwb3yNBNrrY6ekQfHgbyusTApAiFa5L81c3IthtIkmPq
 vVz7R+fCISUZ1glYRRq2ZIGYrYSQudQqTEMiB+pbk4jAPFY1r40Ea
X-Received: by 2002:ac8:7fc2:0:b0:4b0:85ad:7916 with SMTP id
 d75a77b69052e-4b2aab0e427mr276090801cf.53.1756385826359; 
 Thu, 28 Aug 2025 05:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNc/yDmuGpGZJWn4ShQMOMzt9j5GzyojN6uEoc7LfUnq4nqYpVKDjcBVD9/JUfvz/QuIJu0w==
X-Received: by 2002:ac8:7fc2:0:b0:4b0:85ad:7916 with SMTP id
 d75a77b69052e-4b2aab0e427mr276090171cf.53.1756385825600; 
 Thu, 28 Aug 2025 05:57:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c1dccesm3228854e87.67.2025.08.28.05.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 05:57:04 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:57:02 +0300
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
Message-ID: <kndlhnsihvkq64q3tgai2jrij5mzh3c5kehe6r4imj4d7fgbc3@l3edsktmx4y3>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
 <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
 <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
 <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
 <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
 <osav4kwxytfuxvnf26ugdw2qasd753smywsux5punuegbkxqgq@fp3r4esqiqyq>
 <749ec6d1-f2f9-40f5-9c41-3443698f250a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <749ec6d1-f2f9-40f5-9c41-3443698f250a@oss.qualcomm.com>
X-Proofpoint-GUID: uEEtoX1mLfd_TICEk1RpUISqDMUtRkz_
X-Proofpoint-ORIG-GUID: uEEtoX1mLfd_TICEk1RpUISqDMUtRkz_
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b05223 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mEe_ubnSu4kMW0ft-g0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX9hjC05RJT1/z
 6Vg6FXvskp8NX0j8eY2qAkNXjswRF1ba8aHYEJTC4rIw/6tgEaJ/bYv0Z3hOsWCLaGlcmP21bQl
 Wk5JK32qXvXnISUiquMHjVswhl9kDlngoc9FPJVxNs908XWS7729kc55aSC91QM//yXRubgbkeE
 Wh4+fjrbP+H18M9tZ54lflnhblZZ6hdE1SuDVnIZVzUitNNjfM4KXaCE9rMxiWEoYbf0lHgzJWZ
 U1UheRxuJrbc9q30w3vJgwa9Twlj56UoM6tbn3nOVWAojFD6N+5K+XDzFagmK1VeSrfrIQVs0Zj
 Jl6HToYk/q69XHnuQ4+9A9NVwXbhc7Hfztm9e4e3ete9PVwSWL7mUbFAi+r0h56mV6Fhi35VYTl
 hTjQJHqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

On Thu, Aug 28, 2025 at 09:40:51AM +0800, Xiangxu Yin wrote:
> 
> On 8/27/2025 10:31 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 27, 2025 at 09:28:00PM +0800, Xiangxu Yin wrote:
> >> On 8/22/2025 6:08 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
> >>>> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
> >>>>>> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
> >>>>>> instead of hardcoded lists. This enables per-PHY customization and
> >>>>>> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
> >>>>> Please split into two patches in order to simplify reviewing.
> >>>> Ok, will split reset and regulator part.
> >>>>
> >>>>
> >>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
> >>>>>>  1 file changed, 53 insertions(+), 55 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
> >>>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
> >>>>>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
> >>>>>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
> >>>>>>  
> >>>>>> -	/* regulators to be requested */
> >>>>>> -	const char * const *vreg_list;
> >>>>>> +	const char * const *reset_list;
> >>>>>> +	int num_resets;
> >>>>>> +	const struct regulator_bulk_data *vreg_list;
> >>>>>>  	int num_vregs;
> >>>>>>  
> >>>>>>  	/* array of registers with different offsets */
> >>>>>> @@ -453,7 +454,6 @@ struct qmp_usbc {
> >>>>>>  	struct clk_hw dp_pixel_hw;
> >>>>>>  	struct clk_bulk_data *clks;
> >>>>>>  	int num_clks;
> >>>>>> -	int num_resets;
> >>>>>>  	struct reset_control_bulk_data *resets;
> >>>>>>  	struct regulator_bulk_data *vregs;
> >>>>>>  
> >>>>>> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
> >>>>>>  	"phy_phy", "phy",
> >>>>>>  };
> >>>>>>  
> >>>>>> -/* list of regulators */
> >>>>>> -static const char * const qmp_phy_vreg_l[] = {
> >>>>>> -	"vdda-phy", "vdda-pll",
> >>>>>> +static const char * const usb3dpphy_reset_l[] = {
> >>>>>> +	"phy_phy", "dp_phy",
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
> >>>>>> +	{ .supply = "vdda-phy" },
> >>>>>> +	{ .supply = "vdda-pll" },
> >>>>> Please fill in the values for all platforms. It well might be that they
> >>>>> all share the same current requirements.
> >>>> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.
> >>> No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
> >>> 12.560 mA for 1.8 V supply.
> >>>
> >>>> However, I didn’t find USB load configs in downstream and from SoC related power grids:
> >>> Please check the actual HW documentation for those platforms.
> >>>
> >>>> QCS615
> >>>> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >>>> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>>>
> >>>> sm6150
> >>>> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >>>> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>>>
> >>>> SM6115
> >>>> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >>>> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>>>
> >>>> QCM2290
> >>>> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >>>> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>>>
> >>>> sdm660
> >>>> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
> >>>> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
> >>>>
> >>>> msm8998
> >>>> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
> >>>> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
> >>>>
> >>>> It seems the USB power requirements vary across platforms, and the
> >>>> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.
> >>> Ipk being ?
> >>
> >> IPK: Instantaneous Peak Current
> >>
> >>
> >>>> I also tested removing the load settings for USB+DP PHY, and DP still works fine.
> >>> It mostly works either because we don't allow mode switching on older
> >>> platforms (yet) or because somebody else has already voted and that vote
> >>> keeps the required mode.
> >>>
> >>> As you've started looking on specifying proper current load, please
> >>> finish the work.
> >>
> >> Discussed with chip validation and power SW teams.
> >>
> >> The power grid tables are primarily used to ensure each module receives 
> >> the correct voltage, and they define the Ipk for each submodule. 
> >>
> >> While they don’t specify recommended regulator load values, the Ipk values
> >> reflect the expected power domain strength and can help estimate the voting
> >> strength needed for each supply.
> >>
> >> Since regulator load is mainly used for voting, I’ll define init_load_uA in
> >> the next patch based on each SoC’s Ipk values to better align with hardware expectations.
> > If the Ipk is defined per module, then it's fine.
> 
> 
> Yes, under each regulator, multiple submodules are powered, and each submodule defines its own Ipk value.

Ack, then it's what we were looking for!

-- 
With best wishes
Dmitry
