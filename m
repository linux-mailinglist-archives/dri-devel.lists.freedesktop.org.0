Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1301C802FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1229E10E21C;
	Mon, 24 Nov 2025 11:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWFwesto";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9/PTKGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C38210E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:21:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AO85d8P1684519
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6bin+0L7CF3HaoV3kbIK2uac7NeAV+pn+GH54MNEIYo=; b=PWFwestoL8SWAKT1
 rAFs9BYkwFp860gZDhbKAfI9euRnicAXIPwnIoL3TJOqMWwjJFsiiDKGB2PCejIp
 7KjeAjYTEOdvklRuQ0EHB1fchMMO+vIviL7ZPCn81ygM+Gy0gbpl282KgDKB8fHb
 IRHgqiAHHMNaL/V82+JNsJ95bfBfD06mBlNM0gbEf9AGYkD9bL95IlpVWViI7ICi
 EbXybcqqt2tanky/RSZIH5nH417P4z/snSk6c6ps2RnjMRImFLTKHIkF9Z898Ex1
 GIHSjzgBR+GriJADVI6hkFDorj0vxmsJo/3lvpYpCz/cGzavOwSUaEvXQRFhx/cN
 XYjiqQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama099sqt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:21:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b6b194cf71so8603136b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 03:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763983307; x=1764588107;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6bin+0L7CF3HaoV3kbIK2uac7NeAV+pn+GH54MNEIYo=;
 b=B9/PTKGdsBVmaiNfqZB0gzxNhPq0j9CEzCz+INFWeUH/doc4dwMcqWzgbQU/NUxaoH
 koCXuS3JKCwke6fjdKHZ3lJPIA/0Ztriwaxng2+sLvcWPgTu+YDEK74nDsNuWOKvQWn+
 WJeby9dcuonAiL10L37hL05HtXvQj+XLKbI1YdUwEugLP/6iysoBBjQ+LI5dsgOLkstV
 NCHoaaGkqqaUSnwwjhIm5uSFZXlDcgJnEwAh9BLrPqr9MYRAzpRYxuU6LmC3uk0oIy7L
 XM2inv6dS86or62YQmQCvyFemOKTy1TyGa7UI5GVU5OWEvxO2f2Zxyeo95lfIxYYTVgF
 UGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763983307; x=1764588107;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6bin+0L7CF3HaoV3kbIK2uac7NeAV+pn+GH54MNEIYo=;
 b=qqIJQkAb3sU1Z+o95yDs2Fpdy6fnn0bM6hyV7mjOD+11ToMR5JIo/RpDxI5zzyNVTj
 VPGNUh3Zq86zwz1nImFsj3/U24qq0zFlSRuCXqWPBku0gPZakTbPuvRXRgk/juCDX2pF
 RoN2JIFLz0knY4AFHhnAtPeyS3BdpE7ZQrVThXcgJlHMiiMzjS0o1THNLrHq/AVkRsln
 sr01QRvlzbGID4H+DBHOkpL+flScOSowDt7JwkCJtpXtarHRAvzWkLr24+6XDZr1w15Q
 Th0CwL2Q4GAoY5frUd1dxFT53pg5/9Uq+dlLoKlL7PULz7JNM2BhMniu1PhoXfocoxp4
 pkyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa2aq+IQJSRrDGHnkGUWSz1hlyg63PpsnFCoQ8YE8uz1x8UpRBFSDlSq7jX/si6ICbqpQaRAKr62w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywzu2uPc7ax0H9U9jrwB14tZV/+ujYlC8lwH0VbrnSf5mCHELmV
 dCaYHK0oaQ2EsG4Ni1/C4tRMuUGB/tffKNGsdYpdRlqAFM70J9CCmNmZsOkbIrD3QvqdDlvWa3c
 j717wGykSiKxRAGnIoBPKytKtAHd6tmjfy6LYdmvDl0bZXhysjAxfl4yQjT92llIbXlPGnhg=
X-Gm-Gg: ASbGncvS4Mx8uYdIuRmkzUYoRojSbc4P7QYOoL4TOM0Fh8WMWM8iOtNfWVe1vZsOmTe
 E5cOJYUfmk2kF8h0LygbTrdqWVGBLytU4EANcIGfkE3i1RdE/9/0VUI69YXwmbUwyFzvDg0bAld
 /A3//7B11iZm2eRwoEfZbJkuJx09hNkSpkXmq5dO9dDUzYmvoZ+r695ylzZkMrtVCCnscMbcohr
 oGNfFtir5s6cmNskpH+uKSSIg9oMixIo3iajkF8O9q3gGGYprHcuT1CxBA5ZP19WxdVO3UKg0cJ
 L8LONEVLaZFZeAp/iDVN+IyDsfKE2cDhHgSO1QIh4+cvS2P6jJLZyhKpY5p8SsKMC2rwdK4wBM7
 q9qzswUm2tpivaLLEvgw9EX6xz3gpoPPgbmNWKARHRA==
