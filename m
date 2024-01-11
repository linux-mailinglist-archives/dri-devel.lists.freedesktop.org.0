Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F6982B65C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 22:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC7410E996;
	Thu, 11 Jan 2024 21:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0BC10E9A9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 21:04:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40BKcK5E010594; Thu, 11 Jan 2024 21:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=WKfnZrQB21OppTjPAOWJvkmWtY0WcIiaWm/I6gyCjDI=; b=PG
 0Sz6+bLG8P8caRpRbZ+vSYCa+VfvbQrfFdqTQ500hdzC0GSMY6acSbonDd1j+S7H
 oizhLXW5R9O2Qhq0s8w1NA2IAhIuBlmNvAsnZD4qsFkO8W03tvhvYDZK3bh0xk/m
 7S/BHI0WizwJImtkvphEjFXFZGFqJ5cS9gU/XnWcjG9KxiY1bCqpVEQqenV6wGhq
 Cg60xT7HtRZ51A4corqo5bmRzZ2/FTStnMK5gowwrsIitKfTK68Lq/9KftYb2/eO
 PT3rhb+P7J/M1Fq5NaYpAYtaaQOB9fMNR6ICfKMX6dD8ZMJckaTwdWTvKniuBTNH
 wlD6q1O4QPD+WbtHlKpg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vja9y23n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 21:04:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40BL40nV012177
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 21:04:00 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 13:03:59 -0800
Message-ID: <6297007c-82bb-6b74-50ed-50d70c128829@quicinc.com>
Date: Thu, 11 Jan 2024 14:03:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/10] accel/ivpu: Remove deprecated
 DRM_IVPU_PARAM_CONTEXT_PRIORITY
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-11-jacek.lawrynowicz@linux.intel.com>
 <d95363cc-4dbd-7f72-7acb-c1f94caa0a7e@quicinc.com>
 <67b0ba4b-bfd1-4cef-8215-2658ad8a8acb@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <67b0ba4b-bfd1-4cef-8215-2658ad8a8acb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: B3i-BvhdJd0d8FZnPntZ80Q2YEAJMNII
