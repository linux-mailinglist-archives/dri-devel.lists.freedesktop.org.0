Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5CA4296F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5C110E11A;
	Mon, 24 Feb 2025 17:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gOG5xWd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A946F8984C;
 Mon, 24 Feb 2025 17:22:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E9895C6FB0;
 Mon, 24 Feb 2025 17:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00CDC4CED6;
 Mon, 24 Feb 2025 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740417775;
 bh=/P+Rucaw2uTNNTVGKF3Z7fCCwDc+94TYvL/AhjRy5LY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gOG5xWd1Mcpi7R5MKHAdv5vWzW8N8j3MfWVNZsKg9HQGaYDjUmU2pdXKCagfYuOCl
 xEgdH+wtezarxqhyoTzWbdPpZXTWRIZNuMZRJstphdwTEergItmkye/l3ZkevwMWvl
 +JjVL9YOqlXv+Gm38DSRTGusBUP5jfCqTgYpBEmPSRkevooPQGTCh4PPKfvdz2Yzvu
 gAPQ/Hm4sR6qNd1ZbFdwihboh5dInnJbIJqIN+XDd3SlIDsSXjvVURcbFwPj4h/RTm
 vL0iThNH5kfVqRpIRjUH2eTqjLJZken1G4P9oDwRw2nkbwScKpUvu6UTAxkAyo5KpX
 AJvs0dJxjPwjA==
Date: Mon, 24 Feb 2025 11:22:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@chromium.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 05/21] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <174041777290.3552153.6543201724370698286.robh@kernel.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-5-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-5-3ea95b1630ea@linaro.org>
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


On Fri, 21 Feb 2025 16:24:15 +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> fully compatible with earlier SM8650 variant - both are of version
> v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
> MST for DPTX0 and 2x MST for DPTX1.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Extend commit msg
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

