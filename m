Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D379B244F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 06:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E9C10E336;
	Mon, 28 Oct 2024 05:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WlX8MXIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC1910E336
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:35:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RJnPkx027996;
 Mon, 28 Oct 2024 05:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9NSTIys+EAHqMUF3so3kk3l6zKDoYF+syemcZz0Mi7k=; b=WlX8MXIKJUY/U/yo
 gVpNYadQvZDFx48mqoqoGnZ4EswhLj/3sRSvtE42jc4HHJxBd1h6ilChUpwSqPw+
 tH6a/ItRDqkHulR2YSiIPwSE3HrPb7VjpqRvFOk0nzhlHocjubFR8bbbG1NKKOMu
 Vts0X3oN5PO/ullh3hW4W5FkPrhVjvDOBnSdR9aYrTFRGlnEGastb+/dhQMLNGWo
 NL0/sVP0/kjbK/AY26/aXxIXTf4ewkGmULKJmCmQJ/UiUf43tzGqFSAZ7IKbaRkX
 0B3hHr5ykJ4w/8cenZnuzTLvq5isdvOXePAnkZccUFwVsuy7IU3j25A+ORZw3Gv6
 DiiVMw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4uskf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 05:34:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S5Yp7Q023709
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 05:34:51 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 22:34:46 -0700
Message-ID: <fba6241e-fe9d-488f-9280-4efb244c6464@quicinc.com>
Date: Mon, 28 Oct 2024 11:04:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: Add support for configuring
 channel TRE size
To: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-3-quic_jseerapu@quicinc.com>
 <78a1c5c8-53c8-4144-b311-c34b155ca27c@kernel.org>
 <7e7ksit5ptjrcnct66v75mbxuabnzzloungockdal2dl2y6nn5@ge4mrsjmd746>
 <658c19c7-9eeb-4329-aa96-a4a9b09d7117@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <658c19c7-9eeb-4329-aa96-a4a9b09d7117@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dRBTmAYnW8DVYaxmNVeEQ3k6t8TeWopt
X-Proofpoint-ORIG-GUID: dRBTmAYnW8DVYaxmNVeEQ3k6t8TeWopt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280046
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



On 10/17/2024 12:40 PM, Krzysztof Kozlowski wrote:
> On 16/10/2024 16:35, Bjorn Andersson wrote:
>>>> @@ -1064,7 +1064,7 @@
>>>>   		};
>>>>   
>>>>   		gpi_dma0: dma-controller@900000 {
>>>> -			#dma-cells = <3>;
>>>> +			#dma-cells = <4>;
>>>>   			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
>>>>   			reg = <0 0x00900000 0 0x60000>;
>>>>   			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
>>>> @@ -1114,8 +1114,8 @@
>>>>   							"qup-memory";
>>>>   				power-domains = <&rpmhpd SC7280_CX>;
>>>>   				required-opps = <&rpmhpd_opp_low_svs>;
>>>> -				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
>>>> -				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
>>>> +				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C 64>,
>>>> +				       <&gpi_dma0 1 0 QCOM_GPI_I2C 64>;
>>>
>>> So everywhere is 64, thus this is fixed. Deduce it from the compatible
>>>
>>
>> If I understand correctly, it's a software tunable property, used to
>> balance how many TRE elements that should be preallocated.
>>
>> If so, it would not be a property of the hardware/compatible, but rather
>> a result of profiling and a balance between memory "waste" and
>> performance.
> 
> In such case I would prefer it being runtime-calculated by the driver,
> based on frequency or expected bandwidth.
> 
> And in any case if this is about to stay, having here default values
> means all upstream users don't need it. What's not upstream, does not
> exist in such context. We don't add features which are not used by upstream.
> 
> Best regards,
> Krzysztof
> 

Thanks Krzysztof and Bjorn for the review comments.

I have reverted the changes of supporting channel tre size from DT and 
will make use of existing channel tre size defined in GPI driver which 
is 64.

Regards,
JyothiKumar.
