Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E648C62A24
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645BA10E2D7;
	Mon, 17 Nov 2025 07:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1qqOwRN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2KWG3VD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45C710E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:03:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH4o5te2838158
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bUcuLPCs1yzm/zFnNLKPtyCct5btToJh3ZjXZFtWngI=; b=P1qqOwRNH2SjxmtV
 TU4+A4ETopDSqwMZY8+0isB+7Srx7/t8tgQa1uhx6cC1n8yTDQDDlTX/CaDGQQc0
 KnD2daODWq8N2aCNskujexWhAEOYqiNHpjsxhajfsgtNBLviQu21nDEpjf5o2qKK
 IbD3pazm6cY9jOw3/P64DA3TLhzskugABpNewt632vQmsaw2xXiCMlVBYFGPTtxb
 WJceS6TQ1AvM8n2VsikwgWQoT7DR0+T2ORF4X6Q7V2V/rCSjQcZsF1kPm01Pz/y/
 bzyAJYxebhnSUrlf5KJGNiEjXF8Y2rdbirdxB/vKXQtRxfAGZRuXJpa2L7sVfg4F
 XVcA3w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejmyuneb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:03:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3438744f11bso6871499a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 23:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763363024; x=1763967824;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bUcuLPCs1yzm/zFnNLKPtyCct5btToJh3ZjXZFtWngI=;
 b=Z2KWG3VDIDlKHjyePcLvMvcaz9zi7SCHadEG9moFjrTM0Swb1OFT24RRQiOzLZGTFP
 Qg3h92sVjB0GKWLTl8pP2azdVkPDBQW1DIUzktbyX/2frGyCrPpLJK2LqU86lcuywjBb
 t7TolqsFSadqGT5wO9RhMYe2FkDYX4ZOo1IwMC+lko0eNbZjaB0ZFWmIOq+3RZl7Ry+o
 LyY6RDVBjGMZ+FVpGQUCCH6tRxOXp8pBu9KSl9q+N0ccTjLholVOcZ9QKZgI8HAuZQ74
 doQscA8Q3oICi4m68rOBy7vncuMlgnBqcMWx+nSTPc6T6G6CV2chCxshTyYf1Yn5VtDe
 oKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763363024; x=1763967824;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bUcuLPCs1yzm/zFnNLKPtyCct5btToJh3ZjXZFtWngI=;
 b=ImRwLDJyRdZ9NwlpUHuClaeZ2hGbXJ7CBfSrSa0Msi31DhxZUj/mxa8U/+MPZtaapW
 Jdwn2H6tgPIcx8UwWsugLX5oeUw033Ido4cW7mmJZ6pLQND2+ul7GM/zz8e6GqPHQ8lB
 Kt86MCDnbO9dNfEpDuABuKplA1N1yJNC+3you9Cld723FdvCG2rXTqOGvy3dWOkBcsFn
 Oj5e+LmR6i/qdZfn6umgZVS3kS88Hy/kDOhgP3GWTEWAwPp9ai/OivXY4L2G9StsDXCE
 9nizjJGXkStl6/41MOhN/FmuIfO3qpdeufVsvNFe6IlRL1P3ZNzckXwXR4zJRthRbZ1f
 FQbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpbrZjKlOip1BzLg74FDzle4233IRs0fozlmyQKwhLGvIIu6ySK/ALphIeIpEOLl5Gou9lJ/yYBmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv3+dL3R1qEHUe0t++aIHbP18fgVf4j2nLSjieiOSbDX+YMzjy
 DDSWxUEFoJ9IIsn954SzsVrMMes1Yt9MCm9WbhWf003xcHRI4sheOFpgBza2vvrHd477Cm9a0Kq
 Jaip8fVWwOsFNDRm60ylN35UOQcpN/ebB0KxBZy5Z/ubko1r6vGcC8ig5Y/VSe0r54e6H5ZRlbJ
 OhHWE=
