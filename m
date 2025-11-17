Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E07C63D21
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B6010E3A8;
	Mon, 17 Nov 2025 11:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1VAzl7w";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ens2nCQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506BF10E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:31:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHAq26a3921137
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IL9ICm8hZ3xUtimZEfJaIzqGZWF9qcyr0Tqgp1AC6Ok=; b=m1VAzl7wPekFmusC
 8tv5pis3TbVr/olThBtVQb6wodqYM3BqGw8QEd38xAxa+V+wi4jN3fWDOfmKb6Xr
 DSAhgIyQ7HyoBmmBTpPb1emjnHkTTpKZzmjUXhvFRUqtzTCZJBVXpz3ggKcPcDDO
 Wv6pYUYAXDkibV2uCgL6jAh6Nmonf86eS1OjD33uGUgyouqrfZalIjfN6YueELcm
 fRIwFWa8GnFLNYJGUCkvW1feu8GI1zdklauqNBMnkTJcf8Lyxf2CPWazzRy3eTUB
 RM0ppgTN+wZ4najtddc/BONkfOaqWEiTrCDROlHoFpfOZBHuxp3NItWesAKZsjfd
 NnqZpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay839c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:31:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8800460ca8dso18416696d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 03:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763379091; x=1763983891;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IL9ICm8hZ3xUtimZEfJaIzqGZWF9qcyr0Tqgp1AC6Ok=;
 b=Ens2nCQwhRCJo7ehbBzpJ8wRXPTFs/8Yn8c9a9HH51Ds+aF9kJ+O10pFkYfoOYM784
 e15FFwg4aendrbeEh8aGo8SyUR/wjJr32OhepIc12nZPSK1IyuuD0zKj3fLrXVzr+G6J
 EAbJTcI2Fd9Ls79eHT2PjRaSctQO2y6WNMENq1HpWNDRmO0hKv91P6rjP6UtOSzKs/ND
 ugEfZ1W65PMpuUjMR5pcEOg2SICADxgud38Zc59qm1bHeYU5nD0XtJH6lbC5zfMsidSk
 FgfHk/Rt17sfTb09+xpxxVVLPh3qGfxJUHwPtqb0s8Uj8uS8uFRPsOHw0wZjSH2PfMnD
 Jkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763379091; x=1763983891;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IL9ICm8hZ3xUtimZEfJaIzqGZWF9qcyr0Tqgp1AC6Ok=;
 b=jdHy2mp5G+uiZOTtU5dkOardCWUfLGf30vvfhViDOaUPCy+U/T0S+jb/k7EJrHOJyx
 Ipif3TNfEjMKz6lnZOllqQkrru+wBt1QT6ni8LluhQkA1145ahTMDosk7W8Ix3Ey31V9
 JMVbFs+xFwigdQLnZzkP0pD5lToPzSW0piim1biXHrEk+XuAHaOZ3pa2WG7pUWiNJSn3
 1fRjfhK9IxoJ9K0RpKAPahEFCwf/OGmJwfyohIUmRMeYDgZ8vc2zBf01XV8orvleP9eJ
 cDCFmboTEes5sC/aCvV08aEy6nzN/AkbQLjXFb2VIKZNaLc1P3co89szFgOPIKP93Oyu
 uqlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfQzGLfmYEfRo2nJ8oM1MXpIMbl0ao0/Af3JwEURIRJaKbzJRb8AVZLAxST9K3Agd5YBtUD7I/YUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJnTeUIub4e5/iyaqzRW/nK/hM2A5MagbL8R61wNHIkKqhvlnR
 7EqiSGsSDgAFY86NpqDLYEaLt/uywbbF2sAzQuLt6e+Paw5cyQ7ay7HUu0ySTdDSXCjq54SQkV7
 7QmBuRW02JvBN8apUH2507YktfIt35WfD81QqRw7vvPGdiJBbXL9h/EI13sKK2dez0t1DHJc=
X-Gm-Gg: ASbGnctk/Y5VQIq59K3Hpi1/Pr6x1PCXHY9mny/sYdmDfJlDSRvgpPATVsjWscbRM2E
 +txsK96tetyD+FSAU+j+jRl+ncRC0txs7EdroeBSDIT9n8gvOgGfT3r1HNz/yG/CWjEpcisxiox
 NKjqUy/X0mZavl4hqYGjKLSFG/+761ubUL006Le+/xmep75zaEXQxx7kFRY3fNeQtKyiH3VxntA
 w7ft7ab5ebzDcfkZuohZ6Jm3H75U4pBWnJj48EM5cFIAl3ucAgAAXqD2kzzHQzHRaNgSpx+6XmS
 HOPhuBiVYd3/gnsrlVthVwP/u/hah9uy/wBGJ3o6t/wFBU/n+ayjYgUxrMupOnDN2JuGHhogFga
 N1BIL97alcbRBiptxwPt4uv1aI7DZBTmR2xKx0Dmm4+Bcaj4Z4aKflfEd
