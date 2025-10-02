Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0FBB2550
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 04:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4438310E763;
	Thu,  2 Oct 2025 02:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShJwV9vW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE6A10E761
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 02:05:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbwSA005505
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 02:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YPwm+P27wbaFxyVh9NuqbEoU
 jT6f3nVsJYKSXWrzzrc=; b=ShJwV9vWy4elk87HvRrZd2nyuHihVI6HbD2aLt+E
 gIJY9rYEUa9aQKCLjOfR3FXB5hN6X/TlCxjxrvu6n6truv0CE7n9K6Mk2ddxYRaR
 TuL/KyRcQe3hkCBSbLT3dZn8oGiGXN5boPszwngQr9A5nrZ61QbI2UhlAk1vvHqG
 sZEl29FomEl3vhBbJhepR5boxOV+HTifcBgzNK5t4Lz0j+V4LkTbwMNqqCzcSWsi
 1I/s9gW2W2mvZuyZPs5YENhUJbRSiOJChjOwdQE8w9ehRcXvibHmeXy/zGokkmnV
 CSW3IzGAe1lcxo8MkVHm7NAfew7fEsdE59xBrSKcBy8RIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdp615-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 02:05:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d7f90350f3so9881331cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 19:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370700; x=1759975500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPwm+P27wbaFxyVh9NuqbEoUjT6f3nVsJYKSXWrzzrc=;
 b=U+lev11k+a/pRojKQWNuAWph1+g25l2X+C2wEyG8EVNyQz5oXTu5RhqhHwrOPl14bA
 jBA7fl2izgpEUEotF17SxFCGWn4Hs+fzgsPBk8ffbxCZChYRIFZJD6lfVRDsVwO4hc5j
 HPHIUPbd+uEZ8T0R+a9Vi05xTh2tmJvJNrMbOHRjz+7uwpU0JNbbh1q5ZiWmWoY6H9X+
 BAfjqSsp1N12/AdzFrfy790si3LkF1XSeOnstNNureythH3lZVzPyfkbqjrZMnYSWdCl
 ZvvdtbMMK9TH76VkBEk0us9rDK5EymalY3LhEO5emfZeQRS2cqZdswcboNijOluTwZS0
 9LPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFw4IJUFj+MTXNRohINQsbzeaenEsyLWDU7H7+fPZHkE5gsV88otEfceJNyI7EmxrwdCrPsvnOwS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWt47Hi7cDbT0Ae8bnO1BlTj8j71HRDyW6FdQxU7RTx/TaBY23
 tc2PCjllozCgrgchFyf8EqTltXL5TBQWHK1W7jhzFYL4CuHg91Q8Sd2nd2H6dCnxiJbUUkcu5kg
 cHrHSrJynmAMaO6jbJkMBzeYujMwJouHLGCsM/gBUPUl6KkHflXQKFFOi0cQfJK5ktr8+GdI=
X-Gm-Gg: ASbGncv7ZPn0cOmpERne+uhdV8Nv12xcTU6NA81WbMiVkfBSC/EJDaspoOyf50qp3z2
 NFR4S2l/CqrbnCvNA/TsdFK1lJ3CMTbxDLacSNvaneAiQiEz8r76+GKc2fIExGcnbODIqbZg+BM
 4GoUIG02In3/iv1+qwOP2D3qgZYl5QxlncSvHEZLXx14IhjbE9P+P4/KqRArzqcD/j0x0m0H8zD
 8Upb/Fw90pdcI3UPwzKsDNqoRNLhMOdOV/lZuAv0OruBNTD1xUBicvfwkjnW741d6GtdM8PpU3V
 uXnqnN2I8S+lQj0yl8UPh5XP2yvTw02sksXQa1wlVXchs+fY5j0VxM6P9kffIEokC63tnW06n5v
 MX7p1kbh02C1AE3rgcvXa4NFAiCePpJasQSMJyEENR4QXkM87xEDeqnEgLw==
X-Received: by 2002:a05:622a:181b:b0:4d5:eedd:688c with SMTP id
 d75a77b69052e-4e561bc382amr25329201cf.13.1759370699941; 
 Wed, 01 Oct 2025 19:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQQGDSt0rHIHFSUzcvM3T/tHBLD+F8aud41rHaI4N/HLGf0PTFbE91tgaLDaA/YTTUP68brw==
X-Received: by 2002:a05:622a:181b:b0:4d5:eedd:688c with SMTP id
 d75a77b69052e-4e561bc382amr25329051cf.13.1759370699404; 
 Wed, 01 Oct 2025 19:04:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d21csm378662e87.86.2025.10.01.19.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:04:54 -0700 (PDT)
Date: Thu, 2 Oct 2025 05:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001135914.13754-4-caojunjie650@gmail.com>
X-Proofpoint-GUID: TEyDMPK_E6rNhweeeBr5jhLedBxhu5Xf
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68ddddcd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=pJp6QwA-p1Jx72zNNcEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: TEyDMPK_E6rNhweeeBr5jhLedBxhu5Xf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX7/WO4XzxW4cw
 ZApSXjH7STGYVwKxMc9r2iMsYFlgJAMfZOrK/VMFP9lRtT00WEv3GdYfX/Bndip1rVsQKYNXYlN
 epptl3duR9Rp+iTTrSpIjAPbj23YGtS0iyptIGDIYbq3D4awOVJxKoHpUy8RcZmeVL+MofQSsiB
 fB9ekyEQcpzVJzkoX+IG9499dokfE8ntt+eLHQXFWnN6NIJGfY1/7q19BBL89HuG0rGxW8FSnEN
 UJHxZt4vfqqPbQ1jQnL1YapRo5iY27nSGIZEAXORIIoKsFYxH7MvsQRP4whL52qHWhUAuePHPoi
 KQyHM6cl8JsSko4+QYhA6d480rLt02e/3COeUwh7UP/b6A3ZNNzb3Gxa0lFikxYeyUJ1Za+vHZ+
 JCWHYiMNsgguH8GmOpB8j7wEeGjWsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> tablets.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>  4 files changed, 455 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> 
> +
> +static const struct panel_info csot_panel_info = {
> +	.width_mm = 250,
> +	.height_mm = 177,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +		      MIPI_DSI_MODE_LPM,
> +	.display_mode = csot_display_mode,
> +	.dsc_slice_per_pkt = 2,

As this is not a part of the standard, what if the DSI host doesn't
support this feature?

> +	.dsc_cfg = &csot_dsc_cfg,
> +	.init_sequence = csot_init_sequence,
> +	.is_dual_dsi = true,
> +};
> +

-- 
With best wishes
Dmitry
