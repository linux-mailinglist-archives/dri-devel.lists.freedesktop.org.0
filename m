Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E0D199BC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 15:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E395C10E4E7;
	Tue, 13 Jan 2026 14:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzqcb2dt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIC7gCzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469A910E4E7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:50:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DBDXuZ4164859
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=; b=Vzqcb2dt4qxwuj3n
 3tbwEq+TxmsomftMbdaJKB2dWG02cGZQ0B081IHQSeqUVPmXQjcZDZc6D254Acte
 II3d9yzPRmlkewFJLrY4w1CTuMTq75jwimIiyunT7t4D3RmQAwjkgh0asG+N1GWU
 7ecJ+Jvvmox+4AqJmqFXDUPK8jFO/MEyoZtBA9hnGc+yPcWdmotPRWiaQ3tsDZK9
 1ELHWZaOu9wXq2ITxn7pTZwfCDGTin829GIYqwNA1fpV3nzMvqlO5hSTZtpNFoDF
 qCqWP3P2dNIpfl1Fdg+RnsCfpSWhiWku84zBJ4EL/rnfWgB3uV3mZmU+Zapc+z0L
 IJorww==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06rmjw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:50:11 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-64565434d7fso1681769d50.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768315811; x=1768920611;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
 b=iIC7gCzbLeFMQEu9b356ehsuccZ2dCQVIEi5Cag+czML1vhDzmtZrGOokWfDuUnKma
 2Vik/8MbJuIQCHVjFkSnYP/Fa+ASeqsvDUuVUrputvL95Lpuxjf+htaXdJS9skDGjxeg
 ovBpORoMpkzywKh1uqw0E4/LWYtPgKq71vtp2TfikeHV3icts0Yt6CZknCxndz7Lvsl0
 MjSZ5HpxVSeKsYP3LGogyY6sWdrNDD/QP8N0Joeaqah2Edh6j6T9s1Riy1dyMLhghQ9X
 yLR8SwPc673V41BdoW05KtunVMqx2js8aPh6tqz6v0gpFKjn6KCpKb2t31B0//aPXxg6
 LIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768315811; x=1768920611;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
 b=CjmVYF/wxhG6mwOIZYr8YvIyimyrmtiPMJvAy4iGsmm0fAJO/5ehnkruLPLvhhk3y9
 0bwm69kE+beZfX+a0M9S3Iwfl1Y24dqufMVdkEGfrKzIYecvawvKM0nv6ZR+dg2rI/Eg
 iNieHpjCFl2a2M4rHSWu1WG/5r1HMm/0JS/PWxwaggWt/oxmqEfXyToTTYfy875Bjr5x
 u0kHSbKk2OwA1SUy5jRN5kEe4M9otw8Ez+Uvdzd9BeEbO3VfxL6mzHSS2nkHSAaqpCqk
 2hrtixsCNTBGjFMn705e4ruJiZofOVvYJSWfWVz8vdqiaNn3SoCz/SdCmV51bTNgY3Kc
 qAHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqZuMauAWRGfZhZC+RJy0jIyJEOqpG0Pju8Os5EHvUc5Kn6WQHN5tPxoFoEKUAvwOfxnCeBeuibmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS4phkOdEmuJ9crFpYEQHh+qDQviwtBzZbKA5YdY0CcBfV/eL4
 cLZvEQPnPpKeUdG1HgSD3OUtfrKbXtx1f0nkx4g9p/TuPZLcC0TPRDOnw1aq22kxfxl/L270IeE
 coUGgBX9K2USfrK6Hdg4vA3z1Q5nBTReeuloerfYncwAL22uAAZLkrlNmr0p0v+SjWmFlDqE=
