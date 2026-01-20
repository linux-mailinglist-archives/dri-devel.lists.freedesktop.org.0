Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C767D3C292
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 09:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C4A10E580;
	Tue, 20 Jan 2026 08:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpCESAHn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gv8CmG7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1210E580
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:51:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60K71vhw1409016
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=46s7AE8ltIQRcprz+bwVj3dx
 rb7H0Ku4rfJwQUc8byI=; b=mpCESAHn8QhDjCO4WhASPl5H4Q34k+mS71XzVypV
 YMbd0JZXt6k83XVuhVqtuGrr9/FtV/DR1AbgR5o5wIwCNmG+a44bQH0RaAHXSdw+
 Q7clY+ju+QnEoFkmPBcRux0UBdDMhZdpSIrk2a7KVIDUBEewZnjhCkftwTSIiBUt
 2WqoCfiWYNwld8GOR0UHsFWSxAeODcTdLdlPn/5cDRtfLn+7N3FHRMHXqXiY7ZHo
 CE1eaHja/nf4QMIeawtXstcLAKf5IItmp74mva3MtzabUfL7rJ3J1E4+7uqOiCcC
 1XpwReKNMZ5UqkEwTqgdjEd5EHpxE0I+hGPVsh116qXpow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4y2rav3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:51:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5296c7e57so1786840985a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 00:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768899115; x=1769503915;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=46s7AE8ltIQRcprz+bwVj3dxrb7H0Ku4rfJwQUc8byI=;
 b=Gv8CmG7qtC1MhvNs8NHu0XUqabgqzamdZbGfQP9YDuk+S6qD/J8xhFxO+wlHB0q+ud
 A3j9unINJogOyzoo44/RC0go5Azj6Ji2qH6XcBAK3n2WkEmUJT+wmAQCULoaknQfD34r
 OLcX4m1xtBBfnA8cu8Fw3BUf8VdYYIrmnuwsZKJQrSIizrTq2mRSmAOK5Tm2vdWB9OWW
 V8f4jVFgw6UVsidBsvUjxM+LJPiXShxCiYtsyLEHQ4nYYY2ftntm+RFEBQKs7LOvlPyO
 ZJuWpCgi5C+qexN1GQWEMWeXS/11DDN8uPoD0kWzT/XPOOGLLAlBmuayTugbZdQi89V3
 kUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768899115; x=1769503915;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46s7AE8ltIQRcprz+bwVj3dxrb7H0Ku4rfJwQUc8byI=;
 b=YHIjt2tLg/NoZy/bZQpMQD5MvT/u8K/dbLENGyeJ+ZUFlp4WRloi6qNv1+56n9/QYT
 vSqruTJ139xIWBFa9BpwGingxtbWsKtO4xSQi227fZh9gRuUvjwgZe2bkPpJkfiZPo9u
 NheyGaGqUqphRAoMHUM9yIifCDwDbSrGtQl4OhMRLpG4jQyjeGEGAgwTAdg0MXrSJ4fb
 qTduiQSBGRpEdHalbYZxPl4RqbUZHy05czYVhKzEs/UOZYCtD1dR5AZeVjGjmj4FrQQp
 bZlgQe+aax9IrX+TsQO4c8UTZfm2WyWnOUNs1NKup6STBeA787+fksAVgNJcYvvQmCL5
 E88Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjVnBATAlvtjk4wyuFcR93QGv4FR8pHV9yK3fHDSvXJkG5pMyWHLI0E3PaRBWCiFRNrpDVmrM/C4Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhrZftVVOS4buC6ZOvBdIAy4tGX+xKDCCcTvk4LEUbtSiTdKpb
 yb/OIs8BzJDXqgiT+jRDoPdLYWzMf30EGh/f0TenCbKDTp52e88B7fOgSW6KiRYr1xVJkWLQUC+
 txR7pEqG+RZwMUnpnCktEk/37yIA8fjxHRJYHj8277zOiySbpJgBkPN5FetMgsE7PqbytqXE=
X-Gm-Gg: AY/fxX7LuPXfly3Vg/Np9YE10nE8+wTR6hhRXdv9B8u/RUCHMwLa58FZNtmaIRTIPLK
 M+AnVY/6Sv7MYVNxh/W6fzQS9mQuBhy1hDmd3i+PPJSpEm6y+VrUYHWFpWuyimf5yiA8g0ACvTA
 rJZ0sQ/be4ugw9WmDbXnUxjoU+bBPZCiffIGSZgcAGsx1SqDNG/Z8v7zOTH54kOsZKoM49SlPDW
 i5KMjJZDWOM0TdZmhMYf7IW4IdPTmHOtbMxDnuFpUfwrx1IeWHklsxfYcopmtwpQ5AthsbwidDj
 ya9p1DiaNGVXWaO7YDkzvCjVk1FQ81sRxJB+WuibzmJ2yGppXGC2JIMQNTz0Wmw+/K6iKMLDQu1
 4iLpOv6rXt92v1LrXt1EzI8MKS2nZo/hXBhokdYXeftZdLZ0D9BAU8MBxFT2JhkTe0r4z71uAgu
 RM/SLLOG/AomWZO+TOfr86F64=
