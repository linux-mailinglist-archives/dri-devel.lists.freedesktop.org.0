Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF47BAE8CE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A7210E637;
	Tue, 30 Sep 2025 20:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYaUOS+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4755310E637
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:36:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC1s3n010804
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yRYR8mKHUZFaYtXuWtiKtjrk
 y868kXbSvHpGdSOUABY=; b=aYaUOS+VDv+kxGuS0EJOBn3jZsRvgFGBxtozbsMR
 Ac9vrucmrZxwlJT/bwVES0C71Pifkfd7jEhfBwDX8PcD1l+BQYW94SrM/q2VQYFW
 DSfhw+ZrjsVgjnjN/gMX7X9pHlZBAnLC3pmHy6IGvzJ7/kW1NQ3nkMSWJJZNaB5Y
 fqwcbk6Vrrulg2sTCgxyVF1pVKVHnRxqEWiY6/V6mgv48P3LGjUP3xBoVnS0bCFE
 J/FQSPRuSa+6FvqfGXqEGpQVYAki1/LYqW1e3mKgBLGbDe3SGHhm9zt334YhoCu6
 nz5g1QtR41tllKQaQNXpN4HQjHYEMTJQgrL4TMs19jbcUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mctr5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:36:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e0e7caf22eso78931781cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759264575; x=1759869375;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRYR8mKHUZFaYtXuWtiKtjrky868kXbSvHpGdSOUABY=;
 b=DpQ1WJvRFnnqsmWL71CUEsePiadJT9shNtmh5bF594a7kt/vWyviUhylo9qLbjHmRm
 b8n/uYWS8mcpwt7/KJdUShXmRHTdj7rSe5kHOq0+VB4dVOxI/or8uADkerlp08B/Lsca
 7q4l3KJAJq9A1mjJVvTo0UfZYj48WtT+SZMyaDa1TNQNRHtxBspHVVO14A5VGciPXnrb
 Fxkzf6mX9WxneEB3d4Q5Tg4UUTqsobXDWupaOUGyKgFGeRfZvWRTRYpJ2PeKiN5bcodI
 7P3DJ//JaApSyEz5opmzxWA9asC6rD6+OecrhZAeNiWzPvjtYB4DI17U40IilJwigawM
 8PxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtENWRY+rHevjvtkRnner5c1sN9K6CCLjz06j5kRsTkaj+KCup3PC4S8NJ2bkbLCSldCf931eaxGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPtvrcaUCGv8/6Qme5qEij25Tc2oLFEB3vwz9NFy0T8WbtqwZq
 svtwT2K/tXftMBlmQeq6Al1SiDJHgbXUwOjkuXnZAnN9GQV6n95uAq0T5pxafqW/lELmRZPJChZ
 hZ7qct/wI3/w4sQcdVgQUG+5ds1d87/5zUxvLRFcmGT6VMG3FWZD0MxQptdO4yivaJuXHX0o=
X-Gm-Gg: ASbGncsI2qOYMA0Qc2c5OeTfS4DU9uJR9IX+2L13NR2npULUELR73N4goJqTP5sfXM2
 GgJO1wO8sIHwI1NG4RgvUYIWmNGLtYIhFFnqGkFf9WPnURDaNxLd3ExFLO5mOEp958/LLLCdAll
 uZsQcH9XjkM+WL1IK6Wy+icDz8DjIynVbUQiXGWVJUNAc3tf5oUUEZ0LbadS06JUzKMqWfZEH9l
 Ha+boTcjaDOhm6MBRj9ONk0eo0h5JuVvh5pZih7I12LG3L3O3ZHv9KqdcD59q3et67M/LMKcsLM
 BrUfSqzroH53qcWxri+fg2l02vodjeAFrxJMroDipRMEd12H+ET6iDjQrd0Xgs0CmU1cEa8vVw7
 MCREas2CQbODFhIPTuUyMS90Px5NyWpCK/M8zM8U/k+tALf4KZhFQV8Ux5Q==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id
 d75a77b69052e-4e41e2553a4mr14266741cf.61.1759264575278; 
 Tue, 30 Sep 2025 13:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFuPPlCXIV5zyuzMgVAJcVfckSn/45lViJoli6ItFTToo3aAOYLqDps3QFpjsl6dnCqLcS/g==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id
 d75a77b69052e-4e41e2553a4mr14266301cf.61.1759264574813; 
 Tue, 30 Sep 2025 13:36:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7710474sm34821171fa.33.2025.09.30.13.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:36:13 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:36:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 18/18] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <aeby4ds46ehzkrvc32pjcrxz2aalpc7icuis4y4zxfm5kvgcg4@ie7m7s6rcnqu>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-5-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dc3f40 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=rSdC-L6FqKhTve90478A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: hOD7KGRz9Hx0oEQNCR7oQXwQNend_-HE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX38jRXtJR96cf
 w/gdKaz1TxyTLtATpIWWTS0QKE9SYFaZxYmt+n8dRe4KBJcFHBseZ2VpmqNQVJ73GdeJLzpwyEQ
 LlprkZ7mDG/VrAaFNGTesyehzIRbJfldyleJM/t+RXwMemwuGxvQHT8svZZVO/m8tim0UtBgvt4
 buRgF/JKcqIeLGLLlvFl/TXYwaSjJ7RmZqSBcc9/bcfnwUSVsHMLNkKlH1SBg155iTn/IAVil+4
 UhIBIYlhtLWiVAvupzPIiI1DkBGjRBp7QpPYdfEueM2vdJb/eXBP47oXHbTIo9fyftnEPv43W1K
 /pUaiMQvc9icUzjzYlvzeTWXZYSsmbefNV0aGwsZf3rOTB5VfeR0cWKkcG1yy1tmEOaE4tperl7
 MaajSQoZnSHmrJtlou/UGFCHYOtrPA==
X-Proofpoint-GUID: hOD7KGRz9Hx0oEQNCR7oQXwQNend_-HE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
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

On Tue, Sep 30, 2025 at 05:42:51PM +0800, Damon Ding wrote:
> In order to unify the handling of the panel and bridge, apply
> panel_bridge helpers for Analogix DP driver. With this patch, the
> bridge support will also become available.
> 
> The following changes have ben made:
> - Apply plane_bridge helper to wrap the panel as the bridge.
> - Remove the explicit panel APIs calls, which can be replaced with
>   the automic bridge APIs calls wrapped by the panel.
> - Remove the unnecessary analogix_dp_bridge_get_modes().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
