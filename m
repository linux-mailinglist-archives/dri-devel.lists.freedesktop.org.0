Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACBCB0A96A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD2610EA24;
	Fri, 18 Jul 2025 17:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkhBU3LM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D0B10EA24
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:26:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFxKPI030598
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=; b=WkhBU3LMpFoMdlPM
 vAqhiFUJdo1Zy9EYgRDMvp+udPTuHcKx9lPDzeI2ZXq/5cm7elI1QDI9LLxeG7gS
 hM6o9dZC2AWKDDE9ER2UAtPb/2eWJ6s7I3lTT8VDrIQ8Lz+8/oZgNsOnR6tkiv3M
 94c+I8oV1nqbS5IF9e9qGIAskI1hdNYx8UqAIqikMGRgjMivqEVAGMXOOwgcHFDw
 86IzJ625OAki5wWOvc3cxljvy5wf4/Gn9QN7kvCjiE5iYaW7iZNCxeJgbNqMtIKR
 jnNnOF8dKB9rBjiPu7wk4qG9V5hUF7oHJKiK64hHUIbeNs/4uKN/X6SZ8025kYzP
 0hTlwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7s8x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:26:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74913385dd8so3211632b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859610; x=1753464410;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=;
 b=GgvQGaZhql0y0CQey0hkcHorR6gFKX8bNkZHW7CW73CRRv519q0JxlBMC1IpMqmaj6
 lAiNh9Jeh4fYlTFt+Xif6N4LOl35tycdoCLQduRYiGc4KTlYkPoMmeE7Yd8eUz/Jsz2z
 F5erJxIRfsfs+Rt6h77wHNNOyLFLPwDbzQ7yibYFyx/qJaX7ECneHheXARfKiGmeGjp9
 eMy0HKtPFhUscZjpX8XWe04UCh2pTjrkhFMrxFjHYL2YcxcOD61ZJ97WiK9WH1reO41v
 ewLwmBn8siGpFRRX+HS90KpmArCCkHQhcOlfg+joRDYyb4PmQ/n+uHV7pY8r7UAP2OtH
 0FAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXginrZhcpo+gl2zso9hm5gGLejAw6LeAEqphnG1VOSXxjvLpn6/XfWfXzc7g7tuX+oBiqSxXTj1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUKfpN+reH6tspYa27537cyo19juqjvkweAZw6jKbw2dE44xlz
 1rva+o4G7jZOUs+k/LD4r/gCMn6jltCDRKeYu+UvMVAblzfgtsVYfKcRKLIMAo/1lVyP70NT9mr
 k/N29KIy0LJ9TFPK6GnvaKAWTocC2UxuCcH19G1AN3q3+B61+4Keppk3Y/b6HF/2fDG0HkUw=
X-Gm-Gg: ASbGncsLQM0Y1VBVzlqF0C3mi2bIlUxy33DTmisRih3CUOW8GiAJXN6kYa3yLQmo2P0
 ltMSCMm7s5XkY4yMaftBw72lY9t7nwA77JkvuFm8qCgoeo3SisQg9RBSW8ZjzGahhxV2fO7VxXL
 g4Kfa0J38ABmK//v6biDd3oDDpDW5dCzIdRLJyaW0K72zgd6xVi4lqixZ+VMr8COdzXFYpMyYBR
 Q0t6nxzQshdVOfaAwIZAKFf2hFL9rJry7e0ceJ7ar1hKNajRcX5JBEG83OhekuOB1ZDRlCWRW9y
 wRVz03gavb8XOYVbmtl/Kib7qu7WaM+dtVJwz0yIp57Qyp2s5syUWV2N8j9A6licMPQzJUm5ROz
 P8x+/wmKW4xjeMg==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id
 d2e1a72fcca58-7572267d1f8mr16458224b3a.4.1752859609750; 
 Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQ9S63kSJn6y6OyUDc3uTWz9C+4cH8naBY6AZisiTbM1Dmrh1Aqbj7AEM/eK1YFdABEhA9g==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id
 d2e1a72fcca58-7572267d1f8mr16458162b3a.4.1752859609159; 
 Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbd67ed2sm1530796b3a.135.2025.07.18.10.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 10:26:48 -0700 (PDT)
Message-ID: <cd36e463-2499-4e3f-8a02-60ea43de83dd@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:26:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] accel/rocket: Add job submission IOCTL
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX9jJEI34xQgu6
 HPLS/pr/5wb/d6GNyCvu8YZmeq4fpnVsM4aptAGCNoV8Zt/epYG0ZO9Y1q+aLhAcNHrB11fFwWE
 a3qo82Eo0F0jYjL5lL+h/fWXLqIAmSuWs4vMVphqS6xlUhxYHHghvhsz2iA+uavWdDUjWcGdamS
 lITxZE5BXAgwsRNAcKpNOFz9sX/qDmr4BFb7lCHYR/E55nNKyxD97PyQgkdIB7z/AD3Mxcni6ul
 kpO4VFAsOF29bepU4dVtmRtyn8S4aSb/aO5PJwXjcazBiNoKrULPN/czt5GKJ4ufjQIi8qbKiur
 5LKgIcQzzgX7eSNDzJrSuobC2VgPKSMjNe9bXjYFYiAwLiP8qn8YnDLsjDPcDvgSasJ9a3isGF6
 ZL8MdpIWnbRXctHkNQTWwszXfJpJ3YTvt7FMcdqNEEZiwPSO8s6py39H9xWr/WZrCezGepvw
X-Proofpoint-GUID: 18uiaDV7ls1SRewp_jOHA_hR9iolmvCs
X-Proofpoint-ORIG-GUID: 18uiaDV7ls1SRewp_jOHA_hR9iolmvCs
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a83db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=OV0_J1LtQ3fB1FIpcGAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138
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

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>    Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
> 
> v6:
> - Use mutexes guard (Markus Elfring)
> - Use u64_to_user_ptr (Jeff Hugo)
> - Drop rocket_fence (Rob Herring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> v8:
> - Use reset lines to reset the cores (Robin Murphy)
> - Use the macros to compute the values for the bitfields (Robin Murphy)
> - More descriptive name for the IRQ (Robin Murphy)
> - Simplify job interrupt handing (Robin Murphy)
> - Correctly acquire a reference to the IOMMU (Robin Murphy)
> - Specify the size of the embedded structs in the IOCTLs for future
>    extensibility (Rob Herring)
> - Expose only 32 bits for the address of the regcmd BO (Robin Murphy)
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

One optional nit below -

> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Input: Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Input: Number of jobs passed in. */
> +	__u32 job_count;
> +
> +	/** Input: Size in bytes of the structs in the @jobs field. */
> +	__u32 job_struct_size;
> +
> +	/** Reserved, must be zero. */
> +	__u64 reserved;

It does not appear that this field is needed for padding, and I don't 
see the rest of the series using this. This could be dropped, although 
maybe you have a use for it in the near future?
