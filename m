Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49A5B0AC43
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 00:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182A610E192;
	Fri, 18 Jul 2025 22:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9qNCDFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535CF10E192
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 22:48:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGlTKM025441
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 22:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HHGP8L0TyeRKQJV/lR6+jNfw
 4z8jT1bWYC47YlMabyg=; b=b9qNCDFIiF37zkPVPxVrouahLXOkCPf8fNx8sF50
 q3scs4vq+BXcx9vVlQBA6nQxRIB2+7jV/r7KfOixhUY0vfz+WAamicYdmKyEHjUO
 uIIaLvoiYPo9jxC0XmARGr3Ui1g9HQ6xaDaGXVQM2HPwPsDu7kiul3Cm/SU5fbJ2
 ycl2x7ZAf6AFr9XWUYfu0VThVk09jwUmMyQouSv2LhB2N2Zsl5mYxbSMaFgmJumz
 NIHE35HFnjm+RVQmD6YQIWNLiqICZq0hixNAUVrKuuCXQzHURxkLwwLNFhpcSDVZ
 Z6onBgv91wQwkrnIq/gj+y2xNZhLb6CL2PNOoWYI/0wpNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqh9aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 22:48:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so663502985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752878892; x=1753483692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHGP8L0TyeRKQJV/lR6+jNfw4z8jT1bWYC47YlMabyg=;
 b=xDu6d9QEQeURrAIfCvcqLQ32BCeCrQ345A6x/8noStwKblNtPwVO7vMgqetxvp7KFo
 PCuYDOuamM5KprLyZwSItZdHfNoyOWF6xWgjJ8oQwyCphfRZCrGNKIWFwhBAcGnOXgfn
 ZedUL080OfLDy57D0Jgze680bjStDtZ/nMJvC/X2k4yQYzZ9KEV5jHAo2PuaZbxvwzAg
 cOxMH/Nx065EcgMmNsEgmuFQOJBJq1xFrZ5kUDPVcXLUwVBL/CzfXRIPWwrgpB9Tyrf5
 pCrF652l9lTxSxqS0BD44KwMBo6CXIIzV6+9cPEgCJKwUtG6PN+oQklV98Y6VEepM6OO
 woMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBGeLCi7rYzigJLwyAJvUC6IueXSGzJBy0u27Bjxx6egL+RGDIG+083q0E7z/cGeqMMiLH2jTaPaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4b03+g+gXID12BTPbnFdrseqQ73xxljRtAEvYdd0QeRfnwbJ7
 /j2EcUg1Bchu9HGo1ntmCtp/TNHlvMPMsoQaHiiDMKEZ73YkYvSDp3Zg45iCkDhbEPcRlGeDMtG
 OPetIA99sdld+jc6qSh4U3qXNgMCQjoqoFYbTNIlWYMY0t9x5tMmW91fwNeAmhMFZk3ik8Ms=
X-Gm-Gg: ASbGncvXWKDSOsAvIFK8hGVkmJNG2Vy7V/e+Oqg4kMu1IWSLi1zoGpm02NVaPJAwia5
 0FYzuQ76UIeV9EWteTVnOvhwYGsZhwMoySy4t5kKM9GD443kl/ry1SPIqtEMS9wepu0ephIjMT6
 N4COnmby/Wgc/ijtCI/v2szR2EPkUM/Nwb5Pi8Th8eetm0Yho5WfD2gs9Ii1FczVkCTebaD6E2m
 PAzFdDhVEuwDrgmSv3vB1/k33VTrdbEupzXST8YUs5gSfgaa451H1maOQIJk3KLbpGqQ/AyzCDA
 25T/bvj8kTVUQwUnXRpE5vOCz3RWulWvMLclgHn9GpqBuKJBsYJrBM/ePSUhmsLXEIBHbPB+W8o
 IGTpOnQBb8UJR3zgWQbKJ+zr0CpBj2i0s/TRBgavI7Bn5NituE0ot
X-Received: by 2002:a05:620a:19a8:b0:7e2:3a27:a10b with SMTP id
 af79cd13be357-7e356b08261mr557583885a.51.1752878892425; 
 Fri, 18 Jul 2025 15:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/wGMWsIGMuMedQ4IyeHVUwmgTIKPo1srnscW5QKnARy5UV9vAyXmC6qAal8+ZyC/iIeQGkA==
