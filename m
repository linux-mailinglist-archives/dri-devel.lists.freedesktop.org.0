Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73ACDF81E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 11:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E0610E5F8;
	Sat, 27 Dec 2025 10:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DTkHdSHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2362D10E180;
 Sat, 27 Dec 2025 10:45:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC27F408A4;
 Sat, 27 Dec 2025 10:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0884DC4CEF1;
 Sat, 27 Dec 2025 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766832327;
 bh=91/IDRS7+naE1B3qreo98hBY1XEXwd2plCFPqcbhK08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTkHdSHemrEQstc/kDpzmFCcBQm4wvgVReNbFSw9cbLaGX++MeeZiKVyDpKeXfT7I
 xCR/VjXnS7UfbiYXWIZcXC2uF8QUZsy2JAT3AEAA+kIaanYjtnT59XoldfOMjqHeQR
 f2y4xFUbOfs2Ju6pyH70zILf2pDsbiy7o/1sy1U8XRQrkYuAmcX4idflIutDIgdk4q
 M9tBl3wkXNZqlrpY3akAwZXTXOKpOPMUGMsG+4VfHhNks1FDMfsrvuvsV8CGXrHB9K
 XBEbfpNz6H2y9FEjipr8nQVol7XypztOhhroJRjE6HJevt+9+qJG5/goYCDx0xMn/F
 xDhXMUtfWHOkg==
Date: Sat, 27 Dec 2025 11:45:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <20251227-statuesque-rational-wolverine-7edacc@quoll>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-3-354d86460ccb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226-qcs615-spin-2-v5-3-354d86460ccb@oss.qualcomm.com>
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

On Fri, Dec 26, 2025 at 11:59:36PM +0530, Akhil P Oommen wrote:
> A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
> which replaces GMU. But it doesn't do clock or voltage scaling. So we
> need the gpu core clock in the GPU node along with the power domain to
> do clock and voltage scaling from the kernel. Update the bindings to
> describe this GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 33 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

