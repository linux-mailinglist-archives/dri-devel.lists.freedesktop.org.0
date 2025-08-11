Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54CB2055B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7C10E42B;
	Mon, 11 Aug 2025 10:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxd7ThhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D8F10E430
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:31:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9qm013055
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/ucSKnN0VabkHBeCyUPOOAp0
 1IU9Td+bmPEMlaDwwOU=; b=nxd7ThhG8UiO8u4+aSNd9NxDhUvou3BAn+kuDkqC
 0g12KNcGvPLBzZnLa922+aQAbCjy1re5GA0N2LweBkFOLRA+D8uL/VfU3tYcp05c
 MVYswdGvFgzsWqtoWc90iiEXIOHc2EOv7V2sEd0ekyqZQiohlxdbKUAdzWgib9SS
 dT96BvYp3AopY15+Xc64JZgnvcudlWTfSJzFvPSDrLbMD06Zp6y9IqlbdiBaRdxB
 xvpbFvtoFJuFPhFmy22IsFXejAVmNxgtkLd5hw6Ilu4ccGPcecZAlprtTxcdwVPS
 Yvs61NKR1WVjdbsB8Wm0jz+TrDKP9OGP1NN7OyfQjOeJHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm577-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:31:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4af18aa7af8so116016281cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908271; x=1755513071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ucSKnN0VabkHBeCyUPOOAp01IU9Td+bmPEMlaDwwOU=;
 b=AXyfPYMjryQIxKymaNseEmZfpYze1HLTgY4aibCSWnV46AXIZnJq+fwJBUaozfwCtq
 gwbsiIECLc2FdULByEDbRVSzPb5vlLSGFAHtoIXx0Gowoj5mhFjLQ1MSWZRTrngD6rxR
 RC0XBpUlWbqIdMRV50yUrbImq1W5zdrZ8xJbkauwSU/QQb3l2N+PpDfzn1C9FBxfrOwO
 XvadhBfMLnhz4XjS2crh8aWg6h1sn+jR8VDEcGq8mMsIfGBBYr4pcFaSX/CZlUUSaNiQ
 ITR6jgjb2Jv9D6/I3LCf2prRRPfduCMwHcZYn4KbB9GHwKtVPZ604AujopflDQ2+N7Ch
 Q/6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2k7shCf54y8f0H6+qoXSkVWFt7R7sbcNkaS/B8lKky2wcAfaCc5WvkvS7UobzPc7d1GdU02/+Q6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym93dEV12Ui+FK19BI8FVaFLcfyMJBJHtBjTazamvyIH9ANvUK
 66ms+2e/umsvlU0NrlKt5rpw1EjE2icNbRxUel0mddPsKk5DiFsUkCNfZsnNbxhZPADSvliTd6z
 DpLAik5ddDtTF100JhvFfUmA/VYIDmlwwkZyJ7b6qldbQdePEqqsaYL+CKDOowdNV4++mk9E=
X-Gm-Gg: ASbGncvbckReViR4wBXIVwPb2uz8CkGJkUzDeG+RuK0ITG321YZIEyz3QljX/1emaMQ
 it4DmYO5fjpmoyJ2tiXuEWpUVrePygpxMuQRAtkSDrGo3b/VS04dOPzBrpoIUVubM7XUhXA72D2
 hFnl+YprtTIvu1sUFBc2HvhirZIgqCbE4vv/DIgqC55u69flc4b+Uhl6A/+SaLag/mOQgwJZPRg
 PBoYnwhlmv/ei+/YRqqLnBjrxzSzausTdCuSw7poSkH+1ksR1DAa+S7B9mXT32Bns1SOTNI+8B+
 yzXzXFtxeuJ8gkdjetDPtqx10P4HC5LLzR3VSTxhFNxmPt4fZBQnZW21swJAeryup0eaCivVbjd
 hio6k2u5wQhupVlpBHJKX9W6On4QPTidk0GnThWkvFw5laKM3XxI/
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id
 d75a77b69052e-4b0aec7e670mr172487651cf.18.1754908271513; 
 Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcBbTdZISUt9SKxmEFAT76YcvHLLyKJL2uxyoSRdkuIyPT1U4jZXtxIgMb19xtPh+M9uOHug==
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id
 d75a77b69052e-4b0aec7e670mr172487341cf.18.1754908271099; 
 Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88caf0ebsm4214962e87.154.2025.08.11.03.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:31:10 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:31:08 +0300
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
Subject: Re: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate()
 to determine_rate()
Message-ID: <23yejfrhz3qmi67r63ni7zawmpsawrb3jzn37r4h75s2ax5gki@6ngyqpqlqdez>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c670 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -zJ8UEFIqfEzk3ynqGNe0EYAOu6E_Apr
X-Proofpoint-ORIG-GUID: -zJ8UEFIqfEzk3ynqGNe0EYAOu6E_Apr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX7jTWjhj7ew+r
 Vy+o9oKpexHgtlMXZpAomrl7cGn6cwVAbYiJAsx5D2vAN7TXspOsIhDZfCbR8dcuTqBZA7UQO7N
 FcW4R0CBpM+7JoXp6yYYcLFUXUmWaTBjTZGCEkAN8/S2ZKU71XOwFQ+N/ATQt54vGz00PIiYhfa
 HIebgvQbDUWwSQ+j8swgEWhem025eo7LAVSe2/2ARqJpzWIGLjS8uNVsgKcovo+gSFjrInLBE+q
 InpMAYunj2Wjzc6yavYo4GD7RN3PEdZCXcNuemTEzslwJ7hUfmILG4bEtUcXMnLVkMA8FOEr+QA
 WyC2wSsDJzpPz7THfcLQTvz0iUqR6IneSynOv3JVLq+XQSuQBX/WZVfV9QBXnuEtVP8jJWoslpE
 /RWS6fgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

On Sun, Aug 10, 2025 at 06:57:26PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
