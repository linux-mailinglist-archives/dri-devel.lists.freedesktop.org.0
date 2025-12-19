Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C52CD1B1B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 20:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E980810F0A1;
	Fri, 19 Dec 2025 19:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozovpwJG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/gHzX1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6357F10F0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 19:55:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJFkDG11356695
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 19:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DR+goq48ncP0kyKUcb/V8WFR/h7VB4VgBz/yxTaq/Zc=; b=ozovpwJGtjNgYlnT
 F5ZK8NR3RAm6yUxl0Npjcxm2mVY36vXFchwZDwhsImffsI1nXO3PSDms7bJ6PQqL
 L716Y7mkm9ZO00K3o6eUrfa5uSDUbShUOkExK1x42xXAGCCxX+3Ilw2iQJgBJXFP
 QRsl3j0ghCmSTlvWjiMqzCX/26leTl1xqIf0/k/g0fpHQgNHKg43LdDvs9ioNxH3
 BRiI42nthz3Zq4WEDptKr7ZIsgVe041QZU/mwyIMN3l/qaMUXQUWPssjmpqcxq+O
 XTMBRl10ewAB3JV38wXOutXlIQAi5b4co4MAPRPo+J3Pq/iu2QJtCK33U4MF1z6q
 Q/35ZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c3x9q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 19:55:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a0a0bad5dfso41171765ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766174129; x=1766778929;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DR+goq48ncP0kyKUcb/V8WFR/h7VB4VgBz/yxTaq/Zc=;
 b=E/gHzX1oSrhhAW5zxelXPZ/4yu1f1KGoABygiGJ3HPBzXAs/27FUZ7rzXGOUV69FxA
 gBqRceK49HsfhZJUVnumvDnBku4VFSMHwZBIsTFp6b6QBGfWifjo/46lETETM7B9jZP6
 lufP35+0lBWge4/Epm034O5riOHZ2h7dUwfNygzdMu6tRfJSYpPAMNYaNCrNO5F4sm0d
 Acyj3w8pz0j7OQU0VVp7woJWwzxBCCOjgBoGskyNN0batE8FJ4QcI6G4BHdLQJcX94BE
 CHaO18ecyM20hF35orVmeJuFOtJ+37LJskOySQDbNf1OS9utB5HsnbbbCQ1dYd27GCex
 2ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766174129; x=1766778929;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DR+goq48ncP0kyKUcb/V8WFR/h7VB4VgBz/yxTaq/Zc=;
 b=pbJr8vWSz2v8cdwna//XwYfrj2S+pcmDHpwlgZ+2uDxHHcGVnX8QEUqyk1BwtKsPel
 ym4dd2TRhwJslQQu0agtJuPM0pZxFhUjureHyF8eGubpRDTus+oRv8FY8yNLQ/CkALeD
 dl70Z6rg8q2fp/O4X0vWV3VgGfPEdhZ9MP7CRdysCcR/+icucYT7MZ7EVQAQMCc75VZ6
 daR2RKQhIO2pelatOGaAk3llNdA+nC0D0kmguNm4WD+wkqi5Q5AKHJguf0icu5H6sQ8t
 HFEb1e2rm+wGwaA2s0jJh3XzwrfmLsk8vaOB9t0lGk3esrEu02splDm9Fn0EtdfG4Ao9
 cK0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSssFDXiNqrS9lQ+TTINXfbj/RRcOgZJ5iuNYV9bKFLPb0Q6/+StWu0aTe5y7L+6LzHwytcSx2AMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbiWYaOjRUgT+DWS60FueLaJNYTlHccRmCL9uVb8Svods/Xd59
 F2utaXWhiezYbkp+vXaD5/G5tYKoZmPFe6bpEoGCyTcn1U4hIdCAY9cV55C+9BDBhMpe5crqA3A
 6e/3IZArobgj/76naLFhPqG4960h+5iJ5MiT2nSI0In+nr4/tllvExlYI0fz5fVi4RlqbrJg=
X-Gm-Gg: AY/fxX74egUCAIMfQ0uEz76//C3AbbAFrU91YdnIl/5+0J5jz/IIizPscOMMPuRQKca
 FkfEgLteJg5NwUV58+0wJLQzcJuclAUXdPAz8UVJYYUCTRqLAl3bHHGLjM7tQhCAPa+99/pquAU
 +ABrd60d3MCA4Yug2nXnY/TItj7yeXE23t79wjz5OvnFDXE/uwPZsmYHszPIDATB77fv+twoicN
 HWzoiVGCbT2RvNaPArEQsy0KA/WG3I0p1g7vrfveXhdzsLUDQr6kCJ3xNboqnmVqI+urKIiBNsS
 dtrOIreh1GZVglvvpk2b/dzorxAmy48wpGnzBeYoSk3z+cn2sWAgxbin/lKw/ltIQZErMNDCP51
 Q1RuT+dO4bHZAmapHokjraiSCUKGu8lNRCd6bhpSPpOLhGJ5EhcN/utVNftC3vO4=
