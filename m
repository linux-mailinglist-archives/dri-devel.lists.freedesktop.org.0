Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD8B20556
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530310E427;
	Mon, 11 Aug 2025 10:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbTh0PHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B2110E422
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:30:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBgr025530
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UnmCHPZVrs6fp3g1DtME56zq
 8DIGelnQr7GBLyjo+J0=; b=AbTh0PHLe6Hqp2GF83C7oLkqY+xVq55GoHfPraLC
 j0nzYRel48zZlDChdvMVVHR2hzfMm+batlJn5gCFSWgYWDzChUfisDZKLkY6vCaA
 JjuWic6QnXKJ2g6RoAUnFptBuh9sW+s4YIHwLdhdhKZN8+x4Fx1oEX0iQpqRxnaU
 ZBzhCI8dFXCgdv8znKcS7AHTCLpzrzZuqCGHLiysVQPP+aGJ60O2pddpOo9r7rfI
 EkuHER38D9Rhz1aPFplGkdo3WP8+Ay5N3BFaqpoaf3gZFIJ+onRvoPIYC41ZCdlc
 EKPyYG1AAkYdweKK4EPOIoLPEzwXXElv2SnANmtSc/gu0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb741yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:30:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0ca325530so9537741cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908249; x=1755513049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnmCHPZVrs6fp3g1DtME56zq8DIGelnQr7GBLyjo+J0=;
 b=ofAxh2TDotXX+prt+JNSxkBqR+ZOgLQiyjReaNAGFt9v13M41RJW5YrqNmYf7Pfj+5
 L+uTYIoKeXRQf2Pf3HXbJe/4Zgx0eqU3L2VPYC6Cn7C+jpW8ASdNcm3bg1pcHLDPvOep
 BRzsrDGOAOtt28BqYxa/Z83AfZr3rrpUb6OndKzkD/bxwlKUWMOq4IrHEycJ3lkSYe0o
 pWzDyqhSewD/TDMEKCWkHtKGcNg2Vtb0tndJnTL39P/KWL3y9dlFSq0Zo5htJBvZlMP9
 7CVTcCD0yEFhxyf4oRBgEFTyfV7fzibDGbhi6XfhLLsEK2AYx0C8CQQbkeDOnFDk5EOS
 /8LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYST+CpfZFInERHXxUKtayAgDAM1dNjNzLsZSHxzjl8E5EJGgQf81bTjJvqSDGfUcqWJN/U5DUn4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkss1JbE9T2JaxNgLEfaPx1Hc5Ah/ffn1zGi3M7ATL+kkWWady
 RzBujudDsPkytyVdw82FgrTL9yZZLbkKwY85lUuL6wa9bTkh3GCDwv+s99pj3KHIMl6+65VS34w
 NwlDNey9EnyfbY+reC5WXp08vGucb1+WkmS8MR68pRh1gKlJ5klVU9fjyfrA5moYBDdDuEdI=
X-Gm-Gg: ASbGnct7aQul6LIvpCvRCcajfxCgz6+lIkH4idRpySnDD3XpU6O/pKrcEt1XRxlGwOi
 pHDUKXBlwCrvsv8lUjWJY9c74GUPsQztdiFyahHKNAvLZAM4TFAkMQu0zMtHMDJI1u3as0AqE5W
 cOhXMxYe/ug+H82iTbJ58lGkvr+ynJcF8kgDe4qZfipW4lzasUBzL7MReAIITwOdPaxbuRayb0k
 9jXZROn+g203gaw33v4FudegCysuP5oDGptb7J1x+st58DrnZyxskTp2V9+g1vu0gaY/7uJolZQ
 1JVbGpCO1e+jf4sIvJi40LSXV4Tm0eqtPKrNvv45LjNKlcyJKU0vW9yk8O3vaCMnM0oSlXafmsj
 Mvb6TufqehommqGMXaIhV0YF7rvf2JJoCjyve6EOdb9gGn+ydW+ws
X-Received: by 2002:ac8:5806:0:b0:4ae:8835:3ae1 with SMTP id
 d75a77b69052e-4b0aed41babmr187407921cf.19.1754908248520; 
 Mon, 11 Aug 2025 03:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuf5qtoUnT+tc8B2ICrvl8IAPGTKvOtw3BZsZTanNw0atI/DIbb3U6d2sGEsqxH83orNUAhw==
X-Received: by 2002:ac8:5806:0:b0:4ae:8835:3ae1 with SMTP id
 d75a77b69052e-4b0aed41babmr187407401cf.19.1754908247969; 
 Mon, 11 Aug 2025 03:30:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55ccccf88dcsm938218e87.55.2025.08.11.03.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:30:38 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:30:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate()
 to determine_rate()
Message-ID: <conbpmqs2cdgyu2oub57j6oq562yzlfvdkidfbetgsobndya43@wj75ikipfz6x>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6899c659 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=dIVbyNGrPfH0ZhoiaTEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yQc_8M7-46hhF3H6ieWCajNI1bl3SC8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX0ZJnNZbgsJiH
 bObv7zUskgKgS+b9i0SCKcMTaHy3U2qwxmm8LQBix2Yq+LOrKMkst9Un1WX6qeOaOnUORioUjgU
 9apqCgx05DJgNyZMEQnJmKru6OsPi+0LOQV41ISdwhQ6UWdKrGCbAsSuwu4pARzrdPIyaGgOqD6
 cWa88oJN769ndcl3uTYr8ssvphQ0PWjnTvtHztmsT1OuA2j+rktNGh5V3H5lG27qL9NBkRKSlQc
 papOdtWNj6/v3LSjKJ6CPk6zICmz+6AYSYpY9h+fo+xKQnTlu9twunQ6pqRdpLNhy8ntAF8Xy0L
 q9gCO0gm5TsF8FTEpaOQRkDTymuD2OhtAQ/PjqM9JCma7ezZR7yCJ9o1jyF+F8JIJtGnoUukTQI
 7r5Xf9Ma
X-Proofpoint-ORIG-GUID: yQc_8M7-46hhF3H6ieWCajNI1bl3SC8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013
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

On Sun, Aug 10, 2025 at 06:57:25PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index af2e30f3f842a0157f161172bfe42059cabe6a8a..ec486ff02c9b5156cdf0902d05464cf57dc9605b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -444,21 +444,19 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)vco_rate;
>  }
>  
> -static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
> -		unsigned long rate, unsigned long *parent_rate)
> +static int dsi_pll_10nm_clk_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
>  
> -	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
> -		return  pll_10nm->phy->cfg->min_pll_rate;
> -	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
> -		return  pll_10nm->phy->cfg->max_pll_rate;
> -	else
> -		return rate;
> +	req->rate = clamp_t(unsigned long, req->rate,
> +			    pll_10nm->phy->cfg->min_pll_rate, pll_10nm->phy->cfg->max_pll_rate);

Nit: I'd prefer if there was an EOL after min_pll_rate, but no need to
resend it just for the sake of it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +
> +	return 0;
>  }
>  
>  static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
> -	.round_rate = dsi_pll_10nm_clk_round_rate,
> +	.determine_rate = dsi_pll_10nm_clk_determine_rate,
>  	.set_rate = dsi_pll_10nm_vco_set_rate,
>  	.recalc_rate = dsi_pll_10nm_vco_recalc_rate,
>  	.prepare = dsi_pll_10nm_vco_prepare,
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
