Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9358A819D4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 02:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34AB10E7A0;
	Wed,  9 Apr 2025 00:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HiNnaAKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5842610E7A0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 00:28:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZm8d024945
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Apr 2025 00:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QPyHCG1+WzzUD7LO/5vB6v3r
 CQaXkqq9ekpJzckr7t0=; b=HiNnaAKw3amBLmiRBJT6C+qCcffIW+S5CnWcj9yU
 qTOShXpzxygbibO5/t3EFnsC91nTQwWOdUzzc8KdxuRWpFUH7FYuAh6m/z7a/5T0
 IgVEpC6FRBpRnl0Bvzl6MXIvQAK6mf4wzq2eHpKxrI3htAzdEFl5liuHOV/KnkYu
 DZ7u+jolmA3TDWr47ejqcdGvQF5HRD5kNSUZ1/jUHRapcFuFrIzXBeg0V3PxePHk
 nD0qX/2G8Gspyg8N08dSepvD3qGyw2xUkEUL/4+gITC9jIjUDozf+dXFz3qxxFN2
 rda0ChPKlu5Ul1lkhVim5yVK8HcXXglwpx6iClrSN+1jjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkhf0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 00:28:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-736c89461d1so9237838b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 17:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744158508; x=1744763308;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QPyHCG1+WzzUD7LO/5vB6v3rCQaXkqq9ekpJzckr7t0=;
 b=YaRPkchZ0LAH+DVkTXcFrZpRMwBEB5i3Cmw1c6V9qcOsKnRn6cB2acVtBQ/vAyIxk7
 kEaN2pO30m2WmjNZyqi9znzEYw2Qvq3D09JVT5o3LKTuDet7yXPCRGJbo2HZmNm7eXps
 kAcwAYXVC+d+HCV+rONTNVv10rzpXtmBsgizc4MMx5dTVg4YGWRtVAFFikyTIgi2Aqj/
 ANJ2Z9gXbMKdnY+c6s6c9jFLzSMR/t3q2GqVUDeVM3gLZbjFvyLogHFVatcwe7OVRjAn
 35qGFobWmlZfUoXHng0swGY1zV/Ij9DekTG0xj1knjjCExDQUzejABv6MFGqLCW/yF0w
 /h8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhLUBX1jbsgIbUc48XHUNnIcj+ki3OJs36sMdlnYSi57FlZuwu/Rk3bBjHYTkxgT+ytwEDFBTo0Ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDyE4yHRUP74EIQmtvzk0F6Ex8hZPzjy0PMXfrWA3JLkLDjcxc
 4Hqs9uAsaXwLcaLCEQferUj/JKjfoFmdyl5XKKXlpXGc75PigYMhGFQn2pHfRJhFtBxmq9QVKQa
 h8ozGDMLLAAICyCpgMqmcm4nAGj99pXC5AMxLUCY+egYdr3HNyHexvebqnTrUJM4PCg==
X-Gm-Gg: ASbGncuxMAd0k5vymts2IPlnR3qdXznjnA2oA6UHM9i++TWZWljNvTTvdpFciwha4Ih
 c55K6PUaYe3FE5wk7fsdeP3hg1YhntR3ir2zAY8Oi2nWhwzI/8fv3P6gT9NYAMOViQ+vZLX7T1y
 pPzBXKdbB7O9YcKxB81l12ryQYNvqVe4E2NNkHe/EYx0LTwfPwiJ2f2m53VLLdQp+cp3INqhSt0
 TziZE1okijoOiV3eLfnkzTXvWSbiFGGULpQGMESuWXWcwenbDwtBsGUjzpXFRMASH5/DjwPxBeG
 IIgcFNywZeCyXK3Ef5AKgCszsfgzZe1CchTRFzFGIj2PV08IhqorJIZRn0CzXtN8+xzWHssHr7v
 L45VjL6kpl5w34Q==
X-Received: by 2002:a05:6a00:2da6:b0:737:6fdf:bb69 with SMTP id
 d2e1a72fcca58-73bae4dc35cmr1036843b3a.13.1744158507784; 
 Tue, 08 Apr 2025 17:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnD8g2ETs6be1QbHHpROgmKdna7pC2gdSPxGytKugY0I73/vEF9rfua90M/0o3hQeNrSFTHA==
