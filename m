Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A88CE027D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 23:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC9210F7ED;
	Sat, 27 Dec 2025 22:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNueiVex";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7gMEOMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD51E10F7ED
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 22:01:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRJTH191055678
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 22:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=; b=cN
 ueiVexldwqznBzp/R9Q+VmlM9mG6a/H7Hwi3ylen8dIGNHZc6kNvsLKYghVXIUGq
 PLq71ettTybVSNTgsQeMXK7gjIs2ur5FqxWdqqtNBb96g23IcLvzpLorWeQM6moa
 tWq6GUsN9+BhhhH9Z8Evndn4m1QDjbY5Kx+VkP82SceJpPIkxQtJgqB4Deeaz8Wi
 tzVwxREX32bfzbbgDZLgnohi78xhbHY3H7Opbwy0Y9X9GsC4ZYSdWuffW/KMl0Xf
 pncme/F/2uW8ZyqNAyq3J2y2vicp3LxWy/o4kw+cODyh3t91N9P1BIOKeHgreHms
 O5jQTUHa0lbC5/H735ZA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71ws6ct-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 22:01:40 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7cdcd09efc6so9258160a34.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 14:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766872900; x=1767477700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=;
 b=K7gMEOMTW433qzQ2bMxq6sAIJR4W8wHG/rZNgxhxwDNDu1+xiHJ3VbkxP37KSri5Yc
 /uQAoYIu9TiR9m4MoYtuuqhUU83gWIYdroC3Ze3M1edaOKv5kf7xki0Ol/tVlpjqwmUY
 jZ97TwlqQ5gqH/CqTSEiValkhKT7Bo56HlveLyCFLu42s+npCib+ULsiONBa4qAiZ55H
 P2/f4zCD+jvLZ8cK97VLl4qpv5PohRw10jXXNMYcMlUQb3vHp/7kfZEWjs9oGtw4C4wB
 +cPtJIOavpEcw+Rg/x5jQcNzeaEdURcN7ahYao1P0tJ4h3EE4ggBWxv9FyJRBcxs4+Mh
 2LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766872900; x=1767477700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=;
 b=jnzS5veZyitQfW0WG7yQonpDCuXQNWoCZSeN/EX+UM0eJbVkcknGKDWrBzeDEJHSdq
 /3rs+KrYwYolHzKduAMqu2/hPPYhOoJ9y7tx3KKzdcbkGQ1Bba0+r1UfT2D8D4NEHPOI
 v/K4mGN/ZHR17XC4tbZvwggXRXeHigkBQVeaVAAoH4LJvIkyvrkwROYhJEAx5/mh72NM
 y+MtAsJ0dnd5fawJV5bD6oh0BHOtJEQU5SuORQn0e8jMWLLM/4kZrryevHypuq26xAQg
 KpGrWKY7MU+NuhbCNb1d9lPRud2OI0S3WVix2Ox1hb5aEzn+ggqkVckYouIQkabXz6sl
 vn5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnHb3tFermLPB8bzmnIOY1E8UaOf0gMZhZcalGv3Gx/kQ6/FQdZJztXguXh7psX0/p318KJdAMO0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVSsj4Rtu5dWV4tiuCVWphkxyPgaj7rlW7sjdZy6ftSTaB9dzN
 yeobH5wMuwSn34Syu2UUEx676LUi6uzIuK/+SC0IEljiXQCQ0lTOwUFDGvEhX9bN1U7+eeDE8EX
 eeoDp0QHAa7fev3+5dtr7laHXygzVdmVVexqRXsq2VsWi/xXM4Mt38+QNRQ2tNVKlv9JGQf5TIc
 AxbGVGVvukrUosuXAsZadEeaEv8tyw9uytsKyY0v7HoVXD6Q==
