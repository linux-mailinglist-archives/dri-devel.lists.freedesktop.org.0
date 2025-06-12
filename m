Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276DEAD7258
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6AE10E3F8;
	Thu, 12 Jun 2025 13:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnSP4p/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694AB10E3F8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 13:43:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7bG4f019928
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 13:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DGYlNsJye4vFov3hPjJ9vV0ufHh0sNfFRepVvwpD2Nk=; b=OnSP4p/5SIhiiRyU
 PQABH6h8/8+2mXEVuzeEvSolI1TiarNlKqVQ15bpb2xCLNgfhJbLbGKukx4vQlZR
 t1GvtF/Tvlv2fbw1/68r5rGQ5VjqeWb2D1hLBoy6HFj6uoUgSqDrxc/cFX3QBAQO
 4byYjXg+po07ITKcIpnFvP+FpiY6xpRF2iNUzdwFZD4s6l7ys9qrzwzeCrO3nGwo
 IxUO12HgKYSMNoCdbV+AptyKoE4BsL/P4cHQE55LycQHxtAU0dwBB5ymnccCcCe1
 2Y5FOnhhF8MSYY3XnhR+7hhYF3+5EXUEEAWO2wDZddHFAPuHYnTBo1mBpWS+BP4n
 Jha9GQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcrpx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 13:43:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-234b133b428so7250085ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 06:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749735784; x=1750340584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DGYlNsJye4vFov3hPjJ9vV0ufHh0sNfFRepVvwpD2Nk=;
 b=LXcAkxg+BM67J/fynhX3w6fBuy8s1DbdSD+ixfZ6Fa+4xWbYflr/Ehan1Xu/MSB8gN
 80PdtDsGd3MZ1YaVmP4WCp5MQYDEdoIkDa2Gs584eyZvHOrAQNNmjeSUa32u+IChhjK8
 Z3RDS76hSdWU9CaKE6NA+WgvKPGZJBm7LSiMZTpMUr1tqAzvMWHaAZ3A1cp0fXOIfWZD
 1NUZyyYQgeMBIMWDRBBDcpMfiPt/I6D1A9VCIub5V7vWVFFbPsTwdwAUknPrCNKVFL/v
 bFozwcYipLwVzaX/XdMlJjHLYNwpKw+8NkuaZPRAf2Z0HLwLU7eubz18CVSqo5zKUh5s
 GWuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqQ8VpanwgYsY861bT9LbnoBGQf9Vv5IiVxErFLsBoE9IiDwdz8lwm4/JA0BEQ6d2bRzyHDoF3bqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz1GCI4dZg3QNSNQt8sRsXE2eclM1+5965+eTVdUl1w6PGJFIi
 whaW/Ys6VDmC68bP+8FZk66AtTzBUgCEraDkpwyR0h7Azzf1eU3w0Wt1qPmW5B39KObuY1jHSQW
 0zQVTPXKvC1ccBesScLDhNs1oC73lNgNztQfRmMzhFSK5t11FRKojRNUXCmRW0TZcWALGcHA=
X-Gm-Gg: ASbGncvcwFgmlsvtmQ9MtTVKdWv1dwWFMJasIpB3L5rOk6CZLvOH50TkMq5/q9AaXCO
 odvPEpLPNbYlds7lchr6AmMCPt6if+X9ZQZiAwsLOVv3nlTZ1J234t9eOMavYs9adPoVyUI1eJz
 Djr+MDHAv6341PylnGERF4GUB83FIiwfYLuq8RUifLROnTfCjmgVv9mk/elZPjmbTOotwvefhza
 S+4dQH1nyJpdZ6NI8DoGArAFxYSzoDdrPXxVDJ2LHOokZjhvBDq900eaUdE3YReDbKPQis0YGF9
 cUI04buwuJkbLx2DWYgwRvVtdzBO/SVaRRgtnGv4hpnEP02VqKljZ4PCuWc4OlqKrTMzOYoQ
X-Received: by 2002:a17:902:ea10:b0:234:9375:e07c with SMTP id
 d9443c01a7336-23641b3f14dmr100582105ad.46.1749735783947; 
 Thu, 12 Jun 2025 06:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4Yboy1sYCNz2m3kXYaH7CbXEdVYDsL0VVLFhds/Vb1I0Q4GZ9bTPWtuJLUgDRL8lbyKWxIQ==
X-Received: by 2002:a17:902:ea10:b0:234:9375:e07c with SMTP id
 d9443c01a7336-23641b3f14dmr100580205ad.46.1749735781398; 
 Thu, 12 Jun 2025 06:43:01 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e73589bsm13797375ad.258.2025.06.12.06.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 06:43:01 -0700 (PDT)
