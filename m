Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135DA9F34E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 16:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB15F10E20C;
	Mon, 28 Apr 2025 14:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1zA2I9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5390310E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 14:21:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8aBY1016073
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 14:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uRGzseOLlMMp4UyYMaYJC/jfKKYTnc5i8DN12SOBHs8=; b=m1zA2I9Y9RwkTPTW
 mup7AVlhUEHRNvg6jU3KPBOF37GhiaGCBbJSgi+7IsroX+YcY0r981ncqmDCOQc7
 zCEAnyeU0LD/jkmwy7G+9SLda7hv1VYF1cGQae5Jh7I1G9Rp/4+usmAc7BT6gppG
 A1A0kqRLLTtrPjzABW39iZYE0tMlMmnnzsKn/SZOtIWcgFt/kbAaQm89NhwRor5T
 RHDZC4+T2cLuxc7PLs3J51B5yO/0y57rzTpruhAPdHMqSkrfkCHcGysu9r7Jsno4
 v67awCdbpsequX9hJ13zRfWt7VUeIwCcB6uVdhPX5A+di5AKFfepHOUEEBQfdxvM
 A8FrAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5gjc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 14:21:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-225505d1ca5so43428115ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745850063; x=1746454863;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uRGzseOLlMMp4UyYMaYJC/jfKKYTnc5i8DN12SOBHs8=;
 b=hnFVHz3C+2BPh88W8qX7hVXR9XfG5ZHy0iQP+BWlPXY4nt3BBs5tn3bIn7kpKH7PLC
 If/bck1l0AWn1jaU2y+XJqwL04815l5WOD282eukTr/tld433j/xZgmlahbEBd7P1N7q
 gYg8VB43GWwemwyRgHJZrB3sLqj0uuliz+JiHjsuWkhpyXbiREa3bn1n4sGMfF1fIBL2
 AgMpPHVVa1LM79UeQSe145baZhO5G0L9q1r4SxZ3YSbAMugFkhgq/To5I7AbirM88HRn
 R03H/6XJTsA0L0L+M0zFpCiVRCyiAxUopga2QwwyFfNkvthsoa/WpSE6j+6cHjS5QKv4
 3Igg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrgyuO12rIwzpLSgnPaQ6neFuvzZH0BTXS8wJ6d+VW8CUC+dmnzfbdMfEI17PYjn/2ALkdb2KzVEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBln9/NvAhnpDn5tqLkobek+IEC5rLWeBxxQzNNqRu+R/pIkip
 qKHDhkLhgKMLAcLip1R7R/Np6kgbPsRBaZ3tBIcSNq5Is1rOUoYaUSyZd+Hlr9kRYuuwyRV75K3
 bB6MmZh5dBStXoBP3bGj8NVwWCaLegHiTRSWatYodjJ8qJTkSUWXbzRHcI1LgPc+xRKw=
X-Gm-Gg: ASbGncsunvCngBudBFq1juQca6D7tFA8lsMoI8V7D94xNarbmGyIu4VSKkKwxoXlTwv
 gYgBzNZ7uwSXTf4xvZnMOuwI+Zp9H64tghEBGxMc2Bb27vrvwBPlzJszNKwhrWPiTvEznYJ6Ebo
 u+w+4KYk9cHHz44xhLgzuVrL4cR6h+fbOpb+lgqI70TeZfpS/MG76ZorR6hdOXzmitzwK5tKQIA
 3aD1Gg0lCoxUOCM0qKw/1qk+y4aJNAPu+G1OHUPbAJ71En9VgQoiliOkeg8NDdbw1yXpLEMZuit
 5g+/3E7Ykh0YYFnwx6uNmmD4GpQAZukTnpIFBkZ0xmJjq6fDJSfJaaAiBw0shg==
