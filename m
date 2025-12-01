Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F58FC96158
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62B310E2E4;
	Mon,  1 Dec 2025 08:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbNgE091";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPJ24anh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E957B10E2D9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 08:18:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AUNXprP3366899
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Dec 2025 08:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PiR8XQpRX7zr8x83jwupI4R37Ne98MRV6EnwDndA9x8=; b=IbNgE091PRScYFde
 w0ZnzYmIU9bfK1reOpfp/De7WMfGKGMOlMadN/dSVMpRcHyFLp6pAJQJYbDCVG4v
 iWpV911u73O+dXiyOe3HaW7AuEShwLPWD3hulMe1bqWCqKiYsK4LUXGRmsZP4/aB
 7wHw8l8qdV62xKNR2CWYWkR4BbYfCbSKeHMO5MOYz0tULmeluBonBh3Tt5crlkoD
 ttjkKucJbjs0g/PPsTsk3I8CWIRYE+5HQT6aXzr6P0Q0K2auVamC9JHi6vZXblKe
 d28FIRvAay3+tyhrKZI25uhz8kq+WDQ3l5qUgB7Fv5qO+m9xDf0DXz4o9tuzuBeE
 ze8z4A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqu643vq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 08:18:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-297d50cd8c4so116202455ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 00:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764577098; x=1765181898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PiR8XQpRX7zr8x83jwupI4R37Ne98MRV6EnwDndA9x8=;
 b=CPJ24anhyih+p/SXQxe9XJsZncxCQ1uHq3VIv/funVse2c1xRCMwK5s70dY5Rrfh5x
 6Rhp0nZT8ZwVBvRL5dwTIvoL2Zzwr6D5qrVmD5dUpc6/Bt/wQbM/gnFYuACH0oHn0FkY
 XuhCr7PWrgXbWwM5Vi5+7uVC1lJqOoG2atF1dxAVAmnz1ZKF1Kcn81Fld+VU0dKIqXZj
 3ZVBszGbV1Y1eDN9pDK2sNysT24+pnbSEEdf4ix7CBoFwwEfLa/2+k8gzf6cCMz0AhU0
 XOcmD1ETHyPBHOrn/ZHn4tqYtHderT+HyfsFbycQ9O0GGaCQZg8eIwn2V8oXNhq5KIP1
 0YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764577098; x=1765181898;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PiR8XQpRX7zr8x83jwupI4R37Ne98MRV6EnwDndA9x8=;
 b=byXjqndb45F4nj3ILIlpSV8BPpSkN6HJq8KUTequ0Gk+oRhuSowJlnJm9i25bn78IG
 z2ItYb775/SRyStYgLZYRbvJH++pe7Hq7Ois3U8VBbvn7+KMuqiGf51Fm73rTaSIblrK
 Z9znnm9R60DbH5YnSF7TncyjzW2vC+p+y4HYNNGyZgRvp9m65AYWSRnqtzS+k5fW71Im
 7TungxmU0qsckHNtg0b1HC6umZ77FlXwGQ5/edgGQtTRn1/VgMNt9kk09EqxuRwdJAEY
 uXsbCIdcEA6GGnYI1aPMvOV1LbbkD1yTgzwE4AofOVmQAgjQ1z0SP9gN0RibDlZBUymW
 mV4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDUba015G22F9Jf5Xpv+ajZjg+FbNbxvKjJt+JLzGZlPwScgoaOEbqBZR0dSf7JmS0lucEaRVPm8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywkg8B9S4tlp/FGZnz4SgHuhuk+0Hl2cszBE5orEONzzeE16F71
 u1CAZWjgLyOoLDBI9D9i7022YhxSf3cvfiPfm7N0+AJtX/p08YUYGwAwdEzVFsZXsYkrNvGnpfh
 mvoE5fOZoMk4J5Pmb9QgbsjFQw7P/ol9GENfYxGR1JlY2e3zKQAGnNEkv8kYOUW+k/gzQ6BE=
X-Gm-Gg: ASbGncsxfbRkj/n+GoFp6HdUuub2ftFuBG4zf2AdNIRF9MyIP3xcrejZa3KeFEF4Npr
 NfB0TabgAb3DM17AibUoAZ3fTTDH0XsNsdgtieOOeNN3/IWL+d36U+tcrOyT55PgsA7FWLe0liB
 zbVdTTbu/35qSJ1K9v9r41ZEeB9gCelsU7GhGNambiadXjPDW6F+zFinOEoHZnqOBW7oDxlB0rq
 gm6ZKzEvPD0w4pGQpR4ZJ4A/WxKZ2i69eJTuq/lRo1lo5Q4amovIPhrrnvW/czrcqk6vR3wcs5D
 +IutdDZfrjTtigLAhqldjtHJ4JSUQL+DDqEjWGhg/KoawlTOuZ3IDrGOmeBXglphAstTLcLWBEJ
 VuBQax03YBlPBZhMjLJ0OxSCSYVHblTjAG5qv3l/OKg==
