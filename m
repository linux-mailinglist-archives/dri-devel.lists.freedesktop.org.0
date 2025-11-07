Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7119C40CD8
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE9810EB0E;
	Fri,  7 Nov 2025 16:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmT7E7p2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9F3sqr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0157810EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:13:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7BenYa2853458
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b5ASgrZ1sHCCxTQD/rA5+jociGQanNK0w0DzZBGtMNM=; b=fmT7E7p28Wr+cW6b
 KMrvvtH3hrN3c7z8ByKt71LWAvOE4apV12dicx8vLpfB5260sG6R4FZSn+77tX56
 HezxIjKfxq7RPFlN1kLMX7+jxbhQcDnXa/X/8T236GjLy60cB+dibMST+k+DZqFu
 OaH8d3nGJrIWqolhU9dL/Z1jlR0tZGwE0sQtg5s0SkJJwhrF0TPpDYNHyacoHbpZ
 B/TyZeDLV46bvqeXh0fAtuJr808Ue/IhqsyiLBYj0esZ7b/xxd+NaZZhI5ueWg8r
 H7ciUHWU0vxHlqoAH4qMHG+H+ma79K3N91qVdMlkbPI0pdA0pIjjBzzCU5xXHqD5
 ywyXjw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9g3xrq9u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 16:13:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-340c07119bfso2201657a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762532028; x=1763136828;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b5ASgrZ1sHCCxTQD/rA5+jociGQanNK0w0DzZBGtMNM=;
 b=I9F3sqr2g1ieWmzdBLS6bNCjykmNE3p/Z4IhX831pauMjX4JyU79h9WZqytuFZ7qba
 Oa9aYbRIrQTUYneAuuljPYIRGdrEW9YR5MWNoJeCyME+2Bghe3vjOf0JH7Qvd/9aSVwk
 +vp41f3QsOuQDddTvgUB+c6NijavEPPJZyaBmmh7c/xUQ4QMl77ptUH5rYSHPdQ2Ofpv
 CFc69sfbbD4emMKhnb4+7avd0gVR0iuxtzH1JzDdqgn977qiD+j0cNv0AMV0n+z8mLPy
 b4R51ARyvkuJo3IfiRewbPm9xnjh085NRJl1RfQl/kcEwYwfJVo4Ym1IE15mkZtlMskb
 5IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762532028; x=1763136828;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b5ASgrZ1sHCCxTQD/rA5+jociGQanNK0w0DzZBGtMNM=;
 b=UnxUT6uVR0BbHovIwJelPYczkLXJxoqsMtunrtHB6sSApamX7NcYijbPC6XEpuSU4D
 o+BpiBuo9t72kwGAwqNZe1Mq3u25SbEdcLVPd8StoTvzGdrmFw7N7qRieN4+uom5MLRt
 +pXYiMwej944++QnezpExssVsG7Z4dotED8AWwCOJ+s3TfQ0cZ80IYkgKRjHgxWKLk34
 VqzYGNNLZcxkGYKNtQxExbeYWml8ehTLULQZ2tf9ktCXq9lfl/pA10f6gDoR74M4BuV5
 ubGZOqFTSeVzwrkngCBsXCiHKLTPxleWEZR9ahr8Va4yIz1OHa+tgLuLxrXI03qHqZdH
 pcTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOS4NTnj9i0p2rlR3OGOxrWFcrrFpwkdoXujQ5J02qFem5hd9Xj6rzVwL7Nx82iYfPoBvDraBfT9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywkm19+3wl++CEjjuYTsc2mFMSGTY7EarC1DcAdr1v4DO8ke44D
 hTZEwdYouTJKIBYdLHOVq0TZGlz7SSyFYVa47cuxRSEyRu/02O9llBxIPjo6u/rzJgXzy/3eVyy
 VCgdCCp/pXpqkSARtogJTOXqCBSY1ldBCRAPDFy3rK1KEuKkBSSw52pNcMz8D/gthlPq9+Zs=
