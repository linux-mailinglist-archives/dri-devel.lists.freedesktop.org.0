Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C6B2057B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE2810E433;
	Mon, 11 Aug 2025 10:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDV5h0nd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CA410E434
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:54 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dloZ021649
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=lDV5h0ndMZZUeAuz
 0IysO8UnRQboBN6aqIGD9Jg9X3+MijLbMAA+Uab6Nf7FA82Jv8fXiU+QRYyzzXTY
 MpsLtYG7yHFlGthLlH+RamQCEAmEXi/n9212GiRtUqe08WkkXHf31r8mfulJqSIH
 hTmRm5xTc8JmaG8LynS4/k73FpXTWEkJVBI5s6YmNlVFYVMS42nydyWej9nG1eQO
 yS6g3wRIZs+UiPdwvBS2gad/iNpqa8sQ+nORwYYqurup35SULgLo3vfwICoO3EO1
 yFP6OaBQ4C8f2hbrbohrj13gelABMRCrN9BuQ3FT6j7hlaLWtmD7FVZlZNfLttQU
 S1enwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv0gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4af23fa7c0cso12398981cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908432; x=1755513232;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=ifdzjFFwzOZ2AZ9rYwRJrmVL1RLx3q1wTd2Lsb0YwQFXJ9CRU0zUjDyZSKjYzuD69+
 1jOCqCZApsTKbGgSdrOrWrJUZszPMJqeHXHmJAe0uIXnhbJ5ff8gR+b7c4LpP8dUUR0u
 REW+uKqIAaYb1e3ULXM0hWsamgsUwD9KgM0bXsLBDgiy0PUV2DZ8kZm7vDllO0LKgmWH
 SY5+FbQvnOWDIpyeB8RU4bMSPBSQcqekVlcTV6GijrH78i+0foILZxH3VHIU/kfu1hKh
 9Bza6YGQaAqMzdR4W6dKwDF6cgnc8ZV859LbOjs/5gu2pp8aYlEYn84AIRtMD0nxLsNs
 /asA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRVHN2SeoglT5LUsDjU1hoaOqX5bx71M63yEglRpYD1gk1zm/oOp9BOj2C1wCcMsu2FWAL6bi5dq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycBlDTawkIpwazcbb0v47o2pCHcf645hGXWYIeIk7fAExOs5Pd
 qry11cyDQz8PHJ0R61r6+XTrcbS1yC+8sqy7GAULJIwSdPN4boI/VrltQvHT/0A1gDuz4DAtd9q
 qrEcHPh6vIVeQ/8LRG6/3oBpEPSViu8VFu1mGqNHF5Uz5OAT6UfVLWhPJeJVvUv1t1s9jEbg=
X-Gm-Gg: ASbGncuz6fjH5RKgQd7ikLrjvQB9ArsptbEoPh2w/gsfLLlZ6AMTR/5aoltkbdxeypA
 MGEJHj7/OlWlCn9vUML4TldxOUABa6C6Hl7Fl8js7f07xLaOEbh5XQVcPDb3/Ir2aAcXHyzr8TC
 N/pD+E40sQQWm1bfibFWd+jABt6TTLtLalYhTCCsr7Nn5MF+GwnqLK5pxTsqwbQXJqBRNN9PpQk
 5ARGRL/6peaDzgGBPPmGkq7qCvXIT/iDLgdHbCaE7B84Dq8hfrO/5a7AcX4qqsTTR/j2MixnqB2
 XvTOPLaOdB5peXrZXbTvDrBrbDCn8EpaSYFtaQQRAS17IYClQ2uB5BD1dhXFXIyBFUS6tr5qW0n
 whQPOkA8hGXe1SE90JQ==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id
 d75a77b69052e-4b0c16c4306mr54913851cf.0.1754908432532; 
 Mon, 11 Aug 2025 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFWzMOx5lf2Y5IZtNHNRwVFoW5v7W5IA4jlN1pRSARbMIRwDiUHjzbS30nEqXIzqvbxbYx1Q==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id
 d75a77b69052e-4b0c16c4306mr54913671cf.0.1754908431941; 
 Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Message-ID: <2a74d3d1-62ed-4a5f-823c-e1ca376ba104@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899c711 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: EqOfZJOCVZErJrEUwuTFyNA46mstloJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5XOdLFP3wU5q
 SSQ2JDpz6xOEX+K21qzjGSkI/6yl3bxXuUq8TzivGv2Le8ZXHIYkd/I/3gpr1CyW+wmUypMSaTM
 v0+hxHVLqeRDVg2su3ThFRxNkSLa/wvStJxlaewLyqyylQqjIUT539Pd/J/UQm1arNFsM77eWJh
 IzMBvtlZkJAvgAP4BN2J91+cpRz0IkLooWLQHJFOipvkV2ncL8Aql9gk/qRgUlkG4h0ZQG8kuG0
 ebgy1hvy85VpT7updaniYV+sWfuCaG99moB63a3eDgu8xKf88GF2ccPJNzFMIXg6FSufVsPtz4R
 Bv+8un2CtzJHg0yZgoHEyKEhd4nu8KFUUUjvCSudIMG36o/xMEUel7RpP90bM+eV86pt35GjBUo
 UzVvQ1Nu
X-Proofpoint-GUID: EqOfZJOCVZErJrEUwuTFyNA46mstloJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
