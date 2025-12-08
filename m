Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9411CAC51F
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0888D10E3A0;
	Mon,  8 Dec 2025 07:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nypYuYi2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQazTBwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCB510E3A0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:26:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B80RtCW3238982
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Dec 2025 07:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2h/9s5/6yuANhhb+4rM83nToq2nw6PNRAP/thpKEdn8=; b=nypYuYi2PJkd/rEX
 SXLNA4AiYWXHklByR+7kfPQ/uytnZYtZ4hD97v4CqeAiNAzxwlY4bfWibsrMlmUY
 +Qc/o0Swz7Ras2QRZgVNk56GHoSSd+RcHd78XSU7Ldq6RRpYAwmbBEEgox+HU2/r
 /QsnqR4w0Bia7OgFjBi3RfcQR5LGlcbELwfZFjDbap+VRbwiBfggyGxmQaBay5cd
 jnSYK+ITDVz7Eyd2ANhYuLZ/JCFvOOA5aMCK9hPcffJc2ofUS7hOiJfQYd7gzp/B
 AaUM63NoEPwupv9SC/fbvA56tH9wQ4tRo2MZGo0y8bPP8V7qXEYKVloIuyv3TVAV
 OESPsA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbesc570-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 07:26:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340c07119bfso8175921a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Dec 2025 23:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765178785; x=1765783585;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2h/9s5/6yuANhhb+4rM83nToq2nw6PNRAP/thpKEdn8=;
 b=XQazTBwYef1kbjAdEphiLR0ocd+im/xeirCPC+bG3AI4P/KhyaZPmO1JU5DKJ4eA+y
 VVVW06WlCZM5XVaVxSx0mmZoVLqhgvrXWnx6fP66ed3Iyqiqz3w2XfuiXJWa42AEHDxn
 DGDe+QrcGVciSRlmfnxW2WgdAoMCN8Cgu9FHna+rgZR7mNq+9zU68bocDFlJV9GP+shn
 4Xm/WYXBpY2hi4H1/CllRlAijOVaW+yv1CRoZTNGT+wiQpCQVek4C8gddeLCRsD/I9Y4
 BUhDIwo2wz4Btst59C83liEmhbdqRsmIsdkh3GICbPqm4vCL8djz8gpNiVqCm0b4wex2
 Tnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765178785; x=1765783585;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2h/9s5/6yuANhhb+4rM83nToq2nw6PNRAP/thpKEdn8=;
 b=e/iZA+gL4hE5uIM6O0WGIGui8zZrMFNYd//mRQEDmXw4v5peula8MqNhu+CcGg8yvo
 Fgg6URibeuQY2BW7eQbIcbSipu97KYD/mR14JH6bPl6gPook//96NxUbH2IQxMB4Qp9M
 KAbuEArA70gM0CtWuo+1QkwfPMdWag6crMlHnpcqMAYFAvYCcZD+elU8pW7CH2I1N6A/
 weqn16r0WW1jp0w0KyvupO47UQ/76VTfwKx5Iv1tomAW9lEvl6S6Vv4hl7c1ctYi+k1u
 YamfaA0tV37pYDl//xP2C3gv5cZXGFtmcL5HnY3urBjEyjHSniq1UHZ3u+Mc8pTlr3RS
 VuuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrMzhn152sq++MrZW7NXR+YmCUUPLtlqxYbsNvygPPqT7T3U4Ys/XN7m/QSy1aO36QKENin/WGGNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvegKYlLmHalGulLdT6kkTIxVLjEjvjXNDoyTJD8+E33IEgos4
 VfKqDjqutHPuQzg8Bre/xEqGBNH21jz7xhto7pf/fBcxpcfaJdrQ0P4rDFXtgQf+B7FURJ/v+kt
 QN48C7nHX3rR9pC+87u8MoOxuKq1p3LsA1xPO7Fw9Q4qiFqn/Iu6miMb8BK4zppWBe2thKi0=
