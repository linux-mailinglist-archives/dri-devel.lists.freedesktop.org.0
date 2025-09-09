Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA2B50083
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820EA10E75B;
	Tue,  9 Sep 2025 15:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctUGAk9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E978110E75B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:01:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LZB9003672
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 15:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u0lgli35YLNS03kPoYJ/ICz4
 vDSP8Kg9w05gBdHJbis=; b=ctUGAk9myr8+w6NoQvAu1jAZqPtUDtOgbSNbw8OB
 I4dHfBkmcwVK+bDv1pP1X1CsFfxO8vtbMbpt+ys57Qszvovc7EBAln/R+q+X+WeY
 ljkKidtjP4Zb5RZOk9g7iPWfXV1gVNZiMpfEfp4jLs9LoXrSAenS4K5G+ZPBdEA0
 YHRCCcljtfjf47vuyu5+AXTBfrnJUqi3Ub3me39B596udqxP9ZRCvi/HzZmj11To
 nPOW1LwPwcrpYVlYPUI2OA/j0w8C5tSuSF8hRm35ROoRZWZwJEHdtzwrt/gNHJP0
 9nrg2R8k46dQDfAwXvmSEtb3Lt8/z+BkBP2XPpg3dWZJSw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapgw9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 15:01:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-89021b256a1so7932227241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 08:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430083; x=1758034883;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0lgli35YLNS03kPoYJ/ICz4vDSP8Kg9w05gBdHJbis=;
 b=bZUF0Rj+fsatCBqbbx6niYBEimOBOYqdao+wc+tIq5QSAtEgY3ZRuj9Z31Jr47T0KP
 g5v2i97t3Hkm60KRbv/E6NmY4yI2nCXTJtYPtOVYHdPrLu52FMRbCyBECQnVjj92BbNh
 6bcazx0kdAL1xaE0PWYG13nkhRhqisOWrOWIs566m4soG1yP2pjCGqUqat8ijFLGTkbN
 KGF3Bx2R8uZDPxadxfXpECE+0mDch8yU2WZI9mmiVVrkpxbvkqT/GT9ipaBAW7NTnRKF
 IzIvgTyL9p09NmOI4GP4rzDTYtd2Ewg3/ctRzg0Paf98DTqp8p+Z0Lo0xDry6pmmZTQy
 7XfQ==
X-Gm-Message-State: AOJu0Yy98Z+erZWgflLk0gvylE7gC1lRhLAlmB2E0HzzYnzSLHQ2VonM
 N9dwozcAB1IwssbcBxLagXadfRtztoPV0MbKEaOKw40et4qVhhl/zsdxxYN0G7MqO6nmb2pLP5c
 3HOyoRw+5b7MOXJTF910xfpoC1evI3Us9lTTmS6oxdXmKMmYT+XAp28x831oa3wMMSE0NZvg=
X-Gm-Gg: ASbGnctzc7n6V39OVTWbxR48euHN3nLpC6RcI7LkLDnOMxtMHGUahdDLcQRgJYMT350
 9JYAlENFjN26t43KJcuU5/tupXwwT0rju9R41BBXt6VviAmWfwJKzzFmwnQCkrbgeg4VxB8AS4v
 juRdnlKl6eTNOu3yas2et+BB523/LaVKxLqQX5xv+sJDRdlJDQZCzqIQDYTBHujPTfeejR1p16o
 ZPUTYhpl/ber+bbAnBG/9cPHMQUj0qnL88KGWrCg9lpx37yP5T4+JHFHU5Zss1p5u80Pnt+ZUhH
 yAsZDoaNEm/G4U2G9wvip374djCkj/IpNYHq6OwKYgnMvomzDPZEebLZ1sibYv3UrXvXagqukNw
 nTOITjap21wYwEvHnx3HIMfZ6Pxzeoa74mqDv5LQIu3BUMXpOwR/g
X-Received: by 2002:a05:6102:5f04:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-53d1aeacabbmr3520995137.5.1757430079257; 
 Tue, 09 Sep 2025 08:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXQrC/3gfSjePsXH8DNK69GxDOTHZaV8vPPCw8jrU6FISo45tmgpgz+khuABN3mbrRzq6IZw==
X-Received: by 2002:a05:6102:5f04:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-53d1aeacabbmr3520861137.5.1757430078265; 
 Tue, 09 Sep 2025 08:01:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795d5cbsm561765e87.74.2025.09.09.08.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:01:16 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE
 an array
Message-ID: <onhosploceq2ksu7vxjh5e6phg7h6lasjdloxkirgps3tbkaqe@7vfqdbojjnts>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c04143 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sIHAvruKwB1gmBPwbjEA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ZZpRrXP_BYrQw-ZtP57aXbhR7_cG98tV
X-Proofpoint-ORIG-GUID: ZZpRrXP_BYrQw-ZtP57aXbhR7_cG98tV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXz3618CR+cvcc
 zUDjIsX5Oe18rPWSxmivFWMG8q0JpHY9PtB0Jqu4PNK5r41SUbJGHuFLZkp6imdLQDv5gs7MuCv
 2roN3FKKeMFjprbiAslU8am59+nGrTew3m9z8BQ2HsXtvCIEuQVXml2mf6lEEj615QH0lT6s9VQ
 H0g+0u7e5Re7H3FNAvjoZK7fkoZyf3DF+KNc4Zbi4GjXYY4AaIOHXfbJp9pivG5g9Oj2117ftyJ
 h9gFI2gXJUdkVvzUKtTltf8SAnB+XzsNvLhd//V7jaabfHV/RAmM1bOgx18jgg0B5daYyNLSJVt
 YzeN60JsKgvm4X/hvmSh/Hzt7TsyFhgMvbdDv1RPe8IeFItuykLMziyFmr8oO1y+gAGOTJtINfn
 zGVj23fX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Mon, Sep 08, 2025 at 12:30:06PM -0700, Rob Clark wrote:
> Synced from mesa commit 77c42c1a5752 ("freedreno/registers: Make
> TPL1_BICUBIC_WEIGHTS_TABLE an array").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 10 +++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 10 +++++-----
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 18 +++++++-----------
>  3 files changed, 17 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
