Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E19CBF1FD5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9A610E467;
	Mon, 20 Oct 2025 15:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgyJHnuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC84210E467
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:05:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KAjG7r007402
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5z5MewFkGwmNnAnqC06HYK+3gqP2SAPPRZsxqJ+mes4=; b=cgyJHnuo3bigLGpd
 L6VeLeENo+1K4lFNWLwirr+vFm7scmZ6r6oWmW7NjF52H77FbNynQk4BmSYvWNq5
 tddNP5Cvf92+wTkwexjxu1Fto5PTXP6oWVVEE/dz63rrnV4n16WQRx6mrebnn5jq
 Z9Qk6oqNG1MDFpAeDXgFFLG4t2Hi1ZoInnpVtk4SnvKW3k+ZWe+7Fkv4kpnTY7vH
 TnSxPKh7LT+fIJbK5a2DDNsL7hUHRYSHN94md6+IV5vEURM36EODXaut0tB9kQ1r
 W9a4XDUOWZtrZRVB/7ZCFBD+H9WFAv5MTigyt3Kl+mEfx0pDYEp04DAg4IfWHR9T
 przwvg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7w6tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:05:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77f64c5cf62so3387864b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760972719; x=1761577519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5z5MewFkGwmNnAnqC06HYK+3gqP2SAPPRZsxqJ+mes4=;
 b=vlEJ/lNRMONj3D/aqbhpCOvYDoPfHXLQJIUlfAED0kszEfBAkpEGqzlPDpWY32+eSd
 k5vxzA/z0VJdvqewNHJVWNaIzteIq58SRVtt9U7uhvcmFzV6tpfJvoq7e3WhFUeg9XcZ
 OZVkXjJSbD20Dw6En46ZfmWbfb54MZLShtJo4fdjPtUUkK8+T/t/5KkOF38xuzvdCzcT
 9t4V8+wUS3AFjZvaLGnFYswqHA81T4aANsmE+7krpbYx1U48pxzT0rsf5bfc14Yaq3yO
 MoUTC5jwUJ8GeuSBbfgD0OJV/Jw5XjlEZRezJj6WeHoDfg3GqDEyrz5E3ZIqWNwkQTNS
 HdJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPxdpf1do06NGlJX91UUWD0xHqQjMhe+Y6Gpku7giF3zhsioNsOLw48ANYDFtwlyC9Mbiwbt8Caro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRb965DyrPefUyDty5uY8Z2uBeHnXx08yLQ5NTdNoMydM+sy+k
 65LfvMxzDNl1rK4giXesdAQAxtX6FLwTITwu0U04mI9K4lkRbkcPZ97lSacfm0boTxXLmDjEAsA
 c7Tlp1ofkB7Iu+l/zMjdyB7Y8rQ1I6kGgPL0cC9SEigFNDor4jUpp00NyeIOKVFTbYdwQtQY=
X-Gm-Gg: ASbGncvTPgFXwpmGWtbNqzb0XgS/TB6szUYBMEpTEiywPvrUDD/LsZXwzxb6P5LGDec
 CRQTxTTbCRW8jw/aiXiwD5gLXodjTPk1ZAiFsJrg2TsJhAHGND/Pxg6/qZ78HS7qqV3/aqS++y3
 xMltRiw+GpQd3kQGy6zqLPxD31TmbDJLIs0YW8jVMM9WzL7R1SodTDdvCeSEBhdcCCg02wd9AAn
 l9EeeiXaYXqumoDztEgoR5X3SDZ1XngnhFXuouoxMVsKNcTsQlEqLoIWMI88QMaRgV61RpVeHeg
 8pR2mVTobiBydMWgHJgTMeexx5DRWeIpl9Z8k8y36BYgdZZRrmf/qi2gtKOjFrt3mbAMRUrGT2k
 XIRkNXl7bKsUmW2est1Q2t+5cvuK/yBoMvswzXR1P0izt8HWKYg1E
X-Received: by 2002:a05:6a00:1741:b0:781:264b:dd96 with SMTP id
 d2e1a72fcca58-7a220acb6aemr15829083b3a.19.1760972718931; 
 Mon, 20 Oct 2025 08:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIOAMUT56QUDDEA01lsQBBeCyp1tjentLRkzWhpirh/HDomSuboqk7/aOjZXu4oF6E6GaDZw==
X-Received: by 2002:a05:6a00:1741:b0:781:264b:dd96 with SMTP id
 d2e1a72fcca58-7a220acb6aemr15829043b3a.19.1760972718491; 
 Mon, 20 Oct 2025 08:05:18 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a22ff1581dsm8457437b3a.12.2025.10.20.08.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 08:05:18 -0700 (PDT)
Message-ID: <a4367373-a0a4-4876-bec0-d8a560244c40@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:05:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX10tYrEmX2ra2
 PM8bo3QigQNLZfebOBTUR1GoLS1a2MeXUxfUP1r86PPHNbDH2MYCeKL/SqYOseMVoW9kLCLrqaW
 wMPrgBv78ni7udeRS14Jf32XURgfwckcxWMXosVPUMrPwbyzSoJCCIcfmSMPLLFs2MQMGB2lfhI
 j+aZq73lLz8DkHVcO3SBjBw2p40OFHjilO0KaXRQYvI75a6N8gltjgnfhV6BkiBdIJ9GhvAyCKD
 2YNJ427ricmgTI7iFjKizdlwRlrMOvJn4m7VdbYXzx5KNJLsNGefhCxZgaQz75x+b+7bhO8JM49
 5zJj2gXc2Dx2r1C4f9Oio5ZP+5WUp8KLaS6KFJMKnPIdEZVgXKnPT2xwOXlnfA77OnU0xh+K0SW
 RjNOa4L1a9S+OfyFGLAqqLPwlrEZ1g==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f64fb3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=u8OtsHZsk4mhN78VeKMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Z-bHGgpzwrcR9AQ-DRTRGS3JeZLS_gie
X-Proofpoint-ORIG-GUID: Z-bHGgpzwrcR9AQ-DRTRGS3JeZLS_gie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On 10/15/2025 9:22 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Youssef,

It looks like this conflicts with "accel/qaic: Replace kcalloc + 
copy_from_user with memdup_array_user".  It looks like we don't need to 
bring back the overflow check, which would make this change no longer 
needed.

Can you have a look and see if you agree?

-Jeff