X-Received: by 2002:a17:903:3b86:b0:297:e59c:63cc with SMTP id
 d9443c01a7336-29bab148c59mr300080585ad.35.1764577097786; 
 Mon, 01 Dec 2025 00:18:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsiVEfrFH3pUI8q/uZ984B5P6TWerQwXXhXGFirlVDNU4iuFqXc/WiueRo6Vodl/fEKd1ujw==
X-Received: by 2002:a17:903:3b86:b0:297:e59c:63cc with SMTP id
 d9443c01a7336-29bab148c59mr300080285ad.35.1764577097319; 
 Mon, 01 Dec 2025 00:18:17 -0800 (PST)
Received: from [10.204.86.123] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce40ab81sm115121585ad.3.2025.12.01.00.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 00:18:08 -0800 (PST)
Message-ID: <733afe4f-51d8-4c5e-8c18-9843a316523e@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:48:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
 <20251126094545.2139376-2-kumari.pallavi@oss.qualcomm.com>
 <20251127-prehistoric-sponge-of-faith-efde44@kuoka>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <20251127-prehistoric-sponge-of-faith-efde44@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GJj68AviEttF_Xqb_Av4Rr1zAR8lpGZS
X-Authority-Analysis: v=2.4 cv=CM0nnBrD c=1 sm=1 tr=0 ts=692d4f4a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f9DLRBmgI0KZ56IV6akA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: GJj68AviEttF_Xqb_Av4Rr1zAR8lpGZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA2NiBTYWx0ZWRfX71DIftuUq9XY
 H3XgNy6KCdmRuHQ7S3d32pyMK2yzz0psMv0YnEhtsrqQV3vLVSHW2xHpFJaHInesbivUdZaYTxa
 iNlRZhDUYDPwxP3tgzCfCzJPIrVRTFbGNlPrPXwrpxsCZM1M8ODPcVORMbe8sPe9N0RD2k6WZPV
 tyseBBetdS3RI62U6Wzy5qff3DmSshzkCzsFz+hQpqIt0ftQeN+CtJIlSq2AV0SRg+0nFWB+eAI
 Iv3ttQXebneY5poM22I32HW2t1hSV1LgdsmS7eeMkS+1P9nrQLqT0AkxWP6LYm/ALO5PDU9qtKb
 GyHIh+CoC/RkkgbSKdf78UB4Z2tN7GRg3s29jA2pVDW+GQzq7C9+spV07+bmyGdXAzKD10rnDqz
 3LNin+4OF4PFcvz0Mxxvrz7AZx9yhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010066
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



On 11/27/2025 1:00 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 03:15:42PM +0530, Kumari Pallavi wrote:
>> Add a new compatible string "qcom,kaanapali-fastrpc" to support
>> for Kaanapali SoC.
> 
> ... and here you write WHY or provide background about hardware
> differences, instead of writing what you did. We see what you did easily
> - we can read the diff. Additionally your subject already said this, so
> basically your commit msg is redundant...
> 
> I still do not know why Kaanapali needs this.
> 

Thank you for the feedback. Let me clarify the hardware differences that 
require this change:
Kaanapali introduces a new DSP IOVA formatting scheme and a hardware 
revision in CDSP that expands the DMA addressable range. On previous 
SoCs, DSPs used a 32-bit physical address plus a 4-bit Stream ID (SID). 
Kaanapali changes:

SID placement: The SID field moves within the physical address, so the 
driver must know the new sid_pos to correctly form IOVA for ADSP/CDSP.
Expanded DMA range: CDSP now supports a 34-bit physical address plus the 
4-bit SID, requiring an updated DMA mask to avoid truncating valid 
addresses.
To apply these changes only on Kaanapali, I introduce a SoC-specific 
compatible string "qcom,kaanapali-fastrpc".

Older DTs using "qcom,fastrpc" remain valid and unchanged; the new 
behavior is applied only when the Kaanapali-specific compatible is present.

https://lore.kernel.org/all/542f84ce-b840-44f9-bdf8-09611369e6bb@kernel.org/

>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 3f6199fc9ae6..6c19217d63a6 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,7 +18,10 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,fastrpc
>> +    items:
> 
> No need to introduce items, wasn't here before. Just enum directly.
> 

If I use enum directly, the schema will only validate a single 
string—either "qcom,fastrpc" or "qcom,kaanapali-fastrpc". However, my 
DTS changes introduce a compatible property with two strings: the 
SoC-specific string followed by the generic fallback.
That’s why I used items in the schema—to allow an array of strings where 
the first entry is "qcom,kaanapali-fastrpc" and the second is "qcom,fastrpc"

Thanks,
Pallavi>> +      - enum:
>> +          - qcom,kaanapali-fastrpc
>> +          - qcom,fastrpc
>>   
>>     label:
>>       enum:
>> -- 
>> 2.34.1
>>