Message-ID: <fbc00bc7-19c0-413a-bfdc-625255c12c33@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 07:42:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add turbo flag to the DRM_IVPU_CMDQ_CREATE
 ioctl
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250605162001.1237789-1-maciej.falkowski@linux.intel.com>
 <3a3fc0d9-afb4-4a37-bbfd-944fe7721e0a@oss.qualcomm.com>
 <62bb72af-d633-442f-a598-ec632508f074@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <62bb72af-d633-442f-a598-ec632508f074@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEwNSBTYWx0ZWRfX14xr48zDuY7s
 muK6dwstCEC06xbux4029b0kSaNVcwPaSsP18jQn74mawNtPjrIXE+eE4AokSb7frJqsggWW+EX
 D4kEta64p+OV9o5ymQmxiJ/G7L0jvYoDFt5PJFhXmDZ8nl4kfjfRlddjcMVF502WkF2UBo1UNZd
 iukmLJ3sQ9d1X+STc3pGQZZLsPBx4G7/3zPfdDdF4bQ64ck5rBNXk4Jxh8yBjE5RLtAxvV7/XI1
 F2ruvlj9Suu+WZhMeF6xFivHYxCAngw4gyxQ7/qXNHHxjuUU9DppV7CgH1fNfoCAssGH1Y6y0hA
 EQvHHHpwNVTa+LKBxJJVKIPg8Lxdq34dd0Z8QTyD5Fseehc+FCwJ0TlNv+eNV841a/68CQvnKVo
 b5CLHkKdyvqyu5NAnNqtH1nIENT/s4rcMxiw7K3JxOg9jUteCuWd8Zuchj0gwhUXf6V+Vw2F
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684ad968 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=tuUjpf0EgkA-ptlnekEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=JFSxHsIUebAA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: s-HwEJ0kLX8rjqi6hsSlaEQbUx9Rtr3T
X-Proofpoint-ORIG-GUID: s-HwEJ0kLX8rjqi6hsSlaEQbUx9Rtr3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120105
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

On 6/12/2025 7:31 AM, Falkowski, Maciej wrote:
> On 6/6/2025 6:30 PM, Jeff Hugo wrote:
> 
>> On 6/5/2025 10:20 AM, Maciej Falkowski wrote:
>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>
>>> Introduces a new parameter to the DRM_IVPU_CMDQ_CREATE ioctl,
>>
>> Introduce
> Ack, thanks.
>>
>>> enabling turbo mode for jobs submitted via the command queue.
>>> Turbo mode allows jobs to run at higher frequencies,
>>> potentially improving performance for demanding workloads.
>>>
>>> The change also adds the IVPU_TEST_MODE_TURBO_DISABLE flag
>>
>> "This change" is redundant. Just start with "Also add the..."
> Ack, thanks.
>>
>>> to allow test mode to explicitly disable turbo mode
>>> requested by the application.
>>> The IVPU_TEST_MODE_TURBO mode has been renamed to
>>> IVPU_TEST_MODE_TURBO_ENABLE for clarity and consistency.
>>>
>>> +/* Command queue flags */
>>> +#define DRM_IVPU_CMDQ_FLAG_TURBO 0x00000001
>>> +
>>>   /**
>>>    * struct drm_ivpu_cmdq_create - Create command queue for job 
>>> submission
>>>    */
>>> @@ -462,6 +465,17 @@ struct drm_ivpu_cmdq_create {
>>>        * %DRM_IVPU_JOB_PRIORITY_REALTIME
>>>        */
>>>       __u32 priority;
>>> +    /**
>>> +     * @flags:
>>> +     *
>>> +     * Supported flags:
>>> +     *
>>> +     * %DRM_IVPU_CMDQ_FLAG_TURBO
>>> +     *
>>> +     * Enable low-latency mode for the command queue. The NPU will 
>>> maximize performance
>>> +     * when executing jobs from such queue at the cost of increased 
>>> power usage.
>>> +     */
>>> +    __u32 flags;
>>
>> This is going to break the struct size on compat.  You probably need a 
>> __u32 reserved to maintain 64-bit alignment. 
> 
> Thank you for suggestion,
> I think compat is preserved here as u32 imposes 4 byte alignment on 64bit
> so the alignment is going to be 12 bytes on both 32bit and 64bit, I 
> tested this manually.
> Please correct me if I am wrong.

Looks like I'm wrong.  Majority of the structures have 64-bit values, 
and I didn't clearly see that this specific one is only 32-bit values.

My initial comment was based on 
https://docs.kernel.org/process/botching-up-ioctls.html - specifically:

Pad the entire struct to a multiple of 64-bits if the structure contains 
64-bit types - the structure size will otherwise differ on 32-bit versus 
64-bit. Having a different structure size hurts when passing arrays of 
structures to the kernel, or if the kernel checks the structure size, 
which e.g. the drm core does.

Ok. This was the only functional comment, and it is resolved. The other 
two are trivial fixups, so I think with those -

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
