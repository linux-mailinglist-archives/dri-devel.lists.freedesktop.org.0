Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B495B3822C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 14:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5212310E0F9;
	Wed, 27 Aug 2025 12:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1xRJG/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAF310E0F9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:23:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kJIR027503
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yg5rxRbbc1HilhImNhc6AceAQ1YLgYvqFXETiddrEsM=; b=F1xRJG/Y43/PUj4n
 2qa33XazZeg/c6iTHvg2mveoPws0W9aCxxaPfgCQHoJOFROgsYN4F1U9ntwmkdEs
 ejtjAMp47VKEnVdkVCVTbAASVSZo310nWe7KM9li9tnBLvITVDNXRx+h50mpxVp5
 EcNJyo8aEmNtA21jmv8xTQ8T2+5ONunGoVzdtY1EnM8QzmZofYH5nE5M6V8jx/6z
 KtTuM7OIgpaN4XadNDLoLxMlZgOOr3gOdzex1F0mWU4l2dm1fx9jxpQG9nLxMop9
 tZPVbgzMXcRA0ksKoEDUzxEZEY4j8Qs5AE4JSiVKHC0nTyhOg4NWJs4RTobyDw7E
 10phqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16um6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:23:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4c33f88dc1so149076a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756297433; x=1756902233;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yg5rxRbbc1HilhImNhc6AceAQ1YLgYvqFXETiddrEsM=;
 b=pEPON+N8GP5lSjOsKSEst3ooNl3eFyHLXTg2OK1nN1lNFrAm2IdPu0bXelVMNWcvKp
 +fjXPcf9ZjY2ENJhNsJwpjpfFKSqtDLaQb0we10ISNEEMRXaR/IBrmBB9aF2MNcVHDOb
 QOu9xi5DLQQXWMoOjQbAVX2zNlXI9j+CNbyVdIoVWdezJ2dfLw4Z5wBFD4ZKmzUFChGi
 PiF5T4dd8YecHFTwD8izzRMqg1j01tzvyqZ2cmbE+tvazO1DWueuOB62zfuECRbqxS2E
 LTpt30NiFFDkZDPWaA9Ud5sPXdBIX6eUHzuY+ifIhnQ9z/HkS6QZzJB0AygyrfF5iExR
 3Lpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYbmiXVA7exnVWb2SDaRoqOdCEBSL25XhNQwQoqvJo67+0vZygppxoF8Oi7YNWLTMev07up01+ejA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW3rNHtXBvRalqkJreuyKMpnldjqRn8rzMrRwPKHzTxHDmuFcg
 F85FomiR7tY3TRJvSSEnTkc3M5VpWeP9bviGojThbntgsqrNIYnCB7ku2I7u3tzWNSCKhz26M6g
 VOoHJBQDnrovEROf4V1G+Fa0UnzuhLfyKoaQjjrbgQYnBKXZzbp2+ZWUMzAgRk3gOlFpi6e4=
X-Gm-Gg: ASbGncsoG9mBb9cnb0h7ygHGVSDI9Px9zMpRkBcjNBlYEgkTns6vBnLf12JLNS9wgrZ
 BSJeNcn8xBrN6CN9z10ZjxXx2kI+QaZ3p+kHKvTZHgj56G8l1FQl6vNK/AAUXEzUgcwvIzVjs++
 BoLbAqvCMmEVh8X37gBNWVz2a76wZ05Wtyb7Y5PtIrFLOhzDisQhfQemEy1eDM/mFy1Drvx4NDy
 m9Fp04h6NrZaLaH8aHcVkhx/EiKcybRs+1nSD34NljV08BrhSG9QbLLVKulZ3wlsBwpzZhLGOON
 APaAZRBzpL9eIIVnnK1ZJBlTvhQQg0K/9jwP5cQJKlEfdea/6bkHcWf7vZc3IzesZ9UzrhvDIUl
 GjQJVvTnr8qsi/OzoxxD1NE4sGZo9ng==
