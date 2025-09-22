Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C05B9021B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 12:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A8A10E414;
	Mon, 22 Sep 2025 10:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaREty9V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8D410E414
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M92Fb8031309
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S/sA8nAMeAFMELZqIPjuLjJ4XtaKTMC4EnJ3WDadUqo=; b=kaREty9VXGeciDLI
 tCvv1KCyLhUfKm/djj2m4hnm9nMrsHRkwQzZgWImpLtgW00/4d39/gq+ziey5ral
 QSHeBxAucErWvK23cbWyWyvXCLMWdjufjUHvB0bGfHWcY2QaLk6QCTi3ReNYrTiR
 DJkmfa100TLfOC5xs5R+m3qOmLXAg6RfKqWRo3LlUGS3Q8ixL6C4tdba4NLLFS4v
 0yffZl8J5fGt178CwkdUL2tJpUwed5Y+/wAuOWw2sDaS+lrtPHx0tZuum52E3MIQ
 S8ih2sgoJweK4CzFWVrznjiSBOOB/l60gbOu2vx5X2mUhz286H1xsFLitauhQMg5
 2AMvNw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg34dtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:39:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b5506a5fa7cso363178a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758537596; x=1759142396;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S/sA8nAMeAFMELZqIPjuLjJ4XtaKTMC4EnJ3WDadUqo=;
 b=YqLcaG0W20Z62k/hxI8uc/oZhuKV+NMOvHUt2uKK6QGZ8FXoDVbAvzLJ5qzJPqwk56
 kBzJvvppQAyVqhLomyjdl3W7QfaMmYiaRPrRZFLCuboZFHlSO1IOq3Hul30K49Fo8hI7
 lVeivoHZtFaSogambp4AX7EZogP4GVRnw2Q1f4l8fnUXhK1LpfyZd3H2IB4QQBdfTkR4
 IlsGCQZ9kEhS9oFqYe0lSBuhnqWIkFm4L7vcuVxKZpFpSHrnHORF5nrk9Vzols6i57Pq
 MfDUSQonej7l18bWnltMr9FrFiKEp0WjOXa4fA060nGo7thV8J7QAn2MEyP6FvWzWfin
 mlOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ31Na+cj5lUbSDUgVWwE39mF/Qpqxp/tFmVz5zMIXJGOp+IJrlVEod25Qxq/GmsYRu7u0WRHn+Js=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya+KdpC189jp+K0dO/3GrzfMvFlNV1vzQ9NIrgvw60VnepEknt
 FT55ab1epOGc1XF6mc+vdxabolJDKUwipfBiX4V8XpLT7yYo5xhHa+KP7Tzf6sCbSbs2jVP0fKe
 BF2cYjTVMpbrRE/p+5xqMXIH8zQqVDZP+vje0GIlOuXEg1/+jZ2ka1TLR40LBtIfr4VSLHO8=
X-Gm-Gg: ASbGncsdbVtCe7D3NRIZ6k2Gmy1P9qjunvSahdn3rrUkIcDoN+M9RNpMc4Ho//wESYq
 aBH2VFA6nHX6JzUa0gIzpfZZVfFw4G17+6qN7NpJ9jzKYdhIOMyhsojR8JcsrzBz8h5NV5UZApi
 6ewk2+EMZbVo9uht9vwQvceGYagkTAG0m6hyBdp0ejjrPNZGILzSYsAML/bFybkgYoJaZvfMCar
 nFbE9AgocXdqY/SOJ2VpJlTpaikibltsx7znJNAZZVcdHP3X2MeHjZIyVXma7njxSx8ylflp60U
 PIq7ReRT9Yo8JG6RTadd0/6h382TUBlownMoxxF94FUMeLASt3lzSEAdWZ1UO7S5NA==
X-Received: by 2002:a05:6a00:1894:b0:77f:1a6a:e72b with SMTP id
 d2e1a72fcca58-77f3126ad87mr2512341b3a.5.1758537595661; 
 Mon, 22 Sep 2025 03:39:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzeuarlsbMfcKnTGM+3OHSIOvq4mUD5eYqtObyzudC9HyNv9RqGfR6ipfD9BvwEsV1pOsHsw==
