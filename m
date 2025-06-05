Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496FDACF9B1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 00:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C855110E2DC;
	Thu,  5 Jun 2025 22:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sxLY3wDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7010E162;
 Thu,  5 Jun 2025 22:32:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7FC02A4E886;
 Thu,  5 Jun 2025 22:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F06C4CEE7;
 Thu,  5 Jun 2025 22:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749162744;
 bh=bSOvzXClskVrCx7RtSl03xmNekxUy/NSjbkZTpo3POw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxLY3wDnoMyoY+nghxY1Drb7vMG7UkSP+4d80bP/S4aioa1iaTsyh5gEYDynGmaYO
 4j4m5oXsFm+7tfoMjLknS0RoqJk8OksEZv6glbMnjZzhMt/ReYihV7osGY6MgkI2Oj
 NUBuPz8xjkvM3YTffcfgddhfCxg/hOSw7axJEZ8bARn+acIpajh0tbgjX5bYaFjam6
 YuQpYzuUG91X5iFrOUUO1HXGI+KZ4NYyBHICxPBoP7v2mI8AmdYIiZyNL8P40PLbzU
 pJPgmB6nDnnfG3kgZ82jseD5dmiVA2wmFNbsForJtcS0g6rvA/Qk2hyoIrFMvkpcrY
 W++f06QKISeuA==
Date: Thu, 5 Jun 2025 17:32:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Danila Tikhonov <danila@jiaxyga.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <174916273839.3372439.12068616039739952601.robh@kernel.org>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-1-f925464d32a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-1-f925464d32a8@oss.qualcomm.com>
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


On Fri, 30 May 2025 10:47:24 -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add x1e80100 to the dp-controller bindings, fix the
> displayport-controller reg bindings, and drop
> assigned-clock-parents
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml       |  2 ++
>  .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml  | 12 +++++-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

