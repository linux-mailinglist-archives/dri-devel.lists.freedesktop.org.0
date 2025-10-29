Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0070C1BBE2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101D010E081;
	Wed, 29 Oct 2025 15:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVLFfxZU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXSDXTFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A8210E081
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:43:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T931o64155141
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wO5Gxul5HNascZGgDlE2M64RKOHt91U707cWEZYLYR4=; b=HVLFfxZUgvrGiYxe
 KYRdBAPVwXGdLzx6vcIGDO3E0vvYuPvMfT1CJu0F2nVwfdIpeY4zZjGZklTL8A0d
 X0v42v36hwZs/vmeCSy2ToqVK8KWe+WFUzVW47VeNmuQeS7PjQcKuhZBQiRg8l6r
 Oz7qEzyD8QsXjAZDJgY1TKVfzUYwiQe1PGP5yBj4TCh4veJa0brWjCwoEoE6LX23
 +SVWG9pwu0d+WthW0HbaXp2/iSjtR2a1Z7fkf/y/yMckfp7s+atFtptl3AbruSTy
 h25aiCp9sBUYHE1Wzxyb2poE63YM8lgDv/Cg2uzpBmfQWaLFqDhT6zryBxfNman0
 TpEo3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0s7s7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:43:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-783c3400b5dso38323b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761752601; x=1762357401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wO5Gxul5HNascZGgDlE2M64RKOHt91U707cWEZYLYR4=;
 b=jXSDXTFBeasLuwbcXN8rueTXbgN3sRimiHPzuA5eCs6MgzIGmkdUDWvFP5qYk9SULf
 nP3x0P+HrDoCELzkBqfb7cshE+9I6+u2pmUezmUMFvH8QyihWzgyGpzAr/IJDePv251E
 FRIWgXCLAMl31TMlI5nhAIdpCSlvTwBNe8WY4BppD4uUUDWmRs8s/AKzcwbiO4qXrhp/
 YdYkAiO2NCx4W5s/f+4jPs2N/IL+5XBlt6oaq7uTiRXxmMgI3Y15iC8AwtLkqYjIp3wz
 FweVNvDQDW7xUfsgk/JEoBWdJvfhqjgvfTEmTsGoBGGlsF3CLHBMK7rvYIVFiT1ucwKE
 TS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761752601; x=1762357401;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wO5Gxul5HNascZGgDlE2M64RKOHt91U707cWEZYLYR4=;
 b=ZYllk2Z3Xx/FlT1o0uOyVsU44kn+WTLeHDW/9a+xP3jL43kq750MFIofkGSbWxJ9Ig
 W/Y2cWYx5SGolkBVv5GL/6SDmyL4pbQxXf0BhwGwTRifQOskLTb/+NNbGBst+b4gA3mF
 OSzitsbdtHfo/Z4TEBetjmRpLmxSY52yiHDGYOajTskazv1te48SkkuEYWjFKjgLBTtD
 XsCo8cC6rWG8nb0SfmcpiI3WuaTQ48b2afkSDSnPMaCQ5jX/AhuByZIO4f8T69c6FlZt
 JaqiB/iruwBUaZb6NjBBCT8QMeGRtQc++amWjaAtVd/Vx+HpPuhPMuybaV2Z77gb4qXS
 Dhnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8jb/7BotYTO3qIFWw0y3RiLzJ/12MeI+KLk12ZfkwKEd4UnFokk5RMCfgjblBnq9VcigsebBVn6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP8a6rgQvm/GWewqbFWS2q+V+k3hBI2oTAvc938WhapeMCf4Yr
 AsOgioNlLGqpa4VD4eJyRblreQj4l2z25C44zc6WUY2C/3Frr15VU1II1OBkV9OI8OAVYNvViIa
 mwBQqg1hChXjm1hyG/DRWVnwoQxqW5qnDuqtk0yBVNzEZo5dSmkzU/tgRzdLECPTnj7PXVdQKeo
 Sp0Xs=