X-Received: by 2002:a05:6a00:1894:b0:77f:1a6a:e72b with SMTP id
 d2e1a72fcca58-77f3126ad87mr2512307b3a.5.1758537595213; 
 Mon, 22 Sep 2025 03:39:55 -0700 (PDT)
Received: from [10.64.16.135] ([114.94.8.21]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2473d0sm12066251b3a.27.2025.09.22.03.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 03:39:54 -0700 (PDT)
Message-ID: <bf823249-18e3-48af-a291-63b89bf83163@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:39:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z6x3bwb7izywozeran5aq64uw4tiwlbwx4kekoy3vv3vt7qyip@2ibiat5focw2>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <z6x3bwb7izywozeran5aq64uw4tiwlbwx4kekoy3vv3vt7qyip@2ibiat5focw2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX8eNly9foARq1
 q4I+IFXeGnXyZF54F+bnNToF5ZTC/UkPK6OW1Y5VhV/cnPVQtV1XUAvrT2JzJst9hm/jMMYP0gq
 DsIH/D6jK7Q4xZoMbzisOKn45sUxR2Y9yeUAUJu1KueRTzvPsS3hhGgqU49S3LjZ4p4VM6VV0P4
 /LOD4SSnF/wRicN3nCS9QMyXfcCqO1Ht6eoXVypVbg1j3GHa2Q2hfm+3qMuA3rIwVOJYYufP/KO
 oy9UCQ2sqquevGZ5sNgbYI2LP9LNgPb5v1ieu5KWsPLwZs4T+RvmiQHqRpuWul6hoDVEetZoa2t
 JNwPSuM/SGuNErBp57z5r4w2YTSYjiNZ7areJWP5zYS4SVBdtSiPwxNUiSPk0BSKAzYDJ5pvGA9
 Okli1xeu
X-Proofpoint-GUID: RJUjMUHbkXbkJq-yKj8PCcGIAUYbZTLj
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d1277c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kiRbvkIhkhXhhATYQ8oA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: RJUjMUHbkXbkJq-yKj8PCcGIAUYbZTLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032
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


On 9/22/2025 5:39 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
>> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
>> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..3d228db9ef0882eb76e7ab9e82f8122fa9cfe314 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -335,7 +335,8 @@ struct qmp_phy_cfg {
>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
>>  
>> -	/* regulators to be requested */
>> +	const char * const *reset_list;
>> +	int num_resets;
>>  	const struct regulator_bulk_data *vreg_list;
>>  	int num_vregs;
>>  
>> @@ -428,6 +429,10 @@ static const char * const usb3phy_reset_l[] = {
>>  	"phy_phy", "phy",
>>  };
>>  
>> +static const char * const usb3dpphy_reset_l[] = {
>> +	"phy_phy", "dp_phy",
>> +};
> This is unused in this patch. It should go to the patch adding QCS615 DP
> PHY compatible and the rest of the config data.


Ok, will move in next patch.


>> +
>>  static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
>>  	{ .supply = "vdda-phy", .init_load_uA = 68600 },
>>  	{ .supply = "vdda-pll", .init_load_uA = 14200 },
>> @@ -464,6 +469,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>>  	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
>>  	.pcs_tbl                = msm8998_usb3_pcs_tbl,
>>  	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list              = qmp_phy_msm8998_vreg_l,
>>  	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
>>  	.regs                   = qmp_v3_usb3phy_regs_layout,
>> @@ -480,6 +487,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
>>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list		= qmp_phy_sm2290_vreg_l,
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> @@ -496,6 +505,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>>  	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list		= qmp_phy_msm8998_vreg_l,
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> @@ -512,6 +523,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
>>  	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>>  	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>>  	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +	.reset_list		= usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
>>  	.vreg_list		= qmp_phy_qcs615_vreg_l,
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> @@ -1051,8 +1064,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
>>  				     "failed to get pipe clock\n");
>>  	}
>>  
>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
>> -				 ARRAY_SIZE(usb3phy_reset_l));
>> +	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
>>  	if (ret)
>>  		return ret;
>>  
>>
>> -- 
>> 2.34.1
>>
