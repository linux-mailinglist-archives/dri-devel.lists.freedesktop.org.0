Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2EB30FB4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 08:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590B210EA71;
	Fri, 22 Aug 2025 06:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ft3q6spt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87B310EA6E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:59:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uU1v027788
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EvRSbSH/VoxM+9jiAgdHngTIpfLu8E8u5BFgwRNDeYw=; b=ft3q6sptkCQgZIvH
 X+ocxL8DKw1LaFTCRH3oXovsqFPtM3ECG5jSdO54qhWumdGzaRLc7txUhlWo0yM7
 p+nN1PDK+sXom5BuVh3bWH/Oo7eGNFh9BtOmVlah9L6ZCCiHutHN+ZjyNPzvziRq
 B2m2l22Z2d5rhjbKAF6UmL4yOGKXezMEoK1FkhaQpNP3zHx8Scz5bVbQJKSHrjtJ
 gmOFSdH/Ld7ddVIMKD5ZXaKgrSgTc9k0Z2GRk7FBJgakxKS/Nv7btUTN03hofBxE
 /dN99Z0whu7VZniV4GPrDK60bbtVHdKoZUWqLC3WgZbqt6boEWZRdXVA8yPN4YIK
 Qae0FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cr4yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:59:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2462ea2ed58so1741055ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 23:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755845995; x=1756450795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EvRSbSH/VoxM+9jiAgdHngTIpfLu8E8u5BFgwRNDeYw=;
 b=eAcA9rAMNajIieZ41KAwwC03GjclcaeOOw7rg6cNpmMVnTaPu57ooerdzhxD2dpWiB
 JzJxHvjCeakJDxNKe9hPghYyXcy1QdHYvmQL77obuI5qjmGHgWM65G4M7i9Smv65dgyd
 l2vGbvn85JD9243spKL2H5ueZMncZRlLvn4Uco9A8mBWTFNOFpvrEE2P76socl3BbC2k
 QjpPTCLK/H9Yt6SVdAY3lEeTM+2ANN/ucWat7NhoIFUBBF5OtjrYJBJ4T6js2Cov4DzP
 wcM/CScxq65Fk4/byj+gs/jtf0fnRMS0fN8NWxqvYrbWHJeCtTqgOefwgbw5m7+WcSgt
 rcHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZITGKyJocTPitp7piEpwYoqv2fYP28TL0pLFSL7pUqdeSJD4TqzLpFgcXaOgtJ3GNCWi5CAdWNHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9SXiPqdhmpWNswmdugQEXulYO0FfFCCqi0evjLe8QsHComl2K
 lVBLC0VR0WsrA4Zlfcd4etN0KD3BHyCuTAIq3nFJHTY0KBAWiFpKexXYBJRQBWDW7pGan8PRbP4
 rbP5WTL5nBsHfXfIAiPB3Hb7DBqF1PFqra+0re97GoAa7yxyBb5RQVHRtCjestTO+CtwtiGE=
X-Gm-Gg: ASbGncuqKLvd1Py9ewoGsUQeR5k4wTQbAv0RhohqNpLVHTXec2tSmh0ttHSgYvB0WfD
 YYs0bw6nAH7jH2fFwQIBS3Xl7iaH0uOe9S2EHB7KzaqqFDw2Iq242Ojum48Lvuyc5taO0Cvbpic
 YkuosqSl8cDFy0mPqTBtUPk4eUyn/5zBX2MBG6bLFmgNBLu75hteMC0XKQKs2MXFXnmA0OpZ/Xs
 PTiNxpysf8VtLpeAe0lyCAhByDlQFUbVaRJoF4vFYHAfUumlRQoB7vlE3PTzxZbmycVdJpzRtXG
 /bpnTkVFPxfGoYSPyCJU9l1G1Ybb6nyJetZ705KPFB9VkAr0SbW/bmJPcJ53KYnPuQBEFSI9LZs
 czto2rQDKTE6dPrtF/MJCzvyXoASaiw==
X-Received: by 2002:a17:902:e74d:b0:240:52d7:e8a4 with SMTP id
 d9443c01a7336-2462ef4956amr15460235ad.7.1755845995324; 
 Thu, 21 Aug 2025 23:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuEJR2wzIWQjgd8kotlnM7HkI7wYOwYms8taKFwN/LIJRGxlF0bSt7nWjIb6zaFE9ywZO9Uw==
X-Received: by 2002:a17:902:e74d:b0:240:52d7:e8a4 with SMTP id
 d9443c01a7336-2462ef4956amr15459895ad.7.1755845994827; 
 Thu, 21 Aug 2025 23:59:54 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed50352esm73974115ad.128.2025.08.21.23.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:59:54 -0700 (PDT)
