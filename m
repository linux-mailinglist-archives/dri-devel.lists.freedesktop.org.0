Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C4B127E3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 02:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3FC10E24C;
	Sat, 26 Jul 2025 00:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQIrZPLe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CDF10E24C
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:14:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJH5rt004400
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CTGcg8JogZ8+3e2c1J28j27/
 pKoaqY9rvoZ/CTXAvIA=; b=WQIrZPLebG37A2p/sAaV1c+nhCPLOEZ7dKd/z8Wc
 1EWqTW2Dz1/JkNdJ/nCiPKnFh+PmSQpBnc1k8kRzygJXo7V8ICN5XTBWNsfXWlNM
 +FVL5Exg4RjvNzbJGVJjC8pWr4B0KXC0bIJs8Xms3O1OBi3j/oh3PiKlnCaMwbaH
 YTWlWvjdgaUtEWO8HHhmyMwsKcVPr+Ey8b4iyE7Z9/uffJa+F9TdUyhLRAfFgqHC
 nZxLN8TKMrteknF+bwg2wtMg7kpADmN+c6doR8bKUja2yay1ysDov89fq2vJeE5X
 mKhZ/Lz4qMRy99m+IS26LwS4s37nq+L04LIc3aOco0Gw7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2kuwap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:14:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c7c30d8986so793894885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 17:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753488882; x=1754093682;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTGcg8JogZ8+3e2c1J28j27/pKoaqY9rvoZ/CTXAvIA=;
 b=RKC5QWeaKHUY5HZTmK4fpM2DdglLDCBcnNUYbfHgjNrgpWUI0vznGPlyVoGl4xWsUU
 k094hg36hBSsXmTnhwuPd3E6ac6M1p513nbYscNRz7iLPT9nj2XkmQSzhYm4dHrsvmqB
 JsviIaGSbnmKvx8cdomFK6u/TsF07h16GH4upHecJVLoIv+vkVeu0Gc887+49QMvJkjV
 jf5mRuiEgEYLmw7HV4ccJ7+sT4wlb1VoGAHjeZnC/gSeVOpgyBsHVA1kvWkcqzVpxwzn
 5tK6VMxl3CXP8lJXaI339MexguGRv03DUX0nHAfWylHP9LY8jD2XgXvIx+XQg77Mv+1r
 LHXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmhh8MzG1E4jSssQ3hisfqhMskTQdZ1Z7R+6L/wz6hRqTitSvPL3wJqu+o3bgX8tbuiREkq57QEWs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfA2xTSP6VRS3dcddEd5lk7vDwua4fvatPnQnZ/9j0aNYkA1jz
 rUvSrbrwog4Xj5ldDa+pZ3hgnh1gBcE6B1QtPFx7orn0eKgv/aU+y8pHXe1Dp/wiTwpEcHNdxPM
 jXrQywXPdlqa8NNKG7Pmu06wKOxanIohJhs9/DqNRQ9r57YFFhDu7IIwILMB+Fsn0bSpxYJw=
X-Gm-Gg: ASbGncv17x5bRSZ1Ey+0q7onvsCSZX6x4MfjBKmvxQEHtAtsxXhWl7ICwq0A3o4X4cz
 8t9Eh9flD92x3p8nw76lbEejS9C+95ME14Rym5b6uJKhDi7d/DH5T0+qNMOZ5UEXZz3KSWQCdCs
 rmbdoPQhN0WylhiJNK4s6jX1dTNQ2C/GgC95DJySHKx/CmtVUWH7o229y6aXjz2fqqanzYYT2YJ
 0RO88VOQ2WajrvuKGQhnfP+6jlbKgLH7HbkpJThEAQsUKZnWkMxKdzB9NO9dwBJgLtY49EX2klW
 a0vwmd391EownnvBmxdAVVQXxGv/Luj1Ol/LoTYGy1m8tRnLOmtWAfF/8qMUuuQEJb539bkNKjb
 ZA8REUO56zjlcr8HCbQHXLogiShphvqul2uDmqeYKJVW7kWqmNRm/
X-Received: by 2002:a05:6214:1c41:b0:6fa:bd17:313 with SMTP id
 6a1803df08f44-707205a701fmr50122946d6.30.1753488882361; 
 Fri, 25 Jul 2025 17:14:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdQpwGUCkqR1lOUKTKaqZouyRm9icTapQyzE9JidQYLs6U2H/kr9H1AePaGwZvW49Mwo6Dww==
X-Received: by 2002:a05:6214:1c41:b0:6fa:bd17:313 with SMTP id
 6a1803df08f44-707205a701fmr50122636d6.30.1753488881831; 
 Fri, 25 Jul 2025 17:14:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6337568csm188598e87.129.2025.07.25.17.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 17:14:39 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:14:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 06/14] drm/bridge: exynos_dp: Remove unused
 &exynos_dp_device.connector
Message-ID: <ovlz5hotvqyn4gnrmidfq3aafq6tkjjpnpgt43yterf2cd73ys@dkarreyoctbh>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-7-damon.ding@rock-chips.com>
X-Proofpoint-GUID: 2SPaPRz5EzV_gqQ-RzD4Tx_ajj7bad4e
X-Proofpoint-ORIG-GUID: 2SPaPRz5EzV_gqQ-RzD4Tx_ajj7bad4e
X-Authority-Analysis: v=2.4 cv=QNtoRhLL c=1 sm=1 tr=0 ts=68841df3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=xX9fryL7oNgbU_NKkWoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX5XisQkww/wz3
 7FrgiRjYyDNfZgeQqTgddFFxNL3clHX80hBa9oIHtGJTsYEfTCaW7dQsHKup2x0EqLNnBBYRKM/
 h7gUpqcSUEshP12ySPzwLEt5BeCcXWvJue2+6+nhuwn8GSwSHvAAlHTIheIcbPnKKTxPTynGNEF
 v8D1R7TN2DsijendFFmtNWJr5kxJmzjKrcfcoQGKOcHzIQFoiomPYynpcUR5VQM9QcXBXdOvZcB
 frRTkgqn4U7SSeJUZJyTAna+iAPQuV34yjsAiH8p1iuw47dxnurv9u2Omdt8JctNMQ5+nfv2MwM
 qRqtl5+396TN+99/GB0d9jGgcGUzze07Vkzphziz93nv5q89EIkwiN6K1d/LPfNYSIWVIJeKlUP
 TjSnPA2lmd6gqliZgkUrO5L6O209xfwni+J/QA3YF5xjOJd2E4bk0WcyyWKEUb/ixNYzjMh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=801 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250208
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

On Thu, Jul 24, 2025 at 04:02:56PM +0800, Damon Ding wrote:
> The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
> but never used. It should make sense to remove it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