X-Gm-Gg: ASbGncv2TS1vx2d9h65oQb3IaQCo9iYCp9uCJHv/AjJkanaSCBhwl1BXZZWWmCi2j8a
 2/QC+MSGF+xoB4eLTmNWRj7XkQwoeMEWVOEJITzMO1BnXx2n2ttbRuLDHMHbPB3baZs/TXETak+
 swHRLVd9otrXvylcPT8glzH++BCqcplTv9JP0wJm7jmuh4rRuAWIjrNSp8UhFvi5s4sAVOywQ3P
 Zv00/QMfWDfFxYVVm8Rc+BiWq6SXWR2F6WElBhTjiQ0erGwiCUDXckJdjGWszWeDiwsUxioo5H4
 /7Yjb5augdCMOITRXypOaUSmUHaUm3uxOqgF7vF5yGOplUfwQBqPCaAgmPZpK4hOPMj0j43BDQp
 iCxQieXOXOSKKcAnfblNO66Qnt2PxmdxC0Ae7MSJt4k3orQrhA/jn
X-Received: by 2002:a17:902:e809:b0:295:94fe:d5dc with SMTP id
 d9443c01a7336-297c03a5ea4mr62937865ad.2.1762532027710; 
 Fri, 07 Nov 2025 08:13:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNSs2fyjtTRhkN1EF+D4bob3MpmYwQY4P3C+GxEGEf+fxI/yB8S6YGZpGLbRFxS9L6hQNUpg==
X-Received: by 2002:a17:902:e809:b0:295:94fe:d5dc with SMTP id
 d9443c01a7336-297c03a5ea4mr62937355ad.2.1762532027135; 
 Fri, 07 Nov 2025 08:13:47 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2965096b8f4sm64564725ad.10.2025.11.07.08.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 08:13:46 -0800 (PST)
Message-ID: <f1a6e9e0-ee17-4c74-ac40-e43f4279dc4b@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:13:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/ivpu: Count only resident buffers in memory
 utilization
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251106101052.1050348-1-karol.wachowski@linux.intel.com>
 <20251106101052.1050348-3-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251106101052.1050348-3-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEzMyBTYWx0ZWRfX2ONkeaid0guX
 xzzRw4jL+dfjZmfCB0d0CUmTAjUz+3+l0ADRj60ccV1faC/iY5p9pu9fN6y1LH8RrrieNaInrEX
 E5PVDfCOXz0GrHCnGUqSsoPTpn6W9xTVRzXj+nKF4JtdMiqmKjK5wfToVfxIhOSFhaFMAdOzIu9
 URikTXr2mytSVjibcbi4z3wTs1J+X2NZ2d5QO1rEsHIG5v11u0CfJRaAOYEt2BaTgPdvMKvvRfk
 pPnGRpbdhZabS3YJ7VMSxfzLYqjxq4Sg3X9dTYe3vzYA8Wa7p26QJhwlKAadeHwLcmYWCOrfXqT
 Ulu10X0CfHXk6rry3ocim3CwvXmHTky1L1YKszEhqikEbHaxul8bfCuv1GeaEBDJlrSwDIalsKx
 rWic2gxW6fzEo6Z4DIlqCgEM84s9gw==
X-Proofpoint-GUID: MvEKoLWpr_nX0gvSGEpoWfrpzwPGXHOw
X-Proofpoint-ORIG-GUID: MvEKoLWpr_nX0gvSGEpoWfrpzwPGXHOw
X-Authority-Analysis: v=2.4 cv=Q4TfIo2a c=1 sm=1 tr=0 ts=690e1abc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=f_tmVgHmCTdsUaI_wiEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070133
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

On 11/6/2025 3:10 AM, Karol Wachowski wrote:
> Do not count buffer objects that have no backing pages, including imported
> buffers where pages are set by VM faults triggered by userspace or pinned
> by other drivers. Instead, return information about actual memory used by
> the NPU.
> 
> Counting imported buffers results in incorrect calculations when
> the same pages are counted multiple times, giving overly high
> results.
> 
> Fixes: 7bfc9fa99580 ("accel/ivpu: Expose NPU memory utilization info in sysfs")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