X-Gm-Gg: AY/fxX4hb9M6HNJU9PfAmh3haxQ9pKRh0nwMbxDer6aCiyETnT/fbWyKjPWvrfpZDw9
 JMkR8xHIs3bkuanvse7A4hsPYSvyntFhsK9cppkkTEa9e9BcOdsqkYnIlGnuW7HjMqcsHwxt9u6
 4qkPkZWQcGJI6QMxquDnRxMx4hmKXpiDAZGlTUGJ7bHZV8EfnaH+VEXicl0R8+QhD5
X-Received: by 2002:a05:6820:16a1:b0:659:9a49:8eff with SMTP id
 006d021491bc7-65d0e94d552mr11403590eaf.16.1766872899882; 
 Sat, 27 Dec 2025 14:01:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzb4zW4dLjwPdHMOvYj05wm+MfjPb34VcT9TsoehzbCF6wlzIIoa+dPdGc9MuUQSmkC9V5RnjsUikqHujWASk=
X-Received: by 2002:a05:6820:16a1:b0:659:9a49:8eff with SMTP id
 006d021491bc7-65d0e94d552mr11403583eaf.16.1766872899502; Sat, 27 Dec 2025
 14:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 27 Dec 2025 14:01:27 -0800
X-Gm-Features: AQt7F2rdY_C4YMdsNJkz061LDwa5bm0PMmdQw-ruVy63uR-ECPDsV4GuxQEQy3Q
Message-ID: <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDIxMCBTYWx0ZWRfX5RB0Tk8GmMpR
 qx35LThNDqeri6cMLMNjFfyN+2xEpoasXRwJmk7sHGowWsUoyVvxv6ArRot8hVKPN15TELRGL6F
 ns85K5sQHZI9AVYKHzZ0mjyqFGIqwZvX9KTibypKW1X0tGVc3+KKyqNqr5dxPebscAxvC0EwIxI
 X9/FF+OUe/TzLOEHplt2Hz4SdKkBnDKQ09LCj/5re/Uw5oJa0O17i28hqFCPdeijvC9Lr4XNur1
 ReW/LPlvTTGsGcPLjDy6skoZvI5lyATivASf4QdgzfAgvLXHV61NvRR/KRDN2SMug2SYDRDRA4I
 4SsO7CWuQIfLIVxtpoCvXNxf6YFwNfQMD4gEGce0NZdl0+fhMciET/9EJcM7J7CF9ba5kHy2tsz
 d5KsI5dGiqygTfbmyoDKRwx+XwPeWb9TFcO4aCfXJ8M7Qx327Ljbu5UTWeXltL8aZS6qc/5kl20
 Eufk20JkooQ2ySuE9Ag==
X-Proofpoint-ORIG-GUID: vOUH94XUAuE42iRCo_k7bbd2ld2lp_4A
X-Proofpoint-GUID: vOUH94XUAuE42iRCo_k7bbd2ld2lp_4A
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69505744 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=4-z9Zx1dy9oFOqQo8oMA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270210
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

On Sat, Dec 27, 2025 at 3:05=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
> "reg" entry, not two, and the binding defines the second entry in
> "reg-names" differently than top-level part, so just simplify it and
> narrow to only one entry.

I'll defer to Akhil about whether this is actually needed (vs just
incomplete gpu devcoredump support for certain GPUs).  In general
cx_dbgc is needed to capture state for gpu devcoredump state
snapshots, but not directly used in normal operations.  It seems
similar to the situation with mapping gpucc as part of gmu, ie. not
something the CPU normally deals with directly, but necessary to
capture crash state.

BR,
-R

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 826aafdcc20b..1ae5faf2c867 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -378,11 +378,12 @@ allOf:
>              - const: xo
>                description: GPUCC clocksource clock
>
> +        reg:
> +          maxItems: 1
> +
>          reg-names:
> -          minItems: 1
>            items:
>              - const: kgsl_3d0_reg_memory
> -            - const: cx_dbgc
>
>        required:
>          - clocks
> --
> 2.51.0
>
