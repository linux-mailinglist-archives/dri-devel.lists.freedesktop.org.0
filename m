Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C0AB9EAD
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4EC10EAE8;
	Fri, 16 May 2025 14:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjtCsj3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935310EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:34:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBsUjx024687
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PjGl9L++T4IHfDVjPTSIhpe79DGyJHfbJ52WneRyrUw=; b=ZjtCsj3duBH937v9
 TVXm4++pM90TizNYnZfTukBvhVwbnjnSOHedeux0nBtVHh+PKIh/MWhWzWJWlC9y
 lR3n7ZRQI20zDGQhmAwGbZUe63io+VNgJ4eAMkLMNyed+XsoZ3nj2JqcWqWlUHrP
 j41dQ8NXmgbQFnbja90SocV/H3ddj1Xhd1Im0WbzgMADXI8ey9LurxbsQO7b9tbe
 EcttxauTln/5pL9JHqTGRUxlgogS+8yB0riorktFHWRuzpaEY1p05ZBdrv7+Wv0j
 pBwPT/EjOP/ktE4iYE5nJxOfmdg9uUSBgNGu2X6yp69Y4htw88sDk7S522Riu+oj
 3V0VIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp27yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:33:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-30e86c46eadso663833a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747406039; x=1748010839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PjGl9L++T4IHfDVjPTSIhpe79DGyJHfbJ52WneRyrUw=;
 b=qvPGthjEGUU5yejj6+QFc8bF6ll7KRslRz8AzhENISWvyFH5xnmlW45ia9s6CGdgHW
 cKF2iXZq37z1jhJrMQ49Cd3AMD1jvtmQ5p3bQ8KyK4wN0124J9nvEhwNprbbUMJAH70n
 eff3KNMn0Rq3tSMv2sVntk+q2EhVEZlLgdOBsGm3ZrT54S+XWkrqrnp+4xL00HNDvSoR
 lQZvQ47/02+S/uTOc0LjjpuCIHYPjT85gP3M9EKp+rBxAZPOGHRwxing439sD1nbkTCQ
 /zWqQqRsrAiKWMlaLOl12Vp0tg31UPDvd1smqaeL8TXeAXsl3DMb2aYoyFac+O9gD06t
 rJzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSkBhaFARZSaqQ/8/JNNOzkm55DUFYGgAF4rPt/ns0LgF7IX/vVFxRasFEzCse05eDCVf+mLpemZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+1Smovx99hWji1xT/7urXUVKUNkpjNPshFGSz9vTDKtJGyDr3
 T5gw8/KSG3lcwR4jZUzbKHt0Hv/3xp7TuyUofgPFd51ky7FbGcb5tIhjPUPvlljqjzgxXRxocO3
 d1LDseqZOtXd0Qz0V3PfWZWYSh7AjcvqS/aPLaFaEfUJ+OAJp3FaAmJ3/at7Mi5jYZ6cyarM=
X-Gm-Gg: ASbGnctB6jO5R/WGg1y6LWdc8zardc/WIcxvicLcRVuJauuriKBaNuPKPw08lY8QLfS
 LEC8OfawsVSbRoeSU7MmfjcPq4oW/nhqBQJcMeaQY3sfyNbtcC61yCV+u/taW15z04zeOfZBeNL
 PxPhYNLxM2jPTX+9Fw6PuWkEee3kHRk7UwvzWiE4wKqDlV8jLu92GRRMzIHYl6fcTtpRlfalBz7
 XVW8osCKiWHnSSDzH28fl2IFXQC47Hf5OmHbK8ut9XocJcsngVpXiMg1VpG/55sXOV1U1w+yM4v
 0/O3RYnFQLRRVFB91K1vJp6aXSbjIbIeYxfe5MwMh4xFK/8gU4V9Z/BpO1q02A==
X-Received: by 2002:a17:90b:4a50:b0:2fe:e9c6:689e with SMTP id
 98e67ed59e1d1-30e7d509f14mr5306815a91.8.1747406038623; 
 Fri, 16 May 2025 07:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkrlgYH8+1wlShJNDSSHaFOAA60bb6BFvZEaEaYbBJPGOpmu8xbmDyRKNDYFOkwVQ0gbDx8w==
X-Received: by 2002:a17:90b:4a50:b0:2fe:e9c6:689e with SMTP id
 98e67ed59e1d1-30e7d509f14mr5306761a91.8.1747406038067; 
 Fri, 16 May 2025 07:33:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e7d46ef5bsm1652405a91.1.2025.05.16.07.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 07:33:57 -0700 (PDT)
Message-ID: <4ab8aca0-6bcd-4ff1-9ead-11a88f5e3e87@oss.qualcomm.com>
Date: Fri, 16 May 2025 08:33:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reorder Doorbell Unregister and Command Queue
 Destruction
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250515094124.255141-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250515094124.255141-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gLIXxVrZdcT7cp3wLWd_UX-nb_2iG0c8
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68274cd7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=6K0cCaTcvt06gOM4fTEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0MSBTYWx0ZWRfX5jwcEwLSM5Jf
 +8aPlTNQ0NPYihxuj6uxHLG0iTegumJaJoS7L4gEXG58t+nWfH2vf21CGYva2Tj/Vvlev1tpF6q
 YzEhfXOKtee42YueUl2dWivLUq6eNhttvfkbDX9mx35cFFeOUfFXsUwOMyz4w03+Lm74/oLZbaP
 i9Syu0MZ5JCFRG5cx50JPmXQKW5WoJZi06X5Ba/YF0C8GreJf7pvbwHvcNOXnsKwSn/uL7JxA0i
 8HN9yiAfCI9qt+PEc6vUq/iJdIC9nGINKh54yeXfz3R0WIANwqBWKRETChgkH9ylxbFD+lOFTpF
 O5fp7fv1om/0yyVPo4H4ohg1NKf/+HSMlAkyoKscbjo8WLRRm509MydC5ApMunG4pCHmju0G72e
 4zIdPK6Q5GwFVSdhU89l1cf/uJ6GLDz0q9+duB8DIrrD6RWmCWuh06s+meV8GzI/qUBSI3M4
X-Proofpoint-GUID: gLIXxVrZdcT7cp3wLWd_UX-nb_2iG0c8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160141
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

On 5/15/2025 3:41 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Refactor ivpu_cmdq_unregister() to ensure the doorbell is unregistered
> before destroying the command queue. The NPU firmware requires doorbells
> to be unregistered prior to command queue destruction.
> 
> If doorbell remains registered when command queue destroy command is sent
> firmware will automatically unregister the doorbell, making subsequent
> unregister attempts no-operations (NOPs).
> 
> Ensure compliance with firmware expectations by moving the doorbell
> unregister call ahead of the command queue destruction logic,
> thus preventing unnecessary NOP operation.
> 
> Fixes: 465a3914b254 ("accel/ivpu: Add API for command queue create/destroy/submit")
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