X-Received: by 2002:a05:6a00:2da6:b0:737:6fdf:bb69 with SMTP id
 d2e1a72fcca58-73bae4dc35cmr1036801b3a.13.1744158507243; 
 Tue, 08 Apr 2025 17:28:27 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d9ea09c8sm11577414b3a.101.2025.04.08.17.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 17:28:26 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------dhJMmz1HYZ9qur9PcjP6dPOL"
Message-ID: <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 10:28:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
X-Proofpoint-GUID: Jc3NTqMJOegaSZonCE7nRMSlM2PfnWTw
X-Proofpoint-ORIG-GUID: Jc3NTqMJOegaSZonCE7nRMSlM2PfnWTw
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f5bf2d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=XR8D0OoHHMoA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=EUspDBNiAAAA:8
 a=oB-xqKmB0luAZTjYqwwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=j6LnwPqp-8W-AZnJ_YUA:9 a=2HCMgeFt39FgQKCS:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_09,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090001
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

This is a multi-part message in MIME format.
--------------dhJMmz1HYZ9qur9PcjP6dPOL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi jens,

On 4/8/2025 10:19 PM, Jens Wiklander wrote:
> Hi Amirreza,
>
> On Fri, Mar 28, 2025 at 3:48 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>> For drivers that can transfer data to the TEE without using shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>>  include/linux/tee_drv.h  |  6 ++++++
>>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>  3 files changed, 55 insertions(+), 6 deletions(-)
> Is this patch needed now that the QCOMTEE driver supports shared
> memory? I prefer keeping changes to the ABI to a minimum.
>
> Cheers,
> Jens

Unfortunately, this is still required. QTEE supports two types of data transfer:
(1) using UBUF and (2) memory objects. Even with memory object support, some APIs still
expect to receive data using UBUF. For instance, to load a TA, QTEE offers two interfaces:
one where the TA binary is in UBUF and another where the TA binary is in a memory object.

Best Regards,
Amir

