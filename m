Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F1BEFDB1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BA710E278;
	Mon, 20 Oct 2025 08:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gf2VOWhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4599810E278
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:14:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JLu9dA004642
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cqErHmEw+q0Gb9LguQ9gJqRnV0oxz5k7O/UGJB1RlIQ=; b=Gf2VOWhKCdH1LMKb
 9l0Yyn6xFMW3W1lHdWbQ3AeeIsfo5zo199DqRLl+stxPOmwCJOYnrwV9L6z6Mqhq
 E+mB652cyDj/s5VjEzsHalsEwqQYEs7bJtwnWDsHkHDAJDKEgHBheuBOYuR7zkVN
 ZbyVSSb6/3LR2Y/mD+g0PULsaXtS8i0WIXA4oi1rV3PwKwsKpnV+6kuiuIj/9eiI
 Ll8+EwhEbUShIBW+ViBfAYsNYl468aRKFH02eyUVb2bFFIKbo7IYAnRg4t0iJK3u
 Rg9MV6ZHGek0UzbxkGR8d78d7en4ymOJs2Zv2M1KVpyw49/tujlnGFCpZbLDuteu
 xNgpmA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469byyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:14:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77f1a7d00c9so944342b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 01:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760948067; x=1761552867;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cqErHmEw+q0Gb9LguQ9gJqRnV0oxz5k7O/UGJB1RlIQ=;
 b=MJLirJhCcf6DUYcz1ZgDVuZjKbSm3I0FVdO3QQPQkDHO2Hkp4lcXbcly/MioA7rTy4
 G5APkcO/6/lQ+Y164cxB5YHIE3I6uSTIh9AUKfreYhiXc/DpfBzN/jAGM1+x8tWZwrRW
 ANhRL6Jo5puz2j2FOPk40ftksex3MpYy21+k4C4PdaZJjPAZS7BVmNaxuZxSe7Ah2rOz
 kZVDDY9tnDB488rak2bp1HOVnLL6lR0O+Q+Lus+3uoMPY3OSoGfNEDVLpiI/I/VeovR+
 ZIu5j0METxCgdlAYlB5kYK9W3K/Gp4BdX+/V22d7L6DExm0Zyt2Z4F+dO6Wu9hDVVbZz
 yYqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi2GMQKXfAhfXV0c23hHIgaurxjypXSdbXwujcFBw9SI5yC2W3GfkMg3w3tAmDHSiYrM92daBBx5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkOodH04ZFi5iRfQ7Bssgcxu2b7FvqZOUcyl5qFLOsbskEJho7
 uIgOceCdFJlmhUKg/TUTrt8wzm/Z4Y1NzCIWSwKRTIkIYSEPoySyEmsVb454ixKSvJFARgK+WIe
 0LF61aw5+V6eR8cssP3voRtAzVQlA9Tpdblq5ugK3/jU3w80rIaLp1CRAo9Lr7IaDeahlDvs=
X-Gm-Gg: ASbGnctCqWIs62YqCzjCHdpY7pSFBy91if11L75LQkk0zcFmNrrfC+xpEbZ4h6r3z4l
 eekEw0or2yM6HWNvvSjzEHGCI2faUkF1Ket3l9Pkpgu/sKmA5WIYXRWE468Xooqph4fKhfQDrax
 V6BgloPdOanjmniirZ3cDaph3pR5Y455M97y1PE+r39I5/oaMxGc2L7dBIqH8HqqcJ855EhEd5d
 llUffP+ViBIdZe9Ly3sLrlxcXQSoZkRhl6XWuW5fg5LDAcB8A24s8CnQsvyOsn9G84hYs+j6HKR
 Osz4dKVSy05I5rrNHqQYmluPJfs6cAFOC+3qF+IT9tZiIGtUTfSBNkbfTdPJ+Wlwu6V/z2BkBnC
 Afow76sf1wxlFOqSpkOrsnkF/BySSGKYQHN7SwCtHW+fFE5vaF3pjv1TWZ1IMBLh5nLc/9A==
X-Received: by 2002:a05:6a00:3e17:b0:781:21db:4e06 with SMTP id
 d2e1a72fcca58-7a21fe23a9cmr7338924b3a.0.1760948066792; 
 Mon, 20 Oct 2025 01:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYG7VcpOs9/sXd8l28vPILUQQOWXIHteA2HclIXYOQtqaNMgzV91sC6BjxWGVMix8BHepUSw==
X-Received: by 2002:a05:6a00:3e17:b0:781:21db:4e06 with SMTP id
 d2e1a72fcca58-7a21fe23a9cmr7338892b3a.0.1760948066367; 
 Mon, 20 Oct 2025 01:14:26 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a22ff34b8bsm7573235b3a.22.2025.10.20.01.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 01:14:26 -0700 (PDT)
Message-ID: <eaca20a6-5aed-4870-b45f-e341d119db3a@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:14:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
 <13d1491a-2c5a-467d-bd55-01c0603a4b81@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <13d1491a-2c5a-467d-bd55-01c0603a4b81@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NCHnoMuuabwHYGVMGKFPPNFZfDt0HNs-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX+TeAAYmVY0JI
 cpyipPVGe4St+zm/ybRt+9qoPcwLur7AW1NpyB1Ak8nrloVjOCtMeNtDYk1t17Yfft7MBOsuN5b
 AOVeOog2OrM7MT2dw8TJTNhBX6lQvBft1Dl+naaxJaA6ozd9UAyvp5XqDcui1igjhn0zYmdhPv3
 3u+aW5yHI//28Eq4UEY7Gy7sCHX6IHZfyGqxtRoodrQr+/fmEDFqztO/TXFSmVO5iZ4lPJYAywW
 2QlpkSIy4IRUCqAK81Cdq2FOq4KcQEH8Y3qGVeQ3MWm4JwB5WJnPXnTp+z9llH//Y1UIQDw8AOA
 GIrkxWtbqYcKaaIVvJzkuEied1IEA1HXrka4arIanW0OC7MdADWW0xBiDaDWx0kHRiIX4aE5lga
 yNoRih8KCAm9nqeVZFNAb6WDbXwlcQ==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f5ef63 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=teJiM7Ac5wN5jP0k6lIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: NCHnoMuuabwHYGVMGKFPPNFZfDt0HNs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032
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


On 10/20/2025 1:11 AM, Krzysztof Kozlowski wrote:
> On 15/10/2025 03:53, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
>> clock assignments for proper DP integration.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 113 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 111 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..36a536cef99a095938f3e18a9b5e7825308ca426 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> @@ -17,6 +17,7 @@
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>
> This is ordered, don't break it.


Ok, will update.


>
> Best regards,
> Krzysztof
