Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF76A9E6F8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 06:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4705910E338;
	Mon, 28 Apr 2025 04:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9z0ViQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B819710E338
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 04:17:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S44UTs001261
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 04:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PZ3fzL4HcVkGVGdarlOXbxBbY9F/k0HsU1g97DnzB14=; b=B9z0ViQKKtZAkTZ6
 IRSTouSh4wY350MBbCpesodEYNFeWtkOESUygAIzDZefACTV1+ph738lQmjzRo5a
 C924vF6TQH1j+tbGAb5rZluX9lDwqsgBqUaAH52hVvF5a1Xyg56hA8qmeTLgXElZ
 0Dr8RTLOBG16/TsaEkJYOGHhYuww6zQQI67CwlmKyPxwqwW8GeThb0BSGx+6dtJc
 2XJA8QLgRkpF9hBh/7adpILKRFNF1PwjxEbMhFwpxy+B3Gj039N8+8qAc0LkFt1e
 wI4AV/jDpElMzcPhVVyDxxn+mRzUJXr/cqkMYIR3yF7PcWowcJX7j3YFjmwNXXVY
 e2WhIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5dtft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 04:17:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b1c654f620dso1137756a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 21:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745813866; x=1746418666;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PZ3fzL4HcVkGVGdarlOXbxBbY9F/k0HsU1g97DnzB14=;
 b=SSkLboCN1kecYFmODoViWhYv+OGNOZOvg0y5PHC78lnk9+5YMMSi+6JsNODsRakSFZ
 4yC8c2ccSXp9K4WQl7E8Syw6zxXmQcPZn51SNp4GHX8rVuhmjf1+EHBOVaA0suZxxZir
 XsVRZP0J0l96lD/N5yI4Tekx5n4aKuLhmmplRPfcd9jiWjgVFET6bFoTMIS9KbQMSfqV
 p4KPLplPSdDX9qSF26rqumgnllKQtzN1XT1FWyWyI0flvk2b6naEmo37h5W0IF9hQq6J
 WIFJw2qTOk6sF17BbGuNkAh85GHFhL2aaynxi3vMsnG//cV09mnWMHc8/DWJM3icOysj
 uMQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFtxUwZEz8U4pRk8dzTavq/ZObrLwzG/zsJ+JKIILsFSS3PVd9HuVX5hrBSRKpYn369lsAbvYRVKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwWchEonkF6eE1LXAiBc8XvLvkKUbzb7Hr0eYPlzMqMSxGghf+
 85mCsCyGz3F/D170yfz5SXysnAEia+zCRuwkxNLoS3l9uacvEFrbwE+xafktNgwvHRCiIZSnh94
 WZDRcDQ7GNbdF6zmM7gYlD6MWb8nHlTNYEuOqQ7KXPr6sMLcGrMEe35pIaO5OuzIXZQ==
X-Gm-Gg: ASbGncsw64npQ4wdGtKZHuTqoWu6rd94do7pzp9DqTh9je0NZ4uF8Kv/xea4UBOuslW
 p8lp8RtHzsllwvyCGEa3by0WxUbIMMO+9/VvB7wrQi8TV3Rj4F6nTlwjOqxslKWdXScrb4tSmXl
 QDe8+hhiTS2xk0IXCoUp3lIsjExkFLGXPryGW4l2LUraC6On1rirWTvTfPB6Sg36t1QA3tLnqe2
 KKf4E+TBY10epgO5pq4fFkMExNcdgkhcKBAb4T0LuNguxZaOd5SAGXLtYGdmBWxRpKTv995IPfA
 YHGYavC3bPU2YreQHdSFUP14fqD1G/v/EmhjjXu9tx6BOsE8PYdumkFgrXc7x2xUIb6tAOAe8EO
 fXaJOuRch7Q==
X-Received: by 2002:a05:6a20:12cf:b0:1f5:9cb2:28a2 with SMTP id
 adf61e73a8af0-2045b71a4cemr13296552637.19.1745813866019; 
 Sun, 27 Apr 2025 21:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ8EouDhnIl3rD4Up93sr95VLA6mPFFHn6RLeSYV8Un05ABwCBuLj3IqxV5a/H6SjRdTvo6g==
