Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C3ACF9B3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 00:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DF610E314;
	Thu,  5 Jun 2025 22:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GwqfEgAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CB410E314;
 Thu,  5 Jun 2025 22:33:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3EE20A4F610;
 Thu,  5 Jun 2025 22:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A251FC4CEE7;
 Thu,  5 Jun 2025 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749162781;
 bh=EiZr8n/BGt6VEah20sbpc4UIdBvd2SKgkI9EPu73p5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GwqfEgAy9QYH0rJ6lGdgxwju69/4Ue8dnzDJz3s5CdXUuPCmmNxwXa+kq6VqM5rLY
 JrE2c2qn+LifQFYb+q9yrI3lMmjSwjII56ltq7KQ0oeOmZBKXtY4ma486A+kxpVXet
 sEIXWmkarEBa5+gED2SVq/3HxZ8rP1cScbG4OaUvB8Wa54y/WRNFXNU4AmSQPs5nKq
 VKxXwtskjR7c+1VIZ+F5EVlqpfufp5t2SnACf785vdNGXrXnTfgbZMO6BkjZ7vufii
 yJGXMDu0CUDqqZ7RydPryKE3b/MjN9rgnFkONktpGEXdNkLomXixt0KDNMRhuFrPKZ
 x+d2s8cuL50bA==
Date: Thu, 5 Jun 2025 17:32:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>, freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Conor Dooley <conor+dt@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>,
 Simona Vetter <simona@ffwll.ch>, Yongxing Mou <quic_yongmou@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
Message-ID: <174916277679.3373425.11793137630921424183.robh@kernel.org>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>
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


On Fri, 30 May 2025 10:47:25 -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

