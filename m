Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA720CDCB8D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD96710FE9B;
	Wed, 24 Dec 2025 15:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H87ZBlqg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHEwf/e5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C051010FE9B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:37:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO5gHXt1018224
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ahp6Ojr1T1dTzkCeHaWTBi7T
 SqRyKpSOmejJAEutSL0=; b=H87ZBlqgAWXj6rFxzzkDWk7THbA6HrG5RqoLPEB8
 0d5NHzKYbN9uWLZZ5yl92DU1m2T9e93KEsIaZAyG+u6NpWYMtTYsLoNqh3fUFGDZ
 k4MkC0Age8CGbSvXSBEJYJq+20GwJhFrW6LaA/ODMfbgrVuHA6x6CmIu/4z0tRQO
 9js2VX0nnBWiSRZvb1vCRLVy6Cd9gzpEduNcRfVIsL6z2mFkhhbVjc6WgibDlgAN
 xgp9eKDEDHO7SJeSNqlWDC4LDpAlXsdvXQU94kKDKoe5eOK9mvEPzEQSsOImu5US
 rRV4RTcDaA1O2Ktj1dYBB+8/+pgVSfQf6m5deFTKVV3ngg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsb8br-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:37:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5dbfaf0bdb6so3262314137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590638; x=1767195438;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ahp6Ojr1T1dTzkCeHaWTBi7TSqRyKpSOmejJAEutSL0=;
 b=KHEwf/e5shiCTJDRIjkCnx6VIYnnMSwfQ7eFVm14gv7rap67dBe9hYzLF8ZF0JvSqw
 hlzasLpaGEKJz9IAJNcR3J2dtQcziuezYyPcAyN8zhvFEom1kP11RaH2fFEVI3tFBZx9
 vqJS5/1fygBvaGs4i9vcvbMDVdmp0JaNYics4HSUXpblwDgVj7FAjmAvY5WJkKGfyEeX
 o8GESKopHYc9yWIgOt0YaqB81ghgEg3ZSqau/9QZaRyT1dbz3SzL3W3I3siKqzw0xzPh
 sKjYZGllXnE/tkkCfGl76kAuwKjzhiLJxNxNmnB1itSxrojqJ2qZRrWVeLZ4NRMJ1l4C
 coYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590638; x=1767195438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ahp6Ojr1T1dTzkCeHaWTBi7TSqRyKpSOmejJAEutSL0=;
 b=EErtIZ5toTO+yx6EKJ8qyvcyKeZImWhxqca7/RoYmAOTuKBELbU5Gi4nFkzaaL0Y3t
 YeVSyeoWK4gUHAHWCJqBS7pYebUkQBT9k/RRkBsrJyhB3aOi9Wo9wy87ybiR6q28OY5X
 S7wyMLSiLDbW4z90e2v/yj/sLmZt3Xj31ZKYjVFftQg5OfJkzOLVngzVZ2pPF2uXDc8p
 gv4sI8VOeh4X0qoFVtHBtjtGMFBuIm9VJSbn870VPO20QlwqqjMl5LZ2KcpI/HscVcrY
 mplMfs6Lti/XxIpAObZ2Ud6U3gc+5mlfTbwub60bNM+jNBy4bUPjz9xnCi5Hol4Yy8jr
 oORg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUilEUGyQbIW76zl2cqNgnwSfGwEHS1NLpX0+cJFVWbRTBh2ADdgCSwOH8Diq8mB5RRnmezg05pZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYUusSq0TwWzdcnGczFGBjgF215dp7HOKX3NuRQJZ11iJ7YROX
 3VMNF9gyb+etLrIc4ZIOCuukEPUebuh3+y3QpDpdJmMHStwvB1MzCNBNTCqVxNBG27TkGQNJMxG
 hGskm+BH3U53hHXaWcyxzCmBUrjpv+DM4QztbutAFYTvcEgNKq6p4bD0Ho94JCwOAkpr0zR4=
