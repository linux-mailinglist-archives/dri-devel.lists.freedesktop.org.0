Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E0CAC440
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CC310E0E4;
	Mon,  8 Dec 2025 07:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeWKF68j";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEgEwW45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C4F10E0E4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:04:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B7MD5Ab3393597
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Dec 2025 07:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FGaVPlF30fkBj2JVwi64KaI/aCwHZ13hN5EJA5rYn0s=; b=TeWKF68j4BUrPE8i
 MB4GCUuy2K+U9PxBHNs9VjbQfsR2vDbNGjJkh02rFWs1e+/ivrKlgQ+bJWlX25zj
 94T07y8hQjGMT92GMedbpJBbD83KBeoFDeBunvx7lxrfP6pJ6PhCbHcV8K6xVhF1
 QVXZMdyJzI9pZIGH+Mx/J7v79o1FBrLju0UQzcrYCpwsflME2/7b8hG9kJdtLDGW
 mCKn4KJAT14gvbstOnOEiH6vltuyIeZftfxeYxCF5WsDEmSm0/gqZ1ULEC9eJKB5
 6R8S4iuHeDxdxNHDnUT5Wo/qjqzMb0bRCcW0BTbRu/AyUx1YP0tgsZlxWQdqxl91
 bKyg8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9upv843-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 07:04:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7be94e1a073so7943948b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Dec 2025 23:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765177496; x=1765782296;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FGaVPlF30fkBj2JVwi64KaI/aCwHZ13hN5EJA5rYn0s=;
 b=cEgEwW45oOZiUagE0ZAaAvrr3ppjSFsSVJuBYvrXe9EDqDuj1eRVWY0qYpfP8a3CEo
 1kyDk/KjcvEwvPe/m47T0oIvGCvPCdVXYJcjYLHUoriMs2ossCA+2IcpPab9tOu5MUzh
 ePzD+jGlQP7cRPpLE5t2BXxz61GRQ+S9HpV0DxfH483azErw8RBYDAPfh9G2k8zpE4d7
 gbWtRtytEJYNexYAQ3c2RHUjWTUn1qrBLVB7wGnsPZC3GZKQy6LjoBzZEEOoNPbnes77
 N/etSxyv4WDzslIUZ5Hw0VF9sz4yxStCAS5Gpy5jisX9ixGiXVnjSJjPCoiWFWwSSfwx
 EaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765177496; x=1765782296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGaVPlF30fkBj2JVwi64KaI/aCwHZ13hN5EJA5rYn0s=;
 b=DD6LjoveHWPpa6LgYFcxBKDcoNfAOLCRXb9jmlsZ61LbgLavymp95cAahvsQ7W01b4
 /s+2YK38y/btbrR1ieo8Wi5QMrBuAKTR7vBBXhlO/o2WpsamORQ9uLZbmF8/RhOlEPoW
 GaDgBiEnIoPUoi7tR/vu9lKe7xGF31qqc3yrs516HnbcxM0Ei52RDRAI1UwJuWRZSQFU
 4lsaG4dZmsaXOJHhSQoahtSR5VNVwKSIx6SPv9VCUnVnFLwJohb0+pITwSqXP+atk11E
 uWSoT5NP5SrBXh/wcwpZ+AaReWdQ2xwitecZWPKljCSJW+rAi2AM/fo8pVbwWwiphTXi
 bMRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgiOeKUdWz12MPyfQ9bgR+Rp5BawDhTOlXoTAKOhpPFCDSXmLshn5MC8ZNmZVC5nhYrqgeOVnXLJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW4RNVE1q8mLCAseD2+YURbr57rTaQP1run0xAeGcF7Nfvynyg
 V2UvLluVg4WvpTgDjiyTn7oiJDfUiJ44b4Nyx2RiECPySqRoEIBii342wF55v/aw77vDpWLSlti
 14Jd7yEb2d5JXWUOUufb7nIcHQ62WfV+7MNu+1WuXpmdvICFayeWFJOp9aq8as3ZAWtqE260=
X-Gm-Gg: ASbGncsGYD58lvzNgxqrEV6xCyw+VfO95laA0+KTZY5S4rFWh1rWPwNHOzzYMaWiOm9
 A6PXnZgEUghP6oR2rBaPlbRJEljBrbMeSrOmVdWDt4yEzb3V2Ep8fb7c6Wu5TlZ4sfgkdvuXKIj
 oqfTujQ9yqreEY0qQI9rU1QBnbik1bpY8EBvWKCysz4p2+FNOr2UYy2IMtczZ5wu8ZwhF8n9AQN
 jj4xw74Yx3q66b4K+XTeGqgpKDFrboi/X03OBHf4zVNx03+UmeGOsHozO4/Axv29y4krPTwNUTA
 bJ5xKR2JhEfU5lUA90x1wdBTJtzu6wNiWhfu6GLI3AsGtGpUfvbtpbtxxcKDK0jPG1Tvc1U7VuG
 HHe8AUn6QNbxrYmiqAUwwxEX8xpca3bV/5XGdb4cH
