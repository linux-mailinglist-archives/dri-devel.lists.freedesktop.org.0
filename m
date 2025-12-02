Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5651C9B040
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 11:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C867010E5C6;
	Tue,  2 Dec 2025 10:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MupdOExJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvFAXAUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993AD10E5C6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 10:01:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B22vGeA1090857
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Dec 2025 10:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VCgyHpBwQTHzIAgBMQn8Tj44im5JyB4dlR9ZKOC00xw=; b=MupdOExJPHKS91JK
 OrTN9mOgl8emGkBoTUnDHrT8uwVXEEVM64XYfBDrx8YSK7ssxm/goPpPyZM/3F3j
 8cYu4Elmc0aqyBGMzjU+LzmzYWG/ZOvD7ZOYwp1uK2jNjCR1mfLCl7M4/kMKEQS7
 VIcmBelIqaEuPt3XpXcgrXxHSHWIbRHrwt9KJdwlYBudCN8dVo11oJNW3jWsr0XM
 jmyRHEBcHE66FH7uFHtrWgfoxxa0Z2ZxMmmUOL6bSR3Ln/fqKK1kfl64vXlFc9/A
 x2vt7ESELlZaNnGrzfM9Dlhr4YtlrtORn9QXbCnGK1Ire0mKsbH3UV7wPlTGLXXR
 U20LIg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asfu12u7v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 10:01:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b969f3f5bb1so7671313a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 02:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764669687; x=1765274487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCgyHpBwQTHzIAgBMQn8Tj44im5JyB4dlR9ZKOC00xw=;
 b=WvFAXAUCusOcJ6updL2Jy8YDCdyMLQuCEA1hrnWzph16m+UbaL6mPsQOaPGZuBtWHn
 b6xYN8WtET4gF5GQ4CC+KPdylTCJyWSMozBWrJshOyvKHk8ApgWMMkFI7ypvL21c3pVw
 MBCp1RKIhpDKxffeZzcyQ6OdBX6qhlRnatY5fHiRP8GDL85IcDcCcJJC/bDZGg9lAuL/
 igisoOAwsvkDHN7KdimyDlmb2XzJ7twrD07zV4qSufnXMJuYTOXEKYe1a9wniuDmPGtq
 bICWmV9UxFuypJFA+Tondml8Jm2fPqRLX3J2DC5kqF16EVV8kmzf/fkmvzeKcINXxWNT
 ra5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764669687; x=1765274487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VCgyHpBwQTHzIAgBMQn8Tj44im5JyB4dlR9ZKOC00xw=;
 b=hEnOs47j0r8Kc7UWYAtIbeU6RHHV76pJaWb99DCHofBLKY7d40VZGPY6KUJ1yrk1pl
 cr2hlQnAOwOKF6MbRZPQKKKc1ZvSnpfGVTYBfPrJqE7Ai5Id2YvLaFe0va9zfXAXyhKZ
 sb/3YTVSEyHWKPuSflpK1L+Q44TGMUz9llZi8TA4va/c1c/vzVD4Lsap3tpQFHicHaBf
 ZjWg942V409qkQ3C0LwxU0Sm3VGtjoMS2PkxLk3mY0StrJitQBnq68fkEKA1vWdgn92P
 PvdMKsClk3JnINwJ9gcEIgfC5rWxK1RM3beIwsw21x33kGqvsWEXLY+jiXxpHz4poby7
 OKgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIRbl6z/mUL9G3Gm6UTrbUKzcNdhQmAtYtifHsb0IyMv8Cd+eXrRFsAE5tcH7Ny3ikgMw6iOKGZrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWxGcEY7hZ7E8bDVECL0O4+ShVXHrEavKehPlfqwYi6c0OWJ0J
 0hqKd1SWBFAF1+wdBfnCWEuQ0Q3orfjxs6CJZHQxRGU263P11pOjHcpq2Dl8BLFQI7hqexKwaus
 Rcv+eMF+805d8Oh0bg8jmDwTe/X7yL3rQOqDuLNvj3n4nA43pyNNrLOZLcjUxDEyeuK9EAgY=
X-Gm-Gg: ASbGnctemaWcwCamvWPHt6Po1E25sBi6yFGJgVw1jhqfGnBfAN3UFfFzhP+4f8zgbxC
 68vibcSvkInLBPUJzzO464p7AqDn8R575RVIIPzKO0QTyKUXmeODleOIPAn2uEgkDrl3yOSHXF5
 j2QpRr4enl6FO+gZGi1gw5qDHkg3HFuPBmY+4tKJR+Zy1CBEAbDtcxogj61QrhowlnVMEhEczGe
 nnpBxBE1NLPQKvqsAs2teI7d2yIyor4+N+BHzFGa6/WpB1sUOG660Esb9XLVLhj23qdun3cOFBZ
 wHkGXU7Kr9Dp1YioXks9mSjmU2O9/yOocv0cmfSWQgVBjnr2HAjyE5XTE7jdg3mAz9k29HJU0T2
 sIFi/0Z/siwEVkrfFnwDnhhItOkII5le0r4Sy1JGFCA==
