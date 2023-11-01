Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584A7DDD9E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 09:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5622710E65B;
	Wed,  1 Nov 2023 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30510E62E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 05:51:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A15348n002105; Wed, 1 Nov 2023 05:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GfLm8bZeUAykuu82ydWVftHzqeTVKiAcmOTSLXWPDDg=;
 b=cRR3VSN38PGsxg2BMtm6tFVOgb21bCnZBy8xFHAjvxRtn0Q6TYG3Q9qBPrC5cTiK2G4s
 df6hXirXQVo5ucpBl77nfpGP5ZHFNezACSVaYsu8ogYu39KAN8DxIvPW0L8opzUq15eO
 NcdGFypTD3VdthAB1C+nNBUROSdI8E2IVQQvy8yfvKhj+iGzMibayBZXhChgxcDVUJwG
 iuJSr0IbzZYtnSePx3WPWNP/McWFODjyzjAfy78dDDWrfctxsRU1r6qXYl3UIBSYitA2
 pCJWGCpbbdTZekZwcbT9LfSNqwr0jyKVaFcAIT5+Ru578xLdjqbwvHqvSNP0A+kkpPYi Pw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u3a5eh064-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Nov 2023 05:50:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A15ouLW032477
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Nov 2023 05:50:56 GMT
Received: from [10.214.67.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 31 Oct
 2023 22:50:49 -0700
Message-ID: <a83b00c4-a33a-4687-b024-173c6c5a66a0@quicinc.com>
Date: Wed, 1 Nov 2023 11:20:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <d4d471e7-64cf-42bf-a061-82934c904691@quicinc.com>
 <2c3ad77806df3ef23cb69336f2049821529e337b.camel@mediatek.com>
From: Jaskaran Singh <quic_jasksing@quicinc.com>
In-Reply-To: <2c3ad77806df3ef23cb69336f2049821529e337b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mvhv334wkL28YRcs-bX1bkeddaiQ8P7B
X-Proofpoint-ORIG-GUID: mvhv334wkL28YRcs-bX1bkeddaiQ8P7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_03,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311010050
X-Mailman-Approved-At: Wed, 01 Nov 2023 08:14:02 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/20/2023 3:20 PM, Yong Wu (吴勇) wrote:
> On Thu, 2023-10-19 at 10:16 +0530, Vijayanand Jitta wrote:
>>  	 
>> Instead of having a vendor specific binding for cma area, How about
>> retrieving
>>
> https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/
>>  ?
>> dma_heap_add_cma can just associate cma region and create a heap. So,
>> we can reuse cma heap
>> code for allocation instead of replicating that code here.
>>
> 
> Thanks for the reference. I guess we can't use it. There are two
> reasons:
>   
> a) The secure heap driver is a pure software driver and we have no
> device for it, therefore we cannot call dma_heap_add_cma.
>   

Hi Yong,

We're considering using struct cma as the function argument to
dma_heap_add_cma() rather than struct device. Would this help
resolve the problem of usage with dma_heap_add_cma()?

> b) The CMA area here is dynamic for SVP. Normally this CMA can be used
> in the kernel. In the SVP case we use cma_alloc to get it and pass the
> entire CMA physical start address and size into TEE to protect the CMA
> region. The original CMA heap cannot help with the TEE part.
>

Referring the conversation at
https://lore.kernel.org/lkml/7a2995de23c24ef22c071c6976c02b97e9b50126.camel@mediatek.com/;

since we're considering abstracting secure mem ops, would it make sense
to use the default CMA heap ops (cma_heap_ops), allocate buffers from it
and secure each allocated buffer?

Thanks,
Jaskaran.

> Thanks.
> 
>> Thanks,
>> Vijay
>>
>>
>>
