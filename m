Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A4B12A5D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FB610E26E;
	Sat, 26 Jul 2025 12:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHP6I2YA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8245710E26E
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:05:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QBio4k006675
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DTIGg+kC61P58j186QXClRnL
 U812M4zddHYS5CcqKJU=; b=BHP6I2YAIqdJi7tJv2nQQJe7Is0zZkqGNEQjjuOH
 1wYHb08R2f91VnkqBvY9h0/mlhFa5BbA361u9hL4nV+TUfqSIU32qKfbxRZKaa8v
 55TP8DPqemAB8XZVDM1cBoWQOxk7LoSWKCjDXAsI58KUbKJ3RO1tsxNFt8uhFr/A
 f6/hLa+1ij3bXOx/31nxb69vRQ/AUPMDBtwKqmVkEeAp+NgTs/JuImttIqr1shJz
 oLgNwoDaFYQe1o/a66mX6KaTcPu7ibLA+qr/AOz5Q33gtRsY+zZwaDnQWn/LJQIQ
 0dKthinJR0wxwQDvb98XnzwfwBa8qn8sM8MzyaUFDilOEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xgjy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:05:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fb01bb5d9aso45712206d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753531522; x=1754136322;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTIGg+kC61P58j186QXClRnLU812M4zddHYS5CcqKJU=;
 b=QDQHGBpMv7Xv8eXzn3n90Owb625qdtNzT3nLbGnmmjA1kPHbQoglbub08qKQTrfXHA
 LV/AyFMS8fEOwhnupejffwyzlaeh6p1xbNVCTzdyeJcV7JCP/B+p+eUCEaPNsjg+vzAV
 oO/Tm/oEVTh03kpLQlXkMdp9pzrO61dFE1iBG7kOMD+98kNkn1uvOI/wz4H+2FkaCrgE
 2mNILRa8+vI+1TUgtRQOqcg9vvI1HkuKayLvlGlZgSYh6UqKmaANND8rDv1BaYEps4VM
 8gKzc5FWak2fuEaFD87lKZo+Y2IyeCjC5ZG9L6M/gs5IjqWcR4p+ExmpzS1xgmCFnG3A
 gk4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVums5qu/5LQWZM4/jEgjDBpDiqsqLm7Jh3ZopJ6fz2RSllPhlE7nkbzBzcXAcwgBDXc4GFKt/oNLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEthWwy8H/WRPIKuLAsS44Cf/nD9gXKy7WuFYeOV0wfSJoA9oh
 eHKSIfDYqLJf41+PDZic6nrgURjR3NeI2HcxLYyhqyl7SSRTvlE+q+EYcLBULMODu4vj3odW6ud
 9xRbdea96U3lNs5x/ES6iS09nylzC5uKGg0Wk0NM/3X85LqLpHQwtuVPttv5y0gaDvi8D1rY=
X-Gm-Gg: ASbGncsWXy2CSKSzvAnOnujlJ3aWD3q+F+QQo6WJPSSSUqb6LOXPvtxoEE9PNkdQOhN
 IlSyjHE1K/ZSJ2zLgW0n9fSajEPcrc3rXXSYtEFsIpU7ShqAYe/+fqqVZPv/8VAhdCJGiX99fbV
 BMlE49oBrDtdvMQZJLrnHBgyTYdVD9x3DULzvWjRsv/dIhuXdE3pVG7u3LiV6O8XD8M80gcZs65
 PJyxJaB5Ts97IcqPQNq57chmCeJNp6Qr284CxmNfqK6wHG2wbJhtrDi/J2y63+ya4Qlk2LBb3kE
 zeAVvl7/3q4NfIqp/TP9sd3T0tCSaOtn1hYN1SXcN2aSP1iTaukejyoCpnU0OQpr91y/oh4Jkpz
 7cC3g8vUVjYmabuyrkWrTX7j+a5/E9+wYNb8AOVxXI+PI+cjgRZa4
X-Received: by 2002:a05:6214:29ee:b0:707:14d5:ee74 with SMTP id
 6a1803df08f44-707204b2a68mr71727736d6.3.1753531522536; 
 Sat, 26 Jul 2025 05:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqLS1jVGgdye44ecBKfrqDjWtpGZOfSZrTK9StpLefqH75rrfs9TCl1Ca6g9vIQ221L1XPHA==
X-Received: by 2002:a05:6214:29ee:b0:707:14d5:ee74 with SMTP id
 6a1803df08f44-707204b2a68mr71727076d6.3.1753531521882; 
 Sat, 26 Jul 2025 05:05:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6337f3d5sm406862e87.165.2025.07.26.05.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:05:19 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:05:16 +0300
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
Subject: Re: [PATCH v3 11/14] drm/exynos: exynos_dp: Apply
 analogix_dp_find_panel_or_bridge()
Message-ID: <lhzh32ji4gy44kh6ymobbyp6xdwkx5hwfwdhdx3fy25vaeigin@6ofhouk6nd4h>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-12-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6884c483 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=xX9fryL7oNgbU_NKkWoA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: RX4_g3o11XOjWXW3DCtpqhg3d8mZTuYv
X-Proofpoint-GUID: RX4_g3o11XOjWXW3DCtpqhg3d8mZTuYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfXzZ6qZJ2H/VRV
 2OnCfRE+IG2OS4ox31G5+VtKQH+bwMgNjZxzj01rs04fXSYuYUEz3mWCzBA9OddaQsXvUz6UkIl
 +GyH/38WaQnjZQ3KDFmmHXt1MI3FjpKDI0jNzAdZ7mEoGO2tSXJQUnkzBzrMtLeD3J3VubQ9Gur
 CxyvjkOK4WEaz4TdglMjvNyIqPCXuXmeB4d88HQ+G9XHm3ugNo4cN2WNPcjniv/5Q7lZLPQE+Wp
 WoN0suJI1w3EPlwNY1CjfH00HdxXpRc0pSVX9X5eULo4Kb0U/GJWLAG3x191FDhVHJnGj4Kfpoz
 oBcygWJOIAQmyOix5qmgrGU1XIbIq88r6jJgphGdiG2EgsAWrR0yAIqO8xykMSSITlaWf6EKqkF
 JEU8AK+52KeATzDylJTkwydq6R5YTvYVgoxE+MNzQ4CbWY4mHHwoe9HwqAfKfE1lyOv9kzEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=767
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260104
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

On Thu, Jul 24, 2025 at 04:03:01PM +0800, Damon Ding wrote:
> Apply analogix_dp_find_panel_or_bridge() in order to move the
> panel/bridge parsing from Exynos side to the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
