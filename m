Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C08BDE12F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C710E770;
	Wed, 15 Oct 2025 10:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gw+DwNSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EC410E770
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:47:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s79P002553
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AZJrvGptOrqMXPxOcK2AJ2pnSX3xUzKaHvxbZnXr0gE=; b=gw+DwNSxlGiCxlmC
 Ex0JbeWJ3ZjFv2iPiIcE2ibawqIMmixh58og6wTMvs5xC5TLkQH4UrhE2f/WwWZp
 u4Bj+r5fKHw+9BMXymEBao88hVRV9YGemE3bA39QSgAiXM87s2yCA1KOEb1plOpD
 RRv0Q3a0w3Z7MqrLWAWXFHhTuUk9lGcYEjeDCqLCDJDxH8516jRxkJI+p6AZQYnf
 OIIspFfdbP8S7g3PJmTfZZBK+1Y8ko5JFR9mnHl5yZgFGVVZnsDZirAOPO0RAZ7v
 4svUtHd0ihI0m91n7ZTKi1pCSBczNZk4ksPn0iO2GIcrpU/dYUlurPRflnn+8KnM
 +/tbIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd945x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:47:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2ea9366aso8880899b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 03:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760525267; x=1761130067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZJrvGptOrqMXPxOcK2AJ2pnSX3xUzKaHvxbZnXr0gE=;
 b=iJNl6UnSQXwGqSI6GKThvG/YWf8U8/d5+84pDuVwGuSxjC94AABEOq7UCBxcHUYS3T
 dK9r83m2J7jwOveZcUyNUPB0USR15zlZtUHhUFgjz1Xfj4gqKPbLYmw/9YGb/Jtjc2ec
 WPaS7ZUarnJe1gZQ17zj+ReXyT6PZYUhUjUJ9F+gNbq+MKk6FL5rVkgwwDNOp/I8+Pya
 j+njAB2cpaK7tq6zRNEUHN3NLaZf6q07A8x0N4Hw41aD2Axj62CCucqQG1ztWP1/dHDN
 PgcK3kr8OhHUhcdRqPf3x9dA0E0jc3Kgm2w5PIrwyOgfvGEcn2S3M7RTcYJhzRb9IKcf
 IBLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYlqAqUcP9O59RcdqNOps78LQMi+6oiT2zsD9QhuuQJFq/ufpeK+9aaXzC9XwrabAgSzM3Mn42uHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuQAxPq04sOlrOOyyB87onE5fzol9+2phgxbmlEps2QuxzQ/K9
 TDN4e8iKULXi2qQr7qcqUwDlCHiy8aKfIor1BMHaDdGO1VFucce6Q0f29vexmPqsruxm3IlKVGa
 jAnzDNoc9FFMiwAGT+vDzrpsN3fEbUiI8HSo+onT7xV6030vTiDsaf76QJmCA6I4M+uNG0H8=
X-Gm-Gg: ASbGncsvkYeTJMAvi3lmDYPjGIfX/6L7Jka9vRTZvuc+wsUyBD/cCntQb3K+7Wjtgr/
 yS7xHsjWPjJbCt2R6FmrqM8P/P1oo7NFOsZbau8dcEcNQzUTGm18NhGw0ytYozhDuBfPHnyt4zU
 JVPn+9usT1wBkf2tpIkGwjTmv8XfggTgz2aTEzmK2pFaP5FOFlDMEaj7cx7fze/rFfXicXkHwPg
 RE3YjE6q07Txu+eIEqbF4cX30Mwpm04WRLcVe9+29G63KJW+eJySGhsFYFEZIhg26Yj9YtTBS1p
 LNMeKItQyHZQpdNz9Kw66pHZeJl+JSsfGK9R4DOuYgxevotLECsLTxbRdNaUrxbScD65VY16
X-Received: by 2002:a05:6a20:6a06:b0:24c:dd96:54f2 with SMTP id
 adf61e73a8af0-32da81393f5mr39849149637.1.1760525267446; 
 Wed, 15 Oct 2025 03:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd6TU44teoR5OvLjOqJ/FtQbppc7nt+u/aqL5WddhJGIWMv34ctNW6A7b1YLMaWOrgl3CC+A==
