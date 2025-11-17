Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD2C63111
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5334410E30E;
	Mon, 17 Nov 2025 09:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsqwPPKt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVQkZgsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3224010E314
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:12:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH4o50V3189685
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TS1l4z4FCSnPq1fx1zTnWoNNXIfyztzlqt9YbRe5R/g=; b=HsqwPPKtmRF/VDbk
 eZiHDz8paG6eBM4SV8dOMNbMydwYt71sCGCC/jk9BVQpLx0mphHSyinmKV3VHSjL
 Fu89u9fM2YB4pE9l+NUPabD4f/y0A5iiuk9Qqohbus+D1Xm0RWeuoXGIem8Z0Q2l
 vR0MiOX5CO3JCeT8NybMYM0BLoMkmOCLmg0sQXPJ6I7XbBogh0DnB7egXOGu//Z5
 X9PGEa1tdcib4jKlJhDwOOoHYrS3vYLs1izwsAYEPLJEqYkFwaPZ7dOKQRHKncFo
 rY5KBCoAkzMXP2D+AuejGjAelVPHNjIhK8V23zXQeu3JLawLbOK5fzo34EMSV+Pe
 Yw7cnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkmc2qu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:12:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7bf5cdef41dso1499685b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 01:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763370751; x=1763975551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TS1l4z4FCSnPq1fx1zTnWoNNXIfyztzlqt9YbRe5R/g=;
 b=cVQkZgsQ5b1Me/4O8DJvg9WKSJOS3ywKYduGdvJkIJZ2q3eWoWVOsF7fVNyQ2sePXI
 oZoHUB9LqUPR64onHqbgbNX2lIsI6Ocy18EazaJUcfZ8J2HAiVwWgObE/LmrkmfY04Qz
 FO394X31tz3twshIKWcBXVEx9qS/qSz7BXr+gj/NWSKvYN6iwMvfYbIuZkhlVyHiuPx9
 SKLO1gT4cH9fiHQ0VBku2bsFHwlhSwm3+cEUV0SnAPScfIEy6jQYewqEL/SYVzOPTORr
 dRfwgz8OolNltqFe8MZIc8plvhb1+Jwbw9hp01pXv5q6ZzzpGjevhlic/BdteKTqTEgq
 M84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370751; x=1763975551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TS1l4z4FCSnPq1fx1zTnWoNNXIfyztzlqt9YbRe5R/g=;
 b=bY+P7y5wgOoG0LWcJ1dqpC2O3jiuSn9AY4Vu6fo+Inci78keSZg2dmJnfiV409TkMT
 NLzs7aQ/3QQOZpfV/sQG907RZn6lczRvY7kLYj95I4N7HZp5JGEDHutTovxvYijuaG9d
 8z/ovhLCW7G0/R+4Rv5Xg2K6QQZVX3Xf9RQ5JPtGBUXRW4XlOBD8VofaRvGFzYVdWbmS
 lh/s73uVCv5JHAlmhc7YJct2SjHy9Dr1VBL6L9exRFOL+XvczSBlceS5K135tFIqxzCQ
 6xUqNiY/V8ijgHc4MKoWZ9rlNeTHM+FOrN59zjWZ3bjJBNiUhQhnp4Up202kBR5Gh+pT
 wKeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9qsCpvBG/Hk87qbCtNR+Gv1PL3ZTC4t9z63+s0sZxSn7/FL5d7RJFhg/n8yPk9QBCiZg6zVy+7DY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPrfF8Y5/Z7WZVahXyUqyliPTv5KFPA5jwswkkqZ1UXfSh5oeB
 wJyONtctwfeBt8uecaknYZYj66HKY1Wk/fDntfC3Xs+QpEmQfJ+PoY8JwQndVDC3RDkUIE+dEBh
 3YFA92MrMxndBkypmATPvUSpKrkPjWpWq6g/eFHW0AvSFhs/CQcPIKS8zs+t9vx/eoFvrRkY=
X-Gm-Gg: ASbGncsYEI2NJUqgjduiKgZa663K9zNIfOihbWPG6jtU53fSwFEvVcTC3c/45dAohSA
 /ERSrCb91jxdIOzco6iY0KwWYiftwk1cRXQBYQ42tcA4AbsJZEr1xCA9UqUtdE3vsF8lj2FV8Kr
 LUuhMuFKkeu57UuagvWnrPBh10WO0uMTCA3b4HBWBWwrEXXlcVoTc98n9XRMCHX5g8Pd6W87q8T
 ULyIEnOpudD6CY+kPegIhljz7dx3UQNnVNw5TyqSbqBG0jNY8tI5Rgwp09M0xtMOM3C8yRb0/gN
 oOec32BTVNzGkMtveb/LcIxFNqKp7RVaTE6nX3JLpKE4nCgOaq5ws7Sc1tYnzQiAV+sYIgliDUm
 yy339upRuRkzuB48szEpOWn9Ay4fn2l0=
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id
 d2e1a72fcca58-7ba3ca62f1cmr15229559b3a.31.1763370751022; 
 Mon, 17 Nov 2025 01:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPhAbe67a4qq0g0SmTJWSl/SMH4NtB4XKNSGQjREqxyGkcUL/E/ZWvL7YwRbphuALEA6/cXw==
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id
 d2e1a72fcca58-7ba3ca62f1cmr15229504b3a.31.1763370750432; 
 Mon, 17 Nov 2025 01:12:30 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b92782d39bsm12517242b3a.63.2025.11.17.01.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:12:29 -0800 (PST)
