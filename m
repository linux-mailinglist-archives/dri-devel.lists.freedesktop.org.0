Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD160A55FAE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410CC10EAB0;
	Fri,  7 Mar 2025 04:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bbRLZx34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1972410EA82;
 Fri,  7 Mar 2025 04:56:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8B834A45469;
 Fri,  7 Mar 2025 04:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AF0C4CEE3;
 Fri,  7 Mar 2025 04:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741323378;
 bh=tV4mWJwblSpLJntlE2PRqNsAKvm8a1dUCx4Mdb4I8MU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bbRLZx34r4Xf0RNuo80VlfRPkoXv+WC20f86SFLCzc4i/kS5Qe1fPQT+1d0PPA+Kc
 y6q8KmFCnR8O2yABDI/qNHcpx60926OZslQo4TWtXr7g6nCXPRwSjsOMB0b1WbBYg+
 216ykO8QUxeL+N/lQfzgRATl2DScBmaCUnZhWsqSUFeEwcHshIdf3pg5Oh0Eg617Gg
 oT/h+2TfWGoVKTJQLpM/lsk6Y7Zpg5TMcCuQXFkQskmRVLfMDVUSmg3cSTGs4U4VsM
 GwhWshL33dRTl6DV96gjL2EqIpAzIabbzUtW5Y4vv/MzHg6Pg5epay/sXZCxwK73vX
 nRKbI7pZSIxLQ==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,
 sa8775p-mdss: Add missing eDP phy
Date: Fri,  7 Mar 2025 06:55:50 +0200
Message-Id: <174132271320.1132259.1145484645607636085.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
References: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Fri, 21 Feb 2025 16:13:11 +0100, Krzysztof Kozlowski wrote:
> The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
> in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
> missing device node in the binding and extend example to silence
> dtbs_check warnings like:
> 
>   sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sa8775p-mdss: Add missing eDP phy
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d3169ce5251b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