X-Received: by 2002:a05:6a20:3c90:b0:1ee:d621:3c3f with SMTP id
 adf61e73a8af0-24340813412mr15976458637.0.1756297432940; 
 Wed, 27 Aug 2025 05:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq4Ue3miEW/c4T5E12xCiOE3p54Gi40oJLlOOke+fWNSMS7NYIwTRSwIrKoAICZzp9mEFDsA==
X-Received: by 2002:a05:6a20:3c90:b0:1ee:d621:3c3f with SMTP id
 adf61e73a8af0-24340813412mr15976433637.0.1756297432356; 
 Wed, 27 Aug 2025 05:23:52 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720af250cdsm1392821b3a.90.2025.08.27.05.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 05:23:51 -0700 (PDT)
Message-ID: <08997fc3-8175-4638-96ea-ac15ad20160c@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:23:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] phy: qcom: qmp-usbc: Add TCSR parsing and USB/DP
 mode mutex handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-10-a43bd25ec39c@oss.qualcomm.com>
 <i4rc5siu4q2o4sjk3j4bex7b7qdrs26y6lxsfnike7e7kqdva3@xddrd7vowtlb>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <i4rc5siu4q2o4sjk3j4bex7b7qdrs26y6lxsfnike7e7kqdva3@xddrd7vowtlb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: crkYMXNxlj0Ejwf-Am6m_VohQmfujcgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfXzYex9/EP+FSK
 6PW1WpPaEzY+yWVyEoWPiW30rAZ5/jbjkafZV17G+4j0qKj37YslF9vq8FxD1BMteVsafga5YEK
 m1Hk42V2+SlxzFCMfuUnBnVTQYuueWIsGlLlwTgDCigtDSQvQz6ByGLgOR0O3IT3eWzXTUFPy/m
 grKkODCB06a/ZuBdiQI+WOPUEv96Zt6mfh5SsdTmosKB6ScADIoy68F3T/fBDT8RHxCTOiFFE/8
 wieUFz1e1/YfSxxfrMaEenH7Hc09V8iAnDKUO5bNJbq0c/KJKR/qBhSG1Z+ZoR7aMtdomQ+fj8w
 6jVvzJDgV1MHiXYtRx/E7re2F/4AYoL2p8tLBBY/S6ArZcpiPbm3H+ciUcSMAJ5u32FW50PMBJt
 UM8VI5tJ
X-Proofpoint-ORIG-GUID: crkYMXNxlj0Ejwf-Am6m_VohQmfujcgq
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68aef8da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-nZFuMMc53900W69ytMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
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


On 8/20/2025 7:24 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:52PM +0800, Xiangxu Yin wrote:
>> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
>> Introduce mutual exclusion between USB and DP PHY modes to prevent
>> simultaneous activation. Also update com_init/com_exit to reflect DP
>> mode initialization and cleanup.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 60 +++++++++++++++++++++++++-------
>>  1 file changed, 47 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index a1495a2029cf038bb65c36e42d0a4f633e544558..821398653bef23e1915d9d3a3a2950b0bfbefb9a 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -674,7 +674,7 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
>>  };
>>  
>> -static int qmp_usbc_com_init(struct phy *phy)
>> +static int qmp_usbc_com_init(struct phy *phy, bool is_dp)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> @@ -704,15 +704,20 @@ static int qmp_usbc_com_init(struct phy *phy)
>>  	if (ret)
>>  		goto err_assert_reset;
>>  
>> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>> +	if (!is_dp) {
>> +		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> Why? Don't we need to program those bits for DP PHY too?
>
> If not, move them to USB init call.


For these USB3DP PHY series, USB registers in pcs_misc will don’t affect DP. 

I’ll move them to USB init call.


>>  
>>  #define SW_PORTSELECT_VAL			BIT(0)
>>  #define SW_PORTSELECT_MUX			BIT(1)
>> -	/* Use software based port select and switch on typec orientation */
>> -	val = SW_PORTSELECT_MUX;
>> -	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
>> -		val |= SW_PORTSELECT_VAL;
>> -	writel(val, qmp->pcs_misc);
>> +		/* Use software based port select and switch on typec orientation */
>> +		val = SW_PORTSELECT_MUX;
>> +		if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
>> +			val |= SW_PORTSELECT_VAL;
>> +		writel(val, qmp->pcs_misc);
>> +	}
>> +
>> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
>> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, is_dp);
> Write this reg directly from USB / DP init.