X-Gm-Gg: ASbGncvS4WxRa96ZnpDdbBSlK4OHVlaqbQsp44PgP49sXc3sKW2On57fggRI3s2X7zu
 WIYsVV3qb5uSt8VLannD8PtsI9r8BWwLSen4ioeC3gYoDRM2dmfr+EUxAW5qL8sZP4IGFv2nmuV
 jJ4RfBUTW1sFFxNNzPUDRCAHmxpgNL2gcxH2bXlHArR3MBLsXz5VlQN2sPbsQ2PLkfoD5J5vUeN
 xW48+F/unvWQHbfcftGROCcQ54B1gd9E9FiLNtgtruyI+Wl3Qoq33eolxzc3KfoDEcssaJRcHM1
 9WNPKqu5xs9vOZ7BP8FyYALvvfEnHO/Euu6XD8ee5FqlNDehQ/BH0v56eZiRszhYo1S7vyN7WMx
 orwfONx7NQM/bsULdOd8jmHhCeK2vUKY=
X-Received: by 2002:a17:90b:55c6:b0:335:2823:3683 with SMTP id
 98e67ed59e1d1-343f9eadd5bmr11547243a91.9.1763363023894; 
 Sun, 16 Nov 2025 23:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcS9xLWaU+orjr3u9xRNLpdYNVrxaOF+hEocHdvMHAbk96AHOE0fqkDyg6ZGyADK6p0eLcpQ==
X-Received: by 2002:a17:90b:55c6:b0:335:2823:3683 with SMTP id
 98e67ed59e1d1-343f9eadd5bmr11547215a91.9.1763363023373; 
 Sun, 16 Nov 2025 23:03:43 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3456511fa6fsm8195729a91.1.2025.11.16.23.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 23:03:42 -0800 (PST)
Message-ID: <5fc9b289-2578-44fc-aa87-61b27aee49da@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:33:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <cjuzht6hfzmog7xkwbydisl67iuttdo2jy5hndnruzeu3hp22g@dergmterq2an>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <cjuzht6hfzmog7xkwbydisl67iuttdo2jy5hndnruzeu3hp22g@dergmterq2an>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfXw/kZB//bqawI
 eArzEqBP/yo3UBEMHHPd81/6gRl/2cuSl+aAvtkjSOBpd8vkYiIP/qoS5CYKS7V8qfOC8C1F0nj
 cq14dNaPYS3+8UMEXCkQimc7ROSGKaC0/YMKEHMMAhR7qTvdSLKd8JBVdm6PEgI3+4PS9onvWZJ
 k4oq1updVrzn5IqoOiRriCGi34+Ca6x8AYLtCJPgL3mvS7awIgVI9l5r4LV4+ZJm7XWVOHcj3W5
 1Sfh+CClqJZXROPjZLUvZIKGf4DIsDd+qVpRMAKYlfIKka+J1H7lrGZSQ2HWwIoM8kxnmgBTqkJ
 dB9JZNpSmbyirpao2XyPofv9bgXivNdInEVRGTse3m/r8Hf7d9KzqL+4lkwWiE6TeiML23UH/4P
 PRi/6LKqarryHaN8l+rwRZdZ+q/P4g==
X-Authority-Analysis: v=2.4 cv=BPK+bVQG c=1 sm=1 tr=0 ts=691ac8d0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ZLGELXoPAAAA:8 a=EUspDBNiAAAA:8
 a=7QmZVlL-b-cmGkn9gTkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=CFiPc5v16LZhaT-MVE1c:22
X-Proofpoint-ORIG-GUID: EIGwRrRALwmhnSl1uz-zakGff_xlXfpI
X-Proofpoint-GUID: EIGwRrRALwmhnSl1uz-zakGff_xlXfpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170058
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



On 11/14/2025 5:45 PM, Dmitry Baryshkov wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
> Why do you mention dma_addr_t here?
> 

I mentioned dma_addr_t in the commit message because of the earlier 
feedback highlighted about the confusing use of phys for fields that 
actually store an IOVA-like address ('phys' with something more fitting 
for an IOVA or DMA address).

https://lore.kernel.org/all/969bdb49-0682-4345-98f7-523404bb4213@app.fastmail.com/

>> Signed-off-by: Kumari Pallavi<kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>>   1 file changed, 40 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ee652ef01534..d6a7960fe716 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -106,7 +106,7 @@
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>>   struct fastrpc_phy_page {
>> -	u64 addr;		/* physical address */
>> +	u64 addr;		/* physical or dma address */
> What is the difference here? Aren't all of them DMA addresses?

Yes, correct—both represent DMA addresses, just typed differently 
depending on whether it originate from a physical or DMA mapping context.

ACK, I will update this in the next patch series.

Thanks,
Pallavi
