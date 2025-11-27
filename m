Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B6C8CF4E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 07:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8048710E15A;
	Thu, 27 Nov 2025 06:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvrWlWTH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UE11kI0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707C510E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 06:51:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQNuOe81668686
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 06:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QeCsF15G8E8OYcfgLAnaby8E0j0DSoBR+9k/GnsWTmE=; b=FvrWlWTHGhCqOZvz
 a046/rTpYOSHJqYf6uZASxPpYEJf6+/oiX8RaDeBA+Kk4OrJtaQGQ3JDzHfoHH/y
 v4hlpK278CfoitsibhHpQHUzP5WnvwWcpuNdLpryDIrTjuXVsTpr1d2CZLIZfTTg
 qrO8+ooryzrJCKNmdFenxT0Iztyz+71tK+iNd/ewS72ssp9goa4M2dnPqHr66aJ0
 Cori2WKejZ94z3WHWDWyQMprev1Qguh4atpkx7X+MClVh5S5NWenkQnMwPfMIBHB
 Knhp8gCYHw4b+GqFOE/Mopue5yOcuI5eycuPGPdraZeW2mMwvJ6mSbZPR9tLq6sF
 uRI3ug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmts7b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 06:51:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3437f0760daso1068505a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 22:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764226315; x=1764831115;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QeCsF15G8E8OYcfgLAnaby8E0j0DSoBR+9k/GnsWTmE=;
 b=UE11kI0GyP18EWWnTaWZb0UKu4r6dLXaZtTbgZrQT8LHG+jPajATjwTJZecURZFDML
 eFX3ro2UM2AjxvDn7cie/mc5cWzpnnZjo4Chj+472AquZU3q3dsMx8I9BeoJUsuR/rit
 eL2dqE5Wm4LiExeszNxGIg9Jhih34/6HLfxpgZtv+jw89JfR+6q7CFra17XHASM0U4g5
 OxPZHLriJGwQs/qEOyY6z1/4FaetcUsx3FktB99Ng5qbielkuQczm9//hVgvi91+9VuS
 nKroWg8YA8YmcXWAHMsNnblH7HU/C2cxHHifwH1AZfGhTuJqZIvqPEeS/aNQKC9mTkff
 qOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764226315; x=1764831115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QeCsF15G8E8OYcfgLAnaby8E0j0DSoBR+9k/GnsWTmE=;
 b=PDrTNHf+iY2b9hZ5gGUyFvjbgb/6HDfOEapYAvKR9BNJmXKYF2hVHYNq18MEfhyOto
 5Y+JfCj4cMLxRbKF8uSCOWQ2VrG9Ben1H2/77iaKYL5jigPTl8qHnVL0r7VQ9/itBtGl
 3GcuTHrFScd+o00OWgN4lRT3btv8GCgvVlExQakhyxiDx5eMvRmZBlTy0lSKxYTloVGK
 qFGEkFcDidHJTMXe5SqUmBJIAtwsZPLuNGgUQUMh++IC+H0QLD9stRmLqqUVTZNzMXeO
 TfohUnPCt8x1R0yrUY0hRkrT6BjHy9JxAwdUIPyYLR7jScTMA5Dns+5gbsX01d75sBlJ
 bDxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXJHpLt/DX6L1so2w2BhDoMbIuefONyp7N3Vinyn5zEpS9xxfDZ19raGvaKPXs2nfXJjyasGcgbGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd8auxTCAmghED30HRtjkzBigAQA2VIiAIXmtpj1OV+Xcn00mb
 2007rOP61V+TT2C3st9kYlhFyeu9qRJQa9MTQx1bMz/tiKYI7wO9AUWYYHeY5Y3U4LwqWyDu4TD
 E139wL8EExEYdlTUsip3uvuUgB1xUHPjcf3pWdZPiZ1ykVT9Z2ZQdlEUyDp880kM71zOoJ24=
X-Gm-Gg: ASbGncvK/ouDlxQTLCKvmPcUDe1lsjOel2O62q3KdfEma6WkXcLPb8RJufG+9WJkWFa
 s3EuZPYeFMpKPNvO7v3rzain9vIun/taBJdvvfkhV0wIuTCqeM8IfprJ9PuG06UnPUqGVXjZLia
 /XwT6vUbQSnMh9nxHmqzi35TZ3t70HbjcDAovYGoAFR54ihY3+v/OqVsui1wu9sH2yNk0BCG36L
 kltzGdy8rODXxJzXYi8hPAmRP+LqbGv+I5uMY5bfu+2etHVBP1mxmDOY2oJOxzS47QcYJw2neT0
 UsxuaCrcfud4oBnRpC+1Ie7VnndZYsVyyTa/48ocSGHUOfN3MUds420J9nm2HaHl3OFu6gyqfWx
 qbnlb7+drvOw5CUxS8zIa12U5iH1kIVEGBaFEqXZa