X-Received: by 2002:a05:6a20:6a06:b0:24c:dd96:54f2 with SMTP id
 adf61e73a8af0-32da81393f5mr39849118637.1.1760525266962; 
 Wed, 15 Oct 2025 03:47:46 -0700 (PDT)
Received: from [10.206.107.23] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678de09cb3sm15634186a12.18.2025.10.15.03.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 03:47:46 -0700 (PDT)
Message-ID: <0000ffec-c17d-40a4-950b-5cafcbbad5ac@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
To: Srinivas Kandagatla <srini@kernel.org>, kpallavi@qti.qualcomm.com,
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
 <2a6319e5-15e5-4cb7-a2f3-7521383fc30e@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <2a6319e5-15e5-4cb7-a2f3-7521383fc30e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ojO07GH0E1jI-OqQ2JKzO4maAE2o48Nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXx7VxSHR+PlcV
 Vp40hrmWgfA5Z8WQbdPRPTamnngtPlueLGtqkIGtI1z9ecgWBqxogHjfGaCrNsaS1jZEffnKkg4
 kqTdRuAiH+2dmh7ZClRJzw+D6S0aOoI2h/XIyyi6//rR6wZPDbQohcvksyobRAyN6nBnk2KTDp2
 GRh9eIytkYzSzePj/D6jwh3PT/alvZozESU0XZr5JKcnAXdPK8AOsGe2Z8X7Tg/pw99aBnLVP/f
 mWyFRb56msoB3+YkH7IR9wVqMoAaLAbgdmmeIR4OpuVBuhqOchJNUAO0Qy+Wcm95bdVUOBOjtc6
 VtJzRPKyQ/EKjmj2O5oGMxmwkB2f+KNI7CZgAM6KLCRp0A2fSmfgO4QVmJpvzbQPTNgkbiHVzj0
 T+VPN0qfgSLg1oTxVyMRvSSOE+uBOA==
X-Proofpoint-GUID: ojO07GH0E1jI-OqQ2JKzO4maAE2o48Nc
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef7bd4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=66apGkFR6lJs1WKMTdsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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



On 10/15/2025 2:55 PM, Srinivas Kandagatla wrote:
> 
> 
> On 10/15/25 5:57 AM, Kumari Pallavi wrote:
>> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
>> both Q6 and user DMA (uDMA) access. This is being upgraded to
>> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
>> Kaanapali SoC, which expands the DMA addressable range.
>> Update DMA mask configuration in the driver to support CDSP on
>> Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
>> it to 34-bit based on CDSP and SoC-specific compatible string.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 1a5d620b23f2..f2e5e53e9067 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -267,6 +267,7 @@ struct fastrpc_session_ctx {
>>   
>>   struct fastrpc_soc_data {
>>   	u32 sid_pos;
>> +	u32 cdsp_dma_mask;
> How about making this an actual dmamask ex:
> 
> 	u64 cdsp_dma_mask == DMA_BIT_MASK(64),
> 	u64 dma_mask == DMA_BIT_MASK(32),
> 
> This will give more clear picture of what is going on,
> 

The current approach of assigning a value to cdsp_dma_mask allows for 
adaptable logging behavior, making it easier to trace.

> BTW, these values are not set in the patch for some reason for both
> default and soc specific soc data>

Ack.

>>   struct fastrpc_channel_ctx {
>> @@ -2178,6 +2179,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	int i, sessions = 0;
>>   	unsigned long flags;
>>   	int rc;
>> +	u32 dma_mask = 32;this should come from default soc_data, do not hardcode this here.
> 	u64 dma_mask = default_soc_data->dma_mask;>

Ack.

>>   	cctx = dev_get_drvdata(dev->parent);
>>   	if (!cctx)
>> @@ -2197,6 +2199,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	sess->dev = dev;
>>   	dev_set_drvdata(dev, sess);> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>> +		dma_mask = cctx->soc_data->cdsp_dma_mask;
>> +
> 
>>   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>   
>> @@ -2211,9 +2216,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
>> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_mask));
>>   	if (rc) {
>> -		dev_err(dev, "32-bit DMA enable failed\n");
>> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_mask);
>>   		return rc;
>>   	}
>>   
> 

