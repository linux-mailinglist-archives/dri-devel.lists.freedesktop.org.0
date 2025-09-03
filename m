Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AFB42CA6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591E210E28E;
	Wed,  3 Sep 2025 22:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GWOlTwZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F8410E28E;
 Wed,  3 Sep 2025 22:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0446240026;
 Wed,  3 Sep 2025 22:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1C4C4CEE7;
 Wed,  3 Sep 2025 22:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756937609;
 bh=oV2NWXl85j6kRtt65I+kwlkxl12a07d3zCpp3cY0u7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GWOlTwZ1nTSfXLuD5gd526C34LTRvNISuCXTEx6tJGQsTrY+bYTIDnBwXiBaONTFz
 Mm6Xw3oE28KZV0wQ2qEAOF4LS8+5+vnFEqbQhgnfA4vBW83Yqf5YVeK8OtTk6w9ghD
 yUetGzl+tu00FFwz2oagXV0MiKAUffyLgoSStzFGrJp/eme/5quFSWJ2dX1asSgbEW
 o3FGYkpZJJrRjpw9rxUmHrF0e4ZIxA8+IA6C27uWpy9Ds1URWBO3TCbtwMgGMtmWBi
 HsLKgXhlzQazYjJuOQqqNfG9XcFFBDTsNf/B/i11ZoeI5NMTpB6TaooCId1NdGna5h
 yDcpNVWuPsFpg==
Date: Wed, 3 Sep 2025 17:13:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Mahadevan <quic_mahap@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v8 7/9] dt-bindings: display/msm: expand to support MST
Message-ID: <175693760715.2953637.17179173729112460922.robh@kernel.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-7-7526f0311eaa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-dp_mst_bindings-v8-7-7526f0311eaa@oss.qualcomm.com>
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


On Wed, 03 Sep 2025 14:58:18 +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On a vast majority of Qualcomm chipsets DisplayPort controller can
> support several MST streams (up to 4x). To support MST these chipsets
> use up to 4 stream pixel clocks for the DisplayPort controller and
> several extra register regions. Expand corresponding region and clock
> bindings for these platforms and fix example schema files to follow
> updated bindings.
> 
> Note: On chipsets that support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 103 ++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  26 +++++-
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   3 +-
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  10 +-
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  10 +-
>  7 files changed, 150 insertions(+), 22 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

