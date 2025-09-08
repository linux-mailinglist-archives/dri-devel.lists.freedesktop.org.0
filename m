Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7831CB4838C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 07:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCAE10E0D5;
	Mon,  8 Sep 2025 05:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnP8YBIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F6110E0D5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 05:12:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587JhFka008832
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 05:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5W1iQ3MLJr+HmBQ8m//bgdDxKVBzjD+FmgkBQf6HICg=; b=LnP8YBIbCz210b36
 YKIq5DJH0+aW+aHpYoeEjp5Z1VYQnOpRAUhZvoltWyMzWHTKEYy1NtKbmCYlLH3W
 aXKObbQG/7CMtPU3RDlGFrhG1DHvyIoy1C64oaqoP6/pNbyTxkY/dLY9euaJqCNj
 Tc9RqAT5WS9UdH9bX4bG78MYWZ5G2ZXb28xcAtY9uXVdc0G11CM0JkvkF/mZG/mV
 D3ooxS01W5yRJLLAwnCqDrSH/VVSzgHUfv5PR0OjZhO5wHmG4q+/DHYuCUTsPcti
 Rfxvw3bwxoldR8WTHava47QistU9mpU9UBI/Jry3wDwlFOGtU7kngzKyiYVvE8ck
 9B28bg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1vbaqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:12:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77267239591so8344884b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 22:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757308336; x=1757913136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5W1iQ3MLJr+HmBQ8m//bgdDxKVBzjD+FmgkBQf6HICg=;
 b=uWIRguu4DTOCd+cs6gyD1RLWqS3iXOWIHMkierAiIFXxlqWzA9qHzZqg0j2q+VSTJ3
 +FBpWe2qvU/J4JNJfPQ+xkncF5RId3mEAy1Kq6ilj9XQb7+ppeFHjqrZkwkiGh/TmUzj
 F07VGu4KnhoR8OoFQlBx46ZK5pjwle2nqkahXaswciZ8AlYkI671t6stzpk4JS08wZkx
 38zfzPmN2SSFWViX3hAKFaMDLGOrZfAAZp5HE/AGsmI6YAFr6Re+t4VnH7KWWMWY+e/V
 h91h4NNms95/6CFSypxLGbMr31AJC3MMMV41wlizYG/ORzRlWIoh+GBQNkmDZBtmuTjH
 LsIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu9hi3VaG5yqTxhYDJ/olNU/6omur4ar0j4DRnGkvcPxFoQbu/IuvkW47wbIkDb1Y9WvccoFoEfoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwboPlYIvEHzrwjnVwhH9VV3jSYz+c/wWxnNSbPKPvsJBg3FvZU
 V93R/2AZ3MyHJtjP9NU6jelUqQOOpyLQ4/bGoyZL4WkHtplRM19Bz/jIiFD0yx62R2T+m8HgGtl
 neEFDSz/qoG/JRm7yoWbgd8R/k81xDcK3LK3MOseXvcKR6Asu2rA2rUGh0deUtsXkJ1Qm8e8=
X-Gm-Gg: ASbGncsUFLOUvJBNK+UYgu5YTG8+LtQd+B6UinKn2M3XB95tWk/jFfHPCzcaSJjRN48
 7AlfZ66HMiNr8sMgjNsn/rMlyENPziMSxC0FEQ/RLu4Vpquqly7AIbqw9PkLH+C3tU/LhfNjyQm
 w7YbaVsz5nvw4lZ6MJjJG/S9dBRMVW92nhRkTNfyoKVwbo58xVIPye+XhIUfdaGSrGx51w91c9Z
 EQ+Ct9b6uIbA9lKvY59xBGkViAhyKfKZDDmfXU+/VtOi1bIvRPX5RaxYwTkb724Y6QrfBrfzS4F
 4bGZShLgYDrKRUnjKKImN1DFMlVfQKG3v0HEzDwka8v1lpA3Iey6jnMTmb7Vy28KKDbW9fM=