X-Gm-Gg: AY/fxX50re47bII/b9McEIrGc9y45BhpS/+aO3H39fJy3wb0O7OLlM+Px+5Oztej3eV
 3D/FDsL1Mn75dmJcsWaqLQexMC+wEollNPuCxz5HG2laPA8njUR7fIACFwK0OJ1jnCJ3CdeDab4
 77QxM96hAvRYRNwPiPMMok53i8V0WzcSWy2YIxUvkMiv9pz8SwskxDC5ihCEOzW6JuD9EAMnklC
 RhqxyZMLYoX+edOnXeLMqxXEGlttPFLBvxwNO2w17vaRr23IR2kLLtORGergJMpD/IG9V9tpx29
 Sb2/2xJwjnLzpsHmDqFW8TknOzEU4hu9ReZtA+R10I2lpk8jtZrhLs1qxJPUD0iqqf5vN9y+PZw
 Py3GvS3HOSAbbiM3RdF8x+YlXWnoNzeieHU0xPzP5YVNCvnLeDP2ocVkGGavq1TPZleI=
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id
 00721157ae682-790b5701642mr160364837b3.9.1768315810539; 
 Tue, 13 Jan 2026 06:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp1gIBS5jEoXkt1plSH+bt7nf2F4KHwCWqllM1mxQRTlOiQ2zlHM62mWIaorCJLX3SUhEhcg==
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id
 00721157ae682-790b5701642mr160364427b3.9.1768315810084; 
 Tue, 13 Jan 2026 06:50:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86fc303d7esm1058489866b.2.2026.01.13.06.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 06:50:09 -0800 (PST)
Message-ID: <d63d4c98-68f1-4dcb-b8fb-7c5daf343cc2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:50:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: Val Packett <val@packett.cool>, petr.hodina@protonmail.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
 <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8wjywFHA0rVQC3-VVK2nm8x3_WCl6PAp
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69665ba3 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=rC8bUFBNB4MWVkYa7ykA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 8wjywFHA0rVQC3-VVK2nm8x3_WCl6PAp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfX8k2Nrv9hkNN5
 NvionaMdxITlRw+kNS05eq14a7mYz81uZzQ4OJSsLUW8TEvfou6gNK2FK1ntG3r08cCdpH9Cddt
 va80v6T5ACcJGNWnG6R3/cn1jC2WLU6BkEnXm8GPoALMwYxdEmRxeMI5EzvZoXwJ9GCZ7Ua+ZfJ
 EiGbIAkkTnJOhzRebK/9wbYhwkXdLwddr0Pej5QBNr4EMVShTMjKnuZ3jbPPQWT52nQemR0b1x3
 mHTavazuAvRPk/PoTI+2d17lrM0jW8B5hXWmJM7TSXiuV3pH+wuxAi/IQlyNwxEgyP60YuwowAK
 ywJXtyfk0YGjSCCQDQxga6ioeyuLyMTo+FrDLYnlZrhCJ409ZMa2QJf1h9q2UD4PQm7OywU73ND
 muhizuc4tdv/OdSPQCw9j/r2n0fJSz/UlIit6xk58fq2jsehiQoBwXftxU1IvFHsqmyhllDHsLP
 XxL6hDOQ/xXsr37KDmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130124
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

On 1/9/26 12:00 AM, Val Packett wrote:
> 
> On 1/7/26 8:44 AM, Petr Hodina via B4 Relay wrote:
>> From: Petr Hodina <petr.hodina@protonmail.com>
>>
>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>> clocks are enabled during clock operations, preventing potential
>> stability issues during display configuration.
>>
>> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
>> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
>> ---
>> We are currently running the latest linux-next snapshots (next-202511*
>> and next-202512*) and have encountered random freezes and crashes on the
>> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
>>
>> This commit fixes the stability issue. I've checked other SDM dispcc
>> files and they also contain this configuration.
> 
> Hm, we don't have this flag set in dispcc-x1e80100.c either!
> 
> The only random freeze we have on that platform seems related to PCIe ASPM with NVMe drives, but during display configuration.. *extremely* rarely, but the eDP display output can get stuck on a blue screen. Many run with clk_ignore_unused for the early uefi framebuffer though.

Your device doesn't have a DSI-attached display

The Linux clock controller representation of the DSI PHY implements
an actually meaningful set of operations that (un)gate the clock

Both DP and eDP PHYs just provide funny fixed clocks to make the clock
tree resonable and filter allowed rates

Konrad
