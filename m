Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557DDBFF7E6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9713F10E895;
	Thu, 23 Oct 2025 07:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YloXzBjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7CB10E895
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:20:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6YaMl018153
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +bnwHS1/yOaQxHpzvdkz9xhr9di2Zfg0xQQ+FZkciYw=; b=YloXzBjRRk98phbn
 iH9My3iUv5EljDC3hFAScjp25dXc24XGB134wsy52DlpBXchuGKtJDfeR2V73VMG
 DJHwC0mHbFCM29XZaGPs+fyMwzB8xD6hG6BEqe3AONAGYS5v22xyKjBhOG+Yq/fU
 7JMYuIO/Z5VcfmgCtqJ+o+vhDTEKfU08o+B9eps2C/qeP38F4LvsyOxBDjBfyVFR
 QDwtMptgH7zvFnWDPhD6D0oev/4lUfdIFg2qPoPBCH7l8uH8sTGgz2qzQstj0c1o
 Bukk5N3Zl4NTkPf2HaLAMEAcRpe4B94VKKSLmDo19tbJRdKpjRc7qWk4dT3ha7tL
 fIOWsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsd13e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:20:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32eddb7e714so468487a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 00:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761204020; x=1761808820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+bnwHS1/yOaQxHpzvdkz9xhr9di2Zfg0xQQ+FZkciYw=;
 b=PtusXhhgb20vdT6b8aobuzDA+OhdP09imebnVAO2tZTG1LETHoA96DoyLVedcp9N8z
 3+3Qpkn+7dz0mRfzJs5q8vyfrA5IfKbN3gjDeZ8fNqv7kBYyIT3lCtk2bGtT8hTTC9DI
 mIAglWSWzxdtFgJ2CloZJyk4cyTBzgNz50F38xpOQu9FEgKLfy60kgROHqFt18aHK6y/
 WIbXTWNt7twLX9O5AY1Qjql8TCFitSx0LhJE77Qm4FErmoCuIXR0h/Vvv2nNer3EkpoY
 zJK2H9rWifc6YF6IKgWnuStjaFumynKBNmhVQWN0zULuAVqKXAzzgY71TPeUxOP94Vzp
 56lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/McCoK/vRYuLpGxe6wyufuu4pJJrkfI67M7Y1U1EGMGMUM/wJbAtz3ipatPFGCBAJQjqi/5PQQlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ19niKF5YnC2qV7CYV/l7Jgirih1yyiOutdKYM5eNANMA+Md/
 dtfv/LM6r4uua6ZV+DlYpGLPiaIRjoyk7CK07uSD34n4HnjDMRDIzNnNyhlyHqka/lwUkgu8E5i
 NKkOn+GHOjEGr5DmKEIHp+iUujq6r+nBhG02RvH3T/H76qTVlkiQ+L7MYIrI8jdgLKZ8BBrE=
X-Gm-Gg: ASbGncuSJgyOdUqb8VHMm1DLdf1QiwanyfZb6SGf3s7jCzOe1GmVnOiLpRgED3fAmug
 NXG2bi81D3KVtpGi28jWwws26SKvTy+EGscIgsOfm5cqu5W0/JSNZyLSfxpg6Aw+ujKdJ8dml1d
 K+DbGKEeChf/JG52AIwdZZKIEslgiy7eoSDIpOcb1VNiRKxA4vB34jSbPCtxoqAObnEdKo68ZHM
 2ROB94lQQOdFKB4JywfvOByV920XeV0i2MnTXUiC5XZxZq4U0v3cNVjLFgGtNcSTdvZzqVqjowO
 /7jF90NRdIBOdzdRo85EJsOxa7hMyNp5lAztv3klR1BYC2JF4Xo/Oz1Cmjp1GA+avoEnz/rqDlm
 aMNOERP9E/7FBMvqiq9No1fEeP5+V7Ns=
X-Received: by 2002:a17:90b:1b41:b0:32d:f352:f764 with SMTP id
 98e67ed59e1d1-33fafb97f5cmr1702627a91.2.1761204020236; 
 Thu, 23 Oct 2025 00:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2fcSY1TNJQstdN387DaRrxHE11mr6Jmptb5iITLfgYGoj08YKIaIx+q2b22NC4ilr2/vXKA==
