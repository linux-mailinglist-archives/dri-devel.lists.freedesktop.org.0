Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FFB0A936
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED54910EA18;
	Fri, 18 Jul 2025 17:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9HONGQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBE710EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:14:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IF1Rm1022444
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hvQRsE2lG7WyIIQnwV/DeD9T4vuk4piXmEgdbjYc460=; b=G9HONGQ2Qa2uUbLZ
 VJY4Lqvyrv1n/8Lykdjk8ImdB8+wf9SYMMzho7gbPSwHGSDoxrUBE0CiNNwxX9tU
 eiuk2i03SYOOUMR/fzdvSMV4XqbJNDyDuvShdivyYxYc+NZo6O9pnZkJG20id4xH
 +GQ6CivijZWO/Yf86g+q8FR696sTRXmGqNM957Ntrk/wR/1dcjZG442XRPYcu9Dl
 2t6TTIi6n2flM1t9PB5QfE+BihzXzRoIFag/A/QdGofEojZLvcAH6xsAgHzN8Kev
 m3Vck5j3SQIkQddI4fbh5TebcaUGQBnIOFC3p8FE571tDb26sN/rlJWab2c9WjXO
 d5BCRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsycda9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:14:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-311e7337f26so2456020a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752858886; x=1753463686;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvQRsE2lG7WyIIQnwV/DeD9T4vuk4piXmEgdbjYc460=;
 b=EUOaXTbHC1HjeoD0NweSRMbhn1DFSp2dkeuG+KH0O7yLrsY6aLeTEcq/O2rTlPmayg
 vzg4QWzyBRDLtkxgkXSeN3GywJiczW5CIRx89h5Zu9CREd1lFBwlq7/HXtjaWKlQolHt
 2vWxCq5VLm0sFHwXmCPLE8ZUpa3WAn8vd/gfzdnjXhpDLlUUhqgYfwXJCgGsExMrzxHq
 RZMHKFp9f9kx2mumQpyN9CTBLQbAHS5ToCGI/4bP+7XXgSrBTVayAubUk0sFQd8RVXBp
 LEmzxeVNMDdEUaKXMq5pzKEIjy0u2dG2pwP53JEf3IEdaWjlAo4QYPMl88GE0Z1tJovs
 T1kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7AoD4TQ8tep+psIrngw5fGYpveiHsbZPK2hfhlI/i4dUyH9gsLqNn85PIjkfFSOQMznLY9zk8pFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9PEzxt3rZLrmFc5XVkPzlYmin1jxu07ZDeAFARYvokD7LQAkP
 7wejC/EyJoMQ0iFh4yGUkV1rDgRqDity/UPMBlu2d6YxfLWSOvRkina/splxLtOEn+Iwb6Lgq/r
 ScEcKbaedJ/ia9DiRErduu7Fahw969hPAyQYrcUqIET5wYdPHw7DL6xgRAwmu/FLl2RKA2hs=
X-Gm-Gg: ASbGnctnSBA1MpbhQQHCdNIGawxjGKw6UXw13LRBFOlNmiHEUlk9eaHUkapsc+YK6x5
 a3pKMB+A5jA0/uRgCd0v+juU3I8KJA85QE8wK0mOzlMH9vSMH6XXOTv0MnyjMmsoF7v3bRM5/+u
 M/je2mqsxE/A4gRh+PgNv0H/8ZCPHSrFp9rwzTnMU5bZwo/y+UjduF0abdT49f/sdHZqPWcS2S3
 79AGti5f/yCvrD3VHDzyzCkoPwS8a4KWQYexmNOu2WpO07KwU08IySNifyqZiXn+nexWpsQvHCi
 UZBfT1SDORXvWdmRz0PB5+GRsTpuCi/+kQQJcCqC6n6KC5BUNfhZcrM/RaffdqAHeVP1DRq2pK1
 fECcd5sEsUdQqfw==
X-Received: by 2002:a17:90b:48c8:b0:315:b07a:ac12 with SMTP id
 98e67ed59e1d1-31c9e6f71b8mr18347574a91.14.1752858886378; 
 Fri, 18 Jul 2025 10:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZ4uYoT0jpgwok+1LqJLQaSu3L2fEp1diUxE597ewVDpbjd87lEWbuWkSUsEweCpZR2VK2w==
X-Received: by 2002:a17:90b:48c8:b0:315:b07a:ac12 with SMTP id
 98e67ed59e1d1-31c9e6f71b8mr18347517a91.14.1752858885895; 
 Fri, 18 Jul 2025 10:14:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e5b56fsm1593934a91.16.2025.07.18.10.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 10:14:45 -0700 (PDT)
Message-ID: <7753e1e8-5e2d-4d8b-8a46-a6fbc58a144d@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:14:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] accel/rocket: Add a new driver for Rockchip's NPU
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
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Robert Foss <rfoss@kernel.org>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-2-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-2-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNiBTYWx0ZWRfX21Zpvs1S8kTG
 U7mON8kCLhAFcdMvM13toz4QOecQX4QhwsRcQs4orAFS4q6Ed15maGVVUoY6EUgjYNL3t2+bVWy
 IqXWCRTXgHbQ+fBZUfS/PZj4+FysD+qTBoYyiKme9NJZ2wmQPsl/HB2r6m3TIvJFcaAc6xZgAiV
 XJ1HiX5QS6xN+iAA9KXpEpy21RRctVOquBK+ZHVBzZxUv3iMLeK6WNOQZUBPnNuR7PC6w18WG05
 9iz4daWffhDOVTpMip/M3t9DviPaQdXGz2gFyq3KMj2YmcRbm+IN6baCltCtoEXhkGoz+BKDzpw
 AjJQvSymznVtfLxdFcQ7RhYtkXfmfN8GyhircL1yGc8xhHCIHm0a5VB+c5R2DFK/c/YnXvlAmWz
 ILn11rC0qxpoP7UHAmxFDz+E0CsrUpYoIRB114LHXiEDe9dZnDQOhcOTHscJBdxDW8sJoeIc
X-Proofpoint-GUID: 9cHrDzUvg_F_E24TVj_g2XpC8F54dMiu
X-Proofpoint-ORIG-GUID: 9cHrDzUvg_F_E24TVj_g2XpC8F54dMiu
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a8107 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8
 a=EUspDBNiAAAA:8 a=V6djkQ_TFPnTOxwyQKcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180136
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
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
> 
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
> 
> This commit adds just hardware initialization and power management.
> 
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>    Frattaroli)
> - Move registers header to its own commit (Thomas Zimmermann)
> - Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - PM improvements (Nicolas Frattaroli)
> 
> v4:
> - Use bulk clk API (Krzysztof Kozlowski)
> 
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>    (Kever Yang)
> - Use calloc instead of GFP_ZERO (Jeff Hugo)
> - Explicitly include linux/container_of.h (Jeff Hugo)
> - pclk and npu clocks are now needed by all cores (Rob Herring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> v8:
> - Kconfig: fix depends to be more explicit about Rockchip, and remove
>    superfluous selects (Robin Murphy)
> - Use reset lines to reset the cores (Robin Murphy)
> - Reference count the module
> - Set dma_set_max_seg_size
> - Correctly acquire a reference to the IOMMU (Robin Murphy)
> - Remove notion of top core (Robin Murphy)
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