X-Gm-Gg: ASbGnctZGLhex4xrWcSTcUuyMKkz7shoM/mFPEdxMAax/VTMpXfkpdwzLi8fpBVjYmu
 gEGShaDG8cROdNFcXZ7mRqct/JJw2zuKnQRQ1Szvr6c276lZcIZUPk+7Alpi8NUiLbYykEyD7oe
 2Qx0c8pKxKFBtPky0j+mj03bkza8+2loBM/fnAKyOxpdLJj82Z1qu1GYwuZAACgFCssldip+UKW
 GxeWEex8yuy1StlkRvtq6UKKjiJNS8HpMd3ruiYK4P0ZleZp+JO/7Z1skEl6gYDaE8NOeK7BrdM
 9RnBfnRX7n23UftYJwjNKy6arpm3bfaZmGI5NtBHG0cBELdt5WLJ1APfuHs2cuJNscZayC23wJH
 rIdtt+/NMLlUD+IgXcOgwausgrvhISQv7wCQmJc+jfSviRPTa8Z2D
X-Received: by 2002:a05:6300:210b:b0:343:72ff:af73 with SMTP id
 adf61e73a8af0-3465145f724mr3810331637.2.1761752601122; 
 Wed, 29 Oct 2025 08:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEJJHgxA1UcfDN5CmPf0kuguVOQFfTmf1PrZ13vlI9OSye7L9rPreXirKKbOVMM2G711/d/w==
X-Received: by 2002:a05:6300:210b:b0:343:72ff:af73 with SMTP id
 adf61e73a8af0-3465145f724mr3810295637.2.1761752600642; 
 Wed, 29 Oct 2025 08:43:20 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b712ce3a90bsm14639168a12.25.2025.10.29.08.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:43:19 -0700 (PDT)
Message-ID: <0bb2b8d8-4ed7-46e0-a987-aab3dd7fd055@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 09:43:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Add support for userptr buffer objects
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20251029091752.203198-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251029091752.203198-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6902361a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=sAj7zE5kuFSqJTmTNwYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: CPiPGOKWuDBHUyzqT2NWO3tLK4hzIVdj
X-Proofpoint-ORIG-GUID: CPiPGOKWuDBHUyzqT2NWO3tLK4hzIVdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyMyBTYWx0ZWRfXxXuR74haYyDI
 /eo4hcd2GjJObuba4dNfDUF8H4jt3vgUi/cqyq3jGgjEAcgjDEybyuf6Toy1VqNUc8gMkjkjLUW
 SWKKiiUPMWVnKq1Lskc7NEhHgK7w4GvztHbjxzfRn7A5gbvjRaNByRGYrxeI1Bp8d3dhLC+85/w
 Ue1XkSYNFPigl6jKDT3KLAZN9CMhvDYothYzJiEuWf9s7Y1WZ4PQuVNpxHAQlmXHJWkTsoCtV6V
 WeDe2Aoy9iheApiyrYaUR3LrP+QOUulw7oQDC1vSlPXGf0MnvyyDmUEqeJi5kSqb69TU5OGkqS/
 6vqIeQ52kIHj7n0UidbGe/9rfb2XOazHKithW71HKlSLpkwei2FqZRhhMsjcHjCcafc+BqFsJcB
 O0zQCVyN/TxfZxHMXgGR91Q0+Q3GrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290123
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

On 10/29/2025 3:17 AM, Karol Wachowski wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Introduce a new ioctl `drm_ivpu_bo_create_from_userptr` that allows
> users to create GEM buffer objects from user pointers to memory regions.
> The user pointer must be page-aligned and the memory region must remain
> valid for the buffer object's lifetime.
> 
> Userptr buffers enable direct use of mmapped files (e.g. inference
> weights) in NPU workloads without copying data to NPU buffer objects.
> This reduces memory usage and provides better flexibility for NPU
> applications.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
