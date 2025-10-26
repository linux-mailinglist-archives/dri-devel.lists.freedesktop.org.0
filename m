Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46381C0B4D1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 22:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4009F10E243;
	Sun, 26 Oct 2025 21:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A+SY37Nd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3C10E039;
 Sun, 26 Oct 2025 21:45:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9CAA6604A6;
 Sun, 26 Oct 2025 21:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E73C4CEE7;
 Sun, 26 Oct 2025 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761515121;
 bh=2oCXk8yWmT0Rh4DSL89Lqqbb+y930NQMDgM+wHt8Qt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A+SY37NdmY8yTOMg3t4DSAkQIi+CpDzeYrHeqdy3xgeMwmbFeyUiuSOFv3g86huVn
 1TA4nX/YEE2mxAY9PclfciiHdRhVZavCqP16DAplI0CVJsQK4Var5GayqVJgaUN6W9
 lKhCxOnQsUNFNX4jShVt1yHaQTIYFlcX/Iyn9+2dciWCMx/oh+fro3SytPwPScesnn
 q1dYbSsZtmukHxchoPjapKoJ7EQiPUAhKlQ6T5Sw2wq0RwCwGaKXs/DJfnf2C5eS+O
 HZBuIwU5+1FGydsT9eRWB2ki9PKs4d0JxQ8jvKRI51Nen1JnQ7pxbvmZU2UK4uXUfk
 lcTSHBnvWrAgg==
Date: Sun, 26 Oct 2025 16:45:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for
 DAI properties
Message-ID: <176151511679.2990875.10147448365246102323.robh@kernel.org>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
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


On Tue, 21 Oct 2025 13:10:51 +0200, Krzysztof Kozlowski wrote:
> DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
> 'sound-dai-cells'.  Reference the common DAI schema to bring common
> properties for them, which allows also customizing DAI name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