Message-ID: <8922ae6e-9be6-49f7-ac84-d4a1dd60421b@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:59:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
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
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
 <7b6utbnibia767bp55vhvg6ghdavb66ubdpabyguohuwtmz3mp@unvm36jttota>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <7b6utbnibia767bp55vhvg6ghdavb66ubdpabyguohuwtmz3mp@unvm36jttota>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JYuDNrfr0USDZAOWxBmJXEW0H_upNGGz
X-Proofpoint-ORIG-GUID: JYuDNrfr0USDZAOWxBmJXEW0H_upNGGz
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a8156c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=S4zsw1PvXi1YseiIK68A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7B9SlB0tVizy
 /B/NihPrye60abN99lpI6MNVylYseFJYZHuXHK8P0bXhA1aVsxWbAdBG/bF+FbYa1z7sIomMqR5
 tB0i6SUJpCo3ANU7yvTGGvDOMY0hKRLcyUUTJVkdxTH+cvQyBXT5wzjI8fhPfWUE9LAdmccy05K
 tEkCxJHSG17rY1P05MjVOEpi6GHnOi+g/8/8lWbYQaXyVg3oynU9ZyJphDVQF76siPBTlfrsdoC
 3DQUeyuAoTStrM9bKbZCNphOs8VJT8orb6zmiLps5Ao/LJYWW8Fr5b+0IihhXDezZmvRnpl9uW/
 PII6dkKYWOX/9QDpvSlLWAdScynBXo6MbLqu9/aZ/N4uDuMsfbfU2FyCjVRBeL0DAJmWZekQoIJ
 nhqfy4iWbt20MboEYgFSgWUro7J1+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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


On 8/20/2025 7:47 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:47PM +0800, Xiangxu Yin wrote:
>> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
>> including register offsets, init tables, and callback hooks. Also
>> update qmp_usbc struct to track DP-related resources and state.
>> This enables support for USB/DP switchable Type-C PHYs that operate
>> in either mode.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 73 ++++++++++++++++++++++++--------
>>  1 file changed, 55 insertions(+), 18 deletions(-)
>>
>>  
>> +	struct regmap *tcsr_map;
>> +	u32 vls_clamp_reg;
>> +	u32 dp_phy_mode_reg;
>> +
>>  	struct mutex phy_mutex;
>>  
>> +	struct phy *usb_phy;
> Should be a part of the previous patch.


Ok, will move usb_phy rename to patch 'Rename USB-specific ops', 

then shall I need drop the |Reviewed-by| tag in that patch since it will change?


>>  	enum phy_mode mode;
>>  	unsigned int usb_init_count;
>>  
>> -	struct phy *phy;
> Similarly.


Ack.


>> -
>> -	struct clk_fixed_rate pipe_clk_fixed;
>> +	struct phy *dp_phy;
>> +	unsigned int dp_aux_cfg;
>> +	struct phy_configure_opts_dp dp_opts;
>> +	unsigned int dp_init_count;
>>  
>>  	struct typec_switch_dev *sw;
>>  	enum typec_orientation orientation;
>> @@ -874,11 +911,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
>>  	qmp->orientation = orientation;
>>  
>>  	if (qmp->usb_init_count) {
>> -		qmp_usbc_usb_power_off(qmp->phy);
>> -		qmp_usbc_com_exit(qmp->phy);
>> +		qmp_usbc_usb_power_off(qmp->usb_phy);
>> +		qmp_usbc_com_exit(qmp->usb_phy);
>>  
>> -		qmp_usbc_com_init(qmp->phy);
>> -		qmp_usbc_usb_power_on(qmp->phy);
>> +		qmp_usbc_com_init(qmp->usb_phy);
>> +		qmp_usbc_usb_power_on(qmp->usb_phy);
> and these.


Ack.


>>  	}
>>  
>>  	mutex_unlock(&qmp->phy_mutex);
>> @@ -1106,14 +1143,14 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_node_put;
>>  
>> -	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
>> -	if (IS_ERR(qmp->phy)) {
>> -		ret = PTR_ERR(qmp->phy);
>> +	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
>> +	if (IS_ERR(qmp->usb_phy)) {
>> +		ret = PTR_ERR(qmp->usb_phy);
>>  		dev_err(dev, "failed to create PHY: %d\n", ret);
>>  		goto err_node_put;
>>  	}
>>  
>> -	phy_set_drvdata(qmp->phy, qmp);
>> +	phy_set_drvdata(qmp->usb_phy, qmp);
>>  
>>  	of_node_put(np);
>>  
>>
>> -- 
>> 2.34.1
>>
