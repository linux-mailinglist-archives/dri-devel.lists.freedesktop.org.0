Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9BAC03D4
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433039ADF4;
	Thu, 22 May 2025 05:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgEz0WyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B539ADF2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:11:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LJHZlK001758
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yH0tvCc3KicUvHT3d3nDCnjROeZOFwEqUxq5ncMRAaQ=; b=TgEz0WyINhyGWgPz
 HGsDvSNeAOndlR+CKWxEVyTPCzPDJmcKZFaADEXCk3a4ISnBj7345Tv1JKqwt96u
 5P63qIIkXGcAck20iAxxQ5zGRPcDqspZ8zFqNVtSy/Eu5aJXKTLYcX0JJY02J32E
 zwRDrW62UrGJeFBN6o8t2sMxccNUgxTJ5AEvYsgggtCXNz4nD44jBHs2vnHs0Tqq
 TYdo5yEpLIzu3G4febfZ6XC5qKy/YMLVJ4IQPH6wOX0Um8bI44k8izE+bL1VayhL
 SBl9oPqRaVPiG9XgoJsNq5Racb8thhHeIzWnos3yNjD1J7FDyh473IFAnMYhtUBJ
 M9d4XQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6w1ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:11:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7377139d8b1so6572076b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 22:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747890707; x=1748495507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yH0tvCc3KicUvHT3d3nDCnjROeZOFwEqUxq5ncMRAaQ=;
 b=HBO0a9Q31n4Qu87q/d6H/e4UrDQ/aipeeKfOFZ8/qbOThvB9pqIAWkzPCyRydPoPE1
 c3x23s/JJVecXZMUWVsTwGxmu5Hy89Ta2wclqjniup9Qy2EcHgYWyGG12v1a5wDOAfOE
 vvjNz+5EIU+zaGV5EBloXMF92J3kKNMPCPG3/X75YMzj2uIXp8XJQnbJxeV6Wiu46S4P
 hQB8i2Ns78TM9rzjBAWBPuJfpKFWVN6I0Qqv6aDpEunu7WyI7hyDRrlcO/f87fqX3oeI
 bErS9M1w4+xqdIl7aYx6FnY7JJRNwB/xTt5a2tC5TNce+dSqGHRlgVYIMV8Zw/tQu8N3
 rrDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNDBPo5B1CDnnrqTkG5Gj+41t6dCJq1UM+28ctm0FNALKZsIPcMiyR1Je6oE0vRHRUfK6S/S3WNAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvZLVwSNkHnVnFCjyrUkxc1tqRYDO4pf/XeFWG98Z75l7Wawnu
 eE/9q9lk4TuWy41ITnbRzhHBmgdNAS+3RkgnRv3CPqftkxyM+VMIZNUqq7iZ1Tu1J939AOMlAC7
 S2sQHGwc0lHKxx+V7UDVjUeWuKJ0CW6zeZaeCOBfQX12wVboYS7HyQRn766JJfN96Vz/h258=
X-Gm-Gg: ASbGncsOqMGULmi/As66smbuokW9i6MqNUWXLYK6380nmj3fmR27+a05Vv5zdYVOzMJ
 Mdqh5KrlVBXvXVKxWBXjzcis9sHAhljpA2gESMmpGtbrpo+E7/cGSjkfe/W5/g3H15N7YzSnSa7
 nT5OE6JGnpXI1g9Aj68O9oSKu+eBniBO4mow3L44+BbnIIsoKdulrnNUj0aHdxz8U6EDhACBk1/
 0ZEMt16//rrDsrfkNuwPnyWQlfQGNwW4SGijr5OAyjJ3tMmQ8gX990pitCQOYgMOynq4OZ+D/Xp
 YmZxobuymKD88OHDOkqsH4Jh7Kt+sZ8OHKbuWqk=
X-Received: by 2002:a05:6a00:369a:b0:740:afda:a742 with SMTP id
 d2e1a72fcca58-742a9613980mr33868061b3a.0.1747890707060; 
 Wed, 21 May 2025 22:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG/dTVa4GXPqwNUeSN0A0GCG5iVoz9ExoAxjf6/frJwSzFAr6YcpgnUtwrLlA4Z+C+vjNWhw==
X-Received: by 2002:a05:6a00:369a:b0:740:afda:a742 with SMTP id
 d2e1a72fcca58-742a9613980mr33868031b3a.0.1747890706658; 
 Wed, 21 May 2025 22:11:46 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a982b853sm10824726b3a.98.2025.05.21.22.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 22:11:46 -0700 (PDT)
Message-ID: <e9f540ce-725f-4def-9b95-edb86429e96b@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:41:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iK1CPSuVcuhwdZbUGwMgLTZg5--kJBZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0OCBTYWx0ZWRfX4NmJyEh7drZN
 YV6+Dov0ZOL+iLhOoyFhtW59W/iwK2yarCfManoPk/d8a2cMK6fouVJm2Ujc/NwdVaF/Py1aW34
 E8NKVrS8tvxzi/WnBubCubRTL6elTlLXTkywkxWocOugOupm6fCO9JcEJf7og82BBzYxzklmgp0
 tKIyH+Cgpa0rGBVmdZbrsrPCX3DWaEilHUH6MpH3G1+cD5WtB4ypUbz8GW4H7nXu0rP7+3Ua+k7
 rc42NcxHZILsfYnB5wwWfZgjbedAy3eu8XVy1E9MDWdd9xSCd7yWrDj/79M+4PcBkuiN0B5krC+
 fUEASPZzbc0t8uaajHtGOgPE6MJqxjgNPrnt9kSBqp74AkJzs8wNMeTy+PIqmwBBTrz5HUTAQ+0
 NdwjWuhlmTmMZpjtS7vd1TP26yJeVGr4gljNl32fzZOlhcGCtcHkF6BYafYDZbhNHcYU7Bpy
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682eb214 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Z1Fpul6eystrl0X_OCAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: iK1CPSuVcuhwdZbUGwMgLTZg5--kJBZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220048
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



On 5/19/2025 5:11 PM, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. Set the number
>> of pages to one to ensure that the initially allocated memory is
>> correctly added to the Audio PD memory pool.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d4e38b5e5e6c..b629e24f00bc 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  		goto err;
>>  	}
>>  
>> +	inbuf.client_id = fl->client_id;
>> +	inbuf.namelen = init.namelen;
> inbuf is not used till the invoke call, why are we moving these two
> lines here?

I just moved it above so that the pagelen is updated properly.

Would you prefer storing pagelen to some local variable and then eventually
assigning it to inbuf.pagelen before making the invoke call?

>
>> +	inbuf.pageslen = 0;
>
>
>>  	if (!fl->cctx->audio_init_mem) {
>>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>  						&buf);
>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>>  			fl->cctx->audio_init_mem = true;
>> +			inbuf.pageslen = 1;
>>  		}
>>  	}
>>  
>> -	inbuf.client_id = fl->client_id;
>> -	inbuf.namelen = init.namelen;
>> -	inbuf.pageslen = 0;
>>  	fl->pd = USER_PD;
>>  
>>  	args[0].ptr = (u64)(uintptr_t)&inbuf;

