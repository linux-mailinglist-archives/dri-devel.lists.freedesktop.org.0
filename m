Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F934AD63FB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 01:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63E10E74A;
	Wed, 11 Jun 2025 23:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uk92e2Re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B40B10E74A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 23:45:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BMFCYq032126
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 23:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kL/Liu/GqjPKUC4NnGw8PIVD+TNpkbMa+VGstZWsdgM=; b=Uk92e2ReIMb6itzQ
 XyMYOmDFaHlbqT8QN2wh6CaJU1Ifca/48IbFjhYf0+tLT2k/ooeR962mAS9uSgn6
 DBV5FAp6c3B42an+/WXAF9p+uIsKm1+2v4BNG7WjwiMjdyvCyrVp9uyysSO6g/xf
 HczRBQrYHaWmK9pVwNKXeKHOKCF9hCS6vi+dtdQl+FLmpy5vNSgx9HWNsklA1AJP
 XxdFs/vJVAzCr701hqw4eR3RE0cIBgJnA24yZhpF+f4cUgjGKHvQ8nGElozBvV6O
 BLZ+YX0+TxXymijBPxCu7AITs8GciqOOUAq/+qdgxb2jKmiEgMkK/IY2U9wf8+5Y
 XB2lBA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdwr5qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 23:45:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b2c3e576201so1152095a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749685520; x=1750290320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kL/Liu/GqjPKUC4NnGw8PIVD+TNpkbMa+VGstZWsdgM=;
 b=kGrDXHvfxrvsB8IiWXdDsSqb8tk5nskPn5GyhOJ9Wa+fJq/dbCh+EVrF/xZohlj2bA
 9/LjowcrKRvW++zWLgf7GF5glPe1On1Tajfdhh75xDI2RZX2RZavEcLqzux8CUVFxQ2b
 hbkV1Yq/8UuZLJEwWIQ8pp0LQdB+OAFPbKxkDrONedNUyQVHusyDLBfkiht59pHH2QvT
 ID7buNkpWv3A5Y7YDRw5UY6mC/wXbGNCty2VPtCsoErKE/DG9jocy6gb++FLCnv6NiSP
 uxCAsumSN2qSuWZ9wo3pDwWVgREi8X+aR+O76H4A2AOU/FyAyaESbv1+ecZMNSNV0cSb
 u/KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeAaOPlP5pdVDMurVK/CwiDgb30Ars2DC2zYGH9jY43SVX6+Ru/+7tKtuNziGOb7XkvP6ecscxTFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUZfkTAvzTN2J8//sJoBuoSfY/1qtRPsuSfSemEhgvr3r1jhwD
 gW1bH6LjMsdVVA1bg0vFIHEfP7wdDtGgFtWv1gSOvzp7sUUkpgfbJU7Yz/2r3U1bfck2obZKAa6
 OKt21X0DTR5FDP+eqlDQTgxoLFOgmFoYiN07kpuX40YGSjXeuTaoDh20kdZkOvaevEqoAnw==
X-Gm-Gg: ASbGncsj9MzZCKQEFKKTCmYBUrveuMDRDciGerAKdVkhXC9ElWJIBH0lipFukiKhCl0
 zccwu2X2rwEePl7GjlEJXjvE19sAqzy9Orrc1jPJT39hrNiw0e/jrT7KJN1mfwvx1pSsJuDnSdL
 6zm7h+AnstT+5OKFMnzDtnfKJn+Sa3Os2E0yCtIeVRek5XFeF4UIRjrfUYc1cH6a0/zWKa8biFk
 /lBwRQis47ICKKau8I5XxqabtDqpoAXVmX8rrE13QG51JvKJnSVy5BWUR/NWANyP57YiM/ByqPV
 2yG83CwWzqRhO4OoRTQAn2dR4l6iY8qr+2sbGLE8nVMFBqXf5vuGcFtFok+eqdtYUdz54ZDRS4P
 FYfG2KZ1cB4UZYKS8kQ5O
X-Received: by 2002:a17:90b:1d49:b0:311:a5ab:3d47 with SMTP id
 98e67ed59e1d1-313bfd7ab92mr1604734a91.1.1749685520269; 
 Wed, 11 Jun 2025 16:45:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAMR6wEIIwnne3OpDAIO64Df49wCTs/N/zWmX8iRNFkPwGVeKGubpgXpgrWv1YmWUP5MvRNQ==
X-Received: by 2002:a17:90b:1d49:b0:311:a5ab:3d47 with SMTP id
 98e67ed59e1d1-313bfd7ab92mr1604694a91.1.1749685519759; 
 Wed, 11 Jun 2025 16:45:19 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b499cbsm200694a91.26.2025.06.11.16.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 16:45:19 -0700 (PDT)
Message-ID: <8f9a7ca7-5098-40c6-94b2-490a857d7dae@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 09:45:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-3-024e3221b0b9@oss.qualcomm.com>
 <f686130b-009f-4feb-bae1-022938c85923@ti.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <f686130b-009f-4feb-bae1-022938c85923@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDIwMCBTYWx0ZWRfX0UOcoqy6sGVr
 HYfAR9tXEdk/BlLeR8RS/yA1H6chcsbLfjJk84xLRcQzOzIQ59XtpYCJ9ErgHAeLQyXvudKPKpd
 wZ+J2P7nGf1B/70PDIi9XuUf4La9VoOpjsLRV/QQymBbblv/RJ6hbF9CbLFDJ1apAtgTeBF/0Nl
 G/nw5GVMvhyAv8gO6xUIvKn8GeQ5slmLKEcOKx+3lXMSBcD3+L1DRy9aNyLBm12fs6c7nM/upQG
 x6foki1/w534NjrH3UPOqonkblra65j9uStBvTrF1JLx4AolAHMsD97wIJ2T/pqXO6BYxdNK88f
 T/wAjOqlD1CiM3aVZZcS71JmIRktL5FjqMixh8D3lIHGFx6fvE3COq/KImgLYo/bVu53vJupFfA
 gHcYxpKAv4IyqF1oatDE0UH6icarb9N4HGjxOD8JMqjprk0KYKMX9NPr4PvDbbbr6zqGrVQk
X-Proofpoint-ORIG-GUID: FAVs1GeVc9v_wWa_d67VNIHsVmGEMhbF
X-Proofpoint-GUID: FAVs1GeVc9v_wWa_d67VNIHsVmGEMhbF
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684a1511 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ri7p8OPjmTxfXj7m-Z0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110200
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

Hi Andrew,

On 6/12/2025 8:40 AM, Andrew Davis wrote:
> On 5/27/25 1:56 AM, Amirreza Zarrabi wrote:
>> For drivers that can transfer data to the TEE without using shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
>>
> 
> Could you expand on this, what is the issue with normal MEMREF?
> 

QTEE supports two types of data passing: (1) memory objects and (2) buffers.
A memory object can be a normal shared memory (shm) instance. However, a
buffer is an [offset, size] pair referring to the transport memory shared
with QTEE (established at the begining of the invocation).

There is no direct representation of VALUE in the QTEE ABI, so even basic
data types, such as int, must be passed as a buffer [offset, sizeof(int)].
VALUE cannot be used because it only represents a u64 data size. While MEMREF
is an option, it requires additional ioctl calls and memory copies.

For example, if you need to send three integers to QTEE, you would require:
  (1) Three ioctl calls to allocate three shared memory pages.
  (2) Three memcpy operations to copy each integer into its respective shared memory.
  (3) Three memcpy operations to transfer data from shared memory to the
      transport buffer shared with QTEE.

You can optimize this slightly by making a single ioctl call for shared
memory allocation. However, the backend still needs to inspect the shared
memory, parse it, and extract the data and size information.

With UBUF user pass user address and size, and ther is only one copy_from_use
in the backend.

Regards,
Amir  

> Andrew
> 
>> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>   drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>>   include/linux/tee_drv.h  |  6 ++++++
>>   include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>   3 files changed, 55 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index b9ea5a85278c..74e40ed83fa7 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -387,6 +387,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>               params[n].u.value.b = ip.b;
>>               params[n].u.value.c = ip.c;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +            params[n].u.ubuf.size = ip.b;
>> +
>> +            if (!access_ok(params[n].u.ubuf.uaddr,
>> +                       params[n].u.ubuf.size))
>> +                return -EFAULT;
>> +
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -455,6 +466,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>                   put_user(p->u.value.c, &up->c))
>>                   return -EFAULT;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            if (put_user((u64)p->u.ubuf.size, &up->b))
>> +                return -EFAULT;
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>               if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -655,6 +671,13 @@ static int params_to_supp(struct tee_context *ctx,
>>               ip.b = p->u.value.b;
>>               ip.c = p->u.value.c;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            ip.a = (u64)p->u.ubuf.uaddr;
>> +            ip.b = p->u.ubuf.size;
>> +            ip.c = 0;
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -757,6 +780,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>               p->u.value.b = ip.b;
>>               p->u.value.c = ip.c;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +            p->u.ubuf.size = ip.b;
>> +
>> +            if (!access_ok(params[n].u.ubuf.uaddr,
>> +                       params[n].u.ubuf.size))
>> +                return -EFAULT;
>> +
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>               /*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index a54c203000ed..78bbf12f02f0 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>       struct tee_shm *shm;
>>   };
>>   +struct tee_param_ubuf {
>> +    void * __user uaddr;
>> +    size_t size;
>> +};
>> +
>>   struct tee_param_value {
>>       u64 a;
>>       u64 b;
>> @@ -92,6 +97,7 @@ struct tee_param {
>>       u64 attr;
>>       union {
>>           struct tee_param_memref memref;
>> +        struct tee_param_ubuf ubuf;
>>           struct tee_param_value value;
>>       } u;
>>   };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d0430bee8292..3e9b1ec5dfde 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>   #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT    6
>>   #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT    7    /* input and output */
>>   +/*
>> + * These defines userspace buffer parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT    8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT    9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT    10    /* input and output */
>> +
>>   /*
>>    * Mask for the type part of the attribute, leaves room for more types
>>    */
>> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>>   /**
>>    * struct tee_ioctl_param - parameter
>>    * @attr: attributes
>> - * @a: if a memref, offset into the shared memory object, else a value parameter
>> - * @b: if a memref, size of the buffer, else a value parameter
>> + * @a: if a memref, offset into the shared memory object,
>> + *     else if a ubuf, address of the user buffer,
>> + *     else a value parameter
>> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>>    * @c: if a memref, shared memory identifier, else a value parameter
>>    *
>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>> - * indicates that none of the members are used.
>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> + * are used.
>>    *
>>    * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>    * identifier representing the shared memory object. A memref can reference
>>

