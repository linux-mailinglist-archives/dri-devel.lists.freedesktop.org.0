Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD5CE5195
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 15:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8790210F70D;
	Sun, 28 Dec 2025 14:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WS4Y8wXn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z58PNilH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C9210E210
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 14:59:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSAKljs2320151
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 14:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=; b=WS
 4Y8wXnFQjcrsG6h1hNWhN7x9D/HFQXjgxW9sS0VHQOZdZBf8YmEVt/ZSeH8J1jXm
 lkCDTbCvL8G7XosiCr73qeFXehsNK4qLlEEgvhyjBw6icsITpkPgZiaa/gwAJuG7
 CmSiuShCsuwcodHrjSSx/ONUOPwHysMwIpbNHG4ArjF2hGv2zZjkdXNr5vd2W9CQ
 CDrvjjJW6Cx1ihfj1ZFEAs1qAz/DpnhPd+p4tV+5oXKZZhD2CX9jBQ9xkghw6Bmm
 jWf38G17eXOEV9Rtf6T/tKsfju/rtUa2PM7DoS/oZwXrD1esCu8zXugz+TVBBThl
 cjwGqOHa5Z1m4s8vJhNw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba55e2h0d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 14:59:22 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-459bcc4d8bcso1520743b6e.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 06:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766933962; x=1767538762;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=;
 b=Z58PNilHMXHpQm2VTctg/ffZ5dC3m9KMnKxxu+T+KyRLBRBLP/YZAwoeGXFJ4YUzM2
 R8nmi5YVYkI2C+6gfzDSV32Qq6ZBKkZXOEES4VtcBrTlzT1igpHB8nZhGCCFI8aw17Di
 G8U5GMlKF4qr45lQLsejZlzeDPM8SYTBDq08xG25Wp/JNBLFXx/7xzEwBV5p4yQ7b5wW
 nHntUUulBJ4OXPWx3usgzdo6RvvFBqmMdv+w9ibC7E2OKIEbXMlRwEwgbYHjS13S8kdI
 tKE3Annxa1PFoECjArU7V6+J56lwd1TegWevvLwjaV2QCtpmbeQ8rVTKSPgwL6LEKfvj
 U7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766933962; x=1767538762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=;
 b=jTTa4TA0SvH31eNSRpyR6Vk+Bhs+ujlehXRtyVrR04agjjEdlFw6bBUOjULtnT8DOp
 4EYEipuRwqzn5ieEGiV8FfK2qVj2J7X6HQEulRX/Io7I+kW56anyEZigj9wC1wTS37ZR
 IKKh7N5zrVoAXc+cbJNAkkHgsjP+wT9a6lyQ70vK2TEhWypvdB12QxuAw8mqMMv1YFSe
 qtEv83hh0BP2qoQd97A9MYImjMIkWHgqUzcBzG4PZydwpRyASbLua4AsJlV7mM++vzmd
 oXnFdTQXTmb+dhqfOO2EO3kaioqboIkYmuGN0GbYtBwVlrN0ThSGj2ri961rSNUVnnfk
 vetQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV31py1IW2Tr4Rd66+GUgbdYwNK+67vS6n0gNVt0+wFUkYUBW/6io5bMdNAE7X9nqpoH8sV+3BQHJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywyewjrisr9IQyEEc2Ge8EYg4RzR0QUE8UAP0AzGZw/cNQu3F38
 ExeFNFHT9XKpN4thfB4gzxU5S88cK7HSwF4Mky0zd9HSTJQDb+7NXxbJqAFKx4eXSnP/pL4IvbY
 yLfSMPBQ0MblepX97zDFgG3XszkXiBAmMJ4Zupk6YDWbdVFybbm8OXZ1cozZxe4jk/ALYioWKoR
 GpUhBHcrY+vHUq+O/yEI/w7O4mlS0NyOsVhJuHNOfQm6aXMQ==
X-Gm-Gg: AY/fxX7eNBy8DHEUqnGNwCt0mTog8RpllYYGOnaTB/L20DUZjRou58Eh5781QjBStVU
 gE57kjVIJ0wh+cASmmRvB3jTqQH14p0PkyJFH7we1VI012vZzCdyMOxkbvmhlFmx0pO7pUP5W2P
 VhBzLwJT4F39NwNlwrus15aSCj51sRkEgZ+C+FFMcQ9p2G6K7i/EYxUWAvd1nPB7S7