X-Received: by 2002:a17:90b:544b:b0:338:3d07:5174 with SMTP id
 98e67ed59e1d1-34733e4cd33mr21162071a91.5.1764226314726; 
 Wed, 26 Nov 2025 22:51:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXezn/5XXLOVzK0pYVsSVltQLd6doH911vDCSYKCuXDYyKkHcfioFnRNBO7KDkL3rEIVSqRw==
X-Received: by 2002:a17:90b:544b:b0:338:3d07:5174 with SMTP id
 98e67ed59e1d1-34733e4cd33mr21162043a91.5.1764226314202; 
 Wed, 26 Nov 2025 22:51:54 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3477b20b5d6sm765741a91.6.2025.11.26.22.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 22:51:53 -0800 (PST)
Message-ID: <b3bb2b91-c938-4f7b-bbb7-52b18743b696@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:21:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-3-ekansh.gupta@oss.qualcomm.com>
 <jjzyh65ym74si2u7ig5gtckffma522ebjbeqyr4ym2sddox6iu@l7uion5z2rvf>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jjzyh65ym74si2u7ig5gtckffma522ebjbeqyr4ym2sddox6iu@l7uion5z2rvf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=6927f50b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=--HMqWDFDORZCQyJXVsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA0OSBTYWx0ZWRfX7OiR07lHnB6O
 TQ2HxGTLN3i95H5SFif1OAv3RtM1AFtyZj3yRA1ZKfr+SY8fDlJdyqAr/XhZCdM2C4LM9dhfmyx
 bQJJ0Epe4S2FxquajuBZzVMDCHp5SXAkA2jhuzwD24Zn0v7TssptEYBCJNPwQJ1FdWfvb2Hthdv
 hiXZFz2ieQ14pVht8FlFz1+NLvLjn039v+Cv/7tYcaXBTwxkRvDYYrSiBca1RGl7z1EGaowIStF
 hCxb0cRXxKsu+kuUiTOMXW4E1PWmyI6gR291MOTib9f9dL5ewUkV9jvcXeHxC8ymXY8704sAVbe
 J/CVNFSoQxlfIodD0o+Z0GJ3j+7mj1r1+x0I8f6iSwVsnMw1XzpYnNt7FVGv9w8DezV/pF3otZS
 vN19BY8Dmq56LpGKxTZKX3dR/nhbwg==
X-Proofpoint-GUID: yxZe7Y3gAttQBoq1EfdAkaeuISAQCoDA
X-Proofpoint-ORIG-GUID: yxZe7Y3gAttQBoq1EfdAkaeuISAQCoDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270049
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



On 11/19/2025 1:59 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 12:11:10PM +0530, Ekansh Gupta wrote:
>> Current FastRPC message context uses a 12-bit mask where the upper
>> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
>> represent PD type. This design works for normal FastRPC calls but
>> doesn't work as expected for polling mode.
> Doesn't work why / how?
Explained this in the next statements, I'll rephrase this.
>
>> To enable polling mode
>> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
>> context where the upper 8 bits are context ID, the lower 4 bits are
>> PD type and the 5th bit from the end denotes async mode(not yet
> What's in the middle between bits 5 and 8?
It's unused as of now.
>
>> upstreamed). If this bit is set, DSP disables polling. With the
>> current design, odd context IDs set this bit, causing DSP to skip
>> poll memory updates. Update the context mask to ensure a hole
>> which won't get populated, ensuring polling mode works as expected.
>> This is not a bug and the change is added to support polling mode.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 679cd8997a00..ccba3b6dfdfa 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -37,7 +37,8 @@
>>  #define FASTRPC_CTX_MAX (256)
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> -#define FASTRPC_CTXID_MASK (0xFF0)
>> +#define FASTRPC_CTXID_MASK (0xFF00)
>> +#define FASTRPC_CTXID_POS (8)
> Use FIELD_PREP instead.
Checking this, thanks
>
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>> @@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
>>  		fastrpc_buf_free(ctx->buf);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
>> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> FASTRPC_CTXID_POS);
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kfree(ctx->maps);
>> @@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>  		spin_unlock_irqrestore(&cctx->lock, flags);
>>  		goto err_idr;
>>  	}
>> -	ctx->ctxid = ret << 4;
>> +	ctx->ctxid = ret << FASTRPC_CTXID_POS;
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	kref_init(&ctx->refcount);
>> @@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>  	if (len < sizeof(*rsp))
>>  		return -EINVAL;
>>  
>> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> FASTRPC_CTXID_POS);
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>> -- 
>> 2.34.1
>>

