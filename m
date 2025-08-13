Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A79B255AC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 23:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3D410E08E;
	Wed, 13 Aug 2025 21:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcAurwXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DAF10E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:40:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLbRu011070
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jsHqObljI/QrkzM/zyszZAc8Qk56TEyRi+eNAb+o/hY=; b=RcAurwXzpAKXEdOG
 TRd+OlbzSSziHs0RursQXpp6noZ1157tRtAJB1a5hc9wHvfkGroPDG5dHp6Ljypn
 0aGqE0F1t/d4Dd/mfibRk26WeUDnSxgtKX7y79C0/MDYNtUcq3TDGcV16JO8hlh3
 EENDO3rjpsi6Fv4IkkzTUAbvjJFcSsf3esTAVx3EujYoEznwzY0vrFdvvyYIM3fF
 hp20v9KwXZodHbcdfQgLfrzVbfsHbsUYycnGxFau+RMrcBfutST5fj8gPHEt+BcQ
 c3KdObkbzELN7QXHZYBC1VwYb+avioqwBX3p7DKrFP7aFYobmjX3ivPskkahobja
 vmWFOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbggf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:40:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24458194d82so2207595ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 14:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755121199; x=1755725999;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jsHqObljI/QrkzM/zyszZAc8Qk56TEyRi+eNAb+o/hY=;
 b=FRPk6iuGUoF3dP2mFA8+1KE/Vl361Qc0XpDoHGoB/sjLDSk1zvhRSD0ccArsqjWFj6
 rKInpE2Kzfv7ozvaJCUg5vzZ6fQDIHLwNph5jOx2TTZoF4kHPT3vTb85xi8A3BUZIuNB
 zKoePMNqUNKXIUzI0ylbYasgCrMDwts9x3QRZhjc68UdKYqPt0qM6EXB/erx5Ik4OKa5
 UEZYGDbQjb7e5icRymLSiyskuUjcpKjeVlPRpN2OmU+UTXpv+nlTvXn2FyDbS90zjBzW
 6J18Bb2fAFw3WXIXEbc3y9gM1KX68sXUBOwZwyy4cVS+jlOD5WpPjR08Sh7TvmXuM/m5
 hwTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmajm+/SpE8FDK1H1tDOdlE5t4An9PEhyBIJFH61wnCKZCg/nP9nGFjn3eoDkZdGQeJqOil5/P0B8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxFFj08dtS/AMGsspjFu+vPzWDyutFj/Q06e06Gsxyp4k8ykj7
 RZTWicRqy/La1xag79Neli6128DdiXSOwDKTaS4AuuuIBg3Qs56ndlNpHAGRylzfF+jn88y7rNn
 W3S5YEg803jaCaC+pMDM8doCbJ/oSX1Fmdzd7soxcXr3QKWmliC/rxom7oqDrx3AJu/NLhw==
X-Gm-Gg: ASbGnctETIQQLUBc76ikh8eVz9w0dKehs1g4LHzc1REIxue6lnVR4HhD3hNTD+rBIsk
 uH8kFJGCjkq0R7uabNP9/QJ7Q1IC4XL+1VSm8T5a4UUfG3s08oe31rQclltSNbxqGCGXF7T4kkb
 04CPaKrtcAmZDbNcXtdmh+qpV0DDZJmL8ve6Af4ufuOheaAz+PGdU176XsPb93CEX1SUUQeKL/2
 Y67mRuSeEwkGnIIXJpBlEfLFi8hDhrKL8jKoITDxv2+HpWJjq46MhoP8YqHxMi35eygkEn0l6FA
 17rxF6/ioV7iA95Axw0tkXNibB4T4MmBOxkWfpTqmR34ij+c5ZGYhe9OFxzsIU5oAqFTSrL2y24
 zm1HhNAttXNGIUH3d0/aBT26Vs52sHjVUjObJJQ==
X-Received: by 2002:a17:902:e5d1:b0:240:7181:8287 with SMTP id
 d9443c01a7336-2445867ec8emr8191515ad.26.1755121199176; 
 Wed, 13 Aug 2025 14:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCxnQfRjpH03Kj/5q/5ynChdc9Gz8ERDFxOMx6F+r9zzLYTor/b2ISAK2vcBWx9FA/ouTeDg==
X-Received: by 2002:a17:902:e5d1:b0:240:7181:8287 with SMTP id
 d9443c01a7336-2445867ec8emr8190975ad.26.1755121198721; 
 Wed, 13 Aug 2025 14:39:58 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aa9055sm336495925ad.150.2025.08.13.14.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 14:39:58 -0700 (PDT)
Message-ID: <d1009d7a-b675-4af0-a149-4856bca29140@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:39:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689d0630 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=21D8NHQQAAAA:8 a=EUspDBNiAAAA:8
 a=tfL3YIuboUik3C6ywHYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22 a=aE7_2WBlPvBBVsBbSUWX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX+L+5Ap+/XBAB
 CVM7AA7XuepNuJLE6yyorT/yfgvnAfett3AOi3Gk1/yM9fNPt273/OLC+A9u/1nEO5o73eyNl0h
 yxM92m2IXnHDAAlAoofTmDudU4lWLR3xPFq0bnhy74G3d3NioK68LjbJLX+utqKLeWhNw/VdgS5
 YzUtpxaBiyjarOhvtMVgDZl4D0Hw6CQhKniuKLw4fp+V+Z0HOiVjDBxidqqCre6OK/5kkQtMYla
 JJavjvPe8vlw2IatOUrRzw7NBdNFv5Fg3M4LknjS/OB/1HJPMNMCzbyhJ+T768xxuqHMEewSrBV
 AVo5jJ729OHfQAwhtAHRhpzSeGk7H+fln6KGXHlvZvWsEail+/oxkCA1FMy4Oiq0dRc+cEpMSDA
 GAIxLFBB
X-Proofpoint-ORIG-GUID: EUuqE3DT6gb_IoGu7MqDDV1nF1R9oPo4
X-Proofpoint-GUID: EUuqE3DT6gb_IoGu7MqDDV1nF1R9oPo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
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

Hi Jens,

On 8/13/2025 5:49 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Wed, Aug 13, 2025 at 2:37 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> This patch series introduces a Trusted Execution Environment (TEE)
>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>> and services to run securely. It uses an object-based interface, where
>> each service is an object with sets of operations. Clients can invoke
>> these operations on objects, which can generate results, including other
>> objects. For example, an object can load a TA and return another object
>> that represents the loaded TA, allowing access to its services.
>>
> 
> There are some build errors/warnings for arm and x86_64, see
> https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/jens/plans/31DmCOn1pF2JGVDk3otBOXOL6kV
> 

I'll fix it.

Regards,
Amir

> Thanks,
> Jens

