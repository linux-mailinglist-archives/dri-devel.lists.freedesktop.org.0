Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A70EB31207
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 10:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1B410EA91;
	Fri, 22 Aug 2025 08:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="axp2p5FV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E17F10EA91
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 08:43:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJCj017910
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 08:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 prp9ElU8fS7+zbL7ub2mUXEAEbk0qpOcYYPRR8CM44Q=; b=axp2p5FVzEy9YAcS
 QpKxjbGkrARU1RbimpueVhli6iCQEpUDyqcg494lAA22Jsblt0Th/sBfiscGIE69
 1cMrxA9iLjFC8wqeBW3j+iVi4qMr7244u1I2nLm0h8ZcHGhRtGUE91bywbj+wAC+
 dS1OXqb5MHjUQgLEWmycT0onvSSvjEhCGo3MvcxRyatfJNxu//k0NhgqtqE48r/o
 IQxgsdFIhbVJrbr+U3VeiDUKJ6oh2ETrWciK8ez1kn1/YDad6B5nZdZUNVYnfMn2
 t4hhYkryc5kLI8EpPH6r4NFTYV4FS6Ojkiu8Keq4erueicN48lcstEy2lB1MfY/4
 iGR/rA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0dbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 08:43:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-244580538c3so4850025ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 01:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755852201; x=1756457001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=prp9ElU8fS7+zbL7ub2mUXEAEbk0qpOcYYPRR8CM44Q=;
 b=kWFu2hXkrqgqo/FuNk0GnanCYWhF0TQi6tslKuX2MFshc9/CdgXbXQj0hTKkrvjuzv
 iUGXNjV59PNXo3E6Zy3vEfz3Q33fUG+dmyqBpBef36psU1iwLSCVy4ArxnrbuThdpL78
 G0s8mK+CyD2VJuJe62EoGEYwvK61q+DrHaQbq3T1yEyNTUIV1pFGheXtV5N0lpMeAD3A
 sJvQUj/AqFiCZwVOsXBoV3zNjSziJovdPvfP7FUY8flrOMpeiq1xtar3Os5OfXpF2ltS
 oye31Py/4siLo8otetjuLtTFI+smLFTanyi08I7W6OEzdVxS2zOkD8np7PDPXCVGZ/xy
 L32g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwUE33rckEeTVoTE14+gg3XtZ3Nkp8dh/SbjHFaatGZYC/NgIIL3No/nRSksFVtI24C3ughRZlLd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvWd2gwvXAPtGffRo7I12J0ivSS1lURPFOGBIb9yA6rhgq7V6j
 wiTOXowejLl3oGfZ6ktZhrKDdSSJ6y5k0NfiaVPc2y05MJzUdrOR1MwUEdSYDm7Um+Sv5frw52s
 HMnmOqBLHORpUgjXCMkLu7bELa+Am2QBTf2zbncFJJo8XrboF4nGCCGwXiUUQsCmTnACtx6Y=
X-Gm-Gg: ASbGncsU9YfLZEsh6dP18mos0SY8w0F+NQ4U2CRyfhy6dTzootY8kFEIZLTiuxIOSMx
 hz1WXRSFWN4HFo5dGffeY7+3P5cZuk3cJauklr6RNh/8bJCpP+wgfGKWXU0GrpvooG4CqIrH+z0
 BFi05HwO/vi6CEV5HHmh5nIeR2n4+QWQVWsJkjN6d3ljRmB1Gz4TSlCpp0467bXDDtQXbmljPJ5
 GwKQuPLzjOk08pRNxAbOkkcP2+DISPV+kElN4yNZQtflFd75AuOlJYYgG/phN+wUUGeE2hmSdi6
 meg79KBFtEaSc7PIYqVHjRydusKPDkZzlfqWN7YOCns8axId8FOwurQ1BkiQ2FtLdC++8ZGpxME
 YyDb7zLfBEFBRuifGkkCXSIRT+nOhGg==
X-Received: by 2002:a17:903:1d2:b0:240:3e41:57a3 with SMTP id
 d9443c01a7336-2462eb662c2mr18145025ad.0.1755852201150; 
 Fri, 22 Aug 2025 01:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEXolhUjPQKDUCRG284FJEb8zvrf0fcnVfDTTz3DHtqN0qA20e9P4wmEWvBmU3EEicTDFcdg==
X-Received: by 2002:a17:903:1d2:b0:240:3e41:57a3 with SMTP id
 d9443c01a7336-2462eb662c2mr18144665ad.0.1755852200709; 
 Fri, 22 Aug 2025 01:43:20 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c7588sm77576235ad.101.2025.08.22.01.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 01:43:20 -0700 (PDT)
Message-ID: <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 16:43:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
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
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
 <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX95I9H2mzUP1z
 jZb3h4A2X+KT/xmffqF5E5k2Y2Gf2UuEQP7tJNfFT/elq3Q+UR5mVz7QajWs9mXsvIiRCOudxzj
 fyZF5GgEZ0tzGVobkOHouaxKDhoeKjL8u+pbyq62/uJ+QZDbMAwaWonDtwOf8tSKF7dvdyv20SZ
 8hMK/JduoIazjuEV3JfEjRFp89ipQvRXAclojQO+DQsIl9zQWDRlxkh+qMlnMu+i30nsrlv/E3b
 HsKBMZTFzZ/NTZnP8Seh4ImJ3JhpPsdWhPYW3MvumU3IigRyrRqJCaYd11obPrGDVN5+lh/kg9R
 S7tJL0a67X9AGZeTPTeXJQo7wA26eJsXU0cYaN9kOQGTSxlJbjVTghAUpjOAMjzCaNyoIW0CNZM
 O7K3MSYUcx5LZMtTYwNAerT0if8gtQ==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a82daa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=B0UfJI3MrboyiCAuw3UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: K90m1z5hB_NsP_efbhVhCEJmOiP00ftL
X-Proofpoint-GUID: K90m1z5hB_NsP_efbhVhCEJmOiP00ftL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
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


On 8/20/2025 7:16 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
>> Introduce DisplayPort PHY configuration routines for QCS615, including
>> aux channel setup, lane control, voltage swing tuning, clock
>> programming and calibration. These callbacks are registered via
>> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
>>  2 files changed, 252 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
>> @@ -25,6 +25,7 @@
>>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
>>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
>>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
>> +#define QSERDES_DP_PHY_VCO_DIV				0x068
> This register changes between PHY versions, so you can not declare it here.
>
> Otherwise LGTM.


Ok.

This PHY appears to be QMP_DP_PHY_V2, but there's no dedicated header for it yet. 

I’ll create |phy-qcom-qmp-dp-phy-v2.h| next patch and define |VCO_DIV| and shared offsets with V3 will be redefined accordingly.


>
>>  
>>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
>>  # define QSERDES_V3_COM_BIAS_EN				0x0001
