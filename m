Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A24ABDE13F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1424D10E774;
	Wed, 15 Oct 2025 10:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNO8yCUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2510E774
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:50:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FARtbb026136
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MNOL1mDXjuJoXB7sRKlJwzRGYo1qn26ZWmE/m3MrxZs=; b=CNO8yCUzx3I5q1q2
 VxwaQZtWJxMAtdsf3zXS1vlxkZl7aLUUH5X5WUTYAAuTFE1VE8zpPNhLTTiFEDjF
 RCmvTWMuQnlcxTzWnZ9vrQgP9+OWHUEWNnvJSoorj2s+QxC3G4wW8pPF5kOfQ338
 E7eAfar+WVE56Ov9DD957fuw+Pp6Chuttk5svY8amFF/7/Hs/FkhCg2GhJDlHEtY
 dbr+6DMd3k7kreaTmWgkDYeLeYsRHenCN7NscdVbgeKwvzSGbo9A9eQ7pEI5s5/t
 ZxmHfXj8af5/x3j2+B2DCnJkNXHfRP7HWaFBklWgnwO64Qisl1s2E48MHRDLaOJu
 zOpsvA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0v3dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:50:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-781253de15aso18663121b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 03:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760525400; x=1761130200;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNOL1mDXjuJoXB7sRKlJwzRGYo1qn26ZWmE/m3MrxZs=;
 b=WFnMoyl6ZNbJcNKLOZTBd6imHkCGfwThjkzazs8u+6ZZkSNrjnMy50GbX/Do4aPP14
 1SCVxJh9+B24AM3eqjHS/Q+TW+5a6NZwk6LW/IRnLFoO9hYLYpH2wySigm1PaTM44iZS
 pVJ4ZRc9D4r54j4VTwg+E4fAEALt/QNl7/2i53MOVSpzIQfty+hMvNLJOIyDpDPmZPlU
 OdCQh3iS+iBc1xjdVGNuV9k0vmG5E3xSH8qwnPGAwfVp5IVhc4lCBhBma5Fwy7nWSKo1
 6j6B1eSdpMWfEu9pKRYy04Iys4D/M5PDbQVme0aQg6k1NYul0AHTjKckdULT3FPK/94/
 5znA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGZ7BZlpsn+Oddch5JUI2jZ/VsiX7BI8ic24/e35o4moF2ssEh/OrP948Zf/wTeuqVKcr5AOG8C5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCNty5KEHrgw3off4H2l/DYPApkmNBB0unCZHhVwnaWjJ6fCU9
 K810PY4J/F00wzpY6L2hgNN5OuOMpO2SRVNFD2XmEzA5w0+pK6oKwfctLg22zn3/E/C5jGASmLY
 F0iUUkIx/XApf2MEWuHvutTryFcRn/frR8vYVpDFnxHW327Z/A2kspBxp/2Tyf6PhdXoRIro=
X-Gm-Gg: ASbGncvTPJs9cIazF/vUzEHUXrickdmSUda7flOzYz9m7HekMmWajmSoGWwFCG0fbca
 Kd9nf0xsWi3jlVwPWaL2fuNrwUxyyDo+dftIg8AEb1tFx5Hdn+isjPHr3Oka5KFFyc5ynjp3sg7
 bgpwwr+/5hRdFj9J2T8tlfvJe6dnTSc8YPl1x5Lc9R0/3aCQJdCErg8LO9lS3x2iKLNvN6+flsZ
 nT3CWL+VAgIRE1KE+SP9mnwbDGX0Ax5QfCrr+KcZhspWjugFKzewOckl/GYQGCHneP7P/gpeKIN
 t0KQMOYG08EdglkL/VdY9o2J89MnklyIhP7RK4F+FeIRSeMJ8EsnfCTn1E2JiGWMyVbw5FB/
X-Received: by 2002:a05:6a20:2595:b0:2c6:85b9:1e0d with SMTP id
 adf61e73a8af0-32da8138fb8mr36423188637.21.1760525400132; 
 Wed, 15 Oct 2025 03:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCkvgwYwtp+G1Fo5ZZlGjsfYndNgAhiGmdAmlQNBGcdbkCj9GHS3/hxCWXELKdQdDs4BpuuQ==
X-Received: by 2002:a05:6a20:2595:b0:2c6:85b9:1e0d with SMTP id
 adf61e73a8af0-32da8138fb8mr36423159637.21.1760525399659; 
 Wed, 15 Oct 2025 03:49:59 -0700 (PDT)
