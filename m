Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02779D01CE2
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AA510E6C7;
	Thu,  8 Jan 2026 09:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyXLYG5y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcGugnO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABF410E6C7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:22:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6088Osgi2239380
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 09:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=; b=dyXLYG5yvBoRM3zd
 6WqgKT4hyI+1vpzW4PiJe0R82IZCp66vnO68/+bRnJIo+zP2g9mEc3ZostpuRWxh
 HaqHYSOhJowCtwdgdo4sPoYfOYlJy45DkH3PH38GArau0/6cRabZu+ITGTlpNVrc
 mlZbfxE/SO+kT+pOubgVAb/GB4vwJI32Dz0tqp/DhjyTmZ1ugb30nGkjXZgyvMvS
 34NPMqzaSOTCsITASMJ6a0mU5kNZ822ijdhw4SNG3XP7/eF5rQPlr3DHY7Esaes2
 09cYOWI97/oI1pzSEBxx+5qvt0PPGxzFwOfR6gzCAS00gxcHKizZBcyjrJOgAjmY
 2/9hdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg3dg2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 09:22:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1aba09639so7775451cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767864167; x=1768468967;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=;
 b=QcGugnO6+tTvI7z6VAHIIFYF36OtqVBipxmH1G9xxN6hcTZ6/Yki9M200BNyY8Z92q
 vln+ccd9Z09YTGRwV9LkcYi9sgFDZRJHQDqcvgoTrydZ5BpveEBUBu22+6q5WlLS2iM2
 glgjCyyssj1zdnVb2wFyjTF3mRwckgFr7K+S+mEBNXW93qaKAIZoPzyHHpT1dfaa1zn5
 H/Eli6wiOEkgeMEYSJaS/8DwZOvpjj8+mbKhjXtcT9ufqV49fbKB8zz7dZrX3jjPDJnp
 sheEEGRKC/2gwkUfC6ED7PM90ipwNToDxk9KlNVbh+ZD7bDWhEG0Q75UyGJX37TZepM2
 DvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767864167; x=1768468967;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=;
 b=TmmBwfRAtzohagzu7Rg6LVe9nzYXWziQYcSAb8s2T6s2LreopwHUJyEaHlVBrryYJ2
 IKMNrumRwR2BUxcVmnA2AF8KdSctxC/jAv5mdmHlrpWRmYtpWW4jrN+o1cVXnyUTQtO+
 XKGKauVH9TMShOZQR1LEklxbZ14sBd5Mk9ZJcMwITFZqu/IRQyYKZgoUiTjwJUwOp0xf
 3kaKv2MtsxzmjJJaLEHVIO4vJMycNKczBSvUmC0VDPlSYd3w2ruoqvEK6dNJc4R+/Dxm
 RoqiQ028UDs3cb394sfN76DP526qQ9f4V3dHqAt09HC7NJe6lpCPABHj/cAbjXg9J70K
 /XqQ==
X-Gm-Message-State: AOJu0YxsLALdIrxhRWdN/b9Ahuvtxr9hrfWHPfsoc8wNkZNWA85SIOJe
 H1UyThn9TcNMSViE1U8hzPENPnFf0yehkAKEIOJtB6qL+z5xpxPMYMpjgr74oIs+0l8rnQSLsr5
 BzwQErS0jehx3N2IC6B1ANRpY9N89+kmlPo3yi04sAFH6xO0dG/d1v1cdYhTtbYHgEYmnncM=
X-Gm-Gg: AY/fxX7Phwz7HN8rfTCQ7Tkkmt9C0Vn7+zCDujQpNfabwQny5RZRuDBtAyJALsMlUoy
 6/QfSvfNuw3bKQYGR8IBd61LJgzXuf71xE5jpKp9uPz9Lh8T9Zk/e5aPPxaV01yOKmTwZ0dFlKs
 cc1Fo9XSLrKB+Pbc6lNr44zfQJP4TMKmOly3RzJ0fKNM9vWxpUphAAP/AVHyt0hX0KSmNuCyIIr
 eHl6ZF9O4PGFe+0B7kS1ghTqX27I2kG98Vn+3dZFJY0dAPPGqW8LWA9KxVD1WSEkp3Sa7zfWZ5e
 c0M7fCrwLirAeZz2dSdButP+mM4ZBIhQ1ufI19xpJqbNyzYx5ADkuC+QjuvcaADgVd6xpTgt7xn
 tRqlvQFTcJDVFl/FIw3flhxKUsN/a98NE3FfXQTLdWSm1ITF4ppbM6sGoZhDIVRQgO+g=
X-Received: by 2002:a05:622a:307:b0:4ee:1e33:bc45 with SMTP id
 d75a77b69052e-4ffb48b558dmr58978871cf.5.1767864167517; 
 Thu, 08 Jan 2026 01:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESz7XxqM9XjQeyJC6Vabm1GdmsiTvWUlPsr3BFnCnOv6Uphl9e+re+AckjETMw29nhVuUAjA==
X-Received: by 2002:a05:622a:307:b0:4ee:1e33:bc45 with SMTP id
 d75a77b69052e-4ffb48b558dmr58978571cf.5.1767864166971; 
 Thu, 08 Jan 2026 01:22:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm767583766b.2.2026.01.08.01.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:22:46 -0800 (PST)
Message-ID: <88beddf1-2a76-42d5-9798-3840e0e86cea@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EihD3tFMcnhy_oPAH2FuBFuo6SW2BeK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX9B6tFbKCd1+2
 i9pnVrZ88d/fCPSkV+pjF5xoMK9KGrh2KrPSxJu6uabpBaJunNAgfQz/fVUHs3Hno6wAo4i5O1j
 XOuMgU+FNdqHpoD1wDy/CyqR/oWkO/s8RnvASWuRiXWXh3PVaI0T6Ft7TRUvwC5Y8UcbbHMI9bX
 8/fPTS0nitEh5TBYFAmXvSR/DpWAFTjgcLhKZyvbctWTvB+dhcW1LPeGGZFiE2Q0eZUJeWgFni2
 5oGwKX408DOjSv61NEq25JnKgnVbe0QwwHIOx/n1b+Bb20b46FFJBijZEwKckLMsfnMLv8dWmR6
 XcMYCzLkrAic+5+O3qEKdB7yF6XmEd8XYHJ76KtUcscXjTnZ/bRQ/cY/BbscHDMt4CYiZwbM5hZ
 XP8bvAHLCZvmFtgcwJlhUp4YYtMa9rDVNIP0pq40OTtLDWdHOIaNPA/1LFFVLrfU0SADQ84997d
 Fr0YXWVHha9sLnzy5Dw==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695f7768 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=TDiaKIjp1V8PvaA6ZvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: EihD3tFMcnhy_oPAH2FuBFuo6SW2BeK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062
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

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8950.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

