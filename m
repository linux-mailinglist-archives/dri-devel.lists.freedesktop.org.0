Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D4AC039B
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981CA98C9A;
	Thu, 22 May 2025 04:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6NeIM76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43AD98760
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:58:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIvTqQ016872
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TIhaT5G+O4jv+4Rppitttslv/f9qcTHwZaazaxC2X7A=; b=M6NeIM76qR3RGYkW
 GH263vXADcQAt/tpY4hKa4NMSSfJL4Wdvjb+3b4g7kEAdKFpuR5TS3FDZB/RqdBR
 9U/llcDtl5PZ0WRCUX2I411dxc3cbtnOWUhmq20P88WiGiChTRiUogEhsPLmdSsc
 YdAuUwvCa5u2u0QimnB5DoPh50nOizjvjQYsqeRc0rcn5vdzVhg0Vgz/HsFYMbMh
 e8UxUtRbGn0i58z/slD/8U8OULsY1v6rH6SbNP1GJerIjHOksFvc242CeAiG4VS8
 ED/t4r8v9ghRJSuZReTVW+LhU81uaBVHYi62FhpoIGdikH8gDyozTBJkUNKiyh38
 Pbwgeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9w279-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:58:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-30f01e168b9so3371698a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 21:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747889885; x=1748494685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TIhaT5G+O4jv+4Rppitttslv/f9qcTHwZaazaxC2X7A=;
 b=rIXdOflNPcUdoz8uo83R20R4hfxc/+4x3g5OQbceVyMyytB+tn1TpLj4XxKz4Q8kbC
 SoHKAbMNGeXDIYOt6TzIqdDBnj3PMKC0ESapKOK0shjrKjzSEdEwQkHhCGKkKguGZ2YQ
 abd58TCVot6IzCDQvY7wJbOuco3HxEDF0iUQdJ6WbpbwGnAy2bcLzDh7xZHYYVaPAbBf
 7ibPHBabRRuiGy90pGMW1T++sEk3NP92N7HYdFmrLUcsJxuHlITV6nrZzx3xx0DEHaSq
 REvda66Xfp2QWIAZp99LSfDOdcfol/g0TPLjCtymv/5IM6S/QlAEZDOAdf6byuW326f9
 cJPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcMRoaOyR4epQ0vGlF1P+eMbUuAPvBB0pxb/Ej4McRX8XXLSxYjWzpKrdmv/RQjIYYCeEeCFygYQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAPsNW/MoAwiwRrFXOH0p9IIIlR82L9hlFpav4uEDG9Ld0lVrx
 Drt6EGCmYZ8WfgeONm1azmrWPgSlJbjq1M+QAGuh6AA53ubTSPc5zDAI28oHawQwUo5LuRT2lp7
 3C9iCVziQaUa6ir/5m3gZyj6vhO4/8QFVY7ym8wVSgjeRmIPrcG7QM9GG2GIk3Qc7IM8nevE=
X-Gm-Gg: ASbGncu2H/oR5zth4gWcyjsppq+coAU9+HiNZRaxSWUizD7AGbxxqD3ZEbqKiaSg4nS
 RYjAxkHgp3iQ9RmM83zAUa+AvXjhm/bgCPoBhKL4Q5UapJG5whyRbum0JjgKCS0pSzF04FZuCj+
 Fbd5i1B3EJwMbPSh+7jJvhMXXwgUMBTHvpkGfG4S5tJRv0UppEcnrGFdOCsvlr3UksyAha/yJ/O
 WJwrfNQxP/H0FB6bsrtE/Ek1pgcG2K5toUl6Dezow3v/qLSPT6JSkYrKsEdMb0+1Ts4pdZKusEU
 WTWgAjIdPFxvK8mUTgmLJ4iOgfvdVHX9sX1dFMY=
X-Received: by 2002:a17:90b:1d4f:b0:2ff:5267:e7da with SMTP id
 98e67ed59e1d1-30e7dc1e9b5mr35746006a91.3.1747889885315; 
 Wed, 21 May 2025 21:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgFlJx8rTQWPzKRRylxW+8edqi7ODCCkLtM14szkgvjdsmG0w/1FW82rK8UWnnM3Flwuu/Og==
X-Received: by 2002:a17:90b:1d4f:b0:2ff:5267:e7da with SMTP id
 98e67ed59e1d1-30e7dc1e9b5mr35745974a91.3.1747889884822; 
 Wed, 21 May 2025 21:58:04 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26f0824702sm9960426a12.62.2025.05.21.21.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 21:58:04 -0700 (PDT)
Message-ID: <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:28:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
 <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682eaede cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9ctudvHJBaFMfwVJERYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: bNClx8U_PQmocyRsnBbgz7wtw7DQ1pIB
X-Proofpoint-GUID: bNClx8U_PQmocyRsnBbgz7wtw7DQ1pIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0NiBTYWx0ZWRfX4TPC9ncuUMwh
 I1wtiFTxvkssLT3YO6yny/Ixq+GBZlOE06LWG8bbm3Q2UVrQgy0SkcHL7/plpqSlaaqjtSJi+Y6
 HtyB1hcylOMFkWrbFjk5LpaHrl93Z6VQz61Gt+ndC2Lw/gkC8kmHoLDSNgx6PdIxJuW0nXUK1lQ
 WaunXMJbqgibwP+ZihRpns2aoU/kRYbyXHtg8dXkOe02rjYF7EiQxD1QS9IfXVZoIDtUoZpb14U
 4x3q1P3IT1ieyhr0pMsyhmPmbqLBHIXH6xaj/SQFlK7c6LbvvWNl574PvdaM9KORVtRsu+yh4po
 8isTCqifarFXS5e9WoZ8iykvMLdw7MUQaKGUHfhMFCiDiycz8+qY4sMCmoS1zr2+DSNzR6c6F/D
 knfWMf7OVjFs0eqgPR2pdJcBHSAaurPBdv+9xWgN/qxsXgjeMsk48ggrSLgFUuIlhudku9OT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220046
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



On 5/19/2025 7:01 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
>>
>> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
>>>> The initially allocated memory is not properly included in the pool,
>>>> leading to potential issues with memory management. Set the number
>>> What is 'properly'? Which issues?
>> inbuf.pageslen is getting updated to 1 in case buffer is allocated,
> Is it a flag or some page count?

This is page count, based on this count, DSP with add memory to audioPD
pool. If it is 0, the memory is not added.

>
>> which only
>> happens if (!fl->cctx->audio_init_mem).
> You are describing patch behaviour.
>
>> Till now pageslen is always 0 irrespective of whether the memory is allocated
>> or not due to which audio PD is never able to use this memory.
> and the is current behaviour. So this answers the first question.
> 'properly'. Now, the second quesiton. 'Which issues?'

The issues is actually memory leak as the initial memory is never
used by audio PD and it will immediately make a remote heap request
as no memory is added to the pool initially.

I'll capture this also in the commit text.

>
>> I'll update this to the commit in the next spin.
>>
>>>> of pages to one to ensure that the initially allocated memory is
>>>> correctly added to the Audio PD memory pool.
>>>>
>>>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index d4e38b5e5e6c..b629e24f00bc 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>  		goto err;
>>>>  	}
>>>>  
>>>> +	inbuf.client_id = fl->client_id;
>>>> +	inbuf.namelen = init.namelen;
>>>> +	inbuf.pageslen = 0;
>>>>  	if (!fl->cctx->audio_init_mem) {
>>>>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>>>  						&buf);
>>>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>>>>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>>>>  			fl->cctx->audio_init_mem = true;
>>>> +			inbuf.pageslen = 1;
>>>>  		}
>>>>  	}
>>>>  
>>>> -	inbuf.client_id = fl->client_id;
>>>> -	inbuf.namelen = init.namelen;
>>>> -	inbuf.pageslen = 0;
>>>>  	fl->pd = USER_PD;
>>>>  
>>>>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
>>>> -- 
>>>> 2.34.1
>>>>