Ok.


>>  
>>  	return 0;
>>  
>> @@ -733,6 +738,9 @@ static int qmp_usbc_com_exit(struct phy *phy)
>>  
>>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>>  
>> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
>> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 0);
> Why?


Since this is a switchable PHY, it makes more sense to set it only during enable.
I’ll remove the TCSR handling from com_exit in the next patch.


>> +
>>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>  
>>  	return 0;
>> @@ -1045,6 +1053,17 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>>  	return 0;
>>  }
>>  
>> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
>> +{
>> +	if ((is_dp && qmp->usb_init_count) ||
>> +	    (!is_dp && qmp->dp_init_count)) {
>> +		dev_err(qmp->dev, "%s PHY busy\n", is_dp ? "USB" : "DP");
> "PHY is configured for %s, can not enable %s\n"


Ack.


>> +		return -EBUSY;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int qmp_usbc_usb_enable(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>> @@ -1052,7 +1071,11 @@ static int qmp_usbc_usb_enable(struct phy *phy)
>>  
>>  	mutex_lock(&qmp->phy_mutex);
>>  
>> -	ret = qmp_usbc_com_init(phy);
>> +	ret = qmp_check_mutex_phy(qmp, false);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = qmp_usbc_com_init(phy, false);
>>  	if (ret)
>>  		goto out_unlock;
>>  
>> @@ -1103,7 +1126,11 @@ static int qmp_usbc_dp_enable(struct phy *phy)
>>  
>>  	mutex_lock(&qmp->phy_mutex);
>>  
>> -	ret = qmp_usbc_com_init(phy);
>> +	ret = qmp_check_mutex_phy(qmp, true);
>> +	if (ret)
>> +		goto dp_init_unlock;
>> +
>> +	ret = qmp_usbc_com_init(phy, true);
>>  	if (ret)
>>  		goto dp_init_unlock;
>>  
>> @@ -1467,7 +1494,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
>>  		qmp_usbc_usb_power_off(qmp->usb_phy);
>>  		qmp_usbc_com_exit(qmp->usb_phy);
>>  
>> -		qmp_usbc_com_init(qmp->usb_phy);
>> +		qmp_usbc_com_init(qmp->usb_phy, false);
>>  		qmp_usbc_usb_power_on(qmp->usb_phy);
>>  	}
>>  
>> @@ -1602,13 +1629,13 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>>  	return 0;
>>  }
>>  
>> -static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
>> +static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>>  {
>>  	struct of_phandle_args tcsr_args;
>>  	struct device *dev = qmp->dev;
>>  	int ret;
>>  
>> -	/*  for backwards compatibility ignore if there is no property */
>> +	/*  for backwards compatibility ignore if there is 1 or no property */
>>  	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
>>  					       &tcsr_args);
>>  	if (ret == -ENOENT)
>> @@ -1623,6 +1650,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
>>  
>>  	qmp->vls_clamp_reg = tcsr_args.args[0];
>>  
>> +	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
>> +					       &tcsr_args);
>> +	if (ret == -ENOENT)
>> +		return 0;
>> +
>> +	qmp->dp_phy_mode_reg = tcsr_args.args[0];
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1665,7 +1699,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = qmp_usbc_parse_vls_clamp(qmp);
>> +	ret = qmp_usbc_parse_tcsr(qmp);
>>  	if (ret)
>>  		return ret;
>>  
>>
>> -- 
>> 2.34.1
>>