X-Received: by 2002:a05:7301:7194:b0:2a4:3593:c7c1 with SMTP id
 5a478bee46e88-2a7194ab2a1mr19578319eec.1.1764669687357; 
 Tue, 02 Dec 2025 02:01:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKRFsMylJah6XxPplvV9ZpzzT/gex0k0NSf2YPvwqBcH7AOdKS2xzxMzA1XuIz16ntn4kKiA==
X-Received: by 2002:a05:7301:7194:b0:2a4:3593:c7c1 with SMTP id
 5a478bee46e88-2a7194ab2a1mr19578297eec.1.1764669686707; 
 Tue, 02 Dec 2025 02:01:26 -0800 (PST)
Received: from [10.204.86.123] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11dcaed5fcasm83627991c88.2.2025.12.02.02.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 02:01:26 -0800 (PST)
Message-ID: <ab942177-a8a7-4047-9b6a-634aa3d15b21@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 15:31:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>, kpallavi@qti.qualcomm.com,
 srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-2-kumari.pallavi@oss.qualcomm.com>
 <191e6be9-5e61-43b7-a75b-e2d211bc6630@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <191e6be9-5e61-43b7-a75b-e2d211bc6630@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MCBTYWx0ZWRfX+FWRY0+j2FYo
 UPJPSbNlCZ78EM55QsGYrP4LZMF3e8h3mOAl90pxTXKxfRG5eINc2+2cF24NsUA2IPf6I2XK7aI
 QrwPXa5EdOaTcS3yLR/Fi6D9el2P36KTYUCHdstYLXg5rtfml2HzGaBqLcppWjp4cXrcZ1ppPEk
 5pOfbzVkOk8WxfbBBahujPP7SmTBPjRI+fwmBChrAu+f08qi3kHMjBfwxWj0yBdsyBWq/8wsKmC
 Do7LKrh9nllXNBmyy62encrivsrqvFgrROaupUVPWFRQGxp6pW78WZc7i/7bzjCbnQ1wuFj5WqU
 FvVOIZc229okhXxYg3rNoiTQyEY+7SptPikck7iaNY1a4Jj7lr0EilYFKchu2oz/VoIZrv+qRFI
 H9xUhfYQKgqoLIp3NWSgHczbfbv59g==
X-Authority-Analysis: v=2.4 cv=BJW+bVQG c=1 sm=1 tr=0 ts=692eb8f8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9uI-NWsv2U5wCxV133oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: MCZnAx2as5AWos481DxtTolYQ88hQYjC
X-Proofpoint-ORIG-GUID: MCZnAx2as5AWos481DxtTolYQ88hQYjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020080
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



On 12/2/2025 1:47 PM, Krzysztof Kozlowski wrote:
> On 02/12/2025 07:06, Kumari Pallavi wrote:
>> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
>> that differ from previous SoCs. The SID field moves within the physical
>> address, and CDSP now supports a wider DMA range, requiring updated
>> sid_pos and DMA mask handling in the driver.
>> To apply these changes only on Kaanapali, add a SoC-specific compatible
>> string "qcom,kaanapali-fastrpc". Older DTs using "qcom,fastrpc" remain
>> valid.
> 
> Drop last two sentences, redundant. Patch contents tell that.
> 

ACK

>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
> 
> You did not test the v4, so is this one tested?
> 

Yes, I tested all possible entry combinations for this version. For v4, 
I only validated the best-case scenario and did not cover all possibilities.

>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 3f6199fc9ae6..8bf7d4d83c8b 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,7 +18,13 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,fastrpc
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-fastrpc
>> +          - const: qcom,fastrpc
>> +      - items:
> 
> I asked last time to drop the unnecessary items. Wasn't here before.
> 

I’ll update the schema in the next patch series to remove the 
unnecessary items. The revised version will look like this:

properties:
   compatible:
     oneOf:
       - items:
           - enum:
               - qcom,kaanapali-fastrpc
           - const: qcom,fastrpc
       - const: qcom,fastrpc


>> +          - const: qcom,fastrpc
>>   
>>     label:
>>       enum:
> 
> 
> Best regards,
> Krzysztof

Thanks,
Pallavi
