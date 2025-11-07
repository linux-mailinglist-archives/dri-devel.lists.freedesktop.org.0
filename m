Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265D2C40CAE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3130710EB12;
	Fri,  7 Nov 2025 16:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="amBopnrB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSyo5RCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFD610EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:12:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7COBV4583727
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LLSF/ceRg82CqPsaxOZzS+MdYl4mNUeMVlODgKsa+5o=; b=amBopnrBq+e0Hj8m
 c05mA5YfuupEJbm/Kr+N21Rj8wgMFN79p2Nx0veN60Qg1aVaA6v28gNTHR9jg9aZ
 9l2qXqGlZpmbswLZK71GEimfyve2Y6pRjGW4YeBhUEdE0hoTQfE3cWDmVNbdi9TT
 gv5Fr2uJXDO4gnAQUFBnsb3s5wP2Mw/7WX26jHB/fqMkyLZPRYLUQuazXpW6EKMB
 aMLvHxP1otOlI3gJDKSqABXweu4i4VYc+UrA3DE/ypLqnfeZ38Q7HJ6JGR6u6X10
 N76iUpUTO0a3/YrWyAK5jFBadBLtDQAF6SCEnNjyCIHztJR3Kpx/uyQtSNjd3E47
 XokI0A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktkmq4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 16:12:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a2885329beso975914b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762531953; x=1763136753;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LLSF/ceRg82CqPsaxOZzS+MdYl4mNUeMVlODgKsa+5o=;
 b=ZSyo5RCTl08BdUUy0A1IA4ypWeNXCMRggB/v5gouta4HW6+DukY5j5laidaUbLpe4K
 zmdSCHVyOXWRyhLqpDSkHwxEDc0ZT5v2Vt/9T/3s6pMESYi/68Nh+Mbuw+7hypCC4HEi
 cjmGwLc4g1lcGlYSrXQEk16r8MdeMX6HhZ7018g5B39B4pbDY1dDsjR1q+dhOfLWzSJg
 7ma4SGgHuESc8Ph0oVUett0VplmO0iBi1ysLjp3Qr4gxCqLL30EN5cpMxW+SuHLG4KMl
 w+29CjouoaaUqPrpRr29i75X9XWNWMrdvVyf+1WhkrXd1wDvAY2oBeYNWYpFG/jR53cL
 f5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762531953; x=1763136753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LLSF/ceRg82CqPsaxOZzS+MdYl4mNUeMVlODgKsa+5o=;
 b=QLhab6vEH3gPenJ53yzl1Ul8oW2Loyfp5rbRJsldBdb21mj1Pki96F8eQnRrtyaHZ6
 ObSX5JxHH4P6QUnC6bvbBSZXIwdmgCJ7PP8ERaryJNvUzjGWRu8j6a1hWYqWew0BXqeE
 +rWjkkN0LVA/CUglIVFzivBoQmmacWqKLy+T6uKLwOA4Aj2ly0NpbB2JcssY0aL/zW2/
 BpEdI3pd/woCrDghmlP7nhxB2SF9VJaHMvmcm/BJzzGC78UVnP6lgs39AKyqXbGfja+y
 jdaLZVqVGTvTEmIm8fgjsXXxwazqVARbSV0efV5DWFyTBP+7JjnGX34XWPsiTu+MEwvu
 x0cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIMCzB2zuAtkbAM2uA6+EeNuQy2wlzFltbqdUC8x0N0/ANAQ2hf/JnEhSA3i22L+kkQiYbnuex/nI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaMsX/lLr5m6/Pf3j3Y73eDyqS7KIbHdLIVQtUWVmRgbxHuaZ2
 p3MC5AGLdFMlNPUah6PIIzHnN1sZYsY5TjOzdPH2JPcnSb8CumwrfsMrKzOUMtqdWwztme0G2md
 qtErRRhwzdvaUgE/iyOf9LMHRMOZFrB9NXWesEcCnvOdLlLjBxxQWi+KV4oue2ZIAI699EbQ=