X-Gm-Gg: AY/fxX5tpS2LeTWmRNmYl+caeKpouXIHWCIgxsBeikTP1IC3p8+XOrmPySudCaqPDM0
 F7q3Nj/MSzQLh5yFDuV2NUp3wBBm0MUttAbwd45ek/7vOu9JFLVd1VF0l3CtyJvAJ65WKJYhg4z
 m2sKUPZq93bGPmjZqTKJtT+sRihUtc/gArYXcJpMPbFHk5xfo2oVHtNJlXMUav5ZLxyNX6ohFB8
 E8GYFKhejoLpzikiFalqykFEMtXTkNbRCQXHW1O1ndc1bMy1C9oR3Vsz4+gLtXSWd0c/AxlQSXu
 wfwJNRezWkPUGQtyelMT0jAlBn8rQ4rEsGCeC4sqFzFlR0e7JdsJHqOQSLXvUzoKhMdtu+qF9qW
 raVUu1GRl5MwCRiL2BMQzuz4FwuHWvY5AfqdhWfpdg9Vx+CLl+R9vLgVbAzC+oisNUtC8tv83wK
 tuSmYmve4e/Mj0djhhbtIYRFE=
X-Received: by 2002:a05:6102:3e11:b0:5d6:5e9:9e0c with SMTP id
 ada2fe7eead31-5eb1a634297mr4990667137.4.1766590638143; 
 Wed, 24 Dec 2025 07:37:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJq3Jx5CPK5Yuo8d6I+bbObGv8XhlHpPoLVOWUH6L5Yi8bjzN0AKJz+ybPigDU2WS/GbMYzQ==
X-Received: by 2002:a05:6102:3e11:b0:5d6:5e9:9e0c with SMTP id
 ada2fe7eead31-5eb1a634297mr4990664137.4.1766590637652; 
 Wed, 24 Dec 2025 07:37:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251b2b0sm46356511fa.18.2025.12.24.07.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:37:17 -0800 (PST)
Date: Wed, 24 Dec 2025 17:37:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <ob46kpwnd5maaffqesozu7fu5xqzozt5bpzdrxvxuiqfaca5z5@enazdt4gv7fn>
References: <20251224124254.17920-3-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224124254.17920-3-veyga@veygax.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfX55nw2M8LQ4tX
 +ZwPQew86vnwAoRTL52w0gLDVb3QYabNp/4+mRrk7xUkZuQYinFvFjtZExwsf6YZfXU3vph6wh9
 3/R6ZKCwNsOH/rnmYVffiKnTaMuj4tknx89zvxULljLtMr0KZ4vAsPoxz0cZob5BEpaGH0rV8PD
 mOY6WXtK3U/tTSOcKyy03NmibAGXSldkrZGqcI23MaynA1ozCjWpZtPcgyiYVlgOo6S5KhT4sbG
 XiEv17sgK2eeZlhhwUAD2L00y/ju9CajUm2nxnU7+sNEZyxnmyQ7che64qbOA1EoHjDc+PF7O8O
 a0c6ZGCtmu+nZIO+4O/TPpMHgZEs2vvnPAgco3Sr6jE/5ItnBo9mSCHDUzXUXPMkpjDHcks7G+s
 siRByMkde2UXyYyXljz4FpMkWcK/hjnoy8KRlb5Uqpym0xwLQ66J041KwddZnyZ7OgSWpV5kzGa
 /Xx5rzH11sZ4ZA9S8qQ==
X-Proofpoint-ORIG-GUID: DIeysY1NNVhRRdcUNwczuzBZjJ2NMlBA
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694c08ae cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EAWue8hiOrRKlVdnu9EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: DIeysY1NNVhRRdcUNwczuzBZjJ2NMlBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240137
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

On Wed, Dec 24, 2025 at 12:44:22PM +0000, veygax wrote:
> From: Evan Lambert <veyga@veygax.dev>
> 
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> Signed-off-by: Evan Lambert <veyga@veygax.dev>
> ---
> v2: Use real name in Signed-off-by as requested by Dmitry Baryshkov.

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
>  drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