X-Received: by 2002:a05:6808:1242:b0:450:ca65:ef63 with SMTP id
 5614622812f47-457b2149dbdmr12232123b6e.24.1766933962015; 
 Sun, 28 Dec 2025 06:59:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKQ0W8E5GFXYVpsjWfkLEr/ZyGiqCM3SgXbbT2E0YVGU5DGNlnBmjzQkxsGSiAPl47E7aHxd/AkB230yEoieg=
X-Received: by 2002:a05:6808:1242:b0:450:ca65:ef63 with SMTP id
 5614622812f47-457b2149dbdmr12232107b6e.24.1766933961622; Sun, 28 Dec 2025
 06:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
 <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
 <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
In-Reply-To: <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:59:10 -0800
X-Gm-Features: AQt7F2oqrrSbnybAXKgWfgrkTYQBre96aRd65B4VaeoTMNsFPnQpfNlykmlc09o
Message-ID: <CACSVV03FfvZVzuKGfaJrsXmE7VVxEF5zN4-R7h1PXA11jOO3gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEzNyBTYWx0ZWRfXynAuklxkcGUF
 piLMYVzYUxb6QDAqIiK+jN4fvSPpyG27vpbp9df6VHeUSuwSgMaPMMfHvYJamSLyEzbQc5VxUs+
 JYgjjW0xMPanDXRZuwLIduUx15USrwcKw9BPxOwMkoEnv+V/V3euPBgnFAPXCuecN5TmV7HXpvc
 XPQFJkQ2KIGTcNqhY6JYcqqj19zQVCd9d7Z2xkTVyZj8ACV5NZB6GFYfRIXEQvE+rcmghrSVADl
 sqpUdoScMQDJttc6gT+cf8VBmmfXCbHzjVq69cNLhINi1uNrcnuqYbcAAO5CtFVkrwdheG05dyl
 RuAyz4RzCNZSR1b8ybmEx6MvY8EnWnXooDtYrBNoCekgb4HfxeuOA3StNoR6SooNevxDUPUIDcb
 IsvthZR3AF5LGaFc+Rm/8qaG+dhm0H9Ai3JFUkxXnbHEWiOEwzdxSNtOC+ltO0KZiqT3pvRghJY
 odT+Ob9kHPaCw1BbJEA==
X-Authority-Analysis: v=2.4 cv=UMDQ3Sfy c=1 sm=1 tr=0 ts=695145ca cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Oa6cZlz9vDz7Y1gBjq8A:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: SmGT6pAql25ALcE_7jhx-ZOHQsny57aI
X-Proofpoint-GUID: SmGT6pAql25ALcE_7jhx-ZOHQsny57aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280137
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 27, 2025 at 11:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/12/2025 23:01, Rob Clark wrote:
> > On Sat, Dec 27, 2025 at 3:05=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >>
> >> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only =
one
> >> "reg" entry, not two, and the binding defines the second entry in
> >> "reg-names" differently than top-level part, so just simplify it and
> >> narrow to only one entry.
> >
> > I'll defer to Akhil about whether this is actually needed (vs just
> > incomplete gpu devcoredump support for certain GPUs).  In general
> > cx_dbgc is needed to capture state for gpu devcoredump state
> > snapshots, but not directly used in normal operations.  It seems
> > similar to the situation with mapping gpucc as part of gmu, ie. not
> > something the CPU normally deals with directly, but necessary to
> > capture crash state.
>
> I don't get why binding was added with cx_dbgc, but DTS not. Neither
> binding nor DTS depends on actual usage, so I assume someone
> intentionally did not want DTS to contain cx_dbgc and binding should
> follow. Otherwise we should make the DTS complete and make the binding
> strict (leading to warnings if DTS is not updated).

I'm not sure about the history.. but I can say that cx_dbgc is only
used for gpu state snapshot / devcoredump.  So it would be easy to not
notice if it were missing.

We have a similar slightly ugly thing where gpucc is included in the
gmu map.. only for devcoredump.  Maybe we need a different way to
handle these things that are only mapped for state capture?

BR,
-R