X-Gm-Gg: ASbGncut5tn5NyTwPLgdAp/5LAtgGr8Qa9YW4zHDNIOxA5hefsoTn8lmjLycB4tSXiD
 P2ZPiJd0VyivrSjF3v+cgJX0kW4fGQmMQD5puOXP47ZkSSfAx/YJxK4uXOPLj4FcBJoE6kaWUz0
 VrvjJuft2mKj+J0YSI/YmIP0yDEzNt2VFm33dlbgVcnLpKe7lX+ZXz7Ke4VrlZGiQXgeYJ2um1E
 T7hqcWW4tvikGrnQa3lMNfyvYzFgLSorkjPXISUBOFEva/SPdwf3rAzHtyNoWsXs3Jc9Y0S6t5q
 WQEq0y4aQLmPEgYGqo4ZQgzOCK4kyP74FOAOQikCNvaFiOtgpzlrPK1mlJdqeL593mb67rPESqw
 vMyaglAE7xk9HhoCRpj7bi7S+MHuzE0TJ7E+Z9vLK
X-Received: by 2002:a05:6a20:1611:b0:35e:521b:f488 with SMTP id
 adf61e73a8af0-36617e6fc2emr7346555637.25.1765178784724; 
 Sun, 07 Dec 2025 23:26:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvKeeA4DXCmYUvwrhih0Cu9+rs4tlldWdh2NkFE2P+F8QEKjsONEnnopM4FdT0qAkXdvE1Pg==
X-Received: by 2002:a05:6a20:1611:b0:35e:521b:f488 with SMTP id
 adf61e73a8af0-36617e6fc2emr7346522637.25.1765178784199; 
 Sun, 07 Dec 2025 23:26:24 -0800 (PST)
Received: from [10.204.86.50] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeae6b3csm113773845ad.101.2025.12.07.23.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Dec 2025 23:26:23 -0800 (PST)
Message-ID: <18c6b95a-961d-4544-856d-7dc08f7d5d74@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 12:56:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
 <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Au8uEAADjxyG0glNyATNFL_WLOFJULqD
X-Authority-Analysis: v=2.4 cv=GulPO01C c=1 sm=1 tr=0 ts=69367da1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Qodh5YlAHioYhAOXRRMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA2MiBTYWx0ZWRfX/SloClT2ZMUv
 3rJYnLumnslMz/reBOZe0y/zhy+hVUnccUMGSbuRAcbZvB027JbMn6kUOX9FkttAZSHxsMlpIg5
 hkjiPuWv0FxFsfdljhG+n72QjrQvCgepUNF+DDlW5UpV7RWbulhyyCvV7L/V/5m2lWUoFobg1gy
 IrFZGvPhFdjld0TXWAq7RP/Ru4hHa+oWfW/RIavMCLSvlQzvOWsUMEBidA88wltSovpOFuv1gdC
 uDPSuUto2b8nAuO4l9wQ5vTPSNt7VeYnkC1RYjDBY4KzfZt6/AWy6y7z96tXEnjOABE44LAf3CZ
 AbgG9N+WpWvtOYSaaX54Q8KsVvpJd1ylu5AEgoSOyNWvggqYu7IozZAeemhOtS9FnvAGGRXOufb
 FkBjk6OSQrAB0ViRkd8Whr4lpEmnfw==
X-Proofpoint-GUID: Au8uEAADjxyG0glNyATNFL_WLOFJULqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080062
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



On 12/6/2025 8:00 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 02, 2025 at 11:36:27AM +0530, Kumari Pallavi wrote:
>> Implement the new IOVA formatting required by the DSP architecture change
>> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
>> physical address. This placement is necessary for the DSPs to correctly
>> identify streams and operate as intended.
>> To address this, set SID position to bit 56 via OF matching on the fastrpc
>> node; otherwise, default to legacy 32-bit placement.
>> This change ensures consistent SID placement across DSPs.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index eb9501fe79bc..6a67daafeaa1 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -33,7 +33,6 @@
>>   #define FASTRPC_ALIGN		128
>>   #define FASTRPC_MAX_FDLIST	16
>>   #define FASTRPC_MAX_CRCLIST	64
>> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>>   #define FASTRPC_CTX_MAX (256)
>>   #define FASTRPC_INIT_HANDLE	1
>>   #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> @@ -105,6 +104,17 @@
>>   
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>> +/* Extract smmu pa from consolidated iova */
> 
> Nit: SMMU, PA, IOVA
> 

ACK

>> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> 
> GENMASK?
> 

