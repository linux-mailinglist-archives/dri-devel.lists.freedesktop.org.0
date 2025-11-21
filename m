Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C256C78FE5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7F810E239;
	Fri, 21 Nov 2025 12:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mT508ZRs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXOFjQ62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8527810E142
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:17:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALBad6u2841299
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QaNnVLYnlnRhWIm4jNcLz6mZ
 ygcebyyLlqzwUaRtrnI=; b=mT508ZRsNRTqr8DnFSkjCZTkAd4GvUBjLQDw99zg
 Tjsl919tISAJp86joL1PZInJ6CpdjjXMNTmeRjMC3rETaklabmdoLekmgOiMP750
 SzQYbWukdIQ2Ow2mlpnuXZwTxS7IqgzgUAwzV9i275tS7T1FJ1/kkEt/DPeRyLCK
 jXbkZGSnyHo2KlZL4faVNA13LX8EmH6ADe9wF9mZ/2Chud4Cbw/OlLcN3UnBA1Dd
 b7mKe9ajPbvRh+vZgpPueE7FcyJd+8QtjamxyDt0kc+8hb/LCgBbmGOPHEz8YYRU
 OnIVAkpHyFS7v7/VluOvAdCeD8K1S3BSGC8g1ROmaukgOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvhcyw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:16:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b24383b680so761300985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763727418; x=1764332218;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QaNnVLYnlnRhWIm4jNcLz6mZygcebyyLlqzwUaRtrnI=;
 b=SXOFjQ62eDe5mk8nC+0UbnyvX77WCBUx2qLOOXWv3J5mlDYGaO5tqZoJfRkNieD13Y
 GXxc2PZNz5shHYmJIpLYBTc2QxLCrtBNK1WXY/Pz1mtiHmsv874ogxUzh6kp5m9u0zzC
 GRwmqRIG5NSAt2oVIkH8I46ZFKyQDqlrO6ZcofP1H3J5lgNyXrYSnOTvigR9OcSwhaAv
 w/mbEGuxM6pOA76gfge0hxvsgWss9/G6qe52GksRSh0XN1rEiWyOFMVKGzFYTv4i6IoW
 TQBAvCdEwA17VXYumsbOGPgzARwWfscCHXzVjr+fFQMPZb61T+0NpAsL/mmAw19Y5EMg
 87Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763727418; x=1764332218;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QaNnVLYnlnRhWIm4jNcLz6mZygcebyyLlqzwUaRtrnI=;
 b=PpVviHg0zUu8OfBFxbZ7HdVt86FOO6UW5lqGY4F76eQt5IJTkm4J7oenDAVWlPpCk6
 QM1W4FMZTm2jRuAb3dXT+rA0KEz2qInpv70qfdaTaJiK2TZ0AXJ0NexoY1Vy9OAbmHGT
 4aFsgJovggccnm/2Lwtqjluk+dbpaPWbiXdUfjT/HSiFL9AXN1VOhvZdnhZVvJU1riHH
 EVcEjZY83db2e2wmLnPlm/bkw18azScKDkI1mB47LVHdckG9RG5x9hFR+IvXaHKLDJti
 JtZNbQG4bDdQYr6eJE81DkY7w1AdqU4I6ZuuIhWbZ4Gp2EnyZawjJiwGy2/2oosd+T+Y
 nAdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjJmsJbIYGcAdh0jeWNauimjlasm3553qfb4e51FFzdeMYuGKmhFAa0eu+IdVIIFdL66zOhEeiR1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAAOQxKqeR8pPj6qlhfDeCwZgU5JY2Kmp2E2FSTXqvjOPuCkWA
 FTCZuxW4/2o8Dt39dErgKmhnH2yK/665rdPjKgPF1x+Xdl2UGccoV/ZUpy/qKBj7bm/pK0wW5Bp
 iexupkDfMEq2NYioBWgWaWK7o3e1haMIEVOJMRXqatKIf8VTycVeYk47mwGrvEQ239aMkTfE=