X-Received: by 2002:a05:622a:409:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4edf36eec92mr108556241cf.10.1763379091651; 
 Mon, 17 Nov 2025 03:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLMD6VRAnOzPNz4g40Qvt8vPutO31Vosum3GYhdislSLFcTDayUceesttS6gR4/wv51rIwlg==
X-Received: by 2002:a05:622a:409:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4edf36eec92mr108555921cf.10.1763379091028; 
 Mon, 17 Nov 2025 03:31:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b1db6sm10005006a12.26.2025.11.17.03.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 03:31:28 -0800 (PST)
Message-ID: <8adbf95a-4ca1-418c-bac5-9a5e01116164@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, kpallavi@qti.qualcomm.com,
 srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
 <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
 <lxa5lomfvjf6e4jxt7c67cj7q6blflvc3lpmclybag3cumxtxb@xnte42junlmc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lxa5lomfvjf6e4jxt7c67cj7q6blflvc3lpmclybag3cumxtxb@xnte42junlmc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b0794 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=O8XbOLt1H2ra-FkJ7roA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: I9xSDWRMjAv6leHfd1LVjwBFbCMUv8SI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5NyBTYWx0ZWRfX5yXLKb/Mcgi9
 Q4/SoFs9lZKua5+Nm99LVy0Kpz2YTjGPXG0M64w2Bdk95qcWY5PL/afGUI9vfcPIj6J/+8r6CKt
 GPzJ93aIkzz18i9r+23C1OehVfydbGAwGY2bfGhoUHZ3bg+4wP0i+8IkRfK9urBCP3UHnmDLc8T
 LytSww5gK3Ud74dynJwmEG89xz/+Egj2X4Se9zHqwyp8MZ8QwOzhs4LADJEM7xXYASaaVEnZu2m
 XhVVvB3ZNTHyOf+wVUSqfggz+b++/McCPe8erfqx2gc67zul4wgTzYFXouLT0yza7ultsI2B+C/
 pJzQRdqpo8ZyJzpqLSQDSFH11hjDG94hIAh3F7CWh6mR437fjO7BY3kdK5erI0P8ZmcRyMwu17t
 tCydCcC+6m1VNtgP1jM1AioNhKyN8A==
X-Proofpoint-ORIG-GUID: I9xSDWRMjAv6leHfd1LVjwBFbCMUv8SI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170097
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

On 11/17/25 12:22 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 17, 2025 at 12:37:33PM +0530, Kumari Pallavi wrote:
>>
>>
>> On 11/14/2025 9:14 PM, Bjorn Andersson wrote:
>>> On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
>>>> Update all references of buf->phys and map->phys to buf->dma_addr and
>>>> map->dma_addr to accurately represent that these fields store DMA
>>>> addresses, not physical addresses. This change improves code clarity
>>>> and aligns with kernel conventions for dma_addr_t usage.
>>>>
>>>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>>>> ---
>>>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>>>>   1 file changed, 40 insertions(+), 36 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index ee652ef01534..d6a7960fe716 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -106,7 +106,7 @@
>>>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>>   struct fastrpc_phy_page {
>>>> -	u64 addr;		/* physical address */
>>>> +	u64 addr;		/* physical or dma address */
>>>>   	u64 size;		/* size of contiguous region */
>>>>   };
>>>> @@ -171,7 +171,7 @@ struct fastrpc_msg {
>>>>   	u64 ctx;		/* invoke caller context */
>>>>   	u32 handle;	/* handle to invoke */
>>>>   	u32 sc;		/* scalars structure describing the data */
>>>> -	u64 addr;		/* physical address */
>>>> +	u64 addr;		/* physical or dma address */
>>>
>>> Can you go all the way and make the type dma_addr_t? That way you don't
>>> need to typecast the dma_alloc_coherent() and dma_free_coherent().
>>>
>>> I believe it might complicate the places where you do math on it, but
>>> that is a good thing, as it highlights those places where you do
>>> something unexpected.
>>>
>>
>> While this not strictly limited to holding a dma_addr_t.
>> Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is
>> set, S2 mapping expects a physical address to be passed to the
>> qcom_scm_assign_mem() API.
>> reference-
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b
>>
>> If you suggest, I can define it as dma_addr_t and perform typecasting to u64
>> wherever required.
> 
> You don't need to typecase dma_addr_t when passing u64.

*on arm anyway

Konrad
