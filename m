Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA707B30F83
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 08:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E4110EA6F;
	Fri, 22 Aug 2025 06:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpypsNBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E082410EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:49:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6I116008432
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PAelQyATkPA6YSXiRQaF3kDsfrHXJ4J/shH4gx5CIb8=; b=XpypsNBcuyAp/E9l
 cMSqL9doPX/KQeFqCC5fdM4wqiI1J54UThwJttpQCwPqaSWuP3Exn3DdAtl6z7nH
 dxunfAwgv4QMLgEo2clVv8ZtS7Hl5FjHMy2ujAsTDUJYY0jt6qtfMKI1xgZMo7fr
 K3O//G/YQBO0uqeuP83fdJl+g5dwuMzWisOt+OYY8y37rekTc1VPy0j5gp0cuBBE
 G1Hse0gaaU4//wDwBnX7+uL17KX0/EKFzABR9OY79PS+8tKi+f++eLP3WmpwMSEv
 1Gcl+sbQ4IP9+x+gdEHHa8m3Fc31y/QIxHm42aNykv4nJRwADxGei5WViPKfh+J2
 5Aso1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52982sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:49:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b49c7295627so12215a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 23:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755845363; x=1756450163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PAelQyATkPA6YSXiRQaF3kDsfrHXJ4J/shH4gx5CIb8=;
 b=nJEXN85+e6tVd8cNUq5DV58TDd2ViSVH6FayJhqizbGV0EIP0BmKt1W7JJi7FWiXaT
 G9bpfdmafOabBel/n0rEMu0vcRCtRhsrNpMelIMsyn3EotWe2kWe1oIWcJBcXa05CRyv
 QkU8dm1C0092CcmjBWnLZlHkVH54H6MM1bn2gsE8vxsNlPyU5vXrhqmbbbQr9GRQyo3c
 bNB/YUi06EvQUzxDez7Eae6BB4cR2N/eEeLmgiEauQR/En075GVxdxwCSr5ZI/rhukYg
 75SibfnwJpEH5tTRzWoM2gjAaRbF3ScKUzXQSLJZ7oD2sbnv3bQ5YeLPH7IlIOm5KL0E
 wpAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhL0DttJ3gYrdZ/7/a8uWTNf9ygLSKXgyzWML1DJrvemYgnIlVIyTwk0lSK9l2x3piMAjMZSu1g18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz69UyzkRXKJ7M8s3A9HKXLTPJ+bP6cbbzoPx0P9U+FUPoaWHmP
 7A2tmNJAFHyP4DR9AGihEbzPruSEDbpS3CH1b7R2qYGbBM2yBa8y9xLywbA0K+Mp/jEfxrbgYZa
 MaqCOqvsDPKOuyPbQKxFGH9UAtzUIMlRTkcL0Cb4c020BAl+SQjinlV/pldvDbXs4Y/0RsfE=
X-Gm-Gg: ASbGncuDuPdiMSjfIQByVXi6Jomiapbe5xaRTQG/rSUY+cuXjwkopF7t/HhDNuHdeQm
 59vTJpXGZGcgLRM3Tyagg6Vwcp0xBQ8mZTkmw/utgR/qJrCvFSU/C7yUduROmKNNhIHAwze72V6
 U5qRFBm1pUZqU8D0Xb7kUXhGiM4gvPCqXIcZAaLRCxmjcN0px+683dMsDvnMIyaUL4uFD0GCuL3
 nSLDPrwTROwHszCUjAOMsDrMIO/z3Ot5j+iJfKHWSCL8odKnjYf6aH6VovGrM1+hK5Gr2c+KM0s
 fArpMgeCkctuB3hilM8QU6RUAmgR//2jCpR2ma/yvBejYVhvOnY1kPdbx23f5/7Tj4aTfywVmrC
 sL/WEccqiv8UCm+4u2OeE2BzealyCjw==
X-Received: by 2002:a05:6a00:4b16:b0:748:f854:b76b with SMTP id
 d2e1a72fcca58-7702fc0b4b9mr1451110b3a.3.1755845362735; 
 Thu, 21 Aug 2025 23:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw2XinJYhFdfeOr2DKaBI1LxvJNvXAx1nbOyA+a6mHNvNi1D2KrOEAJ42/+JTdElCmxHO/Qw==
X-Received: by 2002:a05:6a00:4b16:b0:748:f854:b76b with SMTP id
 d2e1a72fcca58-7702fc0b4b9mr1451069b3a.3.1755845362261; 
 Thu, 21 Aug 2025 23:49:22 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdd6sm10099827b3a.29.2025.08.21.23.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:49:21 -0700 (PDT)
Message-ID: <d21c4c74-a36b-4f01-9c22-44bcec3c20eb@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:49:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
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
 <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
 <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a812f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LJgbN-Jd--P93uwsTkIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 5rToh7V66tjUQtVm_LPtgzVYvfZZBTHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9vGmMYsJVuuc
 TYCJEyPcEB7hq60QNHn6FrJapXoA/de7XepdNfLV0j9npxMq3hxHlS/V1t5pwgBBk7oItEfwQ8m
 SsRlggmN+S7zuZuM8fU9r20SHAfJRkWW5Y5iYMl7Azl9MapvWjKWirSLHX/FCjgEM3hIBqTFJ7z
 4kzVD/jTPfUDAgEcWAn4/WHmrX6VioQrc6KLNMCQNjdnG/RdaNdyeIhdwDzZ+O8Nlt5FpcBnCnh
 v8EdYZE3qtOzvspM5DYovQN8ejHvNR0iFpZ120xu1cQd2nzobv8fYbCJLGrl0yC9PGD0o1Ituyq
 sKFCxL1M363Y9mLczMwjHu7jxO2omiR5yV3MBZfgbU9xm5MfWCVx9yUrnAqc59FUy8yEmFYLGr3
 +Thgv+34avj9db1hkTVHGWyEH8L+vA==
X-Proofpoint-GUID: 5rToh7V66tjUQtVm_LPtgzVYvfZZBTHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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


On 8/20/2025 7:34 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:46PM +0800, Xiangxu Yin wrote:
>> Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
>> differentiate between USB-only PHYs and USB/DP switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>>  };
>>  
>> +enum qmp_phy_usbc_type {
>> +	QMP_PHY_USBC_USB3_ONLY,
>> +	QMP_PHY_USBC_USB3_DP,
> Drop, you can use presense of DP offsets in order to differentiate
> between USB3 and USB3+DP.


Ok, will drop.


>> +};
>> +
>>  struct qmp_usbc_offsets {
>>  	u16 serdes;
>>  	u16 pcs;
