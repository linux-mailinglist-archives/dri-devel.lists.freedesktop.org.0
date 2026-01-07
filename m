Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F15CFF06A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 18:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945BB10E64A;
	Wed,  7 Jan 2026 17:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmvqjGmP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLkqDB7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DFE10E60D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 17:11:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607H3u3m3049808
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 17:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I5A6LMvrvdG/sA+OhihB86YrSIuIZXOnVmSCc9pMPCU=; b=SmvqjGmPe90I8oBx
 DOOKhRaTF92Ogaf1Bj4FlbWdcFXCtQdE27Ndt6UPLGo9PUVRLQlo9bZP/5oRlYjC
 rLXXoOsEtMK490CUtaw5WvwdNn2Ph/Xi7sQroYjnaoZ/wCBYRj5wXEWP7u1A+KlP
 NJv6viAuqD+UMuNNFOSASxN2SOnEFyC3kT4clK+tCzb7ImWoD5ufGWkDBsiQVA6Q
 TO9T40RcVk7dVMaXEp2x2AxFJkaOqmfVnluVUhxg9CEnJ6XkB9P6pvZUeHcsJfDn
 UVhQiPWL/HxdvxWN0xWOJV/+6zMJOoQzOluDoWOi6JX9VDt7D4fvQJx/ZqD/xdA/
 pIRQzQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhujeg193-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 17:11:48 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-11dd10b03c6so2399232c88.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767805908; x=1768410708;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I5A6LMvrvdG/sA+OhihB86YrSIuIZXOnVmSCc9pMPCU=;
 b=DLkqDB7Xr1IBieu8benhPhIboi3bOuu6mIfBcf1bOnrJlBgiEzhwybApZgm5xQ9nzC
 1RQLD6Lh9BTx1kKdjYri2MkHmkyZ92bbl0OwB7Z/J/8++lvq9OBRbCkRqhfcmy9GvD88
 NHC5zPe46N0qLBnCKDD0FkB0ZF5P9QnS2ujjGVCteej0Yq3TerNv4TTzTQbwzRs/sXMs
 tfARXi0OKpEslzRr3C+TO1Fth5TjK1zooDuovVH9VK9cZcTyqa9I1ZCwRWieQdRFUD+q
 e/wvy4zlzvlcTvc4zS/yq24FWeSjZ2ucteWWO+NYwnTFHeZgC4pXjRUzqqUhESFf/TBT
 tF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767805908; x=1768410708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I5A6LMvrvdG/sA+OhihB86YrSIuIZXOnVmSCc9pMPCU=;
 b=DtkALSVegsEnm/OYGYc5pF1+4hRwaY2HPo7u+F08XzzA5cK0t8SqbF/SIYVuvkTJVA
 NiX61YHHvI4Na1EHLf2ogsGFhApDHNyqYDDu1O3Mbz0kg4oB3SzCArlbCSe/WCV9JyLN
 KJnRqN+ugpncwDzZOGrfmn8dtNoz7/YzNU4+Q8BjUlPWBjd91EI9XKoNpuSOEuRpaBs/
 5zrkUZtHAPhyKQjJfV/0SN/G7pjZSNtYLXr5Q2e2LnYTJmF+mfWmNpbfBav8m+pIXfCm
 NhfxJjaK0+kTq1vtsaItO7N8JoZieUJHBSfsQ+QNEbJF3V6cVq7GTjbb5p/fKwVYye5T
 UAsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQl1rSTxATlj2d5RZVzjFQO58uEomi1K0iCdk5scK+huCnvnTLG1Av/6T2PIGaQUi2Rfyku1tzxRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8DdrCZnn4kvIAFEyuyIk+o7RUJ+qS1mQ83xeST/nSPQLyvt6t
 aUlEReoOIBn+hFfKDukGvzBiAOB6ntCiVINDuHsRwYUF9waC0ojoS52Azq8f6HoDe+a5KIgvsI6
 gzZkcNgS5yGFO4tRb+0FeEpTEyjkxqXkNo/zaOfl06WDHj3Y/KPz8/DgOxtKKCYCpS308nOI=