X-Proofpoint-GUID: B3i-BvhdJd0d8FZnPntZ80Q2YEAJMNII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110164
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
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/2024 7:33 AM, Jacek Lawrynowicz wrote:
> On 05.01.2024 18:29, Jeffrey Hugo wrote:
>> On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
>>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>>
>>> DRM_IVPU_PARAM_CONTEXT_PRIORITY has been deprecated because it
>>> has been replaced with DRM_IVPU_JOB_PRIORITY levels set with
>>> submit IOCTL and was unused anyway.
>>>
>>> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_drv.c | 11 -----------
>>>    drivers/accel/ivpu/ivpu_drv.h |  1 -
>>>    drivers/accel/ivpu/ivpu_job.c |  3 +++
>>>    include/uapi/drm/ivpu_accel.h | 21 ++++++++++++++++++++-
>>>    4 files changed, 23 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>>> index ec66c2c39877..546c0899bb9e 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.c
>>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>>> @@ -177,9 +177,6 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>>        case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>>>            args->value = vdev->hw->ranges.user.start;
>>>            break;
>>> -    case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>>> -        args->value = file_priv->priority;
>>> -        break;
>>>        case DRM_IVPU_PARAM_CONTEXT_ID:
>>>            args->value = file_priv->ctx.id;
>>>            break;
>>> @@ -219,17 +216,10 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>>      static int ivpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>    {
>>> -    struct ivpu_file_priv *file_priv = file->driver_priv;
>>>        struct drm_ivpu_param *args = data;
>>>        int ret = 0;
>>>          switch (args->param) {
>>> -    case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>>> -        if (args->value <= DRM_IVPU_CONTEXT_PRIORITY_REALTIME)
>>> -            file_priv->priority = args->value;
>>> -        else
>>> -            ret = -EINVAL;
>>> -        break;
>>>        default:
>>>            ret = -EINVAL;
>>>        }
>>> @@ -258,7 +248,6 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>>>        }
>>>          file_priv->vdev = vdev;
>>> -    file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
>>>        kref_init(&file_priv->ref);
>>>        mutex_init(&file_priv->lock);
>>>    diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>>> index 9b6e336626e3..7a6bc1918780 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.h
>>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>>> @@ -146,7 +146,6 @@ struct ivpu_file_priv {
>>>        struct mutex lock; /* Protects cmdq */
>>>        struct ivpu_cmdq *cmdq[IVPU_NUM_ENGINES];
>>>        struct ivpu_mmu_context ctx;
>>> -    u32 priority;
>>>        bool has_mmu_faults;
>>>    };
>>>    diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>>> index 7206cf9cdb4a..82e40bb4803c 100644
>>> --- a/drivers/accel/ivpu/ivpu_job.c
>>> +++ b/drivers/accel/ivpu/ivpu_job.c
>>> @@ -488,6 +488,9 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>        if (params->engine > DRM_IVPU_ENGINE_COPY)
>>>            return -EINVAL;
>>>    +    if (params->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
>>> +        return -EINVAL;
>>> +
>>>        if (params->buffer_count == 0 || params->buffer_count > JOB_MAX_BUFFER_COUNT)
>>>            return -EINVAL;
>>>    diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
>>> index de1944e42c65..cc9a0504ee2f 100644
>>> --- a/include/uapi/drm/ivpu_accel.h
>>> +++ b/include/uapi/drm/ivpu_accel.h
>>> @@ -13,7 +13,7 @@ extern "C" {
>>>    #endif
>>>      #define DRM_IVPU_DRIVER_MAJOR 1
>>> -#define DRM_IVPU_DRIVER_MINOR 0
>>> +#define DRM_IVPU_DRIVER_MINOR 1
>>
>> I remember when this driver was going through initial review before acceptance, Oded mentioned that the DRM driver version mechanism was deprecated and to not use it.  Based on that, it seems like you should not be incrementing the minor number.
> 
> I wanted to use minor version in tests to verify the UAPI but this is not very important. I can leave this as is.
> 
>>>      #define DRM_IVPU_GET_PARAM          0x00
>>>    #define DRM_IVPU_SET_PARAM          0x01
>>> @@ -64,11 +64,18 @@ extern "C" {
>>>      #define DRM_IVPU_PLATFORM_TYPE_SILICON        0
>>>    +/* Deprecated - to be removed */
>>>    #define DRM_IVPU_CONTEXT_PRIORITY_IDLE        0
>>>    #define DRM_IVPU_CONTEXT_PRIORITY_NORMAL    1
>>>    #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS        2
>>>    #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
>>
>> $SUBJECT suggests these are being removed, not just deprecated.  Also, shouldn't DRM_IVPU_PARAM_CONTEXT_PRIORITY which is a few lines above this be deprecated/removed/something?
> 
> OK, I'll correct the subject and add "deprecated" comment to DRM_IVPU_PARAM_CONTEXT_PRIORITY.
> 
>>>    +#define DRM_IVPU_JOB_PRIORITY_DEFAULT  0
>>> +#define DRM_IVPU_JOB_PRIORITY_IDLE     1
>>> +#define DRM_IVPU_JOB_PRIORITY_NORMAL   2
>>> +#define DRM_IVPU_JOB_PRIORITY_FOCUS    3
>>> +#define DRM_IVPU_JOB_PRIORITY_REALTIME 4
>>> +
>>>    /**
>>>     * DRM_IVPU_CAP_METRIC_STREAMER
>>>     *
>>> @@ -286,6 +293,18 @@ struct drm_ivpu_submit {
>>>         * to be executed. The offset has to be 8-byte aligned.
>>>         */
>>>        __u32 commands_offset;
>>> +
>>> +    /**
>>> +     * @priority:
>>> +     *
>>> +     * Priority to be set for related job command queue, can be one of the following:
>>> +     * %DRM_IVPU_JOB_PRIORITY_DEFAULT
>>> +     * %DRM_IVPU_JOB_PRIORITY_IDLE
>>> +     * %DRM_IVPU_JOB_PRIORITY_NORMAL
>>> +     * %DRM_IVPU_JOB_PRIORITY_FOCUS
>>> +     * %DRM_IVPU_JOB_PRIORITY_REALTIME
>>> +     */
>>> +    __u32 priority;
>>
>> I think this breaks the uapi (which makes me think you are using the driver minor version above to detect).  This struct is passed to DRM_IOW which uses the struct size to calculate the ioctl number.  By changing the size of this struct, you change the ioctl number, and make it so that old userspace (with the old number) cannot work with newer kernels.
>>
>> I beleive last time I brought up a uapi breakage, I was told that your userspace han't been offically released yet.  Is that still the case?
>>
>> Seems odd though, because you are incrementing the driver minor number above which makes me think you need to communicate this change to userspace, which seems to suggest you might have old userspace out in the wild...
> 
> The user-space part of the driver was already released but it have never used DRM_IVPU_PARAM_CONTEXT_PRIORITY.
> I've tested the new kmd with old umd and ioctls work fine. drm_ioctl() handles the difference in user vs driver arg size.

Intresting.  You are right, drm_ioctl does extra handling to ignore the 
ioctl size.  As long as the struct change is backwards compatible 
everything will work fine.

> I think it is perfectly safe to extend the ioctl arg. The ioctl number is passed directly to DRM_IOW(), I can't see where it would be calculated based on arg size.

DRM_IOW is defined as _IOW which is defined as _IOC.  _IOC calls 
_IOC_TYPECHECK which looks to be defined as a sizeof.  The actual _IOC 
macro uses the 4 paramaters in bitwise math to generate the ioctl 
number.  I probably should have clarified eariler that I'm considering 
the ioctl number to be the 32 bit value "returned" by DRM_IOW, and not 
the NR field.

Anyways, as you pointed out, I had forgotten an element of how DRM 
handles ioctls.

-Jeff

