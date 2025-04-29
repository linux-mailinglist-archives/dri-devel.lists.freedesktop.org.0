Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E608BAA0F47
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 16:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3638C10E4AE;
	Tue, 29 Apr 2025 14:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIJrtAqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ED110E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:43:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA0nrs001335
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +lmCCT1Z7ppTTrOim+nd+gNqEy9+8kVpD3Cl1hjh9ns=; b=lIJrtAqYNHKsMHR2
 COC/fPj9NLX/yQKT4yFlaHk7ikPPJhcE1ultNxD17sQ2tCESV0KN5c4djEdyYpnq
 GvKNQ7xT9r3jnVO8jDNYCex1WbM71ba6tMNhYsVT36qfjTsIWsKGE+N/cMYZMjDc
 yRWcTQUBnF8K8eE+RZu8K/wje+IaE7IbxvjHqjoaHmAHrNSkPpRmMEnteJIiYXW6
 KIqQw1pvDn21CWH1k6XmaRXvtB0UD6AO8dloZtDCPotMvwhdun5cHir4XCFRJ1TI
 i23usI0n8bs060TsFugLH46SNiYUJWkYMlLwl0eUgLw5PpH3HcZpgGaxbPmBDLwv
 FretTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mw6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:43:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2265a09dbfcso88085945ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745937803; x=1746542603;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+lmCCT1Z7ppTTrOim+nd+gNqEy9+8kVpD3Cl1hjh9ns=;
 b=f0FMTxCCATvRocZLGi4kubksrcorFRmjQIurGgkrZVOKTZw0kYqqKFZhhlG69CzgGe
 yBwmLSGyCbPAXuJ3UP8VAdRBqFgT61B1SIFBnBSuklgekQik13ce9RUqwf0Kb+7oehcF
 y6gw0d+fI5zEH9XqO0J3KJlh88C6FhLRX1guh4+56kVUjkGc1KsFxumkPr7gbJbZkVer
 KVrneoZjWmuWi4MDMyLYrMkRkdP/R+6MkC3Y1SqtVHGz2//rnlC+m60kHN/528jdNw/3
 WMzeY7iCSRe4nO5TQ/k/w0GeCaOFk/s3yQjjGAK24Pxy1Db2tMI7yfJkP3hVzSWuo3ID
 k6/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/408fdFrxElDaXZParNxOQ4IQxdzbL0RrlaxkfddpZjOX8pjKnkPStdY0Mfq1EJhA7o6O9apP7No=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvZGsypsSeHs0eo76wPbUUtAaurIz27R7qvbHJ5sM12EBky9y+
 +xtidAcGuB5kOEKnGDWKwL/h3vdlJfH9HsRvUtFflTdwRBN1AqX74HVTlSZx0lB2y4LB9sR0PEL
 wO5UksdGcuO0qYChoQJNS+rqTDGRX3sO+ulbti6hC0sj/VYP/ifUuckkelNE5XBJXcTULkJcUyP
 M=
X-Gm-Gg: ASbGncvhhGIsRB8NkVGUFXjHEm/mRCqdBCotISh7Qn8GRSeA3bnXaJkUgm5JIi44NaT
 Kos2ukamGL2S03pplTi4/LZC0QpsXZSF67Su4F095A8QDjRfsUAtnv5mc1qYoc0KzcC6zoOEXdT
 YB8UQulgvtamSk7i1qV3/VNSY5WXr1nrNOXHuBi2kC+X406WFTPzdjcMsS3X19ffpD5IlMzBl3Z
 IGPtPoIlTb3ps2qkY7fChFpKZCSuH5xswGXwjKa+hdUVM/EK3stA41V0qx9UeLqXv1bgH3Yw/pg
 kMXy6gaVCnAXDc0buMIOqwZX/VkOgPtmbkfqlyHvTI68/K61HT/7DFSZSADewQ==