X-Received: by 2002:a05:6a20:12cf:b0:1f5:9cb2:28a2 with SMTP id
 adf61e73a8af0-2045b71a4cemr13296521637.19.1745813865572; 
 Sun, 27 Apr 2025 21:17:45 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e2593f426sm6968454b3a.43.2025.04.27.21.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 21:17:45 -0700 (PDT)
Message-ID: <cbfbc33d-5345-4a8a-9f11-bda6acfdffba@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 14:17:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-4-7f457073282d@oss.qualcomm.com>
 <aAZKQyslOSs-A3Jv@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aAZKQyslOSs-A3Jv@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zuu3ANy0UzrLfbW0aA0ION6--gpldkN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAzNCBTYWx0ZWRfX6ewM8wUu1qKu
 rUoQ1a7eOzcFWjoX7D1SQS1+SOerCLbHOO8TP2xEpDwbNVIZZFI65W6yOSP/SpM92UKuKr1YNfQ
 7mCkIlWLpKt2H8h519vLi2zm6UxcYb1Ywrlqjh/gBGbV+TVyzIAu38yUhoublEX37Zvw1L2COX4
 1ScmyQOAqsfaLWQyi0k4XhakuteWg21t9fobZts/kB8zNTawMIKe1rrJcfOSR7r5545W/xZxlOY
 o1QgFYcTuvBKijTnLsHlu/tRn7MFPdREYlXHpf/SXLKfCJrq8lKMahlP0LOUrqsSlPitPg+aFzY
 wZElP84RXNCYOmS/8FceXLJBDmOmLlwcM4D1b5IFDgp9DzWYiUwJu0yFPASrZlNZNsin76xnDSb
 ijN7Vbctx/izcfqzNQ6kdra5FZI+VCdYxhvTqn35ff7SVNWSWjAGbEMhiJxYtpG4m28Oe9R4
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680f016b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4U8CVRUIeS7CJI52oQMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: zuu3ANy0UzrLfbW0aA0ION6--gpldkN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280034
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

Hi Sumit,

