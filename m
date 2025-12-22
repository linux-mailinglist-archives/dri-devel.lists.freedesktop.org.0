Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1CCD53E7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00FD10E43D;
	Mon, 22 Dec 2025 09:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="okPfP1sF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heb8v44E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEA010E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:08:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8QP9r3498980
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NMF7/7ba2tMpgWwab2kQ9bTMRzziaxOCdiu3Y60sfW8=; b=okPfP1sF0b4HyjRa
 3BH/WDOLCqJAVqhjsI5Z7mz65JSFkSfCf4qUjOSSY3FMs1oLCI/ULMV8EkQcdKMU
 uKPgRUeFjA3a2KgQMNjfJJ86WbL+d4NYyBgEFgJ+1XtEDA67Z+QexqufdsCGkrXt
 xhPpfmMxAzzpBnK/TF7giM/5DI5XT3koK7HvJ3ePUIyfqf9M3faHRhhn/O0UPEUl
 FD/wYwyQ0jDDcjGBg4kctq1XW74lJhjSlW1QGzkA9fCYL6odpfrKtV2WMHaJ7rar
 DKEwH3AlfccgCWbi/diOTE7IAnEEnXSgzVxvJYv3FDbGEADzLVCydo5URGVs20xh
 MkQPKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmetu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:08:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29f2381ea85so82182225ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766394516; x=1766999316;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NMF7/7ba2tMpgWwab2kQ9bTMRzziaxOCdiu3Y60sfW8=;
 b=heb8v44EoBS4Dq02tMDOoY+KLlfmDf/HrQA3a+RzgwZmONpA5xKZ4yYJ+Yw200nWoy
 eJ8K4h4GA7h7rNY4UP96iur2JEOU1M7REsIBbNGpOMA364+Rdf6VA+XFGd388HLC86Dz
 vIfGaviYKEXS3SLZBuRDnKjmICB+ek4uYncd5NtzY9C6JyrUSFVaKzRkyYYpVuSJ0rYH
 a+gsDtYWvu39V1eIy1C3EaTjcKVWZl+Fr6MgnElZD3IZxXwKhx8u3+9BIF4L7WFL2vVr
 Y3D+K5qEmpdmZp0+sQ1ij3SllMZd+kQCqx+M/y9ZZXO9BQbNbFJ/vNkbxwMEd+W0V34B
 /bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766394516; x=1766999316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMF7/7ba2tMpgWwab2kQ9bTMRzziaxOCdiu3Y60sfW8=;
 b=QCakU0BvtK6Og9ehzq2kkMrpFKshXk89VeHeQhX13QdEvvK5Jf6KWFGsaCzSNHGNu1
 ANHj2CdRsZAoecVrFW3HRjwWsp320TOj0f9iuw1q9HQBeyI2dp3K3fpCPcQPNg5mhM1K
 b+cekjx9QhQXY1NCrqslRI55B/yILJ/trHseB3k41RQEQh8lXP0y+06FK7VU+VP9HsrN
 7LCDNevTLmroim2pp/K4CAB2EkswbfPnMldezmVIOzZ7ov4sWVWZVJydCsncVcyE4HtV
 ac1ddymnpGoQ8Cgy5G8FpxzOD/XZJz0ukRf3zWZjSc6fktY76zGLLDdtUKkJbtRiD80I
 BRxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFnCsY5n9K5+esqkN3R0syzbPuWCcrQyuyLmLhio3y2QM37cwTdubbx8DhKx2YCTMTFmwMrlcvEFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkrkUX7KwU9GjlA4U+9tlYN8WPAHWjvs2aw7OMvc/wPE0cYmQM
 GiXZo6jcrAfyH5qYdipTIMWmuQWWuSOGxshJJlMmH3Z0nF9oq1iId/arBhsTtyDBaeaDSEms/wm
 zbeaxQBQ3hp3vpMfChmmmcPmQImwT6A0P1WeUiwN/4DYo4pbVHY76LB1dxkn3xAppl4ur9y0=
