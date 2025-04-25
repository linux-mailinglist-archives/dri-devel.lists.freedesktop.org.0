Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460CCA9CF73
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 19:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAB110E327;
	Fri, 25 Apr 2025 17:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtP5XfK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B354F10E327
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:22:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK1Np021896
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dWrHzqRALVrrBbGn+IyNpJ6Wx8rjFStvEC13R2sHCjE=; b=VtP5XfK/YJX2Wdc1
 q5acx3nhIBLjmzYr01JLHd2KBpTzKnBMdqqx3GbEfAi3MGCN25E0P/lU/hRUmt3C
 WQqeUD1gAS4PfIL8J+QaoPg5m276IsAB3LrbcSqavo7PT1mCX1XB2A9G8d5VAmco
 yY0OAN7PyqS2OuWpY29+wiZFN9uZ15zFyL/SfaGJAs122sEzPXN6OZhQq3faDHBU
 xVijpDE53NSk2m4GDCfjEJGZIh0Om0QqoExBDv7xM8EhYkI0gVOIgAvLLhL3H4H0
 UXelcTA9o6SYYyfcPqmscDONRs2J1vMn8X3uNI6w1SAsWvDW3hQEMWh03Tl7k4hP
 MM5c0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5hvf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 17:22:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b00ce246e38so2539953a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745601753; x=1746206553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dWrHzqRALVrrBbGn+IyNpJ6Wx8rjFStvEC13R2sHCjE=;
 b=HEXHTqs49oIW4H2GMsgsHfvcVHPKDeR1DFmThAPjvUbtOnVOKrdzTs1r1C7EGnhFwp
 AlXgapmjsTSQxdPHjLWL1lWsBA7Z2NoP43EBGBGwHmHfoOq2U/g69fMC5m6h1j9MA67c
 IenJVc90xf7r12r8mfRMF5kO3J+2MFSOQf2lFN7n811rAMtm/Om/J4NLBP3U4+hKLLQM
 5ZqlCmX97tgWaSHF7V03LtubaJ8Llu8tdlnuc+wXcSfXEZoWzEqYehbFh/B7z57g0+R4
 k+pF1LE1ooJmGEhfQzgnRF+bVwqM4vO4zDL5XGBVzf/og4jxeA/6ZnX8OVmIsH5Dwrjm
 Iwyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwQ6E69RtBOftmB5yBR07a5850SRrxBL9bO7OaUEQlYEmMOXZgBwYd0dtQd5TSQmsfsLV1d7FtTWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6Np3CmDiUsDcBku6gVzRdJWr/8N/F2k2BcfEbv/SSZeMhXiv2
 yjcqT7sT5EYAVEKcLjAsajaEDpvhI8/Nl+1bj0asFKMkzf4mxwDSHR0mxPNdPwILzKEnqW2Sibu
 sYMO8NbG+fzMNpewA75FtEZUlztI6LQ5o0szEnHR/fI/vsq/afhAL2IVFo3u7E22MHe0=
X-Gm-Gg: ASbGncuxxIJtrhOAIejmYtvDzr2aHkXXvJ/tvJFZ82Gxb5ooQhDbKmkCiVnUJwXgy8m
 41t8cFnx3JesL/bvAwwYN/YPP32fAsn8E1K4OvGEu1RPhpcghvqa1DttBWCCsMyv3LcEfgiQxtD
 toxobU1nMpbEOR6TuEcpY/u5h/jMZqdbzOnYC51e520D5zLadYFDRV4rfqqcsXgz2Qo597gU7n7
 2GGPiuLEWru3Ghr//XFW1k5o4/nvGXzyKPqJdw4KLLymb7ZNzhSK3zMeqSmSBaYxdls9lwUd24j
 pw6yCEPt9xSTnSFs52QhV/hm58yrIvBw2mrCGwEnYVZIBqE3PMiQdUkRjvnogw==
X-Received: by 2002:a05:6a20:c6c8:b0:1fe:90c5:7cee with SMTP id
 adf61e73a8af0-2046a6e9876mr97218637.28.1745601753121; 
 Fri, 25 Apr 2025 10:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVOACqN0uKDRl4AjhBt7AIqEIKpJoHGuSpVrmfwe9PiqxTU1hCVMdONUjLqJNeHqTLw9p0PA==
X-Received: by 2002:a05:6a20:c6c8:b0:1fe:90c5:7cee with SMTP id
 adf61e73a8af0-2046a6e9876mr97195637.28.1745601752783; 
 Fri, 25 Apr 2025 10:22:32 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25912ee5sm3465443b3a.33.2025.04.25.10.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 10:22:32 -0700 (PDT)
Message-ID: <087563ac-bf33-4c80-a5fe-b4f2d155d9d1@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:22:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct mutex unlock order in job submission
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX4QYlfEEZJWG/
 hhymVdPs80/A+NKjMOVsb4zcFr3s8Rdq2/bCWuOHmfUCZYGBJBq9cbXxPdgmyHL7mAEUlWPjjfw
 ouf4tkKuAyqDfZYt80FntiMWsM4xf6yvL19LejohKzGeaOZKlWseerrHo96mu4CYRaj5BDq10o0
 FTTPv61MHI8olBf22cd9IYUBxfwl0FT8nv63SK46TLNavpIWz7A6QdD6BjxQHS4LjYfwUTWB5ks
 2IWscgmqwFaWD+WPFzytd1oLzu8GGjBFkOsjdB49zd2/LDpk0GJyKMJbZmz/DPq2lbtzLxC7F2l
 76sCGqZYpLjc6ueWr1w/OGJ1OF1alsDpephav9JvJMpGilcSay7UhObuPtGbdvbwUIwb+DrS0R9
 IoncO2AYTeUiRyyhGXSWXBoSZseBiZ+TA8xGzJJ/vmM4ZR3x9ehtSOYjlRFmjSWZRFCk28sM
X-Proofpoint-GUID: rGNmtIIVicFE0KTObA3kk70ry2slANV3
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680bc4da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=Zh5Ya1MgqvBRKJ2p88AA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: rGNmtIIVicFE0KTObA3kk70ry2slANV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123
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

On 4/25/2025 3:36 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> The mutex unlock for vdev->submitted_jobs_lock was incorrectly placed
> after unlocking file_priv->lock. Change order of unlocks to avoid potential

This should read "before unlocking", right?

> race conditions.
> 
> Fixes: 5bbccadaf33e ("accel/ivpu: Abort all jobs after command queue unregister")
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_job.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 863e3cd6ace51..540923ffcbf8d 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -681,8 +681,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>   err_erase_xa:
>   	xa_erase(&vdev->submitted_jobs_xa, job->job_id);
>   err_unlock:
> -	mutex_unlock(&vdev->submitted_jobs_lock);
>   	mutex_unlock(&file_priv->lock);
> +	mutex_unlock(&vdev->submitted_jobs_lock);
>   	ivpu_rpm_put(vdev);
>   	return ret;
>   }