Received: from [10.206.107.23] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b529f51b5sm9844853a91.7.2025.10.15.03.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 03:49:59 -0700 (PDT)
Message-ID: <295fa681-2977-4ab7-b543-a3515b3010be@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:19:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] misc: fastrpc: Rename phys to dma_addr for clarity
To: Arnd Bergmann <arnd@arndb.de>, kpallavi@qti.qualcomm.com,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
 <2e571b41-0006-4a37-9e3b-d333bf5eb7ed@app.fastmail.com>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <2e571b41-0006-4a37-9e3b-d333bf5eb7ed@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+/kIavdTPPtx
 76gWY6FiDqr+83/yCrdqiV7NwVFBbyAtiIT1/nSihseuZj9uxFIoXXt8PM3kVZ0tJqX0jfKz1i2
 o4OV+BYJ1A2B5QleH0Tru92jjbjm5Ix9h1gGS2qhCdP6vMEYwcOCd8CB7KQ6q3q4x3/qZ5PAnY3
 YIKeugv+wvMFQXdaYig1Ov/xrHJXeY8QYPF4Q9xGhLENhZUFBc6l04V7znZEnl/eIV9K7MnpN8W
 ookkM2+9gkx78mHQ++r+P7oSoabFTOEkVVqE7Z2z7edk5CLQ44sLBIorsKAIfm9GjHT0nDAPRS0
 05v9RDvBW+ArWSy5EchNT2fjCZvP14z+4f10dfXaQ==
X-Proofpoint-GUID: s3H6ZMLEZ2-kHIHD9vkvPKXn48gBGQkA
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef7c59 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YTqRmuibImJoxezxnT0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: s3H6ZMLEZ2-kHIHD9vkvPKXn48gBGQkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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



On 10/15/2025 12:50 PM, Arnd Bergmann wrote:
> On Wed, Oct 15, 2025, at 06:57, Kumari Pallavi wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> 
> Thanks for the update!
> 
>>   				&src_perms, &perm, 1);
>>   			if (err) {
>> -				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx
>> size 0x%llx err %d\n",
>> -						map->phys, map->len, err);
>> +				dev_err(map->fl->sctx->dev, "Failed to assign memory dma_addr
>> 0x%llx size 0x%llx err %d\n",
>> +						map->dma_addr, map->len, err);
>>   				return;
> 
> Note that using %llx is not a portable way to print a dma_addr_t,
> you should use %pad instead even if your method works on all
> arm64 configurations.
> 
> %pad requires passing the dma_addr_t variable by reference though.
> 

Ack.

>> @@ -783,10 +783,10 @@ static int fastrpc_map_attach(struct fastrpc_user
>> *fl, int fd,
>>   	map->table = table;
>>
>>   	if (attr & FASTRPC_ATTR_SECUREMAP) {
>> -		map->phys = sg_phys(map->table->sgl);
>> +		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
> 
> This is technically still wrong, because sg_phys() returns
> a phys_addr_t that is only the same as the dma_addr_t value
> if there is no iommu or dma offset.
> 

Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is 
set, S2 mapping expects a physical address to be passed to the 
qcom_scm_assign_mem() API.
reference- 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b

> At the minimum, this requires a comment explaining what you
> are doing here, and I would add a '(dma_addr_t)' cast as
> well.
> 

To ensure clarity, i will add the comment. Adding '(dma_addr_t)' cast
result in incorrect behavior due to potential offsets.

> If possible, use sg_dma_address() instead of sg_phys() for
> portability if they produce the same bit value.
> 
>> @@ -813,10 +813,10 @@ static int fastrpc_map_attach(struct fastrpc_user
>> *fl, int fd,
>>   		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
>>   		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
>>   		map->attr = attr;
>> -		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms,
>> dst_perms, 2);
>> +		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms,
> 
> This one has the reverse problem, as qcom_scm_assign_mem() takes
> a phys_addr_t instead of a dma_addr_t, again relying on the
> absence of an iommu.
> 
>> dst_perms, 2);
>>   		if (err) {
>> -			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size
>> 0x%llx err %d\n",
>> -					map->phys, map->len, err);
>> +			dev_err(sess->dev, "Failed to assign memory with dma_addr 0x%llx
>> size 0x%llx err %d\n",
>> +					map->dma_addr, map->len, err);
>>   			goto map_err;
> 
> %pad
> 

Ack

>>   		}
>>   	}
>> @@ -1007,7 +1007,7 @@ static int fastrpc_get_args(u32 kernel, struct
>> fastrpc_invoke_ctx *ctx)
>>   			struct vm_area_struct *vma = NULL;
>>
>>   			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
>> -			pages[i].addr = ctx->maps[i]->phys;
>> +			pages[i].addr = ctx->maps[i]->dma_addr;
>>
> 
> pages[i].addr is declared as
> 
>        "u64 addr;               /* physical address */"
> 
> I guess the other side of this is the same CPU in a different
> exception level instead of an external device, right? This
> could also use a clarification.
> 

Ack

>          Arnd

