Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A077C8DFD2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 12:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F4910E032;
	Thu, 27 Nov 2025 11:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYvLNpiV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdAgLHA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4EF10E032
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 11:21:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ARA3Oka642738
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 11:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c3s9CBxgTJiRQa8eHpTzK3iLUVMdFSvbtI6XrPV9Lv4=; b=eYvLNpiVcULrToGI
 lkN8EFl/NraR8EwGLGjZj5gIStpG4TD+Ja0CJxIythDS9boMKfEU7ix1c/PW6Rxr
 3Vw/x8NfYLAZy8KrrFxap+buvjOjHqKx9t9h2fUr3oE8rpPXL1+DVMMZcapSdCo/
 t9FzkDPlYim3ZLi/ewTPbuTkzhl5ckcsJZdhLe3yp+UDhqMoq8p1jxRwjVMpR7I5
 iJ18onIRDNQmS3m8zRvtAF7N/ou/ZoyoHf2yVS3zU2z5V9FgeexPsbpdU8OwnuAI
 NWasY5pTC7sDKg1fzhlWullTPRdR0TRfDPJpWzYC0e/B37J6sUds65vXAhhbPIDz
 JTKNaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmja86x6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 11:21:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso3321331cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 03:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764242499; x=1764847299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c3s9CBxgTJiRQa8eHpTzK3iLUVMdFSvbtI6XrPV9Lv4=;
 b=fdAgLHA3cuO4pNdK7GhwYKgemCZHpiPr0+pv7HzMUu9ZQfXoR8tw7xHLfN/iASNOTu
 VSMMzzLDDxFuz+kkqs2eKvFYAsd/L4gjmeprVfn7Dlt0Tj1qPtAdH1f3cfzNtzIuTzJh
 b4NPv618xBS6eB8P1qH5XrzIP9vggmZYsF46DpXw4moKmPLjufJehqElmtMgXX59OKBA
 7BWEzht+JqKbewZy+4KKybIrAZNB20ZyoP3KSj40t23jdxvPaIVEcHt5UNuohRwHRZr6
 8wHtqxOJG0CIeKmx5GsT5dXzv/tVCQE6r5vM7ZLKJ3mpsZ+ml/PjIAMzeeyPVyO7wvgl
 FnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764242499; x=1764847299;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3s9CBxgTJiRQa8eHpTzK3iLUVMdFSvbtI6XrPV9Lv4=;
 b=adc7+5tWZs3qu4c2TyvvlFMiEC5B8P0ZtG6ANksTqsJIFSM+vIo6nQu4G5JYnHEceG
 Xz2qv9dJr4zsmtd79NCLQmJsTU5Vg1A+zvIPg5CdPhfwiUpC0rc+acBAuF1fLOmabf9i
 KDNa/Z+D8r9gc/mTAuTMJvkyerqxbTZnhUgVjylFGeqH8OiVIZvXfEr1nxFGo+whAEl8
 1EAFkIhD+qAgIMMH4nQ1PcJpVHQz01ft1BVy7uUWy0lFdR2JrSUih319RyaxBY/NIBsd
 fE52+wWBMypcw7KS1nnatfo+lPqqRl8KrjqSSTgpAhUOsI6X2qmqHo51sq9UhxmPQFBm
 bqgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8NBGPemeGrp3jKPClPJghs8mKzZV3hjLzqTvmVCBFzkhLpZkykjcgyrG/e+9ge6Fxvdsh2Hex7Ss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmotXMUGL5Rg8P9p2P+gRbsqhts+f0R4SmLhb17K7pefr7hBiE
 dmiBHFOPuk3U//r/h8Ugu1kt7C5yJmIPc6P4smmgpyJXRL896XE/JfkdG4q2XTD6yal5uKpabrl
 V1PX82e0Buiu1SW0pbLM8CMF5c94kv3v7fwtmdZeGsSRhAvASWALaDEWDjEFqTNMRS3C0t9E=