X-Gm-Gg: AY/fxX6RK+uatMIiwA0rdsKdnUayEg11X9Nvg6nvfTr2KwI/0T4mzvlXCgEW6SQ+cmv
 cZS4MWFq1QxXSiN9IgvGOLJw428mUzQ5OnhGCoyNM6uEq9onOqBjXBs/my93uY6LpI07abGbL5+
 KU3bW1+96MGwOlp3FGyVO6+35nws81G42K6QQdDxZIB0PshbFYkZoK7YwdVV9f5S3T4BwWcWBqa
 MrHggO6ExobBdrnGgUNfbw03GEZlHFgZjNpzb9cdM1G8Aak8qvs5zJZEue5JRLD5x1TlK+xl/Vm
 3tCu0gZqjjK/YfEDVpNJYrgHDa9y85oHyAssRqdq+0r3L5mj4ejQBOtoLGly/+YAzinD7fvOIK2
 m9lmMICNpAz88T3gTM0+N+6clgcSDlErwn8paDFChew==
X-Received: by 2002:a05:6a20:e290:b0:364:13c3:3dd0 with SMTP id
 adf61e73a8af0-376a8eb6c35mr10547154637.36.1766394515788; 
 Mon, 22 Dec 2025 01:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl6B6o/j2hlUuO96VKa8xLDI3u56QgD3CAMpPMvZyXFrZI8ZfnFJrUAexsmLszQmxJCGIrWg==
X-Received: by 2002:a05:6a20:e290:b0:364:13c3:3dd0 with SMTP id
 adf61e73a8af0-376a8eb6c35mr10547120637.36.1766394515234; 
 Mon, 22 Dec 2025 01:08:35 -0800 (PST)
Received: from [10.204.86.173] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7cbfa619sm8650695a12.36.2025.12.22.01.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:08:34 -0800 (PST)
Message-ID: <b3d2c54d-f2ea-420a-b7f3-b9e60a96a841@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:38:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Rob Herring <robh@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-2-kumari.pallavi@oss.qualcomm.com>
 <20251211154139.GA1424272-robh@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <20251211154139.GA1424272-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tw-UBfDKtQV3uGlKZDNQpwUh-fpM_hAH
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69490a94 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gr6j673y5SSln3Ut_ogA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Tw-UBfDKtQV3uGlKZDNQpwUh-fpM_hAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MiBTYWx0ZWRfX9jPUCRXN4vsj
 0IQNOiqpsFRDLMwJrboi6khtdctGR03dg165vPeUpFgBOYJCAN/2AqCEheI50KYBbqvLZ0H+y0g
 pGLnQsjQm+Un/QBdUW5V7ZEAAjkeeB0b4/gOHGnaAAFUSDnO8NDkr38s5Trcgw0MJKQFpphqMSi
 su8IE6vfN9jLB1Xg2yTeBb6TEhwJqlMWqJCmrYCOW94AlbrSO5wgvw0D/ohOeSE+m/MJ94erpHk
 05nUqYxcGpak9dAjmUZESAxQ9oxfjLSLO/oe3xiPi3Xp3Mf8NYHzmIlthzRHUYe7lHccCYi8FnU
 u/RZMhPf/c3r8oS8K+9SVZxe2xLg+T28uBvgKyYL/5RgMoIkihWdP2CAwtNaauiqbOZ0sPKgtFl
 EKTs1L2TgQfbtDWwZ5QG6b39KxbaECBiKJkVcd8YJs1T71O2/z6tHwd5RWD4qmA/ky1YpXzIlx5
 YY/d4ddB2QBcFjwqX/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220082
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



On 12/11/2025 9:11 PM, Rob Herring wrote:
> On Thu, Dec 11, 2025 at 03:39:30PM +0530, Kumari Pallavi wrote:
>> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
>> that differ from previous SoCs. The SID field moves within the physical
>> address, and CDSP now supports a wider DMA range, requiring updated
>> sid_pos and DMA mask handling in the driver.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 3f6199fc9ae6..142309e2c656 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,7 +18,12 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,fastrpc
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-fastrpc
>> +          - const: qcom,fastrpc
> 
> Does the driver work at all on this platform without the changes in this
> series? If not, then it is not compatible with "qcom,fastrpc" as you
> say here.
> 

Thanks for the clarification
No, it doesn't work on kaanapali without this patch series
I have updated the bindings accordingly to allow
either "qcom,kaanapali-fastrpc" for Kaanapali or "qcom,fastrpc"
for older platforms

properties:
   compatible:
     enum:
       - qcom,kaanapali-fastrpc
       - qcom,fastrpc

Regards,
Pallavi

> Rob