X-Received: by 2002:a05:7022:f107:b0:119:e56c:18a0 with SMTP id
 a92af1059eb24-121722a96b8mr2595113c88.8.1766174129070; 
 Fri, 19 Dec 2025 11:55:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIPQYMwvhLfBfiqZDnjFW/42wjmA+ru4F/v6rKUC4LDLauN5YSCGNPOEHvssAU3yQBw+wmzg==
X-Received: by 2002:a05:7022:f107:b0:119:e56c:18a0 with SMTP id
 a92af1059eb24-121722a96b8mr2595089c88.8.1766174128535; 
 Fri, 19 Dec 2025 11:55:28 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b06a046e99sm4544806eec.6.2025.12.19.11.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 11:55:28 -0800 (PST)
Message-ID: <890d2434-5435-402b-aa96-7d782b70a6a2@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:55:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel: MAINTAINERS: Mark the subsystem as Odd Fixes
To: Alex Deucher <alexdeucher@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lizhi Hou <lizhi.hou@amd.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
References: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CADnq5_ON_u-qZv_rFzOWX+Si=c=8fc1pU2J2fBGmeRd+knhFqg@mail.gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <CADnq5_ON_u-qZv_rFzOWX+Si=c=8fc1pU2J2fBGmeRd+knhFqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE2NiBTYWx0ZWRfX+cSOvN/sUMTP
 rEGhgNHzRT4at10InYmpWICnNmYJ3RDpsMRP8//3NPPc5mjYQYzP/jOZwntQBQihOqaFnWfIOnk
 rTBXo3a9lbjtsZRzYLFRQutXGIyig5+To234aC37vra8Oyxo0UqR/Xa8ccMUWQFOHgeZ7b/nwMF
 zfA94Sti9sVJg8snhM8Zdih6SRsB8nrz49S9X2VK24t6fZBlCxJoQPV2/91SmI33pogD52uAuqp
 T8rIOMKVmWYn2GZBP1/runL2+mZiMfBRhL5ZY/ZuJZOD3H9s7fHyPHQeMDy/lQO+tTQv85RR8V0
 sAB8h3QvKJCo8SSA2Uf2VT9qtASz4lhtKRl85/bbuVYx9vwk73/KjNGYtewvxkbe7aXozmVtE4a
 jrmK2KYYrKinBQuhVw6QaaLSr8ZCkMWoquj1qlko0uVsq1FBV7UZPfxDkN7tgSogcF5AKKQiR5J
 YfSZpivL6g6MWYYexLg==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=6945adb1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6x6Zo01ZOMrCJx4ZA8oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: tLrSKc52-K_yvPAAaFFTgdhmcrfgjF4A
X-Proofpoint-GUID: tLrSKc52-K_yvPAAaFFTgdhmcrfgjF4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_07,2025-12-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190166
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

On 12/19/2025 11:55 AM, Alex Deucher wrote:
> On Fri, Dec 19, 2025 at 7:16 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> The git tree mentioned in MAINTAINERS entry for computer accelerators
>> was not updated for three years (last tag or branch pushed is v6.1-rc1)
>> and is being dropped from linux-next [1], thus should not be considered
>> official maintainer's tree anymore (patches appearing there would not be
>> visible in the linux-next).  Also, there were not so many reviews from
>> its maintainer [2], so it seems this subsystem could use another pair of
>> hands.  Mark it as "Odd Fixes" to indicate that subsystem could use help
>> or is just not that active anymore.
> 
> Would it be better to just fold this into the DRM subsystem entry?

I think in some form, yes. AMD, Intel, and Qualcomm are all long time 
active members of the Accel subsystem, and our updates flow through 
drm-misc. From the Qualcomm perspective, I would be happy working with 
the other members of the community to address the needs of the 
framework. I don't want to speak for my AMD/Intel counterparts, but I 
suspect they feel similarly.  I of course do not intend any offense to 
the newcomers (ARM/Rocket/etc) and welcome their participation as well.

Alternatively I guess I'm volunteering to take over the entry if there 
is a need. It would remain in "Supported" status. I envision using the 
drm-misc tree, assuming all the other stakeholders are in agreement.

-Jeff
