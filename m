Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD955A40354
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 00:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60810E1AE;
	Fri, 21 Feb 2025 23:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t5UdMqzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87F810E19B;
 Fri, 21 Feb 2025 23:11:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF78B5C5D1A;
 Fri, 21 Feb 2025 23:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443B1C4CED6;
 Fri, 21 Feb 2025 23:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740179508;
 bh=AQoq1PHYG8aFQ1LcI2Aef/ozCgtbZVuCUR1MfPY45j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t5UdMqzLtGN/zULWN5fYMHTSUXmM4WhK6vp9903+CjUqOks/gJlBE2+LOUk58Zn35
 3G/K9pygR5yz8upm+foCC1zwRYYkkbeAvqUqXb7+Hiu3pjiybZzBtHDSk6R/K1+AdO
 bIlZUtwX0/PnAX4eunvETPj/jjdABLP963XlG1xwamfBArQPnvOkOPni0N+6lHwP23
 TJdcsXCayzQuOTjJ8/2iQWvN3jJcs1Lpoye8UE1z17Qb0n/iixsXITXR3CcVS+WfvB
 pLYdW/Kwy/rDO4dhCuHvj6ZLJoXIjD//nbv81ZBuOFS5FH+rUD9lIbPEH0wXiKrdVF
 edsatwJWy1MuA==
Date: Fri, 21 Feb 2025 17:11:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: msm: mdp4: add LCDC clock
 and PLL source
Message-ID: <174017950586.286463.3669528376090939192.robh@kernel.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-1-15afe5578a31@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-fd-mdp4-lvds-v2-1-15afe5578a31@linaro.org>
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


On Thu, 20 Feb 2025 13:14:43 +0200, Dmitry Baryshkov wrote:
> Add the LCDC / LVDS clock input and the XO used to drive internal LVDS
> PLL to MDP4 controller bindings. The controller also provides LVDS PHY
> PLL, so add optional #clock-cells to the device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/mdp4.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