X-Received: by 2002:a17:903:1b05:b0:225:ac99:ae0f with SMTP id
 d9443c01a7336-22de5ebb199mr59669405ad.1.1745937803580; 
 Tue, 29 Apr 2025 07:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXNyS3tgISbyFMI5Iyj6vzhnj9dP+EszLePRPXbR78j0luK5YicAKAoKUs4jVCFf5dfQZt9w==
X-Received: by 2002:a17:903:1b05:b0:225:ac99:ae0f with SMTP id
 d9443c01a7336-22de5ebb199mr59669135ad.1.1745937803212; 
 Tue, 29 Apr 2025 07:43:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4db99d3sm103516675ad.53.2025.04.29.07.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 07:43:22 -0700 (PDT)
Message-ID: <416cfd0e-3317-4332-9ac0-cd7c2940a5dd@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 08:43:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct mutex unlock order in job submission
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
 <087563ac-bf33-4c80-a5fe-b4f2d155d9d1@oss.qualcomm.com>
 <92d4a66e-8df7-4852-b1b4-c42f167856b0@linux.intel.com>
 <c7752304-7eb4-4617-9e8b-93a00960f6db@oss.qualcomm.com>
 <cd36ea5c-a44a-4a8a-a3f4-24d7426e6f70@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <cd36ea5c-a44a-4a8a-a3f4-24d7426e6f70@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810e58d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=ECNBT_1LO9FDCAEK3JcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: F7YKz9_-Ho3-eVZA8XuON4ToL-G9VVGN
X-Proofpoint-ORIG-GUID: F7YKz9_-Ho3-eVZA8XuON4ToL-G9VVGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDExMCBTYWx0ZWRfX8MjYKfGc4YK0
 DsSyHgRqqTfSkokkO8uWKL16Bxs9WxgC29g85+YM6GrO18QogWAeOkgV2diF2x3DEIVlQw04p8p
 fdjODEvCY1dYlbcJsoMlm8AQS4zVJxAGXy8W6eI+WwetQa1mVZ3Hdf2Oc/N9EGjFNjuDG4qoeVC
 wpS8giafHPoWtgmlsE/AAkvKljiUAucwiwjVmD4W493tNobTdoGcxaECVOM3E/PoB4szfrDlkN/
 +UiC4aJEJr7I1fKs/56Xq4ZsBJOw8wG1Qe6kIszIze7n+be2N0MzvO1mUCCQHuBiXCyzUUKmh3/
 Uc+5TaFlAhCveXiS6i2aX6JPCmt0UfMHFOQv3hjPSFkjvmr+Fu3WnLiAomERFFWAcPmucLfBMKL
 hv9lIZql3XC2AEV1Q9brcaaufHY0qVSsaL85a2rgWj9iJ8gbxRaQGCsah6se+x6Q7oJIe5eX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290110
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

On 4/29/2025 2:41 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 4/28/2025 4:21 PM, Jeff Hugo wrote:
>> On 4/28/2025 12:47 AM, Jacek Lawrynowicz wrote:
>>> Hi,
>>>
>>> On 4/25/2025 7:22 PM, Jeff Hugo wrote:
>>>> On 4/25/2025 3:36 AM, Jacek Lawrynowicz wrote:
>>>>> From: Karol Wachowski <karol.wachowski@intel.com>
>>>>>
>>>>> The mutex unlock for vdev->submitted_jobs_lock was incorrectly placed
>>>>> after unlocking file_priv->lock. Change order of unlocks to avoid potential
>>>>
>>>> This should read "before unlocking", right?
>>>
>>> Yes, I will correct the commit message after submitting this patch :)
>>
>> It does not look like this would apply to -next.  Does it depend on something else?  The locking order in -next appears correct.
>   
> Both -fixes and -next have incorrect order, see:
>    https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/accel/ivpu/ivpu_job.c#L683
>    https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-fixes/drivers/accel/ivpu/ivpu_job.c#L683
> 
> The patch applies to both without issues.

Huh, I'm not sure what I was looking at yesterday.  I'm seeing it today.

Assuming the commit message fix discussed previously
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