X-Received: by 2002:a05:620a:19a8:b0:7e2:3a27:a10b with SMTP id
 af79cd13be357-7e356b08261mr557580285a.51.1752878891882; 
 Fri, 18 Jul 2025 15:48:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91049c9sm3710941fa.39.2025.07.18.15.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 15:48:11 -0700 (PDT)
Date: Sat, 19 Jul 2025 01:48:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: Propagate core clock enable error in runtime
 resume
Message-ID: <rpoild7nomdoh2tr5kizt5jkv23gd772nf42nvb3x3eltmizda@jpwx5pbphuaz>
References: <20250718-dp-clk-error-v1-1-9bb5f28d4927@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-dp-clk-error-v1-1-9bb5f28d4927@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687acf2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=K_Du84Slk-LVA_55HQ4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: deRwiZfS9rIemFHmoFtPAU1dW771EgUO
X-Proofpoint-GUID: deRwiZfS9rIemFHmoFtPAU1dW771EgUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE4NyBTYWx0ZWRfX2fZqpv6k2HaV
 64u3bi7tyaAZuUmKwVjHECSjU4/fSqnRqTzTmil7NH1P2Nh9U5bt0l3a9qgNWaSHEQFW5oPFZxW
 HMvLybKIG3SE9+S70OYdejOySa0ER2azcEwds/Z6btN4VLmHHAqbQttTZzkQpCrcLEXVLsWIDvN
 9KAEYxJOW9CSjIT1ELOBQatDFiN9kCLRckWuoLy+XiNCynqnNI24ZU2UWegnlW+DCILkdMdJb4A
 sxrz5ErX8hN0SwoDG0lb8M3/8itM3ne6OK/h+wR6u0RCY5CjK6q+1xdHs5qi2AEMyKDj3HTWMkp
 v2zaxRQ6uDmi+URrPaqsS03T0o+01eRv5E6xZ8iC9d1jDvsyQb8MY/yxekwcdIxWkLqqrfBWRiV
 zI9h+QoJrda0PdEyThBCwVBQUSYZuT3vxgigSFzGstItQ05wt+/6IbsbS0/fcAakNSQmzR6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180187
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

On Fri, Jul 18, 2025 at 03:15:51PM -0700, Jessica Zhang wrote:
> Currently, runtime resume will always return success even if the core
> clock enable fails.
> 
> Propagate any core clock enable errors during the resume to avoid any
> crashes later.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..77d5e89239d2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -463,17 +463,24 @@ static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
>  	}
>  }
>  
> -static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
> +static int msm_dp_display_host_init(struct msm_dp_display_private *dp)
>  {
> +	int rc;
> +
>  	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
>  		dp->msm_dp_display.connector_type, dp->core_initialized,
>  		dp->phy_initialized);
>  
> -	msm_dp_ctrl_core_clk_enable(dp->ctrl);
> +	rc = msm_dp_ctrl_core_clk_enable(dp->ctrl);
> +	if (rc)
> +		return rc;
> +
>  	msm_dp_ctrl_reset(dp->ctrl);
>  	msm_dp_ctrl_enable_irq(dp->ctrl);
>  	msm_dp_aux_init(dp->aux);
>  	dp->core_initialized = true;
> +
> +	return 0;
>  }
>  
>  static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
> @@ -1453,6 +1460,7 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
>  static int msm_dp_pm_runtime_resume(struct device *dev)
>  {
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> +	int rc;
>  
>  	/*
>  	 * for eDP, host cotroller, HPD block and PHY are enabled here
> @@ -1462,14 +1470,14 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
>  	 * HPD block is enabled at msm_dp_bridge_hpd_enable()
>  	 * PHY will be enabled at plugin handler later
>  	 */
> -	msm_dp_display_host_init(dp);
> +	rc = msm_dp_display_host_init(dp);


if (rc)
	return rc;


>  	if (dp->msm_dp_display.is_edp) {
>  		msm_dp_aux_hpd_enable(dp->aux);
>  		msm_dp_display_host_phy_init(dp);
>  	}
>  
>  	enable_irq(dp->irq);
> -	return 0;
> +	return rc;

Keep 'return 0' here.

>  }
>  
>  static const struct dev_pm_ops msm_dp_pm_ops = {
> 
> ---
> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> change-id: 20250703-dp-clk-error-7c1965066541
> 
> Best regards,
> --  
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
