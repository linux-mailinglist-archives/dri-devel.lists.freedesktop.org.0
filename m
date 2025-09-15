Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37656B579AF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6138110E45F;
	Mon, 15 Sep 2025 12:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="moxlKa93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68DF10E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:02:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgXQ031661
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IvAeXnBrUm3WtAxyNHUahdmztvfLEqQROq3blJbaPBE=; b=moxlKa93gMoU+EA+
 pPc8xR2QA7jLN4py33tSgd6PAQWu3exrp2osAqFc4rJh4hH3YVUl7p8Kd/06k6yf
 RUjEH/fMsY4C1A37rD4e8YJ/BfpqADJtaPT0wS2XQlvPp3yqLExlzDM/1lYUebxd
 z3hgvQQCpvp8RoVhF8/pYmeXr9h4+TY0U2WYlHB1Gyrpmuo57xcKt5u7LW8Jxr89
 1skN0wqWQkD8ydd0gnHU1xmQEW2V+K/ALZIdB4FleK/ZufdxfqIyeN6n779bczUT
 ZSk/Rn3YXBCr2p0pCjPWect+5M7WedM4awVW6QV32zvoeMQGySTYzCAeKTtJuK5D
 EXXoPw==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma4urt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:02:18 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-4240c9b72e8so1398215ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757937738; x=1758542538;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvAeXnBrUm3WtAxyNHUahdmztvfLEqQROq3blJbaPBE=;
 b=sStM7g0WgYvURpwSrqw2SijZDbpjH4Rd336K86JSVMuWjREi+vzhOMRcLzsLbnZJkN
 HNeaNf44QUminZu1azrL8RAZlOCCpMFxF4H9UGVdbT6PeWcdirK6JBtbkbX3557xkqIc
 Yha21o3qrgYJMx1/59h8/Ryy35+LD+JNFv7lVhHyhaF81c8QNlPJCwEWajgo9YKukWYb
 TWcn+CdTmDb+iF0uVY573G8hyUgQU4xSMObMc2AFbx7J/XWsMrnjYVAZi16dLhEIT5/P
 I9tJWRxZIE1WvNGOnKSMKhZodF704OIsUm/PCYnC+rsubJcb/db5NByJCi72xcZEDH/E
 4LDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGI29VA7q0mHedcfOgwEdrYKP+6fF13tdPP2Km/ADtcmr4dldsxp0gxSBL0GUMXsbHcQfh23+accM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNc6OrDWn6FZ/eyQIUhs3MHR7iHEWG+jXYq3iaoOZcWrRTaD+/
 /kA6mvrNkE/8S/lyjNRhwTzNDWxrlbYKl0dI8eo4DSI/wb+GhaW4eBuoq6c6ZNyHmadV7+HRG0R
 QE7swg0td5v1J91L069rTA70sURs/oVwely7lHDGT5OZNqDroqxlIqigTb8C50yoA/WDhgdo=
X-Gm-Gg: ASbGncst4U3JFV14J3QkBi3CljDDSm4xQNbDK0j5GldO26Cp0KDTDNDLWcaoR/xzxVR
 jcn73tz9297AdhG9Kbw3D/6rECjHOZobovUiP9xlfDF6oF657uIrctCRrogwfx0jL2GsjxnFJRX
 BGZ4K0PFBoi/JiWUtDFhhJu71QBsvMYBah6EAjm8NL/q1Em6tZuH6LFHgq6NQ4efe/CCf4aIq3W
 el3maS5LW8L2fDhf6Yqn9zXUclYP1nsJDtSl0JxjI0Ye3g/xa5Rc3jYKEgCMDzqjXBybjR/ioyq
 o21Eeoet4eRxV3tzWZ21T3ua2QXoZ4mPwJvMN9h5+yVv38qgrq1zm69oqwg2Dy1/moymZCP5em4
 G8ivlCUClFgTY03Z5Ixl7xKrmzwOh5YkmVscBnYAmaQWTc1a56nsq