X-Received: by 2002:a05:6a00:198d:b0:7e8:4398:b351 with SMTP id
 d2e1a72fcca58-7e8c4a760b0mr5135541b3a.36.1765177495284; 
 Sun, 07 Dec 2025 23:04:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXXstO1/aH4pNkltYFRUw67jHP+4wYmmld/ualkI5pVrl7sEs1XBsQY9dBdbZ/F4pmYZUYPg==
X-Received: by 2002:a05:6a00:198d:b0:7e8:4398:b351 with SMTP id
 d2e1a72fcca58-7e8c4a760b0mr5135511b3a.36.1765177494761; 
 Sun, 07 Dec 2025 23:04:54 -0800 (PST)
Received: from [10.204.86.50] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e73079fa24sm8726983b3a.40.2025.12.07.23.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Dec 2025 23:04:53 -0800 (PST)
Message-ID: <5f4efb71-4d39-45e4-bb0f-dd3c3c5b3a28@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 12:34:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Update dma_bits for CDSP support on
 Kaanapali SoC
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
 <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
 <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LeDdM0mVKdocLSODMPwBAe5G_Tf_VCvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1OCBTYWx0ZWRfX09JNVe+gkcbh
 M090mcmjMQ6hqs1u2iNxJ7FHmSioiv/Uq+uZ1FBWA0NlT2mEbarfyexGZusjXezrRhTk2Z2Zoom
 AGP2U1zOfDJuqLrW3qVTgRTvz6OQgU1hEy6Dw4YFe858dH/cBPkV/7niWyPTaCRPlrgHb368+ks
 qx7HXnEAGhEOTMYVRqahXcX0MM3YKn6KGtDiiYbG/IUrT/4/PmTo0wNKZGf0NwEtvJ4+t8Bc2xX
 ScAxavBmK2OV1EcoUWm9y9HGFlp4qn5vVPWb2DxmCXZlKWF2+SRm0fmRjIZQ8jWo1FqWt3ecQb8
 0keA3R3YsQaENe8weeAasJO/E7RDEFrIzX5BKxk+6UAPoVpZsMmFSADHZxpKSoUxL1uTjAHpWcK
 TkGu0W/fRIOPx4GO9slOS9Ty+KXx1A==
X-Proofpoint-ORIG-GUID: LeDdM0mVKdocLSODMPwBAe5G_Tf_VCvD
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=69367898 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zVikO9lnR5s5zLRVlN8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080058
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



On 12/6/2025 8:01 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 02, 2025 at 11:36:28AM +0530, Kumari Pallavi wrote:
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
>> index 6a67daafeaa1..c5d2c426fcbc 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -269,6 +269,8 @@ struct fastrpc_session_ctx {
>>   
>>   struct fastrpc_soc_data {
>>   	u32 sid_pos;
>> +	u32 dma_addr_bits_extended;
> 
> s/extended/cdsp/
> 

Thanks for your feedback.
Here, i have used extended instead of the cdsp as to replace the 
domain-based naming with functional naming. Currently, CDSP supports an 
extended DMA address width of 34 bits due to specific use cases, but 
this could change in the future for other DSPs as well.
Using names like "dma_addr_bits_extended" and "dma_addr_bits_default"
would keep the design flexible and independent of domain.

Reference of the earlier conversation regarding the change of the name
s/cdsp/extended

https://lore.kernel.org/all/e0d039e8-8f65-4e2e-9b73-74036dc0bb8d@oss.qualcomm.com/

Thanks,
Pallavi

>> +	u32 dma_addr_bits_default;
>>   };
>>   
>>   struct fastrpc_channel_ctx {
>> @@ -2189,6 +2191,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	int i, sessions = 0;
>>   	unsigned long flags;
>>   	int rc;
>> +	u32 dma_bits;
>>   
>>   	cctx = dev_get_drvdata(dev->parent);
>>   	if (!cctx)
>> @@ -2202,12 +2205,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		spin_unlock_irqrestore(&cctx->lock, flags);
>>   		return -ENOSPC;
>>   	}
>> +	dma_bits = cctx->soc_data->dma_addr_bits_default;
>>   	sess = &cctx->session[cctx->sesscount++];
>>   	sess->used = false;
>>   	sess->valid = true;
>>   	sess->dev = dev;
>>   	dev_set_drvdata(dev, sess);
>>   
>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>> +		dma_bits = cctx->soc_data->dma_addr_bits_extended;
>> +
>>   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>   
>> @@ -2222,9 +2229,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
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
>> @@ -2311,10 +2318,14 @@ static int fastrpc_get_domain_id(const char *domain)
>>   
>>   static const struct fastrpc_soc_data kaanapali_soc_data = {
>>   	.sid_pos = 56,
>> +	.dma_addr_bits_extended = 34,
>> +	.dma_addr_bits_default = 32,
>>   };
>>   
>>   static const struct fastrpc_soc_data default_soc_data = {
>>   	.sid_pos = 32,
>> +	.dma_addr_bits_extended = 32,
>> +	.dma_addr_bits_default = 32,
>>   };
>>   
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>> -- 
>> 2.34.1
>>
> 

