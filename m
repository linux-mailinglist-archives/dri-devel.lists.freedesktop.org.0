Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47870B0FC54
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 23:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9EE10E85E;
	Wed, 23 Jul 2025 21:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfCtL84g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A9A10E863
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:54:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNF0Q018863
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dzsHnqL9/hadPlM9oZ6TcSm5Sor5EgahUS/FmSJA380=; b=AfCtL84g/WgiuJo8
 wd98mkQAmPlVVt0pymqGy8LmcdiL8JCcan5VSCAzVgcfVUWMWrBviYkbGYz6AM+z
 7OG85BulK4hhCfzezB/KgaxMsuZzLuaqexCRlZLMas/Shozs/hYSel8eZ5XQJkQW
 gC6nKykdEqYgjqZsFGOBlAs/jFh5u5ij6kxoMdJxZzsjr82w7sFuBwNEhKW45Ml8
 jW1PIPutGH21X9cLYxkf7qWD2QOV7z8LoIhetRMVg/SzupvATa/V4laKwtYrWUpf
 49Z+X7VeKaq67FgOdh5qniGEVkJWkopuzDaqiIwSm/E/sWJty4jt1HaOuaZapMuJ
 IxoDoQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379rryv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:54:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b1ffc678adfso250207a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307644; x=1753912444;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dzsHnqL9/hadPlM9oZ6TcSm5Sor5EgahUS/FmSJA380=;
 b=eeWJA1zA5kSUNg5mLYVptsFPl1R7Pu9bDaapFl/k1w2v+b6X0iMS3Jk3OJ6wS2DRQC
 mY/wUKt/ZlkdGBxuiMdkmgPrAw1ZiPU51caFAesE6Uc2b9rbjuo9/Kr/gOqhjGs861MZ
 QLqB2qQ52VcqffcE6qO1IYusFfuV9p/OWiQoCdMDBOSJpPLUmrJ5DoKdbrVtVRCtTu6q
 KREsASVJmQTg/bKTcDwAyqpetfzMs3oH0RBkOSbNHWx8pLAK4AAwS4FdzU+rAaF83VKe
 Tyv2uqxI49XmX9Kjbzp+e3jCCZRfFopjN7CG3MNxk/RaNe181Hs2LsVHfQFEpqVx8IY1
 m9eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURLtBTYB53POhm9owaAwluqnk9PfUPV0SMjUAbTWLR5l5pjX+czsGHJeVJWQS6nxyyMbq9x2A2ZjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKfhyN5grJNdqbXZUgVvVu5FsRqXbZI4muMowZnNEVqBAsAd87
 S28jFf4uICXao4TfXByoaKbwIc78UGO95aGu7jZ/h2WZZDtx/FHjZiAYrSNVG+Zt8KNKdXtOK1h
 pOKmzcyuqejT5vqArSEzXVIvxt0VcsHiV+QL3NeccDXgtoZfsM9AQiyV9xJC40paUQmZIhdQ=
X-Gm-Gg: ASbGnctpN9mXwpPS0uuCogwHyyYhaluythvNFA+qGcmeDTVgH1E7DEnE3axyUG7mERa
 bPJCIfu9BiQA/oZ8w4pp5zl/7QkGlUtr4EvoayiXXpr1jEOncfKHUCzrVVsM/OE8NvPDiYIh6ZH
 CnCCmGObHvOAj3YoQf+ljdML4UHg6H11iLYxUo2Csihfjn2w0kJq+EJ2oSaV9Ml76rmCR2LSBuZ
 9LOVm+rvtesGA78GEyci4Do1C1AZKmJ/+s9cJaQXrpZ/tEsyr4Gaj70n23CKhxNZ1rI5vV6P7KO
 5sN2FgXSoZKmet83sL6s3W7jnENTmdo2Kgn6636vDmBGJ/iLM6dVDS0Uam4KJg==
X-Received: by 2002:a17:90b:562b:b0:319:bf4:c3e8 with SMTP id
 98e67ed59e1d1-31e507c4148mr7375968a91.18.1753307644518; 
 Wed, 23 Jul 2025 14:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPJPJDfrA159Lqv2Tdqj6Nf4Prqoe6Smdo5JPb9rk84PO6Hho36y1HH3kU1XqlJ1NR66kYIQ==
X-Received: by 2002:a17:90b:562b:b0:319:bf4:c3e8 with SMTP id
 98e67ed59e1d1-31e507c4148mr7375953a91.18.1753307644126; 
 Wed, 23 Jul 2025 14:54:04 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e639d780esm54569a91.1.2025.07.23.14.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:54:03 -0700 (PDT)
Message-ID: <343d2e49-aa52-463b-a844-e78af2a54d1d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:23:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/msm/a6xx: Make crashstate capture IFPC safe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
 <d50f9a01-ba8f-44ec-9206-fcef641333aa@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d50f9a01-ba8f-44ec-9206-fcef641333aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2bbbHZgkJ9ithu0MJBw8Bq2F_fNAV0-W
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688159fd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5VcmFa3VxYkzaEkvw6AA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfXxvi4IXZki3PH
 YV+UL584zbVXjElA8V1CBpbZhDU93RtbNuWJCMj0JrbdQpY4Bzy/JakPJ4wNX/7WCuLuVDPlM5A
 DWx25IGlI89r3h+2+hViUcATt6Y5NVGpo6NvyQcgMHG58n4ZSzVJ9buZMTYXuIHynRMSRxDCvrg
 XCLkxijcvcYFHmAsciRjeuzl6RRoy0mU2fCKMkMf36Lli5RftuM55Jb8ZoSPWIHnitEnNbLKXwA
 ayvxSX4vRkzGp5XfsDfWyXfxlVKnr9upohAbOQR22kJXjlhva4tdlxHdB4fdWAdxUJanxZGShTG
 ndEuiGgaR+FKlXSj+i2GVKuLUDK1yld/gbXucDPDsWB1EVvGf04TSiQUwSw1pjSj4czGVv2GOE4
 lc0aQxXhwicvLTh+ywlobonAXA4x4vsWoNGzb4/4qTdKgZaxMIx5oJgqy1YYifwPtEYfj/Ln
X-Proofpoint-ORIG-GUID: 2bbbHZgkJ9ithu0MJBw8Bq2F_fNAV0-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=536 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230187
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

On 7/23/2025 4:02 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Now with IFPC, GX domain can collapse as soon as GPU becomes IDLE. So
>> add gx_is_on check before accessing any GX registers during crashstate
>> capture and recovery.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	/*
>> +	 * This is true only on an A6XX_GEN1 with GMU, has IFPC enabled and a super old SQE firmware
>> +	 * without 'whereami' support
>> +	 */
> 
> Firmware that old won't even be accepted by the driver, see the slightly
> confusing logic in a6xx_ucode_check_version()

hmm. you are right. In that case, I don't know why we still have the
below bit here:

	ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);

-Akhil

> 
> Konrad

