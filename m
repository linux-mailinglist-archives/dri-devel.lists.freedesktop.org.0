Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F3B13630
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 10:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8C410E49E;
	Mon, 28 Jul 2025 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqJ3vKw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCCE10E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:19:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rjU1008735
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c3/V22c4H9/4N87ToxYjpj2YTnx67TDaYm5Xeu+qWco=; b=ZqJ3vKw/3GvY4XkR
 u3CP1JJjp9JwcIxipYoHGHzZEbT+MvMBKeBaTicf7yJuUihKYUhTyE2SeRM0bA4i
 hht87B7LURdJ1xM0YJ+76Xn1V7YNMBA8ZTDupifYtDmK4sTM6vw+pZAVjHfwLRuJ
 sJQzQXG79WLFWma44upEaDxFSrKYEIhduEUkGSbeAftU1HlXVq+Bk30iF+YV7wQx
 XmN3ssE54IOxsp45/O1nmgVeLCoXXVMuF/t0lkWiDan60me4LLzjz7+wVxGsRyPU
 2ycHzt++gelNTdIQUJe3wRptMKuSZ0kwRV2IBn38EQg3yrmTG3+uR3+++n3PAVZG
 K/RKfg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk3s1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:19:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2403e631f8bso1000925ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 01:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753690794; x=1754295594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c3/V22c4H9/4N87ToxYjpj2YTnx67TDaYm5Xeu+qWco=;
 b=elWpilJQ/OzUKCjisvR1JKQ8rAp36azHwab1tAwzk3Xrob3ZWWN+EROO0+wTPdbF+0
 v6b7qWwkYSpy7bk5ABjB3BFA4yBn0/g4H/+qooHWATord0+hTZa+c2//b6BTkNVVs/D4
 AsI2G4li1s2nrID7gJV4T90doW7pwp+eKg1NUK+GS5kSBVSbS8nQRLkm2touxk63UqPf
 0D/lu1Yd8QmoYcr1f+nl/M8dxE36vMNOzQJa32G9PpF1uH8jtqyUQlMO8Dn4P9OEwnie
 xxOTHNTh+dq/2ubgrTj7n2740DHMaAp/+zWj8qyMrDYv5RBgt5AJWMj8ePE1rNT+7BMt
 CR9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLRPX5RVk7yW+j0lQ4ijS15MdKIambFkstKL6bH/+x/jMTJx497WuHirNU1pSFUX/x/xulFBauKjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqimTgD4+p9NvhdOve3lGx4VSBkbvwVJ31idO+hOq0dBo0M0df
 sYIXKNnchJpu8D+jKLcrolNcvOyeDmsLH0bahtupl/oK4lB23GIMF/nlaJy0TgS09I/SjQQFsb2
 xX20JwVCAJL1FJmybn4NTqTHQaMFEN60yiSBNRrVhBIbbyjB6velJepJXBar79h9tO3lDaNo=
X-Gm-Gg: ASbGncs6DOTxfl+/vodPXnyncxlQR7F/jAq9EH/1AoYUFWYaEE6LPq2hXNu3aFicB4E
 UsFX03eUybpgrAx0Rz0IDf+5H33/rNLadHN9QWmtQTism21aOzpKA7nFiJwBBqQWaWcsGiw9CaN
 pUP0XKvsOeRq6o0/A6DWA9vd36T8Icxh0h3FfOUAK7UDW9Noyh/aMNwEa7x5t4BrbxxLiJvMpNs
 Av8yPI/omoJv1YesRMolxoIvxATpPos60lQaW6Y1CCJIikjzdYUrERe6Gn4JVbiqx5f3eafX7DV
 lyIf8ppcsP269rP4itioAwJM+Fv8Op2OuGNkxHVO9j9myZKad4qEh7/4RlrbqxSkfS9f2JiQAlm
 t4QiQR2edODh36hHa6tzJZlo=
X-Received: by 2002:a17:902:ea0d:b0:240:11be:4dbe with SMTP id
 d9443c01a7336-24011be58b5mr24214905ad.8.1753690794491; 
 Mon, 28 Jul 2025 01:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBHlvf/+jz4Co0OGrxgZgJllWx8x018fZVsC0zcR7Ey8G6AtlwbI1UqIOOzans4FRj4G1N0A==
X-Received: by 2002:a17:902:ea0d:b0:240:11be:4dbe with SMTP id
 d9443c01a7336-24011be58b5mr24214525ad.8.1753690793917; 
 Mon, 28 Jul 2025 01:19:53 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffdd687aesm28379815ad.67.2025.07.28.01.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 01:19:53 -0700 (PDT)
Message-ID: <c3f191f1-1b83-4284-b164-64c5b3e3fd43@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 16:19:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] drm/msm/dp: Add DisplayPort support for QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-12-42b4037171f8@oss.qualcomm.com>
 <bca68e7a-cb36-4903-bde9-15cb1945c71e@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bca68e7a-cb36-4903-bde9-15cb1945c71e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=688732ab cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=E4FQgNMW2-BcOtG67-8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qMXkAACirbZtql4ygjs_qLEICdwZfDVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2MCBTYWx0ZWRfX0xYxdOgUHPxz
 Ay850IXXpumGgGszUnCGolHR2WDNrgucYObiFbDdSv8pMdJ/IPCjXdlSBWnzYZ7gvtiPe9LjzKy
 ZB5Hb0oHM9u4xveX/SzwP0BwoKPymyBNYVDW/wHJh99ytS/DdfsHMeYykZHnvmFH4v1d2wVI1wD
 eBVQEcRApvRzTGSRk6VtwZjHg5IWR2fyfDkQ9zb42xJOTPjQLhkDw6nSmpt4SbGMij/hs8aOiqR
 9fXSGcVQQnpAc1+w89QBLiIvXTVIqf9cugCGkmP+yoJgIVACc3t2qy+ssYzDgoX8YEDWfFmhROI
 BJmUUDqD3mqJcxx1lV7OUK+qNapZfaMeRybLn3E2f+wScaJRAKCVFExgS2F4R7ed3F66Jo3WD9U
 o3KrO4qaBYcemwkOiOE8RR0vl/8ZD4KssSXyz6auxdDaxpvQSqyfd23E0Z45jypro4eNRzdH
X-Proofpoint-ORIG-GUID: qMXkAACirbZtql4ygjs_qLEICdwZfDVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280060
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


On 7/22/2025 5:21 PM, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> The Qualcomm QCS615 platform comes with a DisplayPort controller use the
>> same base offset as sc7180. add support for this in DP driver.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
>> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
>
> So devices are compatible? Why are you adding this entry instead of
> expressing compatibility?
SM6150 uses the same DP driver configuration as SC7180 via msm_dp_desc_sc7180, but its hardware lacks features like HBR3.
Implicitly relying on msm_dp_desc_sc7180 may cause compatibility issues for SM6150 if the msm_dp_desc is extended in the future.
This is consistent with how other SoCs like SM8350 are handled.
> Best regards,
> Krzysztof