X-Received: by 2002:a05:6e02:3805:b0:424:db:3f52 with SMTP id
 e9e14a558f8ab-42400db43c7mr31984635ab.30.1757937737621; 
 Mon, 15 Sep 2025 05:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwSFZp4+rn504zHIkvMkDte9o/xIPIokYa2nEOEEH2hcptgXuwuAlyF+4kk8sIPNl3j0f/aA==
X-Received: by 2002:a05:6e02:3805:b0:424:db:3f52 with SMTP id
 e9e14a558f8ab-42400db43c7mr31983785ab.30.1757937736970; 
 Mon, 15 Sep 2025 05:02:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-353725e1bc6sm19307291fa.27.2025.09.15.05.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 05:02:15 -0700 (PDT)
Date: Mon, 15 Sep 2025 15:02:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 07/13] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <yvhj3blwga7dkc2cr5prc7covfcw5lrg56fptynn2j3pbmtrk3@el4qlbecbg2o>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-7-2702bdda14ed@oss.qualcomm.com>
 <sy4kyh3kd6s4nr75unt5r6gxnyeqq6bfjj4tizwiw2fvbw4ala@i3theqmwiv3d>
 <1741620e-1f92-4db9-8135-965a96f12590@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1741620e-1f92-4db9-8135-965a96f12590@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX3+xrIF2yRT8F
 aerSOquI2ztZ5Mhv/sfjMektWj939BFkH8r0L+VLY7CP+BcB5JhDfOLId9gYoRgqqNmkt4DAljJ
 IUB/DQfw9+ByiuwAZW7jJhAFEYsbuQC0M9+zyo+b4pigJ3LEvZntdEYjH16/nb3ruszp70JpmZY
 VN+xaVZ/hrVFqSpWr3e+7IElLBCFhoC745cGJYQe1mCOt6iNskwLX9BHV0C97Jc/dRjpCIZmLi6
 1EOvKx1v8L9J3Tgxs47+alfPkCuusTXUo2BQ9RV1UAo7L67o7eUcqFDfXS+Zw9+kvwH8uctKDWp
 wXf1LHq9sJAHtsRVaB3RM7bbMjrW8jSdZpbkY/abo7YSwociLJbooqJLf/j5uF1AKH/rvZMpvgI
 n4DvTN9R
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c8004a cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gzlAuExvAKsCTSaEeBUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-ORIG-GUID: 8RsjFqKmhhPWN14s3T6-zhZKkzMJUCW7
X-Proofpoint-GUID: 8RsjFqKmhhPWN14s3T6-zhZKkzMJUCW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
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

On Mon, Sep 15, 2025 at 07:29:08PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 6:12 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 10:55:04PM +0800, Xiangxu Yin wrote:
> >> Introduce DisplayPort PHY configuration routines for QCS615, including
> >> aux channel setup, lane control, voltage swing tuning, clock config and
> >> calibration. These callbacks are registered via qmp_phy_cfg to enable DP
> >> mode on USB/DP switchable Type-C PHYs.
> >>
> >> Add register define for QMP_DP_PHY_V2 series.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h |  21 +++
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 251 ++++++++++++++++++++++++++
> >>  2 files changed, 272 insertions(+)
> >>
> >> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
> >> +{
> >> +	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};
> > Are these the actual values or is it a C&P from the combo PHY?
> 
> 
> These configurations are the same as those in combo, and I have compared
> that they match the downstream sm6150 project configuration.

Let's keep them as is, thanks for the confirmation that you checked it
against the vendor kernel.

> 
> From hardware programing guide, only defined AUX sequance with 
> DP_PHY_PD_CTL set to 0x3d and DP_PHY_AUX_CFG1 set to 0x13.
> 
> Shall I update table to {0x13} only?
> 
> 
> >> +	u8 val;
> >> +
> >> +	qmp->dp_aux_cfg++;
> >> +	qmp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
> >> +	val = cfg1_settings[qmp->dp_aux_cfg];
> >> +
> >> +	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int qmp_usbc_usb_power_on(struct phy *phy)
> >>  {
> >>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry
