Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334AB57828
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6271710E456;
	Mon, 15 Sep 2025 11:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Epx5K6ck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991A810E455
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:29:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FlED027268
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HHxgojtFv1+VDc4N+0/nnx1iVsNtu6JUX6nrgcelgHo=; b=Epx5K6ckqQ9UgvN3
 Glnxg1HqEATpx1cMRIE94upgZOEMk9FnRnPg6zg1VyQsqwOm0yJ4Wnfg/sdJ1H4+
 JCr2V9bD89KnaDzeEnRoKrvasfHlU0zQKDDAu/AsSgiko3Cc36GspNCn441RsEFA
 pAiuvlvJ/a9KS2N3mZHGdVuRFd6e9mK0kxzzrjylxd5PyJfagVn21I+h/jhw0Sdn
 pZrJaOk/CaL4kt7Y9WSrsd+XRMde8gBzOxZ59Gb08Hb/EBvxzXv0HEI5i0hbaxdZ
 nWV5IOcF64sryCEv5gDBRaT5gnjSi0JnjIdcq7jesxcz2CZXgts5+NlabNGWPe/T
 PB0XNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072mqqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:29:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-245fbdc2546so6748255ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757935759; x=1758540559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HHxgojtFv1+VDc4N+0/nnx1iVsNtu6JUX6nrgcelgHo=;
 b=Pud6YiDE53KdPD+Zwa98R4miMmqmzUu0TzF2+01HwMWLxiORa2YqWnf4wpgYucX1n0
 nAQU2Ytz/uE2SwVr1+05ZvzsioqfHb/0ukTGJB6lS4DjJsa5IRMd3wtsltXaRVZ1j7gd
 81MllQX3pb1IZk/CpTwZuTElCjo7cLpoV4aZ6JkSXwV0Ayr9kSTG7okMeh0Qlal1OsG/
 Pqt6LKo0hkuBJl/r273WXEdk3X4MRU87kdDf4HfqcpslYk1N6rBtyNlXArvFfIgRWp5p
 gK75kC7Sf6YPtRxqYa4Td/Amf/TRlPgwYUdqT7HuxiBjgszIyVNWL+vfKNY03JJ0FMQ6
 ENtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCrKMHcMo18zOkWCasgbTUd6V4PA5AwI5+kka6vktcLO+GkZECX9H/GoTMfrhXds6M5BCNo5JeZ7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6gTCTKIeot/9HDwmZbYBArR07bmD7ae1BIa2p4RCs0hoA2MGh
 f4ahlW2XUYuVy0PNmefgbyrO9RQKOYR7m9rurtVGbClMSUG3u9nh7RAkcLjwFgrnQYf23YyJe0w
 N+z1pY7BPBu792QucuSFDcR+Xe/9TKH73F8rFM1P1FOBO8WZNpITaa8r9cpUC2BwaiX9rdiM=
X-Gm-Gg: ASbGncvChyZiRheWZ4LBExPKnuWFHiU80C7PmwIwQf0xoyuES4be//NfJ6GXuLgzQy6
 ro21uKaS/jwZeFDwIwTwMDEah266W2JsfGV3LowlQoryJ2Vlsx4K/Xcgouck9VImkv+M/n+nbYr
 LvsOUMii+ug+xAEByWDGqMuXG0wwvXskRlbWRS9eFx9QyKzFOlIaa4+5MIgdg1h5G1np92aOEkT
 lgvT+AJhq+uXglXtzT2s/zlNDgjY0aZFjaHfrDh/RL4/qGD+VeU+j8hucLc4h5Urzc33uGW5n3F
 VhPpJ5QBwE1ZQmOZUcb6o5o+qZRRZaENDkofDthH7mX4B4R2OVdUo71rn8SeW3BmDpZd1WTML/i
 O0ayeeYCvoxPZbpBb06NzrMgY4ZP5je2/PpM=
X-Received: by 2002:a17:902:d2c2:b0:24c:ed69:cd9f with SMTP id
 d9443c01a7336-25d28705e84mr80983195ad.10.1757935759160; 
 Mon, 15 Sep 2025 04:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZfbvF7yixrHYH6Xe9z6LqQsZbJxJovZNNLKP01FZkNvAV8X6qf20cxzSyJ690lEC84uKUKQ==
X-Received: by 2002:a17:902:d2c2:b0:24c:ed69:cd9f with SMTP id
 d9443c01a7336-25d28705e84mr80982965ad.10.1757935758615; 
 Mon, 15 Sep 2025 04:29:18 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-264885eda79sm43962635ad.6.2025.09.15.04.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 04:29:18 -0700 (PDT)
Message-ID: <1741620e-1f92-4db9-8135-965a96f12590@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 19:29:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-7-2702bdda14ed@oss.qualcomm.com>
 <sy4kyh3kd6s4nr75unt5r6gxnyeqq6bfjj4tizwiw2fvbw4ala@i3theqmwiv3d>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <sy4kyh3kd6s4nr75unt5r6gxnyeqq6bfjj4tizwiw2fvbw4ala@i3theqmwiv3d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX28+Vj2SafMFl
 Jaa7gLF4Q6HwyjMhV8MBMlms0d3tJ/WaUMSwz9GcrsG0afvTuaJ3opicxtFFzwyE57KvwRC1zr3
 Sf+TWkrFqhd+2dNEuGaP72gXw9MjH3IY5mtty8VRu8b0+4UV+QZ6bC78r6Gn6+egLpWAaYWah7x
 Z14GBLvSI1bgrcnO0rM13zCijwWBYR30W0SQdNHQDohm1kcDOi3/k3CfhjS1GEjZBLGQIeco1/K
 kWZugh+o6C5FkP+yC2LUYygNK7G6Yze5D/6LwtbL2D+/L4pOejGW0zz63mq99d4JnuH4oKxveY/
 lKV/edKPwCeIsp2DX+k5PGdEqZT5wcde25D6Isoss8Emot9N0toVFovx48BSuUxX1u+dfEBUcOP
 eOPWuqMp
X-Proofpoint-GUID: f8JRyWihplO_J-mRriwzVN6iajYYZKOl
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c7f890 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Pve8rUOC8BGBfzdlk1UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: f8JRyWihplO_J-mRriwzVN6iajYYZKOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025
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


On 9/12/2025 6:12 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:04PM +0800, Xiangxu Yin wrote:
>> Introduce DisplayPort PHY configuration routines for QCS615, including
>> aux channel setup, lane control, voltage swing tuning, clock config and
>> calibration. These callbacks are registered via qmp_phy_cfg to enable DP
>> mode on USB/DP switchable Type-C PHYs.
>>
>> Add register define for QMP_DP_PHY_V2 series.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h |  21 +++
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 251 ++++++++++++++++++++++++++
>>  2 files changed, 272 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8b9572d3cdebb70a0f3811f129a40aa78e184638
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2017, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef QCOM_PHY_QMP_DP_PHY_V2_H_
>> +#define QCOM_PHY_QMP_DP_PHY_V2_H_
>> +
>> +// /* Only for QMP V2 PHY - DP PHY registers */
>> +#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK		0x048
>> +#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
>> +#define QSERDES_V2_DP_PHY_AUX_BIST_CFG			0x050
>> +
>> +#define QSERDES_V2_DP_PHY_VCO_DIV			0x068
>> +#define QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL		0x06c
>> +#define QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL		0x088
>> +
>> +#define QSERDES_V2_DP_PHY_SPARE0			0x0ac
>> +#define QSERDES_V2_DP_PHY_STATUS			0x0c0
>> +
>> +#endif
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 663024b8c09124f2991b8e0537a9feb60baaa686..7b2b47320cbb2d16e4f316b0f52fdc1bd09fe656 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -28,6 +28,9 @@
>>  #include "phy-qcom-qmp.h"
>>  #include "phy-qcom-qmp-pcs-misc-v3.h"
>>  
>> +#include "phy-qcom-qmp-dp-phy.h"
>> +#include "phy-qcom-qmp-dp-phy-v2.h"
>> +
>>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
>>  
>>  /* set of registers with offsets different per-PHY */
>> @@ -619,6 +622,11 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>>  };
>>  
>> +static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp);
>> +static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp);
>> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp);
>> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp);
>> +
>>  static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
>>  	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
>>  
>> @@ -666,6 +674,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>>  	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>>  	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
>>  
>> +	.dp_aux_init		= qcs615_qmp_dp_aux_init,
>> +	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
>> +	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
>> +	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
>> +
>>  	.reset_list		= usb3dpphy_reset_l,
>>  	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
>>  	.vreg_list		= qmp_phy_qcs615_vreg_l,
>> @@ -736,6 +749,244 @@ static int qmp_usbc_com_exit(struct phy *phy)
>>  	return 0;
>>  }
>>  
>> +static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp)
> Please rename the functions according to their intention. Are they
> common to all USBC PHYs, are they specific to v2 (or v3) PHYs or are
> they specific to QCS615? At least this is the approach that has been
> used inside combo and eDP PHY drivers.


For all USBC PHYS, DP PHY is using v2.

Will rename these functions with v2 in next patch.


>> +{
>> +	writel(DP_PHY_PD_CTL_AUX_PWRDN |
>> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
>> +	       DP_PHY_PD_CTL_PLL_PWRDN,
>> +	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +
>> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
>> +	       DP_PHY_PD_CTL_PLL_PWRDN,
>> +	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +
>> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
>> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
>> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG3);
>> +	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG4);
>> +	writel(0x26, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG5);
>> +	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG6);
>> +	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
>> +	writel(0xbb, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
>> +	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
>> +	qmp->dp_aux_cfg = 0;
>> +
>> +	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
>> +	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
>> +	       PHY_AUX_REQ_ERR_MASK,
>> +	       qmp->dp_dp_phy + QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK);
>> +}
>> +
>> +static int qcs615_qmp_configure_dp_swing(struct qmp_usbc *qmp)
>> +{
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>> +	void __iomem *tx = qmp->dp_tx;
>> +	void __iomem *tx2 = qmp->dp_tx2;
>> +	unsigned int v_level = 0, p_level = 0;
>> +	u8 voltage_swing_cfg, pre_emphasis_cfg;
>> +	int i;
>> +
>> +	if (dp_opts->lanes > 4) {
>> +		dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (i = 0; i < dp_opts->lanes; i++) {
>> +		v_level = max(v_level, dp_opts->voltage[i]);
>> +		p_level = max(p_level, dp_opts->pre[i]);
>> +	}
>> +
>> +	if (v_level > 4 || p_level > 4) {
>> +		dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
>> +			v_level, p_level);
>> +		return -EINVAL;
>> +	}
>> +
>> +	voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
>> +	pre_emphasis_cfg = (*cfg->pre_emphasis_tbl)[v_level][p_level];
>> +
>> +	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
>> +	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
>> +
>> +	if (voltage_swing_cfg == 0xff && pre_emphasis_cfg == 0xff)
>> +		return -EINVAL;
>> +
>> +	writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
>> +	writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> If QCS615 is a V2 PHY, why are you using V3 registers here?


V3 reg offsets are same and reused V3 regs define here.

Will also create new header for txrx & qserdes register table for V2 and 
replace in next verion.


>> +
>> +	return 0;
>> +}
>> +
>> +static void qmp_usbc_configure_dp_mode(struct qmp_usbc *qmp)
>> +{
>> +	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
>> +	u32 val;
>> +
>> +	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> +	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN;
>> +
>> +	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +
>> +	if (reverse)
>> +		writel(0xc9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
>> +	else
>> +		writel(0xd9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
>> +}
>> +
>> +static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
>> +{
>> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>> +	u32 phy_vco_div;
>> +	unsigned long pixel_freq;
>> +
>> +	switch (dp_opts->link_rate) {
>> +	case 1620:
>> +		phy_vco_div = 0x1;
>> +		pixel_freq = 1620000000UL / 2;
>> +		break;
>> +	case 2700:
>> +		phy_vco_div = 0x1;
>> +		pixel_freq = 2700000000UL / 2;
>> +		break;
>> +	case 5400:
>> +		phy_vco_div = 0x2;
>> +		pixel_freq = 5400000000UL / 4;
>> +		break;
>> +	default:
>> +		dev_err(qmp->dev, "link rate:%d not supported\n", dp_opts->link_rate);
>> +		return -EINVAL;
>> +	}
>> +	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_VCO_DIV);
>> +
>> +	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
>> +	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp)
>> +{
>> +	void __iomem *tx = qmp->dp_tx;
>> +	void __iomem *tx2 = qmp->dp_tx2;
>> +
>> +	/* program default setting first */
>> +	writel(0x2a, tx + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
>> +	writel(0x2a, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> Same question here.


Ack.


>> +
>> +	qcs615_qmp_configure_dp_swing(qmp);
>> +}
>> +
>> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
>> +{
>> +	u32 status;
>> +	int ret;
>> +
>> +	qmp_usbc_configure_dp_mode(qmp);
>> +
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL);
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL);
>> +
>> +	ret = qmp_usbc_configure_dp_clocks(qmp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	writel(0x20, qmp->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
>> +
>> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_C_READY_STATUS,
>> +			       status,
>> +			       ((status & BIT(0)) > 0),
>> +			       500,
>> +			       10000)) {
>> +		dev_err(qmp->dev, "C_READY not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
>> +			       status,
>> +			       ((status & BIT(0)) > 0),
>> +			       500,
>> +			       10000)){
>> +		dev_err(qmp->dev, "FREQ_DONE not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
>> +			       status,
>> +			       ((status & BIT(1)) > 0),
>> +			       500,
>> +			       10000)){
>> +		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
>> +			       status,
>> +			       ((status & BIT(0)) > 0),
>> +			       500,
>> +			       10000)){
>> +		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
>> +			       status,
>> +			       ((status & BIT(1)) > 0),
>> +			       500,
>> +			       10000)){
>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	writel(0x3f, qmp->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
>> +	writel(0x10, qmp->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
>> +	writel(0x0a, qmp->dp_tx + QSERDES_V3_TX_TX_POL_INV);
>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);
> And here


Ack.


>> +
>> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
>> +			       status,
>> +			       ((status & BIT(1)) > 0),
>> +			       500,
>> +			       10000)){
>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
>> +{
>> +	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};
> Are these the actual values or is it a C&P from the combo PHY?


These configurations are the same as those in combo, and I have compared
that they match the downstream sm6150 project configuration.

From hardware programing guide, only defined AUX sequance with 
DP_PHY_PD_CTL set to 0x3d and DP_PHY_AUX_CFG1 set to 0x13.

Shall I update table to {0x13} only?


>> +	u8 val;
>> +
>> +	qmp->dp_aux_cfg++;
>> +	qmp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
>> +	val = cfg1_settings[qmp->dp_aux_cfg];
>> +
>> +	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> +
>> +	return 0;
>> +}
>> +
>>  static int qmp_usbc_usb_power_on(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>>
>> -- 
>> 2.34.1
>>