On 4/21/2025 11:38 PM, Sumit Garg wrote:
> On Thu, Mar 27, 2025 at 07:47:26PM -0700, Amirreza Zarrabi wrote:
>> The TEE subsystem allows session-based access to trusted services,
>> requiring a session to be established to receive a service. This
>> is not suitable for an environment that represents services as objects.
>> An object supports various operations that a client can invoke,
>> potentially generating a result or a new object that can be invoked
>> independently of the original object.
>>
>> Add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT/INOUT to represent an
>> object. Objects may reside in either TEE or userspace. To invoke an
>> object in TEE, introduce a new ioctl. Use the existing SUPPL_RECV and
>> SUPPL_SEND to invoke an object in userspace.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/tee_core.h |  4 +++
>>  include/linux/tee_drv.h  |  6 ++++
>>  include/uapi/linux/tee.h | 41 +++++++++++++++++++----
>>  4 files changed, 130 insertions(+), 6 deletions(-)
> 
> Minor nits from me below, otherwise this looks reasonable new IOCTL
> interface to me. FWIW:
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index bc862a11d437..d39205128b09 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -397,6 +397,7 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>  		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>>  			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
>> @@ -415,6 +416,11 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>  				return -EFAULT;
>>  
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
>> +			params[n].u.objref.id = ip.a;
>> +			params[n].u.objref.flags = ip.b;
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -488,6 +494,12 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>  			if (put_user((u64)p->u.ubuf.size, &up->b))
>>  				return -EFAULT;
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
>> +			if (put_user(p->u.objref.id, &up->a) ||
>> +			    put_user(p->u.objref.flags, &up->b))
>> +				return -EFAULT;
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>  			if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -640,6 +652,66 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
>>  	return rc;
>>  }
>>  
>> +static int tee_ioctl_object_invoke(struct tee_context *ctx,
>> +				   struct tee_ioctl_buf_data __user *ubuf)
>> +{
>> +	int rc;
>> +	size_t n;
>> +	struct tee_ioctl_buf_data buf;
>> +	struct tee_ioctl_object_invoke_arg __user *uarg;
>> +	struct tee_ioctl_object_invoke_arg arg;
>> +	struct tee_ioctl_param __user *uparams = NULL;
>> +	struct tee_param *params = NULL;
>> +
>> +	if (!ctx->teedev->desc->ops->object_invoke_func)
>> +		return -EINVAL;
>> +
>> +	if (copy_from_user(&buf, ubuf, sizeof(buf)))
>> +		return -EFAULT;
>> +
>> +	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
>> +	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
>> +		return -EINVAL;
>> +
>> +	uarg = u64_to_user_ptr(buf.buf_ptr);
>> +	if (copy_from_user(&arg, uarg, sizeof(arg)))
>> +		return -EFAULT;
>> +
>> +	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
>> +		return -EINVAL;
>> +
>> +	if (arg.num_params) {
>> +		params = kcalloc(arg.num_params, sizeof(struct tee_param),
>> +				 GFP_KERNEL);
>> +		if (!params)
>> +			return -ENOMEM;
>> +		uparams = uarg->params;
>> +		rc = params_from_user(ctx, params, arg.num_params, uparams);
>> +		if (rc)
>> +			goto out;
>> +	}
>> +
>> +	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
>> +	if (rc)
>> +		goto out;
>> +
>> +	if (put_user(arg.ret, &uarg->ret)) {
>> +		rc = -EFAULT;
>> +		goto out;
>> +	}
>> +	rc = params_to_user(uparams, arg.num_params, params);
>> +out:
>> +	if (params) {
>> +		/* Decrease ref count for all valid shared memory pointers */
>> +		for (n = 0; n < arg.num_params; n++)
>> +			if (tee_param_is_memref(params + n) &&
>> +			    params[n].u.memref.shm)
>> +				tee_shm_put(params[n].u.memref.shm);
>> +		kfree(params);
>> +	}
>> +	return rc;
>> +}
>> +
>>  static int tee_ioctl_cancel(struct tee_context *ctx,
>>  			    struct tee_ioctl_cancel_arg __user *uarg)
>>  {
>> @@ -695,6 +767,12 @@ static int params_to_supp(struct tee_context *ctx,
>>  			ip.b = p->u.ubuf.size;
>>  			ip.c = 0;
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
>> +			ip.a = p->u.objref.id;
>> +			ip.b = p->u.objref.flags;
>> +			ip.c = 0;
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -807,6 +885,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>  				return -EFAULT;
>>  
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
>> +			p->u.objref.id = ip.a;
>> +			p->u.objref.flags = ip.b;
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>  			/*
>> @@ -887,6 +970,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>  		return tee_ioctl_open_session(ctx, uarg);
>>  	case TEE_IOC_INVOKE:
>>  		return tee_ioctl_invoke(ctx, uarg);
>> +	case TEE_IOC_OBJECT_INVOKE:
>> +		return tee_ioctl_object_invoke(ctx, uarg);
>>  	case TEE_IOC_CANCEL:
>>  		return tee_ioctl_cancel(ctx, uarg);
>>  	case TEE_IOC_CLOSE_SESSION:
>> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
>> index 8a4c9e30b652..26b8795cb678 100644
>> --- a/include/linux/tee_core.h
>> +++ b/include/linux/tee_core.h
>> @@ -72,6 +72,7 @@ struct tee_device {
>>   * @close_session:	close a session
>>   * @system_session:	declare session as a system session
>>   * @invoke_func:	invoke a trusted function
>> + * @object_invoke_func:	invoke a TEE object
>>   * @cancel_req:		request cancel of an ongoing invoke or open
>>   * @supp_recv:		called for supplicant to get a command
>>   * @supp_send:		called for supplicant to send a response
>> @@ -97,6 +98,9 @@ struct tee_driver_ops {
>>  	int (*invoke_func)(struct tee_context *ctx,
>>  			   struct tee_ioctl_invoke_arg *arg,
>>  			   struct tee_param *param);
>> +	int (*object_invoke_func)(struct tee_context *ctx,
>> +				  struct tee_ioctl_object_invoke_arg *arg,
>> +				  struct tee_param *param);
>>  	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
>>  	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
>>  			 struct tee_param *param);
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index d773f91c6bdd..7cc57e84db95 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -87,6 +87,11 @@ struct tee_param_ubuf {
>>  	size_t size;
>>  };
>>  
>> +struct tee_param_objref {
>> +	u64 id;
>> +	u64 flags;
>> +};
>> +
>>  struct tee_param_value {
>>  	u64 a;
>>  	u64 b;
>> @@ -97,6 +102,7 @@ struct tee_param {
>>  	u64 attr;
>>  	union {
>>  		struct tee_param_memref memref;
>> +		struct tee_param_objref objref;
>>  		struct tee_param_ubuf ubuf;
>>  		struct tee_param_value value;
>>  	} u;
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index 3e9b1ec5dfde..8642ce7e4772 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -48,8 +48,10 @@
>>  #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
>>  #define TEE_GEN_CAP_REG_MEM	(1 << 2)/* Supports registering shared memory */
>>  #define TEE_GEN_CAP_MEMREF_NULL	(1 << 3)/* NULL MemRef support */
>> +#define TEE_GEN_CAP_OBJREF	(1 << 4)/* Supports generic object reference */
>>  
>> -#define TEE_MEMREF_NULL		(__u64)(-1) /* NULL MemRef Buffer */
>> +#define TEE_MEMREF_NULL		((__u64)(-1)) /* NULL MemRef Buffer */
>> +#define TEE_OBJREF_NULL		((__u64)(-1)) /* NULL ObjRef Object */
>>  
>>  /*
>>   * TEE Implementation ID
>> @@ -158,6 +160,13 @@ struct tee_ioctl_buf_data {
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
>>  
>> +/*
>> + * These defines object reference parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT	11
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT	12
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT	13
>> +
>>  /*
>>   * Mask for the type part of the attribute, leaves room for more types
>>   */
>> @@ -195,15 +204,16 @@ struct tee_ioctl_buf_data {
>>   * @attr: attributes
>>   * @a: if a memref, offset into the shared memory object,
>>   *     else if a ubuf, address of the user buffer,
>> - *     else a value parameter
>> - * @b: if a memref or ubuf, size of the buffer, else a value parameter
>> + *     else if an objref, object identifier, else a value parameter
>> + * @b: if a memref or ubuf, size of the buffer,
>> + *     else if objref, flags for the object, else a value parameter
>>   * @c: if a memref, shared memory identifier, else a value parameter
>>   *
>>   * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>>   * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>> - * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> - * are used.
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, TEE_PARAM_ATTR_TYPE_UBUF_*
>> + * indicates ubuf, and TEE_PARAM_ATTR_TYPE_OBJREF_* indicates objref.
>> + * TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members are used.
>>   *
>>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>   * identifier representing the shared memory object. A memref can reference
>> @@ -411,4 +421,23 @@ struct tee_ioctl_shm_register_data {
>>   * munmap(): unmaps previously shared memory
>>   */
>>  
>> +/**
>> + * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application
>> + * @object:	[in] Object id
>> + * @op:		[in] Object operation, specific to the object
>> + * @ret:	[out] return value
>> + * @num_params	[in] number of parameters following this struct
>> + */
>> +struct tee_ioctl_object_invoke_arg {
>> +	__u64 object;
> 
> nit: I would rather rename it as: s/object/id/
> 

Ack.

>> +	__u32 op;
>> +	__u32 ret;
> 
> nit: do you think ret_origin will add value here? It is useful to know
> from which stack layer the error originated from.
> 
> -Sumit

QTEE does not provide such information. If we add it, the only possible
value would be TEEC_ORIGIN_COMMS. QTEE uses a different error code range
to achieve the same result. Errors less than 10 are generic errors,
anything 10 or greater is a TA error, and negative numbers indicate
transport issues.

- Amir

> 
>> +	__u32 num_params;
>> +	/* num_params tells the actual number of element in params */
>> +	struct tee_ioctl_param params[];
>> +};
>> +
>> +#define TEE_IOC_OBJECT_INVOKE	_IOR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
>> +				     struct tee_ioctl_buf_data)
>> +
>>  #endif /*__TEE_H*/
>>
>> -- 
>> 2.34.1
>>
>>

