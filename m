Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468EC6D1DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DDC10E593;
	Wed, 19 Nov 2025 07:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ3MBwOr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqZKsNHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF08310E593
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:30:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ61JkK3373301
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gr6zOUWr6GHGR7NZx6vebADU
 cm/oi70IB3+o15K/5YA=; b=DZ3MBwOrkOsisKJbtpBWpE4cuLqSVsNnbxjsxHe9
 iKeW+TaKZwQYG4wwevDSv9/fQVkUOcL8//P4Rfeud2O32p2EQ13Ry0bIglK9v4pC
 G8JYGRB3aZ3k8ER4rxQjPbZa/sJqRwCB4eldss0AcpbaGkz52rvOu78gAb0GwUww
 RDehzZQ9uwwZ8FI8KyMK71GNW3d5PLMJZKmrXE+uN1q43T/SAWtgILPwUAX/X07Z
 etNnMsgE5V2aVU7LNHMdyQ9HBpNPrrNXTR0UiX9xsY2xkXBpgoWHK76gE5bnblro
 xRN1NvoAUcdWWXhOfKgeuoeQo2LJ8QBIp/EoSSbWdq9p7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agxy11qds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:30:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6e701d26so156022981cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763537413; x=1764142213;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gr6zOUWr6GHGR7NZx6vebADUcm/oi70IB3+o15K/5YA=;
 b=iqZKsNHvVhExG/oaaeVgv60lxhagOYXXrwvidPyHbGIdbgEh66mjLGblb0F4GjtfWs
 CsEjrSdeNykSW5nHRahUEwAXmRCilOEiQrqeqAYWeY2z5KyKTPY+njM+NvXUlTtRgchr
 hOQveuQHA/PXaK5wpPg/2gDfBTSbhXFfKcbLLcS/ZHOJuzI87bY0IHTXUvFAAKTv+6FX
 0moh3fnG+7GMbqPjM4qVpvLXgoUoWKWWqdULZwhhMWEYKnjOLw5yoHLRZyjlN1P2uqwq
 msY+xF24wC7uYTm0OhmpF+lbtCE9zavs0gUhNpHGkyInPonusvIclnSrjP9+J+EFhusM
 o2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763537413; x=1764142213;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gr6zOUWr6GHGR7NZx6vebADUcm/oi70IB3+o15K/5YA=;
 b=XEpZySu0blLtfIF2aFV4kxwhWvudPImBiA3E8cib8gSBqAGtCrn8UtnDCmWGMAx3Yo
 HxeHdXVa5IzzaUVkj02TNIRELzEE84BCu7GIfUgER8a2vDPb1SH3xLJS/DWP/1HrobFP
 KLM1eSS0nJcLw+C/ZFF3/4u1lgDBd10UB2yPv4P3/eSADzgNrOB9OGXjC3o+MIxhnj8S
 FD4LcKjWlZ6PmXcX3GdoAYdg0O8rAOInTDsoRTGhqou5Sf6gYgCnLGybXr75lSA9rz7H
 zejPHfejyHPYXmtYCKTHMCYqcx8xdi/JwO/3WqqL5Yj9HuCiOvtQQgKUB9zpBhcrxu90
 uZyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkgCWoOgnKMXCzKbpCsLris20CVQycdRNG8ucaZLYn+CqgRvsacxG6mvKcAGiy5Wg7pD0DUODG9PE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgtp+QrHvFobWfE6EfAnyQtCUcufD7swmcdTSk6GJ1dMRUbE2v
 D1CTH6Z5gHyXo7VdWpQipFWjm3Oml6LItCKN7ScWR17X2doMunHRKUG2dwr5RT/56oR2qHYDKpH
 77b/6Mrp4OhZKar049YqUNtelbj8d/dRksgUE0WKGbW4JEm0CnZpi+nugxidbKFftC+90sLg=
X-Gm-Gg: ASbGncugA3rheF5SBAAualGK7U+9ly8asklXVE+AgVzGJIcOLc2btmwvys/aLZcVLvk
 7FMD0JdVRCVm36UePf1EnS6ykZEIVzUXbHThW7si8PZryGpS/AYowRSUwYdhXgPmIflS/ZJu7Ko
 ToqPZ5/V3+6l+RH2sa+R7teZYYSH9ad4NDP2vPWVUbyOXQtEtfq0fsxRpII70VYAuD7+Hezekko
 svGUYcWAo6XqmTVk7mNdt/BHtMz3J3F9E5XX1Y21GrAal8PM45tVOHmNS6nrYbgn2ebmy8tvk7f
 dHRtISXKmhtRWPDGHSqBF47K9URmsKF/lna37jDGkafHOV/QLjNJ9l724qeY8ORCLO5kd6qTKmm
 xFmCdmROuAwA9SNnbb1ZrVtbx0Etfe8cd08jkbPZraE9fvswvqc5yWjvg7mRVlPiV+K3AFLO8ph
 RnUjvRO62S19Aof7UKd+zLBs8=
X-Received: by 2002:a05:622a:1805:b0:4ee:4126:661c with SMTP id
 d75a77b69052e-4ee41266803mr10122081cf.81.1763537413341; 
 Tue, 18 Nov 2025 23:30:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiHQ8A794wC8FAFVGiBeoz1a+i7y/spa5oW2exn/cbbWa1BhXSiZK4W3EMjFKRgzYgR2jmAg==
X-Received: by 2002:a05:622a:1805:b0:4ee:4126:661c with SMTP id
 d75a77b69052e-4ee41266803mr10121711cf.81.1763537412918; 
 Tue, 18 Nov 2025 23:30:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b30cfsm4512138e87.32.2025.11.18.23.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:30:12 -0800 (PST)
Date: Wed, 19 Nov 2025 09:30:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 7/8] drm/panel: sw43408: Improve wording when
 reset-gpios aren't available
Message-ID: <ye4ktw4ekpolnmbzkchdtllxpv53ftk6p5o2beld65o2ebedbz@fek4ildiq5td>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-7-317a2b400d8a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-7-317a2b400d8a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfX4ewL3XZ3bfw1
 s9y5fDS953i8wFcUsZfgec2mF8sb6poeSnKw0l2/KpTiBjbbMdWkBdSzOtjWFVTPf096S9v1h8J
 NL0qWYctssIu+TxwGEjpF6g20IaD7fFx2r+3bQEBF0PFecWh2ZUuPdomtMKXdxVF5pm2bNoOi+v
 9KpnRcfkIGpvh9a/nxnmUHRWbw7TCFwmI1MlIlHUz59MAWHLcfmFyTfMe7+pFF+kVFk6nrOQYI3
 binYxscVfokYLRTtlMs5mNzupAMr36A75J4l76DXleJuGMtRKAH3kd978jHoaVH+U9Sub35s/6W
 m737xi1juyXSughMbkyOU+frCsKSRtOYgsFVRdr7rB0CMKZJ5SIQbwVy/qOafw2vFLN4Q8Inr4c
 rz6nHg6JuZyPV3dnNGTfEwDrMwYAvQ==
X-Authority-Analysis: v=2.4 cv=Dt1bOW/+ c=1 sm=1 tr=0 ts=691d7206 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1NbFu7V7WBOcOkta9d0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: FNaQDy98PFup2FtJhKtdWA8MLih9NzI2
X-Proofpoint-ORIG-GUID: FNaQDy98PFup2FtJhKtdWA8MLih9NzI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057
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

On Tue, Nov 18, 2025 at 12:30:42PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Choose better wording.
> 
> Cosmetic: also inline PTR_ERR.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