X-Gm-Gg: ASbGncvjytyhNR6A8sgyatq7IUpUYRgfXFtBSCArS3NXoJHHnGFKcUgMrW4U+kPtpAU
 D66ZoYYOwDh33eLQYNbLWtvbpmn9hCa9JPbs2dOVHQ9xH6W7SIPzN2DFl2JsRU6vSFICGWK6/mk
 j+ZwTYvF11k72YhHjzbknrCM1HmHsGVDLPk4UbHB8f/uPOLhWy950z9/s3kmi/Q4aGvM8orh9m9
 QhcFaWUX3oBkM/e8uzD3D802BGj7lQDt87d9FW9G868pS/qySD9ReR9nqUqzxb56O4SpKtl26zm
 oujsqnT8rM3rcPr+RxxCYCXUC5tgxH6GK7XghuHULnuFRdSSIKyh3e/jjSuGgkM69oFo2EiiwX2
 VEhST6vdp+1AaAlBGwnLXIluehTJYc7gtr541Sbf8l4QVK0mUs0QXBTI7Re8SS5aYevY=
X-Received: by 2002:a05:620a:45a6:b0:8a1:a5c5:ef18 with SMTP id
 af79cd13be357-8b33d47ff70mr2073722485a.7.1764242499076; 
 Thu, 27 Nov 2025 03:21:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmA2YiUlnyWJRRFJeaUrmq4qRUMFf/7SQ5hNuvHsXbOBV+7SCnQ18XSfh3tYP3t1QZvn8IAg==
X-Received: by 2002:a05:620a:45a6:b0:8a1:a5c5:ef18 with SMTP id
 af79cd13be357-8b33d47ff70mr2073719085a.7.1764242498602; 
 Thu, 27 Nov 2025 03:21:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a4b926sm135686566b.68.2025.11.27.03.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 03:21:38 -0800 (PST)
Message-ID: <52814cbf-ceda-4bc5-ac76-34fee485b418@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-8-3b706f8dcc96@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-pixel-3-v4-8-3b706f8dcc96@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MyBTYWx0ZWRfX+GB+Fn7ch2HV
 3o2729naJ6UkA5dJb+gAH066LEYe8H1qh9LlAI83xgJFlNUYNf6hC1aI8VDcdP2gMLM3NK6fHeh
 JhSbX/kUlXpVECphhe4GCxqMGI23bXKuyMoW+HTXfb07Qgjkf+Xj/bs2SAYiGxmwmF5yepo7R64
 QjPceKMkMa8hdT74R21hzUTuabgINri5xNrH4SBlDyOFKbiLzZGOeF+v5t3CHlYurxMaUpdTRw8
 74sYAMTOaY/pjoW2ebAP2trMvUNVxgR29MMszfGQxdNz/KGxBfLCxg78f4oTB3hX3a8GB0PeJuW
 D6VEBFcsql0mpp0JPEV+zBsyTBAwI05Jkj7BlHIJ3ZRImq2Vlx0cWuRp1DYHONw1M4Lu8QLHzfb
 r+lAh4z3r+nydl71hDNSgQCUSZ4IGw==
X-Authority-Analysis: v=2.4 cv=KbvfcAYD c=1 sm=1 tr=0 ts=69283443 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=WFa1dZBpAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xwgITF67okihWcdOKEYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-ORIG-GUID: BIXOiAhhQ4mivS0FPw8qES5gebINL1-G
X-Proofpoint-GUID: BIXOiAhhQ4mivS0FPw8qES5gebINL1-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270083
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

On 11/25/25 9:29 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> Supported functionality includes:
>  - Debug UART
>  - UFS
>  - USB-C (peripheral mode)
>  - Display (Pixel 3 only, and the driver needs improvements)
>  - GPU
>  - Bluetooth
>  - Wi-Fi
> 
> The rmtfs region is allocated using UIO, making it technically "dynamic."
> 
> Its address and size can be read from sysfs:
> 
> $ cat /sys/class/uio/uio0/name
> /sys/class/uio/uio0/maps/map0/addr
> 0x00000000f2701000
> 
> $ cat /sys/class/uio/uio0/maps/map0/size
> 0x0000000000200000
> 
> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
> side of the rmtfs region to work around an XPU bug that would otherwise
> cause erroneous violations when accessing the rmtfs_mem region.
> 
> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