X-Gm-Gg: ASbGnctsRdGFw2sny2DtsYqUHQ8TQpu4hciZWO4Q9+NcvVf8pNuT68pLyyGWluviKcu
 j9hg0kgSju9FNGqxWzYjGP8y9CoQgbGG6lnkgs4Ob//ADfWoxyJ0789v45QNB6qZCWslmnAAods
 Vs8PKNk52Nv5dfhYBIFqDPsRlsNN+nnwD1Cx76nEX7FBKN/M61KtNHwWV8r2o1+vEZo86VPaaRO
 tGqLLxmSTsFNKYb0FyuFAL52k1HBK/Aw5KjMKIPWqb/ltCvHBheptrHLnGPK3Mno15Sxxd0s1Qb
 LsAcW587+IryLATm2f3xSsw9nDw6LnTe/2dCH9sPI+lV8oWzKqMbe+lmbKO+hMQtLSZbUI06HCm
 HWrKkWUj/fXs8jVCLX7gDqEPjz4OU+q/ALOQmUbeJO0meflYfHouf
X-Received: by 2002:a05:6a00:8a0a:b0:7ab:7148:5764 with SMTP id
 d2e1a72fcca58-7b1483a2f75mr1950670b3a.3.1762531953055; 
 Fri, 07 Nov 2025 08:12:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7ILeMjWOiiGSSgIsGb6FaIJ0/0JbASiqD9S3kmTQpJLRk/0SHayLVOf5hvCtDzQzSHHfurw==
X-Received: by 2002:a05:6a00:8a0a:b0:7ab:7148:5764 with SMTP id
 d2e1a72fcca58-7b1483a2f75mr1950648b3a.3.1762531952500; 
 Fri, 07 Nov 2025 08:12:32 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc76c0e8sm3339174b3a.52.2025.11.07.08.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 08:12:31 -0800 (PST)
Message-ID: <d4b966b6-1215-4c41-8d9f-2956a3ea229b@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:12:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/ivpu: Add fdinfo support for memory statistics
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251106101052.1050348-1-karol.wachowski@linux.intel.com>
 <20251106101052.1050348-2-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251106101052.1050348-2-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690e1a71 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=V3LC4zoNnaph2g4HX4oA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: sqy7sCHVQYNtpgfWjRR5NOmoyQb3EN67
X-Proofpoint-GUID: sqy7sCHVQYNtpgfWjRR5NOmoyQb3EN67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEzMyBTYWx0ZWRfX7bEqq+UxXfwp
 jqTimcAGKT7Q1gaJ0rmOXhXltH5+2OTm0mANqKY9a7xL3M6Nc0B5IcBuCnieD62hlgn5awgvlpz
 rlntQGqEsvWqBEF7krsFyQOw3UY/YZYkt/rbmzELLD4gQ33mgAnEgR5RgVrUs59HywU0lcEqQ80
 3wcJnp2ytOHByQIxVniNstRL1U+c0wAJTG/xVJhDokqFI/fvrYo4iRwBNZWxye4apnfPqTOF83W
 uW/z+y3K1IMSZe82WhSqS3xV7ocWlnSyMgk8gWjusnuj2W1qnJ53hmTlVAZrz8Mu7vWJQI/jHsP
 OFQvy0aO3okcJf3Q+04Mf88z7Yrj8F48iaKh9mrL8fBshL5spZYM59OTStUzOA8zZH0uWHCF6sW
 cMkIf5L/NZD1EvuABqNFrsLxlDEclg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
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
> Implement DRM fdinfo interface to expose memory usage statistics
> for NPU device file descriptors. Exclude unpinned and imported
> buffers from resident memory calculations to provide accurate
> memory usage reporting.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Have not used the fdinfo interface so I might be missing something 
subtle, but this looks sane to me. Seems rather elegant.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