X-Received: by 2002:a17:90b:1b41:b0:32d:f352:f764 with SMTP id
 98e67ed59e1d1-33fafb97f5cmr1702599a91.2.1761204019686; 
 Thu, 23 Oct 2025 00:20:19 -0700 (PDT)
Received: from [10.204.86.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9ceb8sm1525999b3a.21.2025.10.23.00.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 00:20:19 -0700 (PDT)
Message-ID: <75f6bbad-49a0-4a15-b976-a0450f66a4dc@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:50:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
 <svekpvatqpymzxprc5n2tlndqlwze3tj6kr3bzszjnoay7oulk@zslcxpsyuzdo>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <svekpvatqpymzxprc5n2tlndqlwze3tj6kr3bzszjnoay7oulk@zslcxpsyuzdo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX8/3H0gN4lCyh
 rn2BaWkw5rxLqtb9d+gP9AJBjifEcHwREho9t81UyXYHnmYesB0bpX780TAkFal5ImPN6VcXFPC
 6/I+1DjxAjcLSHvlyknqtCTNpZFSfy0gD28EH+bYo7HmpZjlhazuTvxuNcsolwbSxwmhprJCaLV
 rIpXOeauoD8v3/0u208tQzwh0O96anh3UClBDk3Qz/l1gr8mAb83A3APpqECqDJtudzV5YKIRzF
 pZbjoQEOLBL8I2VHsSaBW09X84XqZDSNQ/Ys9UIsKJ4kND0tOTtuVEq6DlrcbCplOauZ/ftaEBv
 Mpow3NB7ZtSzaZD7ZTReeawLQ5NiKDttb3AvFpD25kuB6vuejsqqTdy5bmN/U/XV+wAonoPi8Mq
 tDpFneBtq6mfs2W8UpB0fADeks9zFw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9d735 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3sZQ8oCNBwzgLSnuaQIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: HvYHbZamxdSw5cl7RIcDoxPBNeTHq1ez
X-Proofpoint-ORIG-GUID: HvYHbZamxdSw5cl7RIcDoxPBNeTHq1ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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



On 10/15/2025 3:37 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 15, 2025 at 10:27:00AM +0530, Kumari Pallavi wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 68 +++++++++++++++++++++---------------------
>>   1 file changed, 34 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 621bce7e101c..975be54a2491 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>>   	struct dma_buf *dmabuf;
>>   	struct device *dev;
>>   	void *virt;
>> -	u64 phys;
>> +	u64 dma_addr;
> 
> If it is dma_addr, why isn't it dma_addr_t?
> 

While the field is named dma_addr, it is not strictly limited to holding 
a DMA address.
Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is 
set, S2 mapping expects a physical address to be passed to the 
qcom_scm_assign_mem() API.
reference- 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b

> 
>>   	u64 size;
>>   	/* Lock for dma buf attachments */
>>   	struct mutex lock;
>> @@ -217,7 +217,7 @@ struct fastrpc_map {
>>   	struct dma_buf *buf;
>>   	struct sg_table *table;
>>   	struct dma_buf_attachment *attach;
>> -	u64 phys;
>> +	u64 dma_addr;
> 
> And this one.
> 
>>   	u64 size;
>>   	void *va;
>>   	u64 len;
>> @@ -406,12 +406,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   
>>   	buf->fl = fl;
>>   	buf->virt = NULL;
>> -	buf->phys = 0;
>> +	buf->dma_addr = 0;
>>   	buf->size = size;
>>   	buf->dev = dev;
>>   	buf->raddr = 0;
>>   
>> -	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
>> +	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->dma_addr,
>>   				       GFP_KERNEL);
> 
> If it was dma_addr_t, you wouldn't have had to typecast here.
> 
>>   	if (!buf->virt) {
>>   		mutex_destroy(&buf->lock);
>> @@ -437,7 +437,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->phys += ((u64)fl->sctx->sid << 32);
>> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>>   
>>   	return 0;
>>   }
>> @@ -682,7 +682,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
>> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> 
> FASTRPC_PHYS trunates addr to 32 bits. Is it expected? Is it a DMA
> address on the  Linux or on the DSP side?
> 

Yes, it is expected as the device can address up to 32 bit memory range. 
It is a DMA address on the Linux.

>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
> 

Thanks,
Pallavi
