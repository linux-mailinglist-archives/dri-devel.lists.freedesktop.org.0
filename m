Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F284EAF9A38
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 19:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D8110EA59;
	Fri,  4 Jul 2025 17:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkktpzdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E448510E36B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 17:58:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B6M2k020361
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 17:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U1F4fPAEqvP62EdjTi0IWSox
 l7RsMJ0HC0KZyKC5XOg=; b=SkktpzdW58ERgizP6ibeQh2xFgVNN+gVoR/z5zbG
 T0iP1N9Sr9Dzdt92V6BKDI1TqwXXBpoKGLIxgnresQrzyyxqIyxnXonCuGIx9Jec
 UPn0UZ8Qgf3vlhSUkvaVjYwt5spK2HsRW9+oru0KHgektVXbxHEFro9yJMAL0KRQ
 ixh8lWzuywlB/TVb/pBihvB2WEbtH680U278abcnUb8Y2QUjrmFE812Rhj1WoiQT
 JQHaxiCdtQfRo505QBjaH/1zh53bciDM0C42CYSX2G+BPDl/wrVnhi8dkxvyuqgR
 ory9yToRZ7YbVJMs/LV+HAY/I70YQcrzuNSYode+mnIoyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8xmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 17:58:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d15c975968so188890485a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 10:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751651891; x=1752256691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1F4fPAEqvP62EdjTi0IWSoxl7RsMJ0HC0KZyKC5XOg=;
 b=dXyXMA40UYNjflWnRk52Tv/CKPLKI4MbznCTMChO+KJn0JRuqnyevTUaMU8+xx+Z4F
 Cj2NDtaufQ5zVV/+oVwVxw6UnCaS73In0+UYos46QaTftrtEiczvzJ++GvbARICMEeX4
 XHZLn6W4prkbrVayAhrNSYMvroDcLAJUlDX8I1Ufqv9ZM8MSF5f/CeS/8DLkQVkww/e7
 M7Qz7JodT6R93B4FAmIjc9+YYRxGchpmLo9PFi5wzRap5spxRNOCTgEKHYQiPKS01xOl
 kkTGVPNUEg9dSdcSRP7I6IBuNToMdICjkvLYpBDVQIkgRXgvN2m+tl6evF+9Ou2Qtjyo
 WBJQ==
X-Gm-Message-State: AOJu0YyUjKw9FhfQR1/0HFyCzf/Uy/mB1HlaDQOq6dTjeo0R6euHaRDg
 cUreBaiZRb3cdxpYm+my456Rl8v/zC1FAZgrl52HfoJQyPvzbDtlJCiHsCa9drefkaOdufUI0cc
 SdEOv8DIPeWMRt74P17dvCxl6RMBG+h1KIu9OUjPdThZs2smFstDetDyUhZ67/OfKSrnmm3o=
X-Gm-Gg: ASbGncvKNkLRbMl7NKRlHpveFDJ2r65FmDgoEsj3tUjBQV2EMcBORHFL7b1+JR5Xs3d
 zPAATONW7wBfr3MzMrd9AF/SHNui5GoshhoqSqvJL4bTDb27EHcHmkmB+E4HcDBdG560n8svQCc
 TF7a89EBl9PgqD8UReqhZQwKeLblbY/EYN4JHtAG5zJ1fr9UWw+jdPlOp+757T7NqeXTlrbzDj3
 tmsq+OTu1AHbOmfuQ99ANoQfcLOv7oDVP8e1uRvXSQZFpcsGYnZoj2zVLu2WlMiuWVbdFzZZZHX
 stOnH9xNGTm4OhDXvztygtVOKXMfoPkLzp4rYH1WF0FX34Fn/XQLB3nuwcW3QxdZtkUiDlUgbax
 3iWwvWV7PNBtQrmYdTWQ08eiymNutv0ky/I4=
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id
 af79cd13be357-7d5df152bdfmr319544785a.35.1751651890951; 
 Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxi3EOJEoPm5oFMT0+ivzet/BlEeCSvPIneOHAOarymVXusFmqrpwwE6fb7KX41R6g3zjQQ==
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id
 af79cd13be357-7d5df152bdfmr319541785a.35.1751651890486; 
 Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d8d6csm318439e87.79.2025.07.04.10.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 10:58:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:58:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Uprev igt
Message-ID: <wzivs2n2inkvtyy5wvyur5bpi6iexxmrsc2fyzm2vwm4o4opzu@lt7tm4q4g2iq>
References: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzNiBTYWx0ZWRfX57dFxw6oR07S
 61m9vz2y7/ONk163VFzTGmuedKjns018RvI4nm9fE99jYg3cKspO9eWgyq/m2AhCbcoCxHZFO2Z
 AelRqefr6EovfnqijGCbSOfQj7lIt0DAY7tMa8xtjXkZDW4LCTxdF6O2RpkZg0oVK9jQ5Dxzrft
 LGd1uRqQaTn1HD6oSOeTRyTvkRE6oV5uN3isR/NP62wNjPTqIds5LQeeis/VnmThQKUVn2jdmp0
 cob+Wrry5HgbbV3nfImSh+dkMo8Qv71ftvZwGIFZccOoHD2WT/sTr0HzGAv0NPqh7BiNPMVswt2
 av45SXP0Onc/owUzfS6wN+dQmOYVwtr4949r9xMcB5dz5gs8kw0xSSDBKSwf21fmpVx1kGnXVd1
 9RKZOoqFYMLvOrtMtQATXi/1cpLV8mwomCzTmKemqRTJ57NLdLJdljLKh3sKJy2WyYh874Fe
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=68681633 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=M1e0B-rp6HQtO0eZjbwA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: CuShc2u_mUdmbeEWXv_umixsWiyvazkd
X-Proofpoint-GUID: CuShc2u_mUdmbeEWXv_umixsWiyvazkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=974 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040136
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

On Fri, Jul 04, 2025 at 10:44:32AM -0700, Rob Clark wrote:
> Pull in igt updates that are a dependency for VM_BIND, and will reduce
> msm_mapping flakes.
> 
> Skip msm_mapping@memptrs on sc7180 (the test should be checking for
> preemption support, and skipping if it is not supported).
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/77
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml                             | 2 +-
>  .../drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 5 +++++
>  .../ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 5 +++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