X-Gm-Gg: AY/fxX5Jv2GqvY3fCMu2mvPqbjonUz3oO8bEQCoyzN9WBvCUujkQgS+uyvEv0IRRLIy
 RzjS+dqEB2IdS+GyDEtgjKpQJp4oDBfcz5dAMzJ0qvSiqUo5j1BogYddatOVKefR7Ufz9hkNNBL
 mleaRZ0fkNiT8FVa8h2zWBZjMQqLn+qP2+3FKbQueIam8DVlMYtFtgc3hisbFJTyaNkE7rJ1GFz
 A71vTz1EoYWGamaQ6OU4g85VCFmK9X4DwMKZkBFdnfAhW3boq+1dbVfOn/8ExH0cn0zju4xQHlw
 2rX7zd9+ee4P/tlnS92D8wqZ1zASaqRCibYCRpqSfqRvAqetjzPBl9xttbWKc2AcqlscBZOHF2i
 llFARVyf3Z7+LYu7dwQ98BKkhNPEJxmm5tsxfr/rt2o5U0cP1nMEuHhqaWWhGeRI=
X-Received: by 2002:a05:7022:113:b0:119:e569:f626 with SMTP id
 a92af1059eb24-121f8b7a9f2mr2680616c88.31.1767805907582; 
 Wed, 07 Jan 2026 09:11:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxqAGFzrRCt7KL+vHShVfUylOQM9rwoGqiRacKiOHEkY2vYbHl+9p+afbSXZvPyvhL2Gw7Lg==
X-Received: by 2002:a05:7022:113:b0:119:e569:f626 with SMTP id
 a92af1059eb24-121f8b7a9f2mr2680588c88.31.1767805906991; 
 Wed, 07 Jan 2026 09:11:46 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121f243f6c7sm8242111c88.7.2026.01.07.09.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 09:11:46 -0800 (PST)
Message-ID: <ca17e5d1-9de9-44b2-a15a-664d50612ed6@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 10:11:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Implement warm boot flow for NPU6 and unify
 boot handling
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251230142116.540026-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251230142116.540026-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKNyn3sR c=1 sm=1 tr=0 ts=695e93d4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=yFqBbELRJrckAezSh9cA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: JNXPQ9VNqhA6597dSTdBwVWRSQAd1GHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEzNCBTYWx0ZWRfX3EsMvu5SqWHL
 ycQvw3P9uPGYfLB/cqssFOxHzvMTFAX2auvEIU7wAWuBxuDE7/in/OxxUCqbEoFLtrHFE4O48Ho
 IZaqGw4fGXZeX/owAdc28iUWg6GWKuQ0M20VnGfGumxpOOyVtVyrong+3mlxQybRbBIaUuJA0cV
 VSS/kItSVsK4WIKUBhaFPlnUqt5PwSVg7DqQsKgSdLB0DA9JAztis7f4CnMrgTO/7M4nm9vcdZV
 rV3BHmC82F71sPiwi+16F7WEGhgwB6Lyxw0K1oIXyJjaWrUZFZdYxntCouqmN2zwux3P+wXhkuI
 dMbE5+Mg10KU0MXtjDvQSmEdMi7TIMEHFsIKHZi42fV/85eaHW1rGInKK+9/sE5miqNRw1QsHiB
 bZON2vOjpAAhrgz3l18DWnP7nUQqdBUAUn8X3UtWqDmB8TSKK1T6b5QXUqeCpO+IuDNiFr0Kr5T
 bRFVQDmfY3Dj7I/3YOA==
X-Proofpoint-ORIG-GUID: JNXPQ9VNqhA6597dSTdBwVWRSQAd1GHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070134
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

On 12/30/2025 7:21 AM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Starting from NPU6, the driver can pass boot parameters address through
> the AON retention register and toggle between cold/warm boot types using
> the boot_type parameter, while setting the cold boot entry point in both
> cases.
> 
> Refactor the existing cold/warm boot handling to be consistent with the
> new NPU6 boot flow requirements and still maintain compatibility with
> older boot flows.
> 
> This will allow firmware to remove support for legacy warm boot starting
> from NPU6.
> 
> Fixes: 550f4dd2cedd ("accel/ivpu: Add support for Nova Lake's NPU")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Happy new year.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
