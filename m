Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F6CD33F1
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 17:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C21710E308;
	Sat, 20 Dec 2025 16:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxIM7VWZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiiayG4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBE110E304
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:50:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBPAvx4095092
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uFf82mLJBjZjNx5KkB24U4aM
 KDWvcWa6QMSouhjlBAg=; b=WxIM7VWZk+e+IZM5ePFc6mJxWoikxG70AXWQemKl
 Sqw7hQ8IuJYKb8g1C1IjAvK5eDTHljyi5M76Bn9Igg0xyJXNufPtLppXcfGdILPJ
 bAFsuNG62sm6atSuYY2GJWpWUmrWulVLFwumcXAKFGbI4Pw9IthsmbQwIZxsI/o7
 Z6gdLVx2TYEYCxiVVVmydGh4FWQPL9o8ZNQ2JpUMtGxYuY7NfuuQIoKaAl4OKFno
 OWYFQb2E7e83r8Ir/HPdF6a0ZPX9I6Q3sG87G8fARSAS3D2ungknArm5cjtmVIPJ
 JvOToRr5FTyMN42IPl8Eoy6PCv05q3lJgqd17wDOBajzVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux0y2h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:50:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a3a4af701so65649776d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766249450; x=1766854250;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
 b=HiiayG4iYxlYRtrbw87Rx1tSarhOyORCX/Llmpqr39y6DmivHbog8dBuOKD34imZRW
 0WZ5eGRnz2mEOLOwrWLf+gTWAbR7p2Aq2wm31BbJA/9tkaSERp/2wrjYhHQhffWhu1fE
 kKot4aQTXr5wIKq6bu3vmoIJVHIB+d4g0OrEG7C75O8BtGO7pvxBDhO8QdzVVi5+jIsQ
 M+LuUmZrfQAhcqZ2K496tY6xQuAPqP/C6TAvftFp3qCMJ/e9J3QtLExaCf1ooX1QNgqH
 IPKx3nHv6ajD8wW/97R+rIcJMmx3vxF06/nLwV+J64hzEtAUD266qW8w/lbaPQIl6CVE
 OguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766249450; x=1766854250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
 b=NCspKcMDrTXE77FKiA8iKzIhX3OF2UZv2QFZcvclyniGmjK4f6/jUbf/Q6k1PVlLs/
 AI85buel9nZcMrobBxZIvYZjoG2aziZM0wIkj1KfGs2Rqzw9JTvblQtntCfcVZJZBDml
 F2DG+3HZU/8VBHRmYSRuibGvzlIzE/JgykNGblpX+0qBDd6kgVvTZ7Q5CNS8UDNxTECW
 jMVNvzxXbK7Xns8FZbKE8QdjTn0N0q5xnlpl1lGXNjyDks6f7DFtAkeUfs0x06h6yzkd
 igMST0srsyB0PHamt/LKSM1CxDcRIfXxLVA73G/aMawPMqqEC2UvIYc7Uwr2oR8cPIAx
 v/PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBHijHKS16XThh8vvGECTP1RJ3PE+kd9Eru+Gi9LzfSmDAHI+kJP6nnt15g0sHFmdSq5dKaVBLr/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxuauBAp0x5UVhjUaQbaRyyBaxKKmI8gqGGWlzDOCQ6kq4bNL7
 dUdUGaUn3fi6GhPpyEFDox2szS4il068kO8IP427HvFr22+bUF5qDosfzk+SCc3wbE7G4uXT5GJ
 f8BKnIV9jV9cjmtSnQ2ZHofCZ2NSMvOJWuaa0v2wRyh+yxwvlL7qKJi3rTr9uxwRvS6A0ASo=
X-Gm-Gg: AY/fxX5ErPvuR5rflQnQTweMRpaTdzw+b3tv1tvLIGiBirjErMCpa3iJ7QG/9iSWYm3
 3tN5cV75/fijs+yfyd8nKpuR2vZ5QcJnjRVUIV6YIuy4O+5avF6kLBRezb/BAA0insYCwGVAHuB
 ZbOEGFRIrEjLtbD+qspjyJumc7aycyFadl0s2FErZ/h8niP1CUob370N00rXv2gCnyM9SvBLVql
 o3CHoPFDIcYMsduzVAVmk15n3Ocu91FRzRE3Zk54AtaxiVMcL4l/tSEuomPyRshN59Cz7ar6dqp
 ZXohwxiqbpnc/HSNyD5xhjx7b4hBtREsaqJ4Q+Af3yjLkpuBduYBcbPLbDlu5BfmM8zwjWmft7x
 ZcEqYWqZX/gPJpk4l8nQzwrNkyXNMXcm/kpZyr4XP3c0RDIUJKhC+zlBqjI/SYNhhYVDtO+3FB/
 pis6xw/eLvXH8VCCE85y+XcU0=
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id
 6a1803df08f44-88d850fb9f2mr89852896d6.59.1766249450481; 
 Sat, 20 Dec 2025 08:50:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBxCqI+gr/WocZ4iNPcl5owbDZ5ubpYXfDj0Gm1KEKgQ7LzgELWHUHhzlxo4GL/MCnBb74OQ==
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id
 6a1803df08f44-88d850fb9f2mr89852676d6.59.1766249450044; 
 Sat, 20 Dec 2025 08:50:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251b2b0sm13654431fa.18.2025.12.20.08.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:50:49 -0800 (PST)
Date: Sat, 20 Dec 2025 18:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] drm/msm/dsi: add support for DSI-PHY on Milos
Message-ID: <kjqlk27r2wtoiuruycnw32sggmlaxax43l2dvpd3idnbq3i52e@pyltdthhzgsn>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
X-Proofpoint-ORIG-GUID: fgOcP4myyAfJROJB24Jo7fVNDDzXjz82
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6946d3eb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=pVFFj6NhozAmOX4LvaEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: fgOcP4myyAfJROJB24Jo7fVNDDzXjz82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfX0UAr9xa3eFFr
 B9fGa+U2e5lUN7YEYEL3lvboVAHuTuiq3uxAgd0FMaf02/GcJ/ld0KMTgNrlojQOzErRdeGbX9r
 BbTUpvsCm1ofW5OrLNOEKeSBUapzFVkIHfvgubyd+AB344bO1rrwVa/fI4uxdqjmh2Hd6mY0rDG
 3seJkX41iXrkxi5mTTKfG3c/0EjyU+vNh7l2yegNZNg5q+/FUhhDi21+o5YNhvME3CYBTUJpiTj
 W+0HMVfl2oD0IfiyhEscdlyS+LCFDBm7B4sStLQnmd8ugC1ISjvOTaBd/RmdIlxTiPFw2NQ92w+
 t5bK/QSiMd7n21kMuSbSs0og7o/rS4YKFODL2VSpWJYeb0tYyaZuThuc06/G8qr51MudAdc+3LO
 aCazWHCC2BZtqprqj5q2eshb4eJtMCxydu9NaisucwAWnB87HAhaincKNevZr/EYwpFepRWXJ76
 X89cVD6qe3QL9bf0B5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200146
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

On Fri, Dec 19, 2025 at 05:41:08PM +0100, Luca Weiss wrote:
> Add DSI PHY support for the Milos platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 24 ++++++++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> +	// FIXME not sure about these rate values

Seems to match downstream values.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae95000 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>  	.has_phy_lane = true,
>  	.regulator_data = dsi_phy_7nm_98400uA_regulators,
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry
