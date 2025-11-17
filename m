Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6607C62A1B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1265A10E2D4;
	Mon, 17 Nov 2025 07:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p45iE1sk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERlqGqYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D1010E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:03:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH4ov6R3042544
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9qII+zf/ExS1R3Wfv7ODK0uvd5zJdIQqQ3+eKaPpyEM=; b=p45iE1sk4oZzCoQ6
 2oCNDERpc6aL1p0Orj+hksG7eh4lep33UbHnWEH+m2fBHVnGN85dGEc5E/tGSglB
 QIobdrJJZDhf+b2Hl8m7NoZbUUvfpS5zIWEOHWxuL2w/C6qaE5cp08zccejfWJh2
 p4XIseKnINrQQ9w6tXijUIAXx+JPl08Mrvn/K1isDNJ15lbNDKf/zItRDtUdeP5M
 lB20KGThsaBdBb96JDluxEhD/oMkH0r0R/pV5Mv5axL+osbbZCSf2O2Ab8UX5Y5m
 DJ+JcbsPurdJ4cPFQX4pJbEdlMmLW0Z1IyX+c6sUUsZCGQtOl+noBxTEslXPN8kR
 XO4D3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh03pnp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:03:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297dde580c8so137490155ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 23:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763362987; x=1763967787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9qII+zf/ExS1R3Wfv7ODK0uvd5zJdIQqQ3+eKaPpyEM=;
 b=ERlqGqYXznuE0ot/U0E8G6v+DlzYTwgcPLnx8uvo8dO/Ixrc2H+vH0Gz1P/vqkiYpw
 ZkAkxzbH5SmrfgsAwkO66RMUzYFH3BZ8m/cQ1tbU8d8YZndEx0hh06vZJ6rd0HQmDF04
 HAY9uSfc5AorRbiHQNXnNyjQePddshfibk/2fOk6DnKunaAL8tscsM7oJ53XGXw/kUpH
 K0tcn7uxZ16EjKWtUUwuFj72PLmiB1c3tnSgNdCKr9U3L7glTnyRrr6WYUYvU99qxwL3
 7LCzXhx2EXACCrFaoQT1nMrdPe+Xud8jH9Y56fcNf5DbWYiOK3OspVTMhN/i6bE3klXu
 3NZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763362987; x=1763967787;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qII+zf/ExS1R3Wfv7ODK0uvd5zJdIQqQ3+eKaPpyEM=;
 b=Aoe31bITyRifDEL0RAI9yK/QPYR7MdvXoBm0S1tU1zGIYDI6CFJ6iIyvHBexP3Ly50
 nxIehA1N+k9xvY2b41QodveYmlkORgB/QSk1GJA8Yc9AJm4WHrR/lw8qgfJRajfxYPS+
 ox0mmWKF861oUH7DZBDdhN1E+E56pnKaaWKKVIWVI4MF+KVTCjIY/aXzX3r3V6DJULYi
 TIrjN74E5R9Xiv4RGgahf4n7ksczr+nZO67Qd5zm4Xmd/Lr3w8klTeDJ/yuyhrVx4txl
 X8LNBxGZ5r/UntmqMRzIZ3C4yJ1hbSmrvK43Z+j7ahM5In7wlRx8e0/5qgCelkf8qERA
 axSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVN8HAzqyJwIUQW8LflyTOrDv2WVlh2AIuKlVRZo+aG2tkMuUhHWfPkLETGYCaRhwMDF6aCKHnb3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzenhw7sE3qaa4FchKcsiK2tsFEFRZ46am46pTQQbHF28l8g8qp
 Ts9eSplUImfYmpbam+C0HWeTvGZl9uPxjPB50Jayjb2LTcHyukcRSVsBfMAmbukLUE6Vn1svi9k
 fJnwUClamk1iTJjG8872dLFvtQAhqPQYCpBDdZ4O7mQ2P9+YPBVRzblkUMp+0e73HDZxIiT71/S
 jDa9A=
X-Gm-Gg: ASbGncsAGzdcV3D2kfVtSeyzJlOwZ6NUHR6IlyeYH/0tsqCYO0sTsZch34N1qp7AriS
 BbRh8X3Ez0KWCquBp8wSOe3L7r1/6l6TfVRJfrisbBV015aIYGD+EQNu7i38ZTapkq7jYkqSZKK
 5tOixug9phWxquXRbC0LKVKAUd13keKNk8J4ci3qVVgAlt7Ey6x1pKivy0nCL/DvOI9oy3LTRB0
 tCf3/m6SNGvccuNx9AAWpN8aCKsA/Vb6bFnvaANKRhw5rJbuGS7M00UNdbhqSHHpHHEpB6uNUMo
 AqoMPQLRnJmhwmou9d36z+bo6RO15mA89Z1FI8D0EfzVoj3GAJzqYGgdE0pKISv6y1go1ZVsUUk
 4VgYdCwABMBBqaEhOuQX4ex2YCviU7FM=
X-Received: by 2002:a17:902:ce01:b0:295:50f5:c0e1 with SMTP id
 d9443c01a7336-2986a6d0c19mr134921165ad.15.1763362987034; 
 Sun, 16 Nov 2025 23:03:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuYuxukvLZ6TIescHXSf20IFBxcChefEVmcORcYzEbAtfmXjA2tfVU4500MuQt0ad+uan6ig==
X-Received: by 2002:a17:902:ce01:b0:295:50f5:c0e1 with SMTP id
 d9443c01a7336-2986a6d0c19mr134920625ad.15.1763362986457; 
 Sun, 16 Nov 2025 23:03:06 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c245e04sm128321445ad.38.2025.11.16.23.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 23:03:05 -0800 (PST)