X-Received: by 2002:a17:902:cf09:b0:219:e4b0:4286 with SMTP id
 d9443c01a7336-22dbf5fd46emr181780755ad.29.1745850063080; 
 Mon, 28 Apr 2025 07:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Kn0b7vF2Gzww2Ksi4T7tnSGfCYrIolsq+h4ZVXMLPFSZJRDZdW1j5hF7ySJGag9y+r72TQ==
X-Received: by 2002:a17:902:cf09:b0:219:e4b0:4286 with SMTP id
 d9443c01a7336-22dbf5fd46emr181780385ad.29.1745850062689; 
 Mon, 28 Apr 2025 07:21:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db5100ab2sm83130575ad.183.2025.04.28.07.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 07:21:02 -0700 (PDT)
Message-ID: <c7752304-7eb4-4617-9e8b-93a00960f6db@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 08:21:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct mutex unlock order in job submission
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
 <087563ac-bf33-4c80-a5fe-b4f2d155d9d1@oss.qualcomm.com>
 <92d4a66e-8df7-4852-b1b4-c42f167856b0@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <92d4a66e-8df7-4852-b1b4-c42f167856b0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GfCees-rX_kI_h_QDDiR-o6bkdC1Z1QL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDExOCBTYWx0ZWRfXwmhQMjlq6N17
 FeCgCbHCMpQ9M1H4Vw9Lj86xKBfC8DZPOlbvoLoNrA4Qq3RjjcA8wyYysPyDeii1UaN5IBzXChr
 rP4INxZGa4UPjKdlqDKs/ygTNEHHesI4zub3qb9kBjvm0JOkVmKnF1ycob+IPWB0jAz7tojHb8B
 uaw0qEBOShc6XhhPVxOY+sdl/peJ1VRnuh9cmV/JUt4JyYPrOrrwQteSOKFuTPieDc7nok18nnD
 vpbM9dD56iqbtldnASIjAnCnVa4JBPY3KukLk8hplOxgnXNyzUwqNdXpbh2CeqfvdBug82dzbVb
 QC8/zt9JMn9SVluZvaOfZ+e60qM0nQtGpPcHj4XhCmJ7THEPi91fFhMS05u/3g4tF+d3AY5bmjH
 q8LwZ1lMKvpN6/amJEXTdXiXJYi92/X/i7jhmSiH1xBlO35gqSWwtRabcZd9pu06OhxqXNij
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680f8ecf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=ng3R36APkavjsGrhBNkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: GfCees-rX_kI_h_QDDiR-o6bkdC1Z1QL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280118
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

On 4/28/2025 12:47 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 4/25/2025 7:22 PM, Jeff Hugo wrote:
>> On 4/25/2025 3:36 AM, Jacek Lawrynowicz wrote:
>>> From: Karol Wachowski <karol.wachowski@intel.com>
>>>
>>> The mutex unlock for vdev->submitted_jobs_lock was incorrectly placed
>>> after unlocking file_priv->lock. Change order of unlocks to avoid potential
>>
>> This should read "before unlocking", right?
> 
> Yes, I will correct the commit message after submitting this patch :)

It does not look like this would apply to -next.  Does it depend on 
something else?  The locking order in -next appears correct.

> 
>>> race conditions.
>>>
>>> Fixes: 5bbccadaf33e ("accel/ivpu: Abort all jobs after command queue unregister")
>>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_job.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>>> index 863e3cd6ace51..540923ffcbf8d 100644
>>> --- a/drivers/accel/ivpu/ivpu_job.c
>>> +++ b/drivers/accel/ivpu/ivpu_job.c
>>> @@ -681,8 +681,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>>>    err_erase_xa:
>>>        xa_erase(&vdev->submitted_jobs_xa, job->job_id);
>>>    err_unlock:
>>> -    mutex_unlock(&vdev->submitted_jobs_lock);
>>>        mutex_unlock(&file_priv->lock);
>>> +    mutex_unlock(&vdev->submitted_jobs_lock);
>>>        ivpu_rpm_put(vdev);
>>>        return ret;
>>>    }
>>
> 