Message-ID: <2404a7a5-f4ac-4e62-b4b7-df0494d71150@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:42:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] misc: fastrpc: Update dma_bits for CDSP support on
 Kaanapali SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-5-kumari.pallavi@oss.qualcomm.com>
 <3gld6djjzfwu6rj47tz6gdwdpmh3hjexce5y6crqjus7ourgxf@puxrcpvijitl>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <3gld6djjzfwu6rj47tz6gdwdpmh3hjexce5y6crqjus7ourgxf@puxrcpvijitl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MCqS3MHnUySZrLZSS8MCGQCEB-Q0HtAR
X-Authority-Analysis: v=2.4 cv=N6ok1m9B c=1 sm=1 tr=0 ts=691ae700 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IvGWEb95ivA0J32o5h0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NyBTYWx0ZWRfX08Q3JntANXgX
 V7Ns2e6XG4Rh6KD84xb3QZQA8G+vNRwlaiMSsTCJA47XtpozO8nFPKmkzXEY9IEs6ObNZ9Hw4Wz
 RhVY8x9TQnUbyy4y/vBeH5/GvLvgRedDUg/PZvCV0GSkXvUpp4CzbYF6KG9QfmyT3dOGIZ7M46c
 wIx2oOvVLj+SvHya/gyBmI2lYMB4Q0OkoAqxBURdPl3pr28AgE7d9quH9Iqj4kqAYf1xAazSGPR
 GmAWqdvl14PFhYZJPJFl9Bp0sD+9TEzYGvPzNhCwWljCWvQ5U5rCE+LpGYRMzDTU0iS4q1iKfbQ
 /XL6A/K0Xml8uxxUscRVuWq2PaEyL9BKjh9XzrPZMo0nIQ3xQdI+PIk3B6V74vo7AJ0nEiRzft0
 l4WUq3KNP4ivM1wS32jpdfydFQYtng==
X-Proofpoint-GUID: MCqS3MHnUySZrLZSS8MCGQCEB-Q0HtAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170077
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



On 11/14/2025 9:30 PM, Bjorn Andersson wrote:
> On Fri, Nov 14, 2025 at 02:11:42PM +0530, Kumari Pallavi wrote:
>> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
>> both Q6 and user DMA (uDMA) access. This is being upgraded to
>> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
>> Kaanapali SoC, which expands the DMA addressable range.
>> Update DMA bits configuration in the driver to support CDSP on
>> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
>> it to 34-bit based on CDSP and OF matching on the fastrpc node.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index bcf3c7f8d3e9..2eb8d37cd9b4 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -267,6 +267,8 @@ struct fastrpc_session_ctx {
>>   
>>   struct fastrpc_soc_data {
>>   	u32 sid_pos;
>> +	u32 cdsp_dma_bits;
>> +	u32 dsp_default_dma_bits;
>>   };
>>   
>>   struct fastrpc_channel_ctx {
>> @@ -2186,6 +2188,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	int i, sessions = 0;
>>   	unsigned long flags;
>>   	int rc;
>> +	u32 dma_bits;
>>   
>>   	cctx = dev_get_drvdata(dev->parent);
>>   	if (!cctx)
>> @@ -2199,12 +2202,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		spin_unlock_irqrestore(&cctx->lock, flags);
>>   		return -ENOSPC;
>>   	}
>> +	dma_bits = cctx->soc_data->dsp_default_dma_bits;
>>   	sess = &cctx->session[cctx->sesscount++];
>>   	sess->used = false;
>>   	sess->valid = true;
>>   	sess->dev = dev;
>>   	dev_set_drvdata(dev, sess);
>>   
>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>> +		dma_bits = cctx->soc_data->cdsp_dma_bits;
>> +
>>   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>   
>> @@ -2219,9 +2226,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
>> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>>   	if (rc) {
>> -		dev_err(dev, "32-bit DMA enable failed\n");
>> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>>   		return rc;
>>   	}
>>   
>> @@ -2308,10 +2315,14 @@ static int fastrpc_get_domain_id(const char *domain)
>>   
>>   static const struct fastrpc_soc_data kaanapali_soc_data = {
>>   	.sid_pos = 56,
>> +	.cdsp_dma_bits = 34,
>> +	.dsp_default_dma_bits = 32,
>>   };
>>   
>>   static const struct fastrpc_soc_data default_soc_data = {
>>   	.sid_pos = 32,
>> +	.cdsp_dma_bits = 32,
>> +	.dsp_default_dma_bits = 32,
> 
> So, "dsp_default_dma_bits" specified "what is the dma_mask for the
> non-CDSP fastrpc instances"? I don't find "dsp_default" to naturally
> mean "not the cdsp".
> 
> 
> Wouldn't it be better to introduce two different compatibles, one being
> the "qcom,kaanapali-fastrpc" and one being the
> "qcom,kaanapali-cdsp-fastrpc" and then use that to select things here?
> 

Thank you for the suggestion. In this case, sid_pos is common across all
DSP domains on kaanapali Soc. Splitting into two compatibles would lead 
to duplication of these shared property in the DT schema and driver logic.
The only difference here is the DMA address width for CDSP (34-bit) 
versus other DSPs (32-bit).

To address the concern about naming, I can provide:

dma_bits_cdsp → clearly indicates this applies to the CDSP domain.
dma_bits_non_cdsp (or dma_bits_other_dsp) → for ADSP and other DSP domains.
Please let me know if this aligns with your suggestion ?

> 
> PS. You store "dma_bits" just for the sake of turning it into a
> dma_mask, just store the DMA_BIT_MASK() directly here instead.
> 

The current approach of assigning a value to cdsp_dma_mask allows for 
adaptable logging behavior, making it easier to trace.


> Regards,
> Bjorn
> 
>>   };
>>   
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>> -- 
>> 2.34.1
>>
>>

Thanks,
Pallavi