Message-ID: <8c59e08a-99cb-473b-999c-e7d08bc2124b@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:32:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Bjorn Andersson <andersson@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
 <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691ac8ac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AqClqBJQwO-Rircdwo8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Mp0Jj6u5nnos4H_fn6plPIX6LylLKVQu
X-Proofpoint-ORIG-GUID: Mp0Jj6u5nnos4H_fn6plPIX6LylLKVQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfX3YsaIDPZ0L+V
 gr6n19ykPLDgvMm4J0keGDetcRsNXCQFBgpeRPBs/dbzQJdqPFd7EXU6i6oq2LmApUX6ZJUwkt8
 2xa55dTeogH3UZmTC6B++rDWII2j1gd0NRY30xx4aLd9us+dNfTxyzNxlVTHARsKPRoMGjGjn+d
 ZR8/VJ6+4kLuT5Rza/TBzmtEMKt9cbzaBeyjEQ51rWfA02fvFQqdgNG6Lw2pV+50ekO8gaieBSx
 wjZmyplm1nWwVKO1cUbOjrIPp3Rin2B8LXbG6HVJ/rWYsx5Zc90oJ2zDhEFX6p6iye/l1IaUEPf
 HRaoYat9Fuihhj5mmKajJkCYk52n0ULSFkMLY4KM0DgpwWtnM83yNUSYmJaiV9aAPGMnijTcV1i
 /GAsGZQHnES2l/ibiOgE+8weWbXJaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
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



On 11/14/2025 9:21 PM, Bjorn Andersson wrote:
> On Fri, Nov 14, 2025 at 02:11:41PM +0530, Kumari Pallavi wrote:
>> Implement the new IOVA formatting required by the DSP architecture change
>> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
>> physical address. This placement is necessary for the DSPs to correctly
>> identify streams and operate as intended.
>> To address this, set SID position to bit 56 via OF matching on the fastrpc
>> node; otherwise, default to legacy 32-bit placement.
>> This change ensures consistent SID placement across DSPs.
>>
> 
> In patch 2 I said I think it would be a good idea to separate the two
> perspectives (Linux/SMMU vs remote addresses).
> 
> Looking ta this patch I'm completely convinced that it's the right thing
> to do!
> 
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 46 +++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 39 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d6a7960fe716..bcf3c7f8d3e9 100644
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
>> @@ -105,6 +104,15 @@
>>   
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>> +/* Extract smmu pa from consolidated iova */
>> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
>> +/*
>> + * Prepare the consolidated iova to send to dsp by prepending the sid
>> + * to smmu pa at the appropriate position
>> + */
>> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
>> +       (phys += sid << sid_pos)
> 
> This is a horrible macro. It looks just like a function taking values,
> it's named to sound like it takes a sid and pa and return an iova, but
> it has side effects.
> 
> And what's up with the ordering? Take argument 1 and 3, and put the
> result in argument 2?!
> 

Thank you for the feedback regarding the macro implementation. I 
understand your concern about readability and hidden side effects.
To address this, I’ve replaced the macro with an inline function


static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
{
     return sid << sid_pos;
}


buf->dma_addr += fastrpc_compute_sid_offset(sid, sid_pos);

Could you confirm if this is in line with what you suggested?

Thanks,
Pallavi

>> +
>>   struct fastrpc_phy_page {
>>   	u64 addr;		/* physical or dma address */
>>   	u64 size;		/* size of contiguous region */
>> @@ -257,6 +265,10 @@ struct fastrpc_session_ctx {
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
>> @@ -278,6 +290,7 @@ struct fastrpc_channel_ctx {
>>   	bool secure;
>>   	bool unsigned_support;
>>   	u64 dma_mask;
>> +	const struct fastrpc_soc_data *soc_data;
>>   };
>>   
>>   struct fastrpc_device {
>> @@ -390,7 +403,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->dma_addr));
>> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>>   	kfree(buf);
>>   }
>>   
>> @@ -440,7 +453,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr,
>> +				 fl->cctx->soc_data->sid_pos);
> 
> There's no way _you_ can look at this statement and feel that it's going
> to add the first argument shifted by the third argument, to the second
> argument.
> 
> Please write that is easy to read, follow and possible to maintain!
> 
> Regards,
> Bjorn
> 
>>   
>>   	return 0;
>>   }
>> @@ -685,7 +699,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
>> +			      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -734,7 +749,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->dma_addr), size);
>> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
>> +				 buf->fl->cctx->soc_data->sid_pos), size);
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -789,7 +805,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
>>   		map->dma_addr = sg_dma_address(map->table->sgl);
>> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
>> +				 map->dma_addr, fl->cctx->soc_data->sid_pos);
>>   	}
>>   	for_each_sg(map->table->sgl, sgl, map->table->nents,
>>   		sgl_index)
>> @@ -2289,6 +2306,14 @@ static int fastrpc_get_domain_id(const char *domain)
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
>> @@ -2297,6 +2322,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	const struct fastrpc_soc_data *soc_data = NULL;
>> +
>> +	soc_data = device_get_match_data(rdev);
>> +	if (!soc_data)
>> +		soc_data = &default_soc_data;
>>   
>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -2349,6 +2379,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>>   	data->secure = secure_dsp;
>> +	data->soc_data = soc_data;
>>   
>>   	switch (domain_id) {
>>   	case ADSP_DOMAIN_ID:
>> @@ -2486,7 +2517,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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
>>

