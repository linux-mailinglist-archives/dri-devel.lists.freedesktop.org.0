Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC56A3CD51
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6957410E0A6;
	Wed, 19 Feb 2025 23:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="puqaLM44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4410E09F;
 Wed, 19 Feb 2025 23:20:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1FD95C5BD8;
 Wed, 19 Feb 2025 23:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C95C4CED1;
 Wed, 19 Feb 2025 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740007208;
 bh=FjkWPKqWSxRGLZds0Xo7ynAaaD7sTQjH9kCvmrRpZCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=puqaLM4455XuIIfjXRwP6zMffumU/YGxVpAayVVnDvCsFh50siRNp0M4cZiEz7+80
 Ccar/Ld/V1s4tU8VHmQGhyJDAFx17+t/xHWVE4vw3yKkVaiiTIJ2Br+XDHoqnkFKvX
 NkmyFmevXutfezs8OZ+YZaD0PggeBXUAxEW4/t0VlO98LUKYHcoiI/AjqzsNQzApdz
 8OKBTIPrADUv/P/rHNLmR/HlrVgGc/R5Psy8ndyvGrxEbMF0PrUn/Y/H3FR1iPOMQJ
 EuO8We29rTESj+chwBeqd10BjLAU7yi2cjqb/iZGjWb+HlerOvL0eTYb05NI4i1zP2
 LmBL3DkcZNziA==
Date: Wed, 19 Feb 2025 17:20:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/16] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
Message-ID: <174000718937.3160861.6936876798495965739.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-2-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-2-d201dcdda6a4@linaro.org>
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


On Mon, 17 Feb 2025 17:41:23 +0100, Krzysztof Kozlowski wrote:
> Specific constrain in if:then: blocks for variable lists, like clocks
> and clock-names, should have a fixed upper and lower size.  Older
> dtschema implied minItems, but that's not true since 2024 and missing
> minItems means that lower bound is not set.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

