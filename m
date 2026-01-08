Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6DD060BB
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 21:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869DE10E7C6;
	Thu,  8 Jan 2026 20:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh4WF1uJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApYhOAHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF4F10E7C6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 20:27:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608HkKWW3166802
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 20:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JlZNx8uv9gR3y5zJqqbeRWF7
 zesbHySQ90ufr4l+JAg=; b=nh4WF1uJgplh2QVC5Fme2/O59F2XyZvb5Jl/DItk
 ryFu8mxvJ9boOg4nDhgOhRKSLvjZ/vN7PNRo15g2desaHU9sCOYWOeMLPP8azP5N
 ONS31DqUZcPy7P02VoB2nc6rHoWKr2q4IYDFWUU7ACSt0vxJG+OwSxYmdkSFFWM8
 Rd9b4rNI3+2Bg+VY2ZUmIIZeO+qPxevNTxJyve6w2W6ZEQjYLHQNnwwcgnSM//G4
 hjcu/HYqtKMlg9eLMcGqGUayItcI8+MTXYZ/HmdsnLRZB1K5QTFIJaZCdL1x8ouE
 bf42SWCeiFT3T3XVs4FZ6QNaaDrZOvX807+AfO9ls+zoMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8922dx3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 20:27:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b22d590227so459417485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767904021; x=1768508821;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
 b=ApYhOAHcAL4wI6LFwbnFDVhL0JGiL53MLsJIfj8bgjbejLwXvHddX1GylbV5nMqHNZ
 PIrsh/q8zOHDQxFjChDZTC1VLoJhIpRRwfZaRcvNtRcmr2vQa5sQhmBymZBE6Tayxv5j
 nmOKjnRHeLhk4t2pi/0HQY/ZtWyZe22ZBJenPhgW7xYRFNgTHSV+fspBP4Vw17U7xneY
 MW5RPuIzgNibMUufAR0pdsLiYH6ac/HM1JUD+VjAT1JJq/ijtp7VXVI1SssWT+UZpGn+
 6KTsmgM0Gjtj3ItKr/BSTjbFzQezDNtTRvTFT+w3upMrNOGpZdx4kmVu3gRRxM+n60K6
 2MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767904021; x=1768508821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
 b=h4+nxzog/YDRehOuj+cR+PLaGwuFAbJmGDuAQ9YNekH3UIQzFbSQvTXwb+YtJ8rHco
 JqBzuY7IR/sv+jLx2GkBDephQk62QHgDIeOs9rU3zix2COKmGxqeKznyu7+EI5WYxAkI
 S36TX/XSaS4gYU/3QFpNUlaW0k25qyVHKZAqozSML6RPgyKb+i8PGjQjtia3cCnSQ8q6
 7B2OSgaQmP+4yHDIY7DQYpaAGDmlXBYuEhLr7lq+71yxrEs5g3dF6g9mWt1uorzWOgvf
 hfI887sp2cVhToAl+T0XVqfbcv2qLb9UJbfW7Vmxim0qGyu9IG5cGNzx6hscrCFdmRha
 sgFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgMiHKY5QfYrHBJ1iq9ut6wlaHyZwn9p5H8/lRayKXOAuTrAgnuF7AenE9Vp/+CS6ESxaqSr7Aw58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCjqXICDvlGvlCm8K+VxI0FAIAzSlRYdyzh8IYX0mhQI4jP8oe
 idL2otzDHgvfzLALlnkIeBMuehKFknjizmUYrvhPyOmUjZFVOEmrp9CFhqkimfEwEogMqGRJJfj
 1oLWjpCFzgFyj0RHG9Dv7D/tcJwDDraN8Df/Yxm095YhXL0+gyff4rTByjTdLjBKVlZM4vFE=
X-Gm-Gg: AY/fxX76QaAN60OM8Q718RPbwplvPAbLbyAhgIjRiwwlx2qbhAnpcEGtT9yQGytfj9R
 BeeGE1/tAb1hbuDFcO7dG2tIdpb2AwJo33ewm4WN4nDUDZ6BQrtAugjq+E82hXA6tWS/YhSHLLQ
 ICOKN06NXJYiHaL66hdWUqvPqS+W4Sx9impjCbcgducDrHQGdGU9TipA5Jpsmzd6/fwgZhyz19V
 9RAR+IWUZJIKnb9IY0ELW5K7qKsuqJiUF6yD5UR5JukBy4LB+AWZ0JSUQVKbVPRhOv5Uky5aupu
 p7EJ78A4fQYznI59NU7XSXKwAyrtGcPov0S/ounUOh6rB0Jeu5LtCyrFX6gGv4xLi1LC8aJnIsJ
 NDEhUUHyHdzpxpVSm76P1Zo/GL4QijlHMpLveed62cAh7kypfOIFbO7sk/5WSi0LrRrMHrJGNGO
 sZAnBJ8trzAN4B6yyBBnjFrJk=
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id
 af79cd13be357-8c38936ee02mr1046211785a.32.1767904020631; 
 Thu, 08 Jan 2026 12:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+tGcr9iEka9GeEGlKoDUMtAGlIhxtlSoeNxoSYJowpomJjo9Qx3ZXWW6eqP1k6Up9bwnB6g==
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id
 af79cd13be357-8c38936ee02mr1046207485a.32.1767904020120; 
 Thu, 08 Jan 2026 12:27:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b71b7eb22sm1324479e87.41.2026.01.08.12.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 12:26:59 -0800 (PST)
Date: Thu, 8 Jan 2026 22:26:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Message-ID: <tl4a27hxop6avr25bimieet4zcoy35lvmt6rmqe74wdg6si4lk@vlm4osda5y53>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=69601315 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5j6SfgzwYxDfwc0PMj0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ghDbcFTTXcigj8cgZZWL6fdsePErkL01
X-Proofpoint-GUID: ghDbcFTTXcigj8cgZZWL6fdsePErkL01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE1MyBTYWx0ZWRfX6zoqJIjFGbHs
 YF1Z37QV7VqHBAx3UWXuP3UJWb43envfwCx/957Op2D6Qx3buYDwrMB+GRZjbaj73f3+IwPX8pR
 aDXBv3txC2qRFWAyDkLG6IeCdBgjMfuE7Jy0cPQVKDHfpbGB0rGUjwIwi4aoDSg7uxQ0keqC1c7
 8GoWDF2e/q/Gb/wwMenGBKUp5rxGtX65TKsA9aG89gP1kc3N/Dl5q+N774Gz0mzpVpBDgwacjHO
 RePm8t6Mx5TyqC9x0aAtm/QCizHe77F/vVQ6XBMvOUU+ikLCU530a9MuJSDhwMz/O5UfL2zZf5M
 umgI2os6gWY7adhhuQrcdZGACSX9X8a40IylFjENLMvbFd7FTispSegnUfhbzobF//VkLCV/boO
 //aDPHWDRLboAK+Rns9ate2soR8VEkzUZmC4apFUc+E2ZDRlDWU9woOyFrHFMZS3y7V/muF8Q0h
 d6GeEKyCRHPs9xFTb7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080153
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

On Thu, Jan 08, 2026 at 10:57:22PM +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
>  1 file changed, 1 insertions(+), 7 deletions(-)

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
