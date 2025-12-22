Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C71CD54B4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A5C10E602;
	Mon, 22 Dec 2025 09:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSaJ5ahw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uc4AFgno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571B710E5F0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:19:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7qUIk3985379
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=; b=VSaJ5ahweJLzr49j
 8JsM76SNDh7vetFymmgYpCl7nCFhyrhe81FPg/ljk10GAchrPbnVjASt7jh5HcBO
 KTFkJ//NgqUDoDexPO+CRjfPA80MCurqMvLbvnJMBF0tAB85hhmrEG5NDyCdFfl9
 AW+AQ0sJV2OUXSyg7oZKf1tfuCp6sXSenw6JfvGWmEcbbTFGndjuq3bSb+k3BLGC
 buqJ0v7YnYjmQJviyhlInKvJ4vcKubECyC2NuPDA4XcgEqjPup36Cw079L1yUUCs
 LPzYG2P6afVg7RZsz7lNoDDN+QcKvb5zaQdBzlLBfCrgNk5Bbr/HEBR60xus65oo
 EZmNmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmeab-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:19:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ede0bd2154so11766841cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766395178; x=1766999978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=;
 b=Uc4AFgno1ZTIBPu+u29uVQmw0oi7nsqMBq8vreMoBqkBikXGvtxu7tgYckx8IGgyQY
 jHpd31qh8WQHtgsQ2CWzHRqYly7ZKU/SATXdQZVVO7U/ImgdV9ojounm+ICBatYItqhR
 1MYXmLeE4qk3DkWK21rhORYHTzaS552pKviXlIvrir7HLuVRNe4at9kMujIVGKAEhiTR
 5bR2XHcfDDBjxNmu3yVEA4Tu/V2cSIwcyF9WrVNrcEVCgRaRzMo059kS4iVsW0oB3q17
 Bf+FUW6fJU48a8pHSpOTD5IMMk+FxMJkBgtQ0VHJxq36N2DZ3u87jj6KOCQOYFCOr+3O
 Vx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766395178; x=1766999978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vr4o7vIUQRCHjNEoxlOElT3p7hjKLLaLIHeYAGpakxU=;
 b=H9+ZfAkqK56e6FeQp1jeBFv2gZdbZdyZDmEA51LDa9w8dAythSuJI7KU0LWgdjy6Nr
 Ul+b3f7AJ+yLmsPPD41eXcH4oXSN6nLlxUqf+cjyNypf0M3gbxI4QyDf4vPugS+07Sqp
 JYbKISwsiu5rUizzocv3Vq3W5AoiREy00w+kqS2CiBmKf3DxCgtMOl2upRJcKp+3H5Fu
 IgH2UWAYczA2dUc26lECFEsHLfKByUuj05lh6KTBZIelEvK3LPXkdcl21lSia/2lJiyA
 imwQQ4It5VyC19+QTr1dSgby6O9qcyflLIsAy/wJJg8Oj8fYbz39l69DXYT5y9WdZE2x
 X9mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY8SDsg0P0v2PHm1OhpQa+Gt/KjNdeBam18SxLZjvf8No5sCTgRBPPWv6gzXpLnO/F4ZWUwjBgudo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrR+NFIjHsiZgwzg9EnUaSYgGgxCXx8iwcToyaX5FRpAG0zq/B
 A/6ce7O4fz7uowmCvio8zd+V+O72F7uijT4pkTZ/qYxStSRUkMS1I/mmb/etNsg1HeIZ7Bp6OwN
 Pz4iarhL+ZMtcJRz4HmHCth0VaU+ILRf962yQ9/aDuTyjCs4jgcjXVMdxcD0dpDqm6DFPgoY=
