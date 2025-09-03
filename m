Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6AB42C98
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C609310E29E;
	Wed,  3 Sep 2025 22:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WcKsLSx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012FB10E28E;
 Wed,  3 Sep 2025 22:12:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35E166024F;
 Wed,  3 Sep 2025 22:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1830C4CEE7;
 Wed,  3 Sep 2025 22:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756937534;
 bh=KaTnv84GnPG3OJxBa6o7jmCuAgppgtp0j7SdJLG75nM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WcKsLSx+llJx3DvpAo2w7wlwzqLU8UUZC5P+w+//y96qQ1NTfOx2/9F+QxSaViyVC
 J9XQKMo4oT+B9lkS9Qud66IFw1UiMVlhCQtBel/NSCANoCw/J/H96As31VTGAaJUrp
 cchb6zr8813vurLpQvNBwvMnflbvgMklVTaRMeGD+X/taCTGR+GuAVpU+zeE5WPCyn
 9LC3C5EV3cF8lXCyS4+SL8pKevF/hrzhsBXzBc2Fj8BpgQ9hzIZ2w/jXFWFNs1IVCw
 oE8aRbwCpUFfI51wqHhd98fH7S7agP5CvZ7Zbwug/hkmM90lkzwFUT9ejT3VZW5RN5
 TW77DQ8nY2wHA==
Date: Wed, 3 Sep 2025 17:12:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, David Airlie <airlied@gmail.com>,
 Mahadevan <quic_mahap@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v8 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
Message-ID: <175693753228.2942059.6654668767074884756.robh@kernel.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-3-7526f0311eaa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-dp_mst_bindings-v8-3-7526f0311eaa@oss.qualcomm.com>
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


On Wed, 03 Sep 2025 14:58:14 +0300, Dmitry Baryshkov wrote:
> The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
> controller as compatible with SM8350.
> 
> Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
>  Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

