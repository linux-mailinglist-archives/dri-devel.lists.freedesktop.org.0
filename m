Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0399B246A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 06:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078A810E337;
	Mon, 28 Oct 2024 05:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ok+qH6RR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719B810E337
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:38:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S0ZGqP025601;
 Mon, 28 Oct 2024 05:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DcGdkGJJ/AET7TDbqFvnfBOmocqE8x2uSTBFT46DlCA=; b=Ok+qH6RRbSjFCZCQ
 QJ1q9JpS9ptRW+LhIILyKDG6pjsgxee0rh9p1mdmQF7p9MQzSduyiSarWktEG+VG
 2qqQGQBHvuVZjdDpbte3o/OxjgQsi9w4gJXHlGjXaCWvNk6M6NYW6SNqAEzZe/5c
 goXVe2KSNwPPpPMM5qS8rkwglTAI1DZWSk3TcOirHBjAJds5UCQkwuSTJX4R1MZW
 0J6CUlcH4xbAx8cpW36bEhZNGWCXgDrGVxdmHpNt9Ee5jkp/cLNxjjrKvMRMXTkM
 SmdPqLowW9tWUb3aiaUJhuhISRsrFRFK/IRGYPJ2gUgsgawU+6al1vgK+MAPHi6d
 WCPtOQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgubrcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 05:38:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S5cg5i029162
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 05:38:42 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 22:38:36 -0700
Message-ID: <81531046-dc36-4b8a-9b2e-3c917d9632ee@quicinc.com>
Date: Mon, 28 Oct 2024 11:08:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: dmaengine: qcom: gpi: Add additional
 arg to dma-cell property
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-2-quic_jseerapu@quicinc.com>
 <20241015140108.GA620512-robh@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <20241015140108.GA620512-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mXmiI0bX_qo6pghMJMtRfyBFNtVPgxTS
X-Proofpoint-GUID: mXmiI0bX_qo6pghMJMtRfyBFNtVPgxTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280046
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



On 10/15/2024 7:31 PM, Rob Herring wrote:
> On Tue, Oct 15, 2024 at 05:37:46PM +0530, Jyothi Kumar Seerapu wrote:
>> When high performance with multiple i2c messages in a single transfer
>> is required, employ Block Event Interrupt (BEI) to trigger interrupts
>> after specific messages transfer and the last message transfer,
>> thereby reducing interrupts.
>>
>> For each i2c message transfer, a series of Transfer Request Elements(TREs)
>> must be programmed, including config tre for frequency configuration,
>> go tre for holding i2c address and dma tre for holding dma buffer address,
>> length as per the hardware programming guide. For transfer using BEI,
>> multiple I2C messages may necessitate the preparation of config, go,
>> and tx DMA TREs. However, a channel TRE size of 64 is often insufficient,
>> potentially leading to failures due to inadequate memory space.
>>
>> Add additional argument to dma-cell property for channel TRE size.
> 
> No such property 'dma-cell'

Thanks for pointing it out, yeah it should be 'dma-cells'.
> 
>> With this, adjust the channel TRE size via the device tree.
>> The default size is 64, but clients can modify this value based on
>> their specific requirements.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> index 4df4e61895d2..002495921643 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> @@ -54,14 +54,16 @@ properties:
>>       maxItems: 13
>>   
>>     "#dma-cells":
>> -    const: 3
>> +    minItems: 3
>> +    maxItems: 4
>>       description: >
>>         DMA clients must use the format described in dma.txt, giving a phandle
>> -      to the DMA controller plus the following 3 integer cells:
>> +      to the DMA controller plus the following 4 integer cells:
>>         - channel: if set to 0xffffffff, any available channel will be allocated
>>           for the client. Otherwise, the exact channel specified will be used.
>>         - seid: serial id of the client as defined in the SoC documentation.
>>         - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
>> +      - channel-tre-size: size of the channel TRE (transfer ring element)
>>   
>>     iommus:
>>       maxItems: 1
>> -- 
>> 2.17.1
>>