X-Received: by 2002:a05:6a00:92a0:b0:77f:2f7c:b709 with SMTP id
 d2e1a72fcca58-7c58c2ac436mr9823443b3a.5.1763983306680; 
 Mon, 24 Nov 2025 03:21:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI6FUzw8rJvZBGfiFMRkNdjCWWMjezt6fMoDb2nJqRnMg5JgkQGIvJ/5AFFb4vWoc6zexHRA==
X-Received: by 2002:a05:6a00:92a0:b0:77f:2f7c:b709 with SMTP id
 d2e1a72fcca58-7c58c2ac436mr9823419b3a.5.1763983306126; 
 Mon, 24 Nov 2025 03:21:46 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3ed379558sm14207510b3a.25.2025.11.24.03.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:21:45 -0800 (PST)
Message-ID: <e0d039e8-8f65-4e2e-9b73-74036dc0bb8d@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 16:51:38 +0530
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
 <2404a7a5-f4ac-4e62-b4b7-df0494d71150@oss.qualcomm.com>
 <3qgrwpi3vl3bumd2zxmjxvwgdewuwwsj3fymljkf2etjedleup@xsrnpuuv66ax>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <3qgrwpi3vl3bumd2zxmjxvwgdewuwwsj3fymljkf2etjedleup@xsrnpuuv66ax>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DDCXt8JWAfa3EHsy4vxxVoepFMS-iZlu
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=69243fcb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wEDb39IA6nWfzNvmODoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMSBTYWx0ZWRfXxMqgAVop3ndS
 PF0viogZKSfpnyJDU8yFUbgMxnVt8iaCIE/YSgC5LvIpIiSaxSnrHJLYdlqSv3WdataT63v7pFV
 eQ5KTFdCGPfLOkc74fht+6aPeLE4dGDcfFQSMeBxkPK6akO7WPtsLIKa8tCwq7Sj3EUPcc9bw6b
 bMxWDciewnaP+gXxRGECNRD+rl9Y7Aex5+NppNVkPw4CCEHqdcYJBWS1ah9NT/j3NEK4kC/aqjh
 b+C7X3tRLfFN7vi7nDAxKHSqUYqXkN/dIekyA0lyzfhTbH35IGUWeCZkWpbH1lCqgeRBMk1TPHp
 XYdBhTm19vn+hWHbWTfoy7G/mR+H+APStZfgZ8T8VW2xCbqk57QYBtHmDTsYhxr2pqylJBiGtN0
 xVrKjlyXEkzW8kYwu1DIEXOVBAvhWg==
X-Proofpoint-GUID: DDCXt8JWAfa3EHsy4vxxVoepFMS-iZlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240101
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