Thanks for the suggestion. I’ve updated the macro to use GENMASK_ULL 
instead of the hand‑rolled (1ULL << sid_pos) - 1ULL.
The new version looks like this:

#define IPA_TO_DMA_ADDR(iova, sid_pos) \
         ((sid_pos) ? ((iova) & GENMASK_ULL((sid_pos) - 1, 0)) : 0)


>> +/*
>> + * Prepare the consolidated iova to send to dsp by prepending the sid
> 
> Nit: DSP, SID, PA
> 

ACK

>> + * to smmu pa at the appropriate position
>> + */
>> +static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
>> +{
>> +	return sid << sid_pos;
>> +}
>> +
>>   struct fastrpc_phy_page {
>>   	dma_addr_t addr;	/* dma address */
>>   	u64 size;		/* size of contiguous region */
>> @@ -257,6 +267,10 @@ struct fastrpc_session_ctx {
>>   	bool valid;
>>   };
>>   
>> +struct fastrpc_soc_data {
>> +	u32 sid_pos;
>> +};
>> +
>>   struct fastrpc_channel_ctx {
>>   	int domain_id;
>>   	int sesscount;
>> @@ -278,6 +292,7 @@ struct fastrpc_channel_ctx {
>>   	bool secure;
>>   	bool unsigned_support;
>>   	u64 dma_mask;
>> +	const struct fastrpc_soc_data *soc_data;
>>   };
>>   
>>   struct fastrpc_device {
>> @@ -390,7 +405,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->dma_addr));
>> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>>   	kfree(buf);
>>   }
>>   
>> @@ -440,7 +455,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		buf->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
> 
> Drop type conversion
> 

ACK

>> +				 fl->cctx->soc_data->sid_pos);
>>   
>>   	return 0;
>>   }
>> @@ -685,7 +701,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
>> +					      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -734,7 +751,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->dma_addr), size);
>> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
>> +						 buf->fl->cctx->soc_data->sid_pos), size);
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -789,7 +807,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
>>   		map->dma_addr = sg_dma_address(map->table->sgl);
>> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		map->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
> 
> Drop type conversion. Hmm. Looking at it, would it be better:
> 
> map->dma_addr = fastrpc_compute_dma_addr(fl->sctx, sg_dma_address(map->table->sgl))
> 

Thanks for the suggestion. To confirm: you’re proposing that the call 
site use a single helper returning the final DMA address, i.e.

map->dma_addr = fastrpc_compute_dma_addr(fl,
                                          sg_dma_address(map->table->sgl));
I can implement fastrpc_compute_dma_addr() as a thin wrapper that 
internally calls our existing fastrpc_compute_sid_offset() and composes 
the consolidated IOVA (SID in upper bits, base DMA/PA in lower bits)
?


>> +				 fl->cctx->soc_data->sid_pos);
>>   	}
>>   	for_each_sg(map->table->sgl, sgl, map->table->nents,
>>   		sgl_index)
>> @@ -2290,6 +2309,14 @@ static int fastrpc_get_domain_id(const char *domain)
>>   	return -EINVAL;
>>   }
>>   
>> +static const struct fastrpc_soc_data kaanapali_soc_data = {
>> +	.sid_pos = 56,
>> +};
>> +
>> +static const struct fastrpc_soc_data default_soc_data = {
>> +	.sid_pos = 32,
>> +};
>> +
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>   	struct device *rdev = &rpdev->dev;
>> @@ -2298,6 +2325,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	const struct fastrpc_soc_data *soc_data;
>> +
>> +	soc_data = device_get_match_data(rdev);
>> +	if (!soc_data)
>> +		soc_data = &default_soc_data;
> 
> Define it for all the entries, drop if-check.
> 

ACK

>>   
>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -2350,6 +2382,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>>   	data->secure = secure_dsp;
>> +	data->soc_data = soc_data;
>>   
>>   	switch (domain_id) {
>>   	case ADSP_DOMAIN_ID:
>> @@ -2487,7 +2520,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>   }
>>   
>>   static const struct of_device_id fastrpc_rpmsg_of_match[] = {
>> -	{ .compatible = "qcom,fastrpc" },
>> +	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
>> +	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
>> -- 
>> 2.34.1
>>
> 
Thanks,
Pallavi
