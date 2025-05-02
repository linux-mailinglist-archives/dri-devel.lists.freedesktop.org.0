Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA2AA7C57
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 00:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90810E31A;
	Fri,  2 May 2025 22:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBZRc5D4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD9E10E31A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 22:43:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAt4l015866
 for <dri-devel@lists.freedesktop.org>; Fri, 2 May 2025 22:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CN7xAI5RxauZHSlfvB2dYCQh
 k2oKQHJwg6cw+tFAgxI=; b=gBZRc5D4VtIwHTesw8c96N0We8YMT9B1/H4e/S5U
 3oYIKUD8+rjDiCJYS++0hTrSNHQW/yllkOhaeAZk/5CFoPZ4d+MT8AfjwirCgHs6
 keSX1ZnmoOhr/N229UAKoi36p9S4gALDRHCM5wf8i56AOMMRFKn3QibqUPe4liG+
 jtBYahA/Kus2Ldh89xMnaJmhQ2eGqVwNY0yf4LW4/PYI0AMLoeZuXcfoFjbi4fF5
 a9wuRCyDx0X0IZmc4yZX0XnXFyjGine1RWPxsnS5iaXVv4KoIJIedI5EEcgWJqTt
 Nf/GOisGHzNcLKCwGaqC+IhZT6Mx7orcvLEihyJfnaPuzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8hdx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 22:43:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47693206d3bso64743411cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 15:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746225810; x=1746830610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CN7xAI5RxauZHSlfvB2dYCQhk2oKQHJwg6cw+tFAgxI=;
 b=tDWnJ6PUIhRbtaDSsHXMJ+77v4hEjIWwx/hTi0PB+bHvvIKSGYsf4GsAZLn/V+8xUO
 +cPqVK+ZJEqQs8I1KUSa6JmuCVc68vFcai3TEdWawA6X9vpUF0OxIKODIcEWYsFp0GiS
 epFtZGMoXK0JOmHA1fUac8JPGciTxlClKICznQF9HJt943I+5roUswp8gd2hbDxIMmjX
 usMEsuFWrYtpOyYt1UizSGQK/ixBdsTMRj16hK64npS4+Mh/hzN5laKeUbYDCUrw9Yxr
 ppYLB/9uI7Sf0Ntn+FiwLsXSGu68RGZmcoLbKvjNF4lAvP5CvMrdrAirbB9ovTiHDrFm
 kjRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLgOcfZDwPadX2SqZVwIi7x6EebkswH3vLUjPWiISNpuRPLrB/QSUkgsVh6KyLprDvFuFDR3K6sOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo+NFOc/INGQgTWzkYeMWQM8cqZEFPcrl263Mvz4xDaUjukJbX
 Pv83BoMPmLmYn/x06WfWCnHNns1vF4arLW6Ojv72eeWmk1Irg3IiGl9fYSxfKqCWynQSikTgOMo
 gN8nymP+ixhIYCw/XGtDRnU8Pljqi7SNN0N1HRj9PRGl12uWABuBUz93GCPcLXE/vs5U=
X-Gm-Gg: ASbGncsuwnGclXa6LkNk6/alP5rLU30Tl/0nL4zWgzZMTvpR8S+y6oXTCSPqeosiJLI
 ODDatZYViizCVeJ3srfIZkP+u0ufByFCxfN8Zq2aGnXhOLiH0hWYb8SUhRtnj9rLO2IVfh3WwbW
 Ki0ydxy9aJH1yRQ7klwG7DLtwm7El32ahmgRQ49qrCMRAnddc5z4z/JvYHCHxqg1+VDCbwHHmBs
 AV+nmLExs5MTW/tBRsGDvWOMOFb6EwM0Qya/KVA4FzS2iAGcX644jeVA5wUTsBJgy4b5OWUMtxQ
 wc5bjK403yeRYgosZd4+w16l6fSTnMwM4tKvhhw1p6svGgJuSY84pPg2j79Yxe76gDTq//JLPbQ
 =
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id
 d75a77b69052e-48c31a224a3mr79130411cf.23.1746225810287; 
 Fri, 02 May 2025 15:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyDC/ycgAmMGrAX3PIpDNuTMextZpMxyJBxhg9RzguKAZ/R/C4ebf5Fg9mF7ewzlpaMNVwpg==
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id
 d75a77b69052e-48c31a224a3mr79130141cf.23.1746225809891; 
 Fri, 02 May 2025 15:43:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202a897cc6sm5072491fa.70.2025.05.02.15.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:43:29 -0700 (PDT)
Date: Sat, 3 May 2025 01:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync
 after preparing PLL
Message-ID: <b3dbtmqigdrazkhlu55r5tzo5w7ixf65m6y56nvqnaetkv6onk@xsakfzc7mmzu>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68154a93 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XEkVnyDaZeylL3GQtG4A:9
 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: efj5zvC81vCrbhcQTxIySco5ZhaJMy41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfXy1oB9ssWfJaz
 Ytmjr/DOzohyS6Yal8e+8/2skUXAFLRHVonRR12cMkVfUiH84KoAVGp1C7C8IQ1/1fh26wuFKX6
 fys+LiOjvzqD6gmeEKkzqJdTtKgSARVbyG22SNzac9e9BUFInZLKYC+MUqMdhq/fncICGsOgGM7
 Sn8G5pIdjBkiIAQ8TBH639L6h6EpBdpTVJ4Wj5/n9hu0wzJ2HSLR/ZAOsxi3jQ2p6YLFmMG8BGk
 +HD7lL1IxaxSnxH1AL1h8uJWyOho8wCgUGzA4ew5AH7FL5TDU5K39/3Xdc3Nxc9+6yAfu57sNzx
 HVm/l5suM5mmHi723FqvZdCjNz7dSe6VxqmZMzL9ab6CQzEDFowFwSW4d5Ovsny21h1iVxHjg0G
 KeyONgyH7bpN0rMsWVuDlFwppa36uCO9Qzde2T+SAobFKN0jLv3mJWOBTzlt22vKLX6rzTMJ
X-Proofpoint-ORIG-GUID: efj5zvC81vCrbhcQTxIySco5ZhaJMy41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=844 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186
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

On Wed, Apr 30, 2025 at 03:00:44PM +0200, Krzysztof Kozlowski wrote:
> According to Hardware Programming Guide for DSI PHY, the retime buffer
> resync should be done after PLL clock users (byte_clk and intf_byte_clk)
> are enabled.  Downstream also does it as part of configuring the PLL.
> 
> Driver was only turning of the resync FIFO buffer, but never bringing it
> on again.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
