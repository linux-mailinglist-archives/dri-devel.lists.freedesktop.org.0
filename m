Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEBCB20570
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4FD10E422;
	Mon, 11 Aug 2025 10:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNwlm7V6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6432010E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dFfa029260
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xUcHQjufN96j50i8isc5wxtk
 0rBCIWP/iFq3mpKJof0=; b=gNwlm7V69ms0r2+cku8n+dYK4oiEv8wxmw6sru2F
 Dk/5KoJBMvxCi9HJT6QDLQ3Nett6DKGwwY59zakWxEg40Ymp9nzDezXM+OJ5yt+Y
 1nY0GpVWZ/6hbiswN2N4c0/hhvjImsQDCzoH99Ig5NZ2flAhlrMleMnIcT7yPyB0
 0Chrjc6IHQhVTqXz0vSj5b+ERott85Z80cfK7wk9Vx+acOzAo3A4uwvQ5pMt86mn
 29iqKTey/mXBSylxXJI5iJcaqO1N2np4T746Z0sArngEa2PJfH+oesilWmOIwypI
 Ply3VV5RBqbNi+32nC14rD1yOKWuh2sTgeS8+cT0fPm0ug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbyff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b08898f776so106902281cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908409; x=1755513209;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xUcHQjufN96j50i8isc5wxtk0rBCIWP/iFq3mpKJof0=;
 b=faV4Vy7eA24q4pvZfUoxZThqtKJC1MqqWIQBpyJXAD7XGPsTfZsyXu3WDQi5+w9rzu
 cm1VrFnuxMGjptEjugLWH447SBzcHm2HNEXo7E9tYWtFHhAsfx/7QzVob21RYLD+USnX
 q2+opUmJikBbs+I6fCdbINFIF3obVrVFOnsouXwIb+c9CbodsPDj9u9ebX/uMbAodBEg
 /1KsTZeDF3PGcLHgI8MpxB3LdLQ62jDfOFmNPm71E+5EjevBnmpgyIHlGTfCnle8bj2b
 UYSVFEn9IlAgQLum6810lWflbo1wisEshBDoEvF40ev8dSL3ycTUdMVZs7gJ5WTAyfND
 7b9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2aL/IuGhbyU26DhlitI8LrSazzxpN3S7H9mX7vN6y8+3bLu/q2pRDz0UNMp/FB43UzCmOZRZUmqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlYHlU9mIiCT0LvH1Jx+mReZTWxaVzPwKbAng5GjOFLhT+iJzt
 74NAAdPzmv9+OTe4l88fuqqTQp2kE3yQN9EA5eF8V51ekOVnf8c5TZNHIRdNG0EiLWuaGkoCcBO
 xiTpB6GmpeYOHWy/0MmvMS+EdEbv8fkrmbjjFapWVs2DEKDpNzEp9lIs+ypA9JzEkyCgsMIc=
X-Gm-Gg: ASbGncuUJ3RVkRwOcBxUEpyF753RA6iwruLKF7Fs9vz4XqiEg7uysRhR5JEsRaiOAL3
 U9ejWpo/prFBrMxK6S6KdC597S61C46krPK3fw3VUZfUfhxoBlyKDUpkIWKlvKfNBYE8jwf3OxE
 u/QuDZa3IPCzk9JEPbb0s5NxTtHnG7aJAjNVCup6dE4bJnraxvV7+B4YLW7dU1bpD1qEWiJ7bvG
 0sZgIhFlt2TgRfAkgXosP3jDX1aVMr9weItp/C9bQghfsrH2iE2D5+NRHw2+Kg/iW6+trQ/Xh7z
 psQeFJEGWY7+8XHtFpf5XQJXZ+Ec6FBN2QDCAqOXT7ZXabJBRsXV/qjbXzqDdIlxSRDiraW/08g
 HqMD7oYemDpocKtvltK4sfVnIpvEtBw81ZlC06eV7+LL8XdczuyVx
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id
 d75a77b69052e-4b0aed802cemr172661101cf.58.1754908409496; 
 Mon, 11 Aug 2025 03:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5+d1EPtwxEZN7NaQibr0TadKLirlbN/cpnuNlgXjLHPDePtrYQxufGwDmRoZ5/mmER8t8g==
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id
 d75a77b69052e-4b0aed802cemr172660611cf.58.1754908408908; 
 Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bddasm4246799e87.39.2025.08.11.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:33:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
Message-ID: <m4a5sw7ghzepzjh5rzxltyktmgqocaacbkulpbwsl2alqbqjhs@st5qillinrnb>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX8DD68RvVOWcD
 v7v7WiCw03fyCV1VPwsKAWl8rs5CIy4JiT/rfzH6UpkrVmUdJI47W0JivPqSqcUU0KArMguSVEw
 NwrZjYQyHwaS7ByjhgruEcS7ELqxW4/axHkc2kMZWtAcmGM3T+HXv029jPJEwrwPbOoXZrvYQmR
 VIODH+YsID8P7L/Ge3XCNSsi+e2Ddy8cdT6jRSXkr+B6fTcHvSb/rVt2FzDFQ7swIANAr3AGJLa
 t7N7rEebO2Jcq6zjPnu8CmjEKzBAJHa4xICrv9sFFEVmwyQ1DxP2SE0rMk78q0cFe7wfD6HvS59
 CZSTPMS8yWMlsaNv6PNvOeFE44ICvyao7EPVWljhqn6k6EMIfeEqpEHTv/Y5Mg1iKTQ2KFllWJ6
 1Li4VBTH
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c6fa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kPkK3c6Rg0FkzYjxZfYEqoFskwUzyka8
X-Proofpoint-ORIG-GUID: kPkK3c6Rg0FkzYjxZfYEqoFskwUzyka8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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

On Sun, Aug 10, 2025 at 06:57:27PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 ++++++++++++-------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