>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 22cc7d624b0c..bc862a11d437 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>                         params[n].u.value.b = ip.b;
>>                         params[n].u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       params[n].u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>                             put_user(p->u.value.c, &up->c))
>>                                 return -EFAULT;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
>> +                               return -EFAULT;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
>>                         ip.b = p->u.value.b;
>>                         ip.c = p->u.value.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       ip.a = (u64)p->u.ubuf.uaddr;
>> +                       ip.b = p->u.ubuf.size;
>> +                       ip.c = 0;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>                         p->u.value.b = ip.b;
>>                         p->u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       p->u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         /*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index ce23fd42c5d4..d773f91c6bdd 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>         struct tee_shm *shm;
>>  };
>>
>> +struct tee_param_ubuf {
>> +       void * __user uaddr;
>> +       size_t size;
>> +};
>> +
>>  struct tee_param_value {
>>         u64 a;
>>         u64 b;
>> @@ -92,6 +97,7 @@ struct tee_param {
>>         u64 attr;
>>         union {
>>                 struct tee_param_memref memref;
>> +               struct tee_param_ubuf ubuf;
>>                 struct tee_param_value value;
>>         } u;
>>  };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d0430bee8292..3e9b1ec5dfde 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */
>>
>> +/*
>> + * These defines userspace buffer parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and output */
>> +
>>  /*
>>   * Mask for the type part of the attribute, leaves room for more types
>>   */
>> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>>  /**
>>   * struct tee_ioctl_param - parameter
>>   * @attr: attributes
>> - * @a: if a memref, offset into the shared memory object, else a value parameter
>> - * @b: if a memref, size of the buffer, else a value parameter
>> + * @a: if a memref, offset into the shared memory object,
>> + *     else if a ubuf, address of the user buffer,
>> + *     else a value parameter
>> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>>   * @c: if a memref, shared memory identifier, else a value parameter
>>   *
>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>> - * indicates that none of the members are used.
>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> + * are used.
>>   *
>>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>   * identifier representing the shared memory object. A memref can reference
>>
>> --
>> 2.34.1
>>
--------------dhJMmz1HYZ9qur9PcjP6dPOL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi jens,<br>
    </p>
    <div class="moz-cite-prefix">On 4/8/2025 10:19 PM, Jens Wiklander
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">Hi Amirreza,

On Fri, Mar 28, 2025 at 3:48 AM Amirreza Zarrabi
<a class="moz-txt-link-rfc2396E" href="mailto:amirreza.zarrabi@oss.qualcomm.com">&lt;amirreza.zarrabi@oss.qualcomm.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
For drivers that can transfer data to the TEE without using shared
memory from client, it is necessary to receive the user address
directly, bypassing any processing by the TEE subsystem. Introduce
TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
userspace buffers.

Signed-off-by: Amirreza Zarrabi <a class="moz-txt-link-rfc2396E" href="mailto:amirreza.zarrabi@oss.qualcomm.com">&lt;amirreza.zarrabi@oss.qualcomm.com&gt;</a>
---
 drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h  |  6 ++++++
 include/uapi/linux/tee.h | 22 ++++++++++++++++------
 3 files changed, 55 insertions(+), 6 deletions(-)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this patch needed now that the QCOMTEE driver supports shared
memory? I prefer keeping changes to the ABI to a minimum.

Cheers,
Jens</pre>
    </blockquote>
    <p>Unfortunately, this is still required. QTEE supports two types of
      data transfer:<br>
      (1) using UBUF and (2) memory objects. Even with memory object
      support, some APIs still<br>
      expect to receive data using UBUF. For instance, to load a TA,
      QTEE offers two interfaces:<br>
      one where the TA binary is in UBUF and another where the TA binary
      is in a memory object.<br>
      <br>
      Best Regards,<br>
      Amir<br>
    </p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
cite="mid:CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 22cc7d624b0c..bc862a11d437 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
                        params[n].u.value.b = ip.b;
                        params[n].u.value.c = ip.c;
                        break;
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+                       params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+                       params[n].u.ubuf.size = ip.b;
+
+                       if (!access_ok(params[n].u.ubuf.uaddr,
+                                      params[n].u.ubuf.size))
+                               return -EFAULT;
+
+                       break;
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
                            put_user(p-&gt;u.value.c, &amp;up-&gt;c))
                                return -EFAULT;
                        break;
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+                       if (put_user((u64)p-&gt;u.ubuf.size, &amp;up-&gt;b))
+                               return -EFAULT;
+                       break;
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
                        if (put_user((u64)p-&gt;u.memref.size, &amp;up-&gt;b))
@@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
                        ip.b = p-&gt;u.value.b;
                        ip.c = p-&gt;u.value.c;
                        break;
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+                       ip.a = (u64)p-&gt;u.ubuf.uaddr;
+                       ip.b = p-&gt;u.ubuf.size;
+                       ip.c = 0;
+                       break;
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
                        p-&gt;u.value.b = ip.b;
                        p-&gt;u.value.c = ip.c;
                        break;
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+                       p-&gt;u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+                       p-&gt;u.ubuf.size = ip.b;
+
+                       if (!access_ok(params[n].u.ubuf.uaddr,
+                                      params[n].u.ubuf.size))
+                               return -EFAULT;
+
+                       break;
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
                case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
                        /*
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index ce23fd42c5d4..d773f91c6bdd 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -82,6 +82,11 @@ struct tee_param_memref {
        struct tee_shm *shm;
 };

+struct tee_param_ubuf {
+       void * __user uaddr;
+       size_t size;
+};
+
 struct tee_param_value {
        u64 a;
        u64 b;
@@ -92,6 +97,7 @@ struct tee_param {
        u64 attr;
        union {
                struct tee_param_memref memref;
+               struct tee_param_ubuf ubuf;
                struct tee_param_value value;
        } u;
 };
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index d0430bee8292..3e9b1ec5dfde 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */

+/*
+ * These defines userspace buffer parameters.
+ */
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and output */
+
 /*
  * Mask for the type part of the attribute, leaves room for more types
  */
@@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
 /**
  * struct tee_ioctl_param - parameter
  * @attr: attributes
- * @a: if a memref, offset into the shared memory object, else a value parameter
- * @b: if a memref, size of the buffer, else a value parameter
+ * @a: if a memref, offset into the shared memory object,
+ *     else if a ubuf, address of the user buffer,
+ *     else a value parameter
+ * @b: if a memref or ubuf, size of the buffer, else a value parameter
  * @c: if a memref, shared memory identifier, else a value parameter
  *
- * @attr &amp; TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
- * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
- * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
- * indicates that none of the members are used.
+ * @attr &amp; TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
+ * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
+ * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
+ * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
+ * are used.
  *
  * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
  * identifier representing the shared memory object. A memref can reference

--
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------dhJMmz1HYZ9qur9PcjP6dPOL--