On 11/18/2025 10:27 PM, Bjorn Andersson wrote:
> On Mon, Nov 17, 2025 at 02:42:23PM +0530, Kumari Pallavi wrote:
>>
>>
>> On 11/14/2025 9:30 PM, Bjorn Andersson wrote:
>>> On Fri, Nov 14, 2025 at 02:11:42PM +0530, Kumari Pallavi wrote:
>>>> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
>>>> both Q6 and user DMA (uDMA) access. This is being upgraded to
>>>> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
>>>> Kaanapali SoC, which expands the DMA addressable range.
>>>> Update DMA bits configuration in the driver to support CDSP on
>>>> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
>>>> it to 34-bit based on CDSP and OF matching on the fastrpc node.
>>>>
>>>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 15 +++++++++++++--
>>>>    1 file changed, 13 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index bcf3c7f8d3e9..2eb8d37cd9b4 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -267,6 +267,8 @@ struct fastrpc_session_ctx {
>>>>    struct fastrpc_soc_data {
>>>>    	u32 sid_pos;
>>>> +	u32 cdsp_dma_bits;
>>>> +	u32 dsp_default_dma_bits;
>>>>    };
>>>>    struct fastrpc_channel_ctx {
>>>> @@ -2186,6 +2188,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>>>    	int i, sessions = 0;
>>>>    	unsigned long flags;
>>>>    	int rc;
>>>> +	u32 dma_bits;
>>>>    	cctx = dev_get_drvdata(dev->parent);
>>>>    	if (!cctx)
>>>> @@ -2199,12 +2202,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>>>    		spin_unlock_irqrestore(&cctx->lock, flags);
>>>>    		return -ENOSPC;
>>>>    	}
>>>> +	dma_bits = cctx->soc_data->dsp_default_dma_bits;
>>>>    	sess = &cctx->session[cctx->sesscount++];
>>>>    	sess->used = false;
>>>>    	sess->valid = true;
>>>>    	sess->dev = dev;
>>>>    	dev_set_drvdata(dev, sess);
>>>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>>>> +		dma_bits = cctx->soc_data->cdsp_dma_bits;
>>>> +
>>>>    	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>>>    		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>>> @@ -2219,9 +2226,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>>>    		}
>>>>    	}
>>>>    	spin_unlock_irqrestore(&cctx->lock, flags);
>>>> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
>>>> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>>>>    	if (rc) {
>>>> -		dev_err(dev, "32-bit DMA enable failed\n");
>>>> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>>>>    		return rc;
>>>>    	}
>>>> @@ -2308,10 +2315,14 @@ static int fastrpc_get_domain_id(const char *domain)
>>>>    static const struct fastrpc_soc_data kaanapali_soc_data = {
>>>>    	.sid_pos = 56,
>>>> +	.cdsp_dma_bits = 34,
>>>> +	.dsp_default_dma_bits = 32,
>>>>    };
>>>>    static const struct fastrpc_soc_data default_soc_data = {
>>>>    	.sid_pos = 32,
>>>> +	.cdsp_dma_bits = 32,
>>>> +	.dsp_default_dma_bits = 32,
>>>
>>> So, "dsp_default_dma_bits" specified "what is the dma_mask for the
>>> non-CDSP fastrpc instances"? I don't find "dsp_default" to naturally
>>> mean "not the cdsp".
>>>
>>>
>>> Wouldn't it be better to introduce two different compatibles, one being
>>> the "qcom,kaanapali-fastrpc" and one being the
>>> "qcom,kaanapali-cdsp-fastrpc" and then use that to select things here?
>>>
>>
>> Thank you for the suggestion. In this case, sid_pos is common across all
>> DSP domains on kaanapali Soc. Splitting into two compatibles would lead to
>> duplication of these shared property in the DT schema and driver logic.
>> The only difference here is the DMA address width for CDSP (34-bit) versus
>> other DSPs (32-bit).
>>
>> To address the concern about naming, I can provide:
>>
>> dma_bits_cdsp → clearly indicates this applies to the CDSP domain.
>> dma_bits_non_cdsp (or dma_bits_other_dsp) → for ADSP and other DSP domains.
>> Please let me know if this aligns with your suggestion ?
>>
> 
> This naming is much better.
> 
> I'm not entirely sure about the compatibility part though. The Kaanapali
> CSDP and Kaanapali ADSP doesn't have the same DMA address width, so are
> they then compatible/the same?
> 
> The fact that the two compatibles would refer to something with the same
> sid_pos isn't a concern to me. De-duplicating a single constant at the
> expense of more complicated logic, that is a concern however.
> 

It might be a good idea to replace the domain-based naming with 
functional naming. Currently, CDSP supports an extended DMA address 
width of 34 bits due to specific use cases, but this could change in the 
future for other DSPs as well.
Using names like "dma_addr_bits_extended" and "dma_addr_bits_default" 
would keep the design flexible and independent of domain.

>>>
>>> PS. You store "dma_bits" just for the sake of turning it into a
>>> dma_mask, just store the DMA_BIT_MASK() directly here instead.
>>>
>>
>> The current approach of assigning a value to cdsp_dma_mask allows for
>> adaptable logging behavior, making it easier to trace.
>>
> 
> I presume you mean it allows you to do "%u-bit DMA enable failed"?
> 

Yes, now I can directly use the dma_bits otherwise I have to extract the
dma_bits from DMA_BIT_MASK() just for logging.


> There are only two options here (32 and 34), and the only reason why
> it's not directly obvious which case you're looking at is because you're
> "dynamically" deriving that number from something else.
> 
> Regards,
> Bjorn
> 
>>
>>> Regards,
>>> Bjorn
>>>
>>>>    };
>>>>    static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>> -- 
>>>> 2.34.1
>>>>
>>>>
>>
>> Thanks,
>> Pallavi

Thanks
Pallavi