X-Gm-Gg: ASbGnctrdNIWmxWl46pfcoeO1ZluGo3c52wbcnLokKpr9SQbGZRzMOHgMoslYgaGKNO
 q/9RGfErgtRPBwm6YGczbHePVXdsoXs4qQiRvsXSJAwYbut+RA7JIGXrvXBe6+WVYKTTjT1PfHL
 Oe4aj3WrmnAe5bK4LEUrdiBp9HZ9+XRLick7BgnMm9lPcfZ6RtQXxEQZ4mQne4nBY2DhNshIcsL
 eLefjiE80vmCiGOb3UK3/LiGxAYR7bhprcE/LSXtaBKPhpjpjZ6yZ0lP1EqhWHF34uFXX9TzcRS
 MA1n/1dhafq8mLIg8aOkXdbneeYj916Td8RpagPbLhjAWLpP1mynCwGgnVv8YY3T5EpeMk5yLa5
 +CxXtX4KcnG6Qzoi7kDukXhi6/o36Md1us3uLyXaJcnNJ0CZS+W89OqPlhuJpA5umwBCZEk/REK
 WK9RTysk6M5pTIFeRmlGtkFEs=
X-Received: by 2002:ad4:4ea6:0:b0:86a:7c95:126f with SMTP id
 6a1803df08f44-8847c4c7de0mr27551526d6.27.1763727418559; 
 Fri, 21 Nov 2025 04:16:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUoX/mjzI1b4o1ytqdR+jI1yLiJw/zVz9VwmNQMbCqUbuv4Gu6bPjAqN2mH2X/VzpmYNsHKQ==
X-Received: by 2002:ad4:4ea6:0:b0:86a:7c95:126f with SMTP id
 6a1803df08f44-8847c4c7de0mr27551126d6.27.1763727418121; 
 Fri, 21 Nov 2025 04:16:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37cc6a9fb2dsm10503991fa.0.2025.11.21.04.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 04:16:57 -0800 (PST)
Date: Fri, 21 Nov 2025 14:16:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <52avqc3n4fxuypv6fkejuxkmuounxa67e5lsnfeynek6yxq6tm@ink6yoklpxes>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
X-Proofpoint-GUID: Q-892dCFwmHIV_--EHDtl1u5BScCVV05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MiBTYWx0ZWRfX8Pzyp5j0rYGh
 uyJRoZEGUbpIDJ3WqzixIuwxCxcJr68O+7p0CBDV2LxEPdfzG4gJy/Up8FpKYQWIO7VrM/99guf
 Znrj1/1UG8Kw/9NmdZflT4M3xFQOqQcxypf2YCgEZHEr1A3llEh1CbT0DcSg+xJkKjqjInE2giJ
 Kk0s5gGcuNqA6lsL26fOjCHWaTVJIveRq83tbnfBVwEnwfXHAk4Wa2HOS4V4jj3TU814BUY5GIY
 efck7uIexXmTh6tcRTkZL+FQ4iepD6cOoW+9f/EhdN2bIFeWUW3Sa9FOevMelx43CjtcYVOnnDP
 v63zXoLd2RTyYIkGVitD4WSxktTE98hBphe7+g8mpxORccQUT2cf7qbvZLW9hdbyumYM5R6/gV5
 EhOFmkESbUW/v4CEa6XfVDZAext9bA==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=6920583b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=Weq4iwZbzhTgL2Q6ZfAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Q-892dCFwmHIV_--EHDtl1u5BScCVV05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210092
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

On Fri, Nov 21, 2025 at 02:02:08PM +0800, Teguh Sobirin wrote:
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
> Changes in v2:
> - Corrected commit message suggested by Dmitry Baryshkov.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
>  1 file changed, 9 insertions(+), 13 deletions(-)

Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
