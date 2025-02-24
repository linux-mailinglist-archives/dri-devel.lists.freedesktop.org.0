Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE8A42975
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDD610E33B;
	Mon, 24 Feb 2025 17:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iMt+CR2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFE48984C;
 Mon, 24 Feb 2025 17:23:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 81441611E4;
 Mon, 24 Feb 2025 17:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8C8C4CED6;
 Mon, 24 Feb 2025 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740417825;
 bh=VRzmzKwfkmV/SsmodSt2tTi4F0g1wvkHl9yIrrDB7OE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMt+CR2A9wqhSwtNmbETDqNEElQZLf2gzHZolLxoktxpkWHA7/Jmt+PpbuMGupBss
 Ia2XpnfV+lm7LE80cGoMXq5xfAkElQeNiDiryNFhuphXuOEVTSGjf9zMcPfR2C48ro
 VvdZkrD49M29bTU9BGxDun6REFI7fI2DSPupdbidZlDB9B/BSd3iQ4ojPqzMlGKHAD
 5jJibDwRQceEW4qArPFgJBD7o6FZIuWBUomcWJCSqR14sqr96Ge7CU2YWefOX7uwLf
 KzpBaPnMEw5HRQ3D1reVCZ7yB1P9N7sp/+Lyro15sGC4hVBNPayVafMSZXOoUbMUqF
 pTXqPIPQNkI7w==
Date: Mon, 24 Feb 2025 11:23:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 07/21] dt-bindings: display/msm: qcom, sm8750-mdss: Add
 SM8750
Message-ID: <174041782271.3553565.17982761584486770776.robh@kernel.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-7-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-7-3ea95b1630ea@linaro.org>
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


On Fri, 21 Feb 2025 16:24:17 +0100, Krzysztof Kozlowski wrote:
> Add MDSS/MDP display subsystem for Qualcomm SM8750 SoC, next generation
> with two revisions up of the IP block comparing to SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Properly described interconnects
> 2. Use only one compatible and contains for the sub-blocks (Rob)
> ---
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++++
>  1 file changed, 470 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