X-Received: by 2002:a05:620a:4892:b0:8b2:d256:d064 with SMTP id
 af79cd13be357-8c6a69563a2mr1807188885a.41.1768899115098; 
 Tue, 20 Jan 2026 00:51:55 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8b2:d256:d064 with SMTP id
 af79cd13be357-8c6a69563a2mr1807188085a.41.1768899114633; 
 Tue, 20 Jan 2026 00:51:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf33e9c6sm3920753e87.4.2026.01.20.00.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:51:53 -0800 (PST)
Date: Tue, 20 Jan 2026 10:51:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 drm-dp 1/4] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <d6otacjtio25alb2stjscl47xkq7lhexmciuiuot3pk5x4hcqd@tq7ckfvnd6oy>
References: <20251210023759.3944834-1-shiyongbang@huawei.com>
 <20251210023759.3944834-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210023759.3944834-2-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA3MyBTYWx0ZWRfXyv7IlQZIS8vp
 h2x9FD/N3FuLyWg/mcGCFy5/ujXRqJy4n4wNw9hXj4PZo3KZtq4dUKxPS/Zut/Jf9tYjG3pAO3A
 JG0rQ50z7nBO/MUNnePKDDJy/HMdjY4AzVPCM+qMq074OMskW0UFaBKkNqDSJUQM3xBvANFK9T0
 0vOZV0HFBvsdb8D+PSlL4ZBeou3SbJrAihoog/0C2y72Bor/OI6euRZdAzgGZsaCC+bHGNaNpks
 m2Ml6LBqqoC54Nbo0CIl5pezNJKRHGl1s18IUvWYPApYA+3Z90gjwlkD7bX9kqDA46MTRu+7Sx7
 h0BxuNYOJAjYzLLUbvet9LTd06KTDRSVnx21SvC4vNJRkITLTSVzV4dz59HjzxzqItCjFDdz8BF
 qBtfbqFlTeiclW5Dln8+zDsHmc0l9cgL61k3opqUa+q7rH6a0VVCJ3ES6zKOECz/hhOpTJePS9Q
 5wHPnF4PrMv4gTNjmEw==
X-Authority-Analysis: v=2.4 cv=Ds1bOW/+ c=1 sm=1 tr=0 ts=696f422c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i0EeH86SAAAA:8 a=BTeA3XvPAAAA:8
 a=EUspDBNiAAAA:8 a=-Ld3497Pje2vR7nZT8sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=tafbbOV3vt1XuEhzTjGK:22
X-Proofpoint-GUID: PWIOIuHuE4GieMkG59teruVsexYAvEv4
X-Proofpoint-ORIG-GUID: PWIOIuHuE4GieMkG59teruVsexYAvEv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200073
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

On Wed, Dec 10, 2025 at 10:37:56AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The issue is that drm_connector_helper_detect_from_ddc() returns wrong
> status when plugging or unplugging the monitor, which may cause the link
> failed err.[0] Use HPD pin status in DP's detect_ctx() for real physical
> monitor in/out, and implement a complete DP detection including read DPCD,
> check if it's a branch device and its sink count for different situations.
> 
> [0]:
> 	hibme-drm 0000:83:00.0: [drm] *ERROR* channel equalization failed 5 times
> 	hibme-drm 0000:83:00.0: [drm] *ERROR* channel equalization failed 5 times
> 	hibme-drm 0000:83:00.0: [drm] *ERROR* dp link training failed, ret: -16
> 	hibmc-drm 0000:83:00.0: [drm] *ERROR* hibme dp mode set failed: -16
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> Reviewed-by: Tao Tian <tiantao6@hisilicon.com>
> ---
> ChangeLog:
> v9 -> v10:
>   - delete 100ms delay in hibmc_dp_check_hpd_status().
>   - delete redundant checks in atomic_enable().
> v8 -> v9:
>   - refactor the hibmc_dp_check_hpd_status(), and add some checks
>     in dp_encoder_enable.
> v7 -> v8:
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202509241625.o4mNleVb-lkp@intel.com/
> v6 -> v7:
>   - add the check about branch devices, suggested by Dmitry Baryshkov.
> v5 -> v6:
>   - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
> v4 -> v5:
>   - fix the commit message and DP detect_ctx(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 19 +++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 +++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 52 +++++++++++++++++--
>  5 files changed, 80 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
