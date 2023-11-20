Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A87C7F0D65
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025F710E15C;
	Mon, 20 Nov 2023 08:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF8610E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:20:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AK7Lvn3003771; Mon, 20 Nov 2023 08:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gba2Tcl2eMbmK/kLsFECV0armcjkhrFttLQIW9wsuXo=;
 b=SEjUIH9AP531QvS27jtrUrKOEiN62KB4ujjYrcXzL+gsPHPbnUmXbp/g+4BsxBgP1VJO
 /r5pOXHdHPqxM5z4FvPh0AqPjZlsZpr7B+h9OxUJxZTMM1A6GGsu+pQSHw6hgk2bZ8ZU
 51UZSv24m4pkbOzQRtX7cnApm42JqdqIQf9n7ZVh8Loa981roaNY8oCnxhksNUGMZomZ
 rc6UrsgjN+1jw6k6qFNVknyQnAnzPVIb4cVovjOki/vwOcmTSJxqfsGwyUk7mOiCHdJM
 xQ+E1TDFXE/IHqFUurcG/Lti3T4bqcffPHY8mnCEf6Zxgl85rnpLQz21JKBwCKy9+rDO lw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug30mg41t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Nov 2023 08:20:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AK8Kasq029827
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Nov 2023 08:20:36 GMT
Received: from [10.216.59.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 00:20:27 -0800
Message-ID: <5ecab46b-3808-4e89-a5ac-3c13e0c0a216@quicinc.com>
Date: Mon, 20 Nov 2023 13:50:23 +0530
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
 <a83b00c4-a33a-4687-b024-173c6c5a66a0@quicinc.com>
 <8666e39c6b59322af6a9637121ed22f291830c46.camel@mediatek.com>
From: Jaskaran Singh <quic_jasksing@quicinc.com>
In-Reply-To: <8666e39c6b59322af6a9637121ed22f291830c46.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NFg0IuWqxZGtZ8GVXpsSQaeo7n2SJGkl
X-Proofpoint-ORIG-GUID: NFg0IuWqxZGtZ8GVXpsSQaeo7n2SJGkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_06,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200054
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



On 11/6/2023 11:26 AM, Yong Wu (吴勇) wrote:
> On Wed, 2023-11-01 at 11:20 +0530, Jaskaran Singh wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 10/20/2023 3:20 PM, Yong Wu (吴勇) wrote:
>>> On Thu, 2023-10-19 at 10:16 +0530, Vijayanand Jitta wrote:
>>>>   
>>>> Instead of having a vendor specific binding for cma area, How
>> about
>>>> retrieving
>>>>
>>>
>> https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/
>>>>  ?
>>>> dma_heap_add_cma can just associate cma region and create a heap.
>> So,
>>>> we can reuse cma heap
>>>> code for allocation instead of replicating that code here.
>>>>
>>>
>>> Thanks for the reference. I guess we can't use it. There are two
>>> reasons:
>>>   
>>> a) The secure heap driver is a pure software driver and we have no
>>> device for it, therefore we cannot call dma_heap_add_cma.
>>>   
>>
>> Hi Yong,
>>
>> We're considering using struct cma as the function argument to
>> dma_heap_add_cma() rather than struct device. Would this help
>> resolve the problem of usage with dma_heap_add_cma()?
> 
> Yes. If we use "struct cma", I guess it works.
>

Great; I've posted a v2[1] for the API incorporating this change.

Thanks,
Jaskaran.

[1]
https://lore.kernel.org/lkml/20231117100337.5215-1-quic_jasksing@quicinc.com/
