Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5EB16E67
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 11:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDC710E140;
	Thu, 31 Jul 2025 09:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSeyS4kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695EC10E72E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fVgx027074
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=; b=pSeyS4kk+WgAAnwY
 BnB9TcCKMH7aFAq7f4JT8nTSkiiIP6AVWRZ1X+GXkGtRSHQjNEJD1rjszDN1tHqE
 Ig4CmpPgC1chcXjQd+xX9pUKIspPBfQCQdLbZnboz3J9Po361Iwz9rZRiAX0HO8h
 nUmFiqiHXD+8ft8mI+etNuBqHaDfeeBUK6oxAGXeDTMwN1CClupFeEm90Gu28Adx
 ebfkUGVuUxG15rliIYw/9fHrP3e+HvVj48d3SN3PA6f/HGndAPQ52EVZBLI25tPT
 jiCoZsXrzYGNz9yv31Lm2bj/19xS3LXrZfhZ4A2cW1on2SA+fiLncQ9PTDWgjSoK
 JZrQYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jweujrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:21:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4abdc49ce0dso1414881cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 02:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753953677; x=1754558477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=;
 b=ETWqRKLRfjBQCkf/0sFCPZmAhuzJlN/4gHAecl1WQn5lZ/l9T5aNIGJP+X6+m7gIYp
 idrG9QscQj7ydsYzZdEEl1v+wxy7sSb3CfeNnqcJmgnxb3uKfJ5IMdcCUpS4LufwY5yZ
 icBvGeblHroOrEoTnjXQtYhkpIBHhfw8fxkjzVIuy2mdlUzIscMgr1lGdl1pNSBq5E8i
 KGBsF+T1FIsG6euIJX7MjBleuX2wRCTGEXAt9c6BZM+IJtf/cwXMddG9e0M7TtbMSgm1
 Cs1Jo6PGkMuKByl+bIvj2GXz4WSrvxgNfCJZlsc9uO3nkYjcmC1NgnFDxAM47P3MWey5
 jNHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVofk6iYt8P7uU7Cd1y3GFGsu8f0rWbSs1bS4JpGv+cnox+9GNAZx4q9aHVOzS2JtHkQMw0Btbw5cQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXCa+B1wLI9kAGYve1iglGj4Fc3c+fZpDmrppZnWCI91heFLIv
 SOzQFcC5+dI4RuRxSJo10NBcOBe1Xs10lPYKlLmCnbjpPNbNGLxLN0clMRKDFJ8bKC7xrP0Av/H
 wdjMMxpi5fPb6ahezHeMdpZlng7kvxj14U/HjDywn9VnaurJLHcGvST+Ue2HYWEx3pcLZqYo=
X-Gm-Gg: ASbGncv34k7URMP4LLuZRepgCj987QcRhhZtD4AIwHynbjRVRnXr10GTFhDd9OjA+fp
 30jTgwybsEcV6P1RXQA/XxvekklBvpgpYwvxvDE/wp5f4pvYnbJZ4ANYEK5rUr3Iyy9ujRE4b+f
 RMS4NaxX1CvPIvPVgQvS74LWrW8nUfqNfc8dDlKNIcKAgUi1VkaBiVuLAS8pYWU4hWowqkr7nti
 pRhA0HqfhkGNpLtEYfsygXHEqDg7k3bY8BTxvpECaCuq4imfLfpCDdYlwbWSFK9QG9meLJRKNdy
 UvKfVTzwEF1LMHwsv6OuG91PzHBP6/PgGgB6PO5XBWWf0GXbTtMhiQ7gJIHkxbv32h8fRMZYjdI
 gPvm0mlsdiDkuQHOpog==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id
 d75a77b69052e-4aedbc5d109mr47967021cf.11.1753953676644; 
 Thu, 31 Jul 2025 02:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7y3Mzh8kLpvXdgFmJK6NcsIZpRA/EOh3rdkLqhLgosRXc0fkF06g5WZgKCLXL9Gc73OGlA==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id
 d75a77b69052e-4aedbc5d109mr47966681cf.11.1753953675720; 
 Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3792sm79613466b.50.2025.07.31.02.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Message-ID: <304124f3-3686-4a04-808c-7ee84356966e@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2][next][V2] Fix dereference of pointer minor before
 null check
To: Colin Ian King <colin.i.king@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
 <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yDPKsuAZApyGUApQE2ODEmQovFYC8w-1
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688b358d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uhsglmO2XhRCQ2AnPp4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yDPKsuAZApyGUApQE2ODEmQovFYC8w-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2MyBTYWx0ZWRfX72MyCbGuM5n4
 DtaYMp28mWcKqRG2Qm0WCMSBDkEtNUNWvXe/53O7tX74hG5mUjBs6GPeJjBzR74FYzVdaxwmqIs
 0dMTKrWtooVLZsKaobVCN3m7LyvZ9nf2prY/5eLmWAttCPLOj8QFHiaFXaS4NFw5rvLRcWA1RwF
 vs8tIH33TAK1Jm9/vwFgn1bYcEdarxz4jwjJ56048zv5XzDcyDfhyM5jf1M0QHk4XymwRhVTMsk
 yOKMK2VALau7edRgacK1A42NPAkqFiVD+rsPH1YtZPo45+awbheOucUko84mRaV/KaVNmV2melo
 i0vjHpum1aragzMAOBb2/ZwETf8JgFcijJcdSUaqGcx2y/aEk8Nz7XlorYOgMMupD0u30/PTinZ
 k80GiI9J9pii1P31plFyz+YPqEREA7lFnCWBwwc63j6JY/bFON0dnvDrhCr1CoEuP2vbzA8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310063
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

On 7/31/25 10:18 AM, Colin Ian King wrote:
> Currently the pointer minor is being dereferenced before it is null
> checked, leading to a potential null pointer dereference issue. Fix this
> by dereferencing the pointer only after it has been null checked.
> 
> Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
