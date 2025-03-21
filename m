Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B84A6BF2C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA1510E7EE;
	Fri, 21 Mar 2025 16:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBt27kD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3150E10E7EE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:09:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATEVg031798
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=; b=MBt27kD4ga1ISE1Y
 oYW+r5SB7YuIJ+WP2qd2UrnA9bVoMbvLpp5Ag6nBiypSs0xrww2+q4JskgZvPgEh
 FfXtDFZQSKbkuuGSua1GvghQRGqBh+9M0S6PEv7JSilvs2kl6QO1uM2FN2H7Zjnr
 LDT7PioLyMjyMH0rl3DqPfPkkWX9cjW4KzssK3WpktwvD0pvXnotcSGd2uKYVkCB
 JM/Tqlr0ZQUgjKJTcL48w3PJVc/nAGf82cwFwiuHmOegvi9e+AD/uQwQWf5RFnOc
 sVLDE2CO6twu/klPDlOell0cX7YaIgiWxafKlBrI1ye4lLVmpLJdRKzyD+3HWF3K
 IrpZ2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kjpn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:09:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2254bdd4982so50949095ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742573355; x=1743178155;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=;
 b=HcZVwCXMN4msLavgeiWXjj82k2rPUCKIcNcOVGYATE2mBKsZH3bCXwx0T+MQfqhFlu
 kkItl2v7TQA5lyFYg8k6//LpP99WOo2F9FENZlZm68+cxtIil6tKefvTmd3okG+AZgqM
 HTXTBjvjFgHWO1bPIw0clQLaC9c4Qkbsi7U5OryR+U/LMDjpPB0w4fSKfAgd1+TSxTSf
 CMxq3F50xMO0k2h4fOa7jx/vzfT/8ZQnN9ohnvD5FA+6sFPNOaG8hfM0PEj0GthdbAtq
 hsA832/NJ5vRRsOhpBCubaK/hbu+WFZ8KKy8Jcg1Gv3kAEUrZ8fgdDKLzuvX3fLc35Jy
 SPIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCX7UYOtvY4ZmQs6ThPwRShV/L6k1TpsPgPZ6+SEqP8NcPgKFcYG5IfjoG+d0K1tOptrlY08OSdPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxusg1+AvXrBzMyA/izj/CVZtb9IcbhpVSMmP0qICeI9bMvokbn
 Bcg+i/ntyl5srxAoJO38szxpDYVhHho8HTkESgJidk9QHngArgvv16//UoTdh/dxQ8TGnh/8zis
 AmjYKFSG2rnaOGlSD8Z6c9Rb3TtWABiZoWxvvTo1KDPousAYdQkV41PHEKs4qxGEfFPY=
X-Gm-Gg: ASbGncs9Xmdoyrst2FXT0tr2UWnMKndSG7bcOuuTIV1HN+JgGol+6XPTt6If59UnJGt
 iAwQ91Fp/sYrej9wGI+BJjXHtDCJQCl78ook84CMqLdFDkKsvKL3zzQER+iOIMRI+PMo9Ujgy7h
 xa5prLAQrWtzZw6MHasjXX8x3bxu/Lt40SwcUJGEW2eIRJOVT90afRr/roNIXHm7hkFb76/iNyH
 NveftuPgPnSjs3F9uVpo3RIydjggKEpFQcTHnt5OwF71kiGSt2xJK6ZiNTjEZVFDCdpiwHKFVFW
 MF6Dp+P8yUJYBuVLT07dYMECGFKKbfg9SdsTVMuvwiRO1U/zlGmDNn+FYlY1Kfk6lw==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id
 d2e1a72fcca58-73905a530a9mr6797802b3a.21.1742573354442; 
 Fri, 21 Mar 2025 09:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL5fYByHbvsD/gRtsSQfXYP8pBS52gj7BStPaMfEBPmc/gB4ybx9sZflEDEhvH+V7H0dixLA==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id
 d2e1a72fcca58-73905a530a9mr6797719b3a.21.1742573353797; 
 Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af8a27de717sm1957838a12.12.2025.03.21.09.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Message-ID: <4d617199-191c-47d9-a0f1-5bf9c149d09d@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 10:09:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q1Mrwh_wGl1FfxPtnJDqiN7-WUq0dPPl
X-Proofpoint-ORIG-GUID: q1Mrwh_wGl1FfxPtnJDqiN7-WUq0dPPl
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dd8f2b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=otp63fjl-Mw8CRR8ssMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210118
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

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +	/** DMA address to NPU mapping of register command buffer */
> +	__u64 regcmd;
> +
> +	/** Number of commands in the register command buffer */
> +	__u32 regcmd_count;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into account its
> + * dependencies with other jobs. All tasks in the same job will be executed
> + * sequentially on the same core, to benefit from memory residency in SRAM.
> + */
> +struct drm_rocket_job {
> +	/** Pointer to an array of struct drm_rocket_task. */
> +	__u64 tasks;
> +
> +	/** Pointer to a u32 array of the BOs that are read by the job. */
> +	__u64 in_bo_handles;
> +
> +	/** Pointer to a u32 array of the BOs that are written to by the job. */
> +	__u64 out_bo_handles;
> +
> +	/** Number of tasks passed in. */
> +	__u32 task_count;
> +
> +	/** Number of input BO handles passed in (size is that times 4). */
> +	__u32 in_bo_handle_count;
> +
> +	/** Number of output BO handles passed in (size is that times 4). */
> +	__u32 out_bo_handle_count;
> +};
> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Number of jobs passed in. */
> +	__u32 job_count;
> +};

These 3 structs will be different sizes in 32-bit env vs 64-bit env. Yes 
the driver depends on ARM64, but compat (32-bit userspace with 64-bit 
kernel) is still possible. They should all be padded out to 64-bit 
alignment.  When you do that, you should specify that the padding must 
be zero, and check for that in the driver so that you have the option to 
use the padding in the future.
