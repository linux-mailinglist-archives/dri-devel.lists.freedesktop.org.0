Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADBD3B794
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 20:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D854B10E4F7;
	Mon, 19 Jan 2026 19:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzcedsH4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOlMOsmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0F810E266
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 19:48:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JH0KUp228217
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 19:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UoFhoW+S6bRzQqRjrf/Ho4uE
 tTZOFMNO7yF2eHc5qMY=; b=TzcedsH4RByh2UWIaD4deTJKNCOQUcuvF+gpyNfT
 lUC1iRkoMW9w2sHb6586fmq9XUsk8X1Z8Z2RYLZ462mub8+OumHoSSAE4A0ETDNw
 w0hH1A3/Jqv/NwKPwWVzfsIq8eN2kqO6c0GIOgTP9uDEFkwTvGzzuP4Rf4LPWZKS
 HcP37N86fBOGwDys2r+E9T8Yhh86B8RR1Gk5YDr091TgSHsY4vIwpsyUAqcocdia
 OOXrCUa2JrF0jZcH5UVluqZa3VL1Nu97vwBHeo5YzvTjpElZYmQycbeUb2qsZ8qr
 Abro2IleLqJTxgZN5H2LKcap/tXklgAXS4QAMpm7Eht5pA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfra2qw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 19:48:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8823f4666abso119472076d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768852085; x=1769456885;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UoFhoW+S6bRzQqRjrf/Ho4uEtTZOFMNO7yF2eHc5qMY=;
 b=KOlMOsmhLcAzc8v+cSjMZidBc36oq49LvttXrphl2WQ58L3N2aPybcOsBJuYpVyZMo
 Ipy7QiOOAmgKc3xwsQQfPkzthZo35/FWi1ij+m9S1x2udE5oYd4m9SeHNbpHj2cKqx63
 2V/FDni+donARnL+/9tKl8u3cP/XyVyERoCthO0dScr01ysVxTscFUI8CWqixvVIo6Fy
 xlDKseAGKkRgQPy6Vqh3DQK4gx8/jE25wNPDvw5AwW3Jt9rdwpr5f04EZRm5P7aL339y
 CcL47ssXiIXwlZJxVYnb+u4L5XUcRFbT0qzkev+BVq5TX0US/QOA4ReKrmWImRFGkFa7
 i8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768852085; x=1769456885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UoFhoW+S6bRzQqRjrf/Ho4uEtTZOFMNO7yF2eHc5qMY=;
 b=ntQ4eLPfxNsIF8ZpZ7rQxW2PCIRWDLkFBPrY1/jgnpRF1nUZQDWiA5kfiv2Ux0L1W0
 +8ae7Z9uCfuEaCs4CZnGTNc/8l+muCufhmCks2srsj4wzj6CnQglRWErAtgcn1u82P/Y
 4q9Py1Cy1UWjpSMZxMgqrA+fllaS4I72oNYgb5FueabVWc2Cmr40eVmuNl48smUpbr+L
 ZNnxsdFe+2RTTxT7hcyrQ56eEu/1ztVonZgpmQdkxJPzxbXz3B/UR48tY/ucU832Z/X8
 dotEIFpcCn3XROjP+o3CTtWOMzmrJ77kHvHH/fj3/v9vM2y+f06ZrJdNsbU1vkSCeRAC
 HElg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQq1rT8NI6g4waxSccMZt1G4HPxypkzt+tKqQrXorYvErT91uIZKL+Qk1SmDBnztJET3n1LvwtmRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAUwlLhJ6d4HGSRvX6+hEZUCg887NgeZs08dzEL2nyR1aYGsRe
 VJqlCcjak9EkyEv0ECTemEwo1XVOhq3N3H21/rHmW2twFeH7gf93rBLlrYGPfdqXWtBhN0B2dmR
 ZxzddbjpHmegQScpw2dfxunqhLAs73nARbPwxvL14nFjNXmYqnTuT4MIzdXOhK0iCbIrzDjM=
