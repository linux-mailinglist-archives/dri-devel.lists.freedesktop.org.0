Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F72ABBB82
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CDE10E354;
	Mon, 19 May 2025 10:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0kfU89D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2463210E354
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:54:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9IMZn008335
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q+ZG7E/JOJn3gru/ymdvfkkcuGEZIz+WemC28vQ15Do=; b=H0kfU89Dgc91NYIj
 KM+/AZi0xRIPAUlSwDUQ1l6+kfMTHkXkr535vmRotWFjrSKfcirx0mqaTGcDZWLD
 ylwIzHwS80SHxKQOYqLH12zlJie6wTsZBdgTaRqq3l5/mT5uQyafOsmf5q9XE4E8
 uM8JCWa33VfJUXvU1vK5wxW+tYFeMrcoCDuuFkh6xo/7Ex4VL0nxnneyDiv8G6U6
 vr8aezUtBiYGhcuskFwXYhR27a4GZ9QBf3d6K8L/UINNUOEFd6HM0TAacSMd/u5f
 kVzfE1btF9DlK99RzzqT0FIvU50tnYme4xfKkbD5Aj9TpxRImOcY1LW80KfenYMe
 O0dfug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym3s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:53:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74299055c3dso6137899b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652013; x=1748256813;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q+ZG7E/JOJn3gru/ymdvfkkcuGEZIz+WemC28vQ15Do=;
 b=sh1pY9GL2qMnVS+Yt80WU2aBTzTW7idAM5shYsEgNYNjSYNHcl+hRzOe16BUTqs8cU
 2zbQlyzy1CM9jlIwfTY3y7KP7o9rc8VrCSLHSoGo45T/srhsxEEPBWtETCFbA4xn0RzB
 WuF9MCIkW2T3MD6UHQLptVYKLuF3oZJLov8PHMTmL7y9qKN5Jx7VzlauVlYH4uj5nI0P
 xGcYrIIJhvejhmtjAKXeueCd/3kYGdQu2k+RJrKyPihA8i2B21OcT5s4kFYqzjueB1aL
 kEu6GZ5wGzMnQVLZS9Al7y5hKQ4JeZTnb5069dUX4Z8+aRnTeOM8LzIpSTqkhmGUu2TQ
 WRnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBOulxVyw+KvZAUnzYyrr+qIDC+z3igKfGksezEHD62TjpY390ob7Ip27BiQPKzzD9z7ToLXPfQyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhboBEG9cjxLTptESvFRQKQwVzj+IR+7ZqT7v8jq3z9KUVK3CS
 PxornZDNNoCspYrYz+KJTNE00Md3qA7pgrz4xMn0TX7crarxiHpUmv1K15vxkDE2Iuboyo6v0ub
 vQXBNNZ2en27FBTcSilkONsJ6t+1UJSMeBeBco5OIsOgeE5cUFw6bYTDCkYLomtXCRCNnes0=
X-Gm-Gg: ASbGncuBgb+BJFRjnGPpgzf68wbJm4T1en29GtxYhmIS8hZG0X97YwUeoNPJoW7j9Y6
 sg65a2T36b2ZB/rfVPynKIK12bRAter7lqWNXWFNiZ5U5MNgtUrHrxFg5Ln1IaNjiSrPgATzSdf
 /DqwchN5KI0y9X4of9w/4HIG0TaebnIPVJTN+SCwW0NWhAWNHnVo9mbTjhnT10hscvd5VS9mmXx
 2n95K7nPZeTbLNJ4vsXZZOc4uUVUXr3ltc8Rnv60S4zlz710puhzrzkJuSBqxdNX8CQ7SNWqYXs
 BG0orXQpHu9Kznby5Qi88XdQKfr49nryKozygQ==
X-Received: by 2002:aa7:9307:0:b0:73e:30dc:bb9b with SMTP id
 d2e1a72fcca58-742a978948dmr17785607b3a.2.1747652013139; 
 Mon, 19 May 2025 03:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrCA3ts80vPVWBuJh01f2u87CCoVZB7Kcjv8ZQtCorGnLjmsfhC9Kytj6R6pn2YQJ8MxSw0w==
X-Received: by 2002:aa7:9307:0:b0:73e:30dc:bb9b with SMTP id
 d2e1a72fcca58-742a978948dmr17785575b3a.2.1747652012726; 
 Mon, 19 May 2025 03:53:32 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a98a2550sm5924978b3a.167.2025.05.19.03.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 03:53:32 -0700 (PDT)
Message-ID: <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:23:28 +0530
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX4elp1DHYqW9r
 1omnvLISVlgUKAqT7d4zirsDVmsZXKSCN4rzpDy6IaqaYGpim51M2xCYdQQxDAVdoPgb+UMUj6n
 vNi1ALUOHjz4ap1oN/GNmIOIEYdC1PAh6AfEOzcLnL5kRS6RHKI7tI5Jj+JTxeeHg0YW8fxM+Pp
 CKccpsYv1zOfxZOObDPcTR80d9GP3+QEJA4isofonqwgaNeKe7MF3KQhrgFxhvCzo8Qf/01OCer
 FrIyjChqOfRosVp82jOTMTeekzDv6KDQr054d+5PeI2nAPPKJVfSH4mEQKTJK7Hooq+pEmv9RPd
 Og04VjGtBt9i3VkARnBQVQTqsnYXOOC2ZWeO1pGnBggcChTyyq1N24zWnT7ae7cEkNCxVWgFea/
 QGmkDyCWmZu/jG9VJIzUmn28Y5EcQvmy6wOU9wOB/DVcT8h4XtAAS52X3yd9XGIn6+9jpfWQ
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0dc5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rIkCaffdF0HaKj1PvZkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: BBlVJl6Jr7FtkLFU1qcGG13r6Qd8B9u1
X-Proofpoint-ORIG-GUID: BBlVJl6Jr7FtkLFU1qcGG13r6Qd8B9u1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190103
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



On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. Set the number
> What is 'properly'? Which issues?

inbuf.pageslen is getting updated to 1 in case buffer is allocated, which only
happens if (!fl->cctx->audio_init_mem).

Till now pageslen is always 0 irrespective of whether the memory is allocated
or not due to which audio PD is never able to use this memory.

I'll update this to the commit in the next spin.

>
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
>> +	inbuf.pageslen = 0;
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
>> -- 
>> 2.34.1
>>