X-Received: by 2002:a05:6a20:12c1:b0:243:a190:149c with SMTP id
 adf61e73a8af0-25340b18f5cmr9589803637.27.1757308335828; 
 Sun, 07 Sep 2025 22:12:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcobsSnfGakO3F8QbsZWMS7rekM1wlZPOOzIc5FjpObcRY7Bs3QOX0DDBjs19qqxadtd2DHw==
X-Received: by 2002:a05:6a20:12c1:b0:243:a190:149c with SMTP id
 adf61e73a8af0-25340b18f5cmr9589771637.27.1757308335266; 
 Sun, 07 Sep 2025 22:12:15 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4ec3a29e16sm21338075a12.24.2025.09.07.22.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Sep 2025 22:12:14 -0700 (PDT)
Message-ID: <7250915d-4611-4f81-a46d-b85e76185aae@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 10:42:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
 <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 57MYiG9SUirp_LoPYHAjVcvf0oSqBY7v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX4p3a1iqkQY4g
 rTF485NV0v9SCiGG3psGrAKW4VQkj7gUxJQThBwF+TQCPqAkebeTNfboDz1C45/FkTS6NBp703+
 3vyxybP7aSpTK0tMWR3pCB03NSRgk7IOcfETHcyFX4KXIVj0FkYUYhlQZnUANrPDPrON3Bkgqin
 cm7rl0iJAZBaHAxJ/pz914hXLb3q3xE5Eht2aMEfx44FCaBHy6vbc3NG7uitr/hltnu/GrIWNX0
 lEwjJ9ztLdhq88nosDrCScUzyk+CCdfLzHFwboilqlLIAFxIArlbkGWXTiXs2M3Dt/0GH/LdAm0
 b2ORmVGgT4gv1ISz94a+Za9b4CtVYHsbv5pINqUufb8JXFkL0J4XYrIo6fb62SS3OmCEM7qwEvb
 QmKNB1r5
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68be65b1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qNwnL0dspBSjYX0ecmAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 57MYiG9SUirp_LoPYHAjVcvf0oSqBY7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027
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



On 9/2/2025 9:42 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 11:03:35AM +0530, Ekansh Gupta wrote:
>> Current fastrpc message context uses a 12-bit mask where the upper
>> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
>> represent PD type. This design works for normal fastrpc calls but
> FastRPC (here and in several other places).
Ack.
>
>> doesn't work as expected for polling mode. To enable polling mode
>> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
>> context where the upper 8 bits are context ID, the lower 4 bits are
>> PD type and the 5th bit from the end denotes async mode(not yet
>> upstreamed). If this bit is set, DSP disables polling. With the
>> current design, odd context IDs set this bit, causing DSP to skip
>> poll memory updates.
> This looks like a description of a bugfix. In such a case, move it to
> the start of the series, add necessary tatgs and change commit message
> accordingly.
I'm not sure if it could be called a bug fix as there is no problem with existing mask.
The problem is seen only when polling mode is added.
>
>> Update the context mask to ensure a hole
>> which won't get populated, ensuring polling mode works as expected.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 0991ac487192..57e118de6e4a 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -37,7 +37,7 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> -#define FASTRPC_CTXID_MASK (0xFF0)
>> +#define FASTRPC_CTXID_MASK (0xFF00)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>> @@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
>>  		fastrpc_buf_free(ctx->buf);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
>> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);
> #define magic value
Ack.
>
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kfree(ctx->maps);
>> @@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  		spin_unlock_irqrestore(&cctx->lock, flags);
>>  		goto err_idr;
>>  	}
>> -	ctx->ctxid = ret << 4;
>> +	ctx->ctxid = ret << 8;
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kref_init(&ctx->refcount);
>> @@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  	if (len < sizeof(*rsp))
>>  		return -EINVAL;
>>  
>> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>> -- 
>> 2.34.1
>>

