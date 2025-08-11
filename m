Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F056AB2028A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2510210E3A4;
	Mon, 11 Aug 2025 09:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfYtt73T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3181510E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 09:02:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ALjPCQ015013
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 09:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=; b=FfYtt73TZBF5+9/z
 qDBn8YF/XFOCvLK8+/qPa/2rX2ieN8UifIMXB6c0XGgtZc1uOHxrG9sMzXaVOTMW
 ODfXLj1cqgiE94V7Sea1ZRVhXpTDS/YT6vK+Yvf9qP58EoLphFNO4V/PM5YrTbWf
 FafAbgxCz2Qt8Yw7MP+UTHtXhHT+jMd/ERgqL2Zs9FTpY1iCxL63eu3dJfUX9Lvn
 ZNby5h2tNk1xx+IBNHTohCpm3kk82W7QcvKl6CL1SXR2Ar9b2D8DTx7Dlc4J1rRz
 koCBHRw1vEqu+UufFE7wk4xUFFporON534+10M3shJ38oZofnfetpOYD09MFP//G
 +w1TSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g3pv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 09:02:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4af23fa7c0cso12196691cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 02:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754902970; x=1755507770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=;
 b=nMGqrhNWuTp/Xk5XRb/NkAR28kqYsdq0SEIjrTsvdNf3lCam/QPTbytplWnt4mr4hV
 eBAaQiYFGnOBdI2eT8mNmmyvt4CYO6j//5rjU/1ASr1dDQRmAKIFOzJvHj9bM3WR0Z9E
 bmxyFAM+Uws3rnhdHuhNgvBZVcevamxwlMQupcCsMAjrxEKXTHK8vBVDHuLu2byaH1+U
 8KoaJHkwQzgdAU+YwY0Mb+PxaZjwAaXzTmsfXXYTCLOYn/ulE2U5JZEKOL9PlRaHO9mZ
 wngMdMjheK3JwiJZhkjEA3sWbA8vW8D3ezSNjvGOnw/vZQ1LobqgBjMOXNnHfdSgymR3
 Hfdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+wLL5sTOwvK5mU9bQPw28t6qcrfmfdMDtgbA/ch64QZBufNc+T1Ur9Kw4vlEF5pXYcdG9li4/xPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5HO5elO1w7BCQVFhkpauS/tcCNriG68WIUhhaDUDQsyzY504T
 F+0F3b39frVfm7WDEk106sVS4Imdq2LiwjXEeyJI6dxnAMsmNweVdYkwlbL8JDszHf+4Y7LiGom
 vTE/ubf6Ek5AjVbKGXM3k3FWmk9F6n/4FVFh+NqJAHnpcIBU3fQ/gqsdQUNCuUZC5h+NgXtg=
X-Gm-Gg: ASbGncsisbRO6sjwOWjYEXQJuSrfA4m4l00ya/MLTzpnrkXAORaAJTWnihUTgdoYL/M
 tj11NmL7eLnYgrNsEtkjS8OGKBxBKif2MVDKuR35SrNbGZF41CbtBDoWhmlJOGyBvL+8DD8QHPN
 b0NIO3OmizaWeSfRbZs4EVUq5FKLyLO/Xg1X9SSu4pvly1/v7LPrNi7ehHyokt6pk4py3uVaN/2
 4Mo+Oo3nb2fRYQxmLAOWA9Fdi1nPd8Kz4AD4u69JToK9yil32AutTu5gqwI7hvQdkdvdS5Yvtkh
 kd9YHPNQlEVcHyGOSqgv9guU12jD3G8P1GaBhjlQIIM0E9bHv5CMC6NwgVjaSAAajQxumumusmC
 ObBm7HWY4u8JdkTXgQw==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id
 d75a77b69052e-4b0c1b28bf5mr48920811cf.8.1754902970256; 
 Mon, 11 Aug 2025 02:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5TWRviyLEMQPzvh4QVbqH5jPy1ZuqxzZtRDTRJ9JxfjUgmBuPx6tAaaAYzS0THJjvJINbNA==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id
 d75a77b69052e-4b0c1b28bf5mr48920671cf.8.1754902969784; 
 Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0afsm1977783566b.117.2025.08.11.02.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Message-ID: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 11:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899b1bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aS93HcZ8ji4XsMPHnqgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX8ACpTDO67EgY
 fIjWO5PGd0GcPoup2t4iZoBzm6Wy86pgzFV9vfQfYO+6YpaPf1QNJMN3PE4/TsVM7Z4TY7yFAxg
 a72fZOCTzh/G+rGbLbZDgLS7uNhncSRwmCho2sS2uclB9FynFxUsDgHQgvmdoMjwGQmwneVA0lQ
 /514rRnft8yKEY/oRaXNnKcwzqvFDX7MR78RU5gugeagKLZCcgV0KxCDFmAjR5t8kMNrtWBoI1N
 ym3Glm/HEZAkmzenRt64lD5HKGdHyIvAcr6d6nMcgH3MUxetFSJzq9hIJ1M4ZwkTGx/qAF1BaLg
 yK8m8RKRG0RLnLGJcauz1bSDM7bDx9hmu6QmDbA24d3LeCVD21+EyaQyjaHVF5pGELSYQvYF1EM
 atYT6tOe
X-Proofpoint-GUID: XnwpNtGQPYyhFSseVwG7rj7Ey-bqFOIX
X-Proofpoint-ORIG-GUID: XnwpNtGQPYyhFSseVwG7rj7Ey-bqFOIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> patch posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