X-Gm-Gg: AY/fxX7ALBecVbgVMz5Mmf3CMW7enYwBQPpP2aLZuSLHJ+rmgiDd7ZJ3d30HUgri5qV
 GcjUXITo6KcsHBzfPkdG2kka6avpHv+CvNk8Id6rv9LNl7xtqMMrRkEyRy/6xDH5Uu2s8f0HvbR
 j5TvDXYFxHRWLcV6e1zbAaRM3c0TwV4W4I0ZZIcB85HwHKD5qTS2srkCT1qvKhDovF3gdcU9wcm
 aA1SZuFF4rxY8NK4N0FPO6sQRajMx04CHlj4tHciG9X/dMD4Dj6pJbG/EYFaPCW5PSQSuvqnscu
 83ISjcAvxNSjh1hjk8+yDcjpwkfAZiQbD6Tv52UAIguWjbHUlImD5R4GfdOLst+3O6LkjUNH7Fn
 5q17FoEdrXRIRnKfpWaNkd1BMds5vnymASKzCdz9TFtlwG9/2crwprZCQdck6Wit0uQ==
X-Received: by 2002:a05:622a:1a9c:b0:4f1:96c5:eb29 with SMTP id
 d75a77b69052e-4f4abda6096mr112333901cf.6.1766395177809; 
 Mon, 22 Dec 2025 01:19:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/2bnxdFBb/MQ/yS64tXg26YmjXwktYKlnrn7DI0rW66afHwTFNAr7ud/crT5sTAXD2eDuHA==
X-Received: by 2002:a05:622a:1a9c:b0:4f1:96c5:eb29 with SMTP id
 d75a77b69052e-4f4abda6096mr112333571cf.6.1766395177216; 
 Mon, 22 Dec 2025 01:19:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9ef904bcsm9089567a12.22.2025.12.22.01.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:19:36 -0800 (PST)
Message-ID: <c6d9c05d-3c34-4d69-bb23-9c761858a2f6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
 <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
 <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
 <9965e114-43c4-4470-992c-1051ff1b7f36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9965e114-43c4-4470-992c-1051ff1b7f36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69490d2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=lWcTiWiVgQmTcaRhBa8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: UFz7Axh0rd1Vw2Uzq3jqDoIZt8SNd7cR
X-Proofpoint-GUID: UFz7Axh0rd1Vw2Uzq3jqDoIZt8SNd7cR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfXyn9p8AEv2x9o
 7OiLPDQg/uQfnSHgGU7VJfjnp1dR9wRA7OoJ9VmHC7U6AUgATbZaseGUyFMBRONWOADDV7QTbSP
 Aqn0sZNusU3NyK05unjXdT41QLnP/CI9rLgeZOt3eai4kvP5VAgw1SnaMyAFHMG8+oSW82KO13V
 QTWGk7A/Y2pQYuPMVZoHiT1uBXa78KOUgDL6riKUvAJARoN9yQHlx83XgmbxJPLoSXerfnVDxZB
 nKk9QAbClTJei/Ea3g2wiP6fO+Q6ntKb/m1xsnL6m/oMIBq1H2rZ2R0EG/0aL/33HyKbGdDw7Fs
 lNxnNA6zfRtCXY0N4yICohOVHnmcPym0NsnNw6wPorQ+yIjjGZCFTsPW5VGjCdMd0BC7xdJK8YV
 pNpTwrWNBfMPs3QZJuTO2xKVJ2uuBmR/6BupRv49KqELZ8395vYHRrlH41EtFFfuZIMm7MgX89b
 rKfJQci4zpbWJSJWR9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083
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

On 12/22/25 10:12 AM, Dmitry Baryshkov wrote:
> On 22/12/2025 11:09, Konrad Dybcio wrote:
>> On 12/20/25 5:52 PM, Dmitry Baryshkov wrote:
>>> On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
>>>> Add support for MDSS on Milos.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>> Though 14000 seems lower than the value for all other platforms.
>>
>> IIUC it's essentially "nonzero" or "first-level-above-just-nonzero"
>>
>> The downstream DT also defines a 140_000 and a 310_000 point.. though
>> the middle one is never(?) used and the latter one is only used during
>> UEFI handoff and upon the first commit after (runtime) resume
> 
> If I remember correctly, those are also used for programming the LUTs or other big tables into the hardware.

FWIW this is an interconnect path for non-DMA accesses so that only
makes sense - huge writes could overwhelm the bus

Konrad