X-Gm-Gg: AZuq6aLg6uBrAkv/ZjYsEaIuyADRiBCwG5AXRKEhH2Hp/vFtkIFxdtYMXekOkduisSl
 yg/d86pTTfOA6waW7AZ1CkhKkgWfR+3IEP2Rf9y/+qYwumbKxqYNtHm2THC5RlBAE44CNsTb4uH
 EHOVgCK7caWyYiqYtOmv9m93fOXcx5rOujnmGjFgaNKwV5pG8okrhZD1rCgE9Oreg8Uf9ED18Gc
 Nw7cucNJHqVWlhpsN+0WiPrqpWPoE+7g5VvOeNDIyxp6V3muDYib6RZS01eTduQ5qtenWU4AcjR
 UwievM4vexPrYdBxt6LLaJSSea15eTGUqvdXYNO/L4uPnGY5ZCaH5bnYExsOivuFrkyNFvuOrx6
 +uVrJAnMKInbzaYzB7FqUhm8Gc6gTQPxyHa+faPbXQ17xVplUHsJqcnggQlKLALPxivosq7LslA
 0wsKGSGhrTv/HZRi4/EdL0ElQ=
X-Received: by 2002:ad4:5fc9:0:b0:88a:22fb:38f5 with SMTP id
 6a1803df08f44-8942e0c2d7amr173066476d6.13.1768852085480; 
 Mon, 19 Jan 2026 11:48:05 -0800 (PST)
X-Received: by 2002:ad4:5fc9:0:b0:88a:22fb:38f5 with SMTP id
 6a1803df08f44-8942e0c2d7amr173066146d6.13.1768852084971; 
 Mon, 19 Jan 2026 11:48:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf33ed36sm3610918e87.18.2026.01.19.11.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 11:48:04 -0800 (PST)
Date: Mon, 19 Jan 2026 21:48:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 05/15] drm/dp_mst: Switch private_obj initialization
 to atomic_create_state
Message-ID: <wrdg23dwk7v3tucbuem6bvv2h2upq6wnzlua7u6pisjufino47@loyxehkyv57y>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
 <20260119-drm-private-obj-reset-v3-5-b931abe3a5e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-drm-private-obj-reset-v3-5-b931abe3a5e3@redhat.com>
X-Proofpoint-ORIG-GUID: H2C0JObnV7lFynC58ODRFeDmWnz_Hn6B
X-Proofpoint-GUID: H2C0JObnV7lFynC58ODRFeDmWnz_Hn6B
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e8a76 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cQhYlTyHonU9rmzgmbAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2NSBTYWx0ZWRfX7qgAuHCsVaul
 ZeWrvpWWZ2AvLAeyXR8S+pqKg2TUQhtHghgvGrjVRpqAcFfPihy1/9+fVGHrcaaCnf5V7NUu6RZ
 l1nXonyU4immqrrVg3FZYg4CfOI2TQsYGxc7cxKnWi4jarSPpoVwKGryELj1jku0oUNwuf063kv
 mRBb2nip3RDn62dMJDNvTZFoE4YowTN6tiXC2NpJ0wigaLLxktoK92pgDpgvqv5/2rhLjGBjH/n
 aLNuBsP8590R9Mthu2duwCp3uBHlnXQaqggWMKRVpIGA0U3N7CTFxvdmw8gvUkO0JeaGRF5eEwl
 WNbSI/31ttPwC5FLDY1/+BbsP2GPe5aH1Ew4pQi+ijuNTij/cUVFpPBD3KUWZ8X/EfpzoKZRYQv
 GTKImKZGJYWLm2KlrKyOzu04+6Iqqf+LXSTS3ErK69KI+7WzC9Utzje2W6vNyXQURi6CztahkgU
 GazhSVTcE0M6R5UNpnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190165
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

On Mon, Jan 19, 2026 at 01:50:01PM +0100, Maxime Ripard wrote:
> The DP MST implementation relies on a drm_private_obj, that is
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 37 +++++++++++++++++----------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
