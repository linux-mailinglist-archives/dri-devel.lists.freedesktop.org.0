Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16ABAB13BE
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A80810EA3A;
	Fri,  9 May 2025 12:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhWVPitU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FBA10EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:45:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Bt5W9008438
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=; b=UhWVPitUSRA7HncY
 sy/jnNE7ycinfKCQQaQ6408d/qaG0KYj9QsEr7ca75/hdwxTRkkX2Tfd7vqMhGxU
 YNgVocrPrcmv/hMTI3ptSOhqVGqCwQy3lkiDg0/sDj9UZif/OV+PK0W3lASVW0gf
 btSA35yhKCsrlO8fJeOWUQW1t0DnDVzUCreCF42Tp/ypRUNC/601WU0N9qyZ15tk
 2JtNgtX+LVE+9pXOyd88VYNqNoN4yn6HDT9NDBWck36H3yQERaoRmFLISQ/FFrti
 RfxaozIlBC3ZwsFfXsXj0eWHt1W5n6S52GnDROUnSzRWXCHdoNEnY7rQWshQMk26
 aKcU0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cp1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:45:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5841ae28eso48808785a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794752; x=1747399552;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=;
 b=nYNE+EbFc9nxTe/3CbyRPTp4EHuyL+PxM8OiTNUyx+TaSywxMoE7SXyrdTmGWdxQ1/
 sUm1NULOJOMa/ZDrcIx4ACRtrVmtqSRMcgqrTnzWjOLaP51IX6sLrLYCNtsJIrJr8/lf
 97njYnmAXQcJ0TcaHbjYmMdBEC9xkRQAaTk8Q8si48EPDXL+nipFqRpvbC4Lg7pnj72S
 V/dzizKWoOzZ/YEMEvWUqNSokLyDm0SX+Ye3TUaGhH2AUswMKQT7yxmZqkNLSlVuBcZD
 rmgMCHwGPycjReC4C2exrOP0Nl7FkIXGgmK43qyrXvSTSoDZrr6Mp568xTogh+heqECq
 Cjnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZsPDiGjsPtUKTY2DXxi4+YZMcM3rdQXNKVIKdwhB+z1OFk0W8o1cDwghf7V3GQvjftemagkONc+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyeeg2edUBqGmuSZl6AoqfScqJP6Jd9l3hdcHAh2VlEw0OYzslm
 GjxR06096QspCrBvQzFXtPOxDEj7dpliLAG9ykDwpTPrFasM/8Wn1WeT4h/Lr1I1ruDJjJI0r8x
 EABcvqmMK5rTFxXGRojqtPVWWquh078Hw/cQzvFj5ecWGFF7tIUbpZj2iOhAp7wIv4SU=
X-Gm-Gg: ASbGnct8r0sEY2nUl43h9zdfdWyG7HVtnJvi5Dld4atA0fBgh3hjqXJnv2amvn+n4bp
 2OnQ2gcTwoOHofEjZvZO1WVCvrBhrJ9ScEq7C3+oDJ8a4WGC+g90ympJPMUpvBTlgb0fZRJurpH
 05gBojo7SeFR+mfgja5BNL4iIQhxLrV2OQXcAwrU7Z2dWZkh/CqJuQk0BRLb9Qj47cTAi+V6ZkX
 X+v1AGARxCyOw/914hgdBgO6WesPLMz5d0VYFkhITWyM8bVjJHrnmKkM9Fepx2bgHCcKAH+aoHz
 fXh4e23c1iO7jyTP/5GnOAgfOYAYSy32ihW497P3Z8ddA+DlFMke4+uRjW+xFIxY4W4=
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id
 af79cd13be357-7cd01284a67mr201896185a.10.1746794752024; 
 Fri, 09 May 2025 05:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/01j/klFD9hnBlTgtkHmbIC4d1TarpECZjk82ft0PbRbQixnKSn2HYkL9AbA+mBnoAh6gVw==
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id
 af79cd13be357-7cd01284a67mr201892785a.10.1746794751615; 
 Fri, 09 May 2025 05:45:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd525sm145972066b.144.2025.05.09.05.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:45:51 -0700 (PDT)
Message-ID: <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode
 (again)
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681df901 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dD46bHw1nIv95-N93oQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _FOzDRo7Ls3SNi_asSWcpOPZP2JUq48i
X-Proofpoint-ORIG-GUID: _FOzDRo7Ls3SNi_asSWcpOPZP2JUq48i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyNCBTYWx0ZWRfX1e3a4PwRFkwb
 lWK/e8KS1pRKWshKnMc6AdtmGiGbFYi/iLL4K/7FIR9Uk9l6ioc4l7Rpwa/e2DucEmgfCHlkSpS
 c2aZCF1tld9TdxtXSX+A9N/PZHT5VUkneHOP7WdjmA2PbA72hBYZqdtfZYXHMvpTtlaoVQdkDP4
 oyrKeyask8iNVcq5F4cBmSp+XoWqBFS6VDLzKTJIkeQ8m0uLu0XHFjLrslXO0Sf5X5dqg70T0vs
 V0B0xd1isqEm/vkzEtD4Iz+9n/q0SkGaX/zEOKVQq9qoBWmNtHgvf1oHX4r38PLnqAicFmtjYkY
 KvjpNH37BGSYGsQ4+SRQoAjLAxb8A71Dpqlvd3KDnFFsJIJkFE2o11jDF+s5qyFl2Y6K5ygz3uO
 2z0AfJRhoUkIooghI9JjPL6LdUH0Oi1Xqp+vWxtEzSZY8izW1GhLLfFhABDTv73NYF/D44+1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090124
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

On 5/8/25 8:33 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC8180X (A680) and SA8775P (A663) require a write to that register,
>> while other SKUs are fine with the default value. Don't overwrite it
>> needlessly, requiring the developer to read the value back from
>> hardware just to put it in the driver again, introducing much more room
>> for error.
> 
> I'm not sure I understand that last sentence. The original reason I
> always wrote it was that for host image copy we need to know the value
> of macrotile_mode, so again the value exposed to userspace must match
> what's set in the HW. We can't read the value from the HW and send it
> to userspace, because userspace queries this when creating the
> physical device during device enumeration and we really don't want to
> spuriously turn on the device then. That means the safest thing is to
> always program it, guaranteeing that it always matches. Otherwise we
> just have to hope that the default value matches what we expect it to
> be.
> 
> I know you're copying this from kgsl, but kgsl doesn't expose the
> macrotile_mode to userspace. I expect that HIC was added afterwards
> and only works via hacks there (if it's even supported at all on the
> relevant SoCs).

Alright, I think I'll include it in the common UBWC config (even though
it only concerns the GPU), as IIUC it may differ between platforms
implementing the same GPU SKU

Konrad
