Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E8B0C68D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90D310E2AA;
	Mon, 21 Jul 2025 14:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y4x3Q2iZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBC210E2AA;
 Mon, 21 Jul 2025 14:38:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 20959A54C7E;
 Mon, 21 Jul 2025 14:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6F8C4CEED;
 Mon, 21 Jul 2025 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753108722;
 bh=Rvu0r8kwgBxipAxQiYHn7UFFSL0RRcLSxbSDcMmsCk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y4x3Q2iZ7jBgZLWFnMQ7KoznQ+yd8/iBXZmW7dlOp2v2fOhN8IxBa2mQhqQ1D+YEq
 fjSPPj4Hc70435n9pdpKMWfnO4d6DMNFPBiUplWNay19MoO3K4vpbeO+oBeYltrzay
 TDHWDzpLwB5IxfYo57stXFmkV0bfQbo+udRi7Wiov0HblyScULYG7yPu0qdiUigdcW
 MnSkg8iWLCOwqo2sVSkmwmgBl5IwCwbQ1J46C3uGXt/9MxOof/4mgPdFLL2d7mjVH3
 JzigV2dqnJK5/3fykFefCnvac0mg0pz2elB0F+emFCnTEFDNUmdcV24Qgy1zawoi6Q
 JiGAWOREpG5GQ==
Date: Mon, 21 Jul 2025 09:38:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, Simona Vetter <simona@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>,
 cros-qcom-dts-watchers@chromium.org, Danila Tikhonov <danila@jiaxyga.com>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-clk@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
Message-ID: <175310872113.600678.8339317766064145962.robh@kernel.org>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
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


On Sat, 19 Jul 2025 12:14:45 +0300, Dmitry Baryshkov wrote:
> 
> On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> the controller). Reflect that in the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> laptops. Please include this patch into the series (either separately
> or, better, by squashing into your first patch).
> 
> ---
>  .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

